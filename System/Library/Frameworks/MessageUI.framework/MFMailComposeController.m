@interface MFMailComposeController
+ (BOOL)isSetupForDeliveryAllowingRestrictedAccounts:(BOOL)a3;
+ (BOOL)isSetupForDeliveryAllowingRestrictedAccounts:(BOOL)a3 originatingBundleID:(id)a4 sourceAccountManagement:(int)a5;
+ (NSArray)menuCommands;
+ (id)preferenceForKey:(id)a3;
+ (id)signpostLog;
- (BOOL)_anyRecipientViewContainsAddress:(id)a3;
- (BOOL)_canUseOrnamentViewController;
- (BOOL)_checkWhetherForwardingAddressIsPresent;
- (BOOL)_hasCustomSignatureConfigured;
- (BOOL)_hasEncryptionIdentityError;
- (BOOL)_hasRecipients;
- (BOOL)_hasSigningIdentityError;
- (BOOL)_isActiveComposeController;
- (BOOL)_isDummyViewController;
- (BOOL)_isPopoverOrActionSheetOrAlertVisible;
- (BOOL)_isReplyOrForward;
- (BOOL)_isRestoredComposition;
- (BOOL)_isSetupForDelivery;
- (BOOL)_isTabKeyCommandInvocationPossible;
- (BOOL)_secureCompositionManagerHasRecipients;
- (BOOL)_setSendingEmailAddress:(id)a3;
- (BOOL)_setSendingEmailAddressAsHME:(id)a3;
- (BOOL)_shouldAutoSaveQuickReply;
- (BOOL)_shouldAutosaveAfterTimerFiredWithInterval:(double)a3;
- (BOOL)_shouldEnableCloseButton;
- (BOOL)_shouldEnableSMIMEMenu;
- (BOOL)_shouldEnableSendButton;
- (BOOL)_shouldPrependBlankLineForAttachments;
- (BOOL)_shouldRestoreAttachments:(id)a3;
- (BOOL)_shouldShowSendLaterOnboarding;
- (BOOL)_shouldUseMailDrop;
- (BOOL)_wantsEncryption;
- (BOOL)_wantsSigning;
- (BOOL)attachmentToMarkupIsLoaded;
- (BOOL)autosaveIsValid;
- (BOOL)bccAddressesDirtied;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)canShowAttachmentPicker;
- (BOOL)canShowContentVariationPicker;
- (BOOL)canShowFromField;
- (BOOL)canShowImageSizeField;
- (BOOL)chooseSelectedSearchResultForComposeRecipientView:(id)a3;
- (BOOL)composeRecipientViewShowingSearchResults:(id)a3;
- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContact:(id)a4 propertyKey:(id)a5 propertyIdentifier:(id)a6;
- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContactProperty:(id)a4;
- (BOOL)delayToShowMarkupHasPassed;
- (BOOL)didUseOmittedAttachmentsOrRecipients;
- (BOOL)getPrefersLargeTitles;
- (BOOL)hasActiveWritingToolsSession;
- (BOOL)hasAddedEditableHyperlink;
- (BOOL)hasAttachments;
- (BOOL)hasMessageBodyContent;
- (BOOL)hasPresentedSenderCollaborationAlert;
- (BOOL)hideMyEmailMultipleRecipient;
- (BOOL)hosted;
- (BOOL)insertingDrawing;
- (BOOL)isAddressHideMyEmail:(id)a3;
- (BOOL)isCloudKitShare;
- (BOOL)isDirty;
- (BOOL)isHideMyEmailMessage;
- (BOOL)isManagedAccount;
- (BOOL)isModal;
- (BOOL)isQuickReply;
- (BOOL)isSavingAsDraft;
- (BOOL)isShowingRecentPersonCard;
- (BOOL)isVerticallyCompact;
- (BOOL)needsDelivery;
- (BOOL)presentSearchResultsForComposeRecipientView:(id)a3;
- (BOOL)sendingAccountIsExchange;
- (BOOL)sendingEmailDirtied;
- (BOOL)shouldShowSMIMEButton;
- (BOOL)useMailDrop;
- (CGRect)_optimalRectForPresentingPopoverInComposeWebView;
- (CGRect)frameForAttachmentWithIdentifier:(id)a3;
- (CGRect)rectOfAttachment:(id)a3;
- (CNComposeRecipient)recipientPresentingCard;
- (CNComposeRecipientAtom)atomPresentingCard;
- (CNContactPickerViewController)peoplePicker;
- (CNContactViewController)contactViewController;
- (Class)_deliveryClass;
- (EFCancelable)messageLoadingTailspinCancellable;
- (EFDebouncer)inputContextHistoryInvalidationDebouncer;
- (EFFuture)originalContentMessagesFuture;
- (EFScheduler)autosaveQueue;
- (EFScheduler)originalContentMessagesScheduler;
- (EFScheduler)prepareImagesForSendScheduler;
- (EMCoreAnalyticsCollector)analyticsCollector;
- (EMMailboxObjectID)draftMailboxObjectID;
- (EMMessage)lastDraftMessage;
- (EMObjectID)originalMessageObjectID;
- (MFAttachment)previewingAttachment;
- (MFComposeDisplayMetrics)displayMetrics;
- (MFComposeStyleSelectorViewController)styleSelector;
- (MFMailAccountProxyGenerator)accountProxyGenerator;
- (MFMailComposeController)initWithCompositionContext:(id)a3 options:(unint64_t)a4;
- (MFMailComposeControllerQuickReplyActionButtonProvider)quickReplyActionButtonProvider;
- (MFMailComposeControllerQuickReplyDelegate)quickReplyDelegate;
- (MFMailComposeCoordinator)composeCoordinator;
- (MFOutgoingMessageDelivery)delivery;
- (MFPhotoPickerProgressManager)photoPickerProgressManager;
- (MFSMIMEControl)smimeStatusControl;
- (MSAutosaveSession)autosaveSession;
- (NSArray)initialMissingAttachmentWarnings;
- (NSDate)autosavedDate;
- (NSDictionary)certificatesByRecipient;
- (NSDictionary)errorsByRecipient;
- (NSDictionary)fontAttributes;
- (NSMutableSet)drawingFileAttachments;
- (NSNumber)hasCustomSignature;
- (NSString)addressForMissingIdentity;
- (NSString)autosaveIdentifier;
- (NSString)documentID;
- (NSString)hideMyEmailAddressIfExists;
- (NSString)hideMyEmailSenderAddress;
- (NSString)originatingBundleID;
- (NSString)subject;
- (QLPreviewController)previewController;
- (UIAlertController)popoverAlert;
- (UIEdgeInsets)additionalContentInsetForComposeWebView:(id)a3;
- (VNDocumentCameraViewController)documentCameraViewController;
- (_TtC9MessageUI20MessageUITipsManager)tipsManager;
- (double)previousPaletteWidth;
- (id)_addressFieldForField:(int64_t)a3;
- (id)_allRecipientViews;
- (id)_allRecipients;
- (id)_alternateTitleView;
- (id)_attachmentToMarkup;
- (id)_availableAccountProxies;
- (id)_backgroundColorForMarkupController;
- (id)_contactViewControllerForRecipient:(id)a3;
- (id)_copyMessageDataForActivityHandoff;
- (id)_copyMessagePlainTextForDonation;
- (id)_copyMessagePlainTextForDonationRemoveQuotes:(BOOL)a3;
- (id)_createSendButtonItemWithPossibleTitles:(id)a3;
- (id)_csPeopleFromAddresses:(id)a3;
- (id)_defaultAccount;
- (id)_emailAddressesWithHME;
- (id)_estimateMessageSize;
- (id)_messageForAutosave;
- (id)_messageForDraft;
- (id)_messageForRemoteDelivery;
- (id)_messageToDonate;
- (id)_messageWithCompositionSpecification:(id)a3 useSuspendInfo:(BOOL)a4 endingEditing:(BOOL)a5;
- (id)_missingIdentityErrorWithFormat:(id)a3 title:(id)a4;
- (id)_nextDrawingName;
- (id)_originalContentMessagesIfExists;
- (id)_originalContentOfMessagesInReplyToMessage:(id)a3;
- (id)_originalMessageCategorySubtype;
- (id)_outgoingMessageWithSubstituteDocument:(id)a3 compositionSpecification:(id)a4 useSuspendInfo:(BOOL)a5 endingEditing:(BOOL)a6;
- (id)_recipientsFromRecipientTextView:(uint64_t)a1;
- (id)_reformattedAddressAtIndex:(unint64_t)a3;
- (id)_selectedAttachmentURLs;
- (id)_senderEmailAddress;
- (id)_sheetDetentForIdentifier:(id)a3 viewController:(id)a4;
- (id)addressesForField:(int64_t)a3;
- (id)allRecipientNamesAndAddresses;
- (id)attachments;
- (id)bccRecipients;
- (id)ccRecipients;
- (id)composeRecipientView:(id)a3 composeRecipientForAddress:(id)a4;
- (id)composeRecipientView:(id)a3 composeRecipientForContact:(id)a4;
- (id)composeWebView;
- (id)compositionContext;
- (id)contentVariationName;
- (id)csPeopleForField:(int64_t)a3;
- (id)currentScaleImageSize;
- (id)delegate;
- (id)didSaveQuickReplyDraftHandler;
- (id)dismissActionsForPreviewController:(id)a3;
- (id)emailAddresses;
- (id)inputContextHistory;
- (id)keyCommands;
- (id)mailComposeView;
- (id)navigationBarTitle;
- (id)navigationControllerForRecentPersonCard;
- (id)nextResponderForRecipientView:(id)a3;
- (id)popoverManager;
- (id)popoverManagerCreateIfNeeded:(BOOL)a3;
- (id)presentingViewControllerForComposeStyleSelector:(id)a3;
- (id)presentingViewControllerForPhotoPicker:(id)a3;
- (id)remoteViewControllerProxy;
- (id)rotatingHeaderView;
- (id)savedHeaders;
- (id)sendButtonItem;
- (id)sendLaterMenu;
- (id)sendingAccountProxy;
- (id)sendingAddressForControl:(id)a3;
- (id)sendingEmailAddress;
- (id)sendingEmailAddressIfExists;
- (id)shouldCreateRichTextRepresentation;
- (id)smartReplyThreadIdentifier;
- (id)toRecipients;
- (int)sourceAccountManagement;
- (int64_t)_fieldForAddressField:(id)a3;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (int64_t)composeType;
- (int64_t)compositionType;
- (int64_t)countofDrawingAttachmentsLeftInCompose;
- (int64_t)currentlyLoadingCounter;
- (int64_t)popoverPresentationStyleForViewController:(id)a3;
- (int64_t)previewController:(id)a3 editingModeForPreviewItem:(id)a4;
- (int64_t)resolution;
- (unint64_t)_composeWebViewTextContentLength;
- (unint64_t)_defaultAtomPresentationOptions;
- (unint64_t)_reloadNumberOfReformattedAddressesWithMaximumWidth:(double)a3 defaultFontSize:(double)a4;
- (unint64_t)_sizeForScale:(unint64_t)a3 imagesOnly:(BOOL)a4;
- (unint64_t)contentVariationIndex;
- (unint64_t)markupReplyAttachmentLoadingProgress;
- (unint64_t)presentationOptionsForRecipient:(id)a3;
- (unint64_t)signpostID;
- (unint64_t)smimeStatusOptionsForControl:(id)a3;
- (void)_accountsChanged:(id)a3;
- (void)_attachmentLoaderFinishedWithOriginalContent:(id)a3;
- (void)_autosaveTimerFired:(id)a3;
- (void)_bodyTextChanged;
- (void)_checkForCanSendMailWithContinuation:(id)a3;
- (void)_checkForEmptySubjectWithContinuation:(id)a3;
- (void)_checkForInFlightAssetDownloadsWithContinuation:(id)a3;
- (void)_checkForInvalidAddressesWithContinuation:(id)a3;
- (void)_checkForOmittedRecipientsOrAttachmentsIfNeededWithContinuation:(id)a3;
- (void)_checkForReplyAndForwardRestriction;
- (void)_checkForSendLaterDisclaimerWithContinuation:(id)a3;
- (void)_checkForShareParticipantsWithContinuation:(id)a3;
- (void)_checkForUnencryptedWithContinuation:(id)a3;
- (void)_clearMessageValues;
- (void)_composeViewDidDraw:(id)a3;
- (void)_configureSender:(id)a3 asSourceForPopoverPresentationController:(id)a4;
- (void)_createAndAddHandoffProgressViewIfNecessary;
- (void)_deleteFileAtURLIfInTmp:(id)a3;
- (void)_didDismissDocumentPicker;
- (void)_dismissAndCleanupCameraPickerController;
- (void)_dismissPeoplePicker:(id)a3;
- (void)_dismissPersonCard;
- (void)_dismissPresentedHalfSheet;
- (void)_dismissPresentedViewController;
- (void)_displayMetricsDidChange;
- (void)_displayPopoverAlert:(id)a3;
- (void)_documentCameraViewControllerDidFinish;
- (void)_draftContentDidChange;
- (void)_escapeShortcutInvoked:(id)a3;
- (void)_explainAirplaneMode;
- (void)_finishModalAlertClosingComposition:(BOOL)a3;
- (void)_finishedComposing;
- (void)_finishedLoadingAllContentAndAttachments;
- (void)_focusBccHeaderCommandInvoked:(id)a3;
- (void)_focusGained:(id)a3;
- (void)_getHMEEmailFromOriginalAddress:(id)a3;
- (void)_getRotationContentSettings:(id *)a3;
- (void)_hideHandoffProgressViewAnimated:(BOOL)a3;
- (void)_insertDrawingFromExternalURL:(uint64_t)a1;
- (void)_invalidateInputContextHistory;
- (void)_invalidateInputContextHistoryDebounced:(BOOL)a3;
- (void)_leaveMessageInOutbox;
- (void)_loadAttachments;
- (void)_loadCompositionContext;
- (void)_loadingContextDidLoadMessage;
- (void)_makeComposeUserActivityCurrent;
- (void)_performBlockWithStrongComposeCoordinator:(id)a3;
- (void)_performDeferredActionIfNecessary;
- (void)_physicallyScaleImagesToScale:(unint64_t)a3 attachments:(id)a4;
- (void)_popoverWillBePresented:(id)a3;
- (void)_prepareCompositionContextForLoading:(id)a3;
- (void)_prepareForSuspend;
- (void)_prepareHMEAddressesWithContinuation:(id)a3;
- (void)_prepareImagesForSendWithContinuation:(id)a3;
- (void)_preparePhotoPicker;
- (void)_presentLinkEditorWithName:(id)a3 text:(id)a4 mode:(unint64_t)a5 completion:(id)a6;
- (void)_presentModalAlert:(id)a3;
- (void)_presentSenderCollaborationAlertIfNecessaryForSendingAddress:(id)a3;
- (void)_presentWarnings:(id)a3 index:(unint64_t)a4 suggestionsService:(id)a5 completionHandler:(id)a6;
- (void)_promptForMailDropIfNecessaryWithContinuation:(id)a3;
- (void)_recipientTextChanged:(id)a3;
- (void)_recipientTextChangedForHME;
- (void)_removeAutoBccSendingAddress:(id)a3;
- (void)_removeRecent;
- (void)_replaceAttachment:(void *)a3 withDocumentAtURL:(void *)a4 completion:;
- (void)_replyAllCommandInvoked:(id)a3;
- (void)_replyCommandInvoked:(id)a3;
- (void)_reportUserEnagagement:(BOOL)a3 suggestionService:(id)a4 warning:(id)a5;
- (void)_resetProxyGenerator;
- (void)_resetSecureCompositionManager;
- (void)_resetSecureCompositionManagerUsingNewAccount:(BOOL)a3;
- (void)_restoreMessageValues;
- (void)_retainFocusOfComposeWebViewIfRequired:(id)a3;
- (void)_saveMessageValues;
- (void)_scaleImages;
- (void)_sendAnalyticsSignalForResult:(int64_t)a3;
- (void)_sendViewVisibilityNotification:(id)a3 window:(id)a4;
- (void)_setAutosaveIsValid:(BOOL)a3;
- (void)_setBodyAndSignatureWithCoordinator:(id)a3 htmlDataObjectWithSignature:(id)a4 htmlDataObject:(id)a5;
- (void)_setInitialStateForImageField;
- (void)_setIsLoading:(BOOL)a3;
- (void)_setLastFocusedRecipientView:(id)a3;
- (void)_setRecipients:(id)a3 forField:(int64_t)a4;
- (void)_setTitleBarSubtitleText:(id)a3 style:(unint64_t)a4;
- (void)_setUpDeliveryObject:(unint64_t)a3 completionHandler:(id)a4;
- (void)_setUpDraftForHME;
- (void)_setupForAutosavedMessage:(id)a3;
- (void)_setupForDraft:(id)a3;
- (void)_setupForExistingNewMessage:(id)a3 content:(id)a4;
- (void)_setupForOutbox:(id)a3;
- (void)_setupForQuickReply;
- (void)_setupLargeTitleAccessory;
- (void)_setupNavigationBarItems;
- (void)_setupSendLaterOnboardingPaletteIfNecessary;
- (void)_showCamera:(id)a3;
- (void)_showMissingIdentityAlert;
- (void)_showOriginalAttachmentsIfNecessary:(id)a3;
- (void)_showPersonCardForRecipient:(id)a3 showDeleteButton:(BOOL)a4;
- (void)_showPhotoPicker:(id)a3;
- (void)_showSystemPhotoPicker:(id)a3;
- (void)_startAutosaveTimerIfNeeded;
- (void)_subjectTextChanged:(id)a3;
- (void)_tabKeyCommandInvoked:(id)a3;
- (void)_unscaleImages;
- (void)_updateAndStartCompletingCcFieldWithMissingRecipients:(id)a3;
- (void)_updateAutoBccSendingAddress:(id)a3 withNewSendingAddress:(id)a4;
- (void)_updateAutoBccSendingAddress:(id)a3 withNewSendingAddress:(id)a4 alwaysAdd:(BOOL)a5;
- (void)_updateAutosaveSession;
- (void)_updateIdentityStatus:(int64_t *)a3 withPolicy:(int64_t)a4 identity:(__SecIdentity *)a5 error:(id)a6;
- (void)_updateImageSizeTitles;
- (void)_updateManagedPasteboardOwner;
- (void)_updateNavigationBarTitleAnimated:(BOOL)a3;
- (void)_updateOriginalBccStatusForRestore;
- (void)_updateOriginalBccStatusForRestoreAddingAddress:(BOOL)a3;
- (void)_updatePersonCard;
- (void)_updateRecipientAtomStyles;
- (void)_updateSMIMEButtonEnabledForRecipientCount;
- (void)_updateSMIMEButtonForEncryptionStatus:(int64_t)a3;
- (void)_updateSMIMEStatusControl;
- (void)_updateSendAndCloseButtonTintColor;
- (void)_updateSendAndCloseEnabled;
- (void)_updateTitleBarForEncryptionStatus:(int64_t)a3;
- (void)_willPresentDocumentPicker;
- (void)activityHandoffOperation:(id)a3 didFailWithError:(id)a4;
- (void)activityHandoffOperation:(id)a3 didFinishReceivingData:(id)a4;
- (void)activityHandoffOperation:(id)a3 didFinishSendingDataWithResult:(int64_t)a4;
- (void)activityHandoffOperationReceivedBytes:(id)a3;
- (void)addAddress:(id)a3 field:(int64_t)a4;
- (void)addLink:(id)a3;
- (void)addSignature:(BOOL)a3;
- (void)applicationDidResume;
- (void)applicationWillSuspend;
- (void)autocompleteGroupDetailViewController:(id)a3 didAskToRemoveGroup:(id)a4;
- (void)autocompleteGroupDetailViewController:(id)a3 didTapComposeRecipient:(id)a4;
- (void)autocompleteGroupDetailViewControllerDidCancel:(id)a3;
- (void)autosaveIfNecessaryWithHandler:(id)a3;
- (void)autosaveWithHandler:(id)a3;
- (void)backUpDraft;
- (void)changeQuoteLevel:(int64_t)a3;
- (void)clearAllFields;
- (void)clearInitialTitle;
- (void)close;
- (void)close:(id)a3;
- (void)composeHeaderView:(id)a3 didChangeSize:(CGSize)a4;
- (void)composeHeaderViewDidChangeValue:(id)a3;
- (void)composeHeaderViewDidConfirmValue:(id)a3;
- (void)composeRecipientView:(id)a3 didAddRecipient:(id)a4;
- (void)composeRecipientView:(id)a3 didFinishEnteringAddress:(id)a4;
- (void)composeRecipientView:(id)a3 didRemoveRecipient:(id)a4;
- (void)composeRecipientView:(id)a3 didReplaceRecipients:(id)a4 withRecipients:(id)a5;
- (void)composeRecipientView:(id)a3 didSelectRecipients:(id)a4;
- (void)composeRecipientView:(id)a3 disambiguateRecipientForAtom:(id)a4;
- (void)composeRecipientView:(id)a3 showPersonCardForAtom:(id)a4;
- (void)composeRecipientView:(id)a3 showPersonCardForRecipient:(id)a4;
- (void)composeRecipientView:(id)a3 textDidChange:(id)a4;
- (void)composeRecipientViewDidBecomeFirstResponder:(id)a3;
- (void)composeRecipientViewDidFinishPickingRecipient:(id)a3;
- (void)composeRecipientViewRequestAddRecipient:(id)a3;
- (void)composeRecipientViewReturnPressed:(id)a3;
- (void)composeStyleSelector:(id)a3 didChangeFont:(id)a4;
- (void)composeStyleSelector:(id)a3 didChangeFontSize:(double)a4;
- (void)composeStyleSelector:(id)a3 didChangeTextColor:(id)a4;
- (void)composeStyleSelector:(id)a3 didSelectStyle:(id)a4;
- (void)composeStyleSelectorDidCancel:(id)a3;
- (void)composeStyleSelectorDidDismissFontPicker:(id)a3;
- (void)composeStyleSelectorDidPresentColorPicker:(id)a3;
- (void)composeSubjectViewTextFieldDidBecomeFirstResponder:(id)a3;
- (void)composeSubjectViewTextFieldDidResignFirstResponder:(id)a3;
- (void)composeSubjectViewWillRemoveContent:(id)a3;
- (void)composeWebView:(id)a3 composeBodyIsEmpty:(BOOL)a4;
- (void)composeWebView:(id)a3 didChangeHeight:(double)a4;
- (void)composeWebView:(id)a3 hasActiveWritingToolsSession:(BOOL)a4;
- (void)composeWebViewDidChangeFontAttributes:(id)a3;
- (void)contactPicker:(id)a3 didSelectContact:(id)a4;
- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4;
- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4;
- (void)contactViewController:(id)a3 didDeleteContact:(id)a4;
- (void)contentDidChange;
- (void)datePickerViewController:(id)a3 didSelectDate:(id)a4;
- (void)dealloc;
- (void)deliverMessageRemotely:(id)a3;
- (void)didBecomeActiveComposeController;
- (void)didCreateAttachment:(id)a3;
- (void)didInsertAttachment:(id)a3;
- (void)didInsertBodyText:(id)a3;
- (void)didRotateFromInterfaceOrientation:(int64_t)a3;
- (void)dismissSearchResultsForComposeRecipientView:(id)a3;
- (void)dismissSheet;
- (void)documentCameraViewController:(id)a3 didFinishWithScan:(id)a4;
- (void)documentCameraViewControllerDidCancel:(id)a3;
- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4;
- (void)documentPickerWasCancelled:(id)a3;
- (void)editLink:(id)a3 completion:(id)a4;
- (void)editTextDescription:(id)a3 completion:(id)a4;
- (void)expandQuickReplyToFullCompose;
- (void)expandQuickReplyToFullComposeAndPerformAction:(int64_t)a3 additionalUserInfo:(id)a4;
- (void)finalizeSignature:(id)a3;
- (void)finishEnteringRecipients;
- (void)finishPopoverAlertClosingComposition:(BOOL)a3;
- (void)finishedBackingUpDraftWithSuccess:(BOOL)a3;
- (void)goToSettingsForControl:(id)a3;
- (void)handleLargeMessageComposeHandoffWithInputStream:(id)a3 outputStream:(id)a4 error:(id)a5;
- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4;
- (void)imagePickerControllerDidCancel:(id)a3;
- (void)imageSizeView:(id)a3 changedSelectedScaleTo:(unint64_t)a4;
- (void)importDocument;
- (void)insertDrawing;
- (void)insertPhotoOrVideo;
- (void)insertPhotoOrVideoWithAssetIdentifier:(id)a3 info:(id)a4;
- (void)loadView;
- (void)mailCompositionContext:(id)a3 messageDidChange:(id)a4;
- (void)markupAttachment:(id)a3;
- (void)performSend;
- (void)photoPicker:(id)a3 didDeselectAssetWithIdentifier:(id)a4;
- (void)photoPicker:(id)a3 didSelectAssetWithIdentifier:(id)a4 mediaInfo:(id)a5;
- (void)photoPickerController:(id)a3 didAddItem:(id)a4;
- (void)photoPickerController:(id)a3 didRemoveAsset:(id)a4;
- (void)photoPickerControllerDidCancel:(id)a3;
- (void)photoPickerDidCancel:(id)a3;
- (void)photoPickerDidCancelSystemImagePicker:(id)a3;
- (void)pickInitialFirstResponder;
- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5;
- (void)presentSaveDeleteDialogOrClose;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)previewController:(id)a3 didSaveEditedCopyOfPreviewItem:(id)a4 atURL:(id)a5;
- (void)previewControllerDidDismiss:(id)a3;
- (void)recipientViewDidBecomeFirstResponder:(id)a3;
- (void)recipientViewDidResignFirstResponder:(id)a3;
- (void)removeAddress:(id)a3 field:(int64_t)a4;
- (void)removeSignature;
- (void)saveAndResignFirstResponder;
- (void)saveFirstResponder;
- (void)scanDocument;
- (void)secureMIMECompositionManager:(id)a3 encryptionStatusDidChange:(int64_t)a4 context:(id)a5;
- (void)secureMIMECompositionManager:(id)a3 signingStatusDidChange:(int64_t)a4 context:(id)a5;
- (void)securityScopeForURL:(id)a3 withHandler:(id)a4;
- (void)selectNextSearchResultForComposeRecipientView:(id)a3;
- (void)selectPreviousSearchResultForComposeRecipientView:(id)a3;
- (void)sendMessage:(unint64_t)a3;
- (void)serializedPlaceholderForFileName:(id)a3 fileSize:(int64_t)a4 mimeType:(id)a5 contentID:(id)a6 withHandler:(id)a7;
- (void)setAccountProxyGenerator:(id)a3;
- (void)setAddressForMissingIdentity:(id)a3;
- (void)setAddresses:(id)a3 field:(int64_t)a4;
- (void)setAtomPresentingCard:(id)a3;
- (void)setAttachmentToMarkupIsLoaded:(BOOL)a3;
- (void)setAutosaveIdentifier:(id)a3;
- (void)setAutosaveIsValid:(BOOL)a3;
- (void)setAutosaveQueue:(id)a3;
- (void)setAutosaveSession:(id)a3;
- (void)setBccRecipients:(id)a3;
- (void)setCaretPosition:(unint64_t)a3;
- (void)setCcRecipients:(id)a3;
- (void)setCertificatesByRecipient:(id)a3;
- (void)setComposeCoordinator:(id)a3;
- (void)setCompositionContext:(id)a3;
- (void)setContactViewController:(id)a3;
- (void)setContentVisible:(BOOL)a3;
- (void)setCurrentlyLoadingCounter:(int64_t)a3;
- (void)setDelayToShowMarkupHasPassed:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDidSaveQuickReplyDraftHandler:(id)a3;
- (void)setDidUseOmittedAttachmentsOrRecipients:(BOOL)a3;
- (void)setDisplayMetrics:(id)a3;
- (void)setDocumentCameraViewController:(id)a3;
- (void)setDraftMessage:(id)a3;
- (void)setDrawingFileAttachments:(id)a3;
- (void)setErrorsByRecipient:(id)a3;
- (void)setFontAttributes:(id)a3;
- (void)setHasActiveWritingToolsSession:(BOOL)a3;
- (void)setHasAddedEditableHyperlink:(BOOL)a3;
- (void)setHasCustomSignature:(id)a3;
- (void)setHasMessageBodyContent:(BOOL)a3;
- (void)setHasPresentedSenderCollaborationAlert:(BOOL)a3;
- (void)setHeadersForDraft;
- (void)setHideMyEmailAddressForMailToURLAddressString:(id)a3;
- (void)setHideMyEmailAddressIfExists:(id)a3;
- (void)setHideMyEmailMultipleRecipient:(BOOL)a3;
- (void)setHideMyEmailSenderAddress:(id)a3;
- (void)setHosted:(BOOL)a3;
- (void)setInitialMissingAttachmentWarnings:(id)a3;
- (void)setInitialTitle:(id)a3;
- (void)setInputContextHistoryInvalidationDebouncer:(id)a3;
- (void)setInsertingDrawing:(BOOL)a3;
- (void)setIsDirty:(BOOL)a3;
- (void)setIsModal:(BOOL)a3;
- (void)setIsQuickReply:(BOOL)a3;
- (void)setMarkupReplyAttachmentLoadingProgress:(unint64_t)a3;
- (void)setMessageLoadingTailspinCancellable:(id)a3;
- (void)setOriginalContentMessagesFuture:(id)a3;
- (void)setOriginalContentMessagesScheduler:(id)a3;
- (void)setOriginalMessageWasEncrypted:(BOOL)a3;
- (void)setOriginatingBundleID:(id)a3;
- (void)setPeoplePicker:(id)a3;
- (void)setPhotoPickerProgressManager:(id)a3;
- (void)setPopoverAlert:(id)a3;
- (void)setPrefersLargeTitles:(BOOL)a3;
- (void)setPreviewController:(id)a3;
- (void)setPreviewingAttachment:(id)a3;
- (void)setPreviousPaletteWidth:(double)a3;
- (void)setProgressUIVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)setQuickReplyActionButtonProvider:(id)a3;
- (void)setQuickReplyDelegate:(id)a3;
- (void)setRecipientPresentingCard:(id)a3;
- (void)setRecipientsKeyboardType:(int64_t)a3;
- (void)setRemoteViewControllerProxy:(id)a3;
- (void)setResolution:(int64_t)a3;
- (void)setSavedHeaders:(id)a3;
- (void)setSendingEmailAddress:(id)a3;
- (void)setSendingEmailAddressAsHME:(id)a3 isComposeTypeReply:(BOOL)a4;
- (void)setSmimeStatusControl:(id)a3;
- (void)setSourceAccountManagement:(int)a3;
- (void)setStyleSelector:(id)a3;
- (void)setSubject:(id)a3;
- (void)setTipsManager:(id)a3;
- (void)setToRecipients:(id)a3;
- (void)setUpForSaveAsDraft;
- (void)setUseMailDrop:(BOOL)a3;
- (void)showMissingAttachmentDataAlert;
- (void)showPhotoPickerWithSourceType:(int64_t)a3 fromSource:(id)a4;
- (void)showStyleSelector:(id)a3;
- (void)stripCustomBodyIdentifiers;
- (void)takeFocusFromComposeWebView:(id)a3 inDirection:(unint64_t)a4;
- (void)takeSnapshotWithCompletionHandler:(id)a3;
- (void)tappedSMIMEButton;
- (void)toggleEncryptionForControl:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateSignature;
- (void)updateUserActivityState:(id)a3;
- (void)userActivity:(id)a3 didReceiveInputStream:(id)a4 outputStream:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewDidUnload;
- (void)viewLayoutMarginsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillUnload;
- (void)willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4;
@end

@implementation MFMailComposeController

+ (NSArray)menuCommands
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)menuCommands_commands_0;
  if (!menuCommands_commands_0)
  {
    v3 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"w" modifierFlags:0x100000 action:sel_close_];
    v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v5 = [v4 localizedStringForKey:@"CANCEL" value:&stru_1F0817A00 table:@"Main"];
    [v3 setDiscoverabilityTitle:v5];

    v6 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"b" modifierFlags:1572864 action:sel__focusBccHeaderCommandInvoked_];
    v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v8 = [v7 localizedStringForKey:@"FOCUS_BCC" value:&stru_1F0817A00 table:@"Main"];
    [v6 setDiscoverabilityTitle:v8];

    v9 = +[MFMailMenuCommand shortcutWithCommand:v3 menu:4];
    v14[0] = v9;
    v10 = +[MFMailMenuCommand shortcutWithCommand:v6 menu:7];
    v14[1] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
    v12 = (void *)menuCommands_commands_0;
    menuCommands_commands_0 = v11;

    v2 = (void *)menuCommands_commands_0;
  }

  return (NSArray *)v2;
}

+ (id)signpostLog
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__MFMailComposeController_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_0 != -1) {
    dispatch_once(&signpostLog_onceToken_0, block);
  }
  v2 = (void *)signpostLog_log_0;

  return v2;
}

void __38__MFMailComposeController_signpostLog__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email.signposts", (const char *)[v3 UTF8String]);
  v2 = (void *)signpostLog_log_0;
  signpostLog_log_0 = (uint64_t)v1;
}

- (unint64_t)signpostID
{
  id v3 = [(id)objc_opt_class() signpostLog];
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

- (MFMailComposeController)initWithCompositionContext:(id)a3 options:(unint64_t)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v39.receiver = self;
  v39.super_class = (Class)MFMailComposeController;
  v8 = [(MFMailComposeController *)&v39 initWithNibName:0 bundle:0];
  v9 = v8;
  if (v8)
  {
    v8->_resolution = 0;
    v10 = MFComposeLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [NSNumber numberWithInteger:v9->_resolution];
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v11;
      _os_log_impl(&dword_1AF945000, v10, OS_LOG_TYPE_DEFAULT, "_resolution is set to %@ as MFMailComposeController is initialized.", buf, 0xCu);
    }
    v9->_sendingEmailAddressIndex = 0x7FFFFFFFFFFFFFFFLL;
    v9->_selectedContentVariationIndex = 0x7FFFFFFFFFFFFFFFLL;
    v9->_allowRestrictedAccounts = (a4 & 2) == 0;
    v12 = [[MFMailAccountProxyGenerator alloc] initWithAllowsRestrictedAccounts:v9->_allowRestrictedAccounts];
    accountProxyGenerator = v9->_accountProxyGenerator;
    v9->_accountProxyGenerator = v12;

    objc_storeStrong((id *)&v9->_compositionContext, a3);
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F734E8]) initWithName:@"MFMailComposeController_autosaveLock" andDelegate:0];
    autosaveLock = v9->_autosaveLock;
    v9->_autosaveLock = (MFLock *)v14;

    v9->_autosaveIsValid = 1;
    v9->_sourceAccountManagement = [v7 sourceAccountManagement];
    v16 = objc_alloc_init(MFMailSignatureController);
    signatureController = v9->_signatureController;
    v9->_signatureController = v16;

    v18 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    securityScopes = v9->_securityScopes;
    v9->_securityScopes = v18;

    v9->_options = a4;
    v9->_hideMyEmailMultipleRecipient = 0;
    v20 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    drawingFileAttachments = v9->_drawingFileAttachments;
    v9->_drawingFileAttachments = v20;

    [(MFMailComposeController *)v9 setHosted:MFIsMobileMail() ^ 1];
    v9->_contentVisible = 1;
    v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v22 addObserver:v9 selector:sel__accountsChanged_ name:@"MFMailComposeControllerShouldReloadAccounts" object:0];

    uint64_t v23 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.mobilemail.autosave" qualityOfService:17];
    autosaveQueue = v9->_autosaveQueue;
    v9->_autosaveQueue = (EFScheduler *)v23;

    uint64_t v25 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.prepareImagesForSend" qualityOfService:25];
    prepareImagesForSendScheduler = v9->_prepareImagesForSendScheduler;
    v9->_prepareImagesForSendScheduler = (EFScheduler *)v25;

    uint64_t v27 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.mobilemail.originalContentMessagesScheduler" qualityOfService:25];
    originalContentMessagesScheduler = v9->_originalContentMessagesScheduler;
    v9->_originalContentMessagesScheduler = (EFScheduler *)v27;

    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, v9);
    id v29 = objc_alloc(MEMORY[0x1E4F60D50]);
    v30 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __62__MFMailComposeController_initWithCompositionContext_options___block_invoke;
    v37[3] = &unk_1E5F7B290;
    objc_copyWeak(&v38, (id *)buf);
    uint64_t v31 = [v29 initWithTimeInterval:v30 scheduler:1 startAfter:v37 block:0.25];
    inputContextHistoryInvalidationDebouncer = v9->_inputContextHistoryInvalidationDebouncer;
    v9->_inputContextHistoryInvalidationDebouncer = (EFDebouncer *)v31;

    v33 = [(MFMailComposeController *)v9 mailComposeView];
    [v33 setSending:0];

    v34 = (EMCoreAnalyticsCollector *)objc_alloc_init(MEMORY[0x1E4F60258]);
    analyticsCollector = v9->_analyticsCollector;
    v9->_analyticsCollector = v34;

    objc_destroyWeak(&v38);
    objc_destroyWeak((id *)buf);
  }

  return v9;
}

void __62__MFMailComposeController_initWithCompositionContext_options___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    [WeakRetained _invalidateInputContextHistoryDebounced:0];
  }
}

- (void)dealloc
{
  id v3 = [(MFMailComposeController *)self messageLoadingTailspinCancellable];
  [v3 cancel];

  [(MFMailComposeController *)self setMessageLoadingTailspinCancellable:0];
  os_signpost_id_t v4 = [(MFMailComposeController *)self userActivity];
  [v4 setDelegate:0];

  v5 = [(MFMailComposeController *)self userActivity];
  [v5 invalidate];

  [(MFMailComposeController *)self setUserActivity:0];
  v6 = [(MFMailComposeController *)self mailComposeView];
  [v6 setComposeRecipientDelegate:0];
  [v6 setComposeViewDelegate:0];
  [v6 setPopoverOwner:0];
  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 removeObserver:self];

  [(MFSecureMIMECompositionManager *)self->_secureCompositionManager invalidate];
  v8.receiver = self;
  v8.super_class = (Class)MFMailComposeController;
  [(MFMailComposeController *)&v8 dealloc];
}

- (id)mailComposeView
{
  if ([(MFMailComposeController *)self isViewLoaded])
  {
    id v3 = [(MFMailComposeController *)self view];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)sendButtonItem
{
  return self->_sendButtonItem;
}

- (void)setHosted:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 1360) = *((unsigned char *)self + 1360) & 0xBF | v3;
}

- (BOOL)hosted
{
  return (*((unsigned __int8 *)self + 1360) >> 6) & 1;
}

- (void)setPeoplePicker:(id)a3
{
  p_peoplePicker = &self->_peoplePicker;
  v5 = (CNContactPickerViewController *)a3;
  if (*p_peoplePicker != v5)
  {
    [(CNContactPickerViewController *)*p_peoplePicker setDelegate:0];
    objc_storeStrong((id *)p_peoplePicker, a3);
  }
}

- (void)dismissSheet
{
  char v3 = [(MFMailComposeController *)self traitCollection];
  char v4 = objc_msgSend(v3, "mf_supportsPopoverPresentation");

  if ((v4 & 1) == 0)
  {
    [(UIAlertController *)self->_popoverAlert dismissViewControllerAnimated:0 completion:0];
    [(MFMailComposeController *)self setPopoverAlert:0];
  }
}

- (void)clearAllFields
{
  char v3 = [(MFMailComposeController *)self mailComposeView];
  [v3 resetContentSize];

  *((unsigned char *)self + 1360) &= ~2u;
  char v4 = [(MFMailComposeController *)self composeWebView];
  [v4 setMarkupString:@"<BR class=\"webkit-block-placeholder\">"];

  [(MFMailComposeController *)self setAddresses:0 field:1];
  [(MFMailComposeController *)self setAddresses:0 field:2];
  [(MFMailComposeController *)self setAddresses:0 field:3];
  [(MFMailComposeController *)self setSubject:0];
  [(MFMailComposeController *)self setUseMailDrop:0];
  self->_selectedContentVariationIndex = 0x7FFFFFFFFFFFFFFFLL;
}

- (void)setIsModal:(BOOL)a3
{
  BOOL v3 = a3;
  self->_isModal = a3;
  id v4 = [(MFMailComposeController *)self mailComposeView];
  [v4 setIsForEditing:v3];
}

- (int64_t)countofDrawingAttachmentsLeftInCompose
{
  return [(NSMutableSet *)self->_drawingFileAttachments count];
}

- (NSString)documentID
{
  documentID = self->_documentID;
  if (!documentID)
  {
    id v4 = [(MFMutableMessageHeaders *)self->_savedHeaders firstHeaderForKey:*MEMORY[0x1E4F60780]];
    v5 = (void *)[v4 copy];
    v6 = v5;
    if (v5)
    {
      id v7 = v5;
      objc_super v8 = self->_documentID;
      self->_documentID = v7;
    }
    else
    {
      objc_super v8 = objc_msgSend(NSString, "ef_UUID");
      v9 = (NSString *)[v8 copy];
      v10 = self->_documentID;
      self->_documentID = v9;
    }
    documentID = self->_documentID;
  }
  uint64_t v11 = documentID;

  return v11;
}

- (void)setDisplayMetrics:(id)a3
{
  v5 = (MFComposeDisplayMetrics *)a3;
  if (self->_displayMetrics != v5)
  {
    objc_storeStrong((id *)&self->_displayMetrics, a3);
    [(MFMailComposeController *)self _displayMetricsDidChange];
  }
}

- (id)navigationBarTitle
{
  BOOL v3 = (void *)[(NSString *)self->_initialTitle copy];
  if (![v3 length])
  {
    uint64_t v4 = [(MFComposeSubjectView *)self->_subjectField text];

    BOOL v3 = (void *)v4;
  }
  if (![v3 length])
  {
    switch([(MFMailComposeController *)self composeType])
    {
      case 0:
      case 7:
        if (objc_msgSend(MEMORY[0x1E4FB16C8], "mf_isPad"))
        {
          v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          [v5 localizedStringForKey:@"NEW_MESSAGE_LONG" value:&stru_1F0817A00 table:@"Main"];
        }
        else
        {
          v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          [v5 localizedStringForKey:@"NEW_MESSAGE" value:&stru_1F0817A00 table:@"Main"];
        uint64_t v6 = };
        goto LABEL_13;
      case 2:
      case 8:
      case 9:
        v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        uint64_t v6 = [v5 localizedStringForKey:@"DRAFT" value:&stru_1F0817A00 table:@"Main"];
        goto LABEL_13;
      case 4:
        v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        uint64_t v6 = [v5 localizedStringForKey:@"REPLY" value:&stru_1F0817A00 table:@"Main"];
        goto LABEL_13;
      case 5:
        v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        uint64_t v6 = [v5 localizedStringForKey:@"REPLY_ALL" value:&stru_1F0817A00 table:@"Main"];
        goto LABEL_13;
      case 6:
        v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        uint64_t v6 = [v5 localizedStringForKey:@"FORWARD" value:&stru_1F0817A00 table:@"Main"];
LABEL_13:
        id v7 = (void *)v6;

        BOOL v3 = v7;
        break;
      default:
        break;
    }
  }

  return v3;
}

- (void)setInitialTitle:(id)a3
{
  uint64_t v6 = (NSString *)a3;
  if (self->_initialTitle != v6)
  {
    uint64_t v4 = (NSString *)[(NSString *)v6 copy];
    initialTitle = self->_initialTitle;
    self->_initialTitle = v4;

    [(MFMailComposeController *)self _updateNavigationBarTitleAnimated:0];
  }
}

- (void)clearInitialTitle
{
  initialTitle = self->_initialTitle;
  self->_initialTitle = 0;

  [(MFMailComposeController *)self _updateNavigationBarTitleAnimated:1];
}

- (id)_alternateTitleView
{
  alternateTitleView = self->_alternateTitleView;
  if (!alternateTitleView)
  {
    uint64_t v4 = [MFMailComposeNavigationBarTitleView alloc];
    v5 = -[MFMailComposeNavigationBarTitleView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    uint64_t v6 = self->_alternateTitleView;
    self->_alternateTitleView = v5;

    alternateTitleView = self->_alternateTitleView;
  }

  return alternateTitleView;
}

- (void)_setTitleBarSubtitleText:(id)a3 style:(unint64_t)a4
{
  uint64_t v6 = (__CFString *)a3;
  id v7 = [(MFMailComposeController *)self _alternateTitleView];
  objc_super v8 = &stru_1F0817A00;
  if (v6) {
    objc_super v8 = v6;
  }
  uint64_t v14 = v8;

  [v7 setSubtitle:v14 withStyle:a4];
  v9 = [(MFMailComposeController *)self navigationItem];
  v10 = [v9 titleView];

  if (v10 != v7)
  {
    [(MFMailComposeController *)self _updateNavigationBarTitleAnimated:0];
    uint64_t v11 = [(MFMailComposeController *)self navigationController];
    v12 = [v11 navigationBar];
    [v12 bounds];
    CGRect v17 = CGRectInset(v16, 0.0, 0.0);
    objc_msgSend(v7, "setFrame:", v17.origin.x, v17.origin.y, v17.size.width, v17.size.height);

    v13 = [(MFMailComposeController *)self navigationItem];
    [v13 setTitleView:v7];
  }
}

- (void)_updateNavigationBarTitleAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v9 = [(MFMailComposeController *)self navigationBarTitle];
  v5 = [(MFMailComposeController *)self navigationItem];
  [v5 _setTitle:v9 animated:v3];

  [(UIView *)self->_alternateTitleView setTitle:v9];
  uint64_t v6 = [(MFMailComposeController *)self view];
  id v7 = [v6 window];
  objc_super v8 = [v7 windowScene];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v8, "mf_resetPreferredTitle");
  }
}

- (void)_setupLargeTitleAccessory
{
  id v10 = [(MFMailComposeController *)self navigationItem];
  BOOL v3 = [(MFMailComposeController *)self _alternateTitleView];
  [v10 setTitleView:v3];

  [v10 _setLargeTitleTwoLineMode:2];
  if ((objc_msgSend(MEMORY[0x1E4FB16C8], "mf_isSmallPhone") & 1) == 0)
  {
    uint64_t v4 = [(MFMailComposeController *)self navigationController];
    v5 = [v4 navigationBar];
    [v5 setPrefersLargeTitles:1];

    [v10 setLargeTitleDisplayMode:1];
    uint64_t v6 = +[MFComposeSendAccessoryButton buttonWithType:0];
    sendAccessoryButton = self->_sendAccessoryButton;
    self->_sendAccessoryButton = v6;

    [(UIButton *)self->_sendAccessoryButton addTarget:self action:sel_send_ forControlEvents:64];
    objc_super v8 = [(MFMailComposeController *)self sendLaterMenu];
    [(UIButton *)self->_sendAccessoryButton setMenu:v8];

    [v10 _setLargeTitleAccessoryView:self->_sendAccessoryButton alignToBaseline:0];
    id v9 = objc_opt_new();
    [v9 configureWithOpaqueBackground];
    [v9 setShadowColor:0];
    [v10 setScrollEdgeAppearance:v9];
  }
}

- (void)_setupForQuickReply
{
  id v6 = [(MFMailComposeController *)self mailComposeView];
  char v3 = [v6 isQuickReply];

  if (v3)
  {
    uint64_t v4 = [(MFMailComposeController *)self quickReplyActionButtonProvider];
    id v7 = [v4 quickReplySendButton];

    v5 = [(MFMailComposeController *)self sendLaterMenu];
    [v7 setMenu:v5];

    [v7 setEnabled:0];
  }
}

- (void)_setupNavigationBarItems
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"SEND" value:&stru_1F0817A00 table:@"Main"];
  id v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"CANCEL" value:&stru_1F0817A00 table:@"Main"];
  id v16 = (id)objc_msgSend(v3, "initWithObjects:", v5, v7, 0);

  objc_super v8 = [(MFMailComposeController *)self _createSendButtonItemWithPossibleTitles:v16];
  sendButtonItem = self->_sendButtonItem;
  self->_sendButtonItem = v8;

  id v10 = [(MFMailComposeController *)self navigationItem];
  id v11 = objc_alloc(MEMORY[0x1E4FB14A8]);
  v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v13 = [v12 localizedStringForKey:@"CANCEL" value:&stru_1F0817A00 table:@"Main"];
  uint64_t v14 = (UIBarButtonItem *)[v11 initWithTitle:v13 style:0 target:self action:sel_close_];
  closeButtonItem = self->_closeButtonItem;
  self->_closeButtonItem = v14;

  [(UIBarButtonItem *)self->_closeButtonItem setPossibleTitles:v16];
  [v10 setRightBarButtonItem:self->_sendButtonItem];
  [(UIBarButtonItem *)self->_closeButtonItem setAccessibilityIdentifier:*MEMORY[0x1E4F73BA0]];
  [v10 setLeftBarButtonItem:self->_closeButtonItem];
}

- (id)_createSendButtonItemWithPossibleTitles:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrow.up.circle.fill"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithImage:v5 style:0 target:self action:sel_send_];
  [v6 setAccessibilityIdentifier:*MEMORY[0x1E4F73C88]];
  id v7 = objc_msgSend(MEMORY[0x1E4FB1818], "mf_largeContentSizeImageNamed:", @"arrow.up.circle.fill");
  [v6 setLargeContentSizeImage:v7];

  objc_super v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"SEND" value:&stru_1F0817A00 table:@"Main"];
  [v6 setTitle:v9];

  id v10 = [(MFMailComposeController *)self sendLaterMenu];
  [v6 setMenu:v10];

  [v6 setPossibleTitles:v4];

  return v6;
}

- (void)_setupSendLaterOnboardingPaletteIfNecessary
{
  if ([(MFMailComposeController *)self _shouldShowSendLaterOnboarding])
  {
    id v3 = [(MFMailComposeController *)self navigationItem];
    id v4 = objc_alloc_init(MFComposeSendLaterOnboardingView);
    v5 = _EFLocalizedString();
    id v6 = (void *)MEMORY[0x1E4FB13F0];
    id v7 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrow.up.circle.badge.clock"];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __70__MFMailComposeController__setupSendLaterOnboardingPaletteIfNecessary__block_invoke;
    v16[3] = &unk_1E5F7B2B8;
    id v8 = v3;
    id v17 = v8;
    id v9 = [v6 actionWithTitle:v5 image:v7 identifier:0 handler:v16];

    id v10 = [(MFComposeSendLaterOnboardingView *)v4 cancelButton];
    [v10 addAction:v9 forControlEvents:64];

    id v11 = (void *)[objc_alloc(MEMORY[0x1E4FB21F8]) initWithContentView:v4];
    -[MFComposeSendLaterOnboardingView systemLayoutSizeFittingSize:](v4, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4FB2C68], *(double *)(MEMORY[0x1E4FB2C68] + 8));
    double v13 = v12;
    [v8 _setBottomPalette:v11];
    uint64_t v14 = [v8 _bottomPalette];
    [v14 setPreferredHeight:v13];

    v15 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
    [v15 setBool:1 forKey:*MEMORY[0x1E4F601A8]];
  }
}

uint64_t __70__MFMailComposeController__setupSendLaterOnboardingPaletteIfNecessary__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setBottomPalette:0];
}

- (BOOL)_shouldShowSendLaterOnboarding
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  char v3 = [v2 BOOLForKey:*MEMORY[0x1E4F601A8]];

  if (v3) {
    return 0;
  }
  v5 = [MEMORY[0x1E4FB1438] sharedApplication];
  if (([v5 launchedToTest] & 1) != 0 || objc_msgSend(v5, "isRunningTest"))
  {
    id v6 = MFLogGeneral();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF945000, v6, OS_LOG_TYPE_DEFAULT, "Onboarding not presented -- test is running", buf, 2u);
    }
    BOOL v4 = 0;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1C9C8] date];
    id v7 = objc_alloc(MEMORY[0x1E4F1C9A8]);
    id v8 = (void *)[v7 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
    id v9 = [MEMORY[0x1E4F1CAF0] localTimeZone];
    [v8 setTimeZone:v9];

    id v10 = [v8 dateBySettingHour:9 minute:0 second:0 ofDate:v6 options:0];
    id v11 = [v8 dateBySettingHour:17 minute:0 second:0 ofDate:v6 options:0];
    if (([v6 ef_isEarlierThanDate:v10] & 1) != 0
      || ([v6 ef_isLaterThanDate:v11] & 1) != 0)
    {
      BOOL v4 = 1;
    }
    else
    {
      double v12 = MFLogGeneral();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v14 = 0;
        _os_log_impl(&dword_1AF945000, v12, OS_LOG_TYPE_DEFAULT, "Not showing send later onboarding tip. Time out of bounds", v14, 2u);
      }

      BOOL v4 = 0;
    }
  }
  return v4;
}

- (BOOL)shouldShowSMIMEButton
{
  if (_os_feature_enabled_impl()) {
    return 0;
  }
  BOOL v4 = (void *)[objc_alloc(MEMORY[0x1E4F607F8]) initWithString:self->_sendingEmailAddress];
  v5 = [v4 simpleAddress];

  id v6 = [(MFMailComposeController *)self accountProxyGenerator];
  id v7 = [v6 accountProxyContainingEmailAddress:v5 includingInactive:0 originatingBundleID:self->_originatingBundleID sourceAccountManagement:self->_sourceAccountManagement];
  id v8 = [v7 mailAccount];

  char v3 = [v8 perMessageEncryptionEnabledForAddress:v5];
  return v3;
}

- (void)tappedSMIMEButton
{
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    self->_encryptionOverrideSetting ^= 1u;
    [(MFMailComposeController *)self _resetSecureCompositionManager];
  }
}

- (void)_updateSMIMEButtonEnabledForRecipientCount
{
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    BOOL v3 = [(MFMailComposeController *)self _secureCompositionManagerHasRecipients];
    toField = self->_toField;
    [(MFMailComposeToField *)toField setSmimeButtonEnabled:v3];
  }
}

+ (BOOL)isSetupForDeliveryAllowingRestrictedAccounts:(BOOL)a3
{
  uint64_t v3 = a3;
  v5 = [MEMORY[0x1E4F28B50] mainBundle];
  id v6 = [v5 bundleIdentifier];
  LOBYTE(v3) = [a1 isSetupForDeliveryAllowingRestrictedAccounts:v3 originatingBundleID:v6 sourceAccountManagement:0];

  return v3;
}

+ (BOOL)isSetupForDeliveryAllowingRestrictedAccounts:(BOOL)a3 originatingBundleID:(id)a4 sourceAccountManagement:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  BOOL v6 = a3;
  id v7 = a4;
  id v8 = [[MFMailAccountProxyGenerator alloc] initWithAllowsRestrictedAccounts:v6];
  id v9 = [(MFMailAccountProxyGenerator *)v8 defaultMailAccountProxyForDeliveryOriginatingBundleID:v7 sourceAccountManagement:v5];
  LOBYTE(v5) = v9 != 0;

  return v5;
}

- (BOOL)_isSetupForDelivery
{
  v2 = [(MFMailComposeController *)self _defaultAccount];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)_defaultAccount
{
  BOOL v3 = [(MFMailComposeController *)self accountProxyGenerator];
  BOOL v4 = [v3 defaultMailAccountProxyForDeliveryOriginatingBundleID:self->_originatingBundleID sourceAccountManagement:self->_sourceAccountManagement];

  return v4;
}

+ (id)preferenceForKey:(id)a3
{
  BOOL v3 = [MEMORY[0x1E4F73B50] valueForKey:a3];

  return v3;
}

- (void)_accountsChanged:(id)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__MFMailComposeController__accountsChanged___block_invoke;
  v4[3] = &unk_1E5F79088;
  v4[4] = self;
  BOOL v3 = objc_msgSend(MEMORY[0x1E4F60F28], "mainThreadScheduler", a3);
  [v3 performSyncBlock:v4];
}

void __44__MFMailComposeController__accountsChanged___block_invoke(uint64_t a1)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 32);
  BOOL v3 = [*(id *)(a1 + 32) mailComposeView];
  [*v2 _resetProxyGenerator];
  BOOL v4 = [*(id *)(a1 + 32) emailAddresses];
  uint64_t v5 = [*(id *)(a1 + 32) hideMyEmailAddressIfExists];

  if (v5)
  {
    BOOL v6 = [*(id *)(a1 + 32) hideMyEmailAddressIfExists];
    v20[0] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    uint64_t v8 = [v4 arrayByAddingObjectsFromArray:v7];

    BOOL v4 = (void *)v8;
  }
  id v9 = [v3 fromField];
  [v9 setAvailableAddresses:v4];

  id v10 = [*(id *)(a1 + 32) sendingEmailAddressIfExists];
  id v11 = [v10 emailAddressValue];
  double v12 = [v11 simpleAddress];
  double v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = [v10 stringValue];
  }
  v15 = v14;

  int v16 = [v4 containsObject:v15];
  if ((v16 & 1) == 0) {
    [*(id *)(a1 + 32) _setSendingEmailAddress:0];
  }
  id v17 = [v3 composeWebView];
  [v17 updateInputAssistantItem];

  [*(id *)(a1 + 32) _resetSecureCompositionManager];
  v18 = MFLogGeneral();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19[0] = 67109120;
    v19[1] = v16;
    _os_log_impl(&dword_1AF945000, v18, OS_LOG_TYPE_DEFAULT, "#CompositionServices Accounts changed. originalAddressIsAvailable: %d", (uint8_t *)v19, 8u);
  }
}

- (id)emailAddresses
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  BOOL v4 = [(MFMailComposeController *)self _availableAccountProxies];
  obuint64_t j = v4;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v10 = (void *)MEMORY[0x1E4F607F8];
        id v11 = [v8 fromEmailAddresses];
        double v12 = [v10 emailAddressesFromStrings:v11 invalidAddresses:0];

        uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v20;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v20 != v14) {
                objc_enumerationMutation(v12);
              }
              int v16 = [*(id *)(*((void *)&v19 + 1) + 8 * j) simpleAddress];
              [v9 addObject:v16];
            }
            uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v13);
        }

        [v3 addObjectsFromArray:v9];
      }
      BOOL v4 = obj;
      uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v5);
  }

  return v3;
}

- (id)_emailAddressesWithHME
{
  v2 = [(MFMailComposeController *)self emailAddresses];
  BOOL v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  BOOL v4 = [v3 localizedStringForKey:@"HIDE_MY_EMAIL_TITLE" value:&stru_1F0817A00 table:@"Main"];
  uint64_t v5 = [v2 arrayByAddingObject:v4];

  return v5;
}

- (id)_availableAccountProxies
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (!self->_primaryAddressForForcedSendingAccount) {
    goto LABEL_4;
  }
  BOOL v3 = [(MFMailComposeController *)self accountProxyGenerator];
  BOOL v4 = [v3 accountProxyContainingEmailAddress:self->_primaryAddressForForcedSendingAccount includingInactive:0 originatingBundleID:self->_originatingBundleID sourceAccountManagement:self->_sourceAccountManagement];

  if (!v4
    || (v8[0] = v4,
        [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v5))
  {
LABEL_4:
    uint64_t v6 = [(MFMailComposeController *)self accountProxyGenerator];
    uint64_t v5 = [v6 activeAccountProxiesOriginatingBundleID:self->_originatingBundleID sourceAccountManagement:self->_sourceAccountManagement];
  }

  return v5;
}

- (void)_resetProxyGenerator
{
  BOOL v3 = [[MFMailAccountProxyGenerator alloc] initWithAllowsRestrictedAccounts:self->_allowRestrictedAccounts];
  -[MFMailComposeController setAccountProxyGenerator:](self, "setAccountProxyGenerator:");
}

- (unint64_t)_reloadNumberOfReformattedAddressesWithMaximumWidth:(double)a3 defaultFontSize:(double)a4
{
  if (pthread_main_np() != 1)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"MFMailComposeController.m" lineNumber:1185 description:@"Current thread must be main"];
  }
  addressPickerReformatter = self->_addressPickerReformatter;
  if (!addressPickerReformatter)
  {
    id v9 = objc_alloc_init(MFAddressPickerReformatter);
    id v10 = self->_addressPickerReformatter;
    self->_addressPickerReformatter = v9;

    addressPickerReformatter = self->_addressPickerReformatter;
  }
  id v11 = [(MFMailComposeController *)self emailAddresses];
  [(MFAddressPickerReformatter *)addressPickerReformatter setAddresses:v11];

  [(MFAddressPickerReformatter *)self->_addressPickerReformatter setMaximumWidth:a3];
  [(MFAddressPickerReformatter *)self->_addressPickerReformatter setMinimumFontSize:15.0 maximumFontSize:a4];
  double v12 = self->_addressPickerReformatter;

  return [(MFAddressPickerReformatter *)v12 numberOfReformattedAddresses];
}

- (id)_reformattedAddressAtIndex:(unint64_t)a3
{
  return [(MFAddressPickerReformatter *)self->_addressPickerReformatter reformattedAddressAtIndex:a3];
}

- (int64_t)composeType
{
  return [(_MFMailCompositionContext *)self->_compositionContext composeType];
}

- (BOOL)_isRestoredComposition
{
  unint64_t v2 = [(MFMailComposeController *)self composeType];
  return (v2 < 0xA) & (0x38Cu >> v2);
}

- (BOOL)_isReplyOrForward
{
  return (unint64_t)([(MFMailComposeController *)self composeType] - 4) < 3;
}

- (void)setCompositionContext:(id)a3
{
  id v7 = (_MFMailCompositionContext *)a3;
  compositionContext = self->_compositionContext;
  if (compositionContext) {
    BOOL v6 = [(_MFMailCompositionContext *)compositionContext composeType] != 1;
  }
  else {
    BOOL v6 = 0;
  }
  [(_MFMailCompositionContext *)v7 setDelegate:self];
  if (self->_compositionContext != v7)
  {
    objc_storeStrong((id *)&self->_compositionContext, a3);
    [(MFMailComposeController *)self setAutosaveIdentifier:0];
    [(MFMailComposeController *)self setAutosaveSession:0];
  }
  if (self->_progressIndicatorView) {
    [(MFMailComposeController *)self setProgressUIVisible:0 animated:1];
  }
  if (v6) {
    [(MFMailComposeController *)self clearAllFields];
  }
  [(MFMailComposeController *)self _loadCompositionContext];
}

- (void)_prepareCompositionContextForLoading:(id)a3
{
  id v8 = a3;
  unint64_t v3 = [v8 composeType];
  if (v3 <= 9 && ((1 << v3) & 0x38C) != 0)
  {
    uint64_t v5 = [v8 loadingContext];
    uint64_t v6 = [v8 legacyMessage];
    id v7 = (void *)v6;
    if (!v5 && v6)
    {
      uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F77BF0]) initWithMessage:v6 attachmentManager:0];
      [v8 setLoadingContext:v5];
      [v8 setLoadRest:1];
      [v8 setIncludeAttachments:1];
    }
  }
}

- (void)_loadCompositionContext
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = self->_compositionContext;
  [(_MFMailCompositionContext *)v3 setDelegate:self];
  BOOL v4 = [(_MFMailCompositionContext *)v3 originalMessage];
  uint64_t v5 = [(MFMailComposeController *)self _originalContentOfMessagesInReplyToMessage:v4];
  [(MFMailComposeController *)self setOriginalContentMessagesFuture:v5];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  uint64_t v6 = [(MFMailComposeController *)self originalContentMessagesFuture];
  id v7 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __50__MFMailComposeController__loadCompositionContext__block_invoke;
  v63[3] = &unk_1E5F7B2E0;
  objc_copyWeak(&v64, &location);
  [v6 onScheduler:v7 addSuccessBlock:v63];

  if (self->_selectedContentVariationIndex == 0x7FFFFFFFFFFFFFFFLL) {
    self->_selectedContentVariationIndex = [(_MFMailCompositionContext *)v3 defaultContentVariationIndex];
  }
  [(MFMailComposeController *)self _prepareCompositionContextForLoading:v3];
  v53 = [(_MFMailCompositionContext *)v3 legacyMessage];
  int v8 = [(_MFMailCompositionContext *)v3 loadRest];
  int v50 = [(_MFMailCompositionContext *)v3 includeAttachments]
     || [(_MFMailCompositionContext *)v3 includeAttachmentsWhenAdding];
  BOOL v49 = [(_MFMailCompositionContext *)v3 isLoadingMessageData];
  int v9 = v53 != 0;
  if (v53) {
    int v10 = v8;
  }
  else {
    int v10 = 1;
  }
  if (!v10) {
    int v9 = v50 | v49;
  }
  if (v9) {
    char v11 = 32;
  }
  else {
    char v11 = 0;
  }
  *((unsigned char *)self + 1360) = *((unsigned char *)self + 1360) & 0xDF | v11;
  self->_initialAttachmentCount = 0;
  double v12 = [(_MFMailCompositionContext *)self->_compositionContext originatingBundleID];
  uint64_t v13 = (NSString *)[v12 copy];
  originatingBundleID = self->_originatingBundleID;
  self->_originatingBundleID = v13;

  self->_sourceAccountManagement = [(_MFMailCompositionContext *)v3 sourceAccountManagement];
  [(MFMailComposeController *)self _resetProxyGenerator];
  unint64_t v15 = [(_MFMailCompositionContext *)v3 composeType];
  [(MFMailComposeController *)self setContentVisible:[(_MFMailCompositionContext *)v3 showContentImmediately]];
  BOOL v16 = 0;
  switch(v15)
  {
    case 0uLL:
      goto LABEL_20;
    case 2uLL:
      goto LABEL_52;
    case 3uLL:
      if (v53) {
        -[MFMailComposeController _setupForOutbox:](self, "_setupForOutbox:");
      }
      goto LABEL_23;
    case 4uLL:
    case 5uLL:
    case 6uLL:
      +[MFComposeTypeFactory setupWithCompositionModel:v3 delegate:self];
      goto LABEL_23;
    case 7uLL:
      if (v53)
      {
        [(MFMailComposeController *)self _setupForAutosavedMessage:v53];
        BOOL v16 = 1;
      }
      else
      {
LABEL_20:
        +[MFComposeTypeFactory setupWithCompositionModel:v3 delegate:self];
        id v17 = [(_MFMailCompositionContext *)self->_compositionContext messageBody];
        if ([v17 length])
        {
          BOOL v16 = 1;
        }
        else
        {
          v44 = [(_MFMailCompositionContext *)self->_compositionContext subject];
          if ([v44 length])
          {
            BOOL v16 = 1;
          }
          else
          {
            v45 = [(_MFMailCompositionContext *)self->_compositionContext toRecipients];
            if ([v45 count])
            {
              BOOL v16 = 1;
            }
            else
            {
              v52 = [(_MFMailCompositionContext *)self->_compositionContext ccRecipients];
              if ([v52 count])
              {
                BOOL v16 = 1;
              }
              else
              {
                v48 = [(MFMailComposeController *)self attachments];
                BOOL v16 = [v48 count] != 0;
              }
            }
          }
        }

LABEL_65:
        if (!v15)
        {
          v46 = [(_MFMailCompositionContext *)self->_compositionContext messageBody];
          *((unsigned char *)self + 1360) = *((unsigned char *)self + 1360) & 0xFD | (2 * ([v46 length] != 0));

          goto LABEL_26;
        }
        if (v15 == 1) {
          goto LABEL_26;
        }
      }
LABEL_24:
      v18 = [(MFMailComposeController *)self mailComposeView];
      char v19 = [v18 isQuickReply];

      if ((v19 & 1) == 0) {
        *((unsigned char *)self + 1360) |= 2u;
      }
LABEL_26:
      if ((*((unsigned char *)self + 1360) & 2) != 0) {
        [(MFMailComposeController *)self _updateSendAndCloseEnabled];
      }
      [(MFMailComposeController *)self _checkForReplyAndForwardRestriction];
      if (v53)
      {
        if (v15 == 1) {
          goto LABEL_35;
        }
        goto LABEL_30;
      }
      if (v15 > 9 || ((1 << v15) & 0x286) == 0) {
LABEL_30:
      }
        [(MFMailComposeController *)self _updateOriginalBccStatusForRestoreAddingAddress:[(MFMailComposeController *)self _isRestoredComposition] ^ 1];
      if (v15 - 4 <= 2) {
        -[MFComposeSubjectView setNotifyOptionSelected:](self->_subjectField, "setNotifyOptionSelected:", [v53 conversationFlags] & 1);
      }
LABEL_35:
      long long v20 = [(MFMailComposeController *)self mailComposeView];
      v47 = [v20 webContentVariationField];

      long long v21 = [(_MFMailCompositionContext *)v3 contentVariations];
      v51 = objc_msgSend(v21, "ef_map:", &__block_literal_global_20);

      unint64_t v22 = [(MFMailComposeController *)self contentVariationIndex];
      v61[0] = MEMORY[0x1E4F143A8];
      v61[1] = 3221225472;
      v61[2] = __50__MFMailComposeController__loadCompositionContext__block_invoke_3;
      v61[3] = &unk_1E5F7A3E0;
      v61[4] = self;
      id v23 = v47;
      id v62 = v23;
      [v23 setupMenuItemTitles:v51 currentSelection:v22 handler:v61];
      *((unsigned char *)self + 1360) = *((unsigned char *)self + 1360) & 0xFE | v16;
      [(MFComposeWebView *)self->_composeWebView setDirty:0];
      if ((*((unsigned char *)self + 1360) & 0x20) != 0)
      {
        long long v24 = [(MFMailComposeController *)self messageLoadingTailspinCancellable];
        [v24 cancel];

        id from = (id)0xAAAAAAAAAAAAAAAALL;
        objc_initWeak(&from, self);
        long long v25 = (void *)([(MFMailComposeController *)self currentlyLoadingCounter] + 1);
        [(MFMailComposeController *)self setCurrentlyLoadingCounter:v25];
        long long v26 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
        v58[0] = MEMORY[0x1E4F143A8];
        v58[1] = 3221225472;
        v58[2] = __50__MFMailComposeController__loadCompositionContext__block_invoke_4;
        v58[3] = &unk_1E5F7B328;
        objc_copyWeak(v59, &from);
        v59[1] = v25;
        uint64_t v27 = [v26 afterDelay:v58 performBlock:1.5];
        [(MFMailComposeController *)self setMessageLoadingTailspinCancellable:v27];

        [(MFMailComposeController *)self _setIsLoading:1];
        if (v8)
        {
          v28 = [(_MFMailCompositionContext *)v3 loadingContext];
          uint64_t v29 = MFComposeLog();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            v68 = v28;
            _os_log_impl(&dword_1AF945000, v29, OS_LOG_TYPE_DEFAULT, "Issuing loading request for context context %p", buf, 0xCu);
          }

          v30 = MFMessageComposeLoadingSignpostLog();
          os_signpost_id_t v31 = [(_MFMailCompositionContext *)v3 signpostID];
          if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1AF945000, v30, OS_SIGNPOST_INTERVAL_BEGIN, v31, "LOAD COMPOSE MESSAGE BODY", "Start loading message body enableTelemetry=YES ", buf, 2u);
          }

          v32 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
          v54[0] = MEMORY[0x1E4F143A8];
          v54[1] = 3221225472;
          v54[2] = __50__MFMailComposeController__loadCompositionContext__block_invoke_261;
          v54[3] = &unk_1E5F7B350;
          objc_copyWeak(&v57, &from);
          id v33 = v28;
          id v55 = v33;
          v56 = v3;
          id v34 = (id)[v33 onScheduler:v32 addLoadObserver:v54];

          [v33 load:2];
          objc_destroyWeak(&v57);
        }
        else if (((v50 ^ 1 | v49) & 1) == 0)
        {
          [(MFMailComposeController *)self _loadAttachments];
        }
        objc_destroyWeak(v59);
        objc_destroyWeak(&from);
      }
      else
      {
        [(MFMailComposeController *)self _setIsLoading:0];
      }
      v35 = [(MFMailComposeController *)self mailComposeView];
      [(MFMailComposeController *)self pickInitialFirstResponder];
      if ([(_MFMailCompositionContext *)self->_compositionContext showKeyboardImmediately]
        && ([v35 isKeyboardVisible] & 1) == 0)
      {
        [v35 setKeyboardVisible:1 animate:1];
      }
      [(MFMailComposeController *)self _updateNavigationBarTitleAnimated:0];
      v36 = [(MFMailComposeController *)self attachments];
      self->_initialAttachmentCount = [v36 count];

      v37 = [(MFMailComposeController *)self emailAddresses];
      id v38 = [v35 fromField];
      [v38 setAvailableAddresses:v37];

      objc_super v39 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v40 = [v39 localizedStringForKey:@"HIDE_MY_EMAIL_TITLE" value:&stru_1F0817A00 table:@"Main"];
      v66 = v40;
      uint64_t v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v66 count:1];
      v42 = [v35 fromField];
      [v42 setDeferredAddresses:v41];

      [(MFMailComposeController *)self _updateImageSizeTitles];
      v43 = [(MFMailComposeController *)self mailComposeView];
      [v43 setNeedsLayout];

      objc_destroyWeak(&v64);
      objc_destroyWeak(&location);

      return;
    case 8uLL:
      [(MFMailComposeController *)self _setupForExistingNewMessage:v53 content:0];
LABEL_23:
      BOOL v16 = 0;
      goto LABEL_24;
    case 9uLL:
      BOOL v16 = 1;
LABEL_52:
      if (v53) {
        -[MFMailComposeController _setupForDraft:](self, "_setupForDraft:");
      }
      goto LABEL_24;
    default:
      goto LABEL_65;
  }
}

void __50__MFMailComposeController__loadCompositionContext__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    [WeakRetained _invalidateInputContextHistoryDebounced:1];
  }
}

id __50__MFMailComposeController__loadCompositionContext__block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 name];

  return v2;
}

void __50__MFMailComposeController__loadCompositionContext__block_invoke_3(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  [v3 setNumberStyle:0];
  BOOL v4 = [v9 identifier];
  uint64_t v5 = [v3 numberFromString:v4];
  *(void *)(*(void *)(a1 + 32) + 1384) = [v5 unsignedIntValue];

  uint64_t v6 = *(void **)(a1 + 40);
  id v7 = [*(id *)(a1 + 32) contentVariationName];
  [v6 setSelectedContentVariationLabel:v7];

  [*(id *)(*(void *)(a1 + 32) + 1208) setMarkupString:@"<BR class=\"webkit-block-placeholder\">"];
  int v8 = [*(id *)(a1 + 32) sendingEmailAddress];
  [*(id *)(*(void *)(a1 + 32) + 984) setPreferredSendingEmailAddress:v8];

  +[MFComposeTypeFactory setupWithCompositionModel:delegate:](MFComposeTypeFactory, "setupWithCompositionModel:delegate:", *(void *)(*(void *)(a1 + 32) + 984));
}

void __50__MFMailComposeController__loadCompositionContext__block_invoke_4(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained currentlyLoadingCounter] == *(void *)(a1 + 40))
    {
      BOOL v4 = objc_msgSend(NSString, "stringWithFormat:", @"Compose contents didn't load within %.1fs", 0x3FF8000000000000);
      EFSaveTailspin();
    }
    else
    {
      uint64_t v5 = MFComposeLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = [v3 currentlyLoadingCounter];
        uint64_t v7 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 134218240;
        uint64_t v9 = v6;
        __int16 v10 = 2048;
        uint64_t v11 = v7;
        _os_log_impl(&dword_1AF945000, v5, OS_LOG_TYPE_DEFAULT, "Skip save tailspin, counter doesn't match (%ld != %ld)", buf, 0x16u);
      }
    }
  }
}

void __50__MFMailComposeController__loadCompositionContext__block_invoke_261(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = MFComposeLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v7 = 134217984;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1AF945000, v3, OS_LOG_TYPE_DEFAULT, "Loading context complete for context %p", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v5 = MFMessageComposeLoadingSignpostLog();
  os_signpost_id_t v6 = [*(id *)(a1 + 40) signpostID];
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v7) = 0;
    _os_signpost_emit_with_name_impl(&dword_1AF945000, v5, OS_SIGNPOST_INTERVAL_END, v6, "LOAD COMPOSE MESSAGE BODY", "Finish loading message body enableTelemetry=YES ", (uint8_t *)&v7, 2u);
  }

  [WeakRetained _loadingContextDidLoadMessage];
}

- (void)_checkForReplyAndForwardRestriction
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ([(MFMailComposeController *)self _isReplyOrForward]
    || [(_MFMailCompositionContext *)self->_compositionContext originatingFromAttachmentMarkup])
  {
    BOOL v3 = 0;
  }
  else
  {
    if (![(MFMailComposeController *)self _isRestoredComposition])
    {
      uint64_t v4 = self->_sendingEmailAddress;
      goto LABEL_13;
    }
    uint64_t v11 = [(MFMailComposeController *)self savedHeaders];
    uint64_t v12 = [v11 references];
    uint64_t v13 = [v12 count];
    BOOL v14 = v13 != 0;

    if (v13)
    {
      BOOL v14 = 1;
    }
    else
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      unint64_t v15 = (void *)_HeaderKeysForForwardsAndReplies_sHeaderKeys;
      if (!_HeaderKeysForForwardsAndReplies_sHeaderKeys)
      {
        id v16 = objc_alloc(MEMORY[0x1E4F1C978]);
        uint64_t v17 = objc_msgSend(v16, "initWithObjects:", *MEMORY[0x1E4F606C8], 0);
        v18 = (void *)_HeaderKeysForForwardsAndReplies_sHeaderKeys;
        _HeaderKeysForForwardsAndReplies_sHeaderKeys = v17;

        unint64_t v15 = (void *)_HeaderKeysForForwardsAndReplies_sHeaderKeys;
      }
      id v19 = v15;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v26;
        while (2)
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v26 != v21) {
              objc_enumerationMutation(v19);
            }
            id v23 = [v11 firstHeaderForKey:*(void *)(*((void *)&v25 + 1) + 8 * i)];
            BOOL v24 = v23 == 0;

            if (!v24)
            {
              BOOL v14 = 1;
              goto LABEL_27;
            }
          }
          uint64_t v20 = [v19 countByEnumeratingWithState:&v25 objects:v29 count:16];
          if (v20) {
            continue;
          }
          break;
        }
      }
      else
      {
        BOOL v14 = 0;
      }
LABEL_27:
    }
    BOOL v3 = !v14;
  }
  uint64_t v4 = self->_sendingEmailAddress;
  if (v4 && !v3)
  {
    uint64_t v5 = [(MFMailComposeController *)self accountProxyGenerator];
    os_signpost_id_t v6 = [v5 accountProxyContainingEmailAddress:v4 includingInactive:0 originatingBundleID:self->_originatingBundleID sourceAccountManagement:self->_sourceAccountManagement];

    if ([v6 restrictsRepliesAndForwards])
    {
      int v7 = [v6 firstEmailAddress];
      uint64_t v8 = (NSString *)[v7 copy];
      primaryAddressForForcedSendingAccount = self->_primaryAddressForForcedSendingAccount;
      self->_primaryAddressForForcedSendingAccount = v8;

      sendingEmailAddress = self->_sendingEmailAddress;
      self->_sendingEmailAddress = 0;

      [(MFMailComposeController *)self setSendingEmailAddress:v4];
    }
  }
LABEL_13:
  [(MFMailComposeController *)self _updateManagedPasteboardOwner];
}

- (id)compositionContext
{
  return self->_compositionContext;
}

- (void)_setupForDraft:(id)a3
{
  id v7 = a3;
  -[MFMailComposeController _setupForExistingNewMessage:content:](self, "_setupForExistingNewMessage:content:");
  uint64_t v4 = [(MFMailComposeController *)self compositionContext];
  uint64_t v5 = [v4 originalMessage];
  [(MFMailComposeController *)self setDraftMessage:v5];

  os_signpost_id_t v6 = [(MFMailComposeController *)self mailComposeView];
  [v6 setAnimationDisabled:1];
}

- (void)_setupForOutbox:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = dispatch_time(0, 500000000);
  os_signpost_id_t v6 = dispatch_get_global_queue(-2, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__MFMailComposeController__setupForOutbox___block_invoke;
  block[3] = &unk_1E5F79088;
  block[4] = self;
  dispatch_after(v5, v6, block);

  [(MFMailComposeController *)self _setupForDraft:v4];
}

void __43__MFMailComposeController__setupForOutbox___block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 984) originalMessage];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F603D8]);
    v10[0] = v2;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    dispatch_time_t v5 = (void *)[v3 initWithMessageListItems:v4 origin:4 actor:1 specialDestinationMailboxType:3 flagChange:0 copyMessages:0];

    os_signpost_id_t v6 = [v2 repository];
    uint64_t v7 = [v6 performMessageChangeActionReturningUndoAction:v5];
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void **)(v8 + 1488);
    *(void *)(v8 + 1488) = v7;
  }
}

- (void)_setupForAutosavedMessage:(id)a3
{
}

- (void)_setupForExistingNewMessage:(id)a3 content:(id)a4
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v52 = a4;
  v54 = v5;
  v56 = [v5 headersIfAvailable];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  uint64_t v7 = (void *)[v56 copyAddressListForTo];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v69 objects:v76 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v70;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v70 != v9) {
          objc_enumerationMutation(v7);
        }
        [v6 addObject:*(void *)(*((void *)&v69 + 1) + 8 * i)];
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v69 objects:v76 count:16];
    }
    while (v8);
  }

  uint64_t v11 = (void *)[v6 copy];
  if ([v11 count]) {
    [(MFMailComposeController *)self setToRecipients:v11];
  }
  [v6 removeAllObjects];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  uint64_t v12 = (void *)[v56 copyAddressListForCc];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v65 objects:v75 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v66;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v66 != v14) {
          objc_enumerationMutation(v12);
        }
        [v6 addObject:*(void *)(*((void *)&v65 + 1) + 8 * j)];
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v65 objects:v75 count:16];
    }
    while (v13);
  }

  id v16 = (void *)[v6 copy];
  uint64_t v17 = v16;
  if ([v16 count]) {
    [(MFMailComposeController *)self setCcRecipients:v16];
  }
  [v6 removeAllObjects];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  v18 = (void *)[v56 copyAddressListForBcc];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v61 objects:v74 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v62;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v62 != v20) {
          objc_enumerationMutation(v18);
        }
        [v6 addObject:*(void *)(*((void *)&v61 + 1) + 8 * k)];
      }
      uint64_t v19 = [v18 countByEnumeratingWithState:&v61 objects:v74 count:16];
    }
    while (v19);
  }

  v53 = (void *)[v6 copy];
  if ([v53 count]) {
    -[MFMailComposeController setBccRecipients:](self, "setBccRecipients:");
  }
  uint64_t v22 = [v56 firstHeaderForKey:*MEMORY[0x1E4F606B8]];
  v51 = (void *)v22;
  if (v22)
  {
    id v23 = [MEMORY[0x1E4F608F8] tagValueListFromString:v22 error:0];
    BOOL v24 = [v23 objectForKeyedSubscript:*MEMORY[0x1E4F5FD00]];
    long long v25 = [v23 objectForKeyedSubscript:*MEMORY[0x1E4F5FD18]];
    uint64_t v26 = [v25 BOOLValue];

    if (v24)
    {
      id v27 = v24;
      [(MFMailComposeController *)self _setSendingEmailAddressAsHME:v27];
      long long v28 = [(MFMailComposeController *)self mailComposeView];
      [v28 setReplyToHME:v26];

      goto LABEL_36;
    }
  }
  objc_msgSend(v56, "firstSenderAddress", v22);
  id v27 = (id)objc_claimAutoreleasedReturnValue();
  if (!v27)
  {
    uint64_t v29 = [v54 account];
    id v27 = [v29 firstEmailAddress];
  }
  if ([v27 length]) {
    [(MFMailComposeController *)self setSendingEmailAddress:v27];
  }
LABEL_36:
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  uint64_t v30 = [v56 allHeaderKeys];
  uint64_t v31 = [v30 countByEnumeratingWithState:&v57 objects:v73 count:16];
  if (v31)
  {
    uint64_t v32 = *(void *)v58;
    uint64_t v33 = *MEMORY[0x1E4F60738];
    do
    {
      for (uint64_t m = 0; m != v31; ++m)
      {
        if (*(void *)v58 != v32) {
          objc_enumerationMutation(v30);
        }
        v35 = *(void **)(*((void *)&v57 + 1) + 8 * m);
        v36 = [v56 firstHeaderForKey:v35];
        if (v36)
        {
          if ([v35 caseInsensitiveCompare:v33])
          {
            if ([MEMORY[0x1E4F73508] shouldDecodeHeaderForKey:v35])
            {
              savedHeaders = self->_savedHeaders;
              if (!savedHeaders)
              {
                id v38 = (MFMutableMessageHeaders *)objc_alloc_init(MEMORY[0x1E4F73550]);
                objc_super v39 = self->_savedHeaders;
                self->_savedHeaders = v38;

                savedHeaders = self->_savedHeaders;
              }
              [(MFMutableMessageHeaders *)savedHeaders setHeader:v36 forKey:v35];
            }
          }
          else
          {
            [(MFMailComposeController *)self setSubject:v36];
          }
        }
      }
      uint64_t v31 = [v30 countByEnumeratingWithState:&v57 objects:v73 count:16];
    }
    while (v31);
  }

  if ((*((unsigned char *)self + 1360) & 0x20) == 0)
  {
    if (v52
      || ([v54 messageBodyIfAvailable],
          v40 = objc_claimAutoreleasedReturnValue(),
          [v40 htmlContent],
          id v52 = (id)objc_claimAutoreleasedReturnValue(),
          v40,
          v52))
    {
      int64_t v41 = [(MFMailComposeController *)self composeType];
      if (v41 == 9)
      {
        v42 = [(MFMailComposeController *)self composeWebView];
        [v42 setMarkupString:@"<BR class=\"webkit-block-placeholder\">"];
      }
      +[MFComposeTypeFactory setupWithContent:v52 delegate:self signpostID:[(_MFMailCompositionContext *)self->_compositionContext signpostID]];
      if (v41 == 9) {
        [(MFMailComposeController *)self updateSignature];
      }
    }
    else
    {
      id v52 = 0;
    }
  }
  v43 = [(MFMutableMessageHeaders *)self->_savedHeaders firstHeaderForKey:*MEMORY[0x1E4F60778]];
  v44 = v43;
  if (v43)
  {
    self->_encryptionOverrideSetting = [v43 BOOLValue];
    [(MFMailComposeController *)self _resetSecureCompositionManager];
  }
  v45 = [(MFMutableMessageHeaders *)self->_savedHeaders firstHeaderForKey:*MEMORY[0x1E4F60768]];
  v46 = v45;
  if (v45) {
    -[MFComposeSubjectView setNotifyOptionSelected:](self->_subjectField, "setNotifyOptionSelected:", [v45 BOOLValue]);
  }
  v47 = [v54 documentID];

  if (v47)
  {
    v48 = [v54 documentID];
    BOOL v49 = [v48 UUIDString];
    documentID = self->_documentID;
    self->_documentID = v49;
  }
}

- (void)_finishedLoadingAllContentAndAttachments
{
  [(MFMailComposeController *)self _setIsLoading:0];
  *((unsigned char *)self + 1360) &= ~0x20u;
  unint64_t v3 = [(MFMailComposeController *)self composeType];
  id v6 = [(_MFMailCompositionContext *)self->_compositionContext legacyMessage];
  id v4 = [(_MFMailCompositionContext *)self->_compositionContext originalContent];
  if (v3 > 9)
  {
LABEL_7:
    +[MFComposeTypeFactory setupWithCompositionModel:self->_compositionContext delegate:self];
    [(MFComposeWebView *)self->_composeWebView setDirty:0];
    goto LABEL_8;
  }
  if (((1 << v3) & 0x30C) == 0)
  {
    if (v3 == 7)
    {
      [(MFMailComposeController *)self _setupForExistingNewMessage:v6 content:v4];
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  [(MFMailComposeController *)self _setupForExistingNewMessage:v6 content:v4];
  if (v3 != 9) {
LABEL_8:
  }
    *((unsigned char *)self + 1360) &= ~1u;
LABEL_9:
  [(MFMailComposeController *)self pickInitialFirstResponder];
  id v5 = [(MFMailComposeController *)self messageLoadingTailspinCancellable];
  [v5 cancel];

  [(MFMailComposeController *)self setMessageLoadingTailspinCancellable:0];
  [(MFMailComposeController *)self _invalidateInputContextHistory];
}

- (void)_loadAttachments
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1AF945000, v0, v1, "#Attachments Cannot load attachments yet, legacy message is missing", v2, v3, v4, v5, v6);
}

void __43__MFMailComposeController__loadAttachments__block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _attachmentLoaderFinishedWithOriginalContent:a2];
  uint64_t v3 = MFMessageComposeLoadingSignpostLog();
  os_signpost_id_t v4 = [*(id *)(*(void *)(a1 + 32) + 984) signpostID];
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AF945000, v3, OS_SIGNPOST_INTERVAL_END, v4, "LOAD COMPOSE ATTACHMENTS", "Finish loading attachments enableTelemetry=YES ", v5, 2u);
  }
}

- (void)_attachmentLoaderFinishedWithOriginalContent:(id)a3
{
  id v5 = a3;
  -[_MFMailCompositionContext setOriginalContent:](self->_compositionContext, "setOriginalContent:");
  [(MFMailComposeController *)self _finishedLoadingAllContentAndAttachments];
  os_signpost_id_t v4 = [(_MFMailCompositionContext *)self->_compositionContext deferredAttachments];
  [v4 removeAllObjects];
}

- (void)_loadingContextDidLoadMessage
{
  if ([(_MFMailCompositionContext *)self->_compositionContext includeAttachments])
  {
    [(MFMailComposeController *)self _loadAttachments];
  }
  else
  {
    [(MFMailComposeController *)self _finishedLoadingAllContentAndAttachments];
  }
}

- (BOOL)_shouldPrependBlankLineForAttachments
{
  return [(_MFMailCompositionContext *)self->_compositionContext composeType] == 0;
}

- (void)pickInitialFirstResponder
{
  if ([(MFMailComposeController *)self _isDummyViewController]) {
    return;
  }
  id v17 = [(MFMailComposeController *)self compositionContext];
  char v3 = [v17 isLoadingMessageData];

  if (v3) {
    return;
  }
  os_signpost_id_t v4 = self;
  p_savedFirstResponder = (id *)&v4->_savedFirstResponder;
  id WeakRetained = objc_loadWeakRetained((id *)&v4->_savedFirstResponder);

  if (WeakRetained)
  {
    v18 = (MFMailComposeToField *)objc_loadWeakRetained(p_savedFirstResponder);

    objc_storeWeak(p_savedFirstResponder, 0);
LABEL_18:
    uint64_t v7 = (MFMailComposeController *)v18;
    goto LABEL_19;
  }
  if ([(_MFMailCompositionContext *)v4->_compositionContext showKeyboardImmediately]
    || (uint64_t v7 = v4, *((char *)v4 + 1360) < 0))
  {
    v18 = v4->_toField;

    uint64_t v8 = [(CNComposeRecipientTextView *)v4->_toField addresses];
    uint64_t v9 = [v8 count];

    if (v9)
    {
      __int16 v10 = v4->_subjectField;

      v18 = (MFMailComposeToField *)v10;
    }
    uint64_t v11 = [(MFMailComposeController *)v4 composeWebView];
    uint64_t v12 = v18;
    if (v18 == (MFMailComposeToField *)v4->_subjectField
      && ([(CNComposeRecipientTextView *)v18 text],
          uint64_t v13 = objc_claimAutoreleasedReturnValue(),
          uint64_t v14 = [v13 length],
          v13,
          uint64_t v12 = v18,
          v14))
    {
      unint64_t v15 = v11;

      id v16 = [(MFMailComposeController *)v4 composeWebView];
      [v16 placeCaretAtStartOfBodyField];

      v18 = v15;
    }
    else if (v12 != v11)
    {
LABEL_17:

      goto LABEL_18;
    }
    if ([(MFMailComposeToField *)v11 isLoading]) {
      [(_MFMailCompositionContext *)v4->_compositionContext setShowKeyboardImmediately:0];
    }
    goto LABEL_17;
  }
LABEL_19:
  uint64_t v19 = v7;
  [(MFMailComposeController *)v7 becomeFirstResponder];
  [(MFMailComposeController *)v4 _makeComposeUserActivityCurrent];
}

- (void)saveFirstResponder
{
  id v3 = [(MFMailComposeController *)self firstResponder];
  objc_storeWeak((id *)&self->_savedFirstResponder, v3);
}

- (void)saveAndResignFirstResponder
{
  [(MFMailComposeController *)self saveFirstResponder];
  id v3 = [(MFMailComposeController *)self firstResponder];
  [v3 resignFirstResponder];
}

- (BOOL)isDirty
{
  return *((unsigned char *)self + 1360) & 1;
}

- (void)setIsDirty:(BOOL)a3
{
  *((unsigned char *)self + 1360) = *((unsigned char *)self + 1360) & 0xFE | a3;
}

- (void)_draftContentDidChange
{
  [(MFMailComposeController *)self _updateSendAndCloseEnabled];
  [(MFMailComposeController *)self _makeComposeUserActivityCurrent];

  [(MFMailComposeController *)self _setAutosaveIsValid:0];
}

- (void)_subjectTextChanged:(id)a3
{
  *((unsigned char *)self + 1360) |= 1u;
  [(MFMailComposeController *)self _draftContentDidChange];

  [(MFMailComposeController *)self _invalidateInputContextHistory];
}

- (void)_recipientTextChanged:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)self + 1360);
  *((unsigned char *)self + 1360) = v5 | 1;
  if ((v5 & 1) == 0) {
    [(MFMailComposeController *)self _draftContentDidChange];
  }
  [(MFMailComposeController *)self _invalidateInputContextHistory];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__MFMailComposeController__recipientTextChanged___block_invoke;
  v7[3] = &unk_1E5F7B3A0;
  id v6 = v4;
  id v8 = v6;
  uint64_t v9 = self;
  [(MFMailComposeController *)self _performBlockWithStrongComposeCoordinator:v7];
}

void __49__MFMailComposeController__recipientTextChanged___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = [*(id *)(a1 + 32) object];
  id v4 = *(void **)(*(void *)(a1 + 40) + 1160);

  if (v3 == v4)
  {
    uint64_t v7 = [*(id *)(*(void *)(a1 + 40) + 1160) recipients];
    [v14 setToRecipients:v7];
  }
  else
  {
    char v5 = [*(id *)(a1 + 32) object];
    id v6 = *(void **)(*(void *)(a1 + 40) + 1168);

    if (v5 != v6) {
      goto LABEL_6;
    }
    uint64_t v7 = [*(id *)(*(void *)(a1 + 40) + 1168) recipients];
    [v14 setCcRecipients:v7];
  }

LABEL_6:
  id v8 = [*(id *)(a1 + 32) object];
  uint64_t v9 = [*(id *)(a1 + 40) mailComposeView];
  __int16 v10 = [v9 bccField];

  if (v8 == v10)
  {
    uint64_t v11 = [*(id *)(a1 + 40) mailComposeView];
    uint64_t v12 = [v11 bccField];
    uint64_t v13 = [v12 recipients];
    [v14 setBccRecipients:v13];
  }
}

- (void)_recipientTextChangedForHME
{
  id v5 = [(MFMailComposeController *)self mailComposeView];
  if (([v5 isSending] & 1) == 0 && (objc_msgSend(v5, "isReplyToHME") & 1) == 0)
  {
    sendingEmailAddress = self->_sendingEmailAddress;
    id v4 = [(MFMailComposeController *)self hideMyEmailAddressIfExists];
    LODWORD(sendingEmailAddress) = [(NSString *)sendingEmailAddress isEqualToString:v4];

    if (sendingEmailAddress) {
      [(MFMailComposeController *)self _getHMEEmailFromOriginalAddress:self->_sendingEmailAddress];
    }
  }
}

- (void)_getHMEEmailFromOriginalAddress:(id)a3
{
  id v4 = a3;
  id v5 = [(MFMailComposeController *)self mailComposeView];
  [v5 setLoadingFromAddress:0];
  id v6 = [MEMORY[0x1E4F602C8] sharedInstance];
  if (![v6 isConfigured:0])
  {

    goto LABEL_8;
  }
  BOOL v7 = [(MFMailComposeController *)self _checkWhetherForwardingAddressIsPresent];

  if (!v7)
  {
LABEL_8:
    uint64_t v21 = (void *)MEMORY[0x1E4FB1418];
    uint64_t v22 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v23 = [v22 localizedStringForKey:@"HME_NOT_CONFIGURED_ALERT_TITLE" value:&stru_1F0817A00 table:@"Main"];
    BOOL v24 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    long long v25 = [v24 localizedStringForKey:@"HME_NOT_CONFIGURED_ALERT_DESCRIPTION" value:&stru_1F0817A00 table:@"Main"];
    __int16 v10 = [v21 alertControllerWithTitle:v23 message:v25 preferredStyle:1];

    uint64_t v26 = (void *)MEMORY[0x1E4FB1410];
    id v27 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    long long v28 = [v27 localizedStringForKey:@"OK" value:&stru_1F0817A00 table:@"Main"];
    uint64_t v29 = [v26 actionWithTitle:v28 style:1 handler:0];
    [v10 addAction:v29];

    [(MFMailComposeController *)self _presentModalAlert:v10];
    [(MFMailComposeController *)self setSendingEmailAddress:0];
    goto LABEL_9;
  }
  id v8 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  int v9 = [v8 BOOLForKey:*MEMORY[0x1E4F600C8]];

  if (v9) {
    [(MFMailComposeController *)self _removeAutoBccSendingAddress:v4];
  }
  __int16 v10 = [(MFMailComposeController *)self _allRecipients];
  if ((unint64_t)[v10 count] >= 2)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4FB1418];
    uint64_t v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v13 = [v12 localizedStringForKey:@"HME_MULTIPLE_RECEPIENT_ALERT_TITLE" value:&stru_1F0817A00 table:@"Main"];
    id v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    unint64_t v15 = [v14 localizedStringForKey:@"HME_MULTIPLE_RECEPIENT_ALERT_DESCRIPTION" value:&stru_1F0817A00 table:@"Main"];
    id v16 = [v11 alertControllerWithTitle:v13 message:v15 preferredStyle:1];

    id v17 = (void *)MEMORY[0x1E4FB1410];
    v18 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v19 = [v18 localizedStringForKey:@"OK" value:&stru_1F0817A00 table:@"Main"];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __59__MFMailComposeController__getHMEEmailFromOriginalAddress___block_invoke;
    v45[3] = &unk_1E5F7B3C8;
    v45[4] = self;
    uint64_t v20 = [v17 actionWithTitle:v19 style:1 handler:v45];
    [v16 addAction:v20];

    [(MFMailComposeController *)self _presentModalAlert:v16];
    [(MFMailComposeController *)self setSendingEmailAddress:0];
LABEL_14:

    goto LABEL_9;
  }
  if (![v10 count])
  {
    id v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_super v39 = [v16 localizedStringForKey:@"HIDE_MY_EMAIL_TITLE" value:&stru_1F0817A00 table:@"Main"];
    [(MFMailComposeController *)self _setSendingEmailAddressAsHME:v39];

    goto LABEL_14;
  }
  uint64_t v30 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v31 = [v30 localizedStringForKey:@"HIDE_MY_EMAIL_TITLE" value:&stru_1F0817A00 table:@"Main"];
  sendingEmailAddress = self->_sendingEmailAddress;
  self->_sendingEmailAddress = v31;

  [v5 setLoadingFromAddress:1];
  [(MFMailComposeController *)self _resetSecureCompositionManagerUsingNewAccount:1];
  [(MFMailComposeController *)self _updateSendAndCloseEnabled];
  uint64_t v33 = [MEMORY[0x1E4F602C8] sharedInstance];
  id v34 = [v10 firstObject];
  v35 = [v34 emailAddressValue];
  v36 = [v35 simpleAddress];
  v37 = v36;
  if (v36)
  {
    id v38 = v36;
  }
  else
  {
    id v38 = [v34 stringValue];
  }
  v40 = v38;

  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __59__MFMailComposeController__getHMEEmailFromOriginalAddress___block_invoke_2;
  v41[3] = &unk_1E5F7B410;
  id v42 = v5;
  v43 = self;
  id v44 = v4;
  [v33 generateHideMyEmailAddressForEmailAddress:v40 completion:v41];

LABEL_9:
}

uint64_t __59__MFMailComposeController__getHMEEmailFromOriginalAddress___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1552) = 1;
  return result;
}

void __59__MFMailComposeController__getHMEEmailFromOriginalAddress___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v58 = a2;
  id v5 = a3;
  if (![*(id *)(a1 + 32) isLoadingFromAddress]) {
    goto LABEL_20;
  }
  if (!v58)
  {
    id v6 = [v5 domain];
    if ([v6 isEqualToString:*MEMORY[0x1E4F4ED70]])
    {
      uint64_t v7 = [v5 code];

      if (v7 == -7070)
      {
        id v8 = (void *)MEMORY[0x1E4FB1418];
        int v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        __int16 v10 = [v9 localizedStringForKey:@"HME_2FA_ALERT_TITLE" value:&stru_1F0817A00 table:@"Main"];
        uint64_t v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        uint64_t v12 = [v11 localizedStringForKey:@"HME_2FA_ALERT_DESCRIPTION" value:&stru_1F0817A00 table:@"Main"];
        uint64_t v13 = [v8 alertControllerWithTitle:v10 message:v12 preferredStyle:1];

        id v14 = (void *)MEMORY[0x1E4FB1410];
        unint64_t v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        id v16 = [v15 localizedStringForKey:@"CONTINUE_IN_SETTINGS" value:&stru_1F0817A00 table:@"Main"];
        id v17 = [v14 actionWithTitle:v16 style:0 handler:&__block_literal_global_305];
        [v13 addAction:v17];

        v18 = (void *)MEMORY[0x1E4FB1410];
        uint64_t v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        uint64_t v20 = [v19 localizedStringForKey:@"CANCEL" value:&stru_1F0817A00 table:@"Main"];
        uint64_t v21 = [v18 actionWithTitle:v20 style:1 handler:0];
        [v13 addAction:v21];

        [*(id *)(a1 + 40) _presentModalAlert:v13];
LABEL_19:

        [*(id *)(a1 + 40) setSendingEmailAddress:0];
        [*(id *)(a1 + 32) setLoadingFromAddress:0];
        [*(id *)(a1 + 40) _updateSendAndCloseEnabled];
        goto LABEL_20;
      }
    }
    else
    {
    }
    uint64_t v22 = [v5 domain];
    uint64_t v23 = *MEMORY[0x1E4F4EE90];
    if ([v22 isEqualToString:*MEMORY[0x1E4F4EE90]])
    {
      uint64_t v24 = [v5 code];

      if (v24 == -11002)
      {
        long long v25 = (void *)MEMORY[0x1E4FB1418];
        uint64_t v26 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        id v27 = [v26 localizedStringForKey:@"HME_EMAIL_LIMIT_REACHED_TITLE" value:&stru_1F0817A00 table:@"Main"];
        long long v28 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        uint64_t v29 = [v28 localizedStringForKey:@"HME_EMAIL_LIMIT_REACHED_DESCRIPTION" value:&stru_1F0817A00 table:@"Main"];
        uint64_t v13 = [v25 alertControllerWithTitle:v27 message:v29 preferredStyle:1];

        uint64_t v30 = (void *)MEMORY[0x1E4FB1410];
        uint64_t v31 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        uint64_t v32 = [v31 localizedStringForKey:@"OK" value:&stru_1F0817A00 table:@"Main"];
        uint64_t v33 = [v30 actionWithTitle:v32 style:1 handler:0];
        [v13 addAction:v33];

        [*(id *)(a1 + 40) _presentModalAlert:v13];
        goto LABEL_19;
      }
    }
    else
    {
    }
    id v34 = [v5 domain];
    if ([v34 isEqualToString:v23])
    {
      uint64_t v35 = [v5 code];

      if (v35 == -11003)
      {
        v36 = (void *)MEMORY[0x1E4FB1418];
        v37 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        id v38 = [v37 localizedStringForKey:@"HME_MAX_LIMIT_TITLE" value:&stru_1F0817A00 table:@"Main"];
        objc_super v39 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v40 = [v39 localizedStringForKey:@"HME_MAX_LIMIT_DESCRIPTION" value:&stru_1F0817A00 table:@"Main"];
        uint64_t v13 = [v36 alertControllerWithTitle:v38 message:v40 preferredStyle:1];

        int64_t v41 = (void *)MEMORY[0x1E4FB1410];
        id v42 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v43 = [v42 localizedStringForKey:@"CONTINUE_IN_SETTINGS" value:&stru_1F0817A00 table:@"Main"];
        id v44 = [v41 actionWithTitle:v43 style:0 handler:&__block_literal_global_321];
        [v13 addAction:v44];

        v45 = (void *)MEMORY[0x1E4FB1410];
        v46 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v47 = [v46 localizedStringForKey:@"CANCEL" value:&stru_1F0817A00 table:@"Main"];
        v48 = [v45 actionWithTitle:v47 style:1 handler:0];
        [v13 addAction:v48];

        [*(id *)(a1 + 40) _presentModalAlert:v13];
        goto LABEL_19;
      }
    }
    else
    {
    }
    BOOL v49 = (void *)MEMORY[0x1E4FB1418];
    int v50 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v51 = [v50 localizedStringForKey:@"HME_UNKNOWN_ERROR_TITLE" value:&stru_1F0817A00 table:@"Main"];
    id v52 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v53 = [v52 localizedStringForKey:@"HME_UNKNOWN_ERROR_DESCRIPTION" value:&stru_1F0817A00 table:@"Main"];
    uint64_t v13 = [v49 alertControllerWithTitle:v51 message:v53 preferredStyle:1];

    v54 = (void *)MEMORY[0x1E4FB1410];
    id v55 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v56 = [v55 localizedStringForKey:@"OK" value:&stru_1F0817A00 table:@"Main"];
    long long v57 = [v54 actionWithTitle:v56 style:1 handler:0];
    [v13 addAction:v57];

    [*(id *)(a1 + 40) _presentModalAlert:v13];
    goto LABEL_19;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "_setSendingEmailAddressAsHME:")) {
    [*(id *)(a1 + 40) _updateAutoBccSendingAddress:*(void *)(a1 + 48) withNewSendingAddress:v58];
  }
  [*(id *)(a1 + 32) setLoadingFromAddress:0];
  [*(id *)(a1 + 40) _resetSecureCompositionManagerUsingNewAccount:1];
  [*(id *)(a1 + 40) _updateSendAndCloseEnabled];
LABEL_20:
}

void __59__MFMailComposeController__getHMEEmailFromOriginalAddress___block_invoke_3()
{
  id v1 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  v0 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=APPLE_ACCOUNT&path=PASSWORD_AND_SECURITY"];
  [v1 openSensitiveURL:v0 withOptions:0];
}

void __59__MFMailComposeController__getHMEEmailFromOriginalAddress___block_invoke_4()
{
  id v1 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  v0 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/PRIVATE_EMAIL_MANAGE"];
  [v1 openSensitiveURL:v0 withOptions:0];
}

- (BOOL)_checkWhetherForwardingAddressIsPresent
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = [(MFMailComposeController *)self emailAddresses];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        uint64_t v7 = [MEMORY[0x1E4F602C8] sharedInstance];
        id v8 = [v7 forwardingEmailForPrimaryAccount];
        LOBYTE(v6) = objc_msgSend(v6, "ef_caseInsensitiveIsEqualToString:", v8);

        if (v6)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)setHideMyEmailAddressForMailToURLAddressString:(id)a3
{
  id v4 = a3;
  if (v4) {
    [(MFMailComposeController *)self setHideMyEmailAddressIfExists:v4];
  }
}

- (BOOL)isQuickReply
{
  uint64_t v2 = [(MFMailComposeController *)self mailComposeView];
  char v3 = [v2 isQuickReply];

  return v3;
}

- (void)setIsQuickReply:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MFMailComposeController *)self mailComposeView];
  [v4 setQuickReply:v3];
}

- (void)_composeViewDidDraw:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!self->_initialAttachmentCount)
  {
    [v7 postNotificationName:@"_MFMailComposeViewControllerFirstDrawNotification" object:self];
    id v4 = [(MFMailComposeController *)self view];
    [v7 removeObserver:self name:@"MailComposeViewDidDraw" object:v4];
  }
  if ([(MFMailComposeController *)self markupReplyAttachmentLoadingProgress] == 1)
  {
    dispatch_time_t v5 = dispatch_time(0, 100000000);
    dispatch_after(v5, MEMORY[0x1E4F14428], &__block_literal_global_330);
    [(MFMailComposeController *)self setMarkupReplyAttachmentLoadingProgress:2];
    id v6 = [(MFMailComposeController *)self view];
    [v7 removeObserver:self name:@"MailComposeViewDidDraw" object:v6];
  }
}

- (void)didInsertBodyText:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [v5 length];
  if (v4) {
    LOWORD(v4) = objc_msgSend(v5, "characterAtIndex:", objc_msgSend(v5, "length") - 1);
  }
  self->_lastTypedCharacter = v4;
}

- (id)sendingEmailAddress
{
  sendingEmailAddress = self->_sendingEmailAddress;
  if (!sendingEmailAddress)
  {
    uint64_t v4 = [(MFMailComposeController *)self _defaultAccount];
    id v5 = v4;
    if (v4)
    {
      id v6 = [v4 firstEmailAddress];
      id v7 = [v5 fullUserName];
      id v8 = (void *)[objc_alloc(MEMORY[0x1E4F60800]) initWithString:v6];
      [v8 setDisplayName:v7];
      int v9 = [v8 emailAddressValue];
      long long v10 = [v9 stringValue];
      [(MFMailComposeController *)self setSendingEmailAddress:v10];
    }
    sendingEmailAddress = self->_sendingEmailAddress;
  }

  return sendingEmailAddress;
}

- (id)sendingAccountProxy
{
  BOOL v3 = [(MFMailComposeController *)self sendingEmailAddress];
  uint64_t v4 = [(MFMailComposeController *)self accountProxyGenerator];
  id v5 = [v4 accountProxyContainingEmailAddress:v3 includingInactive:0 originatingBundleID:self->_originatingBundleID sourceAccountManagement:self->_sourceAccountManagement];

  return v5;
}

- (id)sendingEmailAddressIfExists
{
  return self->_sendingEmailAddress;
}

- (id)allRecipientNamesAndAddresses
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v4 = [MEMORY[0x1E4F1CA80] set];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = [(MFMailComposeController *)self _allRecipientViews];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    obuint64_t j = v5;
    uint64_t v20 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        int v9 = objc_msgSend(v8, "recipients", obj);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v10)
        {
          uint64_t v11 = *(void *)v22;
          do
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v22 != v11) {
                objc_enumerationMutation(v9);
              }
              long long v13 = *(void **)(*((void *)&v21 + 1) + 8 * j);
              id v14 = [v13 uncommentedAddress];
              objc_msgSend(v3, "ef_addOptionalObject:", v14);
              uint64_t v15 = [v13 displayString];
              id v16 = v15;
              if (v15 && ([v15 isEqualToString:v14] & 1) == 0) {
                [v4 addObject:v16];
              }
            }
            uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v10);
        }
      }
      id v5 = obj;
      uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v6);
  }

  id v17 = [MEMORY[0x1E4F60DF0] pairWithFirst:v4 second:v3];

  return v17;
}

- (id)_originalContentMessagesIfExists
{
  if (_os_feature_enabled_impl() && EMIsGreymatterAvailableWithOverride())
  {
    BOOL v3 = [(MFMailComposeController *)self originalContentMessagesFuture];
    uint64_t v4 = [v3 resultIfAvailable];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)_senderEmailAddress
{
  uint64_t v2 = [(MFMailComposeController *)self sendingEmailAddressIfExists];
  if (v2) {
    BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4F607F8]) initWithString:v2];
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (id)_recipientsFromRecipientTextView:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    id v5 = [v3 recipients];
    uint64_t v6 = objc_msgSend(v5, "ef_map:", &__block_literal_global_336);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

id __60__MFMailComposeController__recipientsFromRecipientTextView___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 address];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F607F8]) initWithString:v2];

  return v3;
}

- (BOOL)_hasCustomSignatureConfigured
{
  id v3 = [(MFMailComposeController *)self hasCustomSignature];
  uint64_t v4 = v3;
  if (v3)
  {
    char v5 = [v3 BOOLValue];
  }
  else
  {
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithBool:", -[MFMailSignatureController hasCustomSigntureForSender:](self->_signatureController, "hasCustomSigntureForSender:", self->_sendingEmailAddress));
    [(MFMailComposeController *)self setHasCustomSignature:v6];

    char v5 = [0 BOOLValue];
  }
  BOOL v7 = v5;

  return v7;
}

- (id)_originalMessageCategorySubtype
{
  if ((_os_feature_enabled_impl() & 1) != 0
    || _os_feature_enabled_impl() && EMIsGreymatterSupportedWithOverride())
  {
    id v3 = [(MFMailComposeController *)self compositionContext];
    uint64_t v4 = [v3 originalMessage];

    char v5 = [v4 category];
    [v5 subtype];
    uint64_t v6 = EMStringFromSubtype();
    BOOL v7 = [v6 lowercaseString];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)inputContextHistory
{
  if (_os_feature_enabled_impl() && EMIsGreymatterAvailableWithOverride())
  {
    id v3 = objc_alloc(MEMORY[0x1E4F73E50]);
    id v16 = [(MFMailComposeController *)self smartReplyThreadIdentifier];
    uint64_t v4 = [(MFMailComposeController *)self _senderEmailAddress];
    char v5 = -[MFMailComposeController _recipientsFromRecipientTextView:]((uint64_t)self, self->_toField);
    uint64_t v6 = -[MFMailComposeController _recipientsFromRecipientTextView:]((uint64_t)self, self->_ccField);
    uint64_t v7 = [(MFMailComposeController *)self subject];
    id v8 = (void *)v7;
    if (v7) {
      int v9 = (__CFString *)v7;
    }
    else {
      int v9 = &stru_1F0817A00;
    }
    BOOL v10 = [(MFMailComposeController *)self _hasCustomSignatureConfigured];
    uint64_t v11 = [(MFMailComposeController *)self _originalMessageCategorySubtype];
    long long v12 = [(MFMailComposeController *)self _originalContentMessagesIfExists];
    LOBYTE(v15) = 0;
    long long v13 = (void *)[v3 initWithThreadIdentifier:v16 senderEmailAddress:v4 toRecipients:v5 ccRecipients:v6 subject:v9 hasCustomSignature:v10 showSmartReplySuggestions:v15 originalMessageCategorySubtype:v11 originalContentMessages:v12];
  }
  else
  {
    long long v13 = 0;
  }

  return v13;
}

- (void)_updateManagedPasteboardOwner
{
  id v5 = [MEMORY[0x1E4F77C70] accountContainingEmailAddress:self->_sendingEmailAddress];
  int v3 = [v5 sourceIsManaged];

  if (v3) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 1;
  }
  id v6 = [(MFMailComposeController *)self mailComposeView];
  [v6 _setDataOwnerForCopy:v4];

  id v7 = [(MFMailComposeController *)self mailComposeView];
  [v7 _setDataOwnerForPaste:v4];
}

- (BOOL)isAddressHideMyEmail:(id)a3
{
  id v4 = a3;
  if (v4
    && ([MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v5 localizedStringForKey:@"HIDE_MY_EMAIL_TITLE" value:&stru_1F0817A00 table:@"Main"], v6 = objc_claimAutoreleasedReturnValue(), char v7 = objc_msgSend(v4, "isEqualToString:", v6), v6, v5, (v7 & 1) != 0))
  {
    char v8 = 1;
  }
  else
  {
    uint64_t v9 = [(MFMailComposeController *)self hideMyEmailAddressIfExists];
    BOOL v10 = (void *)v9;
    char v8 = 0;
    if (v4 && v9)
    {
      uint64_t v11 = [(MFMailComposeController *)self hideMyEmailAddressIfExists];
      char v8 = [v4 isEqualToString:v11];
    }
  }

  return v8;
}

- (BOOL)isHideMyEmailMessage
{
  uint64_t v2 = [(MFMailComposeController *)self hideMyEmailAddressIfExists];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (void)setSendingEmailAddress:(id)a3
{
  id v6 = a3;
  id v4 = self->_sendingEmailAddress;
  if ([(MFMailComposeController *)self isAddressHideMyEmail:v6])
  {
    [(MFMailComposeController *)self _getHMEEmailFromOriginalAddress:self->_sendingEmailAddress];
  }
  else
  {
    BOOL v5 = [(MFMailComposeController *)self isAddressHideMyEmail:v4];
    if ([(MFMailComposeController *)self _setSendingEmailAddress:v6]) {
      [(MFMailComposeController *)self _updateAutoBccSendingAddress:v4 withNewSendingAddress:v6 alwaysAdd:v5];
    }
  }
  [(MFMailComposeController *)self _presentSenderCollaborationAlertIfNecessaryForSendingAddress:self->_sendingEmailAddress];
}

- (BOOL)_setSendingEmailAddress:(id)a3
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v4 = (NSString *)a3;
  if (!v4)
  {
    BOOL v5 = [(MFMailComposeController *)self _defaultAccount];
    uint64_t v6 = [v5 firstEmailAddress];

    id v4 = (NSString *)v6;
  }
  v56 = v4;
  if (v4 != self->_sendingEmailAddress || ![(NSString *)v4 isEqualToString:v4])
  {
    v54 = [(MFMailComposeController *)self emailAddresses];
    char v8 = (void *)[objc_alloc(MEMORY[0x1E4F607F8]) initWithString:v56];
    uint64_t v9 = [v8 simpleAddress];

    unint64_t sendingEmailAddressIndex = self->_sendingEmailAddressIndex;
    long long v57 = (void *)v9;
    id v58 = self;
    if (sendingEmailAddressIndex == 0x7FFFFFFFFFFFFFFFLL
      || sendingEmailAddressIndex >= [v54 count]
      || ([v54 objectAtIndex:self->_sendingEmailAddressIndex],
          uint64_t v11 = objc_claimAutoreleasedReturnValue(),
          char v12 = [v11 isEqualToString:v9],
          v11,
          (v12 & 1) == 0))
    {
      self->_unint64_t sendingEmailAddressIndex = 0x7FFFFFFFFFFFFFFFLL;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      id v13 = v54;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v67 objects:v73 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v68;
        while (2)
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v68 != v15) {
              objc_enumerationMutation(v13);
            }
            id v17 = *(void **)(*((void *)&v67 + 1) + 8 * i);
            if (![v17 caseInsensitiveCompare:v9])
            {
              v58->_unint64_t sendingEmailAddressIndex = [v13 indexOfObject:v17];
              goto LABEL_19;
            }
          }
          uint64_t v14 = [v13 countByEnumeratingWithState:&v67 objects:v73 count:16];
          if (v14) {
            continue;
          }
          break;
        }
      }
LABEL_19:

      self = v58;
    }
    if (self->_sendingEmailAddressIndex == 0x7FFFFFFFFFFFFFFFLL)
    {
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      v18 = [(MFMailComposeController *)self _availableAccountProxies];
      uint64_t v19 = [v18 countByEnumeratingWithState:&v63 objects:v72 count:16];
      if (v19)
      {
        obuint64_t j = v18;
        uint64_t v20 = *(void *)v64;
        while (2)
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v64 != v20) {
              objc_enumerationMutation(obj);
            }
            long long v22 = *(void **)(*((void *)&v63 + 1) + 8 * j);
            id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            long long v61 = 0u;
            long long v62 = 0u;
            long long v59 = 0u;
            long long v60 = 0u;
            long long v24 = (void *)MEMORY[0x1E4F607F8];
            long long v25 = [v22 fromEmailAddressesIncludingDisabled];
            long long v26 = [v24 emailAddressesFromStrings:v25 invalidAddresses:0];

            uint64_t v27 = [v26 countByEnumeratingWithState:&v59 objects:v71 count:16];
            if (v27)
            {
              uint64_t v28 = *(void *)v60;
              do
              {
                for (uint64_t k = 0; k != v27; ++k)
                {
                  if (*(void *)v60 != v28) {
                    objc_enumerationMutation(v26);
                  }
                  uint64_t v30 = [*(id *)(*((void *)&v59 + 1) + 8 * k) simpleAddress];
                  [v23 addObject:v30];
                }
                uint64_t v27 = [v26 countByEnumeratingWithState:&v59 objects:v71 count:16];
              }
              while (v27);
            }

            if ([v23 containsObject:v57])
            {
              uint64_t v31 = [v22 firstEmailAddress];

              v58->_unint64_t sendingEmailAddressIndex = [v54 indexOfObject:v31];
              goto LABEL_38;
            }
          }
          uint64_t v19 = [obj countByEnumeratingWithState:&v63 objects:v72 count:16];
          if (v19) {
            continue;
          }
          break;
        }
        uint64_t v31 = (uint64_t)v56;
LABEL_38:
        v18 = obj;
      }
      else
      {
        uint64_t v31 = (uint64_t)v56;
      }

      uint64_t v32 = v58;
      if (v58->_sendingEmailAddressIndex == 0x7FFFFFFFFFFFFFFFLL)
      {
        BOOL v7 = 0;
        v56 = (void *)v31;
LABEL_57:
        [(MFMailComposeController *)v32 _resetSecureCompositionManagerUsingNewAccount:1];
        [(MFMailComposeController *)v32 _updateManagedPasteboardOwner];

        goto LABEL_58;
      }
      v56 = (void *)v31;
    }
    uint64_t v33 = [v56 copy];
    sendingEmailAddress = v58->_sendingEmailAddress;
    v58->_sendingEmailAddress = (NSString *)v33;

    uint64_t v35 = (void *)[objc_alloc(MEMORY[0x1E4F607F8]) initWithString:v58->_sendingEmailAddress];
    v36 = [v35 simpleAddress];

    int HasSafeDomain = MFAddressHasSafeDomain(v36);
    [(MFMailComposeController *)v58 setHideMyEmailAddressIfExists:0];
    id v38 = [(MFMailComposeController *)v58 mailComposeView];
    objc_super v39 = [v38 fromField];
    [v39 setSelectedAddress:v36];

    v40 = [v38 multiField];
    [v40 setAccountDescription:v36];

    int64_t v41 = [v38 multiField];
    [v41 setAccountHasUnsafeDomain:HasSafeDomain ^ 1u];

    id v42 = [v38 multiField];
    [v42 setAccountAutoselected:0];

    v43 = [(MFMailComposeController *)v58 sendingAccountProxy];
    uint64_t v44 = [v43 supportsThreadOperations];
    v45 = [v38 subjectField];
    [v45 setAllowsNotifyOption:v44];

    v46 = [v38 webContentVariationField];
    v47 = [(MFMailComposeController *)v58 contentVariationName];
    [v46 setSelectedContentVariationLabel:v47];

    [(MFMailComposeController *)v58 updateSignature];
    if ([(MFMailComposeController *)v58 composeType])
    {
      v48 = [MEMORY[0x1E4F77C70] accountContainingEmailAddress:v58->_sendingEmailAddress];
      BOOL v49 = v48;
      if (v48)
      {
        int v50 = [v48 sourceIsManaged] ? 2 : 1;
        if (v50 != v58->_sourceAccountManagement)
        {
          v58->_sourceAccountManagement = v50;
          -[_MFMailCompositionContext setSourceAccountManagement:](v58->_compositionContext, "setSourceAccountManagement:");
          [(MFMailComposeController *)v58 _accountsChanged:0];
        }
      }
    }
    else
    {
      BOOL v49 = 0;
    }
    if (!v58->_originalSendingEmailAddress) {
      goto LABEL_55;
    }
    if (!-[NSString isEqualToString:](v58->_sendingEmailAddress, "isEqualToString:")) {
      *((unsigned char *)v58 + 1360) |= 1u;
    }
    if (!v58->_originalSendingEmailAddress)
    {
LABEL_55:
      uint64_t v51 = [v56 copy];
      originalSendingEmailAddress = v58->_originalSendingEmailAddress;
      v58->_originalSendingEmailAddress = (NSString *)v51;
    }
    BOOL v7 = 1;
    uint64_t v32 = v58;
    goto LABEL_57;
  }
  BOOL v7 = 0;
LABEL_58:

  return v7;
}

- (void)setSendingEmailAddressAsHME:(id)a3 isComposeTypeReply:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  -[MFMailComposeController _setSendingEmailAddressAsHME:](self, "_setSendingEmailAddressAsHME:");
  if (v4)
  {
    uint64_t v6 = [(MFMailComposeController *)self mailComposeView];
    [v6 setReplyToHME:1];
  }
}

- (BOOL)_setSendingEmailAddressAsHME:(id)a3
{
  BOOL v4 = (NSString *)a3;
  BOOL v5 = v4;
  if (!v4)
  {
    [(MFMailComposeController *)self _setSendingEmailAddress:0];
LABEL_10:
    BOOL v22 = 0;
    goto LABEL_11;
  }
  p_sendingEmailAddress = &self->_sendingEmailAddress;
  if (self->_sendingEmailAddress == v4 && [(NSString *)v4 isEqualToString:v4]) {
    goto LABEL_10;
  }
  id v7 = [(MFMailComposeController *)self _emailAddressesWithHME];
  char v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v9 = [v8 localizedStringForKey:@"HIDE_MY_EMAIL_TITLE" value:&stru_1F0817A00 table:@"Main"];
  self->_unint64_t sendingEmailAddressIndex = [v7 indexOfObject:v9];

  if (self->_sendingEmailAddressIndex == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_10;
  }
  BOOL v10 = (void *)[(NSString *)v5 copy];
  uint64_t v11 = *p_sendingEmailAddress;
  objc_storeStrong((id *)&self->_sendingEmailAddress, v10);
  [(MFMailComposeController *)self setHideMyEmailAddressIfExists:v10];
  char v12 = [(MFMailComposeController *)self mailComposeView];
  id v13 = [v12 fromField];
  [v13 setSelectedAddressToHME:v10];

  uint64_t v14 = [v12 multiField];
  [v14 setAccountDescription:v10];

  uint64_t v15 = [v12 multiField];
  [v15 setAccountHasUnsafeDomain:0];

  id v16 = [v12 multiField];
  [v16 setAccountAutoselected:0];

  id v17 = [(MFMailComposeController *)self sendingAccountProxy];
  uint64_t v18 = [v17 supportsThreadOperations];
  uint64_t v19 = [v12 subjectField];
  [v19 setAllowsNotifyOption:v18];

  uint64_t v20 = [v12 webContentVariationField];
  long long v21 = [(MFMailComposeController *)self contentVariationName];
  [v20 setSelectedContentVariationLabel:v21];

  [(MFMailComposeController *)self removeSignature];
  if (v11 && ![(NSString *)*p_sendingEmailAddress isEqualToString:v11]) {
    *((unsigned char *)self + 1360) |= 1u;
  }

  BOOL v22 = 1;
LABEL_11:

  return v22;
}

- (void)setCaretPosition:(unint64_t)a3
{
  id v4 = [(MFMailComposeController *)self composeWebView];
  [v4 setCaretPosition:a3];
}

- (void)changeQuoteLevel:(int64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v5 = MFLogGeneral();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    int64_t v8 = a3;
    _os_log_impl(&dword_1AF945000, v5, OS_LOG_TYPE_DEFAULT, "#CompositionServices Quote level changed: %ld", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v6 = [(MFMailComposeController *)self composeWebView];
  [v6 changeQuoteLevel:a3];
}

- (void)stripCustomBodyIdentifiers
{
  id v2 = [(MFMailComposeController *)self composeWebView];
  [v2 stripCustomBodyIdentifiers];
}

- (id)_selectedAttachmentURLs
{
  return 0;
}

- (void)markupAttachment:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = MFLogGeneral();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF945000, v5, OS_LOG_TYPE_DEFAULT, "#CompositionServices Attachment markup started", buf, 2u);
  }

  if (v4 && [v4 contentTypeConformsToMarkup])
  {
    uint64_t v6 = [v4 contentTypeIdentifier];
    int v7 = [v4 isDataAvailableLocally];
    if (v6) {
      int v8 = v7;
    }
    else {
      int v8 = 0;
    }
    if (v8 == 1)
    {
      uint64_t v9 = [_MFQLItemDataProvider alloc];
      BOOL v10 = [v4 fetchLocalData];
      uint64_t v11 = [v4 fileName];
      char v12 = [(_MFQLItemDataProvider *)v9 initWithData:v10 contentType:v6 previewTitle:v11];

      id v13 = [(_MFQLItemDataProvider *)v12 item];
      if (v13)
      {
        [(MFMailComposeController *)self setPreviewingAttachment:v4];
        id v14 = objc_alloc(getQLPreviewControllerClass());
        v24[0] = v13;
        uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
        id v16 = (void *)[v14 initWithPreviewItems:v15];

        objc_msgSend(v16, "setIsContentManaged:", -[MFMailComposeController isManagedAccount](self, "isManagedAccount"));
        [v16 setAppearanceActions:4];
        [v16 setDelegate:self];
        id v17 = [(MFMailComposeController *)self _backgroundColorForMarkupController];
        [v16 setBackgroundColor:v17];

        [(MFMailComposeController *)self setPreviewController:v16];
        [v16 setModalPresentationStyle:5];
        uint64_t v20 = MEMORY[0x1E4F143A8];
        long long v21 = self;
        uint64_t v18 = v16;
        BOOL v22 = v18;
        uint64_t v19 = objc_msgSend(MEMORY[0x1E4F60F28], "mainThreadScheduler", v20, 3221225472, __44__MFMailComposeController_markupAttachment___block_invoke, &unk_1E5F79038, v21);
        [v19 performBlock:&v20];
      }
      else
      {
        uint64_t v18 = MFComposeLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[MFMailComposeController markupAttachment:]();
        }
      }
    }
  }
}

void __44__MFMailComposeController_markupAttachment___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) saveFirstResponder];
  [*(id *)(a1 + 32) _dismissPresentedHalfSheet];
  id v2 = [*(id *)(a1 + 32) parentViewController];
  [v2 presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (void)insertDrawing
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  BOOL v3 = MFLogGeneral();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF945000, v3, OS_LOG_TYPE_DEFAULT, "#CompositionServices Insert drawing started", buf, 2u);
  }

  id v4 = [(MFMailComposeController *)self mailComposeView];
  if ([v4 isQuickReply])
  {
    BOOL v5 = [(MFMailComposeController *)self view];
    uint64_t v6 = [v5 window];
    [v6 bounds];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    double v12 = v11;
    double v14 = v13;
  }
  else
  {
    BOOL v5 = [(MFMailComposeController *)self view];
    [v5 bounds];
    CGFloat v8 = v15;
    CGFloat v10 = v16;
    double v12 = v17;
    double v14 = v18;
  }

  uint64_t v19 = EMLogCompose();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v47.origin.x = v8;
    v47.origin.y = v10;
    v47.size.width = v12;
    v47.size.height = v14;
    uint64_t v20 = NSStringFromCGRect(v47);
    *(_DWORD *)buf = 138543362;
    id v41 = v20;
    _os_log_impl(&dword_1AF945000, v19, OS_LOG_TYPE_DEFAULT, "Will use %{public}@ as drawing canvas frame", buf, 0xCu);
  }
  long long v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", v12, v14);
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __40__MFMailComposeController_insertDrawing__block_invoke;
  v38[3] = &__block_descriptor_64_e40_v16__0__UIGraphicsImageRendererContext_8l;
  *(CGFloat *)&v38[4] = v8;
  *(CGFloat *)&v38[5] = v10;
  *(double *)&v38[6] = v12;
  *(double *)&v38[7] = v14;
  BOOL v22 = [v21 PNGDataWithActions:v38];

  id v23 = [_MFQLItemDataProvider alloc];
  long long v24 = [(MFMailComposeController *)self _nextDrawingName];
  long long v25 = [(_MFQLItemDataProvider *)v23 initWithData:v22 contentType:*MEMORY[0x1E4F22678] previewTitle:v24];

  long long v26 = [(_MFQLItemDataProvider *)v25 item];
  if (v26)
  {
    id v27 = objc_alloc(getQLPreviewControllerClass());
    objc_super v39 = v26;
    uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
    uint64_t v29 = (void *)[v27 initWithPreviewItems:v28];

    [v29 setAppearanceActions:4];
    [v29 setDelegate:self];
    uint64_t v30 = [(MFMailComposeController *)self _backgroundColorForMarkupController];
    [v29 setBackgroundColor:v30];

    self->_insertingDrawing = 1;
    [(MFMailComposeController *)self setPreviewController:v29];
    [v29 setModalPresentationStyle:5];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __40__MFMailComposeController_insertDrawing__block_invoke_349;
    v36[3] = &unk_1E5F79038;
    v36[4] = self;
    uint64_t v31 = v29;
    v37 = v31;
    uint64_t v32 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
    [v32 performBlock:v36];
  }
  else
  {
    uint64_t v31 = MFComposeLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      uint64_t v33 = (objc_class *)objc_opt_class();
      NSStringFromClass(v33);
      id v34 = (id)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v22, "length"));
        uint64_t v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v35 = @"nil";
      }
      *(_DWORD *)buf = 138543874;
      id v41 = v34;
      __int16 v42 = 2048;
      v43 = self;
      __int16 v44 = 2114;
      v45 = v35;
      _os_log_error_impl(&dword_1AF945000, v31, OS_LOG_TYPE_ERROR, "<%{public}@: %p> Failed to insert drawing, image data: %{public}@", buf, 0x20u);
      if (v22) {
    }
      }
  }
}

void __40__MFMailComposeController_insertDrawing__block_invoke(double *a1, void *a2)
{
  id v5 = a2;
  BOOL v3 = (CGContext *)[v5 CGContext];
  id v4 = [MEMORY[0x1E4FB1618] whiteColor];
  CGContextSetFillColorWithColor(v3, (CGColorRef)[v4 CGColor]);

  objc_msgSend(v5, "fillRect:", a1[4], a1[5], a1[6], a1[7]);
}

void __40__MFMailComposeController_insertDrawing__block_invoke_349(uint64_t a1)
{
  [*(id *)(a1 + 32) saveFirstResponder];
  [*(id *)(a1 + 32) _dismissPresentedHalfSheet];
  id v2 = [*(id *)(a1 + 32) parentViewController];
  [v2 presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (id)_nextDrawingName
{
  BOOL v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"DEFAULT_DRAWING_NAME" value:&stru_1F0817A00 table:@"Main"];

  unint64_t drawingSequenceNumber = self->_drawingSequenceNumber;
  if (drawingSequenceNumber)
  {
    uint64_t v6 = NSString;
    unint64_t v7 = drawingSequenceNumber + 1;
    self->_unint64_t drawingSequenceNumber = v7;
    id v8 = [v6 localizedStringWithFormat:@"%@ %ld", v4, v7];
  }
  else
  {
    self->_unint64_t drawingSequenceNumber = 1;
    id v8 = v4;
  }
  double v9 = v8;

  return v9;
}

- (void)scanDocument
{
  BOOL v3 = MFLogGeneral();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1AF945000, v3, OS_LOG_TYPE_DEFAULT, "#CompositionServices Document scanning started", v6, 2u);
  }

  [(MFMailComposeController *)self _dismissPresentedHalfSheet];
  id v4 = objc_opt_new();
  [v4 setDelegate:self];
  [(MFMailComposeController *)self setDocumentCameraViewController:v4];
  [(MFMailComposeController *)self saveFirstResponder];
  id v5 = [(MFMailComposeController *)self parentViewController];
  [v5 presentViewController:v4 animated:1 completion:0];
}

- (void)documentCameraViewController:(id)a3 didFinishWithScan:(id)a4
{
  id v5 = a4;
  uint64_t v6 = MFLogGeneral();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF945000, v6, OS_LOG_TYPE_DEFAULT, "#CompositionServices Document scanning did finish scan", buf, 2u);
  }

  unint64_t v7 = objc_alloc_init(MFScannedDocumentConverter);
  id v8 = [(MFScannedDocumentConverter *)v7 pdfDocumentFromScannedDocument:v5];
  double v9 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__MFMailComposeController_documentCameraViewController_didFinishWithScan___block_invoke;
  v12[3] = &unk_1E5F7B478;
  v12[4] = self;
  [v8 onScheduler:v9 addSuccessBlock:v12];

  CGFloat v10 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __74__MFMailComposeController_documentCameraViewController_didFinishWithScan___block_invoke_2;
  v11[3] = &unk_1E5F7B4A0;
  v11[4] = self;
  [v8 onScheduler:v10 addFailureBlock:v11];

  [(MFMailComposeController *)self _documentCameraViewControllerDidFinish];
}

uint64_t __74__MFMailComposeController_documentCameraViewController_didFinishWithScan___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 1208) insertScannedDocumentWithData:a2];
}

void __74__MFMailComposeController_documentCameraViewController_didFinishWithScan___block_invoke_2(uint64_t a1, void *a2)
{
  v15[8] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = MFLogGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v3, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __74__MFMailComposeController_documentCameraViewController_didFinishWithScan___block_invoke_2_cold_1();
  }

  id v5 = (void *)MEMORY[0x1E4FB1418];
  uint64_t v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  unint64_t v7 = [v6 localizedStringForKey:@"SCAN_DOCUMENT_FAILED_TITLE" value:&stru_1F0817A00 table:@"Main"];
  id v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  double v9 = [v8 localizedStringForKey:@"SCAN_DOCUMENT_FAILED_EXPLAIN" value:&stru_1F0817A00 table:@"Main"];
  CGFloat v10 = [v5 alertControllerWithTitle:v7 message:v9 preferredStyle:1];

  double v11 = (void *)MEMORY[0x1E4FB1410];
  double v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  double v13 = [v12 localizedStringForKey:@"OK" value:&stru_1F0817A00 table:@"Main"];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __74__MFMailComposeController_documentCameraViewController_didFinishWithScan___block_invoke_365;
  v15[3] = &unk_1E5F7B3C8;
  v15[4] = *(void *)(a1 + 32);
  double v14 = [v11 actionWithTitle:v13 style:1 handler:v15];
  [v10 addAction:v14];

  [*(id *)(a1 + 32) _presentModalAlert:v10];
}

uint64_t __74__MFMailComposeController_documentCameraViewController_didFinishWithScan___block_invoke_365(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishPopoverAlertClosingComposition:0];
}

- (void)documentCameraViewControllerDidCancel:(id)a3
{
  id v4 = MFLogGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1AF945000, v4, OS_LOG_TYPE_DEFAULT, "#CompositionServices Document scanning was cancelled", v5, 2u);
  }

  [(MFMailComposeController *)self _documentCameraViewControllerDidFinish];
}

- (void)_documentCameraViewControllerDidFinish
{
  id v3 = MFLogGeneral();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1AF945000, v3, OS_LOG_TYPE_DEFAULT, "#CompositionServices Document scanning finished", v5, 2u);
  }

  [(MFMailComposeController *)self dismissViewControllerAnimated:1 completion:0];
  [(MFMailComposeController *)self setDocumentCameraViewController:0];
  id v4 = [(MFMailComposeController *)self mailComposeView];
  [v4 restoreFirstResponder];

  [(MFMailComposeController *)self _updateSendAndCloseEnabled];
}

- (id)_backgroundColorForMarkupController
{
  return (id)[MEMORY[0x1E4FB1618] colorWithWhite:0.909803922 alpha:1.0];
}

- (int64_t)previewController:(id)a3 editingModeForPreviewItem:(id)a4
{
  return 2;
}

- (void)previewControllerDidDismiss:(id)a3
{
  id v4 = MFLogGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1AF945000, v4, OS_LOG_TYPE_DEFAULT, "#CompositionServices Drawing controller dismissed", v5, 2u);
  }

  self->_insertingDrawing = 0;
  [(MFMailComposeController *)self setPreviewingAttachment:0];
}

- (id)dismissActionsForPreviewController:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (self->_insertingDrawing)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    Class QLDismissActionClass = getQLDismissActionClass();
    id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v5 = [v4 localizedStringForKey:@"INSERT_DRAWING_BUTTON" value:&stru_1F0817A00 table:@"Main"];
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    double v11 = __62__MFMailComposeController_dismissActionsForPreviewController___block_invoke;
    double v12 = &unk_1E5F7B4C8;
    objc_copyWeak(&v13, &location);
    uint64_t v6 = [(objc_class *)QLDismissActionClass actionWithTitle:v5 handler:&v9];

    v15[0] = v6;
    unint64_t v7 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v15, 1, v9, v10, v11, v12);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

void __62__MFMailComposeController_dismissActionsForPreviewController___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [v7 firstObject];
  uint64_t v6 = [v5 editedFileURL];
  -[MFMailComposeController _insertDrawingFromExternalURL:]((uint64_t)WeakRetained, v6);
}

- (void)_insertDrawingFromExternalURL:(uint64_t)a1
{
  v24[6] = *(id *)MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    [v3 startAccessingSecurityScopedResource];
    id v5 = [v4 lastPathComponent];
    uint64_t v6 = (void *)MEMORY[0x1E4F1CB10];
    id v7 = NSTemporaryDirectory();
    id v8 = [v6 fileURLWithPath:v7];

    uint64_t v9 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v10 = [v9 UUIDString];
    double v11 = [v8 URLByAppendingPathComponent:v10 isDirectory:1];

    double v12 = [MEMORY[0x1E4F28CB8] defaultManager];
    v24[0] = 0;
    [v12 createDirectoryAtURL:v11 withIntermediateDirectories:1 attributes:0 error:v24];
    id v13 = v24[0];

    if (v13)
    {
      double v14 = MFLogGeneral();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v13, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        -[MFMailComposeController _insertDrawingFromExternalURL:]();
      }
    }
    double v15 = [v5 pathExtension];
    BOOL v16 = [v15 length] == 0;

    if (v16)
    {
      uint64_t v17 = [v5 stringByAppendingPathExtension:@"png"];

      id v5 = (void *)v17;
    }
    uint64_t v18 = [v11 URLByAppendingPathComponent:v5];

    uint64_t v19 = (void *)v18;
    uint64_t v20 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v23 = v13;
    [v20 copyItemAtURL:v4 toURL:v19 error:&v23];
    id v21 = v23;

    if (v21)
    {
      BOOL v22 = MFLogGeneral();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v21, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        -[MFMailComposeController _insertDrawingFromExternalURL:]();
      }
    }
    [v4 stopAccessingSecurityScopedResource];
    [*(id *)(a1 + 1208) insertDocumentWithURL:v19 isDrawingFile:1];
  }
}

- (void)previewController:(id)a3 didSaveEditedCopyOfPreviewItem:(id)a4 atURL:(id)a5
{
  id v6 = a5;
  id v7 = MFLogGeneral();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF945000, v7, OS_LOG_TYPE_DEFAULT, "#CompositionServices Drawing controller did save", buf, 2u);
  }

  id v8 = [(MFMailComposeController *)self previewingAttachment];

  if (v8)
  {
    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    uint64_t v9 = [(MFMailComposeController *)self previewingAttachment];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __82__MFMailComposeController_previewController_didSaveEditedCopyOfPreviewItem_atURL___block_invoke;
    v10[3] = &unk_1E5F7B4F0;
    objc_copyWeak(&v11, (id *)buf);
    -[MFMailComposeController _replaceAttachment:withDocumentAtURL:completion:](self, v9, v6, v10);

    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }
}

void __82__MFMailComposeController_previewController_didSaveEditedCopyOfPreviewItem_atURL___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setPreviewingAttachment:v3];
}

- (void)_replaceAttachment:(void *)a3 withDocumentAtURL:(void *)a4 completion:
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    [v7 startAccessingSecurityScopedResource];
    uint64_t v9 = [a1 composeWebView];
    [v9 replaceAttachment:v10 withDocumentAtURL:v7 completion:v8];

    [v7 stopAccessingSecurityScopedResource];
  }
}

- (void)addSignature:(BOOL)a3
{
  signatureController = self->_signatureController;
  sendingEmailAddress = self->_sendingEmailAddress;
  id v5 = [(MFMailComposeController *)self composeWebView];
  -[MFMailSignatureController addSignatureForSender:bodyField:prepend:](signatureController, "addSignatureForSender:bodyField:prepend:", sendingEmailAddress);
}

- (void)updateSignature
{
  signatureController = self->_signatureController;
  sendingEmailAddress = self->_sendingEmailAddress;
  id v4 = [(MFMailComposeController *)self composeWebView];
  -[MFMailSignatureController updateSignatureForSender:bodyField:](signatureController, "updateSignatureForSender:bodyField:", sendingEmailAddress);
}

- (void)removeSignature
{
  signatureController = self->_signatureController;
  sendingEmailAddress = self->_sendingEmailAddress;
  id v4 = [(MFMailComposeController *)self composeWebView];
  -[MFMailSignatureController removeSignatureForSender:bodyField:](signatureController, "removeSignatureForSender:bodyField:", sendingEmailAddress);
}

- (void)finalizeSignature:(id)a3
{
  id v6 = a3;
  signatureController = self->_signatureController;
  id v5 = [(MFMailComposeController *)self composeWebView];
  [(MFMailSignatureController *)signatureController finalizeSignatureForBodyField:v5 completionHandler:v6];
}

- (BOOL)sendingEmailDirtied
{
  sendingEmailAddress = self->_sendingEmailAddress;
  if ((unint64_t)sendingEmailAddress | (unint64_t)self->_originalSendingEmailAddress) {
    return !-[NSString isEqualToString:](sendingEmailAddress, "isEqualToString:");
  }
  else {
    return 0;
  }
}

- (BOOL)bccAddressesDirtied
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = [(MFMailComposeController *)self mailComposeView];
  id v4 = [v3 bccField];
  id v5 = [v4 addresses];

  NSUInteger v6 = [(NSArray *)self->_originalBccAddresses count];
  if (v6 == [v5 count])
  {
    id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", -[NSArray count](self->_originalBccAddresses, "count"));
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v8 = self->_originalBccAddresses;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v29 != v10) {
            objc_enumerationMutation(v8);
          }
          double v12 = (void *)[objc_alloc(MEMORY[0x1E4F607F8]) initWithString:*(void *)(*((void *)&v28 + 1) + 8 * i)];
          id v13 = [v12 simpleAddress];
          [v7 addObject:v13];
        }
        uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v9);
    }

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v14 = v5;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v25;
      while (2)
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v25 != v16) {
            objc_enumerationMutation(v14);
          }
          uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 8 * j);
          id v19 = objc_alloc(MEMORY[0x1E4F607F8]);
          uint64_t v20 = objc_msgSend(v19, "initWithString:", v18, (void)v24);
          id v21 = [v20 simpleAddress];
          char v22 = [v7 containsObject:v21];

          if ((v22 & 1) == 0)
          {
            LOBYTE(v15) = 1;
            goto LABEL_20;
          }
        }
        uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }
LABEL_20:
  }
  else
  {
    LOBYTE(v15) = 1;
  }

  return v15;
}

- (BOOL)canShowFromField
{
  id v2 = [(MFMailComposeController *)self emailAddresses];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)canShowImageSizeField
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(MFMailComposeController *)self traitCollection];
  uint64_t v4 = [v3 horizontalSizeClass];

  if (v4 == 2)
  {
    [(MFMailComposeController *)self attachments];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v5);
          }
          if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "imageScalingFlags", (void)v10))
          {
            LOBYTE(v6) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)canShowAttachmentPicker
{
  return 1;
}

- (void)_focusGained:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(MFMailComposeController *)self mailComposeView];
  [v4 setKeyboardVisible:1 animate:1];
  id v5 = [v6 object];
  if (v5 == self->_composeWebView) {
    [v4 viewDidBecomeFirstResponder:v5];
  }
}

- (void)setSubject:(id)a3
{
  id v5 = (NSString *)a3;
  if (self->_subject != v5)
  {
    objc_storeStrong((id *)&self->_subject, a3);
    [(MFComposeSubjectView *)self->_subjectField setText:v5];
    [(MFMailComposeController *)self _updateNavigationBarTitleAnimated:0];
  }
}

- (NSString)subject
{
  if ((*((unsigned char *)self + 1361) & 4) != 0)
  {
    id v2 = self->_subject;
  }
  else
  {
    id v2 = [(MFComposeSubjectView *)self->_subjectField text];
  }

  return v2;
}

- (int64_t)_fieldForAddressField:(id)a3
{
  uint64_t v4 = (MFMailComposeToField *)a3;
  id v5 = v4;
  if (self->_toField == v4)
  {
    int64_t v8 = 1;
  }
  else if ((MFMailComposeToField *)self->_ccField == v4)
  {
    int64_t v8 = 2;
  }
  else
  {
    id v6 = [(MFMailComposeController *)self mailComposeView];
    uint64_t v7 = [v6 bccField];

    if (v7 == v5) {
      int64_t v8 = 3;
    }
    else {
      int64_t v8 = 0;
    }
  }

  return v8;
}

- (id)_addressFieldForField:(int64_t)a3
{
  switch(a3)
  {
    case 3:
      id v5 = [(MFMailComposeController *)self mailComposeView];
      id v4 = [v5 bccField];

      break;
    case 2:
      uint64_t v3 = 1168;
      goto LABEL_6;
    case 1:
      uint64_t v3 = 1160;
LABEL_6:
      id v4 = *(id *)((char *)&self->super.super.super.isa + v3);
      break;
    default:
      id v4 = 0;
      break;
  }

  return v4;
}

- (id)addressesForField:(int64_t)a3
{
  uint64_t v3 = [(MFMailComposeController *)self _addressFieldForField:a3];
  id v4 = [v3 addresses];

  return v4;
}

- (id)csPeopleForField:(int64_t)a3
{
  uint64_t v3 = [(MFMailComposeController *)self _addressFieldForField:a3];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 people];
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

- (id)_csPeopleFromAddresses:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = objc_msgSend(v3, "ef_compactMap:", &__block_literal_global_379);
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

id __50__MFMailComposeController__csPeopleFromAddresses___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 emailAddressValue];
  id v3 = objc_msgSend(v2, "em_person");

  return v3;
}

- (void)_setRecipients:(id)a3 forField:(int64_t)a4
{
  id v9 = a3;
  id v6 = [(MFMailComposeController *)self addressesForField:a4];
  char v7 = [v6 isEqualToArray:v9];

  if ((v7 & 1) == 0)
  {
    self->_initializedRecipients = 0;
    [(MFMailComposeController *)self setAddresses:v9 field:a4];
    *((unsigned char *)self + 1360) |= 1u;
    int64_t v8 = [(MFMailComposeController *)self mailComposeView];
    [v8 updateOptionalHeaderVisibility];
    [v8 setNeedsLayout];
    self->_initializedRecipients = 1;
  }
}

- (void)setToRecipients:(id)a3
{
}

- (id)toRecipients
{
  if ((*((unsigned char *)self + 1361) & 4) != 0)
  {
    id v2 = self->_toAddresses;
  }
  else
  {
    id v2 = [(MFMailComposeController *)self addressesForField:1];
  }

  return v2;
}

- (void)setCcRecipients:(id)a3
{
}

- (id)ccRecipients
{
  if ((*((unsigned char *)self + 1361) & 4) != 0)
  {
    id v2 = self->_ccAddresses;
  }
  else
  {
    id v2 = [(MFMailComposeController *)self addressesForField:2];
  }

  return v2;
}

- (void)setBccRecipients:(id)a3
{
}

- (id)bccRecipients
{
  if ((*((unsigned char *)self + 1361) & 4) != 0)
  {
    id v2 = self->_bccAddresses;
  }
  else
  {
    id v2 = [(MFMailComposeController *)self addressesForField:3];
  }

  return v2;
}

- (void)setSavedHeaders:(id)a3
{
  id v5 = (MFMutableMessageHeaders *)a3;
  if (self->_savedHeaders != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_savedHeaders, a3);
    id v5 = v6;
  }
}

- (id)savedHeaders
{
  return self->_savedHeaders;
}

- (id)composeWebView
{
  if ((*((unsigned char *)self + 1360) & 0x20) != 0) {
    id v2 = 0;
  }
  else {
    id v2 = self->_composeWebView;
  }

  return v2;
}

- (unint64_t)contentVariationIndex
{
  return self->_selectedContentVariationIndex;
}

- (void)_updateOriginalBccStatusForRestoreAddingAddress:(BOOL)a3
{
  BOOL v3 = a3;
  objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  int v5 = [v14 BOOLForKey:*MEMORY[0x1E4F600C8]];

  id v6 = [(MFMailComposeController *)self hideMyEmailAddressIfExists];

  char v7 = [(MFMailComposeController *)self sendingEmailAddress];
  int64_t v8 = v7;
  if (v6) {
    int v9 = 0;
  }
  else {
    int v9 = v5;
  }
  if (v9 == 1)
  {
    id v15 = v7;
    uint64_t v10 = [v7 length];
    int64_t v8 = v15;
    if (v10)
    {
      BOOL v11 = v3 && *((unsigned char *)self + 1360) & 1;
      long long v12 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v15, 0);
      originalBccAddresses = self->_originalBccAddresses;
      self->_originalBccAddresses = v12;

      int64_t v8 = v15;
      if (v3)
      {
        [(MFMailComposeController *)self addAddress:v15 field:3];
        *((unsigned char *)self + 1360) = *((unsigned char *)self + 1360) & 0xFE | v11;
        int64_t v8 = v15;
      }
    }
  }
}

- (void)_updateOriginalBccStatusForRestore
{
}

- (void)_removeAutoBccSendingAddress:(id)a3
{
  id v5 = a3;
  -[MFMailComposeController removeAddress:field:](self, "removeAddress:field:");
  [(MFMailComposeController *)self _draftContentDidChange];
  originalBccAddresses = self->_originalBccAddresses;
  self->_originalBccAddresses = 0;
}

- (void)_updateAutoBccSendingAddress:(id)a3 withNewSendingAddress:(id)a4 alwaysAdd:(BOOL)a5
{
  BOOL v5 = a5;
  id v18 = a3;
  id v8 = a4;
  int v9 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  int v10 = [v9 BOOLForKey:*MEMORY[0x1E4F600C8]];

  if (v10 && [v18 length])
  {
    BOOL v11 = [(MFMailComposeController *)self _addressFieldForField:3];
    long long v12 = [v11 recipients];
    unint64_t v13 = [v12 count];

    if (([v11 containsAddress:v18] | v5) == 1)
    {
      [(MFMailComposeController *)self addAddress:v8 field:3];
      id v14 = [(MFMailComposeController *)self addressesForField:3];
      unint64_t v15 = [v14 count];

      if (v15 > v13) {
        [(MFMailComposeController *)self removeAddress:v18 field:3];
      }
      [(MFMailComposeController *)self _draftContentDidChange];
      uint64_t v16 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v8, 0);
      originalBccAddresses = self->_originalBccAddresses;
      self->_originalBccAddresses = v16;
    }
    else
    {
      originalBccAddresses = self->_originalBccAddresses;
      self->_originalBccAddresses = 0;
    }
  }
}

- (void)_updateAutoBccSendingAddress:(id)a3 withNewSendingAddress:(id)a4
{
}

- (void)addAddress:(id)a3 field:(int64_t)a4
{
  id v9 = a3;
  id v6 = [(MFMailComposeController *)self _addressFieldForField:a4];
  [v6 addAddress:v9];
  char v7 = [v6 addresses];
  uint64_t v8 = [v7 count];

  if (v8) {
    [(MFMailComposeController *)self _updateSendAndCloseEnabled];
  }
}

- (void)setAddresses:(id)a3 field:(int64_t)a4
{
  id v7 = a3;
  id v6 = [(MFMailComposeController *)self _addressFieldForField:a4];
  [v6 setAddresses:v7];
  if ([v7 count]) {
    [(MFMailComposeController *)self _updateSendAndCloseEnabled];
  }
}

- (void)removeAddress:(id)a3 field:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(MFMailComposeController *)self _addressFieldForField:a4];
  uint64_t v8 = [v7 recipients];
  if ([v7 containsAddress:v6])
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __47__MFMailComposeController_removeAddress_field___block_invoke;
    v13[3] = &unk_1E5F7B538;
    id v14 = v6;
    id v9 = objc_msgSend(v8, "ef_filter:", v13);
    int v10 = [v9 firstObject];
    [v7 removeRecipient:v10];

    BOOL v11 = [v7 addresses];
    uint64_t v12 = [v11 count];

    if (v12) {
      [(MFMailComposeController *)self _updateSendAndCloseEnabled];
    }
  }
}

uint64_t __47__MFMailComposeController_removeAddress_field___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 address];
  id v4 = [v3 lowercaseString];
  BOOL v5 = [*(id *)(a1 + 32) lowercaseString];
  uint64_t v6 = [v4 isEqualToString:v5];

  return v6;
}

- (id)_allRecipientViews
{
  BOOL v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", self->_toField, self->_ccField, 0);
  id v4 = [(MFMailComposeController *)self mailComposeView];
  BOOL v5 = [v4 bccField];

  if (v5) {
    [v3 addObject:v5];
  }

  return v3;
}

- (id)_allRecipients
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(MFMailComposeController *)self _allRecipientViews];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = [*(id *)(*((void *)&v10 + 1) + 8 * i) addresses];
        [v3 addObjectsFromArray:v8];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v3;
}

- (BOOL)_hasRecipients
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = [(MFMailComposeController *)self _allRecipientViews];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = [*(id *)(*((void *)&v9 + 1) + 8 * i) recipients];
        BOOL v7 = [v6 count] == 0;

        if (!v7)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)_anyRecipientViewContainsAddress:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F607F8]) initWithString:v4];
  uint64_t v6 = [v5 simpleAddress];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v7 = [(MFMailComposeController *)self _allRecipientViews];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        if ([*(id *)(*((void *)&v12 + 1) + 8 * i) containsAddress:v6])
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (void)finishEnteringRecipients
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MFMailComposeController *)self mailComposeView];
  id v4 = [v3 firstResponder];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(MFMailComposeController *)self _allRecipientViews];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        long long v10 = [v9 textView];
        BOOL v11 = v10 == v4;

        if (v11)
        {
          [v9 finishEnteringRecipient];
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (int64_t)compositionType
{
  id v2 = [(MFMailComposeController *)self compositionContext];
  int64_t v3 = [v2 composeType];

  return v3;
}

- (BOOL)isManagedAccount
{
  id v2 = [MEMORY[0x1E4F77C70] accountContainingEmailAddress:self->_sendingEmailAddress];
  char v3 = [v2 sourceIsManaged];

  return v3;
}

- (void)_willPresentDocumentPicker
{
  if (self->_releaseActiveFocusedState)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"MFMailComposeController.m" lineNumber:2958 description:@"Expected _releaseActiveFocusedState to be nil"];
  }
  id v7 = [(MFMailComposeController *)self composeWebView];
  char v3 = [v7 _retainActiveFocusedState];
  id v4 = (void *)[v3 copy];
  id releaseActiveFocusedState = self->_releaseActiveFocusedState;
  self->_id releaseActiveFocusedState = v4;
}

- (void)_didDismissDocumentPicker
{
  id releaseActiveFocusedState = (void (**)(id, SEL))self->_releaseActiveFocusedState;
  if (releaseActiveFocusedState)
  {
    releaseActiveFocusedState[2](releaseActiveFocusedState, a2);
    id v4 = self->_releaseActiveFocusedState;
    self->_id releaseActiveFocusedState = 0;
  }
}

- (void)importDocument
{
  char v3 = MFLogGeneral();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1AF945000, v3, OS_LOG_TYPE_DEFAULT, "#CompositionServices Document import started", v7, 2u);
  }

  [(MFMailComposeController *)self _dismissPresentedHalfSheet];
  id v4 = [MEMORY[0x1E4F77B78] supportedDocumentUTIs];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4FB16F0]) initWithDocumentTypes:v4 inMode:0];
  objc_msgSend(v5, "_setIsContentManaged:", -[MFMailComposeController isManagedAccount](self, "isManagedAccount"));
  [v5 setDelegate:self];
  [(MFMailComposeController *)self saveFirstResponder];
  [(MFMailComposeController *)self _willPresentDocumentPicker];
  uint64_t v6 = [v5 presentationController];
  [v6 setDelegate:self];

  [(MFMailComposeController *)self presentViewController:v5 animated:1 completion:0];
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v16 = a4;
  uint64_t v17 = objc_msgSend(v16, "ef_map:", &__block_literal_global_388);
  uint64_t v5 = MFLogGeneral();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    long long v25 = v17;
    _os_log_impl(&dword_1AF945000, v5, OS_LOG_TYPE_DEFAULT, "#CompositionServices Document picker did import URLs: %{public}@", buf, 0xCu);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obuint64_t j = v16;
  uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        long long v10 = [MEMORY[0x1E4F77B90] securityScopedURL:v9];
        BOOL v11 = [v10 startReadAccess];
        if (v11)
        {
          [(MFComposeWebView *)self->_composeWebView insertDocumentWithURL:v11 isDrawingFile:0];
          [v10 stopAccess];
        }
        else
        {
          long long v12 = MFLogGeneral();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            long long v13 = (void *)MEMORY[0x1E4F60E00];
            long long v14 = [v9 absoluteString];
            long long v15 = [v13 fullyRedactedStringForString:v14];
            *(_DWORD *)buf = 138543362;
            long long v25 = v15;
            _os_log_error_impl(&dword_1AF945000, v12, OS_LOG_TYPE_ERROR, "#CompositionServices Error occurred when attempting to acquire a security scoped URL for document at URL: %{public}@", buf, 0xCu);
          }
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }

  [(MFMailComposeController *)self _updateSendAndCloseEnabled];
  [(MFMailComposeController *)self _didDismissDocumentPicker];
}

id __65__MFMailComposeController_documentPicker_didPickDocumentsAtURLs___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F60E00];
  char v3 = [a2 absoluteString];
  id v4 = [v2 fullyRedactedStringForString:v3];

  return v4;
}

- (void)documentPickerWasCancelled:(id)a3
{
  id v4 = MFLogGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1AF945000, v4, OS_LOG_TYPE_DEFAULT, "#CompositionServices Document picker cancelled", v5, 2u);
  }

  [(MFMailComposeController *)self _updateSendAndCloseEnabled];
  [(MFMailComposeController *)self _didDismissDocumentPicker];
}

- (CGRect)_optimalRectForPresentingPopoverInComposeWebView
{
  id v2 = [(MFMailComposeController *)self composeWebView];
  char v3 = [v2 scrollView];
  id v4 = [v2 scrollView];
  [v4 visibleBounds];
  objc_msgSend(v3, "convertRect:toView:", v2);
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  v47.origin.x = v6;
  v47.origin.y = v8;
  v47.size.CGFloat width = v10;
  v47.size.CGFloat height = v12;
  CGFloat MidX = CGRectGetMidX(v47);
  v48.origin.x = v6;
  v48.origin.y = v8;
  v48.size.CGFloat width = v10;
  v48.size.CGFloat height = v12;
  CGFloat MidY = CGRectGetMidY(v48);
  long long v15 = [v2 firstResponder];
  CGFloat width = 1.0;
  if ([v15 conformsToProtocol:&unk_1F0855228])
  {
    uint64_t v17 = [v15 selectedTextRange];
    if ([v17 isEmpty])
    {
      id v18 = [v17 start];
      [v15 caretRectForPosition:v18];
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;
    }
    else
    {
      id v18 = [v15 selectionRectsForRange:v17];
      long long v28 = [v18 firstObject];
      long long v29 = v28;
      if (!v28)
      {

        CGFloat height = 1.0;
        goto LABEL_8;
      }
      [v28 rect];
      double v20 = v30;
      double v22 = v31;
      double v24 = v32;
      double v26 = v33;
    }
    uint64_t v34 = [v15 textInputView];
    objc_msgSend(v34, "convertRect:toView:", v2, v20, v22, v24, v26);
    CGFloat v36 = v35;
    CGFloat v38 = v37;
    CGFloat v40 = v39;
    CGFloat v42 = v41;

    v49.origin.x = v36;
    v49.origin.y = v38;
    v49.size.CGFloat width = v40;
    v49.size.CGFloat height = v42;
    CGRect v50 = CGRectInset(v49, -2.0, 0.0);
    CGFloat MidX = v50.origin.x;
    CGFloat MidY = v50.origin.y;
    CGFloat width = v50.size.width;
    CGFloat height = v50.size.height;
LABEL_8:

    goto LABEL_9;
  }
  CGFloat height = 1.0;
LABEL_9:

  double v43 = MidX;
  double v44 = MidY;
  double v45 = width;
  double v46 = height;
  result.size.CGFloat height = v46;
  result.size.CGFloat width = v45;
  result.origin.y = v44;
  result.origin.x = v43;
  return result;
}

- (void)insertPhotoOrVideo
{
}

- (void)showPhotoPickerWithSourceType:(int64_t)a3 fromSource:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  double v7 = MFLogGeneral();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    int64_t v10 = a3;
    _os_log_impl(&dword_1AF945000, v7, OS_LOG_TYPE_DEFAULT, "#CompositionServices Showing photo picker with source: %ld", (uint8_t *)&v9, 0xCu);
  }

  CGFloat v8 = [MEMORY[0x1E4FB1828] availableMediaTypesForSourceType:a3];
  if ([v8 count])
  {
    if (a3 == 1)
    {
      [(MFMailComposeController *)self _showCamera:v6];
    }
    else if (_os_feature_enabled_impl())
    {
      [(MFMailComposeController *)self _showSystemPhotoPicker:v6];
    }
    else
    {
      [(MFMailComposeController *)self _showPhotoPicker:v6];
    }
  }
}

- (void)_showCamera:(id)a3
{
  [(MFMailComposeController *)self _dismissPresentedHalfSheet];
  id v4 = MFLogGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CGFloat v8 = 0;
    _os_log_impl(&dword_1AF945000, v4, OS_LOG_TYPE_DEFAULT, "#CompositionServices Presenting Camera", v8, 2u);
  }

  objc_msgSend(MEMORY[0x1E4FB1828], "mf_systemImagePickerWithSourceType:", 1);
  double v5 = (UIImagePickerController *)objc_claimAutoreleasedReturnValue();
  cameraPickerController = self->_cameraPickerController;
  self->_cameraPickerController = v5;

  [(UIImagePickerController *)self->_cameraPickerController setDelegate:self];
  [(MFMailComposeController *)self saveFirstResponder];
  double v7 = [(MFMailComposeController *)self parentViewController];
  [v7 presentViewController:self->_cameraPickerController animated:1 completion:0];
}

- (void)_showPhotoPicker:(id)a3
{
  void v24[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(MFMailComposeController *)self presentedViewController];
  if (v5)
  {
    photosPickerController = self->_photosPickerController;

    if (photosPickerController) {
      goto LABEL_15;
    }
  }
  double v7 = MFLogGeneral();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v23 = 0;
    _os_log_impl(&dword_1AF945000, v7, OS_LOG_TYPE_DEFAULT, "#CompositionServices Presenting Photo Picker", v23, 2u);
  }

  [(MFMailComposeController *)self _dismissPresentedHalfSheet];
  CGFloat v8 = objc_alloc_init(MFPhotoPickerProgressManager);
  [(MFMailComposeController *)self setPhotoPickerProgressManager:v8];
  int v9 = [[MFPhotoPickerController alloc] initWithPhotoPickerProgressManager:v8];
  int64_t v10 = self->_photosPickerController;
  self->_photosPickerController = v9;

  [(MFPhotoPickerController *)self->_photosPickerController setPickerDelegate:self];
  [(MFMailComposeController *)self _preparePhotoPicker];
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:self->_photosPickerController];
  CGFloat v12 = [(MFMailComposeController *)self traitCollection];
  int v13 = objc_msgSend(v12, "mf_supportsPopoverPresentation");

  if (v13) {
    [v11 setModalPresentationStyle:7];
  }
  long long v14 = [v11 popoverPresentationController];
  [v14 setDelegate:self];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v14 setSourceView:v4];
    [(MFMailComposeController *)self _optimalRectForPresentingPopoverInComposeWebView];
    objc_msgSend(v14, "setSourceRect:");
    uint64_t v15 = 12;
LABEL_11:
    [v14 setPermittedArrowDirections:v15];
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v14 setBarButtonItem:v4];
    uint64_t v15 = 14;
    goto LABEL_11;
  }
LABEL_12:
  id v16 = [v11 presentationController];
  [v16 setDelegate:self];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = v16;
    id v18 = [(MFMailComposeController *)self _sheetDetentForIdentifier:@"PhotoPickerHalfDetent" viewController:self->_photosPickerController];
    v24[0] = v18;
    double v19 = [MEMORY[0x1E4FB1C30] largeDetent];
    v24[1] = v19;
    double v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
    [v17 setDetents:v20];

    [v17 setLargestUndimmedDetentIdentifier:@"PhotoPickerHalfDetent"];
    [v17 setPrefersEdgeAttachedInCompactHeight:1];
    double v21 = [(MFMailComposeController *)self composeWebView];
    [v21 retainFocusAfterPresenting];
  }
  double v22 = [(MFMailComposeController *)self parentViewController];
  [v22 presentViewController:v11 animated:1 completion:0];

LABEL_15:
}

- (void)_showSystemPhotoPicker:(id)a3
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v4 = [(MFMailComposeController *)self presentedViewController];
  if (!v4 || (double v5 = self->_systemPhotosPickerController, v4, !v5))
  {
    id v6 = MFLogGeneral();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF945000, v6, OS_LOG_TYPE_DEFAULT, "#CompositionServices Presenting Photo Picker", buf, 2u);
    }

    [(MFMailComposeController *)self _dismissPresentedHalfSheet];
    double v7 = (void *)MEMORY[0x1E4F1CAD0];
    CGFloat v8 = [(MFMailComposeController *)self composeWebView];
    uint64_t v9 = [v8 contentIDsForMediaAttachments];
    int64_t v10 = [v7 setWithArray:v9];

    uint64_t v11 = [[MFComposePhotoPickerController alloc] initWithPreselectedAssetIdentifiers:v10];
    systemPhotosPickerController = self->_systemPhotosPickerController;
    self->_systemPhotosPickerController = v11;

    [(MFComposePhotoPickerController *)self->_systemPhotosPickerController setDelegate:self];
    int v13 = [(MFMailComposeController *)self traitCollection];
    LOBYTE(v9) = objc_msgSend(v13, "mf_supportsPopoverPresentation");

    if ((v9 & 1) == 0)
    {
      long long v14 = [(MFComposePhotoPickerController *)self->_systemPhotosPickerController pickerViewController];
      uint64_t v15 = [v14 presentationController];

      [v15 setDelegate:self];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = v15;
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __50__MFMailComposeController__showSystemPhotoPicker___block_invoke;
        v23[3] = &unk_1E5F7B580;
        v23[4] = self;
        id v17 = [MEMORY[0x1E4FB1C30] customDetentWithIdentifier:@"PhotoPickerHalfDetent" resolver:v23];
        v25[0] = v17;
        id v18 = [MEMORY[0x1E4FB1C30] largeDetent];
        v25[1] = v18;
        double v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
        [v16 setDetents:v19];

        [v16 setLargestUndimmedDetentIdentifier:@"PhotoPickerHalfDetent"];
        [v16 setPrefersEdgeAttachedInCompactHeight:1];
        [v16 setPrefersGrabberVisible:1];
        double v20 = [(MFMailComposeController *)self composeWebView];
        [v20 retainFocusAfterPresenting];
      }
    }
    double v21 = [(MFMailComposeController *)self parentViewController];
    double v22 = [(MFComposePhotoPickerController *)self->_systemPhotosPickerController pickerViewController];
    [v21 presentViewController:v22 animated:1 completion:0];
  }
}

double __50__MFMailComposeController__showSystemPhotoPicker___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 1136);
  char v3 = [a2 containerTraitCollection];
  [v2 preferredHeightForTraitCollection:v3];
  double v5 = v4;

  return v5;
}

- (void)_preparePhotoPicker
{
  char v3 = [(MFMailComposeController *)self composeWebView];
  id v4 = [v3 contentIDsForMediaAttachments];

  if (v4) {
    [(MFPhotoPickerController *)self->_photosPickerController addSelectedAssetIdentifiers:v4];
  }
}

- (void)photoPickerDidCancel:(id)a3
{
  id v4 = MFLogGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v7 = 0;
    _os_log_impl(&dword_1AF945000, v4, OS_LOG_TYPE_DEFAULT, "#CompositionServices Photo Picker dismissed", v7, 2u);
  }

  double v5 = [(MFMailComposeController *)self composeWebView];
  [v5 releaseFocusAfterDismissing:1];

  [(MFPhotoPickerController *)self->_photosPickerController dismissViewControllerAnimated:1 completion:0];
  photosPickerController = self->_photosPickerController;
  self->_photosPickerController = 0;

  [(MFMailComposeController *)self _updateSendAndCloseEnabled];
}

- (void)photoPickerDidCancelSystemImagePicker:(id)a3
{
  id v4 = a3;
  -[MFMailComposeController _retainFocusOfComposeWebViewIfRequired:](self, "_retainFocusOfComposeWebViewIfRequired:");
  [(MFMailComposeController *)self _updateSendAndCloseEnabled];
}

- (void)photoPicker:(id)a3 didSelectAssetWithIdentifier:(id)a4 mediaInfo:(id)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = MFLogGeneral();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    id v11 = v7;
    _os_log_impl(&dword_1AF945000, v9, OS_LOG_TYPE_DEFAULT, "#CompositionServices Photo Picker did select asset %{public}@", (uint8_t *)&v10, 0xCu);
  }

  [(MFMailComposeController *)self insertPhotoOrVideoWithAssetIdentifier:v7 info:v8];
}

- (void)photoPicker:(id)a3 didDeselectAssetWithIdentifier:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = +[MFComposePhotoPickerItem contentIdentifierPrefix];
  id v7 = [v6 stringByAppendingString:v5];

  id v8 = MFLogGeneral();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    int v10 = v7;
    _os_log_impl(&dword_1AF945000, v8, OS_LOG_TYPE_DEFAULT, "#CompositionServices Photo Picker did deselect asset with content identifier: %{public}@", (uint8_t *)&v9, 0xCu);
  }

  [(MFComposeWebView *)self->_composeWebView removeMediaWithContentIdentifier:v7];
}

- (id)presentingViewControllerForPhotoPicker:(id)a3
{
  id v4 = [(MFMailComposeController *)self traitCollection];
  int v5 = objc_msgSend(v4, "mf_supportsPopoverPresentation");

  if (v5)
  {
    id v6 = [(MFMailComposeController *)self parentViewController];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)imagePickerControllerDidCancel:(id)a3
{
  id v4 = MFLogGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl(&dword_1AF945000, v4, OS_LOG_TYPE_DEFAULT, "#CompositionServices Photo Picker did cancel", v5, 2u);
  }

  [(MFMailComposeController *)self _dismissAndCleanupCameraPickerController];
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  id v5 = a4;
  id v6 = MFLogGeneral();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v10 = 0;
    _os_log_impl(&dword_1AF945000, v6, OS_LOG_TYPE_DEFAULT, "#CompositionServices Photo Picker did finish", v10, 2u);
  }

  id v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4FB3238]];
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 stringByReplacingOccurrencesOfString:@"/" withString:@"-"];

    id v8 = (void *)v9;
  }
  [(MFMailComposeController *)self insertPhotoOrVideoWithAssetIdentifier:v8 info:v5];
  [(MFMailComposeController *)self _dismissAndCleanupCameraPickerController];
}

- (void)_dismissAndCleanupCameraPickerController
{
  [(UIImagePickerController *)self->_cameraPickerController dismissViewControllerAnimated:1 completion:0];
  cameraPickerController = self->_cameraPickerController;
  self->_cameraPickerController = 0;

  [(MFMailComposeController *)self _updateSendAndCloseEnabled];
}

- (void)photoPickerController:(id)a3 didAddItem:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = MFLogGeneral();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 assetIdentifier];
    *(_DWORD *)buf = 138543362;
    long long v14 = v7;
    _os_log_impl(&dword_1AF945000, v6, OS_LOG_TYPE_DEFAULT, "#CompositionServices Photo Picker did add asset %{public}@", buf, 0xCu);
  }
  composeWebView = self->_composeWebView;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __60__MFMailComposeController_photoPickerController_didAddItem___block_invoke;
  v10[3] = &unk_1E5F79038;
  id v9 = v5;
  id v11 = v9;
  uint64_t v12 = self;
  [(MFComposeWebView *)composeWebView insertMediaWithPhotoPickerItem:v9 completion:v10];
}

void __60__MFMailComposeController_photoPickerController_didAddItem___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = MFLogGeneral();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    char v3 = [*(id *)(a1 + 32) assetIdentifier];
    int v6 = 138543362;
    id v7 = v3;
    _os_log_impl(&dword_1AF945000, v2, OS_LOG_TYPE_DEFAULT, "#CompositionServices webview did add asset %{public}@", (uint8_t *)&v6, 0xCu);
  }
  id v4 = *(void **)(a1 + 40);
  id v5 = [*(id *)(a1 + 32) assetURL];
  [v4 _deleteFileAtURLIfInTmp:v5];
}

- (void)photoPickerController:(id)a3 didRemoveAsset:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int v6 = +[MFComposePhotoPickerItem contentIdentifierPrefix];
  id v7 = [v6 stringByAppendingString:v5];

  uint64_t v8 = MFLogGeneral();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    int v10 = v7;
    _os_log_impl(&dword_1AF945000, v8, OS_LOG_TYPE_DEFAULT, "#CompositionServices Photo Picker did remove asset with content identifier: %{public}@", (uint8_t *)&v9, 0xCu);
  }

  [(MFComposeWebView *)self->_composeWebView removeMediaWithContentIdentifier:v7];
}

- (void)photoPickerControllerDidCancel:(id)a3
{
  id v4 = MFLogGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_1AF945000, v4, OS_LOG_TYPE_DEFAULT, "#CompositionServices Photo Picker dismissed", v8, 2u);
  }

  id v5 = [(MFMailComposeController *)self composeWebView];
  [v5 releaseFocusAfterDismissing:1];

  int v6 = [(MFComposePhotoPickerController *)self->_systemPhotosPickerController pickerViewController];
  [v6 dismissViewControllerAnimated:1 completion:0];

  systemPhotosPickerController = self->_systemPhotosPickerController;
  self->_systemPhotosPickerController = 0;

  [(MFMailComposeController *)self _updateSendAndCloseEnabled];
}

- (void)insertPhotoOrVideoWithAssetIdentifier:(id)a3 info:(id)a4
{
  id v6 = a4;
  composeWebView = self->_composeWebView;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__MFMailComposeController_insertPhotoOrVideoWithAssetIdentifier_info___block_invoke;
  v9[3] = &unk_1E5F79038;
  id v10 = v6;
  uint64_t v11 = self;
  id v8 = v6;
  [(MFComposeWebView *)composeWebView insertPhotoOrVideoWithAssetIdentifier:a3 infoDictionary:v8 completion:v9];
}

void __70__MFMailComposeController_insertPhotoOrVideoWithAssetIdentifier_info___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4FB2A20]];
  objc_msgSend(*(id *)(a1 + 40), "_deleteFileAtURLIfInTmp:");
  id v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4FB31F0]];
  [*(id *)(a1 + 40) _deleteFileAtURLIfInTmp:v2];
}

- (void)_deleteFileAtURLIfInTmp:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 relativePath];
    id v6 = NSTemporaryDirectory();
    int v7 = [v5 hasPrefix:v6];

    if (v7)
    {
      id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v15 = 0;
      char v9 = [v8 removeItemAtURL:v4 error:&v15];
      id v10 = v15;

      if ((v9 & 1) == 0)
      {
        uint64_t v11 = MFLogGeneral();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          uint64_t v12 = (void *)MEMORY[0x1E4F60E00];
          int v13 = [v4 absoluteString];
          long long v14 = [v12 fullyRedactedStringForString:v13];
          -[MFMailComposeController _deleteFileAtURLIfInTmp:](v14, (uint64_t)v16, (uint64_t)v11, v13);
        }
      }
    }
  }
}

- (void)_updateSendAndCloseEnabled
{
  BOOL v3 = [(MFMailComposeController *)self _shouldEnableSendButton];
  id v6 = [(MFMailComposeController *)self quickReplyActionButtonProvider];
  id v4 = [v6 quickReplySendButton];
  id v5 = [v6 quickReplyExpandButton];
  [(UIBarButtonItem *)self->_sendButtonItem setEnabled:v3];
  [(UIBarButtonItem *)self->_sendLaterButtonItem setEnabled:v3];
  [v4 setEnabled:v3];
  [(UIButton *)self->_sendAccessoryButton setEnabled:v3];
  [v5 setUserInteractionEnabled:v3];
  [v5 setHidden:v3 ^ 1];
  [v4 setUserInteractionEnabled:v3];
  [(UIButton *)self->_sendAccessoryButton setUserInteractionEnabled:v3];
  [(UIBarButtonItem *)self->_closeButtonItem setEnabled:[(MFMailComposeController *)self _shouldEnableCloseButton]];
}

- (void)_updateSendAndCloseButtonTintColor
{
  id v8 = [(MFMailComposeController *)self view];
  BOOL v3 = [v8 window];
  uint64_t v4 = [v3 tintColor];

  uint64_t v5 = v4;
  if (!v4)
  {
    uint64_t v5 = [MEMORY[0x1E4FB1618] mailInteractiveColor];
  }
  id v9 = (id)v5;
  -[UIBarButtonItem setTintColor:](self->_sendButtonItem, "setTintColor:");
  [(UIBarButtonItem *)self->_closeButtonItem setTintColor:v9];
  [(UIButton *)self->_sendAccessoryButton setTintColor:v9];
  id v6 = [(MFMailComposeController *)self quickReplyActionButtonProvider];
  int v7 = [v6 quickReplyExpandButton];
  [v7 setTintColor:v9];
}

- (BOOL)_isPopoverOrActionSheetOrAlertVisible
{
  if ((*((unsigned char *)self + 1361) & 2) == 0)
  {
    uint64_t v4 = [(MFMailComposeController *)self popoverAlert];
    if (v4)
    {
      BOOL v5 = 1;
LABEL_10:

      return v5;
    }
    photosPickerController = self->_photosPickerController;
    if (photosPickerController
      && ([(MFPhotoPickerController *)self->_photosPickerController parentViewController],
          id v2 = objc_claimAutoreleasedReturnValue(),
          [v2 modalPresentationStyle] == 7))
    {
      BOOL v5 = 1;
    }
    else
    {
      int v7 = [(MFMailComposeController *)self documentCameraViewController];
      BOOL v5 = v7 != 0;

      if (!photosPickerController) {
        goto LABEL_10;
      }
    }

    goto LABEL_10;
  }
  return 1;
}

- (BOOL)_shouldEnableSendButton
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([(MFMailComposeController *)self hasActiveWritingToolsSession])
  {
    BOOL v3 = MFLogGeneral();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19[0]) = 0;
      uint64_t v4 = "#CompositionServices Has active writing tools session.";
LABEL_10:
      _os_log_impl(&dword_1AF945000, v3, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)v19, 2u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if ([(MFMailComposeController *)self _isSetupForDelivery])
  {
    BOOL v3 = [(MFMailComposeController *)self mailComposeView];
    if ([v3 isLoading])
    {
      BOOL v5 = MFLogGeneral();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19[0]) = 0;
        id v6 = "#CompositionServices Composition loading.";
LABEL_15:
        _os_log_impl(&dword_1AF945000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)v19, 2u);
      }
    }
    else if ([(MFMailComposeController *)self _isPopoverOrActionSheetOrAlertVisible])
    {
      BOOL v5 = MFLogGeneral();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19[0]) = 0;
        id v6 = "#CompositionServices Popover/alert visible.";
        goto LABEL_15;
      }
    }
    else
    {
      id v9 = [(MFMailComposeController *)self mailComposeView];
      int v10 = [v9 isQuickReply];

      if (v10 && ![(MFMailComposeController *)self hasMessageBodyContent]) {
        goto LABEL_11;
      }
      BOOL v5 = [(MFMailComposeController *)self _allRecipientViews];
      int v11 = [v5 ef_any:&__block_literal_global_628];
      int v12 = [v5 ef_any:&__block_literal_global_630];
      if ((v11 | v12))
      {
        if ([(MFMailComposeController *)self _wantsEncryption]
          && (!self->_encryptionStatusIsKnown ? (int v13 = 1) : (int v13 = v12), v13 == 1))
        {
          long long v14 = MFLogGeneral();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            BOOL encryptionStatusIsKnown = self->_encryptionStatusIsKnown;
            v19[0] = 67109376;
            v19[1] = encryptionStatusIsKnown;
            __int16 v20 = 1024;
            int v21 = v12;
            _os_log_impl(&dword_1AF945000, v14, OS_LOG_TYPE_DEFAULT, "#CompositionServices eKnown: %d, hasUnfinished: %d", (uint8_t *)v19, 0xEu);
          }
        }
        else if (([v3 isLoadingFromAddress] & 1) == 0)
        {
          if ((*((unsigned char *)self + 1360) & 2) != 0 || [(MFMailComposeController *)self hasAttachments])
          {
            char v7 = 1;
          }
          else
          {
            id v16 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
            uint64_t v17 = [(MFComposeSubjectView *)self->_subjectField text];
            id v18 = [v17 stringByTrimmingCharactersInSet:v16];

            if ([v18 length]) {
              char v7 = v10 ^ 1;
            }
            else {
              char v7 = 0;
            }
          }
          goto LABEL_17;
        }
      }
    }
    char v7 = 0;
LABEL_17:

    goto LABEL_18;
  }
  BOOL v3 = MFLogGeneral();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v19[0]) = 0;
    uint64_t v4 = "#CompositionServices Not set up for delivery.";
    goto LABEL_10;
  }
LABEL_11:
  char v7 = 0;
LABEL_18:

  return v7;
}

BOOL __50__MFMailComposeController__shouldEnableSendButton__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 recipients];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

BOOL __50__MFMailComposeController__shouldEnableSendButton__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 editable])
  {
    BOOL v3 = [v2 text];
    BOOL v4 = [v3 length] != 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)_shouldEnableCloseButton
{
  return ![(MFMailComposeController *)self _isPopoverOrActionSheetOrAlertVisible];
}

- (BOOL)sendingAccountIsExchange
{
  id v2 = [MEMORY[0x1E4F77C70] accountContainingEmailAddress:self->_sendingEmailAddress];
  BOOL v3 = 0;
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v3 = 1;
    }
  }

  return v3;
}

- (id)shouldCreateRichTextRepresentation
{
  if ([(MFMailComposeController *)self useMailDrop]
    || [(MFMailComposeController *)self sendingAccountIsExchange]
    && [(MFMailComposeController *)self hasAttachments])
  {
    BOOL v3 = [MEMORY[0x1E4F60D70] futureWithResult:MEMORY[0x1E4F1CC38]];
  }
  else
  {
    BOOL v3 = [(MFComposeWebView *)self->_composeWebView containsRichText];
  }

  return v3;
}

- (id)attachments
{
  BOOL v3 = [(MFMailComposeController *)self compositionContext];
  BOOL v4 = [v3 contextID];

  if ([v4 length])
  {
    BOOL v5 = [(MFMailComposeController *)self compositionContext];
    id v6 = [v5 attachmentManager];
    char v7 = [v6 attachmentsForContext:v4];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)hasAttachments
{
  id v2 = [(MFMailComposeController *)self attachments];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (CGRect)frameForAttachmentWithIdentifier:(id)a3
{
  id v4 = a3;
  [(MFComposeWebView *)self->_composeWebView rectOfElementWithID:v4];
  double x = v18.origin.x;
  double y = v18.origin.y;
  double width = v18.size.width;
  double height = v18.size.height;
  if (!CGRectEqualToRect(v18, *MEMORY[0x1E4F1DB28]))
  {
    id v9 = [(MFMailComposeController *)self view];
    objc_msgSend(v9, "convertRect:fromView:", self->_composeWebView, x, y, width, height);
    double x = v10;
    double y = v11;
    double width = v12;
    double height = v13;
  }
  double v14 = x;
  double v15 = y;
  double v16 = width;
  double v17 = height;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (CGRect)rectOfAttachment:(id)a3
{
  id v4 = [a3 fileWrapperForcingDownload:0];
  BOOL v5 = [v4 contentID];
  [(MFMailComposeController *)self frameForAttachmentWithIdentifier:v5];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (void)setContentVisible:(BOOL)a3
{
  if (self->_contentVisible != a3)
  {
    self->_contentVisible = a3;
    composeWebView = self->_composeWebView;
    double v4 = 0.0;
    if (a3) {
      double v4 = 1.0;
    }
    [(MFComposeWebView *)composeWebView setAlpha:v4];
  }
}

- (void)didCreateAttachment:(id)a3
{
  id v4 = a3;
  if ([(MFMailComposeController *)self canShowImageSizeField])
  {
    imageScalingGroup = self->_imageScalingGroup;
    if (!imageScalingGroup)
    {
      double v6 = (OS_dispatch_group *)dispatch_group_create();
      double v7 = self->_imageScalingGroup;
      self->_imageScalingGroup = v6;

      imageScalingGroup = self->_imageScalingGroup;
    }
    dispatch_group_enter(imageScalingGroup);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __47__MFMailComposeController_didCreateAttachment___block_invoke;
    v21[3] = &unk_1E5F7B5C8;
    v21[4] = self;
    [v4 enqueueScaleAttachmentWithCompletionBlock:v21];
    double v8 = [MEMORY[0x1E4F73598] weakReferenceWithObject:self->_imageScalingGroup];
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    double v9 = self->_imageScalingGroup;
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    double v16 = __47__MFMailComposeController_didCreateAttachment___block_invoke_2;
    double v17 = &unk_1E5F7B5F0;
    id v18 = v8;
    id v10 = v8;
    objc_copyWeak(&v19, &location);
    dispatch_group_notify(v9, MEMORY[0x1E4F14428], &v14);
    objc_destroyWeak(&v19);

    objc_destroyWeak(&location);
  }
  double v11 = [(MFMailComposeController *)self mailComposeView];
  int v12 = [v11 isQuickReply];

  if (v12)
  {
    double v13 = [(MFMailComposeController *)self quickReplyDelegate];
    [v13 mailComposeController:self willMigrateToFullComposeWithReason:0];
  }
}

void __47__MFMailComposeController_didCreateAttachment___block_invoke(uint64_t a1)
{
}

void __47__MFMailComposeController_didCreateAttachment___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) reference];
  BOOL v3 = v2;
  if (v2)
  {
    double v6 = v2;
    intptr_t v4 = dispatch_group_wait(v2, 0);
    BOOL v3 = v6;
    if (!v4)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      [WeakRetained _updateImageSizeTitles];

      BOOL v3 = v6;
    }
  }
}

- (void)didInsertAttachment:(id)a3
{
  intptr_t v4 = [(MFMailComposeController *)self mailComposeView];
  int v5 = [v4 isQuickReply];

  if (v5)
  {
    *((unsigned char *)self + 1360) |= 1u;
    double v6 = [(MFMailComposeController *)self composeWebView];
    [v6 setDirty:1];

    [(MFMailComposeController *)self expandQuickReplyToFullCompose];
  }
}

- (id)_attachmentToMarkup
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(MFMailComposeController *)self compositionContext];
  intptr_t v4 = [v3 attachmentToMarkupContentID];

  if (v4)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    int v5 = [(MFMailComposeController *)self attachments];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v5);
          }
          double v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          id v10 = [v9 contentID];
          double v11 = [(MFMailComposeController *)self compositionContext];
          int v12 = [v11 attachmentToMarkupContentID];
          int v13 = [v10 isEqualToString:v12];

          if (v13)
          {
            id v14 = v9;
            goto LABEL_12;
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    id v14 = 0;
LABEL_12:
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (id)currentScaleImageSize
{
  BOOL v3 = [(MFMailComposeController *)self _sizeForScale:+[MFComposeTypeFactory imageScaleFromUserDefaults] imagesOnly:1];
  if (v3)
  {
    unint64_t v4 = (unint64_t)v3;
    unint64_t v5 = [(MFMailComposeController *)self _sizeForScale:0 imagesOnly:1];
    if (v4 >= v5) {
      unint64_t v6 = v5;
    }
    else {
      unint64_t v6 = v4;
    }
    BOOL v3 = objc_msgSend(NSString, "mf_stringRepresentationForBytes:", v6);
  }

  return v3;
}

- (void)_updateImageSizeTitles
{
  BOOL v3 = [(MFMailComposeController *)self mailComposeView];
  [v3 toggleImageSizeFieldIfNecessary];

  if ([(MFMailComposeController *)self canShowImageSizeField])
  {
    if (!self->_imageSizeField)
    {
      unint64_t v4 = [(MFMailComposeController *)self mailComposeView];
      unint64_t v5 = [v4 imageSizeField];
      imageSizeField = self->_imageSizeField;
      self->_imageSizeField = v5;

      [(MFComposeImageSizeView *)self->_imageSizeField setDelegate:self];
    }
    unint64_t v7 = +[MFComposeTypeFactory imageScaleFromUserDefaults];
    unint64_t v8 = [(MFMailComposeController *)self _sizeForScale:0 imagesOnly:1];
    if (v8)
    {
      unint64_t v9 = v8;
      unint64_t v10 = [(MFMailComposeController *)self _sizeForScale:4 imagesOnly:1];
      unint64_t v11 = [(MFMailComposeController *)self _sizeForScale:2 imagesOnly:1];
      unint64_t v12 = [(MFMailComposeController *)self _sizeForScale:1 imagesOnly:1];
      int v13 = self->_imageSizeField;
      id v14 = objc_msgSend(NSString, "mf_stringRepresentationForBytes:", v9);
      [(MFComposeImageSizeView *)v13 setSizeDescription:v14 forScale:0];

      uint64_t v15 = self->_imageSizeField;
      if (v10 >= v9)
      {
        [(MFComposeImageSizeView *)self->_imageSizeField removeSizeDescriptionForScale:4];
        if (v7 == 4) {
          unint64_t v7 = 0;
        }
      }
      else
      {
        long long v16 = objc_msgSend(NSString, "mf_stringRepresentationForBytes:", v10);
        [(MFComposeImageSizeView *)v15 setSizeDescription:v16 forScale:4];
      }
      long long v17 = self->_imageSizeField;
      if (v11 >= v9)
      {
        [(MFComposeImageSizeView *)self->_imageSizeField removeSizeDescriptionForScale:2];
        if (v7 == 2) {
          unint64_t v7 = 0;
        }
      }
      else
      {
        long long v18 = objc_msgSend(NSString, "mf_stringRepresentationForBytes:", v11);
        [(MFComposeImageSizeView *)v17 setSizeDescription:v18 forScale:2];
      }
      long long v19 = self->_imageSizeField;
      if (v12 >= v9)
      {
        [(MFComposeImageSizeView *)self->_imageSizeField removeSizeDescriptionForScale:1];
        if (v7 == 1) {
          unint64_t v7 = 0;
        }
      }
      else
      {
        __int16 v20 = objc_msgSend(NSString, "mf_stringRepresentationForBytes:", v12);
        [(MFComposeImageSizeView *)v19 setSizeDescription:v20 forScale:1];
      }
    }
    else
    {
      [(MFMailComposeController *)self _setInitialStateForImageField];
    }
    uint64_t v21 = self->_imageSizeField;
    [(MFComposeImageSizeView *)v21 setScale:v7];
  }
}

- (void)_setInitialStateForImageField
{
  if ([(MFMailComposeController *)self canShowImageSizeField])
  {
    imageSizeField = self->_imageSizeField;
    id v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    unint64_t v4 = [v11 localizedStringForKey:@"IMAGE_SIZE_PLACEHOLDER_DURING_COMPUTATION" value:&stru_1F0817A00 table:@"Main"];
    [(MFComposeImageSizeView *)imageSizeField setSizeDescription:v4 forScale:0];

    unint64_t v5 = self->_imageSizeField;
    id v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    unint64_t v6 = [v12 localizedStringForKey:@"IMAGE_SIZE_PLACEHOLDER_DURING_COMPUTATION" value:&stru_1F0817A00 table:@"Main"];
    [(MFComposeImageSizeView *)v5 setSizeDescription:v6 forScale:4];

    unint64_t v7 = self->_imageSizeField;
    id v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    unint64_t v8 = [v13 localizedStringForKey:@"IMAGE_SIZE_PLACEHOLDER_DURING_COMPUTATION" value:&stru_1F0817A00 table:@"Main"];
    [(MFComposeImageSizeView *)v7 setSizeDescription:v8 forScale:2];

    unint64_t v9 = self->_imageSizeField;
    id v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    unint64_t v10 = [v14 localizedStringForKey:@"IMAGE_SIZE_PLACEHOLDER_DURING_COMPUTATION" value:&stru_1F0817A00 table:@"Main"];
    [(MFComposeImageSizeView *)v9 setSizeDescription:v10 forScale:1];
  }
}

- (void)_scaleImages
{
  unint64_t v3 = +[MFComposeTypeFactory imageScaleFromUserDefaults];
  [(MFMailComposeController *)self _beginBlockingBodyScroll];
  [(MFComposeWebView *)self->_composeWebView scaleImagesToScale:v3];

  [(MFMailComposeController *)self _endBlockingBodyScroll];
}

- (void)_unscaleImages
{
}

- (void)imageSizeView:(id)a3 changedSelectedScaleTo:(unint64_t)a4
{
  unint64_t v5 = (void *)MEMORY[0x1E4F1CB18];
  unint64_t v6 = [NSNumber numberWithUnsignedInteger:a4];
  objc_msgSend(v5, "mf_setCompositionServicesPreferenceValue:forKey:", v6, *MEMORY[0x1E4F77E18]);

  [(MFMailComposeController *)self _scaleImages];
}

- (void)_setIsLoading:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(MFMailComposeController *)self mailComposeView];
  [v5 setLoading:v3];

  [(MFMailComposeController *)self _updateSendAndCloseEnabled];
}

- (unint64_t)_sizeForScale:(unint64_t)a3 imagesOnly:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v7 = [(MFMailComposeController *)self compositionContext];
  unint64_t v8 = [v7 attachmentManager];
  unint64_t v9 = [(MFMailComposeController *)self compositionContext];
  unint64_t v10 = [v9 contextID];
  unint64_t v11 = [v8 sizeForScale:a3 imagesOnly:v4 forContext:v10];

  return v11;
}

- (void)contentDidChange
{
}

- (BOOL)_shouldAutoSaveQuickReply
{
  BOOL v3 = [(MFMailComposeController *)self mailComposeView];
  int v4 = [v3 isQuickReply];

  if (v4)
  {
    BOOL v5 = [(MFComposeWebView *)self->_composeWebView isDirty];
    if (v5) {
      LOBYTE(v5) = *((unsigned char *)self + 1360) & 1;
    }
  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (void)_startAutosaveTimerIfNeeded
{
  if (*((char *)self + 1360) < 0 && !self->_autosaveTimer)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    BOOL v3 = (void *)MEMORY[0x1E4F1CB00];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __54__MFMailComposeController__startAutosaveTimerIfNeeded__block_invoke;
    v6[3] = &unk_1E5F7B618;
    objc_copyWeak(&v7, &location);
    int v4 = [v3 scheduledTimerWithTimeInterval:1 repeats:v6 block:0.5];
    autosaveTimer = self->_autosaveTimer;
    self->_autosaveTimer = v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __54__MFMailComposeController__startAutosaveTimerIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _autosaveTimerFired:v3];
}

- (void)_setAutosaveIsValid:(BOOL)a3
{
  if (self->_autosaveIsValid != a3)
  {
    BOOL v3 = a3;
    self->_autosaveIsValid = a3;
    if (!a3)
    {
      BOOL v5 = [MEMORY[0x1E4F1C9C8] date];
      lastActiveDate = self->_lastActiveDate;
      self->_lastActiveDate = v5;

      [(MFMailComposeController *)self _startAutosaveTimerIfNeeded];
    }
    id v7 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
    int v8 = [v7 BOOLForKey:@"AutosaveIndicator"];

    if (v8)
    {
      if (v3)
      {
        if (_setAutosaveIsValid__onceToken != -1) {
          dispatch_once(&_setAutosaveIsValid__onceToken, &__block_literal_global_644);
        }
        unint64_t v9 = NSString;
        unint64_t v10 = [(id)_setAutosaveIsValid__dateFormatter stringFromDate:self->_autosavedDate];
        id v11 = [v9 stringWithFormat:@"Autosaved @ %@", v10];

        [(MFMailComposeController *)self _setTitleBarSubtitleText:v11 style:1];
      }
      else
      {
        [(MFMailComposeController *)self _setTitleBarSubtitleText:@"Not Saved" style:2];
      }
    }
  }
}

void __47__MFMailComposeController__setAutosaveIsValid___block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F28C10];
  id v1 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v4 = [v0 dateFormatFromTemplate:@"HH:mm:ss" options:0 locale:v1];

  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  BOOL v3 = (void *)_setAutosaveIsValid__dateFormatter;
  _setAutosaveIsValid__dateFormatter = (uint64_t)v2;

  [(id)_setAutosaveIsValid__dateFormatter setDateFormat:v4];
}

- (BOOL)_shouldAutosaveAfterTimerFiredWithInterval:(double)a3
{
  if ([(MFMailComposeController *)self _isDummyViewController])
  {
LABEL_28:
    LOBYTE(v5) = 0;
    return v5;
  }
  BOOL v5 = [(MFMailComposeController *)self _shouldAutoSaveQuickReply];
  if (v5)
  {
    [(NSDate *)self->_autosavedDate timeIntervalSinceNow];
    if (self->_autosaveIsValid) {
      goto LABEL_28;
    }
    autosavedDate = self->_autosavedDate;
    if (autosavedDate && v13 >= -2.0) {
      goto LABEL_28;
    }
    unsigned int lastTypedCharacter = self->_lastTypedCharacter;
    double v17 = 0.5;
    if (lastTypedCharacter <= 0x6D3)
    {
      if (lastTypedCharacter == 10 || lastTypedCharacter == 46) {
        goto LABEL_21;
      }
    }
    else if (lastTypedCharacter == 1748 || lastTypedCharacter == 12290 || lastTypedCharacter == 65377)
    {
LABEL_21:
      if (autosavedDate) {
        BOOL v20 = v17 < -a3;
      }
      else {
        BOOL v20 = 1;
      }
      if (!v20) {
        goto LABEL_28;
      }
      if (fabs(v17 + -2.0) >= 0.00000011920929)
      {
        if (fabs(v17 + -0.5) >= 0.00000011920929)
        {
LABEL_33:
          LOBYTE(v5) = 1;
          return v5;
        }
        uint64_t v21 = @"Autosaving now based on terminal edge";
      }
      else
      {
        uint64_t v21 = @"Autosaving based on idle delay";
      }
      _MFAutosaveLog(v21, v6, v7, v8, v9, v10, v11, v12, v23);
      goto LABEL_33;
    }
    double v17 = 2.0;
    goto LABEL_21;
  }
  return v5;
}

- (void)_autosaveTimerFired:(id)a3
{
  [(NSDate *)self->_lastActiveDate timeIntervalSinceNow];
  if (-[MFMailComposeController _shouldAutosaveAfterTimerFiredWithInterval:](self, "_shouldAutosaveAfterTimerFiredWithInterval:")&& (*((unsigned char *)self + 1360) & 0x20) == 0)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __47__MFMailComposeController__autosaveTimerFired___block_invoke;
    v6[3] = &unk_1E5F7A648;
    void v6[4] = self;
    [(MFMailComposeController *)self autosaveWithHandler:v6];
    id v4 = [(MFMailComposeController *)self composeCoordinator];

    if (v4)
    {
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __47__MFMailComposeController__autosaveTimerFired___block_invoke_3;
      v5[3] = &unk_1E5F7B690;
      v5[4] = self;
      [(MFMailComposeController *)self _performBlockWithStrongComposeCoordinator:v5];
    }
  }
}

void __47__MFMailComposeController__autosaveTimerFired___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__MFMailComposeController__autosaveTimerFired___block_invoke_2;
  block[3] = &unk_1E5F79088;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __47__MFMailComposeController__autosaveTimerFired___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"MFMailComposeControllerDidSmartAutosaveNotification" object:*(void *)(a1 + 32)];
}

void __47__MFMailComposeController__autosaveTimerFired___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__MFMailComposeController__autosaveTimerFired___block_invoke_4;
  v6[3] = &unk_1E5F79038;
  uint64_t v7 = *(void *)(a1 + 32);
  id v4 = v3;
  id v8 = v4;
  BOOL v5 = objc_msgSend(MEMORY[0x1E4F60F28], "mainThreadScheduler", v6[0], 3221225472, __47__MFMailComposeController__autosaveTimerFired___block_invoke_4, &unk_1E5F79038, v7);
  [v5 performSyncBlock:v6];
}

void __47__MFMailComposeController__autosaveTimerFired___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) mailComposeView];
  id v3 = [v2 composeWebView];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__MFMailComposeController__autosaveTimerFired___block_invoke_5;
  v5[3] = &unk_1E5F7B668;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 getHTMLDataObject:v5];
}

void __47__MFMailComposeController__autosaveTimerFired___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) mailComposeView];
  BOOL v5 = [v4 composeWebView];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __47__MFMailComposeController__autosaveTimerFired___block_invoke_6;
  v8[3] = &unk_1E5F7B640;
  id v6 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v6;
  id v7 = v3;
  id v10 = v7;
  [v5 getHTMLDataObjectRemovingSignature:1 completion:v8];
}

uint64_t __47__MFMailComposeController__autosaveTimerFired___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _setBodyAndSignatureWithCoordinator:*(void *)(a1 + 40) htmlDataObjectWithSignature:*(void *)(a1 + 48) htmlDataObject:a2];
}

- (void)_setBodyAndSignatureWithCoordinator:(id)a3 htmlDataObjectWithSignature:(id)a4 htmlDataObject:(id)a5
{
  id v19 = a3;
  id v7 = a5;
  id v8 = [a4 plainTextAlternative];
  id v9 = [v8 string];

  id v10 = (void *)MEMORY[0x1E4F734D8];
  uint64_t v11 = [v7 htmlString];
  uint64_t v12 = [v11 string];
  double v13 = [v10 plainTextFromHTMLSnippet:v12];

  id v14 = [NSString stringWithFormat:@"%@", v13];
  uint64_t v15 = [v9 stringByReplacingOccurrencesOfString:v14 withString:&stru_1F0817A00];

  long long v16 = (void *)MEMORY[0x1E4F734D8];
  double v17 = [v19 bodyWithoutSignature];
  long long v18 = [v16 plainTextFromHTMLSnippet:v17];

  if ([v13 isEqual:@"\n"] & 1) != 0 || (objc_msgSend(v13, "isEqual:", v18))
  {
    if ([v15 length]) {
      [v19 setSignature:v15];
    }
  }
  else
  {
    [v19 setBody:v13];
  }
}

- (NSString)autosaveIdentifier
{
  [(MFLock *)self->_autosaveLock lock];
  autosaveIdentifier = self->_autosaveIdentifier;
  if (!autosaveIdentifier)
  {
    id v4 = [(_MFMailCompositionContext *)self->_compositionContext autosaveIdentifier];
    BOOL v5 = self->_autosaveIdentifier;
    self->_autosaveIdentifier = v4;

    autosaveIdentifier = self->_autosaveIdentifier;
    if (!autosaveIdentifier)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F29088]);
      [v6 setScheme:@"x-apple-mail"];
      [v6 setHost:@"document"];
      id v7 = NSString;
      id v8 = [(MFMailComposeController *)self documentID];
      id v9 = [v7 stringWithFormat:@"/%@", v8];
      [v6 setPath:v9];

      id v10 = [v6 URL];
      uint64_t v11 = [v10 absoluteString];
      uint64_t v12 = self->_autosaveIdentifier;
      self->_autosaveIdentifier = v11;

      autosaveIdentifier = self->_autosaveIdentifier;
    }
  }
  double v13 = autosaveIdentifier;
  [(MFLock *)self->_autosaveLock unlock];

  return v13;
}

- (void)setAutosaveIdentifier:(id)a3
{
  id v6 = (NSString *)a3;
  [(MFLock *)self->_autosaveLock lock];
  if (self->_autosaveIdentifier == v6)
  {
    BOOL v5 = 0;
  }
  else
  {
    objc_storeStrong((id *)&self->_autosaveIdentifier, a3);
    BOOL v5 = v6 != 0;
  }
  [(MFLock *)self->_autosaveLock unlock];
  if (v5) {
    [(MFMailComposeController *)self _updateAutosaveSession];
  }
}

- (void)autosaveWithHandler:(id)a3
{
  id v4 = a3;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__5;
  v29[4] = __Block_byref_object_dispose__5;
  id v30 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__5;
  v27[4] = __Block_byref_object_dispose__5;
  id v28 = 0;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __47__MFMailComposeController_autosaveWithHandler___block_invoke;
  v26[3] = &unk_1E5F79E80;
  v26[4] = self;
  v26[5] = v27;
  v26[6] = v29;
  BOOL v5 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
  [v5 performSyncBlock:v26];

  unsigned int v6 = atomic_fetch_add((atomic_uint *volatile)&self->_autosaveCount, 1u) + 1;
  uint64_t v7 = atomic_load(&self->_autosaveCount);
  _MFAutosaveLog(@"Autosave request in queue %i, request ID %i", v8, v9, v10, v11, v12, v13, v14, v7);
  uint64_t v15 = [(MFMailComposeController *)self _messageForAutosave];
  long long v16 = [(MFMailComposeController *)self autosaveQueue];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __47__MFMailComposeController_autosaveWithHandler___block_invoke_2;
  v21[3] = &unk_1E5F7B6E0;
  unsigned int v25 = v6;
  v21[4] = self;
  uint64_t v23 = v27;
  double v24 = v29;
  id v17 = v4;
  id v22 = v17;
  [v15 onScheduler:v16 addSuccessBlock:v21];

  if (v17)
  {
    long long v18 = [(MFMailComposeController *)self autosaveQueue];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    _DWORD v19[2] = __47__MFMailComposeController_autosaveWithHandler___block_invoke_692;
    v19[3] = &unk_1E5F7B708;
    id v20 = v17;
    [v15 onScheduler:v18 addFailureBlock:v19];
  }
  _Block_object_dispose(v27, 8);

  _Block_object_dispose(v29, 8);
}

void __47__MFMailComposeController_autosaveWithHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _saveMessageValues];
  [*(id *)(a1 + 32) setHeadersForDraft];
  id v2 = [*(id *)(a1 + 32) savedHeaders];
  id v3 = [v2 headersForKey:*MEMORY[0x1E4F606B0]];
  id v15 = [v3 firstObject];

  if (v15)
  {
    id v4 = [MEMORY[0x1E4F608F8] tagValueListFromString:v15 error:0];
    BOOL v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5FD10]];
    [*(id *)(a1 + 32) setHideMyEmailSenderAddress:v5];
  }
  uint64_t v6 = [*(id *)(a1 + 32) autosaveIdentifier];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void **)(v10 + 1456);
  *(void *)(v10 + 1456) = v9;

  uint64_t v12 = [*(id *)(a1 + 32) subject];
  uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  [*(id *)(a1 + 32) _setAutosaveIsValid:1];
}

void __47__MFMailComposeController_autosaveWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v11 = v3;
  uint64_t v12 = atomic_load((unsigned int *)(*(void *)(a1 + 32) + 1480));
  if (v12 == *(_DWORD *)(a1 + 64))
  {
    uint64_t v13 = [v3 messageData];
    uint64_t v14 = [MEMORY[0x1E4F73B48] autosave];
    uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    _DWORD v19[2] = __47__MFMailComposeController_autosaveWithHandler___block_invoke_3;
    v19[3] = &unk_1E5F7B6B8;
    id v16 = v11;
    uint64_t v17 = *(void *)(a1 + 32);
    long long v18 = *(void **)(a1 + 40);
    id v20 = v16;
    uint64_t v21 = v17;
    uint64_t v23 = *(void *)(a1 + 56);
    int v24 = *(_DWORD *)(a1 + 64);
    id v22 = v18;
    [v14 autosaveMessageData:v13 replacingIdentifier:v15 completion:v19];

    [v16 setMessageBody:0];
  }
  else
  {
    _MFAutosaveLog(@"Autosave request in queue %i, skipping request ID %i", v4, v5, v6, v7, v8, v9, v10, v12);
  }
}

void __47__MFMailComposeController_autosaveWithHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    uint64_t v7 = MFLogGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "ef_publicDescription");
      *(_DWORD *)buf = 138543362;
      long long v18 = v8;
      _os_log_impl(&dword_1AF945000, v7, OS_LOG_TYPE_DEFAULT, "#Warning failed to autosave message %{public}@", buf, 0xCu);
    }
  }
  [*(id *)(a1 + 40) setAutosaveIdentifier:v5];
  _MFAutosaveLog(@"Autosaved \"%@\" at %@. New ID: %@. Request ID %i", v9, v10, v11, v12, v13, v14, v15, *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  uint64_t v16 = *(void *)(a1 + 48);
  if (v16) {
    (*(void (**)(uint64_t, id))(v16 + 16))(v16, v5);
  }
}

uint64_t __47__MFMailComposeController_autosaveWithHandler___block_invoke_692(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)autosaveIfNecessaryWithHandler:(id)a3
{
  uint64_t v4 = (void (**)(id, void))a3;
  if ([(MFMailComposeController *)self autosaveIsValid] || (*((unsigned char *)self + 1360) & 0x20) != 0)
  {
    if (v4) {
      v4[2](v4, 0);
    }
  }
  else
  {
    [(MFMailComposeController *)self autosaveWithHandler:v4];
  }
}

- (void)_updateAutosaveSession
{
  if (![(MFMailComposeController *)self _isDummyViewController])
  {
    id v3 = [(MFMailComposeController *)self autosaveIdentifier];
    uint64_t v4 = [(MFMailComposeController *)self autosaveSession];
    if (!v4) {
      goto LABEL_4;
    }
    id v5 = [(MFMailComposeController *)self autosaveSession];
    id v6 = [v5 autosaveIdentifier];
    char v7 = [v3 isEqualToString:v6];

    if ((v7 & 1) == 0)
    {
LABEL_4:
      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, self);
      uint64_t v8 = [MEMORY[0x1E4F73B48] autosave];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __49__MFMailComposeController__updateAutosaveSession__block_invoke;
      v9[3] = &unk_1E5F7B730;
      objc_copyWeak(&v10, &location);
      [v8 autosaveSessionForIdentifier:v3 completion:v9];

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
}

void __49__MFMailComposeController__updateAutosaveSession__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v4) {
    [WeakRetained setAutosaveSession:v4];
  }
}

- (EMObjectID)originalMessageObjectID
{
  id v2 = [(MFMailComposeController *)self compositionContext];
  id v3 = [v2 originalMessage];
  id v4 = [v3 objectID];

  return (EMObjectID *)v4;
}

- (void)setHeadersForDraft
{
  v31[3] = *MEMORY[0x1E4F143B8];
  savedHeaders = self->_savedHeaders;
  if (!savedHeaders)
  {
    id v4 = (MFMutableMessageHeaders *)objc_alloc_init(MEMORY[0x1E4F73550]);
    id v5 = self->_savedHeaders;
    self->_savedHeaders = v4;

    savedHeaders = self->_savedHeaders;
  }
  [(MFMailComposeController *)self _wantsEncryption];
  id v6 = NSStringFromBOOL();
  [(MFMutableMessageHeaders *)savedHeaders setHeader:v6 forKey:*MEMORY[0x1E4F60778]];

  char v7 = self->_savedHeaders;
  [(MFComposeSubjectView *)self->_subjectField isNotifyOptionSelected];
  uint64_t v8 = NSStringFromBOOL();
  [(MFMutableMessageHeaders *)v7 setHeader:v8 forKey:*MEMORY[0x1E4F60768]];

  uint64_t v9 = *MEMORY[0x1E4F60780];
  id v10 = [(MFMutableMessageHeaders *)self->_savedHeaders firstHeaderForKey:*MEMORY[0x1E4F60780]];

  if (!v10)
  {
    uint64_t v11 = self->_savedHeaders;
    uint64_t v12 = [(MFMailComposeController *)self documentID];
    [(MFMutableMessageHeaders *)v11 setHeader:v12 forKey:v9];
  }
  uint64_t v13 = [(MFMailComposeController *)self hideMyEmailAddressIfExists];

  if (v13)
  {
    uint64_t v14 = [MEMORY[0x1E4F602C8] sharedInstance];
    uint64_t v15 = [v14 forwardingEmailForPrimaryAccount];

    if (v15
      && ([(MFMailComposeController *)self sendingEmailAddress],
          uint64_t v16 = objc_claimAutoreleasedReturnValue(),
          BOOL v17 = [(MFMailComposeController *)self isAddressHideMyEmail:v16],
          v16,
          v17))
    {
      long long v18 = MFLogGeneral();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v29 = 0;
        _os_log_impl(&dword_1AF945000, v18, OS_LOG_TYPE_DEFAULT, "Saving ECMessageHeaderKeyHMEDraft header for draft.", v29, 2u);
      }

      uint64_t v19 = [(MFMailComposeController *)self mailComposeView];
      [v19 isReplyToHME];
      id v20 = NSStringFromBOOL();

      v30[0] = *MEMORY[0x1E4F5FD00];
      uint64_t v21 = [(MFMailComposeController *)self hideMyEmailAddressIfExists];
      uint64_t v22 = *MEMORY[0x1E4F5FD08];
      v31[0] = v21;
      v31[1] = v15;
      uint64_t v23 = *MEMORY[0x1E4F5FD18];
      v30[1] = v22;
      v30[2] = v23;
      v31[2] = v20;
      int v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:3];

      unsigned int v25 = [MEMORY[0x1E4F608F8] tagValueListFromDictionary:v24 error:0];
      double v26 = self->_savedHeaders;
      long long v27 = [v25 stringRepresentation];
      [(MFMutableMessageHeaders *)v26 setHeader:v27 forKey:*MEMORY[0x1E4F606B8]];
    }
    else
    {
      id v28 = MFLogGeneral();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v29 = 0;
        _os_log_impl(&dword_1AF945000, v28, OS_LOG_TYPE_DEFAULT, "Removing ECMessageHeaderKeyHMEDraft header for draft.", v29, 2u);
      }

      [(MFMutableMessageHeaders *)self->_savedHeaders removeHeaderForKey:*MEMORY[0x1E4F606B8]];
    }
  }
}

- (void)_setUpDraftForHME
{
  id v3 = [(MFMutableMessageHeaders *)self->_savedHeaders firstHeaderForKey:*MEMORY[0x1E4F606B8]];
  if (v3)
  {
    char v7 = v3;
    id v4 = [MEMORY[0x1E4F608F8] tagValueListFromString:v3 error:0];
    id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F5FD08]];
    sendingEmailAddress = self->_sendingEmailAddress;
    self->_sendingEmailAddress = v5;

    id v3 = v7;
  }
}

- (void)backUpDraft
{
  if ((*((unsigned char *)self + 1360) & 0x20) == 0
    && ([(MFComposeWebView *)self->_composeWebView isDirty] || (*((unsigned char *)self + 1360) & 1) != 0))
  {
    [(MFMailComposeController *)self setUpForSaveAsDraft];
    [(MFMailComposeController *)self setHeadersForDraft];
    [(MFMailComposeController *)self _setUpDraftForHME];
    [(MFComposeWebView *)self->_composeWebView setDirty:0];
    *((unsigned char *)self + 1360) &= ~1u;
    id WeakRetained = objc_loadWeakRetained(&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained mailComposeControllerWantsToBackUpDraft:self];
    }
  }
}

- (void)finishedBackingUpDraftWithSuccess:(BOOL)a3
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__MFMailComposeController_finishedBackingUpDraftWithSuccess___block_invoke;
  v5[3] = &unk_1E5F7B758;
  objc_copyWeak(&v6, &location);
  BOOL v7 = a3;
  id v4 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
  [v4 performBlock:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __61__MFMailComposeController_finishedBackingUpDraftWithSuccess___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[168] = 0;
    id v4 = MFComposeLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [NSNumber numberWithInteger:*((void *)v3 + 168)];
      int v10 = 138412290;
      uint64_t v11 = v5;
      _os_log_impl(&dword_1AF945000, v4, OS_LOG_TYPE_DEFAULT, "_resolution changed to %@ as the draft was backed up with success.", (uint8_t *)&v10, 0xCu);
    }
    if (!*(unsigned char *)(a1 + 40))
    {
      [*((id *)v3 + 151) setDirty:1];
      *((unsigned char *)v3 + 1360) |= 1u;
    }
    id v6 = [v3 didSaveQuickReplyDraftHandler];
    BOOL v7 = [v3 mailComposeView];
    int v8 = [v7 isQuickReply];
    if (v6) {
      int v9 = v8;
    }
    else {
      int v9 = 0;
    }

    if (v9)
    {
      v6[2](v6, *(unsigned __int8 *)(a1 + 40));
      [v3 setDidSaveQuickReplyDraftHandler:0];
    }
  }
}

- (void)close
{
  id v3 = [(MFMailComposeController *)self mailComposeView];
  [v3 parentWillClose];

  if ([(MFMailComposeController *)self resolution] == 3)
  {
    id v4 = [(MFMailComposeController *)self _messageForAutosave];
    id v5 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
    [v4 onScheduler:v5 addSuccessBlock:&__block_literal_global_698];

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __32__MFMailComposeController_close__block_invoke_3;
    v9[3] = &unk_1E5F79088;
    void v9[4] = self;
    [v4 always:v9];
  }
  id v6 = self;
  BOOL v7 = [(MFMailComposeController *)v6 mailComposeView];
  [v7 parentDidClose];

  [(MFMailComposeController *)v6 _finishedComposing];
  int v8 = [(MFMailComposeController *)v6 userActivity];
  [v8 invalidate];

  objc_storeWeak((id *)&v6->_savedFirstResponder, 0);
}

void __32__MFMailComposeController_close__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if ([MEMORY[0x1E4F77B80] hasPlaceholderRepresentation:v2])
  {
    [MEMORY[0x1E4F77B80] placeholderRepresentations:v2];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v11;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v11 != v5) {
            objc_enumerationMutation(v3);
          }
          BOOL v7 = *(void **)(*((void *)&v10 + 1) + 8 * v6);
          if (MFIsMobileMail())
          {
            [MEMORY[0x1E4F77B80] removePlaceholder:v7];
          }
          else
          {
            int v8 = (void *)MEMORY[0x1E4F73B68];
            int v9 = objc_msgSend(v7, "fileURL", (void)v10);
            [v8 deletePlaceholderAttachmentForURL:v9 completionBlock:&__block_literal_global_703];
          }
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v4);
    }
  }
  objc_msgSend(v2, "setMessageBody:", 0, (void)v10);
}

void __32__MFMailComposeController_close__block_invoke_3(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F73B48] autosave];
  id v2 = [*(id *)(a1 + 32) autosaveIdentifier];
  [v3 removeAutosavedMessageWithIdentifier:v2];
}

- (void)_escapeShortcutInvoked:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(MFMailComposeController *)self popoverAlert];

  if (!v4)
  {
    uint64_t v5 = [(MFMailComposeController *)self presentedViewController];

    if (v5) {
      [(MFMailComposeController *)self dismissViewControllerAnimated:1 completion:0];
    }
    else {
      [(MFMailComposeController *)self close:v6];
    }
  }
}

- (void)close:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(MFMailComposeController *)self _isSetupForDelivery];
  int64_t v5 = [(MFMailComposeController *)self composeType];
  double v26 = [(MFMailComposeController *)self mailComposeView];
  [v26 saveFirstResponder];
  id v6 = [v26 firstResponder];
  [v6 resignFirstResponder];

  if ((*((unsigned char *)self + 1360) & 1) != 0 || [(MFComposeWebView *)self->_composeWebView isDirty])
  {
    BOOL v7 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:0 preferredStyle:0];
    if (v5 == 2)
    {
      int v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      unsigned int v25 = [v8 localizedStringForKey:@"DELETE_CHANGES" value:&stru_1F0817A00 table:@"Main"];
    }
    else
    {
      int v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      if (v5 == 3) {
        [v8 localizedStringForKey:@"DELETE" value:&stru_1F0817A00 table:@"Main"];
      }
      else {
      unsigned int v25 = [v8 localizedStringForKey:@"DELETE_DRAFT" value:&stru_1F0817A00 table:@"Main"];
      }
    }

    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __33__MFMailComposeController_close___block_invoke;
    void v30[3] = &unk_1E5F7B7C0;
    v30[4] = self;
    v30[5] = v5;
    long long v10 = [MEMORY[0x1E4FB1410] actionWithTitle:v25 style:2 handler:v30];
    [v10 setAccessibilityIdentifier:*MEMORY[0x1E4F73C78]];
    [v7 addAction:v10];
    if (v4)
    {
      if (([v26 isLoading] & 1) == 0)
      {
        long long v11 = (void *)MEMORY[0x1E4FB1410];
        long long v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        long long v13 = [v12 localizedStringForKey:@"SAVE_AS_DRAFT" value:&stru_1F0817A00 table:@"Main"];
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __33__MFMailComposeController_close___block_invoke_716;
        v29[3] = &unk_1E5F7B3C8;
        v29[4] = self;
        uint64_t v14 = [v11 actionWithTitle:v13 style:0 handler:v29];

        [v14 setAccessibilityIdentifier:*MEMORY[0x1E4F73C80]];
        [v7 addAction:v14];
      }
      if (v5 == 3)
      {
        uint64_t v15 = (void *)MEMORY[0x1E4FB1410];
        uint64_t v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        BOOL v17 = [v16 localizedStringForKey:@"LEAVE_IN_OUTBOX" value:&stru_1F0817A00 table:@"Main"];
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __33__MFMailComposeController_close___block_invoke_2;
        v28[3] = &unk_1E5F7B3C8;
        v28[4] = self;
        long long v18 = [v15 actionWithTitle:v17 style:0 handler:v28];
        [v7 addAction:v18];
      }
    }
    uint64_t v19 = (void *)MEMORY[0x1E4FB1410];
    id v20 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v21 = [v20 localizedStringForKey:@"CANCEL" value:&stru_1F0817A00 table:@"Main"];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __33__MFMailComposeController_close___block_invoke_3;
    v27[3] = &unk_1E5F7B3C8;
    v27[4] = self;
    uint64_t v22 = [v19 actionWithTitle:v21 style:1 handler:v27];

    [v22 setAccessibilityIdentifier:*MEMORY[0x1E4F73C70]];
    [v7 addAction:v22];
    [(MFMailComposeController *)self _displayPopoverAlert:v7];
  }
  else
  {
    if (v5 == 3 && v4)
    {
      [(MFMailComposeController *)self _leaveMessageInOutbox];
    }
    else
    {
      self->_resolution = 3;
      uint64_t v23 = MFComposeLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = [NSNumber numberWithInteger:self->_resolution];
        *(_DWORD *)buf = 138412290;
        double v32 = v24;
        _os_log_impl(&dword_1AF945000, v23, OS_LOG_TYPE_DEFAULT, "_resolution changed to %@ as an empty compose sheet was closed.", buf, 0xCu);
      }
    }
    [(MFMailComposeController *)self close];
  }
}

uint64_t __33__MFMailComposeController_close___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 1360) &= ~1u;
  [*(id *)(*(void *)(a1 + 32) + 1208) setDirty:0];
  *(void *)(*(void *)(a1 + 32) + 1344) = 3;
  id v2 = MFComposeLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [NSNumber numberWithInteger:*(void *)(*(void *)(a1 + 32) + 1344)];
    int v6 = 138412290;
    BOOL v7 = v3;
    _os_log_impl(&dword_1AF945000, v2, OS_LOG_TYPE_DEFAULT, "_resolution changed to %@ as the contents of the compose sheet were deleted.", (uint8_t *)&v6, 0xCu);
  }
  BOOL v4 = *(void **)(a1 + 32);
  if (*(void *)(a1 + 40) == 2) {
    return [v4 close];
  }
  else {
    return [v4 finishPopoverAlertClosingComposition:1];
  }
}

uint64_t __33__MFMailComposeController_close___block_invoke_716(uint64_t a1)
{
  [*(id *)(a1 + 32) setUpForSaveAsDraft];
  id v2 = *(void **)(a1 + 32);

  return [v2 finishPopoverAlertClosingComposition:1];
}

uint64_t __33__MFMailComposeController_close___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _leaveMessageInOutbox];
  id v2 = *(void **)(a1 + 32);

  return [v2 finishPopoverAlertClosingComposition:1];
}

uint64_t __33__MFMailComposeController_close___block_invoke_3(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  *(void *)(*(void *)(a1 + 32) + 1344) = 0;
  id v2 = MFComposeLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [NSNumber numberWithInteger:*(void *)(*(void *)(a1 + 32) + 1344)];
    int v5 = 138412290;
    int v6 = v3;
    _os_log_impl(&dword_1AF945000, v2, OS_LOG_TYPE_DEFAULT, "_resolution changed to %@ as compose sheet was closed.", (uint8_t *)&v5, 0xCu);
  }
  return [*(id *)(a1 + 32) finishPopoverAlertClosingComposition:0];
}

- (void)presentSaveDeleteDialogOrClose
{
}

- (void)_leaveMessageInOutbox
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = [(MFMailComposeController *)self compositionContext];
  BOOL v4 = [v3 originalMessage];

  int v5 = [(EFFuture *)self->_undoMoveAction result:0];
  int v6 = [v4 repository];
  [v6 performMessageChangeAction:v5];
  self->_resolution = 3;
  uint64_t v7 = MFComposeLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [NSNumber numberWithInteger:self->_resolution];
    int v9 = 138412290;
    long long v10 = v8;
    _os_log_impl(&dword_1AF945000, v7, OS_LOG_TYPE_DEFAULT, "_resolution changed to %@ as a message was left in the outbox.", (uint8_t *)&v9, 0xCu);
  }
}

- (id)_outgoingMessageWithSubstituteDocument:(id)a3 compositionSpecification:(id)a4 useSuspendInfo:(BOOL)a5 endingEditing:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  if (v6)
  {
    long long v12 = [(MFMailComposeController *)self view];
    [v12 endEditing:1];
  }
  if (a5)
  {
    if (self->_content)
    {
      *((unsigned char *)self + 1361) |= 4u;
      long long v13 = +[MFComposeTypeFactory headersFromDelegate:self originatingBundleID:self->_originatingBundleID sourceAccountManagement:self->_sourceAccountManagement];
      *((unsigned char *)self + 1361) &= ~4u;
      uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F77BF8]) initWithCompositionSpecification:v11];
      [v14 setShouldWriteAttachmentPlaceholders:1];
      content = self->_content;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __120__MFMailComposeController__outgoingMessageWithSubstituteDocument_compositionSpecification_useSuspendInfo_endingEditing___block_invoke;
      v22[3] = &unk_1E5F7B810;
      id v16 = v14;
      id v23 = v16;
      int v24 = self;
      id v17 = v13;
      id v25 = v17;
      long long v18 = [(EFFuture *)content then:v22];
    }
    else
    {
      uint64_t v19 = (void *)MEMORY[0x1E4F60D70];
      id v20 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F77B18] code:1030 userInfo:0];
      long long v18 = [v19 futureWithError:v20];
    }
  }
  else
  {
    long long v18 = +[MFComposeTypeFactory messageFromDelegate:self withSubstituteDOMDocument:v10 compositionSpecification:v11 originatingBundleID:self->_originatingBundleID sourceAccountManagement:self->_sourceAccountManagement writeAttachmentPlaceholders:1];
  }

  return v18;
}

id __120__MFMailComposeController__outgoingMessageWithSubstituteDocument_compositionSpecification_useSuspendInfo_endingEditing___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = (void *)MEMORY[0x1E4F60D70];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __120__MFMailComposeController__outgoingMessageWithSubstituteDocument_compositionSpecification_useSuspendInfo_endingEditing___block_invoke_2;
  v9[3] = &unk_1E5F7B7E8;
  id v10 = *(id *)(a1 + 32);
  id v11 = v3;
  int v5 = *(void **)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 40);
  id v13 = v5;
  id v6 = v3;
  uint64_t v7 = [v4 futureWithBlock:v9];

  return v7;
}

id __120__MFMailComposeController__outgoingMessageWithSubstituteDocument_compositionSpecification_useSuspendInfo_endingEditing___block_invoke_2(uint64_t a1, void *a2)
{
  BOOL v4 = *(void **)(a1 + 32);
  int v5 = objc_msgSend(MEMORY[0x1E4F60840], "mf_utf8HTMLStringWithString:", *(void *)(a1 + 40));
  id v6 = [*(id *)(a1 + 48) attachments];
  uint64_t v7 = (void *)[v4 createMessageWithHTMLStringAndMIMECharset:v5 plainTextAlternative:0 otherHtmlStringsAndAttachments:v6 headers:*(void *)(a1 + 56)];

  uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
  [v8 timeIntervalSince1970];
  objc_msgSend(v7, "setDateSentTimeIntervalSince1970:");

  if (!v7)
  {
    *a2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F77B18] code:1030 userInfo:0];
  }

  return v7;
}

- (id)_messageWithCompositionSpecification:(id)a3 useSuspendInfo:(BOOL)a4 endingEditing:(BOOL)a5
{
  int v5 = [(MFMailComposeController *)self _outgoingMessageWithSubstituteDocument:0 compositionSpecification:a3 useSuspendInfo:a4 endingEditing:a5];

  return v5;
}

- (id)_messageForDraft
{
  id v3 = [(MFSecureMIMECompositionManager *)self->_secureCompositionManager compositionSpecification];
  BOOL v4 = (void *)[v3 mutableCopy];

  [v4 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*MEMORY[0x1E4F77B20]];
  int v5 = [(MFMailComposeController *)self _messageWithCompositionSpecification:v4 useSuspendInfo:0 endingEditing:1];

  return v5;
}

- (id)_messageForRemoteDelivery
{
  return [(MFMailComposeController *)self _messageWithCompositionSpecification:0 useSuspendInfo:0 endingEditing:0];
}

- (id)_messageForAutosave
{
  return [(MFMailComposeController *)self _messageWithCompositionSpecification:0 useSuspendInfo:1 endingEditing:0];
}

- (Class)_deliveryClass
{
  [(MFMailComposeController *)self useMailDrop];
  id v2 = objc_opt_class();

  return (Class)v2;
}

- (void)_setUpDeliveryObject:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = +[MFMailComposeController signpostLog];
  uint64_t v8 = v7;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AF945000, v8, OS_SIGNPOST_EVENT, a3, "MAIL SEND", "Setting up delivery object", buf, 2u);
  }

  int v9 = +[MFComposeTypeFactory headersFromDelegate:self originatingBundleID:self->_originatingBundleID sourceAccountManagement:self->_sourceAccountManagement];
  id v10 = [v9 firstSenderAddress];
  id v11 = [MEMORY[0x1E4F77C70] accountContainingEmailAddress:v10];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v13 = [(MFMailComposeController *)self shouldCreateRichTextRepresentation];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __66__MFMailComposeController__setUpDeliveryObject_completionHandler___block_invoke;
  v17[3] = &unk_1E5F7B8B0;
  unint64_t v21 = a3;
  v17[4] = self;
  char v22 = isKindOfClass & 1;
  id v14 = v9;
  id v18 = v14;
  id v15 = v11;
  id v19 = v15;
  id v16 = v6;
  id v20 = v16;
  [v13 addSuccessBlock:v17];
}

void __66__MFMailComposeController__setUpDeliveryObject_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = +[MFMailComposeController signpostLog];
  int v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 64);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AF945000, v5, OS_SIGNPOST_EVENT, v6, "MAIL SEND", "Should create rich text representation", buf, 2u);
  }

  uint64_t v7 = [MEMORY[0x1E4F60E18] promise];
  if ([v3 BOOLValue])
  {
    uint64_t v8 = +[MFMailComposeController signpostLog];
    int v9 = v8;
    os_signpost_id_t v10 = *(void *)(a1 + 64);
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AF945000, v9, OS_SIGNPOST_EVENT, v10, "MAIL SEND", "Getting HTML representation for the email", buf, 2u);
    }

    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void **)(v11 + 1208);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __66__MFMailComposeController__setUpDeliveryObject_completionHandler___block_invoke_728;
    v33[3] = &unk_1E5F7B838;
    uint64_t v36 = *(void *)(a1 + 64);
    v33[4] = v11;
    char v37 = *(unsigned char *)(a1 + 72);
    id v34 = v7;
    id v35 = *(id *)(a1 + 40);
    [v12 getHTMLDataObject:v33];

    id v13 = v34;
  }
  else
  {
    id v14 = +[MFMailComposeController signpostLog];
    id v15 = v14;
    os_signpost_id_t v16 = *(void *)(a1 + 64);
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AF945000, v15, OS_SIGNPOST_EVENT, v16, "MAIL SEND", "Getting text representation for the email", buf, 2u);
    }

    id v17 = [*(id *)(*(void *)(a1 + 32) + 1208) plainTextContent];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __66__MFMailComposeController__setUpDeliveryObject_completionHandler___block_invoke_730;
    v27[3] = &unk_1E5F7B860;
    uint64_t v31 = *(void *)(a1 + 64);
    char v32 = *(unsigned char *)(a1 + 72);
    id v18 = v7;
    uint64_t v19 = *(void *)(a1 + 32);
    id v20 = *(void **)(a1 + 40);
    id v28 = v18;
    uint64_t v29 = v19;
    id v30 = v20;
    [v17 addSuccessBlock:v27];

    id v13 = v28;
  }

  unint64_t v21 = [v7 future];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __66__MFMailComposeController__setUpDeliveryObject_completionHandler___block_invoke_732;
  v23[3] = &unk_1E5F7B888;
  uint64_t v22 = *(void *)(a1 + 32);
  uint64_t v26 = *(void *)(a1 + 64);
  v23[4] = v22;
  id v24 = *(id *)(a1 + 48);
  id v25 = *(id *)(a1 + 56);
  [v21 addSuccessBlock:v23];
}

void __66__MFMailComposeController__setUpDeliveryObject_completionHandler___block_invoke_728(uint64_t a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v28 = a2;
  uint64_t v31 = [v28 htmlString];
  id v32 = [v28 otherHTMLStringsAndAttachments];
  uint64_t v29 = [v28 plainTextAlternative];
  id v2 = +[MFMailComposeController signpostLog];
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 56);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AF945000, v3, OS_SIGNPOST_EVENT, v4, "MAIL SEND", "Received HTML representation", buf, 2u);
  }

  if (!v32)
  {
    int v5 = v31;
    id v32 = [*(id *)(a1 + 32) attachments];
    goto LABEL_40;
  }
  int v5 = v31;
  if (*(unsigned char *)(a1 + 64))
  {
    id v34 = objc_opt_new();
    os_signpost_id_t v6 = objc_opt_new();
    if (v31)
    {
      uint64_t v7 = [v31 string];
      [v34 addObject:v7];

      uint64_t v8 = [v31 charset];
    }
    else
    {
      uint64_t v8 = 0;
    }
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v9 = v32;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (!v10)
    {

      goto LABEL_35;
    }
    uint64_t v11 = *(void *)v36;
    char v33 = 1;
    while (1)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v6 addObject:v13];
          continue;
        }
        id v14 = v13;
        id v15 = v14;
        if (!v8)
        {
          uint64_t v8 = [v14 charset];
        }
        os_signpost_id_t v16 = [v15 string];
        [v34 addObject:v16];

        id v17 = [v15 charset];
        uint64_t v18 = [v17 encoding];
        LOBYTE(v18) = v18 == [v8 encoding];

        if ((v18 & 1) == 0)
        {
          uint64_t v19 = [v15 charset];
          if ([v19 encoding] == 4)
          {
            BOOL v20 = [v8 encoding] == 1;

            if (v20)
            {
              uint64_t v21 = [v15 charset];

              uint64_t v8 = (void *)v21;
              goto LABEL_29;
            }
          }
          else
          {
          }
          uint64_t v22 = [v15 charset];
          if ([v22 encoding] == 1)
          {
            BOOL v23 = [v8 encoding] == 4;

            if (v23) {
              goto LABEL_29;
            }
          }
          else
          {
          }
          char v33 = 0;
        }
LABEL_29:
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (!v10)
      {

        if ((v33 & 1) == 0)
        {
          int v5 = v31;
          id v32 = v9;
          goto LABEL_39;
        }
LABEL_35:
        id v24 = [v34 componentsJoinedByString:@"\n"];
        if (v31)
        {
          int v5 = (void *)[objc_alloc(MEMORY[0x1E4F60840]) initWithString:v24 charset:v8];
          id v25 = v31;
        }
        else
        {
          id v25 = (void *)[objc_alloc(MEMORY[0x1E4F60840]) initWithString:v24 charset:v8];
          int v5 = 0;
          [v6 insertObject:v25 atIndex:0];
        }

        id v32 = v6;
LABEL_39:

        break;
      }
    }
  }
LABEL_40:
  uint64_t v26 = *(void **)(a1 + 40);
  long long v27 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_deliveryClass"), "newWithHeaders:HTML:plainTextAlternative:other:", *(void *)(a1 + 48), v5, v29, v32);
  [v26 finishWithResult:v27];
}

void __66__MFMailComposeController__setUpDeliveryObject_completionHandler___block_invoke_730(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  os_signpost_id_t v4 = +[MFMailComposeController signpostLog];
  int v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 56);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AF945000, v5, OS_SIGNPOST_EVENT, v6, "MAIL SEND", "Received text representation", buf, 2u);
  }

  if (*(unsigned char *)(a1 + 64) && (unint64_t)[v3 count] >= 2)
  {
    uint64_t v7 = objc_opt_new();
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v3;
    id v9 = 0;
    uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (v9)
            {
              id v14 = [v13 string];
              [v9 appendString:v14 withQuoteLevel:0];
            }
            else
            {
              id v9 = v13;
            }
          }
          else
          {
            objc_msgSend(v7, "addObject:", v13, (void)v17);
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v10);
    }
  }
  id v15 = *(void **)(a1 + 32);
  os_signpost_id_t v16 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "_deliveryClass", (void)v17), "newWithHeaders:mixedContent:textPartsAreHTML:", *(void *)(a1 + 48), v3, 0);
  [v15 finishWithResult:v16];
}

void __66__MFMailComposeController__setUpDeliveryObject_completionHandler___block_invoke_732(void *a1, void *a2)
{
  id v4 = a2;
  int v5 = +[MFMailComposeController signpostLog];
  os_signpost_id_t v6 = v5;
  os_signpost_id_t v7 = a1[7];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AF945000, v6, OS_SIGNPOST_EVENT, v7, "MAIL SEND", "Finalizing delivery", buf, 2u);
  }

  objc_storeStrong((id *)(a1[4] + 1232), a2);
  [*(id *)(a1[4] + 1232) setArchiveAccount:a1[5]];
  id v8 = [*(id *)(a1[4] + 1288) compositionSpecification];
  [*(id *)(a1[4] + 1232) setCompositionSpecification:v8];

  objc_msgSend(*(id *)(a1[4] + 1232), "setConversationFlags:", objc_msgSend(*(id *)(a1[4] + 1192), "isNotifyOptionSelected"));
  id v9 = [*(id *)(a1[4] + 984) attachmentContext];
  [*(id *)(a1[4] + 1232) setAttachmentContext:v9];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1[4] + 1232) setMailDropState:1];
  }
  uint64_t v10 = [*(id *)(a1[4] + 984) legacyMessage];
  uint64_t v11 = v10;
  if (v10) {
    objc_msgSend(*(id *)(a1[4] + 1232), "setOriginalConversationId:", objc_msgSend(v10, "conversationID"));
  }
  (*(void (**)(void))(a1[6] + 16))();
  uint64_t v12 = +[MFMailComposeController signpostLog];
  id v13 = v12;
  os_signpost_id_t v14 = a1[7];
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)id v15 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AF945000, v13, OS_SIGNPOST_INTERVAL_END, v14, "MAIL SEND", "Finished setting up delivery for sending", v15, 2u);
  }
}

- (unint64_t)_composeWebViewTextContentLength
{
  return 0;
}

- (id)_estimateMessageSize
{
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  unint64_t v10 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v10 = [(MFMailComposeController *)self _sizeForScale:0 imagesOnly:0];
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  unint64_t v8 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v8 = 2 * [(MFMailComposeController *)self _composeWebViewTextContentLength];
  id v3 = [(MFComposeWebView *)self->_composeWebView containsRichText];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__MFMailComposeController__estimateMessageSize__block_invoke;
  v6[3] = &unk_1E5F7B8D8;
  void v6[4] = v7;
  void v6[5] = v9;
  id v4 = [v3 then:v6];

  _Block_object_dispose(v7, 8);
  _Block_object_dispose(v9, 8);

  return v4;
}

id __47__MFMailComposeController__estimateMessageSize__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 BOOLValue]) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) *= 2;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                           + 24);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += 6120;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) &= 0xFFFFFFFFFFFFFC00;
  id v4 = (void *)MEMORY[0x1E4F60D70];
  int v5 = [NSNumber numberWithUnsignedLong:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  os_signpost_id_t v6 = [v4 futureWithResult:v5];

  return v6;
}

- (void)performSend
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = MFComposeLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (objc_class *)objc_opt_class();
    int v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v5;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = self;
    _os_log_impl(&dword_1AF945000, v3, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> User tapped send button", buf, 0x16u);
  }
  os_signpost_id_t v6 = _os_activity_create(&dword_1AF945000, "Send button pressed", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  memset(buf, 170, 16);
  os_activity_scope_enter(v6, (os_activity_scope_state_t)buf);
  os_signpost_id_t v7 = +[MFMailComposeController signpostLog];
  os_signpost_id_t v8 = os_signpost_id_generate(v7);

  id v9 = +[MFMailComposeController signpostLog];
  unint64_t v10 = v9;
  unint64_t v11 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)id v24 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AF945000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "MAIL SEND", "Finished setting up delivery for sending", v24, 2u);
  }

  uint64_t v12 = +[MFMailComposeController signpostLog];
  id v13 = v12;
  if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)id v24 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AF945000, v13, OS_SIGNPOST_EVENT, v8, "MAIL SEND", "Send Button Pressed", v24, 2u);
  }

  os_signpost_id_t v14 = [(MFMailComposeController *)self mailComposeView];
  [v14 saveFirstResponder];
  id v15 = [v14 firstResponder];
  [v15 resignFirstResponder];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __38__MFMailComposeController_performSend__block_invoke;
  v23[3] = &unk_1E5F7B690;
  v23[4] = self;
  [(MFMailComposeController *)self _performBlockWithStrongComposeCoordinator:v23];
  [(UIBarButtonItem *)self->_sendButtonItem setEnabled:0];
  [(UIButton *)self->_sendAccessoryButton setUserInteractionEnabled:0];
  os_signpost_id_t v16 = [(MFMailComposeController *)self quickReplyActionButtonProvider];
  long long v17 = [v16 quickReplySendButton];
  [v17 setUserInteractionEnabled:0];

  long long v18 = [v16 quickReplyExpandButton];
  [v18 setUserInteractionEnabled:0];

  [v14 setSending:1];
  long long v19 = [(MFMailComposeController *)self quickReplyDelegate];
  [v19 mailComposeController:self isSending:1];

  +[MessageUITipsManager donateHasSentEmailEvent];
  long long v20 = +[MFMailComposeController signpostLog];
  uint64_t v21 = v20;
  if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)id v24 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AF945000, v21, OS_SIGNPOST_EVENT, v8, "MAIL SEND", "Send button disabled, starting checks now", v24, 2u);
  }

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __38__MFMailComposeController_performSend__block_invoke_738;
  v22[3] = &unk_1E5F79178;
  void v22[4] = self;
  v22[5] = v8;
  [(MFMailComposeController *)self _prepareHMEAddressesWithContinuation:v22];

  os_activity_scope_leave((os_activity_scope_state_t)buf);
}

uint64_t __38__MFMailComposeController_performSend__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) saveAndResignFirstResponder];
}

uint64_t __38__MFMailComposeController_performSend__block_invoke_738(uint64_t a1)
{
  id v2 = +[MFMailComposeController signpostLog];
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AF945000, v3, OS_SIGNPOST_EVENT, v4, "MAIL SEND", "Finished preparing HME addresses.", buf, 2u);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__MFMailComposeController_performSend__block_invoke_739;
  void v7[3] = &unk_1E5F79178;
  uint64_t v5 = *(void *)(a1 + 40);
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = v5;
  return [v8 _checkForInvalidAddressesWithContinuation:v7];
}

uint64_t __38__MFMailComposeController_performSend__block_invoke_739(uint64_t a1)
{
  id v2 = +[MFMailComposeController signpostLog];
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AF945000, v3, OS_SIGNPOST_EVENT, v4, "MAIL SEND", "Finished checking for invalid addresses.", buf, 2u);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__MFMailComposeController_performSend__block_invoke_740;
  void v7[3] = &unk_1E5F79178;
  uint64_t v5 = *(void *)(a1 + 40);
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = v5;
  return [v8 _checkForEmptySubjectWithContinuation:v7];
}

uint64_t __38__MFMailComposeController_performSend__block_invoke_740(uint64_t a1)
{
  id v2 = +[MFMailComposeController signpostLog];
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AF945000, v3, OS_SIGNPOST_EVENT, v4, "MAIL SEND", "Finished checking for empty subject.", buf, 2u);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__MFMailComposeController_performSend__block_invoke_741;
  void v7[3] = &unk_1E5F79178;
  uint64_t v5 = *(void *)(a1 + 40);
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = v5;
  return [v8 _checkForUnencryptedWithContinuation:v7];
}

uint64_t __38__MFMailComposeController_performSend__block_invoke_741(uint64_t a1)
{
  id v2 = +[MFMailComposeController signpostLog];
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AF945000, v3, OS_SIGNPOST_EVENT, v4, "MAIL SEND", "Finished checking for unencrypted email.", buf, 2u);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__MFMailComposeController_performSend__block_invoke_742;
  void v7[3] = &unk_1E5F79178;
  uint64_t v5 = *(void *)(a1 + 40);
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = v5;
  return [v8 _checkForInFlightAssetDownloadsWithContinuation:v7];
}

uint64_t __38__MFMailComposeController_performSend__block_invoke_742(uint64_t a1)
{
  id v2 = +[MFMailComposeController signpostLog];
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AF945000, v3, OS_SIGNPOST_EVENT, v4, "MAIL SEND", "Finished checking for in-flight asset downloads.", buf, 2u);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__MFMailComposeController_performSend__block_invoke_743;
  void v7[3] = &unk_1E5F79178;
  uint64_t v5 = *(void *)(a1 + 40);
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = v5;
  return [v8 _prepareImagesForSendWithContinuation:v7];
}

uint64_t __38__MFMailComposeController_performSend__block_invoke_743(uint64_t a1)
{
  id v2 = +[MFMailComposeController signpostLog];
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AF945000, v3, OS_SIGNPOST_EVENT, v4, "MAIL SEND", "Finished preparing images for sending.", buf, 2u);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__MFMailComposeController_performSend__block_invoke_744;
  void v7[3] = &unk_1E5F79178;
  uint64_t v5 = *(void *)(a1 + 40);
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = v5;
  return [v8 _promptForMailDropIfNecessaryWithContinuation:v7];
}

uint64_t __38__MFMailComposeController_performSend__block_invoke_744(uint64_t a1)
{
  id v2 = +[MFMailComposeController signpostLog];
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AF945000, v3, OS_SIGNPOST_EVENT, v4, "MAIL SEND", "Finished prompting for MailDrop if necessary.", buf, 2u);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__MFMailComposeController_performSend__block_invoke_745;
  void v7[3] = &unk_1E5F79178;
  uint64_t v5 = *(void *)(a1 + 40);
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = v5;
  return [v8 _checkForCanSendMailWithContinuation:v7];
}

uint64_t __38__MFMailComposeController_performSend__block_invoke_745(uint64_t a1)
{
  id v2 = +[MFMailComposeController signpostLog];
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AF945000, v3, OS_SIGNPOST_EVENT, v4, "MAIL SEND", "Finished checking for canSendMail.", buf, 2u);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__MFMailComposeController_performSend__block_invoke_746;
  void v7[3] = &unk_1E5F79178;
  uint64_t v5 = *(void *)(a1 + 40);
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = v5;
  return [v8 _checkForOmittedRecipientsOrAttachmentsIfNeededWithContinuation:v7];
}

uint64_t __38__MFMailComposeController_performSend__block_invoke_746(uint64_t a1)
{
  id v2 = +[MFMailComposeController signpostLog];
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AF945000, v3, OS_SIGNPOST_EVENT, v4, "MAIL SEND", "Finished checking for omitted recipients or attachments.", buf, 2u);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__MFMailComposeController_performSend__block_invoke_747;
  void v7[3] = &unk_1E5F79178;
  uint64_t v5 = *(void *)(a1 + 40);
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = v5;
  return [v8 _checkForShareParticipantsWithContinuation:v7];
}

uint64_t __38__MFMailComposeController_performSend__block_invoke_747(uint64_t a1)
{
  id v2 = +[MFMailComposeController signpostLog];
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AF945000, v3, OS_SIGNPOST_EVENT, v4, "MAIL SEND", "Finished checking for share participants.", buf, 2u);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__MFMailComposeController_performSend__block_invoke_748;
  void v7[3] = &unk_1E5F79178;
  uint64_t v5 = *(void *)(a1 + 40);
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = v5;
  return [v8 _checkForSendLaterDisclaimerWithContinuation:v7];
}

uint64_t __38__MFMailComposeController_performSend__block_invoke_748(uint64_t a1)
{
  id v2 = +[MFMailComposeController signpostLog];
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)os_signpost_id_t v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AF945000, v3, OS_SIGNPOST_EVENT, v4, "MAIL SEND", "Finished checking for send later disclaimer.", v6, 2u);
  }

  return [*(id *)(a1 + 32) sendMessage:*(void *)(a1 + 40)];
}

- (void)_prepareHMEAddressesWithContinuation:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  os_signpost_id_t v4 = (void (**)(void))a3;
  uint64_t v5 = [(MFMailComposeController *)self hideMyEmailAddressIfExists];

  if (v5)
  {
    [(MFMailComposeController *)self _saveMessageValues];
    os_signpost_id_t v6 = MFComposeLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      os_signpost_id_t v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v8;
      __int16 v26 = 2048;
      long long v27 = self;
      _os_log_impl(&dword_1AF945000, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Verify HME address", buf, 0x16u);
    }
    uint64_t v9 = [(MFMailComposeController *)self _allRecipients];
    unint64_t v10 = [v9 firstObject];

    unint64_t v11 = [(MFMailComposeController *)self hideMyEmailAddressIfExists];
    uint64_t v12 = [MEMORY[0x1E4F179C8] defaultStore];
    id v13 = objc_msgSend(v12, "aa_primaryAppleAccount");

    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    os_signpost_id_t v14 = [MEMORY[0x1E4F602C8] sharedInstance];
    id v15 = [(MFMailComposeController *)self hideMyEmailSenderAddress];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    _DWORD v19[2] = __64__MFMailComposeController__prepareHMEAddressesWithContinuation___block_invoke;
    v19[3] = &unk_1E5F7B950;
    objc_copyWeak(&v24, (id *)buf);
    uint64_t v23 = v4;
    id v16 = v10;
    id v20 = v16;
    id v17 = v11;
    id v21 = v17;
    id v18 = v13;
    id v22 = v18;
    [v14 isHideMyEmailAddressValid:v17 senderAddress:v15 completion:v19];

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v4[2](v4);
  }
}

void __64__MFMailComposeController__prepareHMEAddressesWithContinuation___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  os_signpost_id_t v7 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      id v8 = [WeakRetained mailComposeView];
      int v9 = [v8 isReplyToHME];

      if (v9)
      {
        unint64_t v10 = [MEMORY[0x1E4F602C8] sharedInstance];
        uint64_t v11 = [v10 forwardingEmailForPrimaryAccount];
        uint64_t v12 = (void *)v7[132];
        v7[132] = v11;

        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      }
      else
      {
        id v24 = MFComposeLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          id v25 = (objc_class *)objc_opt_class();
          __int16 v26 = NSStringFromClass(v25);
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v26;
          __int16 v40 = 2048;
          uint64_t v41 = v7;
          _os_log_impl(&dword_1AF945000, v24, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Generate HME for reply", buf, 0x16u);
        }
        *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
        objc_initWeak((id *)buf, v7);
        long long v27 = [MEMORY[0x1E4F602C8] sharedInstance];
        uint64_t v28 = *(void *)(a1 + 32);
        uint64_t v29 = *(void *)(a1 + 40);
        uint64_t v30 = *(void *)(a1 + 48);
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __64__MFMailComposeController__prepareHMEAddressesWithContinuation___block_invoke_750;
        v35[3] = &unk_1E5F7B928;
        objc_copyWeak(&v38, (id *)buf);
        id v36 = *(id *)(a1 + 32);
        id v37 = *(id *)(a1 + 56);
        [v27 generateReplyToEmailForRecipient:v28 hmeAddress:v29 account:v30 completion:v35];

        objc_destroyWeak(&v38);
        objc_destroyWeak((id *)buf);
      }
    }
    else
    {
      id v13 = MFComposeLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v31 = (objc_class *)objc_opt_class();
        id v32 = NSStringFromClass(v31);
        char v33 = objc_msgSend(v5, "ef_publicDescription");
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v32;
        __int16 v40 = 2048;
        uint64_t v41 = v7;
        __int16 v42 = 2114;
        double v43 = v33;
        _os_log_error_impl(&dword_1AF945000, v13, OS_LOG_TYPE_ERROR, "<%{public}@: %p> Verifying HME failed with error: %{public}@", buf, 0x20u);
      }
      os_signpost_id_t v14 = (void *)MEMORY[0x1E4FB1418];
      id v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v16 = [v15 localizedStringForKey:@"HME_UNAVAILABLE_ERROR_TITLE" value:&stru_1F0817A00 table:@"Main"];
      id v17 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v18 = [v17 localizedStringForKey:@"HME_UNAVAILABLE_DESCRIPTION" value:&stru_1F0817A00 table:@"Main"];
      long long v19 = [v14 alertControllerWithTitle:v16 message:v18 preferredStyle:1];

      id v20 = (void *)MEMORY[0x1E4FB1410];
      id v21 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v22 = [v21 localizedStringForKey:@"OK" value:&stru_1F0817A00 table:@"Main"];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __64__MFMailComposeController__prepareHMEAddressesWithContinuation___block_invoke_761;
      v34[3] = &unk_1E5F7B3C8;
      v34[4] = v7;
      uint64_t v23 = [v20 actionWithTitle:v22 style:1 handler:v34];
      [v19 addAction:v23];

      [v7 _presentModalAlert:v19];
    }
  }
}

void __64__MFMailComposeController__prepareHMEAddressesWithContinuation___block_invoke_750(id *a1, void *a2, void *a3)
{
  v50[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v38 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    if (!v5 || v38)
    {
      uint64_t v11 = MFComposeLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        long long v35 = (objc_class *)objc_opt_class();
        id v36 = NSStringFromClass(v35);
        id v37 = objc_msgSend(v38, "ef_publicDescription");
        *(_DWORD *)buf = 138543874;
        double v43 = v36;
        __int16 v44 = 2048;
        double v45 = WeakRetained;
        __int16 v46 = 2114;
        CGRect v47 = v37;
        _os_log_error_impl(&dword_1AF945000, v11, OS_LOG_TYPE_ERROR, "<%{public}@: %p> Generating HME failed with error: %{public}@", buf, 0x20u);
      }
      uint64_t v12 = NSString;
      id v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      os_signpost_id_t v14 = [v13 localizedStringForKey:@"HME_CONFIRM_SEND_MESSAGE" value:&stru_1F0817A00 table:@"Main"];
      id v15 = a1[4];
      id v16 = [v15 emailAddressValue];
      id v17 = [v16 simpleAddress];
      id v18 = v17;
      if (v17)
      {
        id v19 = v17;
      }
      else
      {
        id v19 = [v15 stringValue];
      }
      id v20 = v19;

      os_signpost_id_t v7 = objc_msgSend(v12, "stringWithFormat:", v14, v20);

      id v21 = (void *)MEMORY[0x1E4FB1418];
      id v22 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v23 = [v22 localizedStringForKey:@"HIDE_MY_EMAIL_TITLE" value:&stru_1F0817A00 table:@"Main"];
      int v9 = [v21 alertControllerWithTitle:v23 message:v7 preferredStyle:1];

      id v24 = (void *)MEMORY[0x1E4FB1410];
      id v25 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      __int16 v26 = [v25 localizedStringForKey:@"CANCEL" value:&stru_1F0817A00 table:@"Main"];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __64__MFMailComposeController__prepareHMEAddressesWithContinuation___block_invoke_754;
      v41[3] = &unk_1E5F7B3C8;
      void v41[4] = WeakRetained;
      long long v27 = [v24 actionWithTitle:v26 style:1 handler:v41];
      [v9 addAction:v27];

      uint64_t v28 = (void *)MEMORY[0x1E4FB1410];
      uint64_t v29 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v30 = [v29 localizedStringForKey:@"SEND" value:&stru_1F0817A00 table:@"Main"];
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __64__MFMailComposeController__prepareHMEAddressesWithContinuation___block_invoke_2;
      v39[3] = &unk_1E5F7B900;
      id v40 = a1[5];
      uint64_t v31 = [v28 actionWithTitle:v30 style:0 handler:v39];
      [v9 addAction:v31];

      [WeakRetained _presentModalAlert:v9];
      goto LABEL_18;
    }
    os_signpost_id_t v7 = [MEMORY[0x1E4F60800] componentsWithString:v5];
    id v8 = objc_msgSend(a1[4], "ea_addressComment");
    [v7 setDisplayName:v8];

    int v9 = [v7 stringValue];
    if ([WeakRetained[125] containsObject:a1[4]])
    {
      v50[0] = v9;
      unint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:1];
      [WeakRetained setToRecipients:v10];
    }
    else if ([WeakRetained[126] containsObject:a1[4]])
    {
      CGRect v49 = v9;
      unint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
      [WeakRetained setCcRecipients:v10];
    }
    else
    {
      if (![WeakRetained[127] containsObject:a1[4]])
      {
LABEL_17:
        id v32 = [MEMORY[0x1E4F602C8] sharedInstance];
        uint64_t v33 = [v32 forwardingEmailForPrimaryAccount];
        id v34 = WeakRetained[132];
        WeakRetained[132] = (id)v33;

        (*((void (**)(void))a1[5] + 2))();
LABEL_18:

        goto LABEL_19;
      }
      CGRect v48 = v9;
      unint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
      [WeakRetained setBccRecipients:v10];
    }

    goto LABEL_17;
  }
LABEL_19:
}

uint64_t __64__MFMailComposeController__prepareHMEAddressesWithContinuation___block_invoke_754(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishModalAlertClosingComposition:0];
}

uint64_t __64__MFMailComposeController__prepareHMEAddressesWithContinuation___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __64__MFMailComposeController__prepareHMEAddressesWithContinuation___block_invoke_761(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishModalAlertClosingComposition:0];
}

- (void)_checkForInvalidAddressesWithContinuation:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  uint64_t v41 = (void (**)(void))a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = [(MFMailComposeController *)self addressesForField:1];
  [v4 addObjectsFromArray:v5];

  os_signpost_id_t v6 = [(MFMailComposeController *)self addressesForField:2];
  [v4 addObjectsFromArray:v6];

  os_signpost_id_t v7 = [(MFMailComposeController *)self addressesForField:3];
  [v4 addObjectsFromArray:v7];

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v46;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v46 != v10) {
        objc_enumerationMutation(v8);
      }
      uint64_t v12 = *(void **)(*((void *)&v45 + 1) + 8 * v11);
      id v13 = (void *)[objc_alloc(MEMORY[0x1E4F607F8]) initWithString:v12];
      BOOL v14 = v13 == 0;

      if (v14) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v8 countByEnumeratingWithState:&v45 objects:v50 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v15 = v12;

    if (!v15) {
      goto LABEL_15;
    }
    id v16 = MFComposeLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = (objc_class *)objc_opt_class();
      id v18 = NSStringFromClass(v17);
      [(MFMailComposeController *)v18 _checkForInvalidAddressesWithContinuation:(uint64_t)v49];
    }

    id v19 = NSString;
    id v20 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v21 = [v20 localizedStringForKey:@"CONFIRM_SEND_MESSAGE %@" value:&stru_1F0817A00 table:@"Main"];
    id v40 = v15;
    id v22 = [v40 emailAddressValue];
    uint64_t v23 = [v22 simpleAddress];
    id v24 = v23;
    if (v23)
    {
      id v25 = v23;
    }
    else
    {
      id v25 = [v40 stringValue];
    }
    __int16 v26 = v25;

    long long v27 = objc_msgSend(v19, "stringWithFormat:", v21, v26);

    uint64_t v28 = (void *)MEMORY[0x1E4FB1418];
    uint64_t v29 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v30 = [v29 localizedStringForKey:@"INVALID_ADDRESS_TITLE" value:&stru_1F0817A00 table:@"Main"];
    uint64_t v31 = [v28 alertControllerWithTitle:v30 message:v27 preferredStyle:1];

    id v32 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v33 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v34 = [v33 localizedStringForKey:@"CANCEL" value:&stru_1F0817A00 table:@"Main"];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __69__MFMailComposeController__checkForInvalidAddressesWithContinuation___block_invoke;
    v44[3] = &unk_1E5F7B3C8;
    v44[4] = self;
    long long v35 = [v32 actionWithTitle:v34 style:1 handler:v44];
    [v31 addAction:v35];

    id v36 = (void *)MEMORY[0x1E4FB1410];
    id v37 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v38 = [v37 localizedStringForKey:@"SEND" value:&stru_1F0817A00 table:@"Main"];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __69__MFMailComposeController__checkForInvalidAddressesWithContinuation___block_invoke_2;
    v42[3] = &unk_1E5F7B900;
    double v43 = v41;
    double v39 = [v36 actionWithTitle:v38 style:0 handler:v42];
    [v31 addAction:v39];

    [(MFMailComposeController *)self _presentModalAlert:v31];
  }
  else
  {
LABEL_9:

LABEL_15:
    v41[2]();
  }
}

uint64_t __69__MFMailComposeController__checkForInvalidAddressesWithContinuation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishModalAlertClosingComposition:0];
}

uint64_t __69__MFMailComposeController__checkForInvalidAddressesWithContinuation___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_checkForEmptySubjectWithContinuation:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(void))a3;
  id v5 = [(MFComposeSubjectView *)self->_subjectField text];
  os_signpost_id_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(_MFMailCompositionContext *)self->_compositionContext draftSubject];
  }
  id v8 = v7;

  uint64_t v9 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  uint64_t v10 = [v8 stringByTrimmingCharactersInSet:v9];
  if ([v10 length])
  {
    v4[2](v4);
  }
  else
  {
    uint64_t v11 = MFComposeLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v12);
      [(MFMailComposeController *)v13 _checkForEmptySubjectWithContinuation:(uint64_t)v34];
    }

    BOOL v14 = (void *)MEMORY[0x1E4FB1418];
    id v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v16 = [v15 localizedStringForKey:@"EMPTY_SUBJECT_TITLE" value:&stru_1F0817A00 table:@"Main"];
    id v17 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v18 = [v17 localizedStringForKey:@"CONFIRM_EMPTY_SUBJECT_MESSAGE" value:&stru_1F0817A00 table:@"Main"];
    id v19 = [v14 alertControllerWithTitle:v16 message:v18 preferredStyle:1];

    id v20 = (void *)MEMORY[0x1E4FB1410];
    id v21 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v22 = [v21 localizedStringForKey:@"CANCEL" value:&stru_1F0817A00 table:@"Main"];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __65__MFMailComposeController__checkForEmptySubjectWithContinuation___block_invoke;
    v33[3] = &unk_1E5F7B3C8;
    v33[4] = self;
    uint64_t v23 = [v20 actionWithTitle:v22 style:1 handler:v33];
    [v19 addAction:v23];

    id v24 = (void *)MEMORY[0x1E4FB1410];
    id v25 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    __int16 v26 = [v25 localizedStringForKey:@"SEND" value:&stru_1F0817A00 table:@"Main"];
    uint64_t v28 = MEMORY[0x1E4F143A8];
    uint64_t v29 = 3221225472;
    uint64_t v30 = __65__MFMailComposeController__checkForEmptySubjectWithContinuation___block_invoke_2;
    uint64_t v31 = &unk_1E5F7B900;
    id v32 = v4;
    long long v27 = [v24 actionWithTitle:v26 style:0 handler:&v28];
    objc_msgSend(v19, "addAction:", v27, v28, v29, v30, v31);

    [(MFMailComposeController *)self _presentModalAlert:v19];
  }
}

uint64_t __65__MFMailComposeController__checkForEmptySubjectWithContinuation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishModalAlertClosingComposition:0];
}

uint64_t __65__MFMailComposeController__checkForEmptySubjectWithContinuation___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_checkForSendLaterDisclaimerWithContinuation:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (objc_msgSend(MEMORY[0x1E4F73E80], "shouldShowSendLaterDisclaimerAlertForContext:", -[_MFMailCompositionContext sendLaterContext](self->_compositionContext, "sendLaterContext")))
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
    [v5 setBool:1 forKey:*MEMORY[0x1E4F601A0]];

    os_signpost_id_t v6 = (void *)MEMORY[0x1E4FB1418];
    id v7 = _EFLocalizedString();
    id v8 = _EFLocalizedString();
    uint64_t v9 = [v6 alertControllerWithTitle:v7 message:v8 preferredStyle:1];

    uint64_t v10 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v11 = _EFLocalizedString();
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __72__MFMailComposeController__checkForSendLaterDisclaimerWithContinuation___block_invoke;
    v13[3] = &unk_1E5F7B900;
    BOOL v14 = v4;
    uint64_t v12 = [v10 actionWithTitle:v11 style:1 handler:v13];
    [v9 addAction:v12];

    [(MFMailComposeController *)self _presentModalAlert:v9];
  }
  else
  {
    v4[2](v4);
  }
}

uint64_t __72__MFMailComposeController__checkForSendLaterDisclaimerWithContinuation___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_checkForInFlightAssetDownloadsWithContinuation:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v5 = [(MFMailComposeController *)self photoPickerProgressManager];
  int v6 = [v5 anyRequestExists];

  if (v6)
  {
    id v7 = (void *)MEMORY[0x1E4FB1418];
    id v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v9 = [v8 localizedStringForKey:@"IN_FLIGHT_ASSET_DOWNLOAD_TITLE" value:&stru_1F0817A00 table:@"Main"];
    uint64_t v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v11 = [v10 localizedStringForKey:@"IN_FLIGHT_ASSET_DOWNLOAD_MESSAGE" value:&stru_1F0817A00 table:@"Main"];
    uint64_t v12 = [v7 alertControllerWithTitle:v9 message:v11 preferredStyle:1];

    id v13 = (void *)MEMORY[0x1E4FB1410];
    BOOL v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v15 = [v14 localizedStringForKey:@"CANCEL" value:&stru_1F0817A00 table:@"Main"];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __75__MFMailComposeController__checkForInFlightAssetDownloadsWithContinuation___block_invoke;
    v26[3] = &unk_1E5F7B3C8;
    v26[4] = self;
    id v16 = [v13 actionWithTitle:v15 style:1 handler:v26];
    [v12 addAction:v16];

    id v17 = (void *)MEMORY[0x1E4FB1410];
    id v18 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v19 = [v18 localizedStringForKey:@"SEND" value:&stru_1F0817A00 table:@"Main"];
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    uint64_t v23 = __75__MFMailComposeController__checkForInFlightAssetDownloadsWithContinuation___block_invoke_2;
    id v24 = &unk_1E5F7B900;
    id v25 = v4;
    id v20 = [v17 actionWithTitle:v19 style:0 handler:&v21];
    objc_msgSend(v12, "addAction:", v20, v21, v22, v23, v24);

    [(MFMailComposeController *)self _presentModalAlert:v12];
  }
  else
  {
    v4[2](v4);
  }
}

uint64_t __75__MFMailComposeController__checkForInFlightAssetDownloadsWithContinuation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishModalAlertClosingComposition:0];
}

uint64_t __75__MFMailComposeController__checkForInFlightAssetDownloadsWithContinuation___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_checkForCanSendMailWithContinuation:(id)a3
{
  id v4 = (void (**)(void))a3;
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    int v6 = [(MFMailComposeController *)self toRecipients];
    id v7 = [(MFMailComposeController *)self ccRecipients];
    id v8 = [v6 arrayByAddingObjectsFromArray:v7];
    uint64_t v9 = [(MFMailComposeController *)self bccRecipients];
    uint64_t v10 = [v8 arrayByAddingObjectsFromArray:v9];

    content = self->_content;
    uint64_t v12 = content;
    if (!content)
    {
      uint64_t v12 = [(MFComposeWebView *)self->_composeWebView htmlString];
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __64__MFMailComposeController__checkForCanSendMailWithContinuation___block_invoke;
    void v14[3] = &unk_1E5F7B9A0;
    id v15 = WeakRetained;
    id v16 = self;
    id v13 = v10;
    id v17 = v13;
    id v18 = v4;
    [v12 addSuccessBlock:v14];
    if (!content) {
  }
    }
  else
  {
    v4[2](v4);
  }
}

void __64__MFMailComposeController__checkForCanSendMailWithContinuation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) navigationController];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__MFMailComposeController__checkForCanSendMailWithContinuation___block_invoke_2;
  void v7[3] = &unk_1E5F7B978;
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  [v4 mailComposeController:v5 shouldSendMail:v3 toRecipients:v6 completion:v7];
}

uint64_t __64__MFMailComposeController__checkForCanSendMailWithContinuation___block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (void)_checkForUnencryptedWithContinuation:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v5 = [(MFMailComposeController *)self errorsByRecipient];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    id v7 = [(MFMailComposeController *)self certificatesByRecipient];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      uint64_t v9 = [(MFMailComposeController *)self errorsByRecipient];
      if ((unint64_t)[v9 count] >= 2)
      {
        uint64_t v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        [v10 localizedStringForKey:@"CONFIRM_UNENCRYPTED_MESSAGE_MULT" value:&stru_1F0817A00 table:@"Main"];
      }
      else
      {
        uint64_t v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        [v10 localizedStringForKey:@"CONFIRM_UNENCRYPTED_MESSAGE_ONE" value:&stru_1F0817A00 table:@"Main"];
      uint64_t v11 = };
    }
    else
    {
      uint64_t v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v11 = [v9 localizedStringForKey:@"CONFIRM_UNENCRYPTED_MESSAGE_ANY" value:&stru_1F0817A00 table:@"Main"];
    }

    uint64_t v12 = (void *)MEMORY[0x1E4FB1418];
    id v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    BOOL v14 = [v13 localizedStringForKey:@"UNENCRYPTED_TITLE" value:&stru_1F0817A00 table:@"Main"];
    id v15 = [v12 alertControllerWithTitle:v14 message:v11 preferredStyle:1];

    id v16 = (void *)MEMORY[0x1E4FB1410];
    id v17 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v18 = [v17 localizedStringForKey:@"CANCEL" value:&stru_1F0817A00 table:@"Main"];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __64__MFMailComposeController__checkForUnencryptedWithContinuation___block_invoke;
    v29[3] = &unk_1E5F7B3C8;
    v29[4] = self;
    id v19 = [v16 actionWithTitle:v18 style:1 handler:v29];
    [v15 addAction:v19];

    id v20 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v21 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v22 = [v21 localizedStringForKey:@"SEND_ANYWAY" value:&stru_1F0817A00 table:@"Main"];
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    __int16 v26 = __64__MFMailComposeController__checkForUnencryptedWithContinuation___block_invoke_2;
    long long v27 = &unk_1E5F7B900;
    uint64_t v28 = v4;
    uint64_t v23 = [v20 actionWithTitle:v22 style:0 handler:&v24];
    objc_msgSend(v15, "addAction:", v23, v24, v25, v26, v27);

    [(MFMailComposeController *)self _presentModalAlert:v15];
  }
  else
  {
    v4[2](v4);
  }
}

uint64_t __64__MFMailComposeController__checkForUnencryptedWithContinuation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishModalAlertClosingComposition:0];
}

uint64_t __64__MFMailComposeController__checkForUnencryptedWithContinuation___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_checkForOmittedRecipientsOrAttachmentsIfNeededWithContinuation:(id)a3
{
  id v4 = a3;
  id v5 = MFComposeLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF945000, v5, OS_LOG_TYPE_DEFAULT, "Checking for omitted recipients or attachments.", buf, 2u);
  }

  id v6 = [(MFMailComposeController *)self _copyMessagePlainTextForDonationRemoveQuotes:1];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __91__MFMailComposeController__checkForOmittedRecipientsOrAttachmentsIfNeededWithContinuation___block_invoke;
  v8[3] = &unk_1E5F7BA80;
  v8[4] = self;
  id v7 = v4;
  id v9 = v7;
  [v6 addSuccessBlock:v8];
}

void __91__MFMailComposeController__checkForOmittedRecipientsOrAttachmentsIfNeededWithContinuation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v70 = a2;
  if (![v70 count]) {
    goto LABEL_45;
  }
  id v3 = objc_opt_new();
  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  id v4 = v70;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v81 objects:v93 count:16];
  uint64_t v72 = a1;
  id v6 = &stru_1F0817A00;
  if (!v5) {
    goto LABEL_15;
  }
  uint64_t v7 = *(void *)v82;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v82 != v7) {
        objc_enumerationMutation(v4);
      }
      id v9 = *(void **)(*((void *)&v81 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || ([v9 string],
            uint64_t v10 = objc_claimAutoreleasedReturnValue(),
            BOOL v11 = v10 == 0,
            v10,
            v11))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          continue;
        }
        uint64_t v12 = [v9 contentIDs];
        [v3 addObjectsFromArray:v12];
      }
      else
      {
        uint64_t v12 = [v9 string];
        uint64_t v13 = [(__CFString *)v6 stringByAppendingString:v12];

        id v6 = (__CFString *)v13;
      }
    }
    uint64_t v5 = [v4 countByEnumeratingWithState:&v81 objects:v93 count:16];
  }
  while (v5);
LABEL_15:

  BOOL v14 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  id v15 = [(__CFString *)v6 stringByTrimmingCharactersInSet:v14];

  if ((unint64_t)[v15 length] <= 0x20000)
  {
    uint64_t v21 = v15;
  }
  else
  {
    id v16 = MFComposeLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [v15 length];
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = v17;
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(void *)&buf[14] = 0x20000;
      _os_log_impl(&dword_1AF945000, v16, OS_LOG_TYPE_DEFAULT, "Truncating body content. body.length = %ld kMaxLengthBodyContent = %ld", buf, 0x16u);
    }

    uint64_t v18 = [v15 rangeOfComposedCharacterSequenceAtIndex:0x1FFFFLL];
    uint64_t v20 = [v15 substringToIndex:v18 + v19];

    uint64_t v21 = (void *)v20;
  }
  long long v69 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v21];
  long long v68 = [*(id *)(v72 + 32) csPeopleForField:1];
  long long v67 = [*(id *)(v72 + 32) csPeopleForField:2];
  long long v66 = [*(id *)(v72 + 32) csPeopleForField:3];
  uint64_t v22 = [*(id *)(v72 + 32) compositionContext];
  long long v71 = [v22 originalMessage];

  if (v71)
  {
    uint64_t v23 = *(void **)(v72 + 32);
    uint64_t v24 = [v71 toList];
    uint64_t v25 = [v23 _csPeopleFromAddresses:v24];

    __int16 v26 = *(void **)(v72 + 32);
    long long v27 = [v71 ccList];
    uint64_t v28 = [v26 _csPeopleFromAddresses:v27];

    uint64_t v29 = [v71 senderList];
    uint64_t v30 = [v29 firstObject];
    uint64_t v31 = [v30 emailAddressValue];
    id v32 = objc_msgSend(v31, "em_person");

    uint64_t v33 = [*(id *)(v72 + 32) sendingEmailAddress];
    id v34 = [v33 emailAddressValue];
    uint64_t v35 = objc_msgSend(v34, "em_person");

    id v36 = objc_opt_new();
    [v36 addObjectsFromArray:v28];
    [v36 addObjectsFromArray:v25];
    [v36 removeObject:v35];
    if (v32)
    {
      v92 = v32;
      id v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v92 count:1];
    }
    else
    {
      id v37 = 0;
    }
  }
  else
  {
    id v37 = 0;
    id v36 = 0;
  }
  uint64_t v38 = [*(id *)(v72 + 32) subject];
  double v39 = (void *)v38;
  id v40 = &stru_1F0817A00;
  if (v38) {
    id v40 = (__CFString *)v38;
  }
  long long v65 = v40;

  uint64_t v41 = [*(id *)(v72 + 32) attachments];
  v79[0] = MEMORY[0x1E4F143A8];
  v79[1] = 3221225472;
  v79[2] = __91__MFMailComposeController__checkForOmittedRecipientsOrAttachmentsIfNeededWithContinuation___block_invoke_808;
  v79[3] = &unk_1E5F7B9C8;
  id v42 = v3;
  id v80 = v42;
  long long v64 = objc_msgSend(v41, "ef_compactMap:", v79);

  long long v63 = objc_msgSend(MEMORY[0x1E4F60E00], "ec_partiallyRedactedStringForSubjectOrSummary:", v65);
  double v43 = (void *)MEMORY[0x1E4F60E00];
  __int16 v44 = [v69 string];
  long long v62 = objc_msgSend(v43, "ec_partiallyRedactedStringForSubjectOrSummary:", v44);

  objc_msgSend(MEMORY[0x1E4F607F8], "em_partiallyRedactedPeople:", v68);
  long long v59 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
  long long v60 = objc_msgSend(MEMORY[0x1E4F607F8], "em_partiallyRedactedPeople:", v67);
  long long v61 = objc_msgSend(MEMORY[0x1E4F607F8], "em_partiallyRedactedPeople:", v66);
  long long v45 = objc_msgSend(v64, "ef_map:", &__block_literal_global_813);
  id v58 = [v45 componentsJoinedByString:@", "];

  long long v46 = MFComposeLog();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544642;
    *(void *)&uint8_t buf[4] = v63;
    *(_WORD *)&unsigned char buf[12] = 2114;
    *(void *)&buf[14] = v62;
    *(_WORD *)&unsigned char buf[22] = 2114;
    v88 = v59;
    *(_WORD *)v89 = 2114;
    *(void *)&v89[2] = v60;
    *(_WORD *)&v89[10] = 2114;
    *(void *)&v89[12] = v61;
    __int16 v90 = 2114;
    v91 = v58;
    _os_log_impl(&dword_1AF945000, v46, OS_LOG_TYPE_DEFAULT, "Data to identify warnings. Subject: %{public}@ Body: %{public}@ To: %{public}@ Cc: %{public}@ Bcc: %{public}@ Attachments: %{public}@", buf, 0x3Eu);
  }

  long long v47 = [MEMORY[0x1E4F5DB70] serviceForMail];
  [v47 setSyncTimeout:1.0];
  long long v48 = [v69 string];
  id v78 = 0;
  CGRect v49 = [v47 identifyComposeWarningsFromSubject:v65 content:v48 attributes:MEMORY[0x1E4F1CC08] toRecipients:v68 ccRecipients:v67 bccRecipients:v66 originalToRecipients:v37 originalCcRecipients:v36 attachments:v64 error:&v78];
  id v50 = v78;

  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  v88 = __Block_byref_object_copy__5;
  *(void *)v89 = __Block_byref_object_dispose__5;
  *(void *)&v89[8] = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&v89[8] = [*(id *)(v72 + 32) initialMissingAttachmentWarnings];
  if ([*(id *)(*(void *)&buf[8] + 40) count]
    && (objc_msgSend(v49, "ef_any:", &__block_literal_global_821) & 1) == 0)
  {
    v75[0] = MEMORY[0x1E4F143A8];
    v75[1] = 3221225472;
    v75[2] = __91__MFMailComposeController__checkForOmittedRecipientsOrAttachmentsIfNeededWithContinuation___block_invoke_2_823;
    v75[3] = &unk_1E5F7BA30;
    uint64_t v51 = *(void *)(v72 + 32);
    uint64_t v77 = buf;
    v75[4] = v51;
    id v76 = v47;
    id v52 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
    [v52 performBlock:v75];
  }
  if ([v49 count])
  {
    v53 = MFComposeLog();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v85 = 138412290;
      v86 = v49;
      _os_log_impl(&dword_1AF945000, v53, OS_LOG_TYPE_DEFAULT, "Identified warnings: %@", v85, 0xCu);
    }

    if (![*(id *)(*(void *)&buf[8] + 40) count])
    {
      v54 = objc_msgSend(v49, "ef_filter:", &__block_literal_global_826);
      [*(id *)(v72 + 32) setInitialMissingAttachmentWarnings:v54];
    }
    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = __91__MFMailComposeController__checkForOmittedRecipientsOrAttachmentsIfNeededWithContinuation___block_invoke_2_827;
    v73[3] = &unk_1E5F7BA58;
    id v55 = *(void **)(v72 + 32);
    id v56 = *(id *)(v72 + 40);
    v73[4] = *(void *)(v72 + 32);
    id v74 = v56;
    [v55 _presentWarnings:v49 index:0 suggestionsService:v47 completionHandler:v73];
  }
  else
  {
    if (v50)
    {
      long long v57 = MFComposeLog();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
        __91__MFMailComposeController__checkForOmittedRecipientsOrAttachmentsIfNeededWithContinuation___block_invoke_cold_1();
      }
    }
    (*(void (**)(void))(*(void *)(v72 + 40) + 16))();
  }
  _Block_object_dispose(buf, 8);

LABEL_45:
}

id __91__MFMailComposeController__checkForOmittedRecipientsOrAttachmentsIfNeededWithContinuation___block_invoke_808(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 contentID];
  LOBYTE(v4) = [v4 containsObject:v5];

  if ((v4 & 1) != 0
    || ([v3 fileName], id v6 = objc_claimAutoreleasedReturnValue(), v6, !v6))
  {
    BOOL v14 = 0;
  }
  else
  {
    uint64_t v7 = [v3 mimeType];
    uint64_t v8 = (void *)v7;
    id v9 = &stru_1F0817A00;
    if (v7) {
      id v9 = (__CFString *)v7;
    }
    uint64_t v10 = v9;

    id v11 = objc_alloc(MEMORY[0x1E4F5DA60]);
    uint64_t v12 = [v3 fileName];
    uint64_t v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "decodedFileSize"));
    BOOL v14 = (void *)[v11 initWithFileName:v12 fileSizeInBytes:v13 fileDescription:v10 keywords:MEMORY[0x1E4F1CBF0] authors:MEMORY[0x1E4F1CBF0]];
  }

  return v14;
}

id __91__MFMailComposeController__checkForOmittedRecipientsOrAttachmentsIfNeededWithContinuation___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 fileName];
  id v3 = [v2 description];

  return v3;
}

uint64_t __91__MFMailComposeController__checkForOmittedRecipientsOrAttachmentsIfNeededWithContinuation___block_invoke_818(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __91__MFMailComposeController__checkForOmittedRecipientsOrAttachmentsIfNeededWithContinuation___block_invoke_2_823(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 32), "_reportUserEnagagement:suggestionService:warning:", 1, *(void *)(a1 + 40), *(void *)(*((void *)&v7 + 1) + 8 * v5++), (void)v7);
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }

  return [*(id *)(a1 + 32) setInitialMissingAttachmentWarnings:0];
}

uint64_t __91__MFMailComposeController__checkForOmittedRecipientsOrAttachmentsIfNeededWithContinuation___block_invoke_824(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __91__MFMailComposeController__checkForOmittedRecipientsOrAttachmentsIfNeededWithContinuation___block_invoke_2_827(uint64_t a1, int a2)
{
  if (a2) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    [*(id *)(a1 + 32) _finishModalAlertClosingComposition:0];
  }
  uint64_t v4 = *(void **)(a1 + 32);

  return [v4 setDidUseOmittedAttachmentsOrRecipients:a2 ^ 1u];
}

- (void)_checkForShareParticipantsWithContinuation:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  uint64_t v5 = [(MFMailComposeController *)self compositionContext];
  id v6 = [v5 sharingSandboxingURLWrapper];

  uint64_t v7 = [v6 url];
  long long v8 = [(MFMailComposeController *)self compositionContext];
  uint64_t v9 = [v8 ckShare];

  long long v10 = [(MFMailComposeController *)self compositionContext];
  uint64_t v31 = [v10 ckContainerSetupInfo];

  id v11 = [(MFMailComposeController *)self compositionContext];
  uint64_t v12 = [v11 ckSharePermissionType];

  uint64_t v13 = [(MFMailComposeController *)self compositionContext];
  char v14 = [v13 ckShareAllowOthersToInvite];

  if (v7 | v9)
  {
    id v30 = objc_alloc_init(MEMORY[0x1E4F60E18]);
    uint64_t v42 = 0;
    double v43 = &v42;
    uint64_t v44 = 0x3032000000;
    long long v45 = __Block_byref_object_copy__5;
    long long v46 = __Block_byref_object_dispose__5;
    id v47 = 0;
    Class CloudSharingClass = getCloudSharingClass();
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __70__MFMailComposeController__checkForShareParticipantsWithContinuation___block_invoke;
    v33[3] = &unk_1E5F7BAD0;
    v33[4] = self;
    id v34 = (id)v7;
    id v35 = v6;
    double v39 = &v42;
    uint64_t v40 = v12;
    char v41 = v14;
    id v36 = (id)v9;
    id v16 = v30;
    id v37 = v16;
    id v38 = v31;
    [(objc_class *)CloudSharingClass sharingStatusForShare:v36 completionHandler:v33];
    uint64_t v17 = [v16 future];
    id v18 = (id)[v17 result];

    if (v43[5])
    {
      uint64_t v29 = v6;
      uint64_t v19 = (void *)MEMORY[0x1E4FB1418];
      uint64_t v20 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v21 = [v20 localizedStringForKey:@"UNABLE_TO_SHARE_ICLOUD_DOCUMENT" value:&stru_1F0817A00 table:@"Main"];
      uint64_t v22 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v23 = [v22 localizedStringForKey:@"UNABLE_TO_SHARE_ICLOUD_DOCUMENT_MESSAGE" value:&stru_1F0817A00 table:@"Main"];
      uint64_t v24 = [v19 alertControllerWithTitle:v21 message:v23 preferredStyle:1];

      uint64_t v25 = (void *)MEMORY[0x1E4FB1410];
      __int16 v26 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      long long v27 = [v26 localizedStringForKey:@"OK" value:&stru_1F0817A00 table:@"Main"];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __70__MFMailComposeController__checkForShareParticipantsWithContinuation___block_invoke_840;
      v32[3] = &unk_1E5F7B3C8;
      v32[4] = self;
      uint64_t v28 = [v25 actionWithTitle:v27 style:1 handler:v32];
      [v24 addAction:v28];

      [(MFMailComposeController *)self _presentModalAlert:v24];
      id v6 = v29;
    }
    else
    {
      v4[2](v4);
    }

    _Block_object_dispose(&v42, 8);
  }
  else
  {
    v4[2](v4);
  }
}

void __70__MFMailComposeController__checkForShareParticipantsWithContinuation___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v5 = [*(id *)(a1 + 32) toRecipients];
  [v4 addObjectsFromArray:v5];

  id v6 = [*(id *)(a1 + 32) ccRecipients];
  [v4 addObjectsFromArray:v6];

  uint64_t v7 = [*(id *)(a1 + 32) bccRecipients];
  [v4 addObjectsFromArray:v7];

  if ((unint64_t)(a2 - 1) > 1)
  {
    id v16 = MFComposeLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF945000, v16, OS_LOG_TYPE_DEFAULT, "No need to add share participants", buf, 2u);
    }

    [*(id *)(a1 + 64) finishWithResult:MEMORY[0x1E4F1CC38]];
  }
  else
  {
    long long v8 = MFComposeLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [NSNumber numberWithInteger:a2];
      *(_DWORD *)buf = 138412290;
      uint64_t v25 = v9;
      _os_log_impl(&dword_1AF945000, v8, OS_LOG_TYPE_DEFAULT, "Adding participants to share as %@", buf, 0xCu);
    }
    if (*(void *)(a1 + 40) && (getCloudSharingClass(), (objc_opt_respondsToSelector() & 1) != 0))
    {
      Class CloudSharingClass = (Class)getCloudSharingClass();
      uint64_t v11 = *(void *)(a1 + 48);
      uint64_t v12 = *(void *)(a1 + 56);
      uint64_t v13 = *(unsigned __int8 *)(a1 + 96);
      char v14 = v23;
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __70__MFMailComposeController__checkForShareParticipantsWithContinuation___block_invoke_830;
      v23[3] = &unk_1E5F7BAA8;
      uint64_t v15 = *(void *)(a1 + 88);
      void v23[5] = *(void *)(a1 + 80);
      v23[4] = *(id *)(a1 + 64);
      [(objc_class *)CloudSharingClass addParticipantsToShareWithURLWrapper:v11 share:v12 emailAddresses:v4 phoneNumbers:MEMORY[0x1E4F1CBF0] permissionType:v15 allowOthersToInvite:v13 completionHandler:v23];
    }
    else
    {
      Class v17 = (Class)getCloudSharingClass();
      uint64_t v18 = *(void *)(a1 + 88);
      uint64_t v19 = *(unsigned __int8 *)(a1 + 96);
      char v14 = v22;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __70__MFMailComposeController__checkForShareParticipantsWithContinuation___block_invoke_832;
      v22[3] = &unk_1E5F7BAA8;
      uint64_t v20 = *(void *)(a1 + 72);
      v22[5] = *(void *)(a1 + 80);
      uint64_t v21 = *(void *)(a1 + 56);
      void v22[4] = *(id *)(a1 + 64);
      [(objc_class *)v17 addParticipantsToShare:v21 containerSetupInfo:v20 emailAddresses:v4 phoneNumbers:MEMORY[0x1E4F1CBF0] permissionType:v18 allowOthersToInvite:v19 completionHandler:v22];
    }
  }
}

void __70__MFMailComposeController__checkForShareParticipantsWithContinuation___block_invoke_830(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  uint64_t v7 = MFComposeLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_1AF945000, v7, OS_LOG_TYPE_DEFAULT, "Adding participants to share finished", v9, 2u);
  }

  if (v6)
  {
    long long v8 = MFComposeLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __70__MFMailComposeController__checkForShareParticipantsWithContinuation___block_invoke_830_cold_1();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a4);
  }
  [*(id *)(a1 + 32) finishWithResult:MEMORY[0x1E4F1CC38]];
}

void __70__MFMailComposeController__checkForShareParticipantsWithContinuation___block_invoke_832(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  uint64_t v7 = MFComposeLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_1AF945000, v7, OS_LOG_TYPE_DEFAULT, "Adding participants to share finished", v9, 2u);
  }

  if (v6)
  {
    long long v8 = MFComposeLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __70__MFMailComposeController__checkForShareParticipantsWithContinuation___block_invoke_830_cold_1();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a4);
  }
  [*(id *)(a1 + 32) finishWithResult:MEMORY[0x1E4F1CC38]];
}

uint64_t __70__MFMailComposeController__checkForShareParticipantsWithContinuation___block_invoke_840(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishModalAlertClosingComposition:0];
}

- (void)_presentSenderCollaborationAlertIfNecessaryForSendingAddress:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(MFMailComposeController *)self hasPresentedSenderCollaborationAlert]
    && [v4 length])
  {
    uint64_t v5 = [(MFMailComposeController *)self compositionContext];
    id v6 = [v5 ckShare];
    uint64_t v7 = [v6 currentUserParticipant];
    long long v8 = [v7 userIdentity];

    uint64_t v9 = [v8 lookupInfo];
    long long v10 = [v9 emailAddress];

    if ([v10 length])
    {
      uint64_t v11 = [MEMORY[0x1E4F607F8] emailAddressWithString:v10];
      uint64_t v12 = [v11 simpleAddress];
      id v32 = [MEMORY[0x1E4F607F8] emailAddressWithString:v4];
      uint64_t v31 = [v32 simpleAddress];
      if ((EFObjectsAreEqual() & 1) == 0)
      {
        uint64_t v13 = (void *)MEMORY[0x1E4F28F38];
        char v14 = [v8 nameComponents];
        id v30 = [v13 localizedStringFromPersonNameComponents:v14 style:2 options:0];

        uint64_t v15 = NSString;
        id v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        Class v17 = [v16 localizedStringForKey:@"ICLOUD_COLLABORATION_WARNING_FORMAT" value:&stru_1F0817A00 table:@"Main"];
        uint64_t v29 = objc_msgSend(v15, "localizedStringWithFormat:", v17, v30, v10);

        uint64_t v18 = (void *)MEMORY[0x1E4FB1418];
        uint64_t v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        uint64_t v20 = [v19 localizedStringForKey:@"ICLOUD_COLLABORATION_WARNING_TITLE" value:&stru_1F0817A00 table:@"Main"];
        uint64_t v21 = [v18 alertControllerWithTitle:v20 message:v29 preferredStyle:1];

        uint64_t v22 = (void *)MEMORY[0x1E4FB1410];
        uint64_t v23 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        uint64_t v24 = [v23 localizedStringForKey:@"OK" value:&stru_1F0817A00 table:@"Main"];
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __88__MFMailComposeController__presentSenderCollaborationAlertIfNecessaryForSendingAddress___block_invoke;
        v33[3] = &unk_1E5F7B3C8;
        v33[4] = self;
        uint64_t v25 = [v22 actionWithTitle:v24 style:1 handler:v33];
        [v21 addAction:v25];

        [(MFMailComposeController *)self _presentModalAlert:v21];
        uint64_t v26 = MFComposeLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          long long v27 = objc_msgSend(v11, "ef_publicDescription");
          uint64_t v28 = objc_msgSend(v32, "ef_publicDescription");
          *(_DWORD *)buf = 138543618;
          id v35 = v27;
          __int16 v36 = 2114;
          id v37 = v28;
          _os_log_impl(&dword_1AF945000, v26, OS_LOG_TYPE_DEFAULT, "Presented sender collaboration alert. Sharing address: %{public}@ Sending address: %{public}@", buf, 0x16u);
        }
        [(MFMailComposeController *)self setHasPresentedSenderCollaborationAlert:1];
      }
    }
  }
}

uint64_t __88__MFMailComposeController__presentSenderCollaborationAlertIfNecessaryForSendingAddress___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishModalAlertClosingComposition:0];
}

- (void)_presentWarnings:(id)a3 index:(unint64_t)a4 suggestionsService:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v35 = a5;
  id v37 = a6;
  if ([v9 count] > a4)
  {
    __int16 v36 = [v9 objectAtIndexedSubscript:a4];
    id v32 = [v36 snippet];
    long long v10 = &stru_1F0817A00;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      long long v10 = [v11 localizedStringForKey:@"OMITTED_ATTACHMENTS_TITLE" value:&stru_1F0817A00 table:@"Main"];

      uint64_t v12 = NSString;
      uint64_t v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      char v14 = [v13 localizedStringForKey:@"CONFIRM_OMITTED_ATTACHMENTS_MESSAGE %@" value:&stru_1F0817A00 table:@"Main"];
      objc_msgSend(v12, "stringWithFormat:", v14, v32);
      uint64_t v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        [(MFMailComposeController *)self _presentWarnings:v9 index:a4 + 1 suggestionsService:v35 completionHandler:v37];
        uint64_t v33 = &stru_1F0817A00;
LABEL_14:

        goto LABEL_15;
      }
      uint64_t v15 = [v36 matchFoundInBCC];

      id v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      if (v15)
      {
        long long v10 = [v16 localizedStringForKey:@"UPGRADE_BCC_RECIPIENTS_TITLE" value:&stru_1F0817A00 table:@"Main"];

        Class v17 = NSString;
        uint64_t v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        [v13 localizedStringForKey:@"CONFIRM_UPGRADE_BCC_RECIPIENTS_MESSAGE %@" value:&stru_1F0817A00 table:@"Main"];
      }
      else
      {
        long long v10 = [v16 localizedStringForKey:@"OMITTED_RECIPIENTS_TITLE" value:&stru_1F0817A00 table:@"Main"];

        Class v17 = NSString;
        uint64_t v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        [v13 localizedStringForKey:@"CONFIRM_OMITTED_RECIPIENTS_MESSAGE %@" value:&stru_1F0817A00 table:@"Main"];
      char v14 = };
      objc_msgSend(v17, "stringWithFormat:", v14, v32);
      uint64_t v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    uint64_t v18 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v10 message:v33 preferredStyle:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v19 = (void *)MEMORY[0x1E4FB1410];
      uint64_t v20 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v21 = [v20 localizedStringForKey:@"ADD_RECIPIENT" value:&stru_1F0817A00 table:@"Main"];
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __87__MFMailComposeController__presentWarnings_index_suggestionsService_completionHandler___block_invoke;
      v46[3] = &unk_1E5F7BAF8;
      v46[4] = self;
      id v47 = v35;
      id v48 = v36;
      uint64_t v22 = [v19 actionWithTitle:v21 style:0 handler:v46];
      [v18 addAction:v22];
    }
    uint64_t v23 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v24 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v25 = [v24 localizedStringForKey:@"SEND_ANYWAY" value:&stru_1F0817A00 table:@"Main"];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __87__MFMailComposeController__presentWarnings_index_suggestionsService_completionHandler___block_invoke_2;
    v40[3] = &unk_1E5F7BB20;
    v40[4] = self;
    id v41 = v35;
    id v42 = v36;
    id v43 = v9;
    unint64_t v45 = a4;
    id v26 = v37;
    id v44 = v26;
    long long v27 = [v23 actionWithTitle:v25 style:0 handler:v40];
    [v18 addAction:v27];

    uint64_t v28 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v29 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v30 = [v29 localizedStringForKey:@"CANCEL" value:&stru_1F0817A00 table:@"Main"];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __87__MFMailComposeController__presentWarnings_index_suggestionsService_completionHandler___block_invoke_3;
    v38[3] = &unk_1E5F7B900;
    id v39 = v26;
    uint64_t v31 = [v28 actionWithTitle:v30 style:1 handler:v38];
    [v18 addAction:v31];

    [(MFMailComposeController *)self _presentModalAlert:v18];
    goto LABEL_14;
  }
  (*((void (**)(id, uint64_t))v37 + 2))(v37, 1);
LABEL_15:
}

void __87__MFMailComposeController__presentWarnings_index_suggestionsService_completionHandler___block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _reportUserEnagagement:1 suggestionService:*(void *)(a1 + 40) warning:*(void *)(a1 + 48)];
  id v2 = [*(id *)(a1 + 32) mailComposeView];
  int v3 = [v2 isQuickReply];

  id v4 = [*(id *)(a1 + 48) core];
  v10[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];

  id v6 = *(void **)(a1 + 32);
  if (v3)
  {
    uint64_t v8 = *MEMORY[0x1E4F73D40];
    id v9 = v5;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    [v6 expandQuickReplyToFullComposeAndPerformAction:2 additionalUserInfo:v7];
  }
  else
  {
    [v6 _updateAndStartCompletingCcFieldWithMissingRecipients:v5];
  }
}

uint64_t __87__MFMailComposeController__presentWarnings_index_suggestionsService_completionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _reportUserEnagagement:0 suggestionService:*(void *)(a1 + 40) warning:*(void *)(a1 + 48)];
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v3 = *(void *)(a1 + 72) + 1;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 56);

  return [v4 _presentWarnings:v6 index:v3 suggestionsService:v5 completionHandler:v2];
}

uint64_t __87__MFMailComposeController__presentWarnings_index_suggestionsService_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_reportUserEnagagement:(BOOL)a3 suggestionService:(id)a4 warning:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__MFMailComposeController__reportUserEnagagement_suggestionService_warning___block_invoke;
  v12[3] = &unk_1E5F7BB48;
  id v9 = v7;
  id v13 = v9;
  BOOL v15 = a3;
  id v10 = v8;
  id v14 = v10;
  uint64_t v11 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
  [v11 performBlock:v12];
}

void __76__MFMailComposeController__reportUserEnagagement_suggestionService_warning___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v12 = 0;
  id v5 = (id)[v3 reportUserEngagement:v2 forWarning:v4 error:&v12];
  id v6 = v12;
  if (v6)
  {
    id v7 = MFComposeLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = *(unsigned __int8 *)(a1 + 48);
      id v9 = objc_opt_class();
      id v10 = "positive";
      *(_DWORD *)buf = 136446722;
      if (!v8) {
        id v10 = "negative";
      }
      id v14 = v10;
      __int16 v15 = 2114;
      id v16 = v9;
      __int16 v17 = 2114;
      id v18 = v6;
      id v11 = v9;
      _os_log_error_impl(&dword_1AF945000, v7, OS_LOG_TYPE_ERROR, "Error occurred while reporting '%{public}s' engagement for warning %{public}@ to Suggestions : %{public}@", buf, 0x20u);
    }
  }
}

- (void)_updateAndStartCompletingCcFieldWithMissingRecipients:(id)a3
{
  id v5 = a3;
  [(CNComposeRecipientTextView *)self->_ccField becomeFirstResponder];
  if ([v5 count] == 1)
  {
    uint64_t v4 = [v5 firstObject];
    [(MFMailComposeRecipientTextView *)self->_ccField appendText:v4];
  }
}

- (void)_promptForMailDropIfNecessaryWithContinuation:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  v54 = (void (**)(void))a3;
  id v55 = self;
  [(MFMailComposeController *)self attachments];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v5 = 0;
  uint64_t v6 = [v4 countByEnumeratingWithState:&v61 objects:v65 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v62 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        uint64_t v10 = [v9 scaledFileSize];
        if (!v10) {
          uint64_t v10 = [v9 decodedFileSize];
        }
        v5 += v10;
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v61 objects:v65 count:16];
    }
    while (v6);
  }

  if (v5 > [MEMORY[0x1E4F77B60] currentUploadLimit])
  {
    id v11 = (void *)MEMORY[0x1E4FB1418];
    id v12 = NSString;
    id v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v14 = [v13 localizedStringForKey:@"TOO_BIG_FOR_CELL %d" value:&stru_1F0817A00 table:@"Main"];
    __int16 v15 = objc_msgSend(v12, "localizedStringWithFormat:", v14, 100);
    id v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    int v17 = [(id)CPGetDeviceRegionCode() isEqualToString:@"CH"];
    id v18 = @"TOO_BIG_FOR_CELL_MESSAGE";
    if (v17)
    {
      id v18 = [NSString stringWithFormat:@"%@_CH", @"TOO_BIG_FOR_CELL_MESSAGE"];
    }
    uint64_t v19 = [v16 localizedStringForKey:v18 value:&stru_1F0817A00 table:@"Main"];
    uint64_t v20 = [v11 alertControllerWithTitle:v15 message:v19 preferredStyle:1];

    if (v17) {
    uint64_t v21 = (void *)MEMORY[0x1E4FB1410];
    }
    uint64_t v22 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v23 = [v22 localizedStringForKey:@"CANCEL" value:&stru_1F0817A00 table:@"Main"];
    uint64_t v24 = [v21 actionWithTitle:v23 style:1 handler:0];
    [v20 addAction:v24];

    [(MFMailComposeController *)v55 presentViewController:v20 animated:1 completion:0];
LABEL_28:

    goto LABEL_29;
  }
  if ([(MFMailComposeController *)v55 _shouldUseMailDrop])
  {
    uint64_t v25 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v53 = [v25 localizedStringForKey:@"MAIL_DROP" value:&stru_1F0817A00 table:@"Main"];

    if ((unint64_t)[v4 count] < 2)
    {
      id v30 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v20 = [v30 localizedStringForKey:@"MAIL_DROP_TITLE_FORMAT" value:&stru_1F0817A00 table:@"Main"];

      uint64_t v31 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v28 = [v31 localizedStringForKey:@"MAIL_DROP_NOT_USE_MESSAGE" value:&stru_1F0817A00 table:@"Main"];

      id v32 = [(_MFMailCompositionContext *)v55->_compositionContext sendLaterDate];

      if (v32)
      {
LABEL_22:
        uint64_t v33 = _EFLocalizedString();

        uint64_t v34 = _EFLocalizedString();

        uint64_t v20 = (void *)v33;
        uint64_t v28 = (void *)v34;
      }
    }
    else
    {
      id v26 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v20 = [v26 localizedStringForKey:@"MAIL_DROP_TITLE_MANY_FORMAT" value:&stru_1F0817A00 table:@"Main"];

      long long v27 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v28 = [v27 localizedStringForKey:@"MAIL_DROP_NOT_USE_MESSAGE_PLURAL" value:&stru_1F0817A00 table:@"Main"];

      uint64_t v29 = [(_MFMailCompositionContext *)v55->_compositionContext sendLaterDate];

      if (v29) {
        goto LABEL_22;
      }
    }
    id v35 = [(_MFMailCompositionContext *)v55->_compositionContext sendLaterDate];

    if (v35)
    {
      uint64_t v36 = _EFLocalizedString();

      v53 = (void *)v36;
    }
    id v50 = objc_msgSend(NSString, "mf_stringRepresentationForBytes:", v5);
    id v52 = objc_msgSend(NSString, "stringWithFormat:", v20, v50);
    [(MFMailComposeController *)v55 setUseMailDrop:0];
    id v37 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v53 message:v52 preferredStyle:0];
    [v37 setModalPresentationStyle:7];
    uint64_t v51 = [v37 popoverPresentationController];
    [v51 setBarButtonItem:v55->_sendButtonItem];
    [v51 setPermittedArrowDirections:1];
    uint64_t v38 = [(_MFMailCompositionContext *)v55->_compositionContext sendLaterDate];
    BOOL v39 = v38 == 0;

    if (v39)
    {
      uint64_t v40 = (void *)MEMORY[0x1E4FB1410];
      id v41 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v42 = [v41 localizedStringForKey:@"MAIL_DROP_USE_MESSAGE" value:&stru_1F0817A00 table:@"Main"];
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      id v59[2] = __73__MFMailComposeController__promptForMailDropIfNecessaryWithContinuation___block_invoke;
      v59[3] = &unk_1E5F7BB70;
      v59[4] = v55;
      long long v60 = v54;
      id v43 = [v40 actionWithTitle:v42 style:0 handler:v59];
      [v37 addAction:v43];
    }
    id v44 = (void *)MEMORY[0x1E4FB1410];
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __73__MFMailComposeController__promptForMailDropIfNecessaryWithContinuation___block_invoke_2;
    v57[3] = &unk_1E5F7B900;
    id v58 = v54;
    unint64_t v45 = [v44 actionWithTitle:v28 style:0 handler:v57];
    [v37 addAction:v45];

    long long v46 = (void *)MEMORY[0x1E4FB1410];
    id v47 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v48 = [v47 localizedStringForKey:@"CANCEL" value:&stru_1F0817A00 table:@"Main"];
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __73__MFMailComposeController__promptForMailDropIfNecessaryWithContinuation___block_invoke_3;
    v56[3] = &unk_1E5F7B3C8;
    v56[4] = v55;
    CGRect v49 = [v46 actionWithTitle:v48 style:1 handler:v56];
    [v37 addAction:v49];

    [(MFMailComposeController *)v55 presentViewController:v37 animated:1 completion:0];
    goto LABEL_28;
  }
  v54[2]();
LABEL_29:
}

uint64_t __73__MFMailComposeController__promptForMailDropIfNecessaryWithContinuation___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setUseMailDrop:1];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "attachments", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = [*(id *)(*((void *)&v8 + 1) + 8 * v5) placeholder];
        [v6 setUseMailDrop:1];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __73__MFMailComposeController__promptForMailDropIfNecessaryWithContinuation___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __73__MFMailComposeController__promptForMailDropIfNecessaryWithContinuation___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setUseMailDrop:0];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _finishModalAlertClosingComposition:0];
}

- (BOOL)_shouldUseMailDrop
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MFMailComposeController *)self sendingAccountProxy];
  uint64_t v4 = v3;
  if ((!v3 || [v3 supportsMailDrop])
    && [MEMORY[0x1E4F77B60] mailDropConfigured])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v5 = [(MFMailComposeController *)self attachments];
    unint64_t v6 = 0;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v11 = [v10 scaledFileSize];
          if (!v11) {
            uint64_t v11 = [v10 decodedFileSize];
          }
          v6 += v11;
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    BOOL v12 = v6 > [MEMORY[0x1E4F77B60] mailDropThreshold];
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (void)setHasAddedEditableHyperlink:(BOOL)a3
{
  self->_hasAddedEditableHyperlinuint64_t k = a3;
}

- (void)_physicallyScaleImagesToScale:(unint64_t)a3 attachments:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        long long v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v10, "imageScalingFlags", (void)v14) & a3) != 0)
        {
          uint64_t v11 = [(MFMailComposeController *)self compositionContext];
          BOOL v12 = [v11 contextID];
          id v13 = (id)[v10 scaledImageToFit:a3 saveScaledImage:1 attachmentContextID:v12];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (void)_prepareImagesForSendWithContinuation:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(MFMailComposeController *)self attachments];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v6 = 0;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v26;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        v6 |= [*(id *)(*((void *)&v25 + 1) + 8 * v9++) imageScalingFlags];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v7);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__MFMailComposeController__prepareImagesForSendWithContinuation___block_invoke;
  aBlock[3] = &unk_1E5F7BBC0;
  aBlock[4] = self;
  id v10 = v5;
  id v23 = v10;
  id v11 = v4;
  id v24 = v11;
  BOOL v12 = (void (**)(void *, void))_Block_copy(aBlock);
  if ([(MFMailComposeController *)self canShowImageSizeField])
  {
    unint64_t v13 = +[MFComposeTypeFactory imageScaleFromUserDefaults];
    if ((v13 & v6) != 0) {
      unint64_t v14 = v13;
    }
    else {
      unint64_t v14 = 0;
    }
    v12[2](v12, v14);
  }
  else if (v6)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    long long v15 = [(MFMailComposeController *)self _estimateMessageSize];
    long long v16 = [(MFMailComposeController *)self prepareImagesForSendScheduler];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __65__MFMailComposeController__prepareImagesForSendWithContinuation___block_invoke_4;
    v17[3] = &unk_1E5F7BC38;
    objc_copyWeak(v20, &location);
    id v18 = v10;
    v20[1] = (id)v6;
    uint64_t v19 = v12;
    [v15 onScheduler:v16 addSuccessBlock:v17];

    objc_destroyWeak(v20);
    objc_destroyWeak(&location);
  }
  else
  {
    v12[2](v12, 0);
  }
}

void __65__MFMailComposeController__prepareImagesForSendWithContinuation___block_invoke(id *a1, void *a2)
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, a1[4]);
  id v4 = [a1[4] prepareImagesForSendScheduler];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__MFMailComposeController__prepareImagesForSendWithContinuation___block_invoke_2;
  v5[3] = &unk_1E5F7BB98;
  objc_copyWeak(v8, &location);
  v8[1] = a2;
  id v6 = a1[5];
  id v7 = a1[6];
  [v4 performBlock:v5];

  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

void __65__MFMailComposeController__prepareImagesForSendWithContinuation___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _physicallyScaleImagesToScale:*(void *)(a1 + 56) attachments:*(void *)(a1 + 32)];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__MFMailComposeController__prepareImagesForSendWithContinuation___block_invoke_3;
  v4[3] = &unk_1E5F7A240;
  id v5 = *(id *)(a1 + 40);
  uint64_t v3 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
  [v3 performBlock:v4];
}

uint64_t __65__MFMailComposeController__prepareImagesForSendWithContinuation___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __65__MFMailComposeController__prepareImagesForSendWithContinuation___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v55 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = [v55 unsignedLongValue];
  unint64_t v59 = [WeakRetained _sizeForScale:0 imagesOnly:0];
  long long v57 = objc_msgSend(NSString, "mf_stringRepresentationForBytes:", v2);
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v72 objects:v79 count:16];
  if (v4)
  {
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v73;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v73 != v6) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v72 + 1) + 8 * i) isDisplayableImage])
        {
          if (v5)
          {

            uint64_t v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
            id v56 = [v8 localizedStringForKey:@"LARGE_IMAGES_MESSAGE" value:&stru_1F0817A00 table:@"Main"];
            goto LABEL_13;
          }
          uint64_t v5 = 1;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v72 objects:v79 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

  uint64_t v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v56 = [v8 localizedStringForKey:@"LARGE_SINGLE_IMAGE_MESSAGE" value:&stru_1F0817A00 table:@"Main"];
LABEL_13:

  uint64_t v9 = (void *)MEMORY[0x1E4FB1418];
  id v10 = objc_msgSend(NSString, "stringWithFormat:", v56, v57);
  long long v60 = [v9 alertControllerWithTitle:v10 message:0 preferredStyle:0];

  memset(v78, 170, sizeof(v78));
  id v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v78[0] = [v11 localizedStringForKey:@"SMALL_SIZE_UNKNOWN_TITLE" value:&stru_1F0817A00 table:@"Main"];
  BOOL v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v78[1] = [v12 localizedStringForKey:@"MEDIUM_SIZE_UNKNOWN_TITLE" value:&stru_1F0817A00 table:@"Main"];
  unint64_t v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v78[2] = [v13 localizedStringForKey:@"LARGE_SIZE_UNKNOWN_TITLE" value:&stru_1F0817A00 table:@"Main"];

  memset(v77, 170, sizeof(v77));
  unint64_t v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v77[0] = [v14 localizedStringForKey:@"SMALL_SIZE_TITLE" value:&stru_1F0817A00 table:@"Main"];
  long long v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v77[1] = [v15 localizedStringForKey:@"MEDIUM_SIZE_TITLE" value:&stru_1F0817A00 table:@"Main"];
  long long v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v77[2] = [v16 localizedStringForKey:@"LARGE_SIZE_TITLE" value:&stru_1F0817A00 table:@"Main"];

  char v17 = 0;
  uint64_t v61 = 0;
  uint64_t v18 = 0;
  memset(location, 0, sizeof(location));
  unint64_t v58 = v2 - v59;
  uint64_t v19 = 1;
  do
  {
    uint64_t v20 = qword_1AFA907F0[v18];
    if ((v20 & *(void *)(a1 + 56)) == 0) {
      goto LABEL_25;
    }
    if (v17)
    {
      objc_storeStrong(&location[v18], (id)v78[v18]);
LABEL_24:
      char v17 = 1;
      goto LABEL_25;
    }
    uint64_t v21 = [WeakRetained compositionContext];
    uint64_t v22 = [v21 attachmentManager];
    id v23 = [WeakRetained compositionContext];
    id v24 = [v23 contextID];
    unint64_t v25 = [v22 sizeForScale:v20 imagesOnly:0 forContext:v24];

    if (!v25)
    {
      uint64_t v32 = 0;
      uint64_t v33 = location;
      do
        objc_storeStrong(v33++, (id)v78[v32++]);
      while (v19 != v32);
      goto LABEL_24;
    }
    long long v26 = NSString;
    uint64_t v27 = v77[v18];
    long long v28 = objc_msgSend(NSString, "mf_stringRepresentationForBytes:", v58 + v25);
    uint64_t v29 = objc_msgSend(v26, "stringWithFormat:", v27, v28);
    id v30 = location[v18];
    location[v18] = v29;

    char v17 = 0;
    if (v25 >= v59) {
      uint64_t v31 = v20;
    }
    else {
      uint64_t v31 = 0;
    }
    v61 |= v31;
LABEL_25:
    ++v18;
    ++v19;
  }
  while (v18 != 3);
  uint64_t v34 = 0;
  uint64_t v35 = v61;
  do
  {
    id v36 = location[v34];
    if (v36)
    {
      uint64_t v37 = qword_1AFA907F0[v34];
      if ((v37 & v35) == 0)
      {
        uint64_t v38 = (void *)MEMORY[0x1E4FB1410];
        v69[0] = MEMORY[0x1E4F143A8];
        v69[1] = 3221225472;
        v69[2] = __65__MFMailComposeController__prepareImagesForSendWithContinuation___block_invoke_5;
        v69[3] = &unk_1E5F7BC10;
        id v70 = *(id *)(a1 + 40);
        uint64_t v71 = v37;
        BOOL v39 = [v38 actionWithTitle:v36 style:0 handler:v69];
        [v60 addAction:v39];

        uint64_t v35 = v61;
      }
    }
    ++v34;
  }
  while (v34 != 3);
  uint64_t v40 = (void *)MEMORY[0x1E4FB1410];
  id v41 = NSString;
  id v42 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v43 = [v42 localizedStringForKey:@"ACTUAL_SIZE_TITLE %@" value:&stru_1F0817A00 table:@"Main"];
  id v44 = objc_msgSend(v41, "stringWithFormat:", v43, v57);
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __65__MFMailComposeController__prepareImagesForSendWithContinuation___block_invoke_7;
  v67[3] = &unk_1E5F7B900;
  id v68 = *(id *)(a1 + 40);
  unint64_t v45 = [v40 actionWithTitle:v44 style:0 handler:v67];
  [v60 addAction:v45];

  long long v46 = (void *)MEMORY[0x1E4FB1410];
  id v47 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v48 = [v47 localizedStringForKey:@"CANCEL" value:&stru_1F0817A00 table:@"Main"];
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __65__MFMailComposeController__prepareImagesForSendWithContinuation___block_invoke_9;
  v66[3] = &unk_1E5F7B3C8;
  v66[4] = WeakRetained;
  CGRect v49 = [v46 actionWithTitle:v48 style:1 handler:v66];
  [v60 addAction:v49];

  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __65__MFMailComposeController__prepareImagesForSendWithContinuation___block_invoke_11;
  v64[3] = &unk_1E5F79038;
  v64[4] = WeakRetained;
  id v50 = v60;
  id v65 = v50;
  uint64_t v51 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
  [v51 performBlock:v64];

  for (uint64_t j = 2; j != -1; --j)
  for (uint64_t k = 2; k != -1; --k)

  for (uint64_t m = 2; m != -1; --m)
}

void __65__MFMailComposeController__prepareImagesForSendWithContinuation___block_invoke_5(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__MFMailComposeController__prepareImagesForSendWithContinuation___block_invoke_6;
  v5[3] = &unk_1E5F7BBE8;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v6 = v2;
  uint64_t v7 = v3;
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F60F28], "mainThreadScheduler", v5[0], 3221225472, __65__MFMailComposeController__prepareImagesForSendWithContinuation___block_invoke_6, &unk_1E5F7BBE8);
  [v4 performBlock:v5];
}

uint64_t __65__MFMailComposeController__prepareImagesForSendWithContinuation___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __65__MFMailComposeController__prepareImagesForSendWithContinuation___block_invoke_7(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __65__MFMailComposeController__prepareImagesForSendWithContinuation___block_invoke_8;
  v2[3] = &unk_1E5F7A240;
  id v3 = *(id *)(a1 + 32);
  id v1 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
  [v1 performBlock:v2];
}

uint64_t __65__MFMailComposeController__prepareImagesForSendWithContinuation___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __65__MFMailComposeController__prepareImagesForSendWithContinuation___block_invoke_9(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __65__MFMailComposeController__prepareImagesForSendWithContinuation___block_invoke_10;
  v2[3] = &unk_1E5F79088;
  void v2[4] = *(void *)(a1 + 32);
  id v1 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
  [v1 performBlock:v2];
}

uint64_t __65__MFMailComposeController__prepareImagesForSendWithContinuation___block_invoke_10(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishModalAlertClosingComposition:0];
}

uint64_t __65__MFMailComposeController__prepareImagesForSendWithContinuation___block_invoke_11(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentModalAlert:*(void *)(a1 + 40)];
}

- (void)serializedPlaceholderForFileName:(id)a3 fileSize:(int64_t)a4 mimeType:(id)a5 contentID:(id)a6 withHandler:(id)a7
{
  id v11 = a7;
  BOOL v12 = (void *)MEMORY[0x1E4F73B68];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __100__MFMailComposeController_serializedPlaceholderForFileName_fileSize_mimeType_contentID_withHandler___block_invoke;
  void v14[3] = &unk_1E5F7BC60;
  id v15 = v11;
  id v13 = v11;
  [v12 placeholderAttachmentForFileName:a3 fileSize:a4 mimeType:a5 contentID:a6 completionBlock:v14];
}

uint64_t __100__MFMailComposeController_serializedPlaceholderForFileName_fileSize_mimeType_contentID_withHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)securityScopeForURL:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1E4F73B68];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__MFMailComposeController_securityScopeForURL_withHandler___block_invoke;
  v11[3] = &unk_1E5F7BC88;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 securityScopeForPlaceholderURL:v10 completionBlock:v11];
}

void __59__MFMailComposeController_securityScopeForURL_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = objc_msgSend(MEMORY[0x1E4F77B90], "securityScopedURL:withToken:", *(void *)(a1 + 32));
  uint64_t v4 = *(void **)(*(void *)(a1 + 40) + 1472);
  uint64_t v5 = [*(id *)(a1 + 32) path];
  [v4 setValue:v3 forKey:v5];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)sendMessage:(unint64_t)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = +[MFMailComposeController signpostLog];
  id v6 = v5;
  unint64_t v7 = a3 - 1;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AF945000, v6, OS_SIGNPOST_EVENT, a3, "MAIL SEND", "Starting sendMessage", buf, 2u);
  }

  self->_resolution = 1;
  uint64_t v8 = MFComposeLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [NSNumber numberWithInteger:self->_resolution];
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v9;
    _os_log_impl(&dword_1AF945000, v8, OS_LOG_TYPE_DEFAULT, "_resolution changed to %@ as the send button was pressed.", buf, 0xCu);
  }
  id v10 = MFComposeLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v12;
    __int16 v25 = 2048;
    long long v26 = self;
    _os_log_impl(&dword_1AF945000, v10, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> User tapped send button", buf, 0x16u);
  }
  [(MFMutableMessageHeaders *)self->_savedHeaders removeHeaderForKey:*MEMORY[0x1E4F60778]];
  [(MFMutableMessageHeaders *)self->_savedHeaders removeHeaderForKey:*MEMORY[0x1E4F60768]];
  [(MFMutableMessageHeaders *)self->_savedHeaders removeHeaderForKey:*MEMORY[0x1E4F60780]];
  [(MFMutableMessageHeaders *)self->_savedHeaders removeHeaderForKey:*MEMORY[0x1E4F606B0]];
  [(MFMutableMessageHeaders *)self->_savedHeaders removeHeaderForKey:*MEMORY[0x1E4F606B8]];
  if (self->_composeWebViewFlags.respondsToCompositionWillFinish)
  {
    id v13 = [(MFMailComposeController *)self composeWebView];
    [v13 compositionWillFinish];
  }
  id v14 = [(MFMailComposeController *)self photoPickerProgressManager];
  [v14 cancelEverything];

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  id v15 = +[MFMailComposeController signpostLog];
  long long v16 = v15;
  if (v7 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)id v23 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AF945000, v16, OS_SIGNPOST_EVENT, a3, "MAIL SEND", "Starting to finalize Body Input", v23, 2u);
  }

  [(MFMailComposeController *)self stripCustomBodyIdentifiers];
  char v17 = +[MFMailComposeController signpostLog];
  uint64_t v18 = v17;
  if (v7 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)id v23 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AF945000, v18, OS_SIGNPOST_EVENT, a3, "MAIL SEND", "Finished finalizing Body Input", v23, 2u);
  }

  uint64_t v19 = +[MFMailComposeController signpostLog];
  uint64_t v20 = v19;
  if (v7 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)id v23 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AF945000, v20, OS_SIGNPOST_EVENT, a3, "MAIL SEND", "Starting to finalize signature", v23, 2u);
  }

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __39__MFMailComposeController_sendMessage___block_invoke;
  v21[3] = &unk_1E5F7B328;
  v22[1] = (id)a3;
  objc_copyWeak(v22, (id *)buf);
  [(MFMailComposeController *)self finalizeSignature:v21];
  objc_destroyWeak(v22);
  objc_destroyWeak((id *)buf);
}

void __39__MFMailComposeController_sendMessage___block_invoke(uint64_t a1)
{
  id v2 = +[MFMailComposeController signpostLog];
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AF945000, v3, OS_SIGNPOST_EVENT, v4, "MAIL SEND", "Finished finalizing signature", buf, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (!WeakRetained || (WeakRetained[1360] & 0x40) != 0)
  {
    uint64_t v8 = +[MFMailComposeController signpostLog];
    id v9 = v8;
    os_signpost_id_t v10 = *(void *)(a1 + 40);
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AF945000, v9, OS_SIGNPOST_EVENT, v10, "MAIL SEND", "Delivery is not hosted", buf, 2u);
    }

    [v6 _finishedComposing];
  }
  else
  {
    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, WeakRetained);
    unint64_t v7 = *(void **)(a1 + 40);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __39__MFMailComposeController_sendMessage___block_invoke_943;
    v11[3] = &unk_1E5F7B328;
    v12[1] = v7;
    objc_copyWeak(v12, (id *)buf);
    [v6 _setUpDeliveryObject:v7 completionHandler:v11];
    objc_destroyWeak(v12);
    objc_destroyWeak((id *)buf);
  }
}

void __39__MFMailComposeController_sendMessage___block_invoke_943(uint64_t a1)
{
  id v2 = +[MFMailComposeController signpostLog];
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)id v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AF945000, v3, OS_SIGNPOST_EVENT, v4, "MAIL SEND", "Finished setting up delivery object", v6, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _finishedComposing];
}

- (int64_t)resolution
{
  return self->_resolution;
}

- (void)setResolution:(int64_t)a3
{
  self->_resolution = a3;
}

- (BOOL)needsDelivery
{
  return (unint64_t)(self->_resolution - 1) < 2;
}

- (void)setUpForSaveAsDraft
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  self->_resolution = 2;
  id v3 = MFComposeLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    os_signpost_id_t v4 = [NSNumber numberWithInteger:self->_resolution];
    int v5 = 138412290;
    id v6 = v4;
    _os_log_impl(&dword_1AF945000, v3, OS_LOG_TYPE_DEFAULT, "_resolution changed to %@ when setting up to save as a draft.", (uint8_t *)&v5, 0xCu);
  }
}

- (BOOL)isSavingAsDraft
{
  return self->_resolution == 2;
}

- (void)_explainAirplaneMode
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__MFMailComposeController__explainAirplaneMode__block_invoke;
  block[3] = &unk_1E5F79088;
  block[4] = self;
  if (_explainAirplaneMode_onceToken != -1) {
    dispatch_once(&_explainAirplaneMode_onceToken, block);
  }
}

void __47__MFMailComposeController__explainAirplaneMode__block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __47__MFMailComposeController__explainAirplaneMode__block_invoke_2;
  v2[3] = &unk_1E5F79088;
  void v2[4] = *(void *)(a1 + 32);
  id v1 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
  [v1 performBlock:v2];
}

void __47__MFMailComposeController__explainAirplaneMode__block_invoke_2(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4FB1418];
  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  os_signpost_id_t v4 = [v3 localizedStringForKey:@"AIRPLANE_TITLE" value:&stru_1F0817A00 table:@"Main"];
  int v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"AIRPLANE_EXPLAIN" value:&stru_1F0817A00 table:@"Main"];
  uint64_t v7 = [v2 alertControllerWithTitle:v4 message:v6 preferredStyle:1];

  uint64_t v8 = (void *)MEMORY[0x1E4FB1410];
  id v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  os_signpost_id_t v10 = [v9 localizedStringForKey:@"OK" value:&stru_1F0817A00 table:@"Main"];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  id v12[2] = __47__MFMailComposeController__explainAirplaneMode__block_invoke_3;
  v12[3] = &unk_1E5F7B3C8;
  void v12[4] = *(void *)(a1 + 32);
  id v11 = [v8 actionWithTitle:v10 style:0 handler:v12];
  [v7 addAction:v11];

  [*(id *)(a1 + 32) _presentModalAlert:v7];
}

uint64_t __47__MFMailComposeController__explainAirplaneMode__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) close];
}

- (void)deliverMessageRemotely:(id)a3
{
  id v4 = a3;
  v19[0] = 0;
  v19[1] = v19;
  _DWORD v19[2] = 0x2020000000;
  v19[3] = 3;
  int64_t resolution = self->_resolution;
  BOOL v6 = resolution == 1;
  if (resolution == 1) {
    [(MFMailComposeController *)self _messageForRemoteDelivery];
  }
  else {
  uint64_t v7 = [(MFMailComposeController *)self _messageForDraft];
  }
  uint64_t v8 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __50__MFMailComposeController_deliverMessageRemotely___block_invoke;
  v15[3] = &unk_1E5F7BD28;
  BOOL v18 = v6;
  v15[4] = self;
  char v17 = v19;
  id v9 = v4;
  id v16 = v9;
  [v7 onScheduler:v8 addSuccessBlock:v15];

  os_signpost_id_t v10 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  id v12[2] = __50__MFMailComposeController_deliverMessageRemotely___block_invoke_2_953;
  v12[3] = &unk_1E5F7BD50;
  id v11 = v9;
  id v13 = v11;
  id v14 = v19;
  [v7 onScheduler:v10 addFailureBlock:v12];

  _Block_object_dispose(v19, 8);
}

void __50__MFMailComposeController_deliverMessageRemotely___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) useMailDrop])
  {
    id v4 = [NSNumber numberWithUnsignedInteger:1];
    int v5 = [v4 stringValue];

    BOOL v6 = [v3 mutableHeaders];
    [v6 setHeader:v5 forKey:*MEMORY[0x1E4F73418]];
  }
  uint64_t v7 = [v3 messageData];
  if (v7)
  {
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    id v9 = *(void **)(a1 + 32);
    if (*(unsigned char *)(a1 + 56))
    {
      uint64_t v10 = [v9 isHideMyEmailMessage];
      id v11 = [*(id *)(a1 + 32) compositionContext];
      id v12 = [v11 sendLaterDate];

      id v13 = (void *)MEMORY[0x1E4F73B70];
      id v14 = [*(id *)(a1 + 32) autosaveIdentifier];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __50__MFMailComposeController_deliverMessageRemotely___block_invoke_2;
      v26[3] = &unk_1E5F7BCD8;
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v28 = *(void *)(a1 + 48);
      v26[4] = v15;
      uint64_t v27 = v8;
      id v16 = (id)[v13 sendMessageData:v7 autosaveIdentifier:v14 isHMEMessage:v10 sendLaterDate:v12 completionBlock:v26];

      char v17 = v27;
    }
    else
    {
      BOOL v18 = [v9 accountProxyGenerator];
      uint64_t v19 = [*(id *)(a1 + 32) sendingEmailAddress];
      uint64_t v20 = [v18 accountProxyContainingEmailAddress:v19 includingInactive:1 originatingBundleID:*(void *)(*(void *)(a1 + 32) + 1616) sourceAccountManagement:*(unsigned int *)(*(void *)(a1 + 32) + 1560)];
      id v12 = [v20 uniqueID];

      uint64_t v21 = (void *)MEMORY[0x1E4F73B68];
      uint64_t v22 = [*(id *)(a1 + 32) autosaveIdentifier];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __50__MFMailComposeController_deliverMessageRemotely___block_invoke_952;
      v23[3] = &unk_1E5F7BD00;
      uint64_t v25 = *(void *)(a1 + 48);
      id v24 = v8;
      [v21 saveMessageData:v7 forAccountWithID:v12 autosaveIdentifier:v22 completionBlock:v23];

      char v17 = v24;
    }

    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    [v3 setMessageBody:0];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __50__MFMailComposeController_deliverMessageRemotely___block_invoke_2(uint64_t a1, int a2, int a3, void *a4)
{
  id v7 = a4;
  if (a2)
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 2;
    if (a3) {
      [*(id *)(a1 + 32) _explainAirplaneMode];
    }
  }
  dispatch_semaphore_t v8 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __50__MFMailComposeController_deliverMessageRemotely___block_invoke_3;
  v10[3] = &unk_1E5F7BCB0;
  char v12 = a2;
  id v9 = v7;
  id v11 = v9;
  [v8 _performBlockWithStrongComposeCoordinator:v10];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __50__MFMailComposeController_deliverMessageRemotely___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 40))
  {
    id v4 = MFComposeLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_1AF945000, v4, OS_LOG_TYPE_DEFAULT, "#SiriMailComposeCoordinator setting sent state", (uint8_t *)&v7, 2u);
    }
    int v5 = @"sent";
  }
  else
  {
    id v4 = MFComposeLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v6 = [*(id *)(a1 + 32) description];
      int v7 = 138412290;
      dispatch_semaphore_t v8 = v6;
      _os_log_impl(&dword_1AF945000, v4, OS_LOG_TYPE_DEFAULT, "#SiriMailComposeCoordinator setting failed state due to error: %@", (uint8_t *)&v7, 0xCu);
    }
    int v5 = @"failed";
  }

  [v3 setState:v5];
}

intptr_t __50__MFMailComposeController_deliverMessageRemotely___block_invoke_952(uint64_t a1, int a2)
{
  if (a2) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __50__MFMailComposeController_deliverMessageRemotely___block_invoke_2_953(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

- (void)_finishedComposing
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  id v4 = [MEMORY[0x1E4F73B48] autosave];
  int v5 = [(MFMailComposeController *)self autosaveIdentifier];
  [v4 removeAutosavedMessageWithIdentifier:v5];

  [(MFMailComposeController *)self setAutosaveSession:0];
  BOOL v6 = [(MFMailComposeController *)self attachments];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__MFMailComposeController__finishedComposing__block_invoke;
  aBlock[3] = &unk_1E5F79088;
  id v32 = v6;
  id v42 = v32;
  int v7 = (void (**)(void))_Block_copy(aBlock);
  if (objc_opt_respondsToSelector())
  {
    *(void *)id location = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)location, self);
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __45__MFMailComposeController__finishedComposing__block_invoke_956;
    v39[3] = &unk_1E5F7BD78;
    objc_copyWeak(&v40, (id *)location);
    [WeakRetained mailComposeControllerCompositionFinished:self prepareForDismissalHandler:v39];
    v7[2](v7);
    objc_destroyWeak(&v40);
    objc_destroyWeak((id *)location);
    goto LABEL_9;
  }
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __45__MFMailComposeController__finishedComposing__block_invoke_2;
  v37[3] = &unk_1E5F7BDA0;
  void v37[4] = self;
  id v38 = WeakRetained;
  dispatch_semaphore_t v8 = _Block_copy(v37);
  BOOL v9 = [(MFMailComposeController *)self needsDelivery];
  if (v9)
  {
    int64_t v10 = [(MFMailComposeController *)self resolution];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __45__MFMailComposeController__finishedComposing__block_invoke_963;
    v33[3] = &unk_1E5F7BDE8;
    BOOL v36 = v10 == 1;
    v33[4] = self;
    uint64_t v34 = v7;
    id v35 = v8;
    [(MFMailComposeController *)self deliverMessageRemotely:v33];
  }
  else
  {
    [(MFMailComposeController *)self _performBlockWithStrongComposeCoordinator:&__block_literal_global_962];
    id v11 = MFComposeLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      char v12 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v12);
      *(_DWORD *)id location = 138543362;
      *(void *)&location[4] = v13;
      _os_log_impl(&dword_1AF945000, v11, OS_LOG_TYPE_DEFAULT, "<%{public}@> Composing an email was cancelled.", location, 0xCu);
    }
    (*((void (**)(void *, void, void))v8 + 2))(v8, 0, 0);
  }

  if (v9)
  {
LABEL_9:
    id v14 = MFLogGeneral();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id location = 0;
      _os_log_impl(&dword_1AF945000, v14, OS_LOG_TYPE_DEFAULT, "Adding analytics for editable hyperlinks", location, 2u);
    }

    id v44 = @"sentWithEditableLink";
    uint64_t v15 = objc_msgSend(NSNumber, "numberWithBool:", -[MFMailComposeController hasAddedEditableHyperlink](self, "hasAddedEditableHyperlink"));
    v45[0] = v15;
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:&v44 count:1];

    char v17 = (void *)[objc_alloc(MEMORY[0x1E4F60260]) initWithEventName:@"com.apple.email.sent" collectionData:v16];
    BOOL v18 = [(MFMailComposeController *)self analyticsCollector];
    [v18 logOneTimeEvent:v17];

    uint64_t v19 = [(MFMailComposeController *)self hideMyEmailAddressIfExists];
    if (v19)
    {
    }
    else if (![(MFMailComposeController *)self hideMyEmailMultipleRecipient])
    {
LABEL_17:

      goto LABEL_18;
    }
    uint64_t v20 = MFLogGeneral();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = [(MFMailComposeController *)self hideMyEmailAddressIfExists];
      BOOL v22 = [(MFMailComposeController *)self hideMyEmailMultipleRecipient];
      *(_DWORD *)id location = 67109376;
      *(_DWORD *)&location[4] = v21 != 0;
      *(_WORD *)&location[8] = 1024;
      *(_DWORD *)&location[10] = v22;
      _os_log_impl(&dword_1AF945000, v20, OS_LOG_TYPE_DEFAULT, "Adding Telemetry for the Compose Session for Hide My Email Send %d and Hide My Email Multiple recipients %d.", location, 0xEu);
    }
    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v23 setObject:&unk_1F08413E0 forKeyedSubscript:@"hideMyEmailSession"];
    id v24 = NSNumber;
    uint64_t v25 = [(MFMailComposeController *)self hideMyEmailAddressIfExists];
    long long v26 = [v24 numberWithInt:v25 != 0];
    [v23 setObject:v26 forKeyedSubscript:@"hideMyEmailSend"];

    uint64_t v27 = objc_msgSend(NSNumber, "numberWithInt:", -[MFMailComposeController hideMyEmailMultipleRecipient](self, "hideMyEmailMultipleRecipient"));
    [v23 setObject:v27 forKeyedSubscript:@"hideMyEmailMultipleRecipient"];

    id v28 = objc_alloc(MEMORY[0x1E4F60260]);
    uint64_t v29 = (void *)[v23 copy];
    id v30 = (void *)[v28 initWithEventName:@"com.apple.mail.hideMyEmailMultipleRecipients" collectionData:v29];

    uint64_t v31 = [(MFMailComposeController *)self analyticsCollector];
    [v31 logOneTimeEvent:v30];

    goto LABEL_17;
  }
LABEL_18:
}

void __45__MFMailComposeController__finishedComposing__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v11 objects:v19 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v12 != v3) {
          objc_enumerationMutation(v1);
        }
        int v5 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        MFGreenTeaLogger();
        BOOL v6 = getCTGreenTeaOsLogHandle();
        int v7 = v6;
        if (v6)
        {
          dispatch_semaphore_t v8 = v6;
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            id v9 = [MEMORY[0x1E4F1C9C8] date];
            int64_t v10 = [v5 contentTypeIdentifier];
            *(_DWORD *)buf = 138412546;
            id v16 = v9;
            __int16 v17 = 2114;
            BOOL v18 = v10;
            _os_log_impl(&dword_1AF945000, v8, OS_LOG_TYPE_INFO, "%@ <Mail>[com.apple.mobilemail]:[com.apple.greentea:mobilemail] Transmitted attachment(s): filetype %{public}@", buf, 0x16u);
          }
        }
      }
      uint64_t v2 = [v1 countByEnumeratingWithState:&v11 objects:v19 count:16];
    }
    while (v2);
  }
}

void __45__MFMailComposeController__finishedComposing__block_invoke_956(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    [WeakRetained _sendAnalyticsSignalForResult:a2];
  }
}

void __45__MFMailComposeController__finishedComposing__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [*(id *)(a1 + 32) _sendAnalyticsSignalForResult:a2];
  int v6 = objc_msgSend(MEMORY[0x1E4FB16C8], "mf_isPad") ^ 1;
  if (a2 != 2) {
    LOBYTE(v6) = 1;
  }
  if ((v6 & 1) == 0)
  {
    int v7 = [*(id *)(a1 + 32) parentViewController];
    [v7 setModalTransitionStyle:13];
  }
  if (objc_opt_respondsToSelector())
  {
    dispatch_semaphore_t v8 = *(void **)(a1 + 40);
    id v9 = [*(id *)(a1 + 32) navigationController];
    [v8 mailComposeController:v9 didFinishWithResult:a2 error:v5];

    if (v5)
    {
      int64_t v10 = MFComposeLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        long long v11 = (objc_class *)objc_opt_class();
        long long v12 = NSStringFromClass(v11);
        long long v13 = [v5 localizedDescription];
        int v14 = 138543618;
        uint64_t v15 = v12;
        __int16 v16 = 2114;
        __int16 v17 = v13;
        _os_log_impl(&dword_1AF945000, v10, OS_LOG_TYPE_DEFAULT, "<%{public}@> Compose error: %{public}@", (uint8_t *)&v14, 0x16u);
      }
    }
  }
}

void __45__MFMailComposeController__finishedComposing__block_invoke_960(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = MFComposeLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1AF945000, v3, OS_LOG_TYPE_DEFAULT, "#SiriMailComposeCoordinator setting cancelled state", v4, 2u);
  }

  [v2 setState:@"cancelled"];
}

void __45__MFMailComposeController__finishedComposing__block_invoke_963(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a2 == 3)
  {
    uint64_t v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MFMailComposeErrorDomain" code:*(unsigned __int8 *)(a1 + 56) userInfo:0];
    id v4 = MFComposeLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = (objc_class *)objc_opt_class();
      int v6 = NSStringFromClass(v5);
      int v7 = [v3 localizedDescription];
      int v9 = 138543618;
      int64_t v10 = v6;
      __int16 v11 = 2114;
      long long v12 = v7;
      _os_log_impl(&dword_1AF945000, v4, OS_LOG_TYPE_DEFAULT, "<%{public}@> Compose error: %{public}@", (uint8_t *)&v9, 0x16u);
    }
    dispatch_semaphore_t v8 = v3;
  }
  else
  {
    dispatch_semaphore_t v8 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)setDraftMessage:(id)a3
{
  id v5 = a3;
  [(MFMailComposeController *)self mf_lock];
  objc_storeStrong((id *)&self->_lastDraftMessage, a3);
  [(MFMailComposeController *)self mf_unlock];
}

- (void)setRecipientsKeyboardType:(int64_t)a3
{
  id v11 = [(CNComposeRecipientTextView *)self->_toField textView];
  id v5 = [v11 textInputTraits];
  [v5 setKeyboardType:a3];

  id v12 = [(CNComposeRecipientTextView *)self->_ccField textView];
  int v6 = [v12 textInputTraits];
  [v6 setKeyboardType:a3];

  int v7 = [(MFMailComposeController *)self mailComposeView];
  id v13 = [v7 bccField];

  dispatch_semaphore_t v8 = v13;
  if (v13)
  {
    int v9 = [v13 textView];
    int64_t v10 = [v9 textInputTraits];
    [v10 setKeyboardType:a3];

    dispatch_semaphore_t v8 = v13;
  }
}

- (id)contentVariationName
{
  if (self->_selectedContentVariationIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v2 = 0;
  }
  else
  {
    id v4 = [(_MFMailCompositionContext *)self->_compositionContext contentVariations];
    id v5 = [v4 objectAtIndexedSubscript:self->_selectedContentVariationIndex];
    id v2 = [v5 name];
  }

  return v2;
}

- (BOOL)canShowContentVariationPicker
{
  id v2 = [(_MFMailCompositionContext *)self->_compositionContext contentVariations];
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

- (void)loadView
{
  [MEMORY[0x1E4F39CF8] setFrameStallSkipRequest:1];
  BOOL v3 = -[MFMailComposeView initWithFrame:options:isQuickReply:]([MFMailComposeView alloc], "initWithFrame:options:isQuickReply:", 0, [(_MFMailCompositionContext *)self->_compositionContext isQuickReply] & _os_feature_enabled_impl(), *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), 320.0, 320.0);
  [(MFMailComposeView *)v3 setComposeViewDelegate:self];
  [(MFMailComposeView *)v3 setComposeRecipientDelegate:self];
  id v4 = [(MFMailComposeView *)v3 toField];
  toField = self->_toField;
  self->_toField = v4;

  int v6 = [(MFMailComposeView *)v3 ccField];
  ccField = self->_ccField;
  self->_ccField = v6;

  dispatch_semaphore_t v8 = [(MFMailComposeView *)v3 subjectField];
  subjectField = self->_subjectField;
  self->_subjectField = v8;

  [(MFComposeSubjectView *)self->_subjectField setDelegate:self];
  int64_t v10 = [(_MFMailCompositionContext *)self->_compositionContext draftSubject];
  [(MFComposeSubjectView *)self->_subjectField setText:v10];

  id v11 = [(MFMailComposeView *)v3 composeWebView];
  composeWebView = self->_composeWebView;
  self->_composeWebView = v11;

  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  id v24 = __35__MFMailComposeController_loadView__block_invoke;
  uint64_t v25 = &unk_1E5F7B3A0;
  id v13 = v3;
  long long v26 = v13;
  uint64_t v27 = self;
  [(MFMailComposeController *)self _performBlockWithStrongComposeCoordinator:&v22];
  double v14 = 1.0;
  if (!self->_contentVisible) {
    double v14 = 0.0;
  }
  -[MFComposeWebView setAlpha:](self->_composeWebView, "setAlpha:", v14, v22, v23, v24, v25);
  if ([(_MFMailCompositionContext *)self->_compositionContext prefersFirstLineSelection]) {
    [(MFComposeWebView *)self->_composeWebView setPrefersFirstLineSelection];
  }
  uint64_t v15 = [(MFMailComposeController *)self composeWebView];
  self->_composeWebViewFlags.respondsToCompositionWillFinish = objc_opt_respondsToSelector() & 1;

  __int16 v16 = [(MFMailComposeController *)self composeWebView];
  self->_composeWebViewFlags.respondsToCompositionDidFailToFinish = objc_opt_respondsToSelector() & 1;

  __int16 v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v18 = self->_subjectField;
  if (v18)
  {
    uint64_t v19 = [(MFComposeSubjectView *)v18 textView];
    [v17 addObserver:self selector:sel__subjectTextChanged_ name:*MEMORY[0x1E4FB30A0] object:v19];
  }
  uint64_t v20 = *MEMORY[0x1E4F5A0C0];
  [v17 addObserver:self selector:sel__recipientTextChanged_ name:*MEMORY[0x1E4F5A0C0] object:self->_toField];
  [v17 addObserver:self selector:sel__recipientTextChanged_ name:v20 object:self->_ccField];
  uint64_t v21 = [(MFMailComposeView *)v13 bccField];
  [v17 addObserver:self selector:sel__recipientTextChanged_ name:v20 object:v21];

  [v17 addObserver:self selector:sel__composeViewDidDraw_ name:@"MailComposeViewDidDraw" object:v13];
  [v17 addObserver:self selector:sel__focusGained_ name:*MEMORY[0x1E4FB3010] object:0];
  if ((_os_feature_enabled_impl() & 1) == 0) {
    [(MFMailComposeView *)v13 setToFieldDelegate:self];
  }
  [(MFMailComposeView *)v13 setNavigationBarDelegate:self];
  [(MFMailComposeView *)v13 setPreservesSuperviewLayoutMargins:1];
  [(MFMailComposeView *)v13 setInsetsLayoutMarginsFromSafeArea:0];
  [(MFMailComposeController *)self setView:v13];
  [(MFMailComposeController *)self _setInitialStateForImageField];
}

void __35__MFMailComposeController_loadView__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setComposeCoordinator:");
  [*(id *)(*(void *)(a1 + 40) + 1208) setComposeCoordinator:v3];
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)MFMailComposeController;
  [(MFMailComposeController *)&v13 viewDidLoad];
  if ((*((unsigned char *)self + 1360) & 0x10) != 0)
  {
    [(MFMailComposeController *)self _restoreMessageValues];
    id v3 = [(MFMailComposeController *)self _addressFieldForField:self->_recipientFieldWhileViewUnloaded];
    [v3 setExpanded:1];
    id v4 = [(MFMailComposeController *)self mailComposeView];
    [v4 setRecipientFieldsEditable:1 animated:0];

    if (v3)
    {
      id v5 = [v3 textView];
      [v5 becomeFirstResponder];
    }
    self->_recipientFieldWhileViewUnloaded = 0;
    *((unsigned char *)self + 1360) &= ~0x10u;
  }
  else
  {
    [(MFMailComposeController *)self _loadCompositionContext];
    id v3 = [(MFMailComposeController *)self mailComposeView];
    [v3 setRecipientFieldsEditable:0 animated:0];
  }

  int v6 = [(MFMailComposeController *)self emailAddresses];
  int v7 = [(MFMailComposeController *)self mailComposeView];
  dispatch_semaphore_t v8 = [v7 fromField];
  [v8 setAvailableAddresses:v6];

  [(MFMailComposeController *)self _setupLargeTitleAccessory];
  [(MFMailComposeController *)self _setupNavigationBarItems];
  [(MFMailComposeController *)self _setupOrnamentViewController];
  [(MFMailComposeController *)self _setupSendLaterOnboardingPaletteIfNecessary];
  [(MFMailComposeController *)self _setupForQuickReply];
  int v9 = [(MFMailComposeController *)self mailComposeView];
  [v9 setPopoverOwner:self];

  [(MFMailComposeController *)self _updateSendAndCloseEnabled];
  int64_t v10 = [(MFMailComposeController *)self compositionContext];
  [v10 insertDeferredAttachmentsIntoComposeWebView:self->_composeWebView];

  id v11 = [[_TtC9MessageUI20MessageUITipsManager alloc] initWith:self];
  tipsManager = self->_tipsManager;
  self->_tipsManager = v11;
}

- (void)viewWillUnload
{
  v4.receiver = self;
  v4.super_class = (Class)MFMailComposeController;
  [(MFMailComposeController *)&v4 viewWillUnload];
  [(MFMailComposeController *)self _saveMessageValues];
  id v3 = [(MFMailComposeController *)self mailComposeView];
  [v3 setComposeViewDelegate:0];
  [v3 setComposeRecipientDelegate:0];
  self->_recipientFieldWhileViewUnloaded = [(MFMailComposeController *)self _fieldForAddressField:self->_lastFocusedRecipientView];
  *((unsigned char *)self + 1360) |= 0x10u;
}

- (void)viewDidUnload
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB6E78] object:0];
  subjectField = self->_subjectField;
  if (subjectField)
  {
    id v5 = [(MFComposeSubjectView *)subjectField textView];
    [v3 removeObserver:self name:*MEMORY[0x1E4FB30A0] object:v5];
  }
  [v3 removeObserver:self name:*MEMORY[0x1E4F5A0C0] object:0];
  [v3 removeObserver:self name:@"MFMailComposeContactsSearchControllerWillBeginSearch" object:0];
  [v3 removeObserver:self name:@"MFMailComposeContactsSearchControllerDidEndSearch" object:0];
  [v3 removeObserver:self name:@"MailComposeViewDidDraw" object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB3010] object:0];
  toField = self->_toField;
  self->_toField = 0;

  ccField = self->_ccField;
  self->_ccField = 0;

  imageSizeField = self->_imageSizeField;
  self->_imageSizeField = 0;

  [(MFComposeSubjectView *)self->_subjectField setDelegate:0];
  int v9 = self->_subjectField;
  self->_subjectField = 0;

  composeWebView = self->_composeWebView;
  self->_composeWebView = 0;

  objc_storeWeak((id *)&self->_savedFirstResponder, 0);
  v11.receiver = self;
  v11.super_class = (Class)MFMailComposeController;
  [(MFMailComposeController *)&v11 viewDidUnload];
}

- (void)viewDidLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)MFMailComposeController;
  [(MFMailComposeController *)&v14 viewDidLayoutSubviews];
  id v3 = [(MFMailComposeController *)self navigationItem];
  objc_super v4 = [v3 _bottomPalette];
  id v5 = [v4 contentView];

  [v5 bounds];
  double v7 = v6;
  [(MFMailComposeController *)self previousPaletteWidth];
  double v9 = v7 - v8;
  if (v9 < 0.0) {
    double v9 = -v9;
  }
  if (v9 >= 2.22044605e-16)
  {
    [(MFMailComposeController *)self setPreviousPaletteWidth:v7];
    objc_msgSend(v5, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4FB2C68], *(double *)(MEMORY[0x1E4FB2C68] + 8));
    double v11 = v10;
    id v12 = [(MFMailComposeController *)self navigationItem];
    objc_super v13 = [v12 _bottomPalette];
    [v13 setPreferredHeight:v11];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)MFMailComposeController;
  [(MFMailComposeController *)&v10 viewWillAppear:a3];
  [(MFMailComposeController *)self pickInitialFirstResponder];
  [(MFMailComposeController *)self setIsModal:1];
  objc_super v4 = [(MFMailComposeController *)self traitCollection];
  char v5 = objc_msgSend(v4, "mf_supportsPopoverPresentation");

  if ((v5 & 1) == 0)
  {
    double v6 = [(MFMailComposeController *)self contactViewController];

    if (v6)
    {
      [(MFMailComposeController *)self setContactViewController:0];
      [(MFMailComposeController *)self setAtomPresentingCard:0];
      [(MFMailComposeController *)self setRecipientPresentingCard:0];
      double v7 = [(MFMailComposeController *)self mailComposeView];
      [v7 restoreFirstResponderWithKeyboardPinning:1];
    }
  }
  [(MFMailComposeController *)self setDelayToShowMarkupHasPassed:0];
  dispatch_time_t v8 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__MFMailComposeController_viewWillAppear___block_invoke;
  block[3] = &unk_1E5F79088;
  block[4] = self;
  dispatch_after(v8, MEMORY[0x1E4F14428], block);
}

void __42__MFMailComposeController_viewWillAppear___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) _attachmentToMarkup];
  int v2 = [*(id *)(a1 + 32) attachmentToMarkupIsLoaded];
  if (v6) {
    int v3 = v2;
  }
  else {
    int v3 = 0;
  }
  objc_super v4 = *(void **)(a1 + 32);
  if (v3 == 1)
  {
    objc_msgSend(v4, "markupAttachment:");
    char v5 = [*(id *)(a1 + 32) compositionContext];
    [v5 setAttachmentToMarkupContentID:0];
  }
  else
  {
    [v4 setDelayToShowMarkupHasPassed:1];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)MFMailComposeController;
  [(MFMailComposeController *)&v11 viewDidAppear:a3];
  objc_super v4 = [(MFMailComposeController *)self view];
  char v5 = [v4 window];

  objc_storeWeak((id *)&self->_containingWindow, v5);
  [(MFMailComposeController *)self _updateSendAndCloseEnabled];
  if ((*((char *)self + 1360) & 0x80000000) == 0)
  {
    [(MFMailComposeController *)self _sendViewVisibilityNotification:@"MFMailComposeViewDidShow" window:v5];
    *((unsigned char *)self + 1360) |= 0x80u;
    [(MFMailComposeController *)self performSelector:sel_clearInitialTitle withObject:0 afterDelay:1.0];
    if ([(MFMailComposeController *)self canShowImageSizeField]) {
      [(MFMailComposeController *)self _scaleImages];
    }
  }
  if ([(_MFMailCompositionContext *)self->_compositionContext caretPosition] != 0x7FFFFFFFFFFFFFFFLL) {
    [(MFMailComposeController *)self setCaretPosition:[(_MFMailCompositionContext *)self->_compositionContext caretPosition]];
  }
  id v6 = [(MFMailComposeController *)self popoverManagerCreateIfNeeded:1];
  [(MFMailComposeController *)self _startAutosaveTimerIfNeeded];
  [(MFMailComposeController *)self _updateAutosaveSession];
  [(MFMailComposeController *)self _makeComposeUserActivityCurrent];
  [(MFMailComposeController *)self _updateSendAndCloseButtonTintColor];
  double v7 = [(MFMailComposeController *)self tipsManager];
  [v7 controllerDidAppear];

  [(MFMailComposeController *)self _performDeferredActionIfNecessary];
  dispatch_time_t v8 = +[MFMailComposeController signpostLog];
  os_signpost_id_t v9 = [(MFMailComposeController *)self signpostID];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)objc_super v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AF945000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v9, "MAIL COMPOSE", "MFMailComposeController viewDidAppear", v10, 2u);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MFMailComposeController;
  [(MFMailComposeController *)&v6 viewWillDisappear:a3];
  [(NSTimer *)self->_autosaveTimer invalidate];
  autosaveTimer = self->_autosaveTimer;
  self->_autosaveTimer = 0;

  autosaveSession = self->_autosaveSession;
  self->_autosaveSession = 0;

  [(MFMailComposeController *)self dismissSheet];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MFMailComposeController;
  -[MFMailComposeController viewDidDisappear:](&v20, sel_viewDidDisappear_);
  uint64_t v5 = [(MFMailComposeController *)self presentedViewController];
  if (v5)
  {
    objc_super v6 = (void *)v5;
    double v7 = [(MFMailComposeController *)self presentedViewController];
    dispatch_time_t v8 = [v7 presentationController];
    uint64_t v9 = [v8 adaptivePresentationStyle];

    if (v9 == 7) {
      [(MFMailComposeController *)self dismissViewControllerAnimated:v3 completion:0];
    }
  }
  objc_super v10 = [(MFMailComposeController *)self presentedViewController];

  if (!v10)
  {
    *((unsigned char *)self + 1360) &= ~0x80u;
    [(MFMailComposeController *)self setDelayToShowMarkupHasPassed:0];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containingWindow);
    [(MFMailComposeController *)self _sendViewVisibilityNotification:@"MFMailComposeViewDidDismiss" window:WeakRetained];
  }
  if (self->_popoverManager)
  {
    id v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 removeObserver:self name:@"MFMailWillPresentPopoverNotification" object:0];

    popoverManager = self->_popoverManager;
    self->_popoverManager = 0;
  }
  if (self->_resolution == 1)
  {
    objc_super v14 = [(_MFMailCompositionContext *)self->_compositionContext sendLaterDate];

    if (!v14) {
      +[MFSoundController playSentMailSound];
    }
  }
  uint64_t v15 = [(MFMailComposeController *)self userActivity];
  [v15 resignCurrent];

  __int16 v16 = [(MFMailComposeController *)self tipsManager];
  [v16 controllerDidDisappear];

  __int16 v17 = +[MFMailComposeController signpostLog];
  os_signpost_id_t v18 = [(MFMailComposeController *)self signpostID];
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)uint64_t v19 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AF945000, v17, OS_SIGNPOST_INTERVAL_END, v18, "MAIL COMPOSE", "MFMailComposeController viewDidDisappear", v19, 2u);
  }
}

- (void)_sendViewVisibilityNotification:(id)a3 window:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_time_t v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v9 = v8;
  if (v7)
  {
    objc_super v11 = @"MFMailComposeViewWindowKey";
    v12[0] = v7;
    objc_super v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    [v9 postNotificationName:v6 object:self userInfo:v10];
  }
  else
  {
    [v8 postNotificationName:v6 object:self];
  }
}

- (void)applicationWillSuspend
{
  v3.receiver = self;
  v3.super_class = (Class)MFMailComposeController;
  [(MFMailComposeController *)&v3 applicationWillSuspend];
  [(MFMailComposeController *)self _prepareForSuspend];
}

- (void)_clearMessageValues
{
  toAddresses = self->_toAddresses;
  if (toAddresses)
  {
    self->_toAddresses = 0;
  }
  ccAddresses = self->_ccAddresses;
  if (ccAddresses)
  {
    self->_ccAddresses = 0;
  }
  bccAddresses = self->_bccAddresses;
  if (bccAddresses)
  {
    self->_bccAddresses = 0;
  }
  subject = self->_subject;
  if (subject)
  {
    self->_subject = 0;
  }
  content = self->_content;
  if (content)
  {
    self->_content = 0;
  }
}

- (void)_saveMessageValues
{
  id v14 = [(MFMailComposeController *)self mailComposeView];
  [(MFMailComposeController *)self _clearMessageValues];
  objc_super v3 = [(CNComposeRecipientTextView *)self->_toField addresses];
  toAddresses = self->_toAddresses;
  self->_toAddresses = v3;

  uint64_t v5 = [(CNComposeRecipientTextView *)self->_ccField addresses];
  ccAddresses = self->_ccAddresses;
  self->_ccAddresses = v5;

  id v7 = [v14 bccField];
  dispatch_time_t v8 = [v7 addresses];
  bccAddresses = self->_bccAddresses;
  self->_bccAddresses = v8;

  objc_super v10 = [(MFComposeSubjectView *)self->_subjectField text];
  subject = self->_subject;
  self->_subject = v10;

  id v12 = [(MFComposeWebView *)self->_composeWebView htmlString];
  content = self->_content;
  self->_content = v12;

  *((unsigned char *)self + 1360) |= [(MFComposeWebView *)self->_composeWebView isDirty];
}

- (void)_restoreMessageValues
{
  id v4 = [(MFMailComposeController *)self mailComposeView];
  if (self->_toAddresses) {
    -[CNComposeRecipientTextView setAddresses:](self->_toField, "setAddresses:");
  }
  if (self->_ccAddresses) {
    -[CNComposeRecipientTextView setAddresses:](self->_ccField, "setAddresses:");
  }
  if (self->_bccAddresses)
  {
    objc_super v3 = [v4 bccField];
    [v3 setAddresses:self->_bccAddresses];
  }
  if (self->_subject) {
    -[MFMailComposeController setSubject:](self, "setSubject:");
  }
  [(MFMailComposeController *)self _clearMessageValues];
}

- (void)_prepareForSuspend
{
  if ((*((unsigned char *)self + 1360) & 8) == 0)
  {
    [(MFMailComposeController *)self _dismissPeoplePicker:0];
    [(MFMailComposeController *)self finishEnteringRecipients];
    [(MFMailComposeController *)self _saveMessageValues];
    *((unsigned char *)self + 1360) |= 8u;
  }
}

- (BOOL)_isActiveComposeController
{
  if ([(MFMailComposeController *)self hosted]) {
    return 1;
  }
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v3 = [WeakRetained mailComposeControllerIsActiveComposeController:self];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (void)didBecomeActiveComposeController
{
  if ([(MFMailComposeController *)self _isActiveComposeController])
  {
    id v3 = [(MFMailComposeController *)self view];
    [v3 setAnimationDisabled:1];
    *((unsigned char *)self + 1360) &= ~4u;
    [(MFMailComposeController *)self _restoreMessageValues];
    [v3 setAnimationDisabled:0];
    [(MFMailComposeController *)self _updateSendAndCloseEnabled];
    [(MFMailComposeController *)self _updateRecipientAtomStyles];
    *((unsigned char *)self + 1360) &= ~8u;
    [(MFMailComposeController *)self _accountsChanged:0];
    [(MFMailComposeController *)self _makeComposeUserActivityCurrent];
  }
}

- (void)applicationDidResume
{
  v3.receiver = self;
  v3.super_class = (Class)MFMailComposeController;
  [(MFMailComposeController *)&v3 applicationDidResume];
  [(MFMailComposeController *)self didBecomeActiveComposeController];
}

- (id)popoverManagerCreateIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(MFMailComposeController *)self view];
  id v6 = [v5 window];

  popoverManager = self->_popoverManager;
  if (popoverManager) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = !v3;
  }
  if (!v8 && v6 != 0)
  {
    objc_super v10 = +[MFMailPopoverManager managerForWindow:v6 createIfNeeded:1];
    objc_super v11 = self->_popoverManager;
    self->_popoverManager = v10;

    if (self->_popoverManager)
    {
      id v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v12 addObserver:self selector:sel__popoverWillBePresented_ name:@"MFMailWillPresentPopoverNotification" object:self->_popoverManager];

      popoverManager = self->_popoverManager;
    }
    else
    {
      popoverManager = 0;
    }
  }
  objc_super v13 = popoverManager;

  return v13;
}

- (id)popoverManager
{
  return [(MFMailComposeController *)self popoverManagerCreateIfNeeded:0];
}

- (void)_popoverWillBePresented:(id)a3
{
  if ([(MFMailComposeController *)self _isActiveComposeController])
  {
    id v4 = [(MFMailComposeController *)self traitCollection];
    int v5 = objc_msgSend(v4, "mf_supportsPopoverPresentation");

    if (v5)
    {
      *((unsigned char *)self + 1361) |= 2u;
      [(MFMailComposeController *)self _updateSendAndCloseEnabled];
    }
  }
}

- (BOOL)canBecomeFirstResponder
{
  return ![(MFMailComposeController *)self _isDummyViewController];
}

- (void)viewLayoutMarginsDidChange
{
  v19.receiver = self;
  v19.super_class = (Class)MFMailComposeController;
  [(MFMailComposeController *)&v19 viewLayoutMarginsDidChange];
  BOOL v3 = [(MFMailComposeController *)self traitCollection];
  id v4 = [(MFMailComposeController *)self view];
  [v4 directionalLayoutMargins];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  objc_super v13 = [(MFMailComposeController *)self view];
  [v13 safeAreaInsets];
  os_signpost_id_t v18 = +[MFComposeDisplayMetrics displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:](MFComposeDisplayMetrics, "displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:", v3, v6, v8, v10, v12, v14, v15, v16, v17);
  [(MFMailComposeController *)self setDisplayMetrics:v18];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = [(MFMailComposeController *)self traitCollection];
  double v5 = [(MFMailComposeController *)self view];
  [v5 directionalLayoutMargins];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v14 = [(MFMailComposeController *)self view];
  [v14 safeAreaInsets];
  objc_super v19 = +[MFComposeDisplayMetrics displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:](MFComposeDisplayMetrics, "displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:", v4, v7, v9, v11, v13, v15, v16, v17, v18);
  [(MFMailComposeController *)self setDisplayMetrics:v19];

  [(MFMailComposeController *)self _updateSendAndCloseButtonTintColor];
}

- (void)_displayMetricsDidChange
{
  id v3 = [(MFMailComposeController *)self displayMetrics];
  [v3 sendBarButtonItemImageInsets];
  -[UIBarButtonItem setImageInsets:](self->_sendButtonItem, "setImageInsets:");
}

- (void)_dismissPresentedViewController
{
  id v3 = [(MFMailComposeController *)self presentedViewController];

  if (v3)
  {
    id v4 = [(MFMailComposeController *)self presentedViewController];
    [v4 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_dismissPresentedHalfSheet
{
  id v8 = [(MFMailComposeController *)self traitCollection];
  if (!objc_msgSend(v8, "mf_supportsPopoverPresentation"))
  {
    id v3 = [(MFMailComposeController *)self presentedViewController];
    if (v3)
    {
      if (!self->_photosPickerController)
      {
        id v4 = [(MFMailComposeController *)self styleSelector];
        if (!v4)
        {
          systemPhotosPickerController = self->_systemPhotosPickerController;

          if (!systemPhotosPickerController) {
            return;
          }
          goto LABEL_7;
        }
      }
LABEL_7:
      id v9 = [(MFMailComposeController *)self composeWebView];
      [v9 releaseFocusAfterDismissing:0];

      id v10 = [(MFMailComposeController *)self presentedViewController];
      [v10 dismissViewControllerAnimated:1 completion:0];

      photosPickerController = self->_photosPickerController;
      self->_photosPickerController = 0;

      double v6 = self->_systemPhotosPickerController;
      self->_systemPhotosPickerController = 0;

      [(MFMailComposeController *)self setStyleSelector:0];
      return;
    }
  }
}

- (id)_messageToDonate
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(MFMailComposeController *)self sendingEmailAddress];
  [v3 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F73D70]];

  double v5 = [(MFMailComposeController *)self toRecipients];
  double v6 = __43__MFMailComposeController__messageToDonate__block_invoke((uint64_t)v5, v5);
  [v3 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F73D80]];

  double v7 = [(MFMailComposeController *)self ccRecipients];
  id v8 = __43__MFMailComposeController__messageToDonate__block_invoke((uint64_t)v7, v7);
  [v3 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F73D60]];

  id v9 = [(MFMailComposeController *)self bccRecipients];
  id v10 = __43__MFMailComposeController__messageToDonate__block_invoke((uint64_t)v9, v9);
  [v3 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F73D58]];

  double v11 = [(MFMailComposeController *)self subject];
  [v3 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F73D78]];

  id v12 = [(MFMailComposeController *)self _copyMessagePlainTextForDonation];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __43__MFMailComposeController__messageToDonate__block_invoke_3;
  v16[3] = &unk_1E5F7BE60;
  id v13 = v3;
  id v17 = v13;
  double v18 = self;
  double v14 = [v12 then:v16];

  return v14;
}

id __43__MFMailComposeController__messageToDonate__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_alloc_init(MFPersonTransformer);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__MFMailComposeController__messageToDonate__block_invoke_2;
  void v7[3] = &unk_1E5F7BE10;
  id v8 = v3;
  id v4 = v3;
  double v5 = objc_msgSend(v2, "ef_compactMap:", v7);

  return v5;
}

id __43__MFMailComposeController__messageToDonate__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(a1 + 32) transformedValue:a2];

  return v2;
}

id __43__MFMailComposeController__messageToDonate__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v17 = a2;
  if ([v17 count])
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v3 = v17;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v21;
      double v6 = &stru_1F0817A00;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v21 != v5) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v9 = NSString;
            id v10 = [v8 string];
            uint64_t v11 = [v9 stringWithFormat:@"%@%@", v6, v10];

            double v6 = (__CFString *)v11;
          }
        }
        uint64_t v4 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v4);
    }
    else
    {
      double v6 = &stru_1F0817A00;
    }

    id v12 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
    id v13 = [(__CFString *)v6 stringByTrimmingCharactersInSet:v12];

    [*(id *)(a1 + 32) setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F73D68]];
  }
  double v14 = (void *)[*(id *)(a1 + 40) _copyMessagePlainTextForDonationRemoveQuotes:1];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __43__MFMailComposeController__messageToDonate__block_invoke_4;
  v18[3] = &unk_1E5F7BE38;
  id v19 = *(id *)(a1 + 32);
  double v15 = [v14 then:v18];

  return v15;
}

id __43__MFMailComposeController__messageToDonate__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v17 = a2;
  if ([v17 count])
  {
    uint64_t v16 = a1;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v3 = v17;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v19;
      double v6 = &stru_1F0817A00;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v19 != v5) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v9 = NSString;
            id v10 = [v8 string];
            uint64_t v11 = [v9 stringWithFormat:@"%@%@", v6, v10];

            double v6 = (__CFString *)v11;
          }
        }
        uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v4);
    }
    else
    {
      double v6 = &stru_1F0817A00;
    }

    id v12 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
    id v13 = [(__CFString *)v6 stringByTrimmingCharactersInSet:v12];

    [*(id *)(v16 + 32) setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F73D88]];
    a1 = v16;
  }
  double v14 = [MEMORY[0x1E4F60D70] futureWithResult:*(void *)(a1 + 32)];

  return v14;
}

- (BOOL)_isTabKeyCommandInvocationPossible
{
  if ([(MFMailComposeController *)self _isDummyViewController]) {
    return 0;
  }
  uint64_t v4 = [(MFMailComposeController *)self view];
  uint64_t v5 = [v4 firstResponder];

  if (v5) {
    BOOL v6 = v5 == self;
  }
  else {
    BOOL v6 = 1;
  }
  BOOL v3 = v6;

  return v3;
}

- (void)_tabKeyCommandInvoked:(id)a3
{
}

- (void)_focusBccHeaderCommandInvoked:(id)a3
{
  id v4 = [(MFMailComposeController *)self mailComposeView];
  BOOL v3 = [v4 bccField];
  [v3 becomeFirstResponder];
}

- (void)_replyAllCommandInvoked:(id)a3
{
}

- (void)_replyCommandInvoked:(id)a3
{
}

- (id)keyCommands
{
  void v17[5] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)keyCommands_keyCommands_0;
  if (!keyCommands_keyCommands_0)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    double v15 = [v16 localizedStringForKey:@"SEND" value:&stru_1F0817A00 table:@"Main"];
    BOOL v3 = __38__MFMailComposeController_keyCommands__block_invoke((uint64_t)v15, @"d", 1179648, (uint64_t)sel_send_, v15, 0);
    v17[0] = v3;
    id v4 = __38__MFMailComposeController_keyCommands__block_invoke((uint64_t)v3, *MEMORY[0x1E4FB2B08], 0, (uint64_t)sel__escapeShortcutInvoked_, 0, 0);
    v17[1] = v4;
    uint64_t v5 = __38__MFMailComposeController_keyCommands__block_invoke((uint64_t)v4, @"\t", 0, (uint64_t)sel__tabKeyCommandInvoked_, 0, 1);
    v17[2] = v5;
    BOOL v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    double v7 = [v6 localizedStringForKey:@"REPLY_ALL" value:&stru_1F0817A00 table:@"Main"];
    id v8 = __38__MFMailComposeController_keyCommands__block_invoke((uint64_t)v7, @"r", 1179648, (uint64_t)sel__replyAllCommandInvoked_, v7, 0);
    v17[3] = v8;
    id v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v10 = [v9 localizedStringForKey:@"REPLY" value:&stru_1F0817A00 table:@"Main"];
    uint64_t v11 = __38__MFMailComposeController_keyCommands__block_invoke((uint64_t)v10, @"r", 0x100000, (uint64_t)sel__replyCommandInvoked_, v10, 0);
    void v17[4] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:5];
    id v13 = (void *)keyCommands_keyCommands_0;
    keyCommands_keyCommands_0 = v12;

    id v2 = (void *)keyCommands_keyCommands_0;
  }

  return v2;
}

id __38__MFMailComposeController_keyCommands__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, int a6)
{
  id v10 = a5;
  uint64_t v11 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:a2 modifierFlags:a3 action:a4];
  [v11 setDiscoverabilityTitle:v10];
  if (a6)
  {
    uint64_t v12 = [v11 _nonRepeatableKeyCommand];

    uint64_t v11 = (void *)v12;
  }

  return v11;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if ([(MFMailComposeController *)self _isDummyViewController])
  {
    BOOL v7 = 0;
    goto LABEL_14;
  }
  if (sel_importDocument == a3)
  {
    unsigned __int8 v8 = [(MFMailComposeController *)self canShowAttachmentPicker];
LABEL_13:
    BOOL v7 = v8;
    goto LABEL_14;
  }
  if (sel_send_ == a3)
  {
    unsigned __int8 v8 = [(MFMailComposeController *)self _shouldEnableSendButton];
    goto LABEL_13;
  }
  if (sel__tabKeyCommandInvoked_ == a3)
  {
    unsigned __int8 v8 = [(MFMailComposeController *)self _isTabKeyCommandInvocationPossible];
    goto LABEL_13;
  }
  if (sel__replyAllCommandInvoked_ == a3)
  {
    BOOL v10 = [(MFMailComposeController *)self composeType] == 4;
  }
  else
  {
    if (sel__replyCommandInvoked_ != a3)
    {
      if (sel_close_ == a3)
      {
        unsigned __int8 v8 = [(UIBarButtonItem *)self->_closeButtonItem isEnabled];
      }
      else
      {
        v11.receiver = self;
        v11.super_class = (Class)MFMailComposeController;
        unsigned __int8 v8 = [(MFMailComposeController *)&v11 canPerformAction:a3 withSender:v6];
      }
      goto LABEL_13;
    }
    BOOL v10 = [(MFMailComposeController *)self composeType] == 5;
  }
  BOOL v7 = v10;
LABEL_14:

  return v7;
}

- (BOOL)isVerticallyCompact
{
  id v2 = [(MFMailComposeController *)self traitCollection];
  BOOL v3 = [v2 verticalSizeClass] == 1;

  return v3;
}

- (BOOL)_isDummyViewController
{
  return (LOBYTE(self->_options) >> 2) & 1;
}

- (int64_t)popoverPresentationStyleForViewController:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  uint64_t v5 = v4;
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v4 viewControllers];
    uint64_t v5 = [v6 firstObject];
  }
  BOOL v7 = [(MFMailComposeController *)self mailComposeView];
  unsigned __int8 v8 = [v7 searchViewController];
  if (v5 == v8)
  {

    goto LABEL_7;
  }
  id v9 = [(MFMailComposeController *)self peoplePicker];

  if (v5 == v9)
  {
LABEL_7:
    int64_t v10 = -1;
    goto LABEL_8;
  }
  int64_t v10 = 3;
LABEL_8:

  return v10;
}

- (void)_dismissPeoplePicker:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MFMailComposeController *)self peoplePicker];

  if (v5)
  {
    id v6 = [(MFMailComposeController *)self peoplePicker];
    BOOL v7 = [(MFMailComposeController *)self presentedViewController];

    if (v6 == v7)
    {
      unsigned __int8 v8 = [v4 popoverPresentationController];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __48__MFMailComposeController__dismissPeoplePicker___block_invoke;
      void v14[3] = &unk_1E5F79088;
      id v9 = v8;
      id v15 = v9;
      [(MFMailComposeController *)self dismissViewControllerAnimated:1 completion:v14];
      int64_t v10 = [(MFMailComposeController *)self traitCollection];
      char v11 = objc_msgSend(v10, "mf_supportsPopoverPresentation");

      if ((v11 & 1) == 0)
      {
        uint64_t v12 = [(MFMailComposeController *)self mailComposeView];
        [v12 restoreFirstResponderWithKeyboardPinning:1];
      }
    }
  }
  [(MFMailComposeController *)self setPeoplePicker:0];
  id v13 = [(MFMailComposeController *)self mailComposeView];
  [v13 setShowingPeoplePicker:0];
}

void __48__MFMailComposeController__dismissPeoplePicker___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = [v2 delegate];
    [v3 presentationControllerDidDismiss:*(void *)(a1 + 32)];
  }
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  BOOL v7 = [v6 emailAddresses];
  unsigned __int8 v8 = [v7 objectAtIndex:0];
  id v9 = [v8 value];

  int64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F5A140]) initWithContact:v6 address:v9 kind:0];
  char v11 = v10;
  if ((*((unsigned char *)self + 1360) & 0x10) == 0)
  {
    [(MFMailComposeRecipientTextView *)self->_lastFocusedRecipientView addRecipient:v10];
    goto LABEL_12;
  }
  int64_t recipientFieldWhileViewUnloaded = self->_recipientFieldWhileViewUnloaded;
  switch(recipientFieldWhileViewUnloaded)
  {
    case 3:
      uint64_t v13 = 1016;
      bccAddresses = self->_bccAddresses;
      if (!bccAddresses) {
        break;
      }
      goto LABEL_11;
    case 2:
      uint64_t v13 = 1008;
      bccAddresses = self->_ccAddresses;
      if (!bccAddresses) {
        break;
      }
      goto LABEL_11;
    case 1:
      uint64_t v13 = 1000;
      bccAddresses = self->_toAddresses;
      if (bccAddresses)
      {
LABEL_11:
        id v15 = [v10 commentedAddress];
        uint64_t v16 = [(NSArray *)bccAddresses arrayByAddingObject:v15];
        id v17 = *(Class *)((char *)&self->super.super.super.isa + v13);
        *(Class *)((char *)&self->super.super.super.isa + v13) = v16;
      }
      break;
  }
LABEL_12:
  [(MFMailComposeController *)self composeRecipientViewDidFinishPickingRecipient:self->_lastFocusedRecipientView];
  [(MFMailComposeController *)self _dismissPeoplePicker:v18];
}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  BOOL v7 = [v6 value];
  id v8 = objc_alloc(MEMORY[0x1E4F5A140]);
  id v9 = [v6 contact];
  int64_t v10 = (void *)[v8 initWithContact:v9 address:v7 kind:0];

  [(MFMailComposeRecipientTextView *)self->_lastFocusedRecipientView addRecipient:v10];
  [(MFMailComposeController *)self _dismissPeoplePicker:v11];
}

- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContactProperty:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 key];
  if (![v8 isEqualToString:*MEMORY[0x1E4F1ADC8]])
  {
    id v9 = v8;
LABEL_13:

    goto LABEL_14;
  }
  id v9 = [(CNComposeRecipientAtom *)self->_atomPresentingCard recipient];

  if (v9)
  {
    int64_t v10 = [v9 contact];
    if (!v10
      || ([v7 contact],
          id v11 = objc_claimAutoreleasedReturnValue(),
          char v12 = [v10 isEqual:v11],
          v11,
          (v12 & 1) == 0))
    {
      long long v22 = [v9 address];
      if (v10)
      {
        uint64_t v13 = [v7 value];
        [v9 setAddress:v13];
      }
      else
      {
        uint64_t v13 = [v7 contact];
        [v9 setContact:v13];
      }

      *((unsigned char *)self + 1360) |= 1u;
      double v14 = [v7 key];
      id v15 = [v7 identifier];
      [v6 highlightPropertyWithKey:v14 identifier:v15];

      uint64_t v16 = [v9 address];
      if (([v22 isEqualToString:v16] & 1) == 0)
      {
        secureCompositionManager = self->_secureCompositionManager;
        id v18 = [MEMORY[0x1E4F1CAD0] setWithObject:v22];
        [(MFSecureMIMECompositionManager *)secureCompositionManager removeRecipients:v18];

        long long v19 = self->_secureCompositionManager;
        long long v20 = [MEMORY[0x1E4F1CAD0] setWithObject:v16];
        [(MFSecureMIMECompositionManager *)v19 addRecipients:v20];
      }
    }

    goto LABEL_13;
  }
LABEL_14:

  return 0;
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  if (a4) {
    [(MFMailComposeController *)self _dismissPersonCard];
  }
}

- (void)_dismissPersonCard
{
  [(MFMailComposeController *)self setAtomPresentingCard:0];
  [(MFMailComposeController *)self setRecipientPresentingCard:0];
  id v5 = [(MFMailComposeController *)self traitCollection];
  int v3 = objc_msgSend(v5, "mf_supportsPopoverPresentation");

  if (v3)
  {
    id v6 = [(MFMailComposeController *)self mailComposeView];
    [v6 cancelDelayedPopover];

    [(MFMailComposeController *)self dismissViewControllerAnimated:1 completion:0];
  }
  else
  {
    id v7 = [(MFMailComposeController *)self navigationController];
    id v4 = (id)[v7 popViewControllerAnimated:1];
  }
}

- (id)rotatingHeaderView
{
  return 0;
}

- (void)willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  id v6 = [(MFMailComposeController *)self mailComposeView];
  [v6 willRotateToInterfaceOrientation:a3 duration:a4];
}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3
{
  id v4 = [(MFMailComposeController *)self mailComposeView];
  [v4 didRotateFromInterfaceOrientation:a3];
}

- (void)_getRotationContentSettings:(id *)a3
{
  if ((objc_msgSend(MEMORY[0x1E4FB16C8], "mf_isPad") & 1) == 0)
  {
    *(_WORD *)&a3->var0 = 257;
    a3->var2 = 1;
    a3->var5 = 1.0;
  }
}

- (id)_sheetDetentForIdentifier:(id)a3 viewController:(id)a4
{
  id v5 = a4;
  id v6 = (void *)MEMORY[0x1E4FB1C30];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __68__MFMailComposeController__sheetDetentForIdentifier_viewController___block_invoke;
  v10[3] = &unk_1E5F7B580;
  id v11 = v5;
  id v7 = v5;
  id v8 = [v6 customDetentWithIdentifier:a3 resolver:v10];

  return v8;
}

double __68__MFMailComposeController__sheetDetentForIdentifier_viewController___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  int v3 = [a2 containerTraitCollection];
  [v2 preferredHeightForTraitCollection:v3];
  double v5 = v4;

  return v5;
}

- (void)composeSubjectViewTextFieldDidResignFirstResponder:(id)a3
{
  if (self->_subjectField == a3) {
    [(MFMailComposeController *)self _updateNavigationBarTitleAnimated:0];
  }
}

- (void)composeSubjectViewTextFieldDidBecomeFirstResponder:(id)a3
{
  double v4 = (MFComposeSubjectView *)a3;
  if (self->_subjectField == v4)
  {
    id v6 = v4;
    [(MFMailComposeController *)self _dismissPresentedHalfSheet];
    double v5 = [(MFMailComposeController *)self mailComposeView];
    [v5 viewDidBecomeFirstResponder:v6];

    double v4 = v6;
  }
}

- (void)composeHeaderViewDidChangeValue:(id)a3
{
  if (self->_subjectField == a3)
  {
    [(MFMailComposeController *)self _updateNavigationBarTitleAnimated:0];
    id v5 = [(MFMailComposeController *)self composeCoordinator];
    double v4 = [(MFComposeSubjectView *)self->_subjectField text];
    [v5 setSubject:v4];
  }
}

- (void)composeHeaderViewDidConfirmValue:(id)a3
{
  if (self->_subjectField == a3)
  {
    [(MFMailComposeController *)self _updateNavigationBarTitleAnimated:0];
    id v4 = [(MFMailComposeController *)self composeWebView];
    [v4 becomeFirstResponder];
  }
}

- (void)composeSubjectViewWillRemoveContent:(id)a3
{
  if (self->_subjectField == a3) {
    +[MFComposeTypeFactory hijackThreadFromDelegate:self];
  }
}

- (void)_showOriginalAttachmentsIfNecessary:(id)a3
{
  id v5 = a3;
  if ([(_MFMailCompositionContext *)self->_compositionContext includeAttachmentsWhenAdding]&& [(MFMailComposeController *)self _shouldRestoreAttachments:v5])
  {
    id v4 = [(MFMailComposeController *)self composeWebView];
    [v4 showOriginalAttachments];
  }
}

- (BOOL)_shouldRestoreAttachments:(id)a3
{
  id v4 = a3;
  if ([(MFMailComposeController *)self composeType] == 4
    || [(MFMailComposeController *)self composeType] == 5)
  {
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", self->_toAddresses, self->_bccAddresses, self->_ccAddresses, 0);
    id v6 = objc_msgSend(v5, "ef_flatten");
    id v7 = objc_msgSend(v6, "ef_map:", &__block_literal_global_1079);

    id v8 = [v4 address];
    id v9 = [v8 emailAddressValue];
    int64_t v10 = v9;
    if (v9) {
      [v9 stringValue];
    }
    else {
    id v11 = [v8 stringValue];
    }

    int v12 = [v7 containsObject:v11] ^ 1;
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

id __53__MFMailComposeController__shouldRestoreAttachments___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  int v3 = [v2 emailAddressValue];
  id v4 = v3;
  if (v3) {
    [v3 stringValue];
  }
  else {
  id v5 = [v2 stringValue];
  }

  return v5;
}

- (void)composeRecipientView:(id)a3 didAddRecipient:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = (MFMailComposeToField *)a3;
  id v7 = a4;
  secureCompositionManager = self->_secureCompositionManager;
  id v9 = (void *)MEMORY[0x1E4F1CAD0];
  int64_t v10 = [v7 address];
  id v11 = [v9 setWithObject:v10];
  [(MFSecureMIMECompositionManager *)secureCompositionManager addRecipients:v11];

  if (self->_initializedRecipients) {
    [(MFMailComposeController *)self _showOriginalAttachmentsIfNecessary:v7];
  }
  if ([(MFMailComposeController *)self sourceAccountManagement] != 2
    && [(_MFMailCompositionContext *)self->_compositionContext isUsingDefaultAccount]
    && self->_toField == v6)
  {
    int v12 = [(CNComposeRecipientTextView *)v6 recipients];
    uint64_t v13 = [v12 count];

    id v14 = objc_alloc(MEMORY[0x1E4F607F8]);
    id v15 = [v7 preferredSendingAddress];
    uint64_t v16 = (void *)[v14 initWithString:v15];
    id v17 = [v16 simpleAddress];

    if (v13 == 1 && v17)
    {
      id v18 = (void *)[objc_alloc(MEMORY[0x1E4F607F8]) initWithString:self->_sendingEmailAddress];
      long long v19 = [v18 simpleAddress];

      long long v20 = (void *)[objc_alloc(MEMORY[0x1E4F607F8]) initWithString:self->_originalSendingEmailAddress];
      long long v21 = [v20 simpleAddress];
      uint64_t v22 = [v19 compare:v21];

      if (!v22 && [v19 compare:v17])
      {
        uint64_t v23 = [(MFMailComposeController *)self sendingEmailAddress];
        if ([(MFMailComposeController *)self _setSendingEmailAddress:v17])
        {
          id v24 = (void *)[objc_alloc(MEMORY[0x1E4F60808]) initWithStyle:2];
          uint64_t v25 = MFLogGeneral();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            uint64_t v31 = v24;
            long long v26 = [v24 stringFromEmailAddressConvertible:v23];
            uint64_t v27 = [v24 stringFromEmailAddressConvertible:v17];
            *(_DWORD *)buf = 138543618;
            uint64_t v33 = v26;
            __int16 v34 = 2114;
            id v35 = v27;
            _os_log_impl(&dword_1AF945000, v25, OS_LOG_TYPE_INFO, "Setting to preferred sending account base on recipient from %{public}@ to %{public}@", buf, 0x16u);

            id v24 = v31;
          }

          [(MFMailComposeController *)self _updateAutoBccSendingAddress:v23 withNewSendingAddress:v17 alwaysAdd:0];
          id v28 = [(MFMailComposeController *)self mailComposeView];
          uint64_t v29 = [v28 multiField];
          [v29 setAccountAutoselected:1];
        }
      }
    }
  }
  if (self->_toField == v6)
  {
    id v30 = [(MFMailComposeController *)self mailComposeView];
    [v30 findCorecipientsWithRecipientView:self->_toField];
  }
  [(MFMailComposeController *)self _updateSendAndCloseEnabled];
  if (_os_feature_enabled_impl()) {
    [(MFMailComposeController *)self _updateSMIMEStatusControl];
  }
  else {
    [(MFMailComposeController *)self _updateSMIMEButtonEnabledForRecipientCount];
  }
}

- (void)composeRecipientView:(id)a3 didRemoveRecipient:(id)a4
{
  int64_t v10 = (MFMailComposeToField *)a3;
  id v6 = [a4 address];
  if (![(MFMailComposeController *)self _anyRecipientViewContainsAddress:v6])
  {
    secureCompositionManager = self->_secureCompositionManager;
    id v8 = [MEMORY[0x1E4F1CAD0] setWithObject:v6];
    [(MFSecureMIMECompositionManager *)secureCompositionManager removeRecipients:v8];
  }
  if (self->_toField == v10)
  {
    id v9 = [(MFMailComposeController *)self mailComposeView];
    [v9 findCorecipientsWithRecipientView:self->_toField];
  }
  if (_os_feature_enabled_impl()) {
    [(MFMailComposeController *)self _updateSMIMEStatusControl];
  }
  else {
    [(MFMailComposeController *)self _updateSMIMEButtonEnabledForRecipientCount];
  }
  [(MFMailComposeController *)self _recipientTextChangedForHME];
}

- (void)composeRecipientView:(id)a3 didReplaceRecipients:(id)a4 withRecipients:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  long long v21 = v7;
  id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v8, "count"));
  int64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v7, "count"));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v27;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v11);
        }
        id v15 = [*(id *)(*((void *)&v26 + 1) + 8 * v14) address];
        [v9 addObject:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v12);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v16 = v21;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v23;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v16);
        }
        long long v20 = [*(id *)(*((void *)&v22 + 1) + 8 * v19) address];
        if (([v9 containsObject:v20] & 1) == 0
          && ![(MFMailComposeController *)self _anyRecipientViewContainsAddress:v20])
        {
          [v10 addObject:v20];
        }

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v17);
  }

  [(MFSecureMIMECompositionManager *)self->_secureCompositionManager removeRecipients:v10];
  [(MFSecureMIMECompositionManager *)self->_secureCompositionManager addRecipients:v9];
  if (_os_feature_enabled_impl()) {
    [(MFMailComposeController *)self _updateSMIMEStatusControl];
  }
  else {
    [(MFMailComposeController *)self _updateSMIMEButtonEnabledForRecipientCount];
  }
  [(MFMailComposeController *)self _recipientTextChangedForHME];
}

- (void)composeRecipientView:(id)a3 didFinishEnteringAddress:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(MFMailComposeController *)self mailComposeView];
  [v7 clearSearchForRecipientView:v8 reflow:0 clear:1];
  if ([v6 length])
  {
    [v7 didIgnoreSearchResults];
    [v7 setChangingRecipients:1];
    [v8 addAddress:v6];
    [v7 setChangingRecipients:0];
  }
}

- (void)composeRecipientView:(id)a3 disambiguateRecipientForAtom:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(MFMailComposeController *)self mailComposeView];
  id v8 = [v6 recipient];
  [v7 disambiguateRecipient:v8 recipientView:v9];
}

- (void)composeRecipientView:(id)a3 didSelectRecipients:(id)a4
{
  id v4 = [(MFMailComposeController *)self mailComposeView];
  [v4 dismissSearchResultsIfDisambiguating];
}

- (void)composeHeaderView:(id)a3 didChangeSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v8 = a3;
  id v7 = [(MFMailComposeController *)self mailComposeView];
  objc_msgSend(v7, "layoutForChangedComposeHeaderView:size:", v8, width, height);
}

- (void)composeRecipientView:(id)a3 textDidChange:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [(MFMailComposeController *)self mailComposeView];
  id v8 = [v11 textView];
  int v9 = [v8 isFirstResponder];
  if ([v6 length]) {
    int v10 = v9;
  }
  else {
    int v10 = 0;
  }
  if (v10 == 1 && ([v7 isShowingPeoplePicker] & 1) == 0) {
    [v7 beginSearchForText:v6 recipientView:v11];
  }
  else {
    [v7 clearSearchForActiveRecipientView];
  }
  [(MFMailComposeController *)self _draftContentDidChange];
  [(MFMailComposeController *)self _invalidateInputContextHistory];
}

- (void)composeRecipientViewRequestAddRecipient:(id)a3
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(MFMailComposeController *)self mailComposeView];
  id v6 = [v4 addButton];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1BB80]) initWithNibName:0 bundle:0];
  v34[0] = *MEMORY[0x1E4F1ADC8];
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
  [v7 setDisplayedPropertyKeys:v8];

  [v7 setDelegate:self];
  [v7 setHidesPromptInLandscape:1];
  [v7 setAllowsEditing:0];
  int v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"emailAddresses.@count > 0"];
  [v7 setPredicateForEnablingContact:v9];

  int v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"emailAddresses.@count == 1"];
  [v7 setPredicateForSelectionOfContact:v10];

  if ((objc_msgSend(MEMORY[0x1E4FB16C8], "mf_isPad") & 1) == 0)
  {
    id v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v12 = [v11 localizedStringForKey:@"SELECT_CONTACT" value:&stru_1F0817A00 table:@"Main"];
    [v7 setPrompt:v12];
  }
  if (![(MFMailComposeController *)self _allowsAutorotation]
    || ([(MFMailComposeController *)self navigationController],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        char v14 = [v13 _allowsAutorotation],
        v13,
        (v14 & 1) == 0))
  {
    [v7 _setAllowsAutorotation:0];
  }
  [(MFMailComposeController *)self setPeoplePicker:v7];
  [v5 setShowingPeoplePicker:1];
  id v15 = [v4 text];
  [(MFMailComposeController *)self composeRecipientView:v4 didFinishEnteringAddress:v15];

  id v16 = [(MFMailComposeController *)self traitCollection];
  char v17 = objc_msgSend(v16, "mf_supportsPopoverPresentation");

  if (v17)
  {
    uint64_t v18 = [(MFMailComposeController *)self mailComposeView];
    [v18 saveFirstResponderWithKeyboardPinning:1];

    if ([(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection] == 1) {
      uint64_t v19 = 4;
    }
    else {
      uint64_t v19 = 8;
    }
    long long v20 = [(MFMailComposeController *)self peoplePicker];
    [v20 setModalPresentationStyle:7];

    long long v21 = [(MFMailComposeController *)self peoplePicker];
    long long v22 = [v21 popoverPresentationController];

    [v22 setSourceView:v6];
    [v6 bounds];
    objc_msgSend(v22, "setSourceRect:");
    [v22 setPermittedArrowDirections:v19];
    [v22 setDelegate:self];
  }
  else
  {
    long long v23 = [v7 presentationController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      long long v25 = [v7 presentationController];
      [v25 setPrefersGrabberVisible:1];
    }
    long long v22 = [(MFMailComposeController *)self mailComposeView];
    [v22 saveFirstResponderWithKeyboardPinning:0];
  }

  if (MFIsMobileMail())
  {
    long long v26 = [(MFMailComposeController *)self peoplePicker];
    long long v27 = [v26 view];
    [v27 _setContinuousCornerRadius:10.0];

    long long v28 = [(MFMailComposeController *)self peoplePicker];
    long long v29 = [v28 view];
    [v29 setClipsToBounds:1];

    id v30 = [(MFMailComposeController *)self peoplePicker];
    uint64_t v31 = [v30 view];
    uint64_t v32 = [v31 layer];
    [v32 setMaskedCorners:3];
  }
  uint64_t v33 = [(MFMailComposeController *)self peoplePicker];
  [(MFMailComposeController *)self presentViewController:v33 animated:1 completion:0];
}

- (void)composeRecipientViewDidFinishPickingRecipient:(id)a3
{
  id v4 = [(MFMailComposeController *)self mailComposeView];
  [v4 setShowingPeoplePicker:0];

  id v5 = [(MFMailComposeController *)self traitCollection];
  char v6 = objc_msgSend(v5, "mf_supportsPopoverPresentation");

  if ((v6 & 1) == 0)
  {
    [(MFMailComposeController *)self dismissViewControllerAnimated:1 completion:0];
    uint64_t v7 = [(MFMailComposeController *)self setPeoplePicker:0];
    MEMORY[0x1F4166DB8](v7);
  }
}

- (unint64_t)presentationOptionsForRecipient:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MFMailComposeController *)self _hasEncryptionIdentityError];
  unint64_t v6 = [(MFMailComposeController *)self _defaultAtomPresentationOptions];
  uint64_t v7 = [v4 address];
  id v8 = [v7 emailAddressValue];
  int v9 = [v8 simpleAddress];

  unint64_t v24 = v6;
  if (!v5)
  {
    int v10 = [(MFMailComposeController *)self certificatesByRecipient];
    id v11 = [v10 objectForKey:v7];
    if (v11)
    {

LABEL_4:
      unint64_t v6 = 128;
LABEL_5:
      unint64_t v24 = v6;
      goto LABEL_6;
    }
    if (v9)
    {
      uint64_t v18 = [(MFMailComposeController *)self certificatesByRecipient];
      uint64_t v19 = [v18 objectForKey:v9];

      if (v19) {
        goto LABEL_4;
      }
    }
    else
    {
    }
    long long v20 = [(MFMailComposeController *)self errorsByRecipient];
    long long v21 = [v20 objectForKey:v7];
    if (v21)
    {

LABEL_19:
      unint64_t v6 = 65;
      goto LABEL_5;
    }
    if (v9)
    {
      long long v22 = [(MFMailComposeController *)self errorsByRecipient];
      long long v23 = [v22 objectForKey:v9];

      if (v23) {
        goto LABEL_19;
      }
    }
    else
    {
    }
  }
LABEL_6:
  uint64_t v12 = [v4 address];
  char HasSafeDomain = MFAddressHasSafeDomain(v12);

  if ((HasSafeDomain & 1) == 0)
  {
    v6 |= 1uLL;
    unint64_t v24 = v6;
  }
  char v14 = [MEMORY[0x1E4F60D58] currentDevice];
  if ([v14 isInternal])
  {
    id v15 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
    int v16 = [v15 BOOLForKey:@"PresentationOptionsEncodedIntoAddress"];

    if (v16)
    {
      [MEMORY[0x1E4F5A0C8] presentationOptions:&v24 encodedIntoAddress:v9];
      unint64_t v6 = v24;
    }
  }
  else
  {
  }
  return v6;
}

- (void)_setLastFocusedRecipientView:(id)a3
{
  BOOL v5 = (MFMailComposeRecipientTextView *)a3;
  p_lastFocusedRecipientView = &self->_lastFocusedRecipientView;
  lastFocusedRecipientView = self->_lastFocusedRecipientView;
  int v9 = v5;
  if (lastFocusedRecipientView != v5)
  {
    [(CNComposeRecipientTextView *)lastFocusedRecipientView setExpanded:0];
    [(CNComposeRecipientTextView *)*p_lastFocusedRecipientView setShowsAddButtonWhenExpanded:0];
    [(CNComposeRecipientTextView *)v9 setExpanded:1];
    id v8 = [(MFMailComposeController *)self composeCoordinator];
    [(CNComposeRecipientTextView *)v9 setShowsAddButtonWhenExpanded:v8 == 0];

    objc_storeStrong((id *)p_lastFocusedRecipientView, a3);
  }
}

- (void)recipientViewDidBecomeFirstResponder:(id)a3
{
  id v5 = a3;
  -[MFMailComposeController _setLastFocusedRecipientView:](self, "_setLastFocusedRecipientView:");
  id v4 = [(MFMailComposeController *)self mailComposeView];
  [v4 setRecipientFieldsEditable:1 animated:1];
}

- (void)recipientViewDidResignFirstResponder:(id)a3
{
  id v5 = [(MFMailComposeController *)self mailComposeView];
  if (([v5 isShowingPeoplePicker] & 1) == 0)
  {
    id v4 = [(MFMailComposeController *)self mailComposeView];
    [v4 setRecipientFieldsEditable:0 animated:1];
  }
}

- (id)nextResponderForRecipientView:(id)a3
{
  int v3 = [(MFMailComposeController *)self view];

  return v3;
}

- (void)composeRecipientViewReturnPressed:(id)a3
{
  id v5 = a3;
  id v4 = [(MFMailComposeController *)self mailComposeView];
  [v4 focusFirstResponderAfterRecipientView:v5];
}

- (void)composeRecipientViewDidBecomeFirstResponder:(id)a3
{
  id v5 = a3;
  [(MFMailComposeController *)self _dismissPresentedHalfSheet];
  id v4 = [(MFMailComposeController *)self mailComposeView];
  [v4 viewDidBecomeFirstResponder:v5];
}

- (void)composeRecipientView:(id)a3 showPersonCardForAtom:(id)a4
{
  id v20 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = [v6 recipient];
    int v9 = [(MFMailComposeController *)self _contactViewControllerForRecipient:v8];
    int v10 = [v9 contentViewController];
    [v10 setContactDelegate:self];

    id v11 = [v8 labeledValueIdentifier];
    [v9 highlightPropertyWithKey:*MEMORY[0x1E4F1ADC8] identifier:v11];

    [(MFMailComposeController *)self setContactViewController:v9];
    if (v9)
    {
      uint64_t v12 = [v20 navTitle];
      [v9 setTitle:v12];

      [v9 setHidesBottomBarWhenPushed:1];
      [(MFMailComposeController *)self setAtomPresentingCard:v7];
      [(MFMailComposeController *)self _updatePersonCard];
      uint64_t v13 = [(MFMailComposeController *)self traitCollection];
      int v14 = objc_msgSend(v13, "mf_supportsPopoverPresentation");

      if (v14)
      {
        id v15 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v9];
        [v15 setModalPresentationStyle:7];
        if (![(MFMailComposeController *)self _allowsAutorotation]
          || ([(MFMailComposeController *)self navigationController],
              int v16 = objc_claimAutoreleasedReturnValue(),
              char v17 = [v16 _allowsAutorotation],
              v16,
              (v17 & 1) == 0))
        {
          [v15 _setAllowsAutorotation:0];
        }
        uint64_t v18 = [v15 popoverPresentationController];
        [v18 setSourceView:v7];
        [(MFMailComposeController *)self presentViewController:v15 animated:1 completion:0];
      }
      else
      {
        uint64_t v19 = [(MFMailComposeController *)self mailComposeView];
        [v19 saveFirstResponderWithKeyboardPinning:0];

        id v15 = [(MFMailComposeController *)self navigationController];
        [v15 pushViewController:v9 animated:1];
      }
    }
  }
}

- (void)_removeRecent
{
  id v6 = [(MFMailComposeController *)self recipientPresentingCard];
  if (v6)
  {
    int v3 = [(MFMailComposeController *)self mailComposeView];
    id v4 = [v3 searchController];
    [v4 removeRecipient:v6];

    id v5 = [(MFMailComposeController *)self mailComposeView];
    [v5 invalidateSearchResultRecipient:v6];

    [(MFMailComposeController *)self _dismissPersonCard];
  }
}

- (id)_contactViewControllerForRecipient:(id)a3
{
  id v4 = a3;
  id v5 = [v4 contact];
  if (!v5)
  {
    id v6 = [v4 displayString];
    uint64_t v7 = objc_msgSend(v6, "ec_personNameComponents");

    id v8 = (void *)MEMORY[0x1E4F1B8F8];
    int v9 = [v4 uncommentedAddress];
    id v5 = objc_msgSend(v8, "em_contactWithPersonNameComponents:emailAddress:emailAddressLabel:allowInvalidEmailAddress:", v7, v9, 0, 1);
  }
  if ([v5 isUnknown]) {
    [MEMORY[0x1E4F1BBA8] viewControllerForUnknownContact:v5];
  }
  else {
  int v10 = [MEMORY[0x1E4F1BBA8] viewControllerForContact:v5];
  }
  id v11 = [MEMORY[0x1E4F1B980] storeWithOptions:3];
  [v10 setContactStore:v11];

  [v10 setDelegate:self];

  return v10;
}

- (void)_showPersonCardForRecipient:(id)a3 showDeleteButton:(BOOL)a4
{
  BOOL v4 = a4;
  id v15 = a3;
  id v6 = -[MFMailComposeController _contactViewControllerForRecipient:](self, "_contactViewControllerForRecipient:");
  uint64_t v7 = [v6 contact];
  int v8 = [v7 isSuggested];

  if (((!v4 | v8) & 1) == 0)
  {
    int v9 = [v6 contentViewController];
    int v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v11 = [v10 localizedStringForKey:@"REMOVE_RECENT" value:&stru_1F0817A00 table:@"Main"];
    uint64_t v12 = [v9 cardFooterGroup];
    [v9 addActionWithTitle:v11 target:self selector:sel__removeRecent inGroup:v12 destructive:1];
  }
  [(MFMailComposeController *)self setContactViewController:v6];
  [(MFMailComposeController *)self setRecipientPresentingCard:v15];
  uint64_t v13 = [(MFMailComposeController *)self mailComposeView];
  [v13 saveFirstResponderWithKeyboardPinning:0];

  int v14 = [(MFMailComposeController *)self navigationControllerForRecentPersonCard];
  [v14 pushViewController:v6 animated:1];
}

- (void)composeRecipientView:(id)a3 showPersonCardForRecipient:(id)a4
{
  id v8 = a4;
  id v5 = [(MFMailComposeController *)self mailComposeView];
  [v5 saveFirstResponderWithKeyboardPinning:0];

  if ([v8 isGroup])
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F5A0E0]);
    [v6 setGroup:v8];
    [v6 setDelegate:self];
    uint64_t v7 = [(MFMailComposeController *)self navigationControllerForRecentPersonCard];
    [v7 pushViewController:v6 animated:1];

    [(MFMailComposeController *)self setRecipientPresentingCard:v8];
  }
  else
  {
    -[MFMailComposeController _showPersonCardForRecipient:showDeleteButton:](self, "_showPersonCardForRecipient:showDeleteButton:", v8, [v8 isRemovableFromSearchResults]);
  }
}

- (BOOL)isShowingRecentPersonCard
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [(MFMailComposeController *)self navigationControllerForRecentPersonCard];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v10 = 0u;
  int v3 = objc_msgSend(v2, "viewControllers", 0, 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
        }
        BOOL v7 = 1;
        goto LABEL_13;
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      BOOL v7 = 0;
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v7 = 0;
  }
LABEL_13:

  return v7;
}

- (id)navigationControllerForRecentPersonCard
{
  int v3 = [(MFMailComposeController *)self traitCollection];
  int v4 = objc_msgSend(v3, "mf_supportsPopoverPresentation");

  if (v4)
  {
    uint64_t v5 = [(MFMailComposeController *)self presentedViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      BOOL v7 = [(MFMailComposeController *)self presentedViewController];
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = [(MFMailComposeController *)self navigationController];
  }

  return v7;
}

- (id)composeRecipientView:(id)a3 composeRecipientForAddress:(id)a4
{
  id v4 = a4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F5A140]) initWithContact:0 address:v4 kind:0];

  return v5;
}

- (id)composeRecipientView:(id)a3 composeRecipientForContact:(id)a4
{
  id v4 = a4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F5A140]) initWithContact:v4 address:0 kind:0];

  return v5;
}

- (BOOL)composeRecipientViewShowingSearchResults:(id)a3
{
  int v3 = [(MFMailComposeController *)self mailComposeView];
  char v4 = [v3 isSearching];

  return v4;
}

- (BOOL)presentSearchResultsForComposeRecipientView:(id)a3
{
  int v3 = [(MFMailComposeController *)self mailComposeView];
  char v4 = [v3 presentSearchResults];

  return v4;
}

- (void)dismissSearchResultsForComposeRecipientView:(id)a3
{
  id v3 = [(MFMailComposeController *)self mailComposeView];
  [v3 dismissSearchResults];
}

- (void)selectNextSearchResultForComposeRecipientView:(id)a3
{
  id v3 = [(MFMailComposeController *)self mailComposeView];
  [v3 selectNextSearchResult];
}

- (void)selectPreviousSearchResultForComposeRecipientView:(id)a3
{
  id v3 = [(MFMailComposeController *)self mailComposeView];
  [v3 selectPreviousSearchResult];
}

- (BOOL)chooseSelectedSearchResultForComposeRecipientView:(id)a3
{
  id v3 = [(MFMailComposeController *)self mailComposeView];
  char v4 = [v3 chooseSelectedSearchResult];

  return v4;
}

- (void)contactViewController:(id)a3 didDeleteContact:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = [(MFMailComposeController *)self mailComposeView];
  BOOL v7 = [v6 searchViewController];
  id v8 = [v7 recipients];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v18;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v18 != v10) {
        objc_enumerationMutation(v8);
      }
      long long v12 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
      uint64_t v13 = [v12 contact];
      char v14 = [v13 isEqual:v5];

      if (v14) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v15 = v12;

    if (!v15) {
      goto LABEL_13;
    }
    int v16 = [(MFMailComposeController *)self mailComposeView];
    [v16 invalidateSearchResultRecipient:v15];
  }
  else
  {
LABEL_9:
    id v15 = v8;
  }

LABEL_13:
}

- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContact:(id)a4 propertyKey:(id)a5 propertyIdentifier:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  long long v12 = [(MFMailComposeController *)self atomPresentingCard];
  uint64_t v13 = [v12 recipient];

  if ([v10 isEqualToString:*MEMORY[0x1E4F1ADC8]])
  {
    char v14 = [v13 labeledValueIdentifier];
    char v15 = [v11 isEqualToString:v14];

    if ((v15 & 1) == 0)
    {
      int v16 = [v9 emailAddresses];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __117__MFMailComposeController_contactViewController_shouldPerformDefaultActionForContact_propertyKey_propertyIdentifier___block_invoke;
      v29[3] = &unk_1E5F7BE88;
      id v30 = v11;
      long long v28 = objc_msgSend(v16, "ef_firstObjectPassingTest:", v29);

      secureCompositionManager = self->_secureCompositionManager;
      long long v18 = (void *)MEMORY[0x1E4F1CAD0];
      long long v19 = [v13 address];
      long long v20 = [v18 setWithObject:v19];
      long long v21 = [v18 setWithObject:v20];
      [(MFSecureMIMECompositionManager *)secureCompositionManager removeRecipients:v21];

      uint64_t v22 = [v28 value];
      [v13 setAddress:v22];

      long long v23 = self->_secureCompositionManager;
      unint64_t v24 = (void *)MEMORY[0x1E4F1CAD0];
      long long v25 = [v13 address];
      long long v26 = [v24 setWithObject:v25];
      [(MFSecureMIMECompositionManager *)v23 addRecipients:v26];

      [(MFMailComposeController *)self _resetSecureCompositionManager];
      if (v9) {
        [(MFMailComposeController *)self _dismissPersonCard];
      }
    }
  }

  return 1;
}

uint64_t __117__MFMailComposeController_contactViewController_shouldPerformDefaultActionForContact_propertyKey_propertyIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)autocompleteGroupDetailViewController:(id)a3 didAskToRemoveGroup:(id)a4
{
  id v8 = a4;
  id v5 = [(MFMailComposeController *)self mailComposeView];
  id v6 = [v5 searchController];
  [v6 removeRecipient:v8];

  BOOL v7 = [(MFMailComposeController *)self mailComposeView];
  [v7 invalidateSearchResultRecipient:v8];
}

- (void)autocompleteGroupDetailViewController:(id)a3 didTapComposeRecipient:(id)a4
{
}

- (void)autocompleteGroupDetailViewControllerDidCancel:(id)a3
{
  id v5 = [(MFMailComposeController *)self traitCollection];
  char v4 = objc_msgSend(v5, "mf_supportsPopoverPresentation");

  if ((v4 & 1) == 0)
  {
    id v6 = [(MFMailComposeController *)self mailComposeView];
    [v6 restoreFirstResponderWithKeyboardPinning:1];
  }
}

- (void)_presentModalAlert:(id)a3
{
  id v4 = a3;
  [(MFMailComposeController *)self _updateSendAndCloseEnabled];
  [(MFMailComposeController *)self _dismissPresentedViewController];
  [(MFMailComposeController *)self presentViewController:v4 animated:1 completion:0];
}

- (void)_finishModalAlertClosingComposition:(BOOL)a3
{
  BOOL v3 = a3;
  id v10 = [(MFMailComposeController *)self mailComposeView];
  [v10 setSending:0];
  id v5 = [(MFMailComposeController *)self quickReplyDelegate];
  [v5 mailComposeController:self isSending:0];

  [(MFMailComposeController *)self _updateSendAndCloseEnabled];
  id v6 = [(MFMailComposeController *)self hideMyEmailAddressIfExists];

  if (v6)
  {
    BOOL v7 = [(MFMailComposeController *)self hideMyEmailAddressIfExists];
    sendingEmailAddress = self->_sendingEmailAddress;
    self->_sendingEmailAddress = v7;
  }
  if (v3)
  {
    if (self->_composeWebViewFlags.respondsToCompositionWillFinish)
    {
      id v9 = [(MFMailComposeController *)self composeWebView];
      [v9 compositionWillFinish];
    }
    if (self->_resolution == 2)
    {
      [(MFMailComposeController *)self setHeadersForDraft];
      [(MFMailComposeController *)self _setUpDraftForHME];
    }
    [(MFMailComposeController *)self close];
  }
  else
  {
    [v10 restoreFirstResponder];
  }
}

- (void)_displayPopoverAlert:(id)a3
{
  id v6 = a3;
  -[MFMailComposeController setPopoverAlert:](self, "setPopoverAlert:");
  [v6 setModalPresentationStyle:7];
  id v4 = [v6 popoverPresentationController];
  [v4 setDelegate:self];
  [v4 setBarButtonItem:self->_closeButtonItem];
  [v4 setPermittedArrowDirections:3];
  [(MFMailComposeController *)self _dismissPresentedViewController];
  [(MFMailComposeController *)self presentViewController:v6 animated:1 completion:0];
  id v5 = [(MFMailComposeController *)self mailComposeView];
  [v5 setKeyboardVisible:0 animate:1];
  [(MFMailComposeController *)self _updateSendAndCloseEnabled];
}

- (void)finishPopoverAlertClosingComposition:(BOOL)a3
{
  BOOL v3 = a3;
  [(MFMailComposeController *)self setPopoverAlert:0];

  [(MFMailComposeController *)self _finishModalAlertClosingComposition:v3];
}

- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5
{
  id v8 = [a3 presentedViewController];
  if (v8 == self->_photosPickerController)
  {
    uint64_t v13 = v8;
    *a5 = self->_composeWebView;
    [(MFMailComposeController *)self _optimalRectForPresentingPopoverInComposeWebView];
    a4->origin.double x = v9;
    a4->origin.double y = v10;
    a4->size.double width = v11;
    a4->size.double height = v12;
    id v8 = v13;
  }
}

- (void)_resetSecureCompositionManager
{
}

- (void)_resetSecureCompositionManagerUsingNewAccount:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F607F8]) initWithString:self->_sendingEmailAddress];
  long long v29 = [v5 simpleAddress];

  id v6 = [(MFMailComposeController *)self accountProxyGenerator];
  id v30 = self;
  BOOL v7 = [v6 accountProxyContainingEmailAddress:v29 includingInactive:0 originatingBundleID:self->_originatingBundleID sourceAccountManagement:self->_sourceAccountManagement];
  id v8 = [v7 mailAccount];

  long long v28 = v8;
  if (v8)
  {
    uint64_t v9 = [v8 secureCompositionSigningPolicyForAddress:v29];
    if (v3 && self->_originalMessageWasEncrypted && self->_encryptionOverrideSetting)
    {
      uint64_t encryptionOverrideSetting = 1;
    }
    else if (objc_msgSend(v8, "perMessageEncryptionEnabledForAddress:", v29, v8))
    {
      if (v3)
      {
        uint64_t encryptionOverrideSetting = [v28 secureCompositionEncryptionPolicyForAddress:v29];
        self->_uint64_t encryptionOverrideSetting = encryptionOverrideSetting != 0;
      }
      else
      {
        uint64_t encryptionOverrideSetting = self->_encryptionOverrideSetting;
      }
    }
    else
    {
      uint64_t encryptionOverrideSetting = [v28 secureCompositionEncryptionPolicyForAddress:v29];
    }
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t encryptionOverrideSetting = 0;
  }
  secureCompositionManager = self->_secureCompositionManager;
  if (secureCompositionManager)
  {
    CGFloat v12 = [(MFSecureMIMECompositionManager *)secureCompositionManager sendingAccount];
    if (v12 == v28
      && [(MFSecureMIMECompositionManager *)self->_secureCompositionManager signingPolicy] == v9
      && [(MFSecureMIMECompositionManager *)self->_secureCompositionManager encryptionPolicy] == encryptionOverrideSetting)
    {
      uint64_t v13 = [(MFSecureMIMECompositionManager *)self->_secureCompositionManager sendingAddress];
      char v14 = [v13 isEqualToString:v29];

      if (v14) {
        goto LABEL_37;
      }
    }
    else
    {
    }
  }
  [(MFSecureMIMECompositionManager *)self->_secureCompositionManager invalidate];
  char v15 = (MFSecureMIMECompositionManager *)[objc_alloc(MEMORY[0x1E4F77C48]) initWithSendingAccount:v28 signingPolicy:v9 encryptionPolicy:encryptionOverrideSetting];
  int v16 = self->_secureCompositionManager;
  self->_secureCompositionManager = v15;

  [(MFSecureMIMECompositionManager *)self->_secureCompositionManager setDelegate:self];
  [(MFMailComposeController *)self setCertificatesByRecipient:0];
  [(MFMailComposeController *)self setErrorsByRecipient:0];
  [(MFMailComposeController *)self setAddressForMissingIdentity:0];
  self->_signingIdentityStatus = v9 != 0;
  self->_encryptionIdentityStatus = encryptionOverrideSetting != 0;
  self->_BOOL encryptionStatusIsKnown = encryptionOverrideSetting == 0;
  [(MFSecureMIMECompositionManager *)self->_secureCompositionManager setSendingAddress:v29];
  long long v17 = [MEMORY[0x1E4F1CA80] set];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obuint64_t j = [(MFMailComposeController *)self _allRecipientViews];
  uint64_t v18 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v18)
  {
    uint64_t v32 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v38 != v32) {
          objc_enumerationMutation(obj);
        }
        long long v20 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v21 = [v20 recipients];
        uint64_t v22 = [v21 countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (v22)
        {
          uint64_t v23 = *(void *)v34;
          do
          {
            for (uint64_t j = 0; j != v22; ++j)
            {
              if (*(void *)v34 != v23) {
                objc_enumerationMutation(v21);
              }
              long long v25 = [*(id *)(*((void *)&v33 + 1) + 8 * j) address];
              long long v26 = [v25 emailAddressValue];
              long long v27 = [v26 simpleAddress];
              objc_msgSend(v17, "ef_addOptionalObject:", v27);
            }
            uint64_t v22 = [v21 countByEnumeratingWithState:&v33 objects:v41 count:16];
          }
          while (v22);
        }
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v18);
  }

  [(MFSecureMIMECompositionManager *)v30->_secureCompositionManager addRecipients:v17];
  if (_os_feature_enabled_impl())
  {
    [(MFMailComposeController *)v30 _updateSMIMEStatusControl];
  }
  else
  {
    [(MFMailComposeController *)v30 _updateSMIMEButtonEnabledForRecipientCount];
    [(MFMailComposeController *)v30 _updateSMIMEButtonForEncryptionStatus:[(MFSecureMIMECompositionManager *)v30->_secureCompositionManager encryptionStatus]];
  }
  [(MFMailComposeController *)v30 _updateTitleBarForEncryptionStatus:[(MFSecureMIMECompositionManager *)v30->_secureCompositionManager encryptionStatus]];
  [(MFMailComposeController *)v30 _updateSendAndCloseEnabled];
  [(MFMailComposeController *)v30 _updateRecipientAtomStyles];
  [(MFMailComposeController *)v30 _updatePersonCard];

LABEL_37:
}

- (BOOL)_secureCompositionManagerHasRecipients
{
  id v2 = [(MFSecureMIMECompositionManager *)self->_secureCompositionManager recipients];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)_updateRecipientAtomStyles
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = [(MFMailComposeController *)self _allRecipientViews];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v6 + 1) + 8 * v5++) invalidateAtomPresentationOptions];
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)_updateSMIMEButtonForEncryptionStatus:(int64_t)a3
{
  long long v6 = self->_toField;
  if ([(MFMailComposeController *)self _wantsEncryption]) {
    BOOL v5 = [(MFMailComposeController *)self _secureCompositionManagerHasRecipients];
  }
  else {
    BOOL v5 = 0;
  }
  [(MFMailComposeToField *)v6 setWantsEncryption:v5 canEncrypt:a3 != 2 animated:1];
}

- (void)_updateTitleBarForEncryptionStatus:(int64_t)a3
{
  if ([(MFMailComposeController *)self _wantsEncryption]) {
    BOOL v5 = [(MFMailComposeController *)self _secureCompositionManagerHasRecipients];
  }
  else {
    BOOL v5 = 0;
  }
  BOOL v6 = [(MFMailComposeController *)self _wantsSigning];
  uint64_t v7 = [(MFSecureMIMECompositionManager *)self->_secureCompositionManager signingStatus];
  if (!v5)
  {
    if (v6 && (v7 == 2 || !v7)) {
      goto LABEL_22;
    }
    goto LABEL_17;
  }
  if (a3)
  {
    if (a3 == 1)
    {
      if (![(MFMailComposeController *)self _hasEncryptionIdentityError])
      {
        [(MFMailComposeController *)self _hasRecipients];
LABEL_22:
        uint64_t v8 = _EFLocalizedString();
        goto LABEL_23;
      }
    }
    else if (a3 == 2)
    {
      goto LABEL_22;
    }
LABEL_17:
    uint64_t v8 = 0;
    goto LABEL_23;
  }
  _EFLocalizedString();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 && ![(MFMailComposeController *)self _hasSigningIdentityError])
  {
    uint64_t v8 = (uint64_t)v10;
  }
  else
  {
    uint64_t v9 = _EFLocalizedString();

    uint64_t v8 = v9;
  }
LABEL_23:
  id v11 = (id)v8;
  -[MFMailComposeController _setTitleBarSubtitleText:style:](self, "_setTitleBarSubtitleText:style:");
  if (_os_feature_enabled_impl()) {
    [(MFMailComposeController *)self _updateSMIMEStatusControl];
  }
}

- (void)setOriginalMessageWasEncrypted:(BOOL)a3
{
  self->_originalMessageWasEncrypted = a3;
  if (!self->_encryptionOverrideSetting && a3) {
    self->_uint64_t encryptionOverrideSetting = a3;
  }
  [(MFMailComposeController *)self _resetSecureCompositionManager];
}

- (unint64_t)_defaultAtomPresentationOptions
{
  if ([(MFMailComposeController *)self _wantsEncryption]
    && ![(MFMailComposeController *)self _hasEncryptionIdentityError])
  {
    return 4;
  }
  else
  {
    return 0;
  }
}

- (void)_updatePersonCard
{
  id v24 = [(MFMailComposeController *)self contactViewController];
  uint64_t v3 = [(MFSecureMIMECompositionManager *)self->_secureCompositionManager encryptionPolicy];
  uint64_t v4 = [(CNComposeRecipientAtom *)self->_atomPresentingCard recipient];
  if (v3 && ![(MFMailComposeController *)self _hasEncryptionIdentityError] && v24 && v4)
  {
    BOOL v5 = [v4 address];
    BOOL v6 = (void *)[objc_alloc(MEMORY[0x1E4F607F8]) initWithString:v5];
    uint64_t v7 = [v6 simpleAddress];
    uint64_t v8 = (void *)[v7 copy];

    uint64_t v9 = [(MFMailComposeController *)self certificatesByRecipient];
    uint64_t v10 = [v9 objectForKey:v8];

    id v11 = [(MFMailComposeController *)self errorsByRecipient];
    uint64_t v12 = [v11 objectForKey:v8];

    if (v10 | v12)
    {
      if (v12)
      {
        uint64_t v13 = MFLookupLocalizedString();
        [(id)v12 localizedDescription];
        char v14 = 0;
        int v16 = v15 = (void *)v13;
      }
      else if (v10)
      {
        uint64_t v18 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        char v14 = [v18 localizedStringForKey:@"ENCRYPTED" value:&stru_1F0817A00 table:@"Main"];

        long long v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        long long v20 = [v19 localizedStringForKey:@"ENCRYPTION_EXPLANATION_FORMAT" value:&stru_1F0817A00 table:@"Main"];

        int v16 = objc_msgSend(NSString, "stringWithFormat:", v20, v5);

        char v15 = 0;
      }
      else
      {
        char v14 = 0;
        char v15 = 0;
        int v16 = 0;
      }
      long long v21 = [v24 contentViewController];
      long long v17 = [v21 personHeaderView];

      if (!v17)
      {
        uint64_t v22 = [MFSecureMIMEPersonHeaderView alloc];
        long long v17 = -[MFSecureMIMEPersonHeaderView initWithFrame:](v22, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      }
      [(MFSecureMIMEPersonHeaderView *)v17 setSecureLabelText:v14];
      [(MFSecureMIMEPersonHeaderView *)v17 setWarningLabelText:v15];
      [(MFSecureMIMEPersonHeaderView *)v17 setExplanationText:v16];
    }
    else
    {
      long long v17 = 0;
    }
  }
  else
  {
    if (!v24) {
      goto LABEL_19;
    }
    long long v17 = 0;
  }
  uint64_t v23 = [v24 contentViewController];
  [v23 setPersonHeaderView:v17];

LABEL_19:
}

- (void)_updateIdentityStatus:(int64_t *)a3 withPolicy:(int64_t)a4 identity:(__SecIdentity *)a5 error:(id)a6
{
  id v14 = a6;
  if (&self->_signingIdentityStatus == a3 || &self->_encryptionIdentityStatus == a3)
  {
    if (!a4) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"MFMailComposeController.m" lineNumber:7191 description:@"status pointer must be valid"];

    if (!a4) {
      goto LABEL_10;
    }
  }
  int64_t v11 = *a3;
  if (a5)
  {
    int64_t v12 = 0;
  }
  else
  {
    if (!v14) {
      goto LABEL_10;
    }
    int64_t v12 = 2;
  }
  *a3 = v12;
  if (v11 != v12)
  {
    [(MFMailComposeController *)self _showMissingIdentityAlert];
    [(MFMailComposeController *)self _updateSendAndCloseEnabled];
  }
LABEL_10:
}

- (id)_missingIdentityErrorWithFormat:(id)a3 title:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F607F8]) initWithString:self->_sendingEmailAddress];
  uint64_t v9 = [v8 simpleAddress];

  uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", v6, v9);
  int64_t v11 = [MEMORY[0x1E4F77BA8] errorWithDomain:*MEMORY[0x1E4F77B18] code:1052 localizedDescription:v10 title:0 userInfo:0];
  [v11 setShortDescription:v7];

  return v11;
}

- (void)_showMissingIdentityAlert
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1AF945000, v3, v4, "#SMIMEErrors _showMissingIdentityAlert: %{public}@", v5);
}

void __52__MFMailComposeController__showMissingIdentityAlert__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateSendAndCloseEnabled];
  id v4 = [MEMORY[0x1E4F77C70] accountContainingEmailAddress:*(void *)(*(void *)(a1 + 32) + 1056)];
  uint64_t v2 = +[MFPreferencesURL advancedAccountInfoURLForAccount:](MFPreferencesURL, "advancedAccountInfoURLForAccount:");
  int v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v3 openSensitiveURL:v2 withOptions:0];
}

uint64_t __52__MFMailComposeController__showMissingIdentityAlert__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) mailComposeView];
  [v2 restoreFirstResponder];

  int v3 = *(void **)(a1 + 32);

  return [v3 _updateSendAndCloseEnabled];
}

- (void)secureMIMECompositionManager:(id)a3 signingStatusDidChange:(int64_t)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__MFMailComposeController_secureMIMECompositionManager_signingStatusDidChange_context___block_invoke;
  block[3] = &unk_1E5F79770;
  id v12 = v7;
  uint64_t v13 = self;
  id v14 = v8;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __87__MFMailComposeController_secureMIMECompositionManager_signingStatusDidChange_context___block_invoke(id *a1)
{
  if (a1[4] == *((id *)a1[5] + 161))
  {
    id v2 = [a1[6] objectForKey:*MEMORY[0x1E4F77B38]];
    objc_msgSend(a1[5], "_updateIdentityStatus:withPolicy:identity:error:", (char *)a1[5] + 1320, objc_msgSend(a1[4], "signingPolicy"), objc_msgSend(a1[6], "objectForKey:", *MEMORY[0x1E4F77B40]), v2);
    objc_msgSend(a1[5], "_updateTitleBarForEncryptionStatus:", objc_msgSend(a1[4], "encryptionStatus"));
  }
}

- (void)secureMIMECompositionManager:(id)a3 encryptionStatusDidChange:(int64_t)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __90__MFMailComposeController_secureMIMECompositionManager_encryptionStatusDidChange_context___block_invoke;
  v12[3] = &unk_1E5F7BEB0;
  id v13 = v8;
  id v14 = self;
  id v15 = v9;
  int64_t v16 = a4;
  id v10 = v9;
  id v11 = v8;
  dispatch_async(MEMORY[0x1E4F14428], v12);
}

void __90__MFMailComposeController_secureMIMECompositionManager_encryptionStatusDidChange_context___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32) != *(void *)(*(void *)(a1 + 40) + 1288)) {
    return;
  }
  id v9 = [*(id *)(a1 + 48) objectForKeyedSubscript:*MEMORY[0x1E4F77B28]];
  id v2 = [*(id *)(a1 + 48) objectForKeyedSubscript:*MEMORY[0x1E4F77B30]];
  int v3 = [*(id *)(a1 + 48) objectForKeyedSubscript:*MEMORY[0x1E4F77B40]];

  id v4 = [*(id *)(a1 + 48) objectForKeyedSubscript:*MEMORY[0x1E4F77B38]];
  objc_msgSend(*(id *)(a1 + 40), "_updateIdentityStatus:withPolicy:identity:error:", *(void *)(a1 + 40) + 1328, objc_msgSend(*(id *)(*(void *)(a1 + 40) + 1288), "encryptionPolicy"), v3, v4);
  uint64_t v5 = *(void *)(a1 + 56);
  *(unsigned char *)(*(void *)(a1 + 40) + 1336) = v5 != 1;
  id v6 = *(unsigned char **)(a1 + 40);
  if (v6[1336])
  {
    [v6 setCertificatesByRecipient:v9];
    [*(id *)(a1 + 40) setErrorsByRecipient:v2];
    id v6 = *(unsigned char **)(a1 + 40);
LABEL_6:
    [v6 _updateRecipientAtomStyles];
    goto LABEL_7;
  }
  if (v5 == 2 && v4) {
    goto LABEL_6;
  }
LABEL_7:
  int v7 = _os_feature_enabled_impl();
  id v8 = *(void **)(a1 + 40);
  if (v7) {
    [v8 _updateSMIMEStatusControl];
  }
  else {
    [v8 _updateSMIMEButtonForEncryptionStatus:*(void *)(a1 + 56)];
  }
  [*(id *)(a1 + 40) _updateTitleBarForEncryptionStatus:*(void *)(a1 + 56)];
  [*(id *)(a1 + 40) _updateSendAndCloseEnabled];
  [*(id *)(a1 + 40) _updatePersonCard];
}

- (BOOL)_wantsEncryption
{
  return [(MFSecureMIMECompositionManager *)self->_secureCompositionManager encryptionPolicy] != 0;
}

- (BOOL)_hasEncryptionIdentityError
{
  return self->_encryptionIdentityStatus == 2;
}

- (BOOL)_wantsSigning
{
  return [(MFSecureMIMECompositionManager *)self->_secureCompositionManager signingPolicy] != 0;
}

- (BOOL)_hasSigningIdentityError
{
  return [(MFSecureMIMECompositionManager *)self->_secureCompositionManager signingStatus] == 2;
}

- (MFSMIMEControl)smimeStatusControl
{
  v30[4] = *MEMORY[0x1E4F143B8];
  if (!_os_feature_enabled_impl()) {
    goto LABEL_3;
  }
  int v3 = [(MFMailComposeController *)self mailComposeView];
  char v4 = [v3 isQuickReply];

  if (v4) {
    goto LABEL_3;
  }
  smimeStatusControl = self->_smimeStatusControl;
  if (!smimeStatusControl)
  {
    int v7 = [(MFMailComposeController *)self navigationItem];
    id v8 = [v7 titleView];

    id v9 = [(MFMailComposeController *)self navigationController];
    id v10 = [v9 navigationBar];

    long long v29 = v10;
    if (([v8 isDescendantOfView:v10] & 1) == 0)
    {

LABEL_3:
      uint64_t v5 = 0;
      goto LABEL_8;
    }
    id v11 = [MFSMIMEControl alloc];
    id v12 = -[MFSMIMEControl initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    id v13 = self->_smimeStatusControl;
    self->_smimeStatusControl = v12;

    [(MFSMIMEControl *)self->_smimeStatusControl setOpaque:1];
    [(MFSMIMEControl *)self->_smimeStatusControl setDelegate:self];
    [(MFSMIMEControl *)self->_smimeStatusControl setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MFSMIMEControl *)self->_smimeStatusControl setContextMenuInteractionEnabled:0];
    [(MFSMIMEControl *)self->_smimeStatusControl setShowsMenuAsPrimaryAction:1];
    [v10 addSubview:self->_smimeStatusControl];
    id v14 = (void *)MEMORY[0x1E4F28DC8];
    long long v28 = [(MFSMIMEControl *)self->_smimeStatusControl topAnchor];
    long long v25 = [v8 topAnchor];
    id v24 = objc_msgSend(v28, "constraintEqualToAnchor:");
    v30[0] = v24;
    long long v27 = [(MFSMIMEControl *)self->_smimeStatusControl leadingAnchor];
    uint64_t v23 = [v8 leadingAnchor];
    uint64_t v22 = objc_msgSend(v27, "constraintEqualToAnchor:constant:", 80.0);
    v30[1] = v22;
    long long v26 = [(MFSMIMEControl *)self->_smimeStatusControl bottomAnchor];
    id v15 = [v8 bottomAnchor];
    int64_t v16 = [v26 constraintEqualToAnchor:v15];
    v30[2] = v16;
    long long v17 = [(MFSMIMEControl *)self->_smimeStatusControl trailingAnchor];
    uint64_t v18 = [v8 trailingAnchor];
    long long v19 = [v17 constraintEqualToAnchor:v18 constant:-80.0];
    void v30[3] = v19;
    long long v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:4];
    [v14 activateConstraints:v20];

    smimeStatusControl = self->_smimeStatusControl;
  }
  uint64_t v5 = smimeStatusControl;
LABEL_8:

  return v5;
}

- (void)_updateSMIMEStatusControl
{
  BOOL v3 = [(MFMailComposeController *)self _shouldEnableSMIMEMenu];
  id v4 = [(MFMailComposeController *)self smimeStatusControl];
  [v4 setContextMenuInteractionEnabled:v3];
}

- (BOOL)_shouldEnableSMIMEMenu
{
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4F607F8]) initWithString:self->_sendingEmailAddress];
  id v4 = [v3 simpleAddress];

  uint64_t v5 = [(MFMailComposeController *)self accountProxyGenerator];
  id v6 = [v5 accountProxyContainingEmailAddress:v4 includingInactive:0 originatingBundleID:self->_originatingBundleID sourceAccountManagement:self->_sourceAccountManagement];
  int v7 = [v6 mailAccount];

  LOBYTE(v5) = [v7 perMessageEncryptionEnabledForAddress:v4];
  return (char)v5;
}

- (void)toggleEncryptionForControl:(id)a3
{
  self->_encryptionOverrideSetting ^= 1u;
  [(MFMailComposeController *)self _resetSecureCompositionManager];
}

- (void)goToSettingsForControl:(id)a3
{
  id v5 = [MEMORY[0x1E4F77C70] accountContainingEmailAddress:self->_sendingEmailAddress];
  BOOL v3 = +[MFPreferencesURL advancedAccountInfoURLForAccount:](MFPreferencesURL, "advancedAccountInfoURLForAccount:");
  id v4 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v4 openSensitiveURL:v3 withOptions:0];
}

- (id)sendingAddressForControl:(id)a3
{
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4F607F8]) initWithString:self->_sendingEmailAddress];
  id v4 = [v3 simpleAddress];

  return v4;
}

- (unint64_t)smimeStatusOptionsForControl:(id)a3
{
  if (![(MFMailComposeController *)self _shouldEnableSMIMEMenu]) {
    return 1;
  }
  if ([(MFMailComposeController *)self _wantsEncryption])
  {
    if ([(MFMailComposeController *)self _secureCompositionManagerHasRecipients])
    {
      uint64_t v4 = 3;
    }
    else
    {
      uint64_t v4 = 1;
    }
  }
  else
  {
    uint64_t v4 = 1;
  }
  if ([(MFSecureMIMECompositionManager *)self->_secureCompositionManager encryptionStatus] == 2)
  {
    id v6 = [(MFMailComposeController *)self errorsByRecipient];
    uint64_t v7 = [v6 count];

    uint64_t v8 = 12;
    if (!v7) {
      uint64_t v8 = 4;
    }
    v4 |= v8;
  }
  BOOL v9 = [(MFMailComposeController *)self _wantsSigning];
  BOOL v10 = [(MFMailComposeController *)self _hasSigningIdentityError];
  unint64_t v11 = v4 | 0x10;
  if (!v9) {
    unint64_t v11 = v4;
  }
  if (v10) {
    return v11 | 0x20;
  }
  else {
    return v11;
  }
}

- (void)_createAndAddHandoffProgressViewIfNecessary
{
  if (!self->_handoffProgressView)
  {
    BOOL v3 = (UIProgressView *)[objc_alloc(MEMORY[0x1E4FB1B48]) initWithProgressViewStyle:1];
    handoffProgressView = self->_handoffProgressView;
    self->_handoffProgressView = v3;

    id v5 = [(MFMailComposeController *)self view];
    [v5 bounds];
    double v7 = v6;
    double v8 = *MEMORY[0x1E4F1DB28];
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);

    -[UIProgressView setBounds:](self->_handoffProgressView, "setBounds:", v8, v9, v7, 2.5);
    BOOL v10 = [(MFMailComposeController *)self navigationController];
    unint64_t v11 = [v10 navigationBar];
    [v11 bounds];
    double v13 = v12 + -1.25;

    -[UIProgressView setCenter:](self->_handoffProgressView, "setCenter:", v7 * 0.5, v13);
    id v14 = [(MFMailComposeController *)self navigationItem];
    id v17 = [v14 titleView];

    id v15 = v17;
    if (!v17)
    {
      int64_t v16 = [(MFMailComposeController *)self navigationController];
      id v18 = [v16 navigationBar];

      id v15 = v18;
    }
    id v19 = v15;
    [v15 addSubview:self->_handoffProgressView];
  }
}

- (void)_hideHandoffProgressViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__MFMailComposeController__hideHandoffProgressViewAnimated___block_invoke;
  aBlock[3] = &unk_1E5F79088;
  void aBlock[4] = self;
  id v5 = _Block_copy(aBlock);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  id v8[2] = __60__MFMailComposeController__hideHandoffProgressViewAnimated___block_invoke_2;
  v8[3] = &unk_1E5F7A210;
  v8[4] = self;
  double v6 = _Block_copy(v8);
  double v7 = v6;
  if (v3) {
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v5 animations:v6 completion:0.35];
  }
  else {
    (*((void (**)(void *, uint64_t))v6 + 2))(v6, 1);
  }
}

uint64_t __60__MFMailComposeController__hideHandoffProgressViewAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1408) setAlpha:0.0];
}

void __60__MFMailComposeController__hideHandoffProgressViewAnimated___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    [*(id *)(*(void *)(a1 + 32) + 1408) removeFromSuperview];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 1408);
    *(void *)(v3 + 1408) = 0;
  }
}

- (void)updateUserActivityState:(id)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F77C70] accountContainingEmailAddress:self->_sendingEmailAddress];
  double v6 = v5;
  uint64_t v7 = *MEMORY[0x1E4F73D98];
  if (v5 && ([v5 supportsHandoffType:*MEMORY[0x1E4F73D98]] & 1) == 0)
  {
    [v4 invalidate];
  }
  else
  {
    uint64_t v25 = *MEMORY[0x1E4F73DA8];
    v26[0] = v7;
    double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    [v4 addUserInfoEntriesFromDictionary:v8];

    double v9 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
    int v10 = [v9 BOOLForKey:@"ComposeActivityOverLAN"];

    if (v10)
    {
      LANHandoffAgent = self->_LANHandoffAgent;
      if (!LANHandoffAgent)
      {
        double v12 = objc_alloc_init(MFLANHandoffAgent);
        double v13 = self->_LANHandoffAgent;
        self->_LANHandoffAgent = v12;

        id v14 = self->_LANHandoffAgent;
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __51__MFMailComposeController_updateUserActivityState___block_invoke;
        v21[3] = &unk_1E5F7BED8;
        void v21[4] = self;
        id v22 = v4;
        id v15 = [(MFLANHandoffAgent *)v14 startServerWithCompletion:v21];

        LANHandoffAgent = self->_LANHandoffAgent;
      }
      int64_t v16 = [(MFLANHandoffAgent *)LANHandoffAgent handoffContext];
      id v17 = v16;
      if (v16)
      {
        v23[0] = @"LANHostname";
        id v18 = [v16 host];
        v24[0] = v18;
        v23[1] = @"LANPortNumber";
        id v19 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v17, "port"));
        v24[1] = v19;
        long long v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
        [v4 addUserInfoEntriesFromDictionary:v20];
      }
    }
  }
}

uint64_t __51__MFMailComposeController_updateUserActivityState___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) userActivity:*(void *)(a1 + 40) didReceiveInputStream:a2 outputStream:a3];
}

- (void)_makeComposeUserActivityCurrent
{
  if (![(MFMailComposeController *)self _isDummyViewController])
  {
    uint64_t v3 = [(MFMailComposeController *)self userActivity];

    if (!v3)
    {
      id v20 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      int v4 = [v20 BOOLForKey:@"ComposeActivityFatPayloads"];

      id v5 = (id *)MEMORY[0x1E4F73D90];
      if (!v4) {
        id v5 = (id *)MEMORY[0x1E4F73D98];
      }
      id v21 = *v5;
      double v6 = (void *)[objc_alloc(MEMORY[0x1E4F22488]) initWithActivityType:v21];
      [(MFMailComposeController *)self setUserActivity:v6];

      uint64_t v7 = [(MFMailComposeController *)self userActivity];
      [v7 setDelegate:self];

      double v8 = [(MFMailComposeController *)self userActivity];
      [v8 setSupportsContinuationStreams:1];
    }
    double v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v22 = [v9 localizedStringForKey:@"DRAFT" value:&stru_1F0817A00 table:@"Main"];

    int v10 = [(MFComposeSubjectView *)self->_subjectField text];
    uint64_t v11 = [v10 length];

    if (v11)
    {
      double v12 = NSString;
      double v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v14 = [v13 localizedStringForKey:@"DRAFT_ACTIVITY_FORMAT %@" value:&stru_1F0817A00 table:@"Main"];
      id v15 = [(MFComposeSubjectView *)self->_subjectField text];
      uint64_t v16 = objc_msgSend(v12, "stringWithFormat:", v14, v15);

      id v22 = (id)v16;
    }
    id v17 = [(MFMailComposeController *)self userActivity];
    [v17 setTitle:v22];

    id v18 = [(MFMailComposeController *)self userActivity];
    [(MFMailComposeController *)self updateUserActivityState:v18];

    id v19 = [(MFMailComposeController *)self userActivity];
    [v19 becomeCurrent];
  }
}

- (void)setProgressUIVisible:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3)
  {
    progressIndicatorView = self->_progressIndicatorView;
    if (!progressIndicatorView)
    {
      uint64_t v7 = [MFMessageContentProgressLayer alloc];
      double v8 = -[MFMessageContentProgressLayer initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      double v9 = self->_progressIndicatorView;
      self->_progressIndicatorView = v8;

      int v10 = [(MFMailComposeController *)self view];
      [v10 addSubview:self->_progressIndicatorView];

      progressIndicatorView = self->_progressIndicatorView;
    }
    [(MFMessageContentProgressLayer *)progressIndicatorView setAutoresizingMask:18];
    uint64_t v11 = [(MFMailComposeController *)self view];
    [v11 bounds];
    -[MFMessageContentProgressLayer setFrame:](self->_progressIndicatorView, "setFrame:");

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __57__MFMailComposeController_setProgressUIVisible_animated___block_invoke;
    aBlock[3] = &unk_1E5F79088;
    void aBlock[4] = self;
    double v12 = _Block_copy(aBlock);
    double v13 = v12;
    if (v4)
    {
      [(MFMessageContentProgressLayer *)self->_progressIndicatorView setAlpha:0.0];
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v13 animations:0.6];
    }
    else
    {
      (*((void (**)(void *))v12 + 2))(v12);
    }
  }
  else
  {
    [(MFMailComposeController *)self _hideHandoffProgressViewAnimated:a4];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __57__MFMailComposeController_setProgressUIVisible_animated___block_invoke_2;
    v17[3] = &unk_1E5F79088;
    void v17[4] = self;
    double v13 = _Block_copy(v17);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __57__MFMailComposeController_setProgressUIVisible_animated___block_invoke_3;
    v16[3] = &unk_1E5F7A210;
    void v16[4] = self;
    id v14 = _Block_copy(v16);
    id v15 = v14;
    if (v4) {
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v13 animations:v14 completion:0.6];
    }
    else {
      (*((void (**)(void *, uint64_t))v14 + 2))(v14, 1);
    }
  }
}

uint64_t __57__MFMailComposeController_setProgressUIVisible_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1416) setAlpha:1.0];
}

uint64_t __57__MFMailComposeController_setProgressUIVisible_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1416) setAlpha:0.0];
}

void __57__MFMailComposeController_setProgressUIVisible_animated___block_invoke_3(uint64_t a1)
{
  kdebug_trace();
  [*(id *)(*(void *)(a1 + 32) + 1416) removeFromSuperview];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 1416);
  *(void *)(v2 + 1416) = 0;
}

- (void)handleLargeMessageComposeHandoffWithInputStream:(id)a3 outputStream:(id)a4 error:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    uint64_t v11 = MFLogGeneral();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[MFMailComposeController handleLargeMessageComposeHandoffWithInputStream:outputStream:error:]();
    }

    id WeakRetained = objc_loadWeakRetained(&self->_delegate);
    if (objc_opt_respondsToSelector())
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __94__MFMailComposeController_handleLargeMessageComposeHandoffWithInputStream_outputStream_error___block_invoke;
      block[3] = &unk_1E5F79770;
      id v16 = WeakRetained;
      id v17 = self;
      id v18 = v10;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
  else
  {
    double v13 = +[MFComposeActivityHandoffOperation receivingOperationWithInputStream:v8 outputStream:v9];
    handoffOperation = self->_handoffOperation;
    self->_handoffOperation = v13;

    [(MFComposeActivityHandoffOperation *)self->_handoffOperation setDelegate:self];
    kdebug_trace();
    [(MFComposeActivityHandoffOperation *)self->_handoffOperation start];
  }
}

uint64_t __94__MFMailComposeController_handleLargeMessageComposeHandoffWithInputStream_outputStream_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) mailComposeController:*(void *)(a1 + 40) failedToHandoffCompositionWithError:*(void *)(a1 + 48)];
}

- (id)_copyMessageDataForActivityHandoff
{
  uint64_t v3 = [MEMORY[0x1E4F60E18] promise];
  BOOL v4 = [(MFMailComposeController *)self originatingBundleID];
  id v5 = +[MFComposeTypeFactory headersFromDelegate:self originatingBundleID:v4 sourceAccountManagement:[(MFMailComposeController *)self sourceAccountManagement]];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__MFMailComposeController__copyMessageDataForActivityHandoff__block_invoke;
  block[3] = &unk_1E5F79770;
  void block[4] = self;
  id v6 = v5;
  id v12 = v6;
  id v7 = v3;
  id v13 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
  id v8 = [v7 future];
  id v9 = [v8 result:0];

  return v9;
}

void __61__MFMailComposeController__copyMessageDataForActivityHandoff__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 1504) isDefaultSignatureForSender:*(void *)(*(void *)(a1 + 32) + 1056)];
  uint64_t v3 = *(void *)(a1 + 32);
  BOOL v4 = *(void **)(v3 + 1208);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__MFMailComposeController__copyMessageDataForActivityHandoff__block_invoke_2;
  v5[3] = &unk_1E5F7B640;
  void v5[4] = v3;
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  [v4 getHTMLDataObjectRemovingSignature:v2 completion:v5];
}

void __61__MFMailComposeController__copyMessageDataForActivityHandoff__block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 otherHTMLStringsAndAttachments];
  if (!v4)
  {
    id v5 = [a1[4] compositionContext];
    id v6 = [v5 attachmentManager];
    id v7 = [*((id *)a1[4] + 151) compositionContextID];
    BOOL v4 = [v6 attachmentsForContext:v7];
  }
  id v8 = dispatch_get_global_queue(0, 0);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__MFMailComposeController__copyMessageDataForActivityHandoff__block_invoke_3;
  v11[3] = &unk_1E5F7A4A0;
  id v12 = v3;
  id v13 = v4;
  id v14 = a1[5];
  id v15 = a1[6];
  id v9 = v4;
  id v10 = v3;
  dispatch_async(v8, v11);
}

void __61__MFMailComposeController__copyMessageDataForActivityHandoff__block_invoke_3(uint64_t a1)
{
  id v7 = objc_alloc_init(MEMORY[0x1E4F77BF8]);
  uint64_t v2 = [*(id *)(a1 + 32) htmlString];
  id v3 = [*(id *)(a1 + 32) plainTextAlternative];
  BOOL v4 = (void *)[v7 createMessageWithHTMLStringAndMIMECharset:v2 plainTextAlternative:v3 otherHtmlStringsAndAttachments:*(void *)(a1 + 40) headers:*(void *)(a1 + 48)];

  id v5 = *(void **)(a1 + 56);
  id v6 = [v4 messageData];
  [v5 finishWithResult:v6];
}

- (id)_copyMessagePlainTextForDonation
{
  return [(MFMailComposeController *)self _copyMessagePlainTextForDonationRemoveQuotes:0];
}

- (id)_copyMessagePlainTextForDonationRemoveQuotes:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__5;
  id v13 = __Block_byref_object_dispose__5;
  id v14 = (id)0xAAAAAAAAAAAAAAAALL;
  id v14 = [MEMORY[0x1E4F60E18] promise];
  composeWebView = self->_composeWebView;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  id v8[2] = __72__MFMailComposeController__copyMessagePlainTextForDonationRemoveQuotes___block_invoke;
  v8[3] = &unk_1E5F7BF00;
  v8[4] = &v9;
  [(MFComposeWebView *)composeWebView getHTMLDataObjectRemovingSignature:1 removeQuotes:v3 completion:v8];
  id v6 = [(id)v10[5] future];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __72__MFMailComposeController__copyMessagePlainTextForDonationRemoveQuotes___block_invoke(uint64_t a1, void *a2)
{
  void v12[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = [v3 plainTextAlternative];
  uint64_t v5 = [v3 quotedAttachmentsInfo];
  id v6 = (void *)v5;
  if (v4 && v5)
  {
    v12[0] = v4;
    v12[1] = v5;
    id v7 = v12;
    uint64_t v8 = 2;
  }
  else
  {
    if (v4)
    {
      uint64_t v11 = v4;
      id v7 = (uint64_t *)&v11;
    }
    else
    {
      if (!v5)
      {
        uint64_t v9 = (void *)MEMORY[0x1E4F1CBF0];
        goto LABEL_10;
      }
      uint64_t v10 = v5;
      id v7 = &v10;
    }
    uint64_t v8 = 1;
  }
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:v8];
LABEL_10:
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) finishWithResult:v9];
}

- (void)userActivity:(id)a3 didReceiveInputStream:(id)a4 outputStream:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (pthread_main_np())
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"MFMailComposeController.m" lineNumber:7635 description:@"Current thread is main"];
  }
  if (self->_composeWebViewFlags.respondsToCompositionWillFinish)
  {
    uint64_t v10 = [(MFMailComposeController *)self composeWebView];
    [v10 compositionWillFinish];
  }
  id v11 = [(MFMailComposeController *)self _copyMessageDataForActivityHandoff];
  if (v11)
  {
    id v12 = +[MFComposeActivityHandoffOperation sendingOperationWithDraftData:v11 inputStream:v8 outputStream:v9];
    handoffOperation = self->_handoffOperation;
    self->_handoffOperation = v12;

    [(MFComposeActivityHandoffOperation *)self->_handoffOperation setDelegate:self];
    kdebug_trace();
    [(MFComposeActivityHandoffOperation *)self->_handoffOperation start];
  }
  else
  {
    id v14 = MFLogGeneral();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[MFMailComposeController userActivity:didReceiveInputStream:outputStream:]();
    }

    id v15 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MFActivityHandoffOperationError" code:-1 userInfo:0];
    id WeakRetained = objc_loadWeakRetained(&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained mailComposeController:self failedToHandoffCompositionWithError:v15];
    }
    if (self->_composeWebViewFlags.respondsToCompositionDidFailToFinish)
    {
      id v17 = [(MFMailComposeController *)self composeWebView];
      [v17 compositionDidFailToFinish];
    }
  }
}

- (void)activityHandoffOperation:(id)a3 didFinishReceivingData:(id)a4
{
  id v5 = a4;
  kdebug_trace();
  if ([v5 length])
  {
    id v6 = [[_MFMailCompositionContext alloc] initWithComposeType:9 RFC822Data:v5];
    [(MFMailComposeController *)self setCompositionContext:v6];
    [(MFMailComposeController *)self setProgressUIVisible:0 animated:1];
  }
  else
  {
    id v7 = MFLogGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MFMailComposeController activityHandoffOperation:didFinishReceivingData:]();
    }

    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MFActivityHandoffOperationError" code:-1 userInfo:0];
    id WeakRetained = objc_loadWeakRetained(&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained mailComposeController:self failedToHandoffCompositionWithError:v6];
    }
  }
}

- (void)activityHandoffOperation:(id)a3 didFinishSendingDataWithResult:(int64_t)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  id v6 = MFLogGeneral();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v9 = 134217984;
    int64_t v10 = a4;
    _os_log_impl(&dword_1AF945000, v6, OS_LOG_TYPE_INFO, "#Hand-Off Delegate; finished sending! result: %lu",
      (uint8_t *)&v9,
      0xCu);
  }

  handoffOperation = self->_handoffOperation;
  self->_handoffOperation = 0;

  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (a4 == 1 && (objc_opt_respondsToSelector() & 1) != 0) {
    [WeakRetained mailComposeControllerCompositionHandoffFinished:self];
  }
}

- (void)activityHandoffOperation:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  id v6 = MFLogGeneral();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v5, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    -[MFMailComposeController activityHandoffOperation:didFailWithError:]();
  }

  handoffOperation = self->_handoffOperation;
  self->_handoffOperation = 0;

  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained mailComposeController:self failedToHandoffCompositionWithError:v5];
  }
  if (self->_composeWebViewFlags.respondsToCompositionDidFailToFinish)
  {
    int v9 = [(MFMailComposeController *)self composeWebView];
    [v9 compositionDidFailToFinish];
  }
}

- (void)activityHandoffOperationReceivedBytes:(id)a3
{
  id v6 = a3;
  [(MFMailComposeController *)self _createAndAddHandoffProgressViewIfNecessary];
  unint64_t v4 = [v6 bytesReceived];
  double v5 = (double)v4 / (double)(unint64_t)[v6 bytesExpected];
  *(float *)&double v5 = v5;
  [(UIProgressView *)self->_handoffProgressView setProgress:v5];
}

- (void)_bodyTextChanged
{
  char v3 = *((unsigned char *)self + 1360);
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    BOOL v4 = [(MFComposeWebView *)self->_composeWebView isDirty];
    char v3 = *((unsigned char *)self + 1360);
  }
  *((unsigned char *)self + 1360) = v3 & 0xFE | v4;
  *((unsigned char *)self + 1360) |= 2u;
  [(MFMailComposeController *)self _updateSendAndCloseEnabled];

  [(MFMailComposeController *)self _draftContentDidChange];
}

- (void)_retainFocusOfComposeWebViewIfRequired:(id)a3
{
  id v5 = [(MFMailComposeController *)self traitCollection];
  char v4 = objc_msgSend(v5, "mf_supportsPopoverPresentation");

  if ((v4 & 1) == 0)
  {
    id v6 = [(MFMailComposeController *)self composeWebView];
    [v6 retainFocusAfterPresenting];
  }
}

- (void)mailCompositionContext:(id)a3 messageDidChange:(id)a4
{
}

- (UIEdgeInsets)additionalContentInsetForComposeWebView:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  id v6 = (double *)MEMORY[0x1E4FB2848];
  double v7 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  photosPickerController = self->_photosPickerController;
  if (photosPickerController)
  {
    double v9 = __67__MFMailComposeController_additionalContentInsetForComposeWebView___block_invoke((uint64_t)v4, photosPickerController, self->_photosPickerController);
    goto LABEL_8;
  }
  int64_t v10 = [(MFMailComposeController *)self styleSelector];

  if (v10)
  {
    uint64_t v11 = [(MFMailComposeController *)self styleSelector];
    id v12 = [(MFMailComposeController *)self styleSelector];
    double v9 = __67__MFMailComposeController_additionalContentInsetForComposeWebView___block_invoke((uint64_t)v12, v11, v12);
  }
  else
  {
    systemPhotosPickerController = self->_systemPhotosPickerController;
    double v9 = v7;
    if (!systemPhotosPickerController) {
      goto LABEL_8;
    }
    uint64_t v11 = [(MFComposePhotoPickerController *)systemPhotosPickerController pickerViewController];
    double v9 = __67__MFMailComposeController_additionalContentInsetForComposeWebView___block_invoke((uint64_t)v11, v11, self->_systemPhotosPickerController);
  }

LABEL_8:
  id v14 = [(MFMailComposeController *)self mailComposeView];
  int v15 = [v14 isQuickReply];
  double v16 = *v6;
  double v17 = v6[1];
  double v18 = v6[3];

  if (v15) {
    double v9 = v7;
  }

  double v19 = v16;
  double v20 = v17;
  double v21 = v9;
  double v22 = v18;
  result.right = v22;
  result.bottouint64_t m = v21;
  result.left = v20;
  result.top = v19;
  return result;
}

double __67__MFMailComposeController_additionalContentInsetForComposeWebView___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 navigationController];
  double v7 = [v6 presentationController];

  if (v7 || ([v4 presentationController], (double v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_opt_class();
    double v8 = 0.0;
    if (objc_opt_isKindOfClass())
    {
      if (v5)
      {
        double v9 = [v7 containerView];
        int64_t v10 = [v9 traitCollection];

        [v5 preferredHeightForTraitCollection:v10];
        double v8 = v11;
      }
      else
      {
        int64_t v10 = [v4 navigationController];
        id v12 = [v10 view];
        [v12 bounds];
        double v14 = v13;
        int v15 = [v4 view];
        [v15 safeAreaInsets];
        double v8 = v14 - v16;
      }
    }
  }
  else
  {
    double v8 = 0.0;
  }

  return v8;
}

- (void)showMissingAttachmentDataAlert
{
  char v3 = (void *)MEMORY[0x1E4FB1418];
  id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"ATTACHMENTS_FAILED_TO_LOAD_TITLE" value:&stru_1F0817A00 table:@"Main"];
  id v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  double v7 = [v6 localizedStringForKey:@"ATTACHMENTS_FAILED_TO_LOAD_MESSAGE" value:&stru_1F0817A00 table:@"Main"];
  double v8 = [v3 alertControllerWithTitle:v5 message:v7 preferredStyle:1];

  double v9 = (void *)MEMORY[0x1E4FB1410];
  int64_t v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  double v11 = [v10 localizedStringForKey:@"COMPOSE_ANYWAY" value:&stru_1F0817A00 table:@"Main"];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __57__MFMailComposeController_showMissingAttachmentDataAlert__block_invoke;
  v18[3] = &unk_1E5F7B3C8;
  void v18[4] = self;
  id v12 = [v9 actionWithTitle:v11 style:0 handler:v18];
  [v8 addAction:v12];

  double v13 = (void *)MEMORY[0x1E4FB1410];
  double v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  int v15 = [v14 localizedStringForKey:@"CANCEL" value:&stru_1F0817A00 table:@"Main"];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __57__MFMailComposeController_showMissingAttachmentDataAlert__block_invoke_2;
  v17[3] = &unk_1E5F7B3C8;
  void v17[4] = self;
  double v16 = [v13 actionWithTitle:v15 style:1 handler:v17];
  [v8 addAction:v16];

  [(MFMailComposeController *)self _presentModalAlert:v8];
}

void __57__MFMailComposeController_showMissingAttachmentDataAlert__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) mailComposeView];
  [v1 restoreFirstResponder];
}

uint64_t __57__MFMailComposeController_showMissingAttachmentDataAlert__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) close];
}

- (void)composeWebViewDidChangeFontAttributes:(id)a3
{
  id v5 = a3;
  -[MFMailComposeController setFontAttributes:](self, "setFontAttributes:");
  id v4 = [(MFMailComposeController *)self styleSelector];
  [v4 updateStateUsingFontAttributes:v5];
}

- (void)showStyleSelector:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = MFLogGeneral();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF945000, v5, OS_LOG_TYPE_DEFAULT, "#CompositionServices Showing style selector", buf, 2u);
  }

  id v6 = objc_alloc_init(MFComposeStyleSelectorViewController);
  [(MFMailComposeController *)self setStyleSelector:v6];

  double v7 = [(MFMailComposeController *)self styleSelector];
  [v7 setStyleDelegate:self];

  id v8 = objc_alloc(MEMORY[0x1E4FB19E8]);
  double v9 = [(MFMailComposeController *)self styleSelector];
  int64_t v10 = (void *)[v8 initWithRootViewController:v9];

  double v11 = [(MFMailComposeController *)self parentViewController];
  id v12 = [(MFMailComposeController *)self traitCollection];
  int v13 = objc_msgSend(v12, "mf_supportsPopoverPresentation");

  if (v13)
  {
    [v10 setModalPresentationStyle:7];
    double v14 = [v10 popoverPresentationController];
    [v14 setDelegate:self];
    [(MFMailComposeController *)self _configureSender:v4 asSourceForPopoverPresentationController:v14];
    [v14 setPermittedArrowDirections:14];
    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    id v22[2] = __45__MFMailComposeController_showStyleSelector___block_invoke;
    v22[3] = &unk_1E5F7A698;
    objc_copyWeak(&v23, (id *)buf);
    [v11 presentViewController:v10 animated:1 completion:v22];
    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    double v14 = [v10 presentationController];
    [v14 setDelegate:self];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v15 = v14;
      double v16 = [(MFMailComposeController *)self styleSelector];
      double v17 = [(MFMailComposeController *)self _sheetDetentForIdentifier:@"StyleSelectorHalfDetent" viewController:v16];

      v25[0] = v17;
      double v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
      [v15 setDetents:v18];

      [v15 setSmallestUndimmedDetentIdentifier:@"StyleSelectorHalfDetent"];
      [v15 setPrefersEdgeAttachedInCompactHeight:1];
    }
    double v19 = [(MFMailComposeController *)self composeWebView];
    [v19 retainFocusAfterPresenting];

    [v11 presentViewController:v10 animated:1 completion:0];
    double v20 = [(MFMailComposeController *)self styleSelector];
    double v21 = [(MFMailComposeController *)self fontAttributes];
    [v20 updateStateUsingFontAttributes:v21];
  }
}

void __45__MFMailComposeController_showStyleSelector___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained styleSelector];
  uint64_t v2 = [WeakRetained fontAttributes];
  [v1 updateStateUsingFontAttributes:v2];
}

- (void)_configureSender:(id)a3 asSourceForPopoverPresentationController:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v6 setBarButtonItem:v5];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v7 = v5;
      [v6 setSourceView:v7];
      [v7 bounds];
      CGFloat x = v12.origin.x;
      CGFloat y = v12.origin.y;
      CGFloat width = v12.size.width;
      CGFloat height = v12.size.height;
      CGRectGetMidX(v12);
      v13.origin.CGFloat x = x;
      v13.origin.CGFloat y = y;
      v13.size.CGFloat width = width;
      v13.size.CGFloat height = height;
      CGRectGetMidY(v13);
      UIRectCenteredAboutPoint();
      objc_msgSend(v6, "setSourceRect:");
    }
    else
    {
      double v7 = MFLogGeneral();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[MFMailComposeController _configureSender:asSourceForPopoverPresentationController:]();
      }
    }
  }
}

- (void)takeFocusFromComposeWebView:(id)a3 inDirection:(unint64_t)a4
{
  id v7 = a3;
  if (a4 == 16)
  {
    id v6 = &OBJC_IVAR___MFMailComposeController__toField;
  }
  else
  {
    if (a4 != 32) {
      goto LABEL_6;
    }
    id v6 = &OBJC_IVAR___MFMailComposeController__subjectField;
  }
  [*(id *)((char *)&self->super.super.super.isa + *v6) becomeFirstResponder];
LABEL_6:
}

- (id)sendLaterMenu
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F73E80] contextForCurrentDate];
  long long v29 = objc_opt_new();
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v3 = [&unk_1F0841A10 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v38 != v4) {
          objc_enumerationMutation(&unk_1F0841A10);
        }
        id v6 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        if (([v6 integerValue] & v2) != 0)
        {
          id v7 = objc_msgSend(MEMORY[0x1E4F73E80], "titleAndDateForSendLaterContext:", objc_msgSend(v6, "integerValue"));
          *(void *)id location = 0xAAAAAAAAAAAAAAAALL;
          objc_initWeak((id *)location, self);
          id v8 = (void *)MEMORY[0x1E4FB13F0];
          double v9 = [v7 first];
          v33[0] = MEMORY[0x1E4F143A8];
          v33[1] = 3221225472;
          v33[2] = __40__MFMailComposeController_sendLaterMenu__block_invoke;
          v33[3] = &unk_1E5F7BF28;
          objc_copyWeak(&v36, (id *)location);
          id v10 = v7;
          id v34 = v10;
          long long v35 = v6;
          double v11 = [v8 actionWithTitle:v9 image:0 identifier:0 handler:v33];

          CGRect v12 = NSString;
          CGRect v13 = [v10 first];
          double v14 = [v12 stringWithFormat:@"mail.sendLaterContextMenu.%@", v13];
          [v11 setAccessibilityIdentifier:v14];

          [v29 addObject:v11];
          objc_destroyWeak(&v36);
          objc_destroyWeak((id *)location);
        }
      }
      uint64_t v3 = [&unk_1F0841A10 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v3);
  }
  if ((v2 & 0x20) != 0)
  {
    *(void *)id location = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)location, self);
    id v15 = [MEMORY[0x1E4F73E80] titleAndDateForSendLaterContext:32];
    double v16 = (void *)MEMORY[0x1E4FB13F0];
    double v17 = [v15 first];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __40__MFMailComposeController_sendLaterMenu__block_invoke_2;
    void v30[3] = &unk_1E5F7BF50;
    objc_copyWeak(&v32, (id *)location);
    id v18 = v15;
    id v31 = v18;
    double v19 = [v16 actionWithTitle:v17 image:0 identifier:0 handler:v30];

    double v20 = NSString;
    double v21 = [v18 first];
    double v22 = [v20 stringWithFormat:@"mail.sendLaterContextMenu.%@", v21];
    [v19 setAccessibilityIdentifier:v22];

    [v29 addObject:v19];
    objc_destroyWeak(&v32);

    objc_destroyWeak((id *)location);
  }
  id v23 = MFLogGeneral();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id location = 138412290;
    *(void *)&location[4] = v29;
    _os_log_impl(&dword_1AF945000, v23, OS_LOG_TYPE_INFO, "Returning actions for send later menu %@", location, 0xCu);
  }

  id v24 = (void *)MEMORY[0x1E4FB1970];
  uint64_t v25 = (void *)[v29 copy];
  long long v26 = [v24 menuWithTitle:&stru_1F0817A00 children:v25];

  return v26;
}

void __40__MFMailComposeController_sendLaterMenu__block_invoke(id *a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    uint64_t v2 = [a1[4] second];
    [WeakRetained[123] setSendLaterDate:v2];

    objc_msgSend(WeakRetained[123], "setSendLaterContext:", objc_msgSend(a1[5], "integerValue"));
    [WeakRetained send:0];
  }
}

void __40__MFMailComposeController_sendLaterMenu__block_invoke_2(uint64_t a1, void *a2)
{
  id v11 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = [MFDatePickerViewController alloc];
  id v5 = [*(id *)(a1 + 32) second];
  id v6 = [(MFDatePickerViewController *)v4 initWithType:0 shouldShowDeleteButton:0 initialDate:v5];

  [(MFDatePickerViewController *)v6 setDelegate:WeakRetained];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v6];
  [v7 setModalPresentationStyle:7];
  id v8 = [v7 popoverPresentationController];
  double v9 = [v11 presentationSourceItem];
  [v8 setSourceItem:v9];

  id v10 = [WeakRetained parentViewController];
  [v10 presentViewController:v7 animated:1 completion:0];
}

- (void)addLink:(id)a3
{
  id v5 = a3;
  uint64_t v4 = _EFLocalizedString();
  [(MFMailComposeController *)self _presentLinkEditorWithName:v4 text:0 mode:0 completion:v5];
}

- (void)editLink:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = _EFLocalizedString();
  [(MFMailComposeController *)self _presentLinkEditorWithName:v7 text:v8 mode:0 completion:v6];
}

- (void)editTextDescription:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = _EFLocalizedString();
  [(MFMailComposeController *)self _presentLinkEditorWithName:v7 text:v8 mode:1 completion:v6];
}

- (void)_presentLinkEditorWithName:(id)a3 text:(id)a4 mode:(unint64_t)a5 completion:(id)a6
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  CGRect v13 = [(MFMailComposeController *)self traitCollection];
  int v14 = objc_msgSend(v13, "mf_supportsPopoverPresentation");

  if (v14)
  {
    id v15 = [[MFHyperlinkEditorViewController alloc] initWithTitle:v10 text:v11 mode:a5 shouldShowCloseButton:0 completion:v12];
    [(MFHyperlinkEditorViewController *)v15 setModalPresentationStyle:7];
    double v16 = [(MFMailComposeController *)self composeWebView];
    double v17 = [(MFHyperlinkEditorViewController *)v15 popoverPresentationController];
    [v17 setSourceView:v16];

    [(MFMailComposeController *)self _optimalRectForPresentingPopoverInComposeWebView];
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    long long v26 = [(MFHyperlinkEditorViewController *)v15 popoverPresentationController];
    objc_msgSend(v26, "setSourceRect:", v19, v21, v23, v25);

    long long v27 = v15;
  }
  else
  {
    long long v28 = [[MFHyperlinkEditorViewController alloc] initWithTitle:v10 text:v11 mode:a5 shouldShowCloseButton:1 completion:v12];
    [(MFHyperlinkEditorViewController *)v28 setModalPresentationStyle:1];
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    long long v29 = (void *)MEMORY[0x1E4FB1C30];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __75__MFMailComposeController__presentLinkEditorWithName_text_mode_completion___block_invoke;
    v36[3] = &unk_1E5F7BF78;
    objc_copyWeak(&v38, &location);
    long long v27 = v28;
    long long v37 = v27;
    id v30 = [v29 customDetentWithIdentifier:@"LinkEditorFirstCustomDetent" resolver:v36];
    id v31 = [v30 identifier];
    id v32 = [(MFHyperlinkEditorViewController *)v27 sheetPresentationController];
    [v32 setLargestUndimmedDetentIdentifier:v31];

    v40[0] = v30;
    long long v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
    id v34 = [(MFHyperlinkEditorViewController *)v27 sheetPresentationController];
    [v34 setDetents:v33];

    long long v35 = [(MFHyperlinkEditorViewController *)v27 sheetPresentationController];
    [v35 setPrefersEdgeAttachedInCompactHeight:1];

    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);
  }
  [(MFMailComposeController *)self presentViewController:v27 animated:1 completion:0];
}

double __75__MFMailComposeController__presentLinkEditorWithName_text_mode_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = [WeakRetained traitCollection];
  [v3 preferredHeightForTraitCollection:v4];
  double v6 = v5;

  return v6;
}

- (void)composeWebView:(id)a3 didChangeHeight:(double)a4
{
  if (_os_feature_enabled_impl())
  {
    id v7 = [(MFMailComposeController *)self mailComposeView];
    int v6 = [v7 isQuickReply];

    if (v6)
    {
      id v8 = [(MFMailComposeController *)self quickReplyDelegate];
      [v8 mailComposeController:self didChangeQuickReplyWebViewHeight:a4];
    }
  }
}

- (void)composeWebView:(id)a3 composeBodyIsEmpty:(BOOL)a4
{
  BOOL v4 = a4;
  if (_os_feature_enabled_impl())
  {
    id v7 = [(MFMailComposeController *)self mailComposeView];
    int v6 = [v7 isQuickReply];

    if (v6)
    {
      [(MFMailComposeController *)self setHasMessageBodyContent:v4 ^ 1];
      [(MFMailComposeController *)self _updateSendAndCloseEnabled];
      id v8 = [(MFMailComposeController *)self quickReplyDelegate];
      [v8 mailComposeController:self composeBodyIsEmpty:v4];
    }
  }
}

- (void)composeWebView:(id)a3 hasActiveWritingToolsSession:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl()
    && EMIsGreymatterAvailableWithOverride()
    && [(MFMailComposeController *)self hasActiveWritingToolsSession] != v4)
  {
    int v6 = EMLogCompose();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134218240;
      id v8 = self;
      __int16 v9 = 1024;
      BOOL v10 = v4;
      _os_log_impl(&dword_1AF945000, v6, OS_LOG_TYPE_DEFAULT, "%p: [Writing Tools] updating appearance for writing-tools session: %{BOOL}d", (uint8_t *)&v7, 0x12u);
    }

    [(MFMailComposeController *)self setHasActiveWritingToolsSession:v4];
    [(MFMailComposeController *)self _updateSendAndCloseEnabled];
  }
}

- (BOOL)isCloudKitShare
{
  uint64_t v2 = [(MFMailComposeController *)self compositionContext];
  uint64_t v3 = [v2 ckShare];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)composeStyleSelector:(id)a3 didSelectStyle:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = MFLogGeneral();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543362;
    id v14 = v7;
    _os_log_impl(&dword_1AF945000, v8, OS_LOG_TYPE_DEFAULT, "#CompositionServices Compose style selector did select style: %{public}@", (uint8_t *)&v13, 0xCu);
  }

  __int16 v9 = [(MFMailComposeController *)self composeWebView];
  uint64_t v10 = [v7 styleType];
  if (v10 == 11)
  {
    uint64_t v11 = 1;
  }
  else
  {
    if (v10 != 12)
    {
      id v12 = objc_msgSend(MEMORY[0x1E4F1CA18], "mf_invocationWithSelector:target:object:", objc_msgSend(v7, "editSelector"), v9, v6);
      [v12 invoke];

      goto LABEL_9;
    }
    uint64_t v11 = -1;
  }
  [v9 changeQuoteLevel:v11];
LABEL_9:
}

- (void)composeStyleSelector:(id)a3 didChangeTextColor:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = MFLogGeneral();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    id v11 = v7;
    _os_log_impl(&dword_1AF945000, v8, OS_LOG_TYPE_DEFAULT, "#CompositionServices Compose style selector did change text color: %{public}@", (uint8_t *)&v10, 0xCu);
  }

  __int16 v9 = [(MFMailComposeController *)self composeWebView];
  [v9 _setTextColor:v7 sender:v6];
}

- (void)composeStyleSelector:(id)a3 didChangeFont:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = MFLogGeneral();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    id v11 = v7;
    _os_log_impl(&dword_1AF945000, v8, OS_LOG_TYPE_DEFAULT, "#CompositionServices Compose style selector did change font: %{public}@", (uint8_t *)&v10, 0xCu);
  }

  [(MFMailComposeController *)self _retainFocusOfComposeWebViewIfRequired:v6];
  __int16 v9 = [(MFMailComposeController *)self composeWebView];
  [v9 _setFont:v7 sender:v6];
}

- (void)composeStyleSelector:(id)a3 didChangeFontSize:(double)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = MFLogGeneral();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    double v10 = a4;
    _os_log_impl(&dword_1AF945000, v7, OS_LOG_TYPE_DEFAULT, "#CompositionServices Compose style selector did change font size: %f", (uint8_t *)&v9, 0xCu);
  }

  id v8 = [(MFMailComposeController *)self composeWebView];
  [v8 _setFontSize:v6 sender:a4];
}

- (void)composeStyleSelectorDidCancel:(id)a3
{
  BOOL v4 = MFLogGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1AF945000, v4, OS_LOG_TYPE_DEFAULT, "#CompositionServices Compose style selector dismissed", v7, 2u);
  }

  double v5 = [(MFMailComposeController *)self composeWebView];
  [v5 releaseFocusAfterDismissing:1];

  id v6 = [(MFMailComposeController *)self styleSelector];
  [v6 dismissViewControllerAnimated:1 completion:0];

  [(MFMailComposeController *)self setStyleSelector:0];
}

- (void)composeStyleSelectorDidPresentColorPicker:(id)a3
{
  id v4 = a3;
  double v5 = MFLogGeneral();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1AF945000, v5, OS_LOG_TYPE_DEFAULT, "#CompositionServices Compose style selector presented color picker", v6, 2u);
  }

  [(MFMailComposeController *)self _retainFocusOfComposeWebViewIfRequired:v4];
}

- (void)composeStyleSelectorDidDismissFontPicker:(id)a3
{
  id v4 = a3;
  double v5 = MFLogGeneral();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1AF945000, v5, OS_LOG_TYPE_DEFAULT, "#CompositionServices Font picker dismissed", v6, 2u);
  }

  [(MFMailComposeController *)self _retainFocusOfComposeWebViewIfRequired:v4];
}

- (id)presentingViewControllerForComposeStyleSelector:(id)a3
{
  id v4 = [(MFMailComposeController *)self traitCollection];
  int v5 = objc_msgSend(v4, "mf_supportsPopoverPresentation");

  if (v5)
  {
    id v6 = [(MFMailComposeController *)self parentViewController];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  if (objc_msgSend(a4, "mf_supportsPopoverPresentation", a3)) {
    return 7;
  }
  else {
    return 1;
  }
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = a3;
  int v5 = [v4 presentedViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [(MFMailComposeController *)self mailComposeView];
    id v7 = [(MFMailComposeController *)self peoplePicker];

    if (v7 == v5)
    {
      [(MFMailComposeController *)self setPeoplePicker:0];
      [v6 setShowingPeoplePicker:0];
    }
    else
    {
      [(MFMailComposeController *)self setContactViewController:0];
      [(MFMailComposeController *)self setAtomPresentingCard:0];
      [(MFMailComposeController *)self setRecipientPresentingCard:0];
    }
    *((unsigned char *)self + 1361) &= ~2u;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 restoreFirstResponderWithKeyboardPinning:1];
    }
    else if ([v6 isSearchResultsPopoverVisible])
    {
      [v6 searchResultsPopoverWasDismissed];
    }
    uint64_t v11 = [(MFPhotoPickerController *)self->_photosPickerController navigationController];

    if (v5 == v11)
    {
      photosPickerController = self->_photosPickerController;
      self->_photosPickerController = 0;
    }
    int v13 = [(MFMailComposeController *)self popoverAlert];

    if (v5 == v13) {
      [(MFMailComposeController *)self setPopoverAlert:0];
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(MFMailComposeController *)self _didDismissDocumentPicker];
    }
    else
    {
      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      double v16 = __60__MFMailComposeController_presentationControllerDidDismiss___block_invoke;
      double v17 = &unk_1E5F7BFA0;
      id v18 = v4;
      double v19 = self;
      id v8 = (void (**)(void *, MFPhotoPickerController *))_Block_copy(&v14);
      v8[2](v8, self->_photosPickerController);
      int v9 = [(MFComposePhotoPickerController *)self->_systemPhotosPickerController pickerViewController];
      v8[2](v8, v9);

      double v10 = [(MFMailComposeController *)self styleSelector];
      v8[2](v8, v10);
    }
  }
  [(MFMailComposeController *)self _updateSendAndCloseEnabled];
}

void __60__MFMailComposeController_presentationControllerDidDismiss___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = v3;
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) presentedViewController];
    if (v4 == v8)
    {
    }
    else
    {
      int v5 = [*(id *)(a1 + 32) presentedViewController];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_8:

        goto LABEL_9;
      }
      id v6 = [*(id *)(a1 + 32) presentedViewController];
      id v7 = [v6 topViewController];

      if (v7 != v8)
      {
LABEL_9:
        id v3 = v8;
        goto LABEL_10;
      }
    }
    int v5 = [*(id *)(a1 + 40) composeWebView];
    [v5 releaseFocusAfterDismissing:1];
    id v4 = v8;
    id v8 = 0;
    goto LABEL_8;
  }
LABEL_10:
}

- (BOOL)getPrefersLargeTitles
{
  uint64_t v2 = [(MFMailComposeController *)self navigationController];
  id v3 = [v2 navigationBar];
  char v4 = [v3 prefersLargeTitles];

  return v4;
}

- (void)setPrefersLargeTitles:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(MFMailComposeController *)self navigationController];
  char v4 = [v5 navigationBar];
  [v4 setPrefersLargeTitles:v3];
}

- (void)datePickerViewController:(id)a3 didSelectDate:(id)a4
{
  id v5 = a4;
  -[_MFMailCompositionContext setSendLaterDate:](self->_compositionContext, "setSendLaterDate:");
  [(_MFMailCompositionContext *)self->_compositionContext setSendLaterContext:32];
  [(MFMailComposeController *)self send:0];
}

- (void)_sendAnalyticsSignalForResult:(int64_t)a3
{
  if (_os_feature_enabled_impl()
    && EMIsGreymatterAvailableWithOverride()
    && (unint64_t)a3 <= 2)
  {
    id v9 = [(MFMailComposeController *)self smartReplyThreadIdentifier];
    id v5 = [(MFMailComposeController *)self compositionContext];
    id v6 = [v5 originalMessage];
    id v7 = [v6 flags];
    uint64_t v8 = [v7 draft];

    [MEMORY[0x1E4F73E40] sendAnalyticsSignal:3 - a3 threadIdentifier:v9 isDraft:v8];
  }
}

- (void)_invalidateInputContextHistory
{
}

- (void)_invalidateInputContextHistoryDebounced:(BOOL)a3
{
  if (a3)
  {
    id v3 = [(MFMailComposeController *)self inputContextHistoryInvalidationDebouncer];
    [v3 debounceResult:0];
  }
  else
  {
    id v3 = [(MFMailComposeController *)self composeWebView];
    [v3 invalidateInputContextHistory];
  }
}

- (id)smartReplyThreadIdentifier
{
  uint64_t v2 = NSNumber;
  id v3 = [(MFMailComposeController *)self compositionContext];
  char v4 = [v3 originalMessage];
  id v5 = objc_msgSend(v2, "numberWithLongLong:", objc_msgSend(v4, "conversationID"));
  id v6 = [v5 stringValue];

  return v6;
}

- (id)_originalContentOfMessagesInReplyToMessage:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl()
    && EMIsGreymatterAvailableWithOverride()
    && ((*(uint64_t (**)(void))(*MEMORY[0x1E4F60CF0] + 16))() & 1) == 0)
  {
    id v7 = +[MFMailComposeController signpostLog];
    os_signpost_id_t v8 = [(MFMailComposeController *)self signpostID];
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AF945000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v8, "LOAD MESSAGE ORIGINAL CONTENT", "Begin loading message original content enableTelemetry=YES ", buf, 2u);
    }

    id v9 = [MEMORY[0x1E4F60E18] promise];
    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    double v10 = [(MFMailComposeController *)self originalContentMessagesScheduler];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __70__MFMailComposeController__originalContentOfMessagesInReplyToMessage___block_invoke;
    void v12[3] = &unk_1E5F7C060;
    id v13 = v4;
    objc_copyWeak(&v15, (id *)buf);
    id v11 = v9;
    id v14 = v11;
    [v10 performBlock:v12];

    id v5 = [v11 future];

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void __70__MFMailComposeController__originalContentOfMessagesInReplyToMessage___block_invoke(id *a1)
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F60250]) initWithBuilder:&__block_literal_global_1256];
  id v3 = a1[4];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__MFMailComposeController__originalContentOfMessagesInReplyToMessage___block_invoke_3;
  v5[3] = &unk_1E5F7C038;
  objc_copyWeak(&v8, a1 + 6);
  id v6 = a1[5];
  id v7 = a1[4];
  id v4 = (id)[v3 requestRepresentationWithOptions:v2 completionHandler:v5];

  objc_destroyWeak(&v8);
}

void __70__MFMailComposeController__originalContentOfMessagesInReplyToMessage___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setRequestedRepresentation:*MEMORY[0x1E4F5FCA0]];
  [v2 setNetworkUsage:0];
  [v2 setMaximumNumberOfOriginalContentMessagesToRequest:4];
}

void __70__MFMailComposeController__originalContentOfMessagesInReplyToMessage___block_invoke_3(id *a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    id v8 = +[MFMailComposeController signpostLog];
    os_signpost_id_t v9 = [WeakRetained signpostID];
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AF945000, v8, OS_SIGNPOST_EVENT, v9, "LOAD MESSAGE ORIGINAL CONTENT", "Did complete message content representation request enableTelemetry=YES ", buf, 2u);
    }

    if (!v5 || v6)
    {
      if (v6)
      {
        id v10 = v6;
      }
      else
      {
        id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F77B18] code:1030 userInfo:0];
      }
      id v11 = v10;
      uint64_t v12 = EMLogCompose();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = objc_msgSend(v11, "ef_publicDescription");
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v13;
        _os_log_impl(&dword_1AF945000, v12, OS_LOG_TYPE_DEFAULT, "[SmartReply] Message content representation request failed with error: %{public}@", buf, 0xCu);
      }
      [a1[4] finishWithError:v11];
    }
    else
    {
      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, WeakRetained);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __70__MFMailComposeController__originalContentOfMessagesInReplyToMessage___block_invoke_1257;
      void v14[3] = &unk_1E5F7C010;
      objc_copyWeak(&v17, (id *)buf);
      id v15 = a1[5];
      id v16 = a1[4];
      [v5 requestOriginalContentMessagesInReplyToContentItemWithCompletion:v14];

      objc_destroyWeak(&v17);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __70__MFMailComposeController__originalContentOfMessagesInReplyToMessage___block_invoke_1257(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __70__MFMailComposeController__originalContentOfMessagesInReplyToMessage___block_invoke_2_1258;
  v10[3] = &unk_1E5F7BFE8;
  objc_copyWeak(&v15, a1 + 6);
  id v7 = v5;
  id v11 = v7;
  id v8 = v6;
  id v12 = v8;
  id v13 = a1[4];
  id v14 = a1[5];
  os_signpost_id_t v9 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
  [v9 performBlock:v10];

  objc_destroyWeak(&v15);
}

void __70__MFMailComposeController__originalContentOfMessagesInReplyToMessage___block_invoke_2_1258(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32) && !*(void *)(a1 + 40))
    {
      id v3 = MFComposeLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = [*(id *)(a1 + 32) count];
        id v6 = objc_msgSend(*(id *)(a1 + 48), "ef_publicDescription");
        int v9 = 134349314;
        uint64_t v10 = v5;
        __int16 v11 = 2114;
        id v12 = v6;
        _os_log_impl(&dword_1AF945000, v3, OS_LOG_TYPE_DEFAULT, "[SmartReply] Retrieved %{public}lu original contents for message: %{public}@", (uint8_t *)&v9, 0x16u);
      }
    }
    else
    {
      id v3 = MFComposeLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        id v4 = objc_msgSend(*(id *)(a1 + 48), "ef_publicDescription");
        int v9 = 138543362;
        uint64_t v10 = (uint64_t)v4;
        _os_log_impl(&dword_1AF945000, v3, OS_LOG_TYPE_DEFAULT, "[SmartReply] Failed to retrieve plain text for message: %{public}@", (uint8_t *)&v9, 0xCu);
      }
    }

    [*(id *)(a1 + 56) finishWithResult:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
    id v7 = +[MFMailComposeController signpostLog];
    os_signpost_id_t v8 = [WeakRetained signpostID];
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      LOWORD(v9) = 0;
      _os_signpost_emit_with_name_impl(&dword_1AF945000, v7, OS_SIGNPOST_INTERVAL_END, v8, "LOAD MESSAGE ORIGINAL CONTENT", "End loading message original content enableTelemetry=YES ", (uint8_t *)&v9, 2u);
    }
  }
}

- (void)expandQuickReplyToFullCompose
{
}

- (void)expandQuickReplyToFullComposeAndPerformAction:(int64_t)a3 additionalUserInfo:(id)a4
{
  id v6 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __92__MFMailComposeController_expandQuickReplyToFullComposeAndPerformAction_additionalUserInfo___block_invoke;
  __int16 v11 = &unk_1E5F7C088;
  objc_copyWeak(v13, &location);
  v13[1] = (id)a3;
  id v7 = v6;
  id v12 = v7;
  [(MFMailComposeController *)self setDidSaveQuickReplyDraftHandler:&v8];
  [(MFMailComposeController *)self _draftContentDidChange];
  [(MFMailComposeController *)self backUpDraft];

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

void __92__MFMailComposeController_expandQuickReplyToFullComposeAndPerformAction_additionalUserInfo___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && a2)
  {
    id v16 = WeakRetained;
    uint64_t v5 = [WeakRetained userActivity];
    id v6 = [v5 userInfo];
    id v7 = (void *)[v6 mutableCopy];

    uint64_t v8 = [v16 autosaveIdentifier];
    [v7 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F73D10]];
    uint64_t v9 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
    [v7 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F73D18]];

    [v7 setObject:*(void *)(a1 + 32) forKeyedSubscript:*MEMORY[0x1E4F73D20]];
    [v5 setUserInfo:v7];
    uint64_t v10 = v8;
    if (!v8)
    {
      uint64_t v9 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v10 = [v9 UUIDString];
    }
    __int16 v11 = MSMailComposeWindowTargetContentIdentifierWithIdentifier();
    [v5 setTargetContentIdentifier:v11];

    if (!v8)
    {
    }
    id v12 = [v16 mailComposeView];
    uint64_t v13 = [v12 firstResponder];
    [v13 resignFirstResponder];

    id v14 = [v16 quickReplyDelegate];
    id v15 = [v16 userActivity];
    [v14 mailComposeController:v16 migrateToFullCompose:v15];

    id WeakRetained = v16;
  }
}

- (void)_performDeferredActionIfNecessary
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [(MFMailComposeController *)self compositionContext];
  uint64_t v4 = [v3 deferredAction];

  uint64_t v5 = [(MFMailComposeController *)self compositionContext];
  [v5 setDeferredAction:0];

  id v6 = [(MFMailComposeController *)self compositionContext];
  id v7 = [v6 deferredActionUserInfo];

  uint64_t v8 = [(MFMailComposeController *)self compositionContext];
  [v8 setDeferredActionUserInfo:0];

  if (v4)
  {
    uint64_t v9 = EMLogCompose();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 134349056;
      uint64_t v15 = v4;
      _os_log_impl(&dword_1AF945000, v9, OS_LOG_TYPE_DEFAULT, "Will perform delayed action: %{public}ld", (uint8_t *)&v14, 0xCu);
    }

    uint64_t v10 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F73D28]];
    __int16 v11 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F73D40]];
    if (v4 == 1)
    {
      id v12 = [(MFMailComposeController *)self mailComposeView];
      uint64_t v13 = [v12 composeWebView];
      [v13 becomeFirstResponder];

      -[MFMailComposeController setCaretPosition:](self, "setCaretPosition:", [v10 unsignedIntValue]);
    }
    else if (v4 != 2)
    {
      goto LABEL_9;
    }
    [(MFMailComposeController *)self _updateAndStartCompletingCcFieldWithMissingRecipients:v11];
LABEL_9:
  }
}

- (void)takeSnapshotWithCompletionHandler:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(MFMailComposeController *)self composeWebView];
  [v4 takeSnapshotWithConfiguration:0 completionHandler:v5];
}

- (void)_performBlockWithStrongComposeCoordinator:(id)a3
{
  id v5 = (void (**)(id, id))a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_composeCoordinator);
  if (WeakRetained) {
    v5[2](v5, WeakRetained);
  }
}

- (BOOL)_canUseOrnamentViewController
{
  id v2 = [(MFMailComposeController *)self composeCoordinator];

  return v2 == 0;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)remoteViewControllerProxy
{
  return self->_remoteViewControllerProxy;
}

- (void)setRemoteViewControllerProxy:(id)a3
{
}

- (CNContactPickerViewController)peoplePicker
{
  return self->_peoplePicker;
}

- (CNComposeRecipientAtom)atomPresentingCard
{
  return self->_atomPresentingCard;
}

- (void)setAtomPresentingCard:(id)a3
{
}

- (CNComposeRecipient)recipientPresentingCard
{
  return self->_recipientPresentingCard;
}

- (void)setRecipientPresentingCard:(id)a3
{
}

- (NSDictionary)certificatesByRecipient
{
  return self->_certificatesByRecipient;
}

- (void)setCertificatesByRecipient:(id)a3
{
}

- (NSDictionary)errorsByRecipient
{
  return self->_errorsByRecipient;
}

- (void)setErrorsByRecipient:(id)a3
{
}

- (NSString)addressForMissingIdentity
{
  return self->_addressForMissingIdentity;
}

- (void)setAddressForMissingIdentity:(id)a3
{
}

- (EMMessage)lastDraftMessage
{
  return self->_lastDraftMessage;
}

- (MFOutgoingMessageDelivery)delivery
{
  return self->_delivery;
}

- (BOOL)isModal
{
  return self->_isModal;
}

- (NSDate)autosavedDate
{
  return self->_autosavedDate;
}

- (MFMailComposeControllerQuickReplyDelegate)quickReplyDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_quickReplyDelegate);

  return (MFMailComposeControllerQuickReplyDelegate *)WeakRetained;
}

- (void)setQuickReplyDelegate:(id)a3
{
}

- (MFMailComposeControllerQuickReplyActionButtonProvider)quickReplyActionButtonProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_quickReplyActionButtonProvider);

  return (MFMailComposeControllerQuickReplyActionButtonProvider *)WeakRetained;
}

- (void)setQuickReplyActionButtonProvider:(id)a3
{
}

- (MFMailAccountProxyGenerator)accountProxyGenerator
{
  return self->_accountProxyGenerator;
}

- (void)setAccountProxyGenerator:(id)a3
{
}

- (EMMailboxObjectID)draftMailboxObjectID
{
  return self->_draftMailboxObjectID;
}

- (NSString)originatingBundleID
{
  return self->_originatingBundleID;
}

- (void)setOriginatingBundleID:(id)a3
{
}

- (int)sourceAccountManagement
{
  return self->_sourceAccountManagement;
}

- (void)setSourceAccountManagement:(int)a3
{
  self->_sourceAccountManagement = a3;
}

- (BOOL)useMailDrop
{
  return self->_useMailDrop;
}

- (void)setUseMailDrop:(BOOL)a3
{
  self->_useMailDrop = a3;
}

- (BOOL)autosaveIsValid
{
  return self->_autosaveIsValid;
}

- (void)setAutosaveIsValid:(BOOL)a3
{
  self->_autosaveIsValid = a3;
}

- (BOOL)didUseOmittedAttachmentsOrRecipients
{
  return self->_didUseOmittedAttachmentsOrRecipients;
}

- (void)setDidUseOmittedAttachmentsOrRecipients:(BOOL)a3
{
  self->_didUseOmittedAttachmentsOrRecipients = a3;
}

- (MFMailComposeCoordinator)composeCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_composeCoordinator);

  return (MFMailComposeCoordinator *)WeakRetained;
}

- (void)setComposeCoordinator:(id)a3
{
}

- (EMCoreAnalyticsCollector)analyticsCollector
{
  return self->_analyticsCollector;
}

- (UIAlertController)popoverAlert
{
  return self->_popoverAlert;
}

- (void)setPopoverAlert:(id)a3
{
}

- (CNContactViewController)contactViewController
{
  return self->_contactViewController;
}

- (void)setContactViewController:(id)a3
{
}

- (void)setSmimeStatusControl:(id)a3
{
}

- (BOOL)attachmentToMarkupIsLoaded
{
  return self->_attachmentToMarkupIsLoaded;
}

- (void)setAttachmentToMarkupIsLoaded:(BOOL)a3
{
  self->_attachmentToMarkupIsLoaded = a3;
}

- (BOOL)delayToShowMarkupHasPassed
{
  return self->_delayToShowMarkupHasPassed;
}

- (void)setDelayToShowMarkupHasPassed:(BOOL)a3
{
  self->_delayToShowMarkupHasPassed = a3;
}

- (unint64_t)markupReplyAttachmentLoadingProgress
{
  return self->_markupReplyAttachmentLoadingProgress;
}

- (void)setMarkupReplyAttachmentLoadingProgress:(unint64_t)a3
{
  self->_markupReplyAttachmentLoadingProgress = a3;
}

- (NSArray)initialMissingAttachmentWarnings
{
  return self->_initialMissingAttachmentWarnings;
}

- (void)setInitialMissingAttachmentWarnings:(id)a3
{
}

- (NSMutableSet)drawingFileAttachments
{
  return self->_drawingFileAttachments;
}

- (void)setDrawingFileAttachments:(id)a3
{
}

- (NSString)hideMyEmailAddressIfExists
{
  return self->_hideMyEmailAddressIfExists;
}

- (void)setHideMyEmailAddressIfExists:(id)a3
{
}

- (NSString)hideMyEmailSenderAddress
{
  return self->_hideMyEmailSenderAddress;
}

- (void)setHideMyEmailSenderAddress:(id)a3
{
}

- (BOOL)hideMyEmailMultipleRecipient
{
  return self->_hideMyEmailMultipleRecipient;
}

- (void)setHideMyEmailMultipleRecipient:(BOOL)a3
{
  self->_hideMyEmailMultipleRecipient = a3;
}

- (BOOL)hasPresentedSenderCollaborationAlert
{
  return self->_hasPresentedSenderCollaborationAlert;
}

- (void)setHasPresentedSenderCollaborationAlert:(BOOL)a3
{
  self->_hasPresentedSenderCollaborationAlert = a3;
}

- (BOOL)hasAddedEditableHyperlink
{
  return self->_hasAddedEditableHyperlink;
}

- (EFScheduler)autosaveQueue
{
  return self->_autosaveQueue;
}

- (void)setAutosaveQueue:(id)a3
{
}

- (MSAutosaveSession)autosaveSession
{
  return self->_autosaveSession;
}

- (void)setAutosaveSession:(id)a3
{
}

- (VNDocumentCameraViewController)documentCameraViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_documentCameraViewController);

  return (VNDocumentCameraViewController *)WeakRetained;
}

- (void)setDocumentCameraViewController:(id)a3
{
}

- (MFComposeDisplayMetrics)displayMetrics
{
  return self->_displayMetrics;
}

- (MFPhotoPickerProgressManager)photoPickerProgressManager
{
  return self->_photoPickerProgressManager;
}

- (void)setPhotoPickerProgressManager:(id)a3
{
}

- (double)previousPaletteWidth
{
  return self->_previousPaletteWidth;
}

- (void)setPreviousPaletteWidth:(double)a3
{
  self->_previousPaletteWidth = a3;
}

- (EFScheduler)prepareImagesForSendScheduler
{
  return self->_prepareImagesForSendScheduler;
}

- (id)didSaveQuickReplyDraftHandler
{
  return self->_didSaveQuickReplyDraftHandler;
}

- (void)setDidSaveQuickReplyDraftHandler:(id)a3
{
}

- (EFCancelable)messageLoadingTailspinCancellable
{
  return self->_messageLoadingTailspinCancellable;
}

- (void)setMessageLoadingTailspinCancellable:(id)a3
{
}

- (int64_t)currentlyLoadingCounter
{
  return self->_currentlyLoadingCounter;
}

- (void)setCurrentlyLoadingCounter:(int64_t)a3
{
  self->_currentlyLoadingCounter = a3;
}

- (BOOL)hasMessageBodyContent
{
  return self->_hasMessageBodyContent;
}

- (void)setHasMessageBodyContent:(BOOL)a3
{
  self->_hasMessageBodyContent = a3;
}

- (NSNumber)hasCustomSignature
{
  return self->_hasCustomSignature;
}

- (void)setHasCustomSignature:(id)a3
{
}

- (EFFuture)originalContentMessagesFuture
{
  return self->_originalContentMessagesFuture;
}

- (void)setOriginalContentMessagesFuture:(id)a3
{
}

- (EFScheduler)originalContentMessagesScheduler
{
  return self->_originalContentMessagesScheduler;
}

- (void)setOriginalContentMessagesScheduler:(id)a3
{
}

- (EFDebouncer)inputContextHistoryInvalidationDebouncer
{
  return self->_inputContextHistoryInvalidationDebouncer;
}

- (void)setInputContextHistoryInvalidationDebouncer:(id)a3
{
}

- (BOOL)hasActiveWritingToolsSession
{
  return self->_hasActiveWritingToolsSession;
}

- (void)setHasActiveWritingToolsSession:(BOOL)a3
{
  self->_hasActiveWritingToolsSession = a3;
}

- (_TtC9MessageUI20MessageUITipsManager)tipsManager
{
  return self->_tipsManager;
}

- (void)setTipsManager:(id)a3
{
}

- (MFComposeStyleSelectorViewController)styleSelector
{
  return self->_styleSelector;
}

- (void)setStyleSelector:(id)a3
{
}

- (NSDictionary)fontAttributes
{
  return self->_fontAttributes;
}

- (void)setFontAttributes:(id)a3
{
}

- (QLPreviewController)previewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previewController);

  return (QLPreviewController *)WeakRetained;
}

- (void)setPreviewController:(id)a3
{
}

- (MFAttachment)previewingAttachment
{
  return self->_previewingAttachment;
}

- (void)setPreviewingAttachment:(id)a3
{
}

- (BOOL)insertingDrawing
{
  return self->_insertingDrawing;
}

- (void)setInsertingDrawing:(BOOL)a3
{
  self->_insertingDrawing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewingAttachment, 0);
  objc_destroyWeak((id *)&self->_previewController);
  objc_storeStrong((id *)&self->_fontAttributes, 0);
  objc_storeStrong((id *)&self->_styleSelector, 0);
  objc_storeStrong((id *)&self->_tipsManager, 0);
  objc_storeStrong((id *)&self->_inputContextHistoryInvalidationDebouncer, 0);
  objc_storeStrong((id *)&self->_originalContentMessagesScheduler, 0);
  objc_storeStrong((id *)&self->_originalContentMessagesFuture, 0);
  objc_storeStrong((id *)&self->_hasCustomSignature, 0);
  objc_storeStrong((id *)&self->_messageLoadingTailspinCancellable, 0);
  objc_storeStrong(&self->_didSaveQuickReplyDraftHandler, 0);
  objc_storeStrong((id *)&self->_prepareImagesForSendScheduler, 0);
  objc_storeStrong((id *)&self->_photoPickerProgressManager, 0);
  objc_storeStrong((id *)&self->_displayMetrics, 0);
  objc_destroyWeak((id *)&self->_documentCameraViewController);
  objc_storeStrong((id *)&self->_autosaveSession, 0);
  objc_storeStrong((id *)&self->_autosaveQueue, 0);
  objc_storeStrong((id *)&self->_hideMyEmailSenderAddress, 0);
  objc_storeStrong((id *)&self->_hideMyEmailAddressIfExists, 0);
  objc_storeStrong((id *)&self->_drawingFileAttachments, 0);
  objc_storeStrong((id *)&self->_initialMissingAttachmentWarnings, 0);
  objc_storeStrong((id *)&self->_smimeStatusControl, 0);
  objc_storeStrong((id *)&self->_contactViewController, 0);
  objc_storeStrong((id *)&self->_popoverAlert, 0);
  objc_storeStrong((id *)&self->_analyticsCollector, 0);
  objc_destroyWeak((id *)&self->_composeCoordinator);
  objc_storeStrong((id *)&self->_originatingBundleID, 0);
  objc_storeStrong((id *)&self->_draftMailboxObjectID, 0);
  objc_storeStrong((id *)&self->_accountProxyGenerator, 0);
  objc_destroyWeak((id *)&self->_quickReplyActionButtonProvider);
  objc_destroyWeak((id *)&self->_quickReplyDelegate);
  objc_storeStrong((id *)&self->_recipientPresentingCard, 0);
  objc_destroyWeak(&self->_delegate);
  objc_destroyWeak((id *)&self->_containingWindow);
  objc_storeStrong((id *)&self->_content, 0);
  objc_destroyWeak((id *)&self->_savedFirstResponder);
  objc_storeStrong((id *)&self->_signatureController, 0);
  objc_storeStrong(&self->_releaseActiveFocusedState, 0);
  objc_storeStrong((id *)&self->_undoMoveAction, 0);
  objc_storeStrong((id *)&self->_securityScopes, 0);
  objc_storeStrong((id *)&self->_lastActiveDate, 0);
  objc_storeStrong((id *)&self->_autosavedDate, 0);
  objc_storeStrong((id *)&self->_autosaveTimer, 0);
  objc_storeStrong((id *)&self->_imageScalingGroup, 0);
  objc_storeStrong((id *)&self->_LANHandoffAgent, 0);
  objc_storeStrong((id *)&self->_progressIndicatorView, 0);
  objc_storeStrong((id *)&self->_handoffProgressView, 0);
  objc_storeStrong((id *)&self->_handoffOperation, 0);
  objc_storeStrong((id *)&self->_notifyConfirmation, 0);
  objc_storeStrong((id *)&self->_addressPickerReformatter, 0);
  objc_storeStrong((id *)&self->_addressForMissingIdentity, 0);
  objc_storeStrong((id *)&self->_errorsByRecipient, 0);
  objc_storeStrong((id *)&self->_certificatesByRecipient, 0);
  objc_storeStrong((id *)&self->_secureCompositionManager, 0);
  objc_storeStrong((id *)&self->_documentID, 0);
  objc_storeStrong((id *)&self->_autosaveIdentifier, 0);
  objc_storeStrong((id *)&self->_autosaveLock, 0);
  objc_storeStrong((id *)&self->_initialTitle, 0);
  objc_storeStrong((id *)&self->_lastDraftMessage, 0);
  objc_storeStrong((id *)&self->_savedHeaders, 0);
  objc_storeStrong((id *)&self->_delivery, 0);
  objc_storeStrong((id *)&self->_popoverManager, 0);
  objc_storeStrong((id *)&self->_recentRecipientPresentingCard, 0);
  objc_storeStrong((id *)&self->_composeWebView, 0);
  objc_storeStrong((id *)&self->_imageSizeField, 0);
  objc_storeStrong((id *)&self->_subjectField, 0);
  objc_storeStrong((id *)&self->_atomPresentingCard, 0);
  objc_storeStrong((id *)&self->_lastFocusedRecipientView, 0);
  objc_storeStrong((id *)&self->_ccField, 0);
  objc_storeStrong((id *)&self->_toField, 0);
  objc_storeStrong((id *)&self->_systemImagePickerController, 0);
  objc_storeStrong((id *)&self->_cameraPickerController, 0);
  objc_storeStrong((id *)&self->_systemPhotosPickerController, 0);
  objc_storeStrong((id *)&self->_photosPickerController, 0);
  objc_storeStrong((id *)&self->_peoplePicker, 0);
  objc_storeStrong((id *)&self->_sendAccessoryButton, 0);
  objc_storeStrong((id *)&self->_sendLaterButtonItem, 0);
  objc_storeStrong((id *)&self->_closeButtonItem, 0);
  objc_storeStrong((id *)&self->_sendButtonItem, 0);
  objc_storeStrong((id *)&self->_alternateTitleView, 0);
  objc_storeStrong((id *)&self->_sendingEmailAddress, 0);
  objc_storeStrong((id *)&self->_primaryAddressForForcedSendingAccount, 0);
  objc_storeStrong((id *)&self->_originalSendingEmailAddress, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_originalBccAddresses, 0);
  objc_storeStrong((id *)&self->_bccAddresses, 0);
  objc_storeStrong((id *)&self->_ccAddresses, 0);
  objc_storeStrong((id *)&self->_toAddresses, 0);
  objc_storeStrong((id *)&self->_compositionContext, 0);

  objc_storeStrong(&self->_remoteViewControllerProxy, 0);
}

- (void)markupAttachment:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1AF945000, v0, v1, "Attachment markup failed since itemDataProvider.item is nil", v2, v3, v4, v5, v6);
}

void __74__MFMailComposeController_documentCameraViewController_didFinishWithScan___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1AF945000, v3, v4, "#CompositionServices Unable to convert scanned document to PDF document: %{public}@", v5);
}

- (void)_insertDrawingFromExternalURL:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1AF945000, v3, v4, "#Attachments Error unable to copy file: %{public}@", v5);
}

- (void)_insertDrawingFromExternalURL:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1AF945000, v3, v4, "#Attachments Error unable to create temp directory: %{public}@", v5);
}

- (void)_deleteFileAtURLIfInTmp:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  OUTLINED_FUNCTION_2_1((uint64_t)a1, a2, 5.7779e-34);
  OUTLINED_FUNCTION_0_3(&dword_1AF945000, v6, v7, "#CompositionServices Error while deleting temporary file at path: %@", v8);
}

- (void)_checkForInvalidAddressesWithContinuation:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_5((uint64_t)a1, a2, a3, 5.8382e-34);
  _os_log_error_impl(&dword_1AF945000, v5, OS_LOG_TYPE_ERROR, "<%{public}@: %p> Abort send -- found invalid recipient address", v4, 0x16u);
}

- (void)_checkForEmptySubjectWithContinuation:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_5((uint64_t)a1, a2, a3, 5.8382e-34);
  _os_log_error_impl(&dword_1AF945000, v5, OS_LOG_TYPE_ERROR, "<%{public}@: %p> Abort send -- Subject is empty", v4, 0x16u);
}

void __91__MFMailComposeController__checkForOmittedRecipientsOrAttachmentsIfNeededWithContinuation___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1_3(&dword_1AF945000, v0, v1, "Unable to identify warnings error: %@.", v2);
}

void __70__MFMailComposeController__checkForShareParticipantsWithContinuation___block_invoke_830_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1_3(&dword_1AF945000, v0, v1, "Error occurred while adding participants to share: %{public}@", v2);
}

- (void)handleLargeMessageComposeHandoffWithInputStream:outputStream:error:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1AF945000, v3, v4, "#Hand-Off Error getting compose handoff streams: %{public}@", v5);
}

- (void)userActivity:didReceiveInputStream:outputStream:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1AF945000, v0, v1, "#Hand-Off Failed to get message data for stream handoff", v2, v3, v4, v5, v6);
}

- (void)activityHandoffOperation:didFinishReceivingData:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1AF945000, v0, v1, "#Hand-Off No draft data received from activity handoff operation.", v2, v3, v4, v5, v6);
}

- (void)activityHandoffOperation:didFailWithError:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_1AF945000, v3, v4, "#Hand-Off Delegate; error continuing: %{public}@", v5);
}

- (void)_configureSender:asSourceForPopoverPresentationController:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1_3(&dword_1AF945000, v0, v1, "#CompositionServices Attempted to configure a source popover against unsupported sender %@", v2);
}

@end