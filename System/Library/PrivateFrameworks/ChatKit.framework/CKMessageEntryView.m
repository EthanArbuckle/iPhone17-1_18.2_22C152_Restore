@interface CKMessageEntryView
+ (CKMessageEntryView)currentEntryView;
+ (UIEdgeInsets)contentViewInsetsForMarginInsets:(UIEdgeInsets)a3 shouldShowPluginButtons:(BOOL)a4 shouldShowCharacterCount:(BOOL)a5 shouldCoverSendButton:(BOOL)a6 isStewieMode:(BOOL)a7;
+ (UIEdgeInsets)coverViewInsetsForMarginInsets:(UIEdgeInsets)a3 shouldShowPluginButtons:(BOOL)a4 shouldShowCharacterCount:(BOOL)a5 shouldCenterCharacterCount:(BOOL *)a6 isStewieMode:(BOOL)a7;
+ (id)sharedAppStripDatasource;
+ (void)setCurrentEntryView:(id)a3;
- (BOOL)_canSend;
- (BOOL)_isApplePayCashInShelf;
- (BOOL)_isDictationEnabled;
- (BOOL)_isExceedingByteLimitForService:(id)a3;
- (BOOL)_isPresentingInPopover;
- (BOOL)_isRunningInMVS;
- (BOOL)_shouldEnablePlusButton;
- (BOOL)_shouldNotAnimateCollapseInteractive;
- (BOOL)_shouldUseDarkAppearanceFromTraitCollection:(id)a3;
- (BOOL)_shouldUseKeyboardVisibleBottomInsetsForTextEffectsPicker;
- (BOOL)animatingLayoutChange;
- (BOOL)audioControllerWasPlayingBeforeScrubbing;
- (BOOL)audioRecordingIsInEntryView;
- (BOOL)dictationEnabledForLanguage;
- (BOOL)entryFieldCollapsed;
- (BOOL)entryFieldUpdaterAnimatedValue;
- (BOOL)entryFieldUpdaterCollapsedValue;
- (BOOL)extendAppStripBlurToKeyplaneTop;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)hasFailedRecipients;
- (BOOL)hasRecording;
- (BOOL)hasUnreachableEmergencyRecipient;
- (BOOL)is3rdPartyKeyboardVisible;
- (BOOL)isAudioMessageRecordingAvailable;
- (BOOL)isCharacterCountHidden;
- (BOOL)isComposingRecipient;
- (BOOL)isInPencilMode;
- (BOOL)isKeyboardVisible;
- (BOOL)isPredictionBarEnabled;
- (BOOL)isRecording;
- (BOOL)isRunningInNotificationExtension;
- (BOOL)isSendingMessage;
- (BOOL)isShowingAudioRecordingView;
- (BOOL)isTransitioningForBrowserSwitcher;
- (BOOL)isUpdatingMentionAttributedText;
- (BOOL)languageHasSpaces;
- (BOOL)layoutIsCurrentlyCompact;
- (BOOL)messageEntryContentView:(id)a3 canPerformDictationAction:(id)a4;
- (BOOL)messageEntryContentView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (BOOL)messageEntryContentView:(id)a3 shouldInsertMediaObjects:(id)a4;
- (BOOL)messageEntryContentViewShouldAllowLinkCustomization:(id)a3;
- (BOOL)messageEntryContentViewShouldBeginEditing:(id)a3;
- (BOOL)messageEntryContentViewShouldResignFirstResponder:(id)a3;
- (BOOL)photoButtonEnabled;
- (BOOL)pluginButtonsEnabled;
- (BOOL)plusButtonFeedbackGeneratorIsActive;
- (BOOL)recordingStartedFromRaiseGesture;
- (BOOL)sendButtonEnabled;
- (BOOL)shouldAllowImpactSend;
- (BOOL)shouldAllowSendWhenSendButtonDisabled;
- (BOOL)shouldBlurForMessageEditing;
- (BOOL)shouldCenterCharacterCount;
- (BOOL)shouldCoverViewBeShrunkenForSendMenu;
- (BOOL)shouldDisableAttachments;
- (BOOL)shouldDisablePluginButtons;
- (BOOL)shouldEntryViewBeExpandedLayout;
- (BOOL)shouldHideBackgroundView;
- (BOOL)shouldRecordForService:(id)a3;
- (BOOL)shouldReloadBackgroundView;
- (BOOL)shouldShowAppStrip;
- (BOOL)shouldShowAudioButton;
- (BOOL)shouldShowAudioMessageHint;
- (BOOL)shouldShowCharacterCount;
- (BOOL)shouldShowDictationButton;
- (BOOL)shouldShowPluginButtons;
- (BOOL)shouldShowSendButton;
- (BOOL)shouldShowSendButtonSpinner;
- (BOOL)shouldShowSubject;
- (BOOL)shouldUseLinearResizeForAudioMessage;
- (BOOL)showAppStrip;
- (BOOL)showingMentionsSuggestions;
- (BOOL)showsKeyboardPredictionBar;
- (CAShapeLayer)dashedContentClipViewLayer;
- (CGRect)_computedFinalCoverFrameRectForContentSize:(CGSize)a3;
- (CGRect)activeKeyboardHeight;
- (CGRect)anchorRect;
- (CGRect)audioRecordingPillViewFrameInThrowViewCoordinates;
- (CGRect)browserButtonFrame;
- (CGRect)coverFrameThatFitsInSize:(CGSize)a3;
- (CGRect)sendButtonFrameInScreenCoordinates;
- (CGSize)characterCountSize;
- (CGSize)inputButtonSize;
- (CGSize)messageEntryContentViewMaxShelfPluginViewSize:(id)a3;
- (CGSize)sendButtonSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)waveformViewSize;
- (CKAudioController)audioController;
- (CKAudioMessageRecordingView)audioRecordingView;
- (CKAudioRecorder)recorder;
- (CKBrowserSwitcherFooterView)appStrip;
- (CKComposition)audioComposition;
- (CKComposition)composition;
- (CKComposition)previousAudioComposition;
- (CKConversation)conversation;
- (CKEntryViewButton)arrowButton;
- (CKEntryViewButton)audioButton;
- (CKEntryViewButton)browserButton;
- (CKEntryViewButton)cancelButton;
- (CKEntryViewButton)dictationButton;
- (CKEntryViewButton)keyboardButton;
- (CKEntryViewButton)photoButton;
- (CKEntryViewButton)sendAudioButton;
- (CKEntryViewButton)sendButton;
- (CKEntryViewButton)stopButton;
- (CKEntryViewPlusButton)plusButton;
- (CKMentionEntityNode)entityTree;
- (CKMentionSuggestionView)mentionSuggestionView;
- (CKMessageEntryBackgroundViewProtocol)backgroundView;
- (CKMessageEntryContentView)contentView;
- (CKMessageEntryHintView)hintView;
- (CKMessageEntryRecordedAudioView)recordedAudioView;
- (CKMessageEntryView)initWithFrame:(CGRect)a3 marginInsets:(UIEdgeInsets)a4 shouldAllowImpact:(BOOL)a5 shouldShowSendButton:(BOOL)a6 shouldShowSubject:(BOOL)a7 shouldShowPluginButtons:(BOOL)a8 shouldShowCharacterCount:(BOOL)a9 traitCollection:(id)a10 shouldDisableAttachments:(BOOL)a11 shouldUseNonEmojiKeyboard:(BOOL)a12 shouldUseNonHandwritingKeyboard:(BOOL)a13 shouldDisableKeyboardStickers:(BOOL)a14;
- (CKMessageEntryView)initWithFrame:(CGRect)a3 marginInsets:(UIEdgeInsets)a4 shouldShowSendButton:(BOOL)a5 shouldShowSubject:(BOOL)a6 shouldShowPluginButtons:(BOOL)a7 shouldShowCharacterCount:(BOOL)a8 traitCollection:(id)a9 shouldDisableAttachments:(BOOL)a10 shouldDisableKeyboardStickers:(BOOL)a11;
- (CKMessageEntryViewAudioMessageAppDelegate)audioMessageAppDelegate;
- (CKMessageEntryViewDelegate)delegate;
- (CKMessageEntryViewInputDelegate)inputDelegate;
- (CKMessageEntryWaveformView)waveformView;
- (CKScheduledUpdater)entryFieldCollapsedUpdater;
- (CKSendLaterPluginInfo)sendLaterPluginInfo;
- (NSArray)currentMentionSuggestions;
- (NSArray)keyCommands;
- (NSLayoutConstraint)heightConstraint;
- (NSMutableArray)powerLevels;
- (NSMutableDictionary)entityDictionary;
- (NSMutableSet)entityHandles;
- (NSString)backdropGroupName;
- (NSTimer)audioMessageButtonTimer;
- (UIActivityIndicatorView)sendButtonSpinner;
- (UIButton)emojiButton;
- (UIEdgeInsets)adjustedCoverInsets;
- (UIEdgeInsets)coverInsets;
- (UIEdgeInsets)marginInsets;
- (UIEdgeInsets)safeAreaInsets;
- (UIKBVisualEffectView)appStripBackgroundBlurView;
- (UIKeyboardLayoutGuide)entryViewKeyboardLayoutGuide;
- (UILabel)audioHintLabel;
- (UILabel)characterCountLabel;
- (UILabel)collpasedPlaceholderLabel;
- (UISelectionFeedbackGenerator)plusButtonFeedbackGenerator;
- (UISwipeGestureRecognizer)swipeGestureRecognizer;
- (UITextInputTraits_Private)lastConfiguredInputDelegate;
- (UITraitCollection)entryViewTraitCollection;
- (UIView)appStripBackgroundBlurContainerView;
- (UIView)buttonAndTextAreaContainerView;
- (UIView)contentClipView;
- (UIView)inputButtonContainerView;
- (UIView)knockoutView;
- (UIView)sendMenuSourceView;
- (UIVisualEffectView)knockoutVisualEffectView;
- (UIVisualEffectView)messageEditingBlurOverlayView;
- (_NSRange)lastFoundMentionRange;
- (_NSRange)rangeOfTappedMention;
- (_UIClickInteraction)sendButtonClickInteraction;
- (_UIClickInteractionDelegate)clickInteractionDelegate;
- (_UISupplementalLexicon)mentionsLexicon;
- (char)_balloonColor;
- (char)_sendButtonColor;
- (double)_accessoryViewFadeDuration;
- (double)_coverFrameWidthForMaxCoverFrameWidth:(double)a3 popoverLayoutMetrics:(id)a4;
- (double)balloonMaxWidthForMessageEntryRichTextView:(id)a3;
- (double)bottomInsetForAppStrip;
- (double)calculateOneLinePlaceHolderCenterY:(double)a3;
- (double)coverViewWidth;
- (double)duration;
- (double)placeholderHeight;
- (double)powerLevelForAudioMessageRecordingView:(id)a3;
- (double)previousBottomSafeAreaInset;
- (id)_currentInputDelegate;
- (id)_placeholderTextForConversation:(id)a3;
- (id)_serviceForEntryViewForConversation:(id)a3;
- (id)audioRecordingPillViewSnapshot;
- (id)createDictationButton;
- (id)didSelectEntityCompletionHandler;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)inputAccessoryViewBackdropColor;
- (id)inputAccessoryViewBackdropEffects;
- (id)pasteBoardTextFromComposition:(id)a3;
- (id)snapshotForCompactBrowserAnimation;
- (id)suggestionView:(id)a3 entityAtIndex:(unint64_t)a4;
- (id)suggestionView:(id)a3 indexPathOfEntityWithIdentifier:(id)a4;
- (int64_t)sendMenuPresentationState;
- (int64_t)style;
- (unint64_t)currentTappedCharacterIndex;
- (unint64_t)displayMode;
- (unint64_t)numberOfSuggestionsInSuggestionView:(id)a3 forSection:(unint64_t)a4;
- (void)_animateExpandForManualToggle:(BOOL)a3 completion:(id)a4;
- (void)_animateMessageEditingBlurOverlayViewIn;
- (void)_animateMessageEditingBlurOverlayViewOut;
- (void)_animateToCompactLayoutCollapsing:(BOOL)a3 completion:(id)a4;
- (void)_configureForDisplayModeRecorded;
- (void)_configureForDisplayModeRecording;
- (void)_configureForDisplayModeSending;
- (void)_configureForDisplayModeText;
- (void)_contactLimitsChanged:(id)a3;
- (void)_deleteTemporaryAudioFile;
- (void)_dictationAvailabilityDidChange;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_handlePlusButtonTouchInside:(id)a3;
- (void)_handleSendAudioMessage;
- (void)_isDictationEnabled;
- (void)_overrideUserInterfaceStyleForEntryViewStyleIfNeeded:(int64_t)a3;
- (void)_pausePlaying:(BOOL)a3;
- (void)_setupAudioMessageRecordingView;
- (void)_setupWaveformView;
- (void)_startPlaying:(BOOL)a3;
- (void)_swipeDownGestureRecognized:(id)a3;
- (void)_trackAudioMessageRecordingStarted;
- (void)_trackAudioMessageSentWithComposition:(id)a3;
- (void)_updateSendMenuPresentationState:(int64_t)a3;
- (void)_updateUIForEntryFieldCollapsedStateChange;
- (void)appSelectionInterfaceSelectedItem:(id)a3;
- (void)applicationWillResignActive;
- (void)arrowButtonTapped:(id)a3;
- (void)audioButtonLongPressed:(id)a3;
- (void)audioController:(id)a3 layoutViewsForScrubbingTime:(double)a4 mediaObject:(id)a5;
- (void)audioController:(id)a3 mediaObjectDidFinishPlaying:(id)a4;
- (void)audioController:(id)a3 mediaObjectProgressDidChange:(id)a4 currentTime:(double)a5 duration:(double)a6;
- (void)audioControllerDidStop:(id)a3;
- (void)audioMessageRecordingViewDidCancel:(id)a3;
- (void)audioMessageRecordingViewDidPause:(id)a3;
- (void)audioMessageRecordingViewDidPlay:(id)a3;
- (void)audioMessageRecordingViewDidResume:(id)a3;
- (void)audioMessageRecordingViewDidSend:(id)a3;
- (void)audioMessageRecordingViewDidStartScrubbing:(id)a3;
- (void)audioMessageRecordingViewDidStopScrubbing:(id)a3 atTime:(double)a4;
- (void)audioMessageRecordingViewDidUpdateScrubbing:(id)a3 atTime:(double)a4;
- (void)audioRecorderDidStartRecording:(id)a3;
- (void)audioRecorderDidUpdateAveragePower:(float)a3;
- (void)audioRecorderRecordingDidChange:(id)a3;
- (void)audioRecorderRecordingDidFail:(id)a3;
- (void)beginDeferringEntryFieldCollapsedStateChanges;
- (void)beginSendMenuFullScreenPresentation;
- (void)beginSendMenuPopoverPresentation;
- (void)browserButtonTapped:(id)a3;
- (void)cancelAudioMessage;
- (void)clearAppStripSelection;
- (void)clearAudioRecordingUI;
- (void)collapseGestureRecognized;
- (void)collapsedPlaceholderLabelTapped:(id)a3;
- (void)compositionWithAcceptedAutocorrection:(id)a3;
- (void)configureAppStripBackgroundViewsIfNecessary;
- (void)configureAppStripOrMentionSuggestionsIfNeeded;
- (void)configureForDisplayMode:(unint64_t)a3;
- (void)configureTextViewWithInputContextHistoryFromTranscript;
- (void)conversationPreferredServiceChanged:(id)a3;
- (void)dealloc;
- (void)deferredSetup;
- (void)dictationButtonTapped:(id)a3;
- (void)didMoveToWindow;
- (void)didSelectPlusButton:(id)a3;
- (void)disableRotationWhileRecordingAudioMessage;
- (void)endDeferringEntryFieldCollapsedStateChanges;
- (void)endSendMenuPresentation;
- (void)expandAppStrip;
- (void)expandGestureRecongnized;
- (void)finishBrowserSwitcherCompactTransition;
- (void)handleContentViewChangeWithCompletion:(id)a3;
- (void)handleLongPress:(id)a3;
- (void)invalidateCompositionForReason:(int64_t)a3;
- (void)keyCommandSend:(id)a3;
- (void)layoutSubviews;
- (void)loadRecordedAudioViewsIfNeeded;
- (void)messageEntryContentView:(id)a3 didAddPluginEntryViewControllerToViewHierarchy:(id)a4;
- (void)messageEntryContentView:(id)a3 didRequestGenerativeContentForImageURL:(id)a4;
- (void)messageEntryContentView:(id)a3 didStagePluginPayload:(id)a4;
- (void)messageEntryContentView:(id)a3 didTapMediaObject:(id)a4;
- (void)messageEntryContentView:(id)a3 willAddPluginEntryViewControllerToViewHierarchy:(id)a4;
- (void)messageEntryContentViewCancelWasTapped:(id)a3 shelfPluginPayload:(id)a4;
- (void)messageEntryContentViewDidBeginEditing:(id)a3 wasAlreadyActive:(BOOL)a4;
- (void)messageEntryContentViewDidChange:(id)a3 isTextChange:(BOOL)a4 isShelfChange:(BOOL)a5;
- (void)messageEntryContentViewDidChangePencilMode:(id)a3;
- (void)messageEntryContentViewDidDismissCustomizationPicker:(id)a3;
- (void)messageEntryContentViewDidEndEditing:(id)a3;
- (void)messageEntryContentViewDidPresentCustomizationPicker:(id)a3;
- (void)messageEntryContentViewDidTapHandwritingKey:(id)a3;
- (void)messageEntryContentViewSendLaterPluginInfoUpdated:(id)a3;
- (void)messageEntryContentViewShelfDidChange:(id)a3;
- (void)messageEntryContentViewTextFormattingAnimationsOptionsPresentationInProgress:(BOOL)a3;
- (void)messageEntryContentViewWantsSendLaterPickerPresented:(id)a3;
- (void)messageEntryContentViewWasTapped:(id)a3 isLongPress:(BOOL)a4;
- (void)messageEntryContentViewWillDismissCustomizationPicker:(id)a3;
- (void)messageEntryContentViewWillPresentCustomizationPicker:(id)a3;
- (void)messageEntryRecordedAudioView:(id)a3 mediaObjectDidFinishPlaying:(id)a4;
- (void)messageEntryRecordedAudioViewPlaybackDidStop;
- (void)messageEntryRecordedAudioViewPlaybackProgressDidChange:(double)a3;
- (void)messageEntryRecordedAudioViewPressedDelete:(id)a3;
- (void)messageEntryRecordedAudioViewPressedPause:(id)a3;
- (void)messageEntryRecordedAudioViewPressedPlay:(id)a3;
- (void)minifyAppStrip;
- (void)optionDownArrowClicked:(id)a3;
- (void)optionUpArrowClicked:(id)a3;
- (void)pausePlaying;
- (void)photoButtonTapped:(id)a3;
- (void)photoButtonTouchCancel:(id)a3;
- (void)photoButtonTouchDown:(id)a3;
- (void)photoButtonTouchUpOutside:(id)a3;
- (void)plusButtonLongPressed:(id)a3;
- (void)plusButtonTouchCancel:(id)a3;
- (void)plusButtonTouchDown:(id)a3;
- (void)plusButtonTouchDragEnter:(id)a3;
- (void)plusButtonTouchDragExit:(id)a3;
- (void)plusButtonTouchUpOutside:(id)a3;
- (void)prepareForBrowserSwitcherCompactTransitionIsSnapshotting:(BOOL)a3;
- (void)prepareForResizeAnimationIfNeeded;
- (void)presentAudioActionButtons;
- (void)safeAreaInsetsDidChange;
- (void)selectPluginAtIndexPath:(id)a3;
- (void)sendAudioMessage;
- (void)sendCurrentLocationMessage;
- (void)sendEnableRotationAfterRecordingToDelegate;
- (void)sendMenuPopoverMetricsDidChange:(id)a3;
- (void)setAnimatingLayoutChange:(BOOL)a3;
- (void)setAppStrip:(id)a3;
- (void)setAppStripBackgroundBlurContainerView:(id)a3;
- (void)setAppStripBackgroundBlurView:(id)a3;
- (void)setArrowButton:(id)a3;
- (void)setAudioButton:(id)a3;
- (void)setAudioComposition:(id)a3;
- (void)setAudioController:(id)a3;
- (void)setAudioControllerWasPlayingBeforeScrubbing:(BOOL)a3;
- (void)setAudioHintLabel:(id)a3;
- (void)setAudioMessageAppDelegate:(id)a3;
- (void)setAudioMessageButtonTimer:(id)a3;
- (void)setAudioMessageRecordingAvailable:(BOOL)a3;
- (void)setAudioRecordingView:(id)a3;
- (void)setBackdropGroupName:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setBrowserButton:(id)a3;
- (void)setBrowserButtonEnabled:(BOOL)a3;
- (void)setButtonAndTextAreaContainerView:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setCharacterCountHidden:(BOOL)a3;
- (void)setCharacterCountLabel:(id)a3;
- (void)setCharacterCountSize:(CGSize)a3;
- (void)setClickInteractionDelegate:(id)a3;
- (void)setCollpasedPlaceholderLabel:(id)a3;
- (void)setComposingRecipient:(BOOL)a3;
- (void)setComposition:(id)a3;
- (void)setContentClipView:(id)a3;
- (void)setContentView:(id)a3;
- (void)setConversation:(id)a3;
- (void)setCoverInsets:(UIEdgeInsets)a3;
- (void)setCurrentMentionSuggestions:(id)a3;
- (void)setCurrentTappedCharacterIndex:(unint64_t)a3;
- (void)setDashedContentClipViewLayer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDictationButton:(id)a3;
- (void)setDictationEnabledForLanguage:(BOOL)a3;
- (void)setDidSelectEntityCompletionHandler:(id)a3;
- (void)setDisablePluginButtons:(BOOL)a3;
- (void)setDisplayMode:(unint64_t)a3;
- (void)setDuration:(double)a3;
- (void)setEmojiButton:(id)a3;
- (void)setEntityDictionary:(id)a3;
- (void)setEntityHandles:(id)a3;
- (void)setEntityTree:(id)a3;
- (void)setEntryFieldCollapsed:(BOOL)a3;
- (void)setEntryFieldCollapsed:(BOOL)a3 animated:(BOOL)a4;
- (void)setEntryFieldCollapsedUpdater:(id)a3;
- (void)setEntryFieldUpdaterAnimatedValue:(BOOL)a3;
- (void)setEntryFieldUpdaterCollapsedValue:(BOOL)a3;
- (void)setEntryViewKeyboardLayoutGuide:(id)a3;
- (void)setEntryViewTraitCollection:(id)a3;
- (void)setEntryViewTraitCollection:(id)a3 resetStyle:(BOOL)a4;
- (void)setExtendAppStripBlurToKeyplaneTop:(BOOL)a3;
- (void)setFailedRecipients:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHeightConstraint:(id)a3;
- (void)setHintView:(id)a3;
- (void)setInputButtonContainerView:(id)a3;
- (void)setInputButtonSize:(CGSize)a3;
- (void)setInputDelegate:(id)a3;
- (void)setIsTransitioningForBrowserSwitcher:(BOOL)a3;
- (void)setIsUpdatingMentionAttributedText:(BOOL)a3;
- (void)setKeyCommands:(id)a3;
- (void)setKeyboardButton:(id)a3;
- (void)setKeyboardVisible:(BOOL)a3;
- (void)setKnockoutView:(id)a3;
- (void)setKnockoutVisualEffectView:(id)a3;
- (void)setLanguageHasSpaces:(BOOL)a3;
- (void)setLastConfiguredInputDelegate:(id)a3;
- (void)setLastFoundMentionRange:(_NSRange)a3;
- (void)setMarginInsets:(UIEdgeInsets)a3;
- (void)setMentionSuggestionView:(id)a3;
- (void)setMentionsLexicon:(id)a3;
- (void)setMessageEditingBlurOverlayView:(id)a3;
- (void)setPhotoButton:(id)a3;
- (void)setPlusButton:(id)a3;
- (void)setPowerLevels:(id)a3;
- (void)setPreviousAudioComposition:(id)a3;
- (void)setPreviousBottomSafeAreaInset:(double)a3;
- (void)setRangeOfTappedMention:(_NSRange)a3;
- (void)setRecordedAudioView:(id)a3;
- (void)setRecorder:(id)a3;
- (void)setRecordingStartedFromRaiseGesture:(BOOL)a3;
- (void)setSendAudioButton:(id)a3;
- (void)setSendButton:(id)a3;
- (void)setSendButtonClickInteraction:(id)a3;
- (void)setSendButtonSize:(CGSize)a3;
- (void)setSendButtonSpinner:(id)a3;
- (void)setSendLaterPluginInfo:(id)a3 animated:(BOOL)a4;
- (void)setSendMenuPresentationState:(int64_t)a3;
- (void)setSendingMessage:(BOOL)a3;
- (void)setShouldAllowImpactSend:(BOOL)a3;
- (void)setShouldBlurForMessageEditing:(BOOL)a3;
- (void)setShouldCenterCharacterCount:(BOOL)a3;
- (void)setShouldCoverViewBeShrunkenForSendMenu:(BOOL)a3;
- (void)setShouldDisableAttachments:(BOOL)a3;
- (void)setShouldHideBackgroundView:(BOOL)a3;
- (void)setShouldShowAudioMessageHint:(BOOL)a3;
- (void)setShouldShowCharacterCount:(BOOL)a3;
- (void)setShouldShowDictationButton:(BOOL)a3;
- (void)setShouldShowPluginButtons:(BOOL)a3;
- (void)setShouldShowSendButton:(BOOL)a3;
- (void)setShouldShowSendButtonSpinner:(BOOL)a3;
- (void)setShouldShowSubject:(BOOL)a3;
- (void)setShouldUseLinearResizeForAudioMessage:(BOOL)a3;
- (void)setShowAppStrip:(BOOL)a3;
- (void)setShowAppStrip:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setShowingMentionsSuggestions:(BOOL)a3;
- (void)setStopButton:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setSwipeGestureRecognizer:(id)a3;
- (void)setTextEffectCoordinatorPaused:(BOOL)a3 reason:(id)a4;
- (void)setUnreachableEmergencyRecipient:(BOOL)a3;
- (void)setWaveformView:(id)a3;
- (void)setWaveformViewSize:(CGSize)a3;
- (void)setupAudioMessageQuickSendViewAndStopRecording;
- (void)showAudioHintWithReason:(int64_t)a3;
- (void)showEffectPicker;
- (void)showHintWithText:(id)a3 animatingReferenceButton:(BOOL)a4;
- (void)showMessageEffectsHint;
- (void)startPlaying;
- (void)startRecording;
- (void)startRecordingForAudioButtonInEntryView;
- (void)startRecordingForRaiseGesture;
- (void)stopRecording;
- (void)stopRecordingForRaiseGestureWithFailure:(BOOL)a3;
- (void)switcherView:(id)a3 didMagnify:(BOOL)a4;
- (void)switcherView:(id)a3 didSelectPluginAtIndex:(id)a4;
- (void)textEffectsWindowOffsetDidChange:(id)a3;
- (void)touchUpInsideSendButton:(id)a3;
- (void)updateAppStripFrame;
- (void)updateAppsMenu;
- (void)updateAudioMessageRecordingAvailability;
- (void)updateBackgroundView;
- (void)updateEntryView;
- (void)updateKnockoutView;
- (void)updateTextViewsForShouldHideCaret:(BOOL)a3;
@end

@implementation CKMessageEntryView

+ (UIEdgeInsets)contentViewInsetsForMarginInsets:(UIEdgeInsets)a3 shouldShowPluginButtons:(BOOL)a4 shouldShowCharacterCount:(BOOL)a5 shouldCoverSendButton:(BOOL)a6 isStewieMode:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v9 = a5;
  BOOL v10 = a4;
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  double v16 = 0.0;
  if (!CKIsRunningInMacCatalyst() && !a6)
  {
    v17 = +[CKUIBehavior sharedBehaviors];
    [v17 entryViewSendButtonCoverSpace];
    double v19 = v18;
    v20 = +[CKUIBehavior sharedBehaviors];
    [v20 sendButtonSize];
    double v16 = v19 + v21;
  }
  objc_msgSend(a1, "coverViewInsetsForMarginInsets:shouldShowPluginButtons:shouldShowCharacterCount:shouldCenterCharacterCount:isStewieMode:", v10, v9, 0, v7, top, left, bottom, right);
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  v30 = +[CKUIBehavior sharedBehaviors];
  [v30 entryFieldCoverLineWidth];
  double v32 = v29 + v16 + v31 * 2.0;

  double v33 = v23 + 0.0;
  double v34 = v25 + 8.0;
  double v35 = v27 + 0.0;
  double v36 = v32;
  result.double right = v36;
  result.double bottom = v35;
  result.double left = v34;
  result.double top = v33;
  return result;
}

+ (UIEdgeInsets)coverViewInsetsForMarginInsets:(UIEdgeInsets)a3 shouldShowPluginButtons:(BOOL)a4 shouldShowCharacterCount:(BOOL)a5 shouldCenterCharacterCount:(BOOL *)a6 isStewieMode:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v9 = a5;
  BOOL v10 = a4;
  double right = a3.right;
  double left = a3.left;
  v51[1] = *MEMORY[0x1E4F143B8];
  v13 = +[CKUIBehavior sharedBehaviors];
  [v13 entryViewVerticalCoverInsets];
  double v15 = v14;
  double v17 = v16;

  double v18 = 0.0;
  if (v9)
  {
    if (v7)
    {
      double v19 = sMaximumCharacterCountString(1);
      uint64_t v50 = *MEMORY[0x1E4FB06F8];
      v20 = +[CKUIBehavior sharedBehaviors];
      double v21 = [v20 characterCountSatelliteFont];
      v51[0] = v21;
      double v22 = (void *)MEMORY[0x1E4F1C9E8];
      double v23 = (void **)v51;
      double v24 = &v50;
    }
    else
    {
      double v19 = sMaximumCharacterCountString(0);
      uint64_t v48 = *MEMORY[0x1E4FB06F8];
      v20 = +[CKUIBehavior sharedBehaviors];
      double v21 = [v20 characterCountFont];
      v49 = v21;
      double v22 = (void *)MEMORY[0x1E4F1C9E8];
      double v23 = &v49;
      double v24 = &v48;
    }
    double v25 = [v22 dictionaryWithObjects:v23 forKeys:v24 count:1];
    [v19 sizeWithAttributes:v25];
    double v27 = ceil(v26);

    double v18 = v27 + 7.0;
  }
  double v28 = +[CKUIBehavior sharedBehaviors];
  [v28 entryViewHorizontalCoverInsets];
  double v30 = v29;

  if (v30 >= right) {
    double right = v30;
  }
  double v31 = +[CKUIBehavior sharedBehaviors];
  int v32 = [v31 isEntryViewCollapsable];

  if (v10)
  {
    if (v32)
    {
      double v33 = +[CKEntryViewButton entryViewButtonImageForType:1];
      [v33 size];
      double v35 = v34;
      double v36 = +[CKUIBehavior sharedBehaviors];
      [v36 arrowButtonRightPadding];
      double v38 = v35 + v37;
      v39 = +[CKUIBehavior sharedBehaviors];
      [v39 entryViewHorizontalCoverInsets];
      double v41 = v38 + v40 * 2.0;
    }
    else
    {
      double v33 = +[CKUIBehavior sharedBehaviors];
      [v33 entryViewNonCollapsableLeftPadding];
      double v41 = v43;
    }
  }
  else
  {
    double v33 = +[CKUIBehavior sharedBehaviors];
    [v33 entryViewHorizontalCoverInsets];
    double v41 = v42;
  }

  if (a6) {
    *a6 = right >= v18;
  }
  if (v41 >= left) {
    double v44 = v41;
  }
  else {
    double v44 = left;
  }
  double v45 = v15;
  double v46 = v17;
  double v47 = right;
  result.double right = v47;
  result.double bottom = v46;
  result.double left = v44;
  result.double top = v45;
  return result;
}

+ (void)setCurrentEntryView:(id)a3
{
}

+ (CKMessageEntryView)currentEntryView
{
  id WeakRetained = objc_loadWeakRetained(__currentEntryView);

  return (CKMessageEntryView *)WeakRetained;
}

- (void)dealloc
{
  if ([(UIActivityIndicatorView *)self->_sendButtonSpinner isAnimating]) {
    [(UIActivityIndicatorView *)self->_sendButtonSpinner stopAnimating];
  }
  [(CKAudioMessageRecordingView *)self->_audioRecordingView setDelegate:0];
  [(CKAudioMessageRecordingView *)self->_audioRecordingView invalidateDisplayLink];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4 = [(CKBrowserSwitcherFooterView *)self->_appStrip delegate];

  if (v4 == self) {
    [(CKBrowserSwitcherFooterView *)self->_appStrip setDelegate:0];
  }
  if ([(CKBrowserSwitcherFooterView *)self->_appStrip isMagnified])
  {
    appStrip = self->_appStrip;
    self->_appStrip = 0;
  }
  [(CKScheduledUpdater *)self->_entryFieldCollapsedUpdater invalidate];
  [(CKMessageEntryRecordedAudioView *)self->_recordedAudioView setDelegate:0];
  [(CKMessageEntryContentView *)self->_contentView setDelegate:0];
  [(CKAudioRecorder *)self->_recorder setDelegate:0];
  [(CKAudioRecorder *)self->_recorder resetState];
  v6 = [(CKMessageEntryView *)self sendButtonClickInteraction];

  if (v6)
  {
    BOOL v7 = [(CKMessageEntryView *)self sendButton];
    v8 = [(CKMessageEntryView *)self sendButtonClickInteraction];
    [v7 removeInteraction:v8];

    [(CKMessageEntryView *)self setSendButtonClickInteraction:0];
  }
  v9.receiver = self;
  v9.super_class = (Class)CKMessageEntryView;
  [(CKMessageEntryView *)&v9 dealloc];
}

- (UIView)sendMenuSourceView
{
  v3 = [(CKMessageEntryView *)self plusButton];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(CKMessageEntryView *)self browserButton];
  }
  v6 = v5;

  return (UIView *)v6;
}

- (UIEdgeInsets)safeAreaInsets
{
  v22.receiver = self;
  v22.super_class = (Class)CKMessageEntryView;
  [(CKMessageEntryView *)&v22 safeAreaInsets];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v10 = v3;
  if (v6 > 0.0 || v3 > 0.0)
  {
    v11 = [(CKMessageEntryView *)self window];
    v12 = [v11 windowScene];

    if (v12 && (unint64_t)([v12 interfaceOrientation] - 3) <= 1)
    {
      v13 = +[CKUIBehavior sharedBehaviors];
      [v13 landscapeKeyboardInsets];
      double v15 = v14;
      double v17 = v16;

      if (v7 > 0.0) {
        double v7 = v15;
      }
      if (v10 > 0.0) {
        double v10 = v17;
      }
    }
  }
  double v18 = v5;
  double v19 = v7;
  double v20 = v9;
  double v21 = v10;
  result.double right = v21;
  result.double bottom = v20;
  result.double left = v19;
  result.double top = v18;
  return result;
}

- (void)safeAreaInsetsDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)CKMessageEntryView;
  [(CKMessageEntryView *)&v5 safeAreaInsetsDidChange];
  [(CKMessageEntryView *)self safeAreaInsets];
  if (vabdd_f64(v3, self->_previousBottomSafeAreaInset) > 0.001)
  {
    self->_previousBottomSafeAreaInset = v3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained messageEntryViewSafeAreaInsetsDidChange:self];
  }
}

- (void)didMoveToWindow
{
  v5.receiver = self;
  v5.super_class = (Class)CKMessageEntryView;
  [(CKMessageEntryView *)&v5 didMoveToWindow];
  double v3 = [(CKMessageEntryView *)self window];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained messageEntryView:self didMoveToWindow:v3];
}

- (double)_coverFrameWidthForMaxCoverFrameWidth:(double)a3 popoverLayoutMetrics:(id)a4
{
  if (!a4)
  {
    objc_super v5 = +[CKUIBehavior sharedBehaviors];
    [v5 sendMenuEntryViewContentWidthMultiplier];
    a3 = v6 * a3;
  }
  return a3;
}

- (void)layoutSubviews
{
  uint64_t v562 = *MEMORY[0x1E4F143B8];
  +[CKPPTSubTest start:@"CKMessageEntryView Layoutsubviews"];
  v554.receiver = self;
  v554.super_class = (Class)CKMessageEntryView;
  [(CKMessageEntryView *)&v554 layoutSubviews];
  [(CKMessageEntryView *)self bounds];
  double v538 = v4;
  double v540 = v3;
  double v6 = v5;
  double v8 = v7;
  double v9 = [(CKMessageEntryView *)self buttonAndTextAreaContainerView];
  objc_msgSend(v9, "setFrame:", v540, v538, v6, v8);

  double v10 = [(CKMessageEntryView *)self messageEditingBlurOverlayView];
  objc_msgSend(v10, "setFrame:", v540, v538, v6, v8);

  if ([(CKMessageEntryView *)self shouldEntryViewBeExpandedLayout]) {
    int v11 = 1;
  }
  else {
    int v11 = ![(CKMessageEntryView *)self shouldShowPluginButtons];
  }
  v12 = +[CKUIBehavior sharedBehaviors];
  [v12 entryViewHorizontalCoverInsets];
  double v14 = v13;
  [(CKMessageEntryView *)self safeAreaInsets];
  double v16 = v15;

  [(CKMessageEntryView *)self safeAreaInsets];
  -[CKMessageEntryView coverFrameThatFitsInSize:](self, "coverFrameThatFitsInSize:", v6, v8 - v17);
  double v535 = v18;
  double rect = v19;
  double v21 = v20;
  double v23 = v22;
  [(CKMessageEntryView *)self adjustedCoverInsets];
  double v494 = v24;
  double v25 = +[CKUIBehavior sharedBehaviors];
  int v26 = [v25 entryViewSupportsPlusButton];

  double v511 = 0.0;
  if (v26)
  {
    [(CKMessageEntryView *)self inputButtonSize];
    double v511 = v27;
  }
  double v514 = v14 + v16;
  if (self->_shouldCoverViewBeShrunkenForSendMenu)
  {
    double v28 = [(CKMessageEntryView *)self delegate];
    double v29 = [v28 messageEntryViewActiveSendMenuPresentation:self];

    if (v29 && [v29 presentationStyle] == 1) {
      double v30 = (void *)[v29 newPopoverLayoutMetrics];
    }
    else {
      double v30 = 0;
    }
    v563.origin.CGFloat x = v21;
    v563.origin.CGFloat y = v535;
    v563.size.width = v23;
    v563.size.height = rect;
    [(CKMessageEntryView *)self _coverFrameWidthForMaxCoverFrameWidth:v30 popoverLayoutMetrics:CGRectGetWidth(v563)];
    double v549 = v31;
    int v32 = +[CKUIBehavior sharedBehaviors];
    [v32 sendMenuEntryViewHorizontalPositionAdjustment];
    double v510 = v33;
  }
  else
  {
    double v510 = 0.0;
    double v549 = v23;
    if (v11) {
      goto LABEL_15;
    }
    v564.origin.CGFloat y = v538;
    v564.origin.CGFloat x = v540;
    v564.size.width = v6;
    v564.size.height = v8;
    double Width = CGRectGetWidth(v564);
    double v30 = +[CKUIBehavior sharedBehaviors];
    [v30 browserButtonSize];
    double v549 = Width - v514 - v511 + -16.5 - v35 + -14.5 - v494;
    double v510 = 0.0;
  }

LABEL_15:
  v524 = [(CKMessageEntryView *)self inputButtonContainerView];
  [(CKMessageEntryView *)self safeAreaInsets];
  double v37 = v36;
  double v38 = [(CKMessageEntryView *)self hintView];
  double v528 = v8 - v37;
  objc_msgSend(v38, "setFrame:", v540, v538, v6);

  objc_msgSend(v524, "setFrame:", v540, v538, v6, v8 - v37);
  v39 = +[CKUIBehavior sharedBehaviors];
  v504 = [v39 entryViewlayoutMetrics];

  [(CKMessageEntryView *)self calculateOneLinePlaceHolderCenterY:v8 - v37];
  double v526 = v40;
  v537 = [(CKMessageEntryView *)self plusButton];
  double v41 = [v537 superview];
  double v42 = [(CKMessageEntryView *)self inputButtonContainerView];

  BOOL v43 = [(CKMessageEntryView *)self shouldShowPluginButtons];
  double v495 = *MEMORY[0x1E4F1DAD8];
  double v44 = *MEMORY[0x1E4F1DB30];
  double v492 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v493 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  char v45 = !v43;
  if (!v537) {
    char v45 = 1;
  }
  if ((v45 & 1) == 0 && v41 == v42)
  {
    [(CKMessageEntryView *)self inputButtonSize];
    double v493 = v46;
    double v44 = v47;
    [(CKMessageEntryView *)self safeAreaInsets];
    double v49 = v48;
    uint64_t v50 = +[CKUIBehavior sharedBehaviors];
    [v50 entryViewHorizontalCoverInsets];
    double v52 = v51;

    v53 = [(CKMessageEntryView *)self traitCollection];
    [v53 displayScale];
    double v55 = v54;

    double v495 = round((v44 * 0.5 + v49 + v52) * v55) / v55;
    double v492 = v526;
  }
  double v485 = v44;
  v542 = [(CKMessageEntryView *)self photoButton];
  BOOL v56 = [(CKMessageEntryView *)self shouldShowPluginButtons];
  if (v542) {
    BOOL v57 = v56;
  }
  else {
    BOOL v57 = 0;
  }
  double v547 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v548 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v503 = v547;
  double v499 = v548;
  double v545 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  CGFloat v546 = *MEMORY[0x1E4F1DB28];
  double v512 = v545;
  double v501 = *MEMORY[0x1E4F1DB28];
  if (v57)
  {
    [(CKMessageEntryView *)self inputButtonSize];
    double v499 = v58;
    double v503 = v59;
    double v512 = v526 + v511 * -0.5;
    double v501 = v514;
  }
  v536 = [(CKMessageEntryView *)self browserButton];
  v517 = [(CKMessageEntryView *)self cancelButton];
  BOOL v60 = [(CKMessageEntryView *)self shouldShowPluginButtons];
  CGFloat v61 = v546;
  double v62 = v547;
  double v63 = v548;
  double v64 = v545;
  double v65 = v545;
  double v500 = v546;
  double v533 = v21 + v23 - v549;
  double v508 = v547;
  double v502 = v548;
  if (v60)
  {
    if (v537) {
      goto LABEL_29;
    }
    if (v536) {
      goto LABEL_29;
    }
    double v62 = v547;
    double v63 = v548;
    double v65 = v545;
    double v500 = v546;
    double v508 = v547;
    double v502 = v548;
    double v64 = v545;
    CGFloat v61 = v546;
    if (v517)
    {
LABEL_29:
      v66 = +[CKUIBehavior sharedBehaviors];
      [v66 browserButtonSize];
      double v502 = v67;
      double v508 = v68;

      if (v542)
      {
        if (v11)
        {
          double v69 = (v503 - v508) * 0.5;
          if (CKMainScreenScale_once_59 != -1) {
            dispatch_once(&CKMainScreenScale_once_59, &__block_literal_global_1607);
          }
          double v70 = v501;
        }
        else
        {
          v565.origin.CGFloat x = v501;
          v565.origin.CGFloat y = v512;
          v565.size.width = v499;
          v565.size.height = v503;
          double v78 = CGRectGetMaxX(v565) + 16.5;
          if (CKMainScreenScale_once_59 != -1) {
            dispatch_once(&CKMainScreenScale_once_59, &__block_literal_global_1607);
          }
          double v79 = *(double *)&CKMainScreenScale_sMainScreenScale_59;
          if (*(double *)&CKMainScreenScale_sMainScreenScale_59 == 0.0) {
            double v79 = 1.0;
          }
          double v70 = floor(v78 * v79) / v79;
          double v69 = (v503 - v508) * 0.5;
        }
        double v80 = *(double *)&CKMainScreenScale_sMainScreenScale_59;
        if (*(double *)&CKMainScreenScale_sMainScreenScale_59 == 0.0) {
          double v80 = 1.0;
        }
        double v71 = v512 + floor(v69 * v80) / v80;
      }
      else
      {
        double v71 = v526 + v508 * -0.5;
        if (CKIsRunningInMacCatalyst())
        {
          v72 = [(CKMessageEntryView *)self traitCollection];
          [v72 displayScale];
          double v74 = v73;
          if (v73 == 0.0)
          {
            if (CKMainScreenScale_once_59 != -1) {
              dispatch_once(&CKMainScreenScale_once_59, &__block_literal_global_1607);
            }
            if (*(double *)&CKMainScreenScale_sMainScreenScale_59 == 0.0) {
              double v74 = 1.0;
            }
            else {
              double v74 = *(double *)&CKMainScreenScale_sMainScreenScale_59;
            }
          }

          v75 = [(CKMessageEntryView *)self traitCollection];
          [v75 displayScale];
          double v77 = v76;
          if (v76 == 0.0)
          {
            if (CKMainScreenScale_once_59 != -1) {
              dispatch_once(&CKMainScreenScale_once_59, &__block_literal_global_1607);
            }
            if (*(double *)&CKMainScreenScale_sMainScreenScale_59 == 0.0) {
              double v77 = 1.0;
            }
            else {
              double v77 = *(double *)&CKMainScreenScale_sMainScreenScale_59;
            }
          }

          double v70 = floor((v514 + -2.5) * v74) / v74;
          double v71 = floor((v71 + -1.0) * v77) / v77;
        }
        else
        {
          double v70 = v514;
        }
      }
      if (CKIsRunningInMacCatalyst())
      {
        v81 = +[CKUIBehavior sharedBehaviors];
        [v81 cancelButtonSize];
        double v63 = v82;
        double v62 = v83;

        v84 = [(CKMessageEntryView *)self plusButton];
        double MidX = v495;
        if (!v84)
        {
          v566.origin.CGFloat x = v70;
          v566.origin.CGFloat y = v71;
          v566.size.width = v502;
          v566.size.height = v508;
          double MidX = CGRectGetMidX(v566);
        }

        v86 = +[CKUIBehavior sharedBehaviors];
        [v86 cancelButtonSize];
        double v88 = v87;

        double v500 = MidX + v63 * -0.5;
        double v65 = v526 + v88 * -0.5;
      }
      else
      {
        double v62 = rect;
        double v63 = v549;
        double v65 = v535;
        double v500 = v533;
      }
      double v64 = v71;
      CGFloat v61 = v70;
    }
  }
  double v487 = v65;
  double v488 = v63;
  double v489 = v62;
  double v490 = v61;
  double v491 = v64;
  v532 = [(CKMessageEntryView *)self arrowButton];
  BOOL v89 = [(CKMessageEntryView *)self shouldShowPluginButtons];
  if (v532) {
    BOOL v90 = v89;
  }
  else {
    BOOL v90 = 0;
  }
  double v497 = v548;
  double v498 = v547;
  double v496 = v545;
  double v506 = v546;
  if (v90)
  {
    double v506 = v514;
    if ((v11 & 1) == 0)
    {
      v567.origin.CGFloat x = v533;
      v567.origin.CGFloat y = v535;
      v567.size.width = v549;
      v567.size.height = rect;
      double v506 = CGRectGetMinX(v567) + 14.5;
    }
    [(CKMessageEntryView *)self inputButtonSize];
    double v497 = v91;
    double v498 = v92;
    double v496 = v512;
  }
  v509 = [(CKMessageEntryView *)self sendButton];
  if (CKIsRunningInMacCatalyst())
  {
    v93 = +[CKUIBehavior sharedBehaviors];
    [v93 entryViewSendButtonCoverSpace];
    double v95 = v94;
    v96 = [(CKMessageEntryView *)self contentView];
    [v96 setSendButtonTextInsetWidth:v95];

    double v507 = v547;
    double v530 = v548;
    double v97 = v546;
LABEL_76:
    double v531 = v97;

    goto LABEL_77;
  }
  double v507 = v547;
  double v530 = v548;
  double v531 = v546;
  if ([(CKMessageEntryView *)self shouldShowSendButton])
  {
    [(CKMessageEntryView *)self sendButtonSize];
    double v530 = v98;
    double v507 = v99;
    v100 = +[CKUIBehavior sharedBehaviors];
    [v100 entryViewSendButtonCoverSpace];
    double v102 = v101;

    v568.origin.CGFloat x = v533;
    v568.origin.CGFloat y = v535;
    v568.size.width = v549;
    v568.size.height = rect;
    double MaxX = CGRectGetMaxX(v568);
    v104 = [(CKMessageEntryView *)self traitCollection];
    [v104 displayScale];
    double v106 = v105;

    v107 = [(CKMessageEntryView *)self conversation];
    int v108 = [v107 isStewieConversation];

    if (v108) {
      double v109 = 10.0;
    }
    else {
      double v109 = 0.0;
    }
    v93 = [(CKMessageEntryView *)self contentView];
    [v93 setSendButtonTextInsetWidth:v530 + v102 + v109];
    double v97 = round((MaxX - (v530 + v102)) * v106) / v106;
    goto LABEL_76;
  }
LABEL_77:
  double v110 = v546;
  double v513 = v547;
  double v518 = v548;
  CGFloat v505 = v545;
  if ([(CKMessageEntryView *)self shouldShowCharacterCount])
  {
    double v110 = v546;
    double v513 = v547;
    double v518 = v548;
    CGFloat v505 = v545;
    if ([(CKMessageEntryView *)self shouldShowSendButton])
    {
      [(CKMessageEntryView *)self characterCountSize];
      double v518 = v111;
      double v513 = v112;
      if ([(CKMessageEntryView *)self shouldCenterCharacterCount])
      {
        v569.origin.CGFloat x = v533;
        v569.origin.CGFloat y = v535;
        v569.size.width = v549;
        v569.size.height = rect;
        double v110 = CGRectGetMaxX(v569) + 3.5;
      }
      else
      {
        v570.size.width = v530;
        v570.origin.CGFloat x = v531;
        v570.origin.CGFloat y = v545;
        v570.size.height = v507;
        double v110 = CGRectGetMaxX(v570) - v518;
      }
      CGFloat v505 = v535;
    }
  }
  v113 = [(CKMessageEntryView *)self contentClipView];
  v114 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v115 = [v114 isAudioMessagesEntryViewRecordingEnabled];

  double v534 = v535;
  double v544 = rect;
  if (v115)
  {
    v116 = +[CKUIBehavior sharedBehaviors];
    [v116 audioHintViewPadding];
    double v118 = v117;

    v119 = +[CKUIBehavior sharedBehaviors];
    [v119 audioButtonSize];
    double v121 = v120;
    v122 = +[CKUIBehavior sharedBehaviors];
    [v122 bubbleLeftInsetForQuicktationInEntryView];
    double v124 = v123;
    v125 = +[CKUIBehavior sharedBehaviors];
    [v125 entryViewAudioButtonCoverSpace];
    double v127 = v126;

    v128 = [(CKMessageEntryView *)self audioHintLabel];
    double v129 = v23 - v121 - v124 - v127 + v118 * -2.0;
    objc_msgSend(v128, "sizeThatFits:", v129, 1.79769313e308);
    double v131 = v130;
    double v133 = v132;

    v134 = +[CKUIBehavior sharedBehaviors];
    [v134 bubbleLeftInsetForQuicktationInEntryView];
    double v136 = v135;

    v137 = [(CKMessageEntryView *)self audioHintLabel];
    double v138 = v133 + v118 * 2.0;
    objc_msgSend(v137, "setFrame:", (v129 - v131) * 0.5 + v118 + v136, 0.0, v131, v138);

    BOOL v139 = [(CKMessageEntryView *)self shouldShowAudioMessageHint];
    double v140 = v138 - rect;
    if (!v139) {
      double v140 = 0.0;
    }
    double v534 = v535 - v140;
    if (v139) {
      double v141 = v138;
    }
    else {
      double v141 = rect;
    }
    double v544 = v141;
  }
  [v113 anchorPoint];
  double v143 = v142;
  double v145 = v144;
  objc_msgSend(v113, "setBounds:", 0.0, 0.0, v549, v544);
  double v525 = v533 - v510;
  objc_msgSend(v113, "setCenter:", v533 - v510 + v549 * v143, v534 + v544 * v145);
  v146 = [(CKMessageEntryView *)self knockoutView];
  objc_msgSend(v146, "setFrame:", 0.0, 0.0, v549, v544);

  v147 = [v113 layer];
  v148 = +[CKUIBehavior sharedBehaviors];
  v149 = [v148 theme];
  id v150 = [v149 entryFieldBorderColor];
  objc_msgSend(v147, "setBorderColor:", objc_msgSend(v150, "CGColor"));

  v151 = +[CKUIBehavior sharedBehaviors];
  v152 = [v151 theme];
  id v153 = [v152 dashedEntryFieldBorderColor];
  uint64_t v154 = [v153 CGColor];
  v155 = [(CKMessageEntryView *)self dashedContentClipViewLayer];
  [v155 setStrokeColor:v154];

  v156 = [(CKMessageEntryView *)self contentView];
  v527 = [(CKMessageEntryView *)self collpasedPlaceholderLabel];
  v157 = [(CKMessageEntryView *)self contentView];
  v158 = [v157 textView];
  v159 = [v158 textContainer];
  [v159 lineFragmentPadding];
  double v486 = v160;

  [v156 frame];
  if (v161 == 0.0) {
    goto LABEL_95;
  }
  v162 = [(CKMessageEntryView *)self composition];
  if (([v162 hasContent] & 1) == 0)
  {

    goto LABEL_95;
  }
  BOOL v163 = [(CKMessageEntryView *)self entryFieldCollapsed];

  if (!v163) {
LABEL_95:
  }
    objc_msgSend(v156, "setFrame:", 0.0, 0.0, v23, rect);
  double v164 = v549;
  if (!self->_shouldCoverViewBeShrunkenForSendMenu) {
    double v164 = v23;
  }
  [v156 setMaxPluginShelfViewWidth:v164];
  [v156 setMaxPreviewContentWidthWhenExpanded:v23];
  if (v11)
  {
    if (CKIsRunningInMacCatalyst())
    {
      if ([(CKMessageEntryView *)self _shouldReverseLayoutDirection])
      {
        v165 = [(CKMessageEntryView *)self composition];
        char v166 = [v165 hasContent];

        if ((v166 & 1) == 0)
        {
          v167 = [(CKMessageEntryView *)self audioButton];
          [v167 frame];
          double v169 = v168;

          double v23 = v23 - v169;
        }
      }
    }
    [v156 setMaxContentWidthWhenExpanded:v23];
  }
  else
  {
    v571.origin.CGFloat y = v538;
    v571.origin.CGFloat x = v540;
    v571.size.width = v6;
    v571.size.height = v528;
    double v170 = CGRectGetWidth(v571);
    v171 = +[CKUIBehavior sharedBehaviors];
    [v171 browserButtonSize];
    [v156 setMaxContentWidthWhenExpanded:v170 - v514 - v511 + -16.5 - v172 + -14.5 - v494];
  }
  v173 = [v156 textView];
  [v173 setNeedsLayout];

  v174 = [(CKMessageEntryView *)self inputDelegate];
  uint64_t v175 = [v174 messageEntryShouldHideCaret:self];

  [(CKMessageEntryView *)self updateTextViewsForShouldHideCaret:v175];
  v176 = (void *)MEMORY[0x1E4F42FF0];
  v552[0] = MEMORY[0x1E4F143A8];
  v552[1] = 3221225472;
  v552[2] = __36__CKMessageEntryView_layoutSubviews__block_invoke;
  v552[3] = &unk_1E5620C40;
  id v541 = v156;
  id v553 = v541;
  [v176 performWithoutAnimation:v552];
  if ([(CKMessageEntryView *)self shouldShowSendButton])
  {
    v177 = [(CKMessageEntryView *)self traitCollection];
    [v177 displayScale];
    double v179 = v178;

    double v180 = round((v526 + v507 * -0.5) * v179) / v179;
    double v531 = v531 - v510;
    -[CKMessageEntryView convertRect:toView:](self, "convertRect:toView:", v113);
    objc_msgSend(v509, "setFrame:");
  }
  else
  {
    double v180 = v545;
  }
  if ([(CKMessageEntryView *)self shouldShowPluginButtons])
  {
    v181 = [v537 superview];
    v182 = [(CKMessageEntryView *)self inputButtonContainerView];
    BOOL v183 = v181 == v182;

    if (v183)
    {
      objc_msgSend(v537, "setCenter:", v495, v492);
      objc_msgSend(v537, "setBounds:", 0.0, 0.0, v485, v493);
    }
    objc_msgSend(v542, "setFrame:", v501, v512, v499, v503);
    objc_msgSend(v536, "setFrame:", v490, v491, v502, v508);
    objc_msgSend(v532, "setFrame:", v506, v496, v497, v498);
    objc_msgSend(v517, "setFrame:", v500, v487, v488, v489);
    double v184 = 0.0;
    if (v11) {
      double v185 = 1.0;
    }
    else {
      double v185 = 0.0;
    }
    [v532 setAlpha:v185];
    if (!v11) {
      double v184 = 1.0;
    }
    [v542 setAlpha:v184];
    v186 = +[CKUIBehavior sharedBehaviors];
    int v187 = [v186 isEntryViewCollapsable];

    double v188 = 1.0;
    if (v187) {
      double v188 = v184;
    }
    [v536 setAlpha:v188];
    v189 = [v536 button];
    [v189 setDisabledDimsImage:1];

    v190 = [v542 button];
    [v190 setDisabledDimsImage:1];
  }
  if ([(CKMessageEntryView *)self shouldShowCharacterCount])
  {
    v191 = [(CKMessageEntryView *)self characterCountLabel];
    v572.size.width = v530;
    v572.origin.CGFloat x = v531;
    v572.origin.CGFloat y = v180;
    v572.size.height = v507;
    double MinY = CGRectGetMinY(v572);
    v573.origin.CGFloat x = v110;
    v573.origin.CGFloat y = v505;
    v573.size.width = v518;
    v573.size.height = v513;
    double Height = CGRectGetHeight(v573);
    v194 = +[CKUIBehavior sharedBehaviors];
    [v194 entryViewSendButtonCoverSpace];
    double v196 = v195;

    objc_msgSend(v191, "setFrame:", v110, MinY - Height - v196, v518, v513);
    if ([(CKMessageEntryView *)self isCharacterCountHidden]
      || ([v541 isSingleLine] & 1) != 0)
    {
      BOOL v197 = 1;
LABEL_156:
      [v191 setHidden:v197];

      goto LABEL_157;
    }
    uint64_t v551 = 0;
    v198 = [(CKMessageEntryView *)self composition];
    v199 = [v198 text];
    v539 = [v199 string];

    v200 = [(CKMessageEntryView *)self conversation];
    LODWORD(v199) = [v200 isStewieConversation];

    if (v199)
    {
      uint64_t v551 = [v539 lengthOfBytesUsingEncoding:4];
      v201 = NSString;
      v202 = CKFrameworkBundle();
      v203 = [v202 localizedStringForKey:@"CHARACTER_COUNT_FMT" value:&stru_1EDE4CA38 table:@"ChatKit"];
      v204 = [NSNumber numberWithInteger:v551];
      v205 = CKLocalizedStringForNumber(v204);
      v206 = CKLocalizedStringForNumber(&unk_1EDF16790);
      v207 = objc_msgSend(v201, "stringWithFormat:", v203, v205, v206);

      v208 = [MEMORY[0x1E4F42738] sharedApplication];
      LODWORD(v206) = [v208 userInterfaceLayoutDirection] == 1;

      if (v206) {
        v209 = @"\u200F";
      }
      else {
        v209 = @"\u200E";
      }
      v210 = [(__CFString *)v209 stringByAppendingString:v207];

      id v211 = v210;
      BOOL v197 = v551 < 80;
      if (v551 >= 80)
      {
        if ((unint64_t)v551 > 0x9F) {
          [MEMORY[0x1E4F428B8] systemRedColor];
        }
        else {
        v263 = [MEMORY[0x1E4F428B8] systemOrangeColor];
        }
        [v191 setTextColor:v263];
      }
      v264 = [(CKMessageEntryView *)self characterCountLabel];
      [v264 setText:v211];

      goto LABEL_155;
    }
    uint64_t v550 = 0;
    v212 = [MEMORY[0x1E4F6E668] sharedInstance];
    v213 = [v212 ctSubscriptionInfo];
    v529 = [v213 preferredOrDefaultSubscriptionContext];

    v214 = [(CKMessageEntryView *)self conversation];
    v215 = [v214 sendingService];
    if (objc_msgSend(v215, "__ck_isiMessageLite"))
    {
      int v216 = 1;
    }
    else
    {
      v217 = [(CKMessageEntryView *)self conversation];
      v218 = [v217 chat];
      int v216 = [v218 shouldDisplayOffGridModeStatus];
    }
    v219 = [(CKMessageEntryView *)self conversation];
    v220 = [v219 sendingService];
    int v221 = objc_msgSend(v220, "__ck_isSatelliteSMS");

    if (v216)
    {
      v222 = [MEMORY[0x1E4F6BDB8] iMessageLiteService];
      uint64_t v551 = [v539 lengthOfBytesUsingEncoding:4];
      v223 = [v222 serviceProperties];
      v224 = [v223 valueForKey:*MEMORY[0x1E4F6E210]];
      uint64_t v550 = (int)[v224 intValue];

      v515 = NSString;
      v519 = CKFrameworkBundle();
      v225 = [v519 localizedStringForKey:@"CHARACTER_COUNT_FMT" value:&stru_1EDE4CA38 table:@"ChatKit"];
      v226 = [NSNumber numberWithInteger:v551];
      v227 = CKLocalizedStringForNumber(v226);
      v228 = [NSNumber numberWithInteger:v550];
      v229 = CKLocalizedStringForNumber(v228);
      v516 = objc_msgSend(v515, "stringWithFormat:", v225, v227, v229);

      v230 = [MEMORY[0x1E4F42738] sharedApplication];
      LODWORD(v228) = [v230 userInterfaceLayoutDirection] == 1;

      if (v228) {
        v231 = @"\u200F";
      }
      else {
        v231 = @"\u200E";
      }
      v232 = [(__CFString *)v231 stringByAppendingString:v516];

      id v233 = v232;
      v234 = [(CKMessageEntryView *)self characterCountLabel];
      [v234 setText:v233];
    }
    else if (v221)
    {
      uint64_t v551 = [v539 lengthOfBytesUsingEncoding:4];
      v235 = [(CKMessageEntryView *)self conversation];
      v236 = [v235 sendingService];
      v237 = [v236 serviceProperties];
      v238 = [v237 valueForKey:*MEMORY[0x1E4F6E210]];
      uint64_t v550 = (int)[v238 intValue];

      v520 = NSString;
      v239 = CKFrameworkBundle();
      v240 = [v239 localizedStringForKey:@"CHARACTER_COUNT_FMT" value:&stru_1EDE4CA38 table:@"ChatKit"];
      v241 = [NSNumber numberWithInteger:v551];
      v242 = CKLocalizedStringForNumber(v241);
      v243 = [NSNumber numberWithInteger:v550];
      v244 = CKLocalizedStringForNumber(v243);
      v521 = objc_msgSend(v520, "stringWithFormat:", v240, v242, v244);

      v245 = [MEMORY[0x1E4F42738] sharedApplication];
      LODWORD(v244) = [v245 userInterfaceLayoutDirection] == 1;

      if (v244) {
        v246 = @"\u200F";
      }
      else {
        v246 = @"\u200E";
      }
      v247 = [(__CFString *)v246 stringByAppendingString:v521];

      id v248 = v247;
      v249 = [(CKMessageEntryView *)self characterCountLabel];
      [v249 setText:v248];
    }
    else
    {
      if (!v529
        || ([CTMessageCenterClass() sharedMessageCenter],
            v250 = objc_claimAutoreleasedReturnValue(),
            int v251 = [v250 getCharacterCountForSub:v529 count:&v551 andMessageSplitThreshold:&v550 forSmsText:v539], v250, !v251))
      {
        if (IMOSLoggingEnabled())
        {
          v482 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v482, OS_LOG_TYPE_INFO))
          {
            v483 = [NSNumber numberWithInteger:v550];
            v484 = [NSNumber numberWithInteger:v551];
            *(_DWORD *)buf = 138412802;
            v557 = v483;
            __int16 v558 = 2112;
            v559 = v484;
            __int16 v560 = 2112;
            v561 = v529;
            _os_log_impl(&dword_18EF18000, v482, OS_LOG_TYPE_INFO, "Not showing character count: %@/%@ - subscription: %@", buf, 0x20u);
          }
        }
        BOOL v197 = 1;
        goto LABEL_151;
      }
      v522 = NSString;
      v252 = CKFrameworkBundle();
      v253 = [v252 localizedStringForKey:@"CHARACTER_COUNT_FMT" value:&stru_1EDE4CA38 table:@"ChatKit"];
      v254 = [NSNumber numberWithInteger:v551];
      v255 = CKLocalizedStringForNumber(v254);
      v256 = [NSNumber numberWithInteger:v550];
      v257 = CKLocalizedStringForNumber(v256);
      v523 = objc_msgSend(v522, "stringWithFormat:", v253, v255, v257);

      v258 = [MEMORY[0x1E4F42738] sharedApplication];
      LODWORD(v257) = [v258 userInterfaceLayoutDirection] == 1;

      if (v257) {
        v259 = @"\u200F";
      }
      else {
        v259 = @"\u200E";
      }
      v260 = [(__CFString *)v259 stringByAppendingString:v523];

      id v261 = v260;
      v262 = [(CKMessageEntryView *)self characterCountLabel];
      [v262 setText:v261];
    }
    BOOL v197 = 0;
LABEL_151:

LABEL_155:
    goto LABEL_156;
  }
LABEL_157:
  if ([(CKMessageEntryView *)self shouldShowSendButton]
    && !CKIsRunningInMacCatalyst())
  {
    v294 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v295 = [v294 isAudioMessagesEntryViewRecordingEnabled];

    if (v295)
    {
      v578.origin.CGFloat x = v533 - v510;
      v578.origin.CGFloat y = v534;
      v578.size.width = v549;
      v578.size.height = v544;
      double v296 = CGRectGetMaxX(v578);
      v297 = +[CKUIBehavior sharedBehaviors];
      [v297 audioButtonSize];
      double v299 = v298;
      v300 = +[CKUIBehavior sharedBehaviors];
      [v300 entryViewAudioButtonCoverSpace];
      double v302 = v301;
      v303 = +[CKUIBehavior sharedBehaviors];
      [v303 audioButtonSize];
      double v305 = v304;
      v306 = +[CKUIBehavior sharedBehaviors];
      [v306 audioButtonSize];
      double v530 = v307;
      v308 = +[CKUIBehavior sharedBehaviors];
      [v308 audioButtonSize];
      double v547 = v309;

      double v531 = v296 - v299 - v302;
      double v310 = v526 + v305 * -0.5;
    }
    else
    {
      v311 = +[CKUIBehavior sharedBehaviors];
      [v311 audioButtonSize];
      double v547 = v312;

      v297 = [(CKMessageEntryView *)self traitCollection];
      [v297 displayScale];
      double v310 = 1.0 / v313 * (v180 * v313 + floor((v507 * v313 - v547 * v313) * 0.5));
    }
    double v545 = v310;

    -[CKMessageEntryView convertRect:toView:](self, "convertRect:toView:", v113, v531, v545, v530, v547);
    double v315 = v314;
    double v317 = v316;
    double v319 = v318;
    double v321 = v320;
    v322 = [(CKMessageEntryView *)self audioButton];
    objc_msgSend(v322, "setFrame:", v315, v317, v319, v321);

    v282 = [(CKMessageEntryView *)self buttonAndTextAreaContainerView];
    -[CKMessageEntryView convertRect:toView:](self, "convertRect:toView:", v282, v531, v545, v530, v547);
    double v290 = v323;
    double v291 = v324;
    double v293 = v325;
    double v292 = v326;
  }
  else
  {
    if (!CKIsRunningInMacCatalyst()) {
      goto LABEL_166;
    }
    v574.origin.CGFloat x = v533;
    v574.origin.CGFloat y = v535;
    v574.size.width = v549;
    v574.size.height = rect;
    double v265 = CGRectGetMaxX(v574);
    v266 = +[CKUIBehavior sharedBehaviors];
    [v266 entryViewAudioButtonCoverSpace];
    double v268 = v267;
    v575.origin.CGFloat x = v533;
    v575.origin.CGFloat y = v535;
    v575.size.width = v549;
    v575.size.height = rect;
    double MidY = CGRectGetMidY(v575);

    v270 = [(CKMessageEntryView *)self traitCollection];
    [v270 displayScale];
    double v272 = v271;

    double v530 = round(v272 * 29.0) / v272;
    double v531 = round((v265 + -29.0 - v268) * v272) / v272;
    double v545 = round((MidY + -10.0) * v272) / v272;
    double v547 = round(v272 * 20.0) / v272;
    -[CKMessageEntryView convertRect:toView:](self, "convertRect:toView:", v113);
    double v274 = v273;
    double v276 = v275;
    double v278 = v277;
    double v280 = v279;
    v281 = [(CKMessageEntryView *)self audioButton];
    objc_msgSend(v281, "setFrame:", v274, v276, v278, v280);

    v282 = [(CKMessageEntryView *)self contentView];
    [v282 frame];
    double v283 = CGRectGetMaxX(v576);
    v284 = +[CKUIBehavior sharedBehaviors];
    [v284 entryViewSendButtonCoverSpace];
    double v286 = v285;
    v287 = [(CKMessageEntryView *)self contentView];
    v288 = [v287 textView];
    [v288 frame];
    double v289 = CGRectGetMidY(v577);

    double v290 = v283 + -29.0 - v286;
    double v291 = v289 + -10.0;
    double v292 = 20.0;
    double v293 = 29.0;
  }

  v327 = [(CKMessageEntryView *)self sendButtonSpinner];
  objc_msgSend(v327, "setFrame:", v290, v291, v293, v292);

  CGFloat v546 = v531;
  double v548 = v530;
LABEL_166:
  if ([(CKMessageEntryView *)self shouldShowDictationButton])
  {
    v328 = +[CKUIBehavior sharedBehaviors];
    [v328 dictationButtonSize];
    double v330 = v329;
    double v332 = v331;

    v579.origin.CGFloat x = v533 - v510;
    v579.origin.CGFloat y = v534;
    v579.size.width = v549;
    v579.size.height = v544;
    double v333 = CGRectGetMaxX(v579);
    v334 = +[CKUIBehavior sharedBehaviors];
    [v334 entryViewDictationButtonCoverSpace];
    double v336 = v335;

    double v337 = v333 - v330 - v336;
    -[CKMessageEntryView convertRect:toView:](self, "convertRect:toView:", v113, v337, v526 + v332 * -0.5, v330, v332);
    double v339 = v338;
    double v341 = v340;
    double v343 = v342;
    double v345 = v344;
    v346 = [(CKMessageEntryView *)self dictationButton];
    objc_msgSend(v346, "setFrame:", v339, v341, v343, v345);

    v347 = [(CKMessageEntryView *)self buttonAndTextAreaContainerView];
    -[CKMessageEntryView convertRect:toView:](self, "convertRect:toView:", v347, v337, v526 + v332 * -0.5, v330, v332);
    double v349 = v348;
    double v351 = v350;
    double v353 = v352;
    double v355 = v354;

    v356 = [(CKMessageEntryView *)self sendButtonSpinner];
    objc_msgSend(v356, "setFrame:", v349, v351, v353, v355);
  }
  [v113 frame];
  double v357 = CGRectGetMaxX(v580);
  v581.origin.CGFloat y = v545;
  v581.origin.CGFloat x = v546;
  v581.size.height = v547;
  v581.size.width = v548;
  double v358 = CGRectGetMaxX(v581);
  [v113 frame];
  double v360 = v359;
  v361 = +[CKUIBehavior sharedBehaviors];
  [v361 bubbleLeftInsetForQuicktationInEntryView];
  double v363 = v362;

  double v364 = v360 + -8.0 - v363 - v548 + (v357 - v358) * -2.0 + -3.0;
  [v541 setPlaceHolderWidth:v364];
  v365 = [(CKMessageEntryView *)self composition];
  if ([v365 hasContent])
  {
    BOOL v366 = [(CKMessageEntryView *)self entryFieldCollapsed];

    if (!v366)
    {
      double v370 = 1.0;
      double v369 = 0.0;
      goto LABEL_174;
    }
    [v504 defaultEntryContentViewHeight];
    objc_msgSend(v527, "setFrame:", v486 + 8.0, 0.0, v364, v367);
    v365 = [(CKMessageEntryView *)self composition];
    v368 = [v365 previewText];
    [v527 setText:v368];

    double v369 = 1.0;
    double v370 = 0.00999999978;
  }
  else
  {
    double v370 = 1.0;
    double v369 = 0.0;
  }

LABEL_174:
  [v527 setAlpha:v369];
  [v541 setAlpha:v370];
  if ([(CKMessageEntryView *)self shouldShowSendButton]
    || CKIsRunningInMacCatalyst())
  {
    CKIsRunningInMacCatalyst();
    [(CKMessageEntryView *)self waveformViewSize];
    if (CKMainScreenScale_once_59 != -1) {
      dispatch_once(&CKMainScreenScale_once_59, &__block_literal_global_1607);
    }
    if (!CKIsRunningInMacCatalyst())
    {
      v371 = [(CKMessageEntryView *)self audioButton];
      [v371 frame];
      CGRectGetMinX(v582);
    }
    v372 = [(CKMessageEntryView *)self waveformView];
    objc_msgSend(v372, "setFrame:", v525, v534, v549, v544);

    [(CKMessageEntryView *)self waveformViewSize];
    if (CKMainScreenScale_once_59 != -1) {
      dispatch_once(&CKMainScreenScale_once_59, &__block_literal_global_1607);
    }
    v373 = [(CKMessageEntryView *)self recordedAudioView];
    objc_msgSend(v373, "setFrame:", v525, v534, v549, v544);
  }
  [(CKMessageEntryView *)self bounds];
  double v375 = v374;
  v376 = +[CKUIBehavior sharedBehaviors];
  [v376 audioRecordingViewButtonSpacing];
  double v378 = v377;
  [(CKMessageEntryView *)self safeAreaInsets];
  double v380 = v379;

  v381 = +[CKUIBehavior sharedBehaviors];
  [v381 audioRecordingViewButtonSpacing];
  double v383 = v382;
  [(CKMessageEntryView *)self safeAreaInsets];
  double v385 = v384;
  [(CKMessageEntryView *)self safeAreaInsets];
  double v387 = v386;

  v388 = [(CKMessageEntryView *)self audioRecordingView];
  objc_msgSend(v388, "sizeThatFits:", v375 + v383 * -2.0 - v385 - v387, 1.79769313e308);
  double v390 = v389;
  double v392 = v391;

  if ([(CKMessageEntryView *)self shouldUseLinearResizeForAudioMessage]) {
    double v392 = rect + (v392 - rect) * 0.3;
  }
  [(CKMessageEntryView *)self bounds];
  double v394 = v393;
  [(CKMessageEntryView *)self bottomInsetForAppStrip];
  double v396 = v395;
  [(CKMessageEntryView *)self safeAreaInsets];
  double v398 = (v394 - v396 - v397 - v392) * 0.5;
  if ([(CKMessageEntryView *)self shouldUseLinearResizeForAudioMessage])
  {
    v399 = [(CKMessageEntryView *)self audioRecordingView];
    objc_msgSend(v399, "setFrame:", v533, v398, v549, v392);

    v400 = [(CKMessageEntryView *)self contentClipView];
    objc_msgSend(v400, "setFrame:", v533, v398, v549, v392);

    v401 = [(CKMessageEntryView *)self contentClipView];
    v402 = [(CKMessageEntryView *)self contentClipView];
    [v402 frame];
    [v401 _setContinuousCornerRadius:v403 * 0.5];

    v404 = [(CKMessageEntryView *)self contentClipView];
    [v404 setAlpha:0.0];
  }
  else
  {
    v405 = [(CKMessageEntryView *)self audioRecordingView];
    objc_msgSend(v405, "setFrame:", v378 + v380, v398, v390, v392);

    v406 = +[CKUIBehavior sharedBehaviors];
    [v406 entryViewCoverMinHeight];
    double v408 = v407;

    [v113 _setContinuousCornerRadius:v408 * 0.5];
  }
  v409 = [(CKMessageEntryView *)self audioRecordingView];
  [v409 setCornerRadius:v392 * 0.5];

  v410 = [(CKMessageEntryView *)self audioRecordingView];

  if (v410) {
    [(CKMessageEntryView *)self audioRecordingView];
  }
  else {
  v411 = [(CKMessageEntryView *)self contentClipView];
  }
  [v411 setAlpha:1.0];

  v412 = [(CKMessageEntryView *)self inputDelegate];

  if (v412)
  {
    v413 = [(CKMessageEntryView *)self inputDelegate];
    uint64_t v414 = [v413 messageEntryViewHighLightInputButton:self];

    v415 = +[CKUIBehavior sharedBehaviors];
    unsigned int v416 = [v415 entryViewButtonDefaultColor];

    uint64_t v417 = v414 == 1 ? 1 : v416;
    [v542 setCkTintColor:v417];
    [v542 setWantsVibrancy:v414 != 1];
    uint64_t v418 = v414 == 2 ? 1 : v416;
    [v536 setCkTintColor:v418];
    [v536 setWantsVibrancy:v414 != 2];
    v419 = +[CKUIBehavior sharedBehaviors];
    int v420 = [v419 isAccessibilityPreferredContentSizeCategory];

    if (v420)
    {
      switch(v414)
      {
        case 1:
          uint64_t v421 = 0;
          goto LABEL_204;
        case 2:
          [v532 setTintedImageForButtonType:2 tintColor:1];
          [v532 frame];
          CGFloat x = v583.origin.x;
          CGFloat y = v583.origin.y;
          CGFloat v424 = v583.size.width;
          CGFloat v425 = v583.size.height;
          double v426 = CGRectGetMidX(v583);
          v584.origin.CGFloat x = x;
          v584.origin.CGFloat y = y;
          v584.size.width = v424;
          v584.size.height = v425;
          double v427 = CGRectGetMidY(v584);
          [v532 sizeToFit];
          objc_msgSend(v532, "setCenter:", v426, v427);
          break;
        case 3:
          uint64_t v421 = 3;
LABEL_204:
          [v532 setTintedImageForButtonType:v421 tintColor:1];
          break;
        default:
          [v532 setDefaultImage];
          break;
      }
    }
  }
  [(CKMessageEntryView *)self configureAppStripOrMentionSuggestionsIfNeeded];
  v428 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v429 = [v428 isDashedBalloonsEnabled];

  if (v429)
  {
    v430 = [(CKMessageEntryView *)self sendLaterPluginInfo];

    BOOL v431 = v430 == 0;
    v432 = +[CKUIBehavior sharedBehaviors];
    [v432 entryFieldCoverLineWidth];
    double v434 = v433;
    if (v431)
    {
      v480 = [(CKMessageEntryView *)self contentClipView];
      v481 = [v480 layer];
      [v481 setBorderWidth:v434];

      v474 = [(CKMessageEntryView *)self dashedContentClipViewLayer];
      [v474 setLineWidth:0.0];
    }
    else
    {
      v435 = [(CKMessageEntryView *)self dashedContentClipViewLayer];
      [v435 setLineWidth:v434];

      v436 = [(CKMessageEntryView *)self contentClipView];
      v437 = [v436 layer];
      [v437 bounds];
      CGFloat v439 = v438;
      CGFloat v441 = v440;
      CGFloat v443 = v442;
      CGFloat v445 = v444;
      v446 = [(CKMessageEntryView *)self dashedContentClipViewLayer];
      [v446 lineWidth];
      CGFloat v448 = v447;
      v449 = [(CKMessageEntryView *)self dashedContentClipViewLayer];
      [v449 lineWidth];
      CGFloat v451 = v450;
      v585.origin.CGFloat x = v439;
      v585.origin.CGFloat y = v441;
      v585.size.width = v443;
      v585.size.height = v445;
      CGRect v586 = CGRectInset(v585, v448, v451);
      double v452 = v586.origin.x;
      double v453 = v586.origin.y;
      double v454 = v586.size.width;
      double v455 = v586.size.height;

      v456 = (void *)MEMORY[0x1E4F427D0];
      v457 = [(CKMessageEntryView *)self contentClipView];
      v458 = [v457 layer];
      [v458 cornerRadius];
      objc_msgSend(v456, "bezierPathWithRoundedRect:cornerRadius:", v452, v453, v454, v455, v459);
      id v460 = objc_claimAutoreleasedReturnValue();
      uint64_t v461 = [v460 CGPath];
      v462 = [(CKMessageEntryView *)self dashedContentClipViewLayer];
      [v462 setPath:v461];

      v463 = [(CKMessageEntryView *)self contentClipView];
      v464 = [v463 layer];
      [v464 setBorderWidth:0.0];

      v465 = [(CKMessageEntryView *)self dashedContentClipViewLayer];
      v466 = [v465 lineDashPattern];
      v467 = [v466 objectAtIndexedSubscript:0];
      [v467 doubleValue];
      double v469 = v468;
      v470 = [(CKMessageEntryView *)self contentClipView];
      v471 = [v470 layer];
      [v471 cornerRadius];
      double v473 = CKDashSpacingForCGRect(v452, v453, v454, v455, v469, v472);

      v474 = [(CKMessageEntryView *)self dashedContentClipViewLayer];
      v475 = [v474 lineDashPattern];
      v476 = [v475 objectAtIndexedSubscript:0];
      v555[0] = v476;
      v477 = [NSNumber numberWithDouble:v473];
      v555[1] = v477;
      v478 = [MEMORY[0x1E4F1C978] arrayWithObjects:v555 count:2];
      v479 = [(CKMessageEntryView *)self dashedContentClipViewLayer];
      [v479 setLineDashPattern:v478];
    }
  }
  +[CKPPTSubTest stop:@"CKMessageEntryView Layoutsubviews"];
}

uint64_t __36__CKMessageEntryView_layoutSubviews__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (double)calculateOneLinePlaceHolderCenterY:(double)a3
{
  [(CKMessageEntryView *)self bottomInsetForAppStrip];
  double v6 = v5;
  double v7 = +[CKUIBehavior sharedBehaviors];
  [v7 entryViewVerticalCoverInsets];
  double v9 = v8;

  double v10 = [(CKMessageEntryView *)self contentView];
  int v11 = [v10 textView];
  [v11 textContainerInset];
  double v13 = v12;

  double v14 = +[CKUIBehavior sharedBehaviors];
  [v14 entryViewTextOneLineHeight];
  double v16 = v15 * -0.5;

  double v17 = a3 - v6 - v9 - v13 + v16;
  if (CKIsRunningInMacCatalyst())
  {
    if (CKMainScreenScale_once_59 != -1) {
      dispatch_once(&CKMainScreenScale_once_59, &__block_literal_global_1607);
    }
    double v18 = *(double *)&CKMainScreenScale_sMainScreenScale_59;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_59 == 0.0) {
      double v18 = 1.0;
    }
    double v19 = floor(v17 * v18);
  }
  else
  {
    if (CKMainScreenScale_once_59 != -1) {
      dispatch_once(&CKMainScreenScale_once_59, &__block_literal_global_1607);
    }
    double v18 = *(double *)&CKMainScreenScale_sMainScreenScale_59;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_59 == 0.0) {
      double v18 = 1.0;
    }
    double v19 = round(v17 * v18);
  }
  return v19 / v18;
}

- (BOOL)_isPresentingInPopover
{
  double v3 = [(CKMessageEntryView *)self delegate];
  double v4 = [v3 messageEntryViewActiveSendMenuPresentation:self];

  if (v4) {
    BOOL v5 = [v4 presentationStyle] == 1;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_updateSendMenuPresentationState:(int64_t)a3
{
  int64_t sendMenuPresentationState = self->_sendMenuPresentationState;
  if (sendMenuPresentationState != a3)
  {
    self->_int64_t sendMenuPresentationState = a3;
    double v6 = +[CKUIBehavior sharedBehaviors];
    BOOL v7 = [(CKMessageEntryView *)self _isPresentingInPopover];
    double v8 = [v6 entryViewSendMenuPresentationStateAnimator];
    double v9 = [v6 entryViewSendMenuPresentationStateAnimator];
    double v49 = [v6 entryViewSendMenuPresentationStateAnimator];
    double v48 = [v6 entryViewSendMenuContentViewWidthAnimator];
    double v47 = [v6 entryViewSendMenuContentViewWidthAnimator];
    double v13 = 0.0;
    double v14 = 1.0;
    switch(a3)
    {
      case 0:
        double v15 = [v6 entryViewPlusButtonDefaultBackgroundColor];
        if (sendMenuPresentationState == 3)
        {
          uint64_t v16 = [v6 entryViewSendMenuPlusButtonDismissBlurAnimator];

          uint64_t v17 = [v6 entryViewSendMenuPlusButtonDismissBlurAnimator];

          uint64_t v44 = [v6 entryViewSendMenuPlusButtonDismissScaleAnimator];

          uint64_t v18 = [v6 entryViewSendMenuContentViewWidthDismissAnimator];

          uint64_t v19 = [v6 entryViewSendMenuContentViewWidthDismissAnimator];

          double v20 = 0;
          BOOL v7 = 0;
          double v21 = 1.0;
          double v22 = 1.0;
          double v8 = (void *)v16;
          double v46 = (void *)v17;
          double v47 = (void *)v19;
          double v48 = (void *)v18;
          double v49 = (void *)v44;
          goto LABEL_30;
        }
        double v46 = v9;
        double v20 = 0;
        BOOL v7 = 0;
        goto LABEL_29;
      case 1:
        double v46 = v9;
        double v15 = [v6 entryViewPlusButtonDefaultBackgroundColor];
        double v20 = 0;
        BOOL v7 = 0;
        double v24 = 0.8;
        double v22 = 0.94;
        double v21 = 1.02;
        goto LABEL_31;
      case 2:
        double v46 = v9;
        double v15 = [v6 entryViewPlusButtonDefaultBackgroundColor];
        double v20 = 0;
        double v10 = 0.8;
        double v11 = 1.02;
        double v12 = 0.96;
        double v23 = 1.0;
        if (v7) {
          double v14 = 0.0;
        }
        else {
          double v14 = 1.0;
        }
        if (v7) {
          double v24 = 1.0;
        }
        else {
          double v24 = 0.8;
        }
        if (v7) {
          double v21 = 1.0;
        }
        else {
          double v21 = 1.02;
        }
        if (v7) {
          double v22 = 1.0;
        }
        else {
          double v22 = 0.96;
        }
        goto LABEL_32;
      case 3:
        double v14 = 0.0;
        if (v7) {
          double v13 = 0.0;
        }
        else {
          double v13 = 6.0;
        }
        double v21 = 1.0;
        if (v7) {
          double v23 = 1.0;
        }
        else {
          double v23 = 0.25;
        }
        double v15 = [v6 entryViewPlusButtonSendMenuOpenBackgroundColor];
        uint64_t v25 = [v6 entryViewSendMenuPlusButtonSymbolDisappearanceOpacityAnimator];

        uint64_t v26 = [v6 entryViewSendMenuPlusButtonAppearanceAnimator];

        uint64_t v27 = [v6 entryViewSendMenuPlusButtonAppearanceAnimator];

        double v24 = 1.0;
        if (!v7)
        {
          [(CKMessageEntryView *)self bounds];
          double v29 = v28 * 1.1;
          double v30 = [(CKMessageEntryView *)self plusButton];
          [v30 bounds];
          double v24 = v29 / v31;
        }
        double v20 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2E8]];
        BOOL v7 = 1;
        double v22 = 1.0;
        double v8 = (void *)v26;
        double v46 = (void *)v25;
        double v49 = (void *)v27;
        goto LABEL_32;
      default:
        double v46 = v9;
        double v20 = 0;
        BOOL v7 = 0;
        double v15 = 0;
LABEL_29:
        double v21 = 1.0;
        double v22 = 1.0;
LABEL_30:
        double v24 = 1.0;
LABEL_31:
        double v23 = 1.0;
LABEL_32:
        int v32 = [(CKMessageEntryView *)self plusButton];
        double v33 = [(CKMessageEntryView *)self contentClipView];
        v62[0] = MEMORY[0x1E4F143A8];
        v62[1] = 3221225472;
        v62[2] = __55__CKMessageEntryView__updateSendMenuPresentationState___block_invoke;
        v62[3] = &unk_1E5629340;
        id v34 = v32;
        id v63 = v34;
        double v67 = v13;
        double v68 = v13;
        double v69 = v23;
        id v35 = v15;
        id v64 = v35;
        id v65 = 0;
        id v36 = v20;
        id v66 = v36;
        [v8 addAnimations:v62];
        [v8 startAnimation];
        v59[0] = MEMORY[0x1E4F143A8];
        v59[1] = 3221225472;
        double v37 = v8;
        v59[2] = __55__CKMessageEntryView__updateSendMenuPresentationState___block_invoke_2;
        v59[3] = &unk_1E5622950;
        id v38 = v34;
        id v60 = v38;
        double v61 = v14;
        v39 = v46;
        [v46 addAnimations:v59];
        [v46 startAnimation];
        v56[0] = MEMORY[0x1E4F143A8];
        v56[1] = 3221225472;
        v56[2] = __55__CKMessageEntryView__updateSendMenuPresentationState___block_invoke_3;
        v56[3] = &unk_1E5622950;
        id v40 = v38;
        id v57 = v40;
        double v58 = v24;
        [v49 addAnimations:v56];
        [v49 startAnimation];
        v52[0] = MEMORY[0x1E4F143A8];
        v52[1] = 3221225472;
        v52[2] = __55__CKMessageEntryView__updateSendMenuPresentationState___block_invoke_4;
        v52[3] = &unk_1E5625B88;
        id v41 = v33;
        id v53 = v41;
        double v54 = v21;
        double v55 = v22;
        [v48 addAnimations:v52];
        [v48 startAnimation];
        if (self->_shouldCoverViewBeShrunkenForSendMenu != v7)
        {
          id v45 = v36;
          if (v7)
          {
            double v42 = [(CKMessageEntryView *)self buttonAndTextAreaContainerView];
            BOOL v43 = [(CKMessageEntryView *)self inputButtonContainerView];
            [v42 bringSubviewToFront:v43];
          }
          [(CKMessageEntryView *)self layoutIfNeeded];
          v50[0] = MEMORY[0x1E4F143A8];
          v50[1] = 3221225472;
          v50[2] = __55__CKMessageEntryView__updateSendMenuPresentationState___block_invoke_5;
          v50[3] = &unk_1E5622A18;
          v50[4] = self;
          BOOL v51 = v7;
          [v47 addAnimations:v50];
          [v47 startAnimation];
          id v36 = v45;
          v39 = v46;
        }

        break;
    }
  }
}

uint64_t __55__CKMessageEntryView__updateSendMenuPresentationState___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setBackgroundBlurRadiusLightMode:*(double *)(a1 + 64)];
  [*(id *)(a1 + 32) setBackgroundBlurRadiusDarkMode:*(double *)(a1 + 72)];
  [*(id *)(a1 + 32) setBackgroundBlurRasterizationPercentage:*(double *)(a1 + 80)];
  [*(id *)(a1 + 32) setPlusButtonBackgroundColor:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setBackgroundCompositingFilterForLightMode:*(void *)(a1 + 48)];
  uint64_t v2 = *(void *)(a1 + 56);
  double v3 = *(void **)(a1 + 32);

  return [v3 setBackgroundCompositingFilterForDarkMode:v2];
}

uint64_t __55__CKMessageEntryView__updateSendMenuPresentationState___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPlusSymbolOpacity:*(double *)(a1 + 40)];
}

void __55__CKMessageEntryView__updateSendMenuPresentationState___block_invoke_3(uint64_t a1)
{
  CATransform3DMakeScale(&v4, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40), 1.0);
  uint64_t v2 = [*(id *)(a1 + 32) layer];
  CATransform3D v3 = v4;
  [v2 setTransform:&v3];
}

void __55__CKMessageEntryView__updateSendMenuPresentationState___block_invoke_4(uint64_t a1)
{
  CATransform3DMakeScale(&v4, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 48), 1.0);
  uint64_t v2 = [*(id *)(a1 + 32) layer];
  CATransform3D v3 = v4;
  [v2 setTransform:&v3];
}

uint64_t __55__CKMessageEntryView__updateSendMenuPresentationState___block_invoke_5(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 433) = *(unsigned char *)(a1 + 40);
  [*(id *)(a1 + 32) setNeedsLayout];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 layoutIfNeeded];
}

- (void)configureAppStripOrMentionSuggestionsIfNeeded
{
  [(CKMessageEntryView *)self bounds];
  double v4 = v3;
  [(CKMessageEntryView *)self bounds];
  double v6 = v5;
  if ([(CKMessageEntryView *)self shouldShowAppStrip])
  {
    BOOL v7 = [(CKMessageEntryView *)self appStripBackgroundBlurContainerView];
    double v8 = [v7 superview];

    if (!v8)
    {
      double v9 = [(CKMessageEntryView *)self appStripBackgroundBlurContainerView];
      [(CKMessageEntryView *)self addSubview:v9];

      double v10 = [(CKMessageEntryView *)self appStripBackgroundBlurContainerView];
      double v11 = [(CKMessageEntryView *)self _inheritedRenderConfig];
      [v10 _setRenderConfig:v11];
    }
    double v12 = [(CKMessageEntryView *)self appStrip];
    double v13 = [v12 superview];

    if (!v13) {
      [(CKMessageEntryView *)self addSubview:v12];
    }
    [(CKMessageEntryView *)self bottomInsetForAppStrip];
    double v15 = v14;
    [(CKMessageEntryView *)self safeAreaInsets];
    double v6 = v6 - (v15 + v16);
    [(CKMessageEntryView *)self updateAppStripFrame];
  }
  else
  {
    uint64_t v17 = [(CKMessageEntryView *)self appStrip];
    double v12 = v17;
    if (v17)
    {
      if ([v17 isMagnified])
      {
        appStrip = self->_appStrip;
        self->_appStrip = 0;
      }
      [v12 removeFromSuperview];
    }
    uint64_t v19 = [(CKMessageEntryView *)self appStripBackgroundBlurContainerView];

    if (v19)
    {
      double v20 = [(CKMessageEntryView *)self appStripBackgroundBlurContainerView];
      [v20 removeFromSuperview];
    }
  }

  id v21 = [(CKMessageEntryView *)self backgroundView];
  objc_msgSend(v21, "setFrame:", 0.0, 0.0, v4, v6);
}

- (id)inputAccessoryViewBackdropColor
{
  return (id)[(CKMessageEntryBackgroundViewProtocol *)self->_backgroundView inputAccessoryViewBackdropColor];
}

- (id)inputAccessoryViewBackdropEffects
{
  return (id)[(CKMessageEntryBackgroundViewProtocol *)self->_backgroundView inputAccessoryViewBackdropEffects];
}

- (CKBrowserSwitcherFooterView)appStrip
{
  double v3 = +[CKUIBehavior sharedBehaviors];
  int v4 = [v3 isAppStripInKeyboard];

  if (v4) {
    [(CKMessageEntryView *)self configureAppStripBackgroundViewsIfNecessary];
  }
  appStrip = self->_appStrip;
  if (!appStrip)
  {
    BOOL v6 = [(CKMessageEntryView *)self shouldShowAppStrip];
    appStrip = self->_appStrip;
    if (v6)
    {
      if (!appStrip)
      {
        BOOL v7 = objc_alloc_init(CKBrowserSwitcherFooterView);
        double v8 = self->_appStrip;
        self->_appStrip = v7;

        [(CKBrowserSwitcherFooterView *)self->_appStrip setScrollsLastUsedAppIconIntoView:0];
        [(CKBrowserSwitcherFooterView *)self->_appStrip setAutoresizingMask:2];
        [(CKBrowserSwitcherFooterView *)self->_appStrip setClipsToBounds:1];
        double v9 = +[CKMessageEntryView sharedAppStripDatasource];
        [(CKBrowserSwitcherFooterView *)self->_appStrip setDataSource:v9];

        double v10 = +[CKUIBehavior sharedBehaviors];
        char v11 = [v10 isAppStripInKeyboard];

        appStrip = self->_appStrip;
        if ((v11 & 1) == 0)
        {
          double v12 = +[CKUIBehavior sharedBehaviors];
          double v13 = [v12 theme];
          double v14 = [v13 entryFieldCoverFillColor];
          [(CKBrowserSwitcherFooterView *)appStrip setBackgroundColor:v14];

          appStrip = self->_appStrip;
        }
      }
      [(CKBrowserSwitcherFooterView *)appStrip setDelegate:self];
      [(CKMessageEntryView *)self addSubview:self->_appStrip];
      [(CKBrowserSwitcherFooterView *)self->_appStrip resetScrollPosition];
      [(CKMessageEntryView *)self setNeedsLayout];
      appStrip = self->_appStrip;
    }
  }

  return appStrip;
}

- (void)configureAppStripBackgroundViewsIfNecessary
{
  if (!self->_appStripBackgroundBlurContainerView)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F42FF0]);
    id v6 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    id v4 = objc_alloc(MEMORY[0x1E4F42AF0]);
    [v6 bounds];
    double v5 = objc_msgSend(v4, "initWithFrame:style:", 2);
    [v5 setAutoresizingMask:18];
    [v6 addSubview:v5];
    [(CKMessageEntryView *)self addSubview:v6];
    [(CKMessageEntryView *)self setAppStripBackgroundBlurContainerView:v6];
    [(CKMessageEntryView *)self setAppStripBackgroundBlurView:v5];
    [(CKMessageEntryView *)self _overrideUserInterfaceStyleForEntryViewStyleIfNeeded:[(CKMessageEntryView *)self style]];
  }
}

+ (id)sharedAppStripDatasource
{
  if (sharedAppStripDatasource_onceToken != -1) {
    dispatch_once(&sharedAppStripDatasource_onceToken, &__block_literal_global_155);
  }
  uint64_t v2 = (void *)sharedAppStripDatasource_sDatasource;

  return v2;
}

void __46__CKMessageEntryView_sharedAppStripDatasource__block_invoke()
{
  v0 = objc_alloc_init(CKBrowserSwitcherFooterViewDataSource);
  v1 = (void *)sharedAppStripDatasource_sDatasource;
  sharedAppStripDatasource_sDatasource = (uint64_t)v0;
}

- (void)updateAppStripFrame
{
  double v28 = self->_appStrip;
  [(CKBrowserSwitcherFooterView *)v28 contentHeight];
  double v4 = v3;
  [(CKMessageEntryView *)self safeAreaInsets];
  double v6 = v4 + v5;
  BOOL v7 = +[CKUIBehavior sharedBehaviors];
  if ([v7 entryViewFollowsKeyboardLayoutGuide])
  {
    [(CKMessageEntryView *)self bounds];
    double Height = CGRectGetHeight(v30);
  }
  else
  {
    [(CKMessageEntryView *)self frame];
    double Height = CGRectGetMaxY(v31);
  }
  double v9 = Height;

  double v10 = v9 - v6;
  [(CKMessageEntryView *)self bounds];
  double v12 = v11;
  [(CKMessageEntryView *)self bottomInsetForAppStrip];
  double v14 = v13;
  double v15 = +[CKUIBehavior sharedBehaviors];
  int v16 = [v15 isAppStripInKeyboard];

  if (v16)
  {
    uint64_t v17 = [(CKMessageEntryView *)self appStripBackgroundBlurContainerView];
    objc_msgSend(v17, "setFrame:", 0.0, v10, v12, v6);

    uint64_t v18 = +[CKUIBehavior sharedBehaviors];
    [v18 chatChromeBottomInset];
    double v20 = v19;

    double v21 = v10 + (v14 - v20) * 0.5;
    LODWORD(v18) = [(CKMessageEntryView *)self isKeyboardVisible];
    int v22 = objc_msgSend(MEMORY[0x1E4F42B08], "__ck_isUsingCompactHeightPredictionBar");
    if (v18)
    {
      double v23 = v10;
      if ((v22 & 1) == 0)
      {
        [MEMORY[0x1E4F42B08] keyplanePadding];
        double v23 = v21 + v24 * 0.5;
      }
    }
    else if (v22)
    {
      [(CKMessageEntryView *)self safeAreaInsets];
      if (v25 > 0.0) {
        double v23 = v21 + 3.0;
      }
      else {
        double v23 = v21;
      }
    }
    else
    {
      double v23 = v21;
    }
    if (CKMainScreenScale_once_59 != -1) {
      dispatch_once(&CKMainScreenScale_once_59, &__block_literal_global_1607);
    }
    double v26 = *(double *)&CKMainScreenScale_sMainScreenScale_59;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_59 == 0.0) {
      double v26 = 1.0;
    }
    double v27 = floor(v23 * v26) / v26;
    [(CKBrowserSwitcherFooterView *)v28 setSnapshotVerticalOffset:v10 - v27];
    double v10 = v27;
  }
  -[CKBrowserSwitcherFooterView setFrame:](v28, "setFrame:", 0.0, v10, v12, v6);
}

- (BOOL)_shouldUseKeyboardVisibleBottomInsetsForTextEffectsPicker
{
  double v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isExpressiveTextEnabled];

  if (!v4) {
    return 0;
  }
  double v5 = [(CKMessageEntryView *)self contentView];
  double v6 = [v5 textView];

  if (![v6 allowsTextAnimations]
    || [(UITraitCollection *)self->_entryViewTraitCollection userInterfaceIdiom]
    || (IMIsRunningInMessagesExtension() & 1) != 0)
  {

    return 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__CKMessageEntryView__shouldUseKeyboardVisibleBottomInsetsForTextEffectsPicker__block_invoke;
  block[3] = &unk_1E5620C40;
  id v9 = v6;
  id v11 = v9;
  if (_shouldUseKeyboardVisibleBottomInsetsForTextEffectsPicker_onceToken != -1) {
    dispatch_once(&_shouldUseKeyboardVisibleBottomInsetsForTextEffectsPicker_onceToken, block);
  }
  if (_shouldUseKeyboardVisibleBottomInsetsForTextEffectsPicker_respondsToIsTextFormattingInProgress) {
    BOOL v7 = [v9 performSelector:sel__isTextFormattingInProgress] != 0;
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

uint64_t __79__CKMessageEntryView__shouldUseKeyboardVisibleBottomInsetsForTextEffectsPicker__block_invoke()
{
  uint64_t result = objc_opt_respondsToSelector();
  _shouldUseKeyboardVisibleBottomInsetsForTextEffectsPicker_respondsToIsTextFormattingInProgress = result & 1;
  return result;
}

- (double)bottomInsetForAppStrip
{
  double v3 = +[CKUIBehavior sharedBehaviors];
  int v4 = [v3 entryViewSupportsPlusButton];

  if (v4)
  {
    double v5 = [(CKMessageEntryView *)self inputDelegate];
    char v6 = [v5 messageEntryViewShouldVerticallyInsetForPresentedAppCard:self];

    if (self->_keyboardVisible
      || (v6 & 1) != 0
      || [(CKMessageEntryView *)self _shouldUseKeyboardVisibleBottomInsetsForTextEffectsPicker])
    {
      BOOL v7 = +[CKUIBehavior sharedBehaviors];
      [v7 entryViewWithSendMenuBottomContentInsetWithKeyboardVisible];
    }
    else
    {
      BOOL v7 = +[CKUIBehavior sharedBehaviors];
      [v7 entryViewWithSendMenuBottomContentInsetWithoutKeyboardVisible];
    }
    goto LABEL_12;
  }
  BOOL v9 = [(CKMessageEntryView *)self shouldShowAppStrip];
  double result = 0.0;
  if (!v9) {
    return result;
  }
  id v11 = +[CKUIBehavior sharedBehaviors];
  int v12 = [v11 isAppStripInKeyboard];

  if (!v12)
  {
    BOOL v7 = +[CKUIBehavior sharedBehaviors];
    [v7 chatChromeBottomInset];
LABEL_12:
    double v13 = v8;

    return v13;
  }
  [MEMORY[0x1E4F42B08] predictionViewHeightForCurrentInputMode];
  if (result == 38.0) {
    return 37.0;
  }
  return result;
}

- (void)setKeyboardVisible:(BOOL)a3
{
  if (self->_keyboardVisible != a3)
  {
    self->_keyboardVisible = a3;
    [(CKMessageEntryView *)self setNeedsLayout];
    id v4 = [(CKMessageEntryView *)self delegate];
    [v4 messageEntryViewDidChange:self isTextChange:0 isShelfChange:0];
  }
}

- (BOOL)isRunningInNotificationExtension
{
  return CKIsRunningInMessagesNotificationExtension() != 0;
}

- (BOOL)_shouldUseDarkAppearanceFromTraitCollection:(id)a3
{
  uint64_t v4 = [a3 userInterfaceStyle];
  BOOL v5 = v4 == 2;
  char v6 = [MEMORY[0x1E4F43058] keyWindow];
  BOOL v7 = [v6 windowScene];
  char v8 = [v7 _enhancedWindowingEnabled];

  if ((v8 & 1) == 0)
  {
    BOOL v9 = [(CKMessageEntryView *)self isRunningInNotificationExtension];
    return v4 == 2 || v9;
  }
  return v5;
}

- (void)setEntryViewTraitCollection:(id)a3
{
}

- (void)setEntryViewTraitCollection:(id)a3 resetStyle:(BOOL)a4
{
  BOOL v4 = a4;
  v44[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [(CKMessageEntryView *)self _shouldUseDarkAppearanceFromTraitCollection:v6];
  if (v7)
  {
    char v8 = [MEMORY[0x1E4F42F80] traitCollectionWithUserInterfaceStyle:2];
    BOOL v9 = (void *)MEMORY[0x1E4F42F80];
    v44[0] = v6;
    v44[1] = v8;
    double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
    uint64_t v11 = [v9 traitCollectionWithTraitsFromCollections:v10];

    id v6 = (id)v11;
  }
  if (v4
    || (int64_t style = self->_style) == 0
    || v7 != CKMessageEntryViewStyleIsForDarkAppearance([(CKMessageEntryView *)self style])
    && (int64_t style = CKMessageEntryViewStyleInvert([(CKMessageEntryView *)self style])) == 0)
  {
    double v13 = +[CKUIBehavior sharedBehaviors];
    double v14 = [v13 theme];
    double v15 = v14;
    if (v7) {
      uint64_t v16 = [v14 entryViewDarkStyle];
    }
    else {
      uint64_t v16 = [v14 entryViewStyle];
    }
    int64_t style = v16;
  }
  p_entryViewTraitCollection = &self->_entryViewTraitCollection;
  entryViewTraitCollection = self->_entryViewTraitCollection;
  if (!entryViewTraitCollection) {
    goto LABEL_19;
  }
  [(UITraitCollection *)entryViewTraitCollection displayScale];
  double v20 = v19;
  [v6 displayScale];
  if (v20 != v21) {
    goto LABEL_19;
  }
  uint64_t v22 = [(UITraitCollection *)*p_entryViewTraitCollection horizontalSizeClass];
  if (v22 != [v6 horizontalSizeClass]) {
    goto LABEL_19;
  }
  uint64_t v23 = [(UITraitCollection *)*p_entryViewTraitCollection verticalSizeClass];
  if (v23 != [v6 verticalSizeClass]) {
    goto LABEL_19;
  }
  uint64_t v24 = [(UITraitCollection *)*p_entryViewTraitCollection userInterfaceStyle];
  if (v24 != [v6 userInterfaceStyle]) {
    goto LABEL_19;
  }
  double v25 = [(UITraitCollection *)*p_entryViewTraitCollection preferredContentSizeCategory];
  double v26 = [v6 preferredContentSizeCategory];
  BOOL v27 = UIContentSizeCategoryCompareToCategory(v25, v26) == NSOrderedSame;

  if (!v27) {
    goto LABEL_19;
  }
  uint64_t v28 = [(UITraitCollection *)*p_entryViewTraitCollection activeAppearance];
  if (v28 == [v6 activeAppearance])
  {
    uint64_t v29 = [(UITraitCollection *)*p_entryViewTraitCollection userInterfaceLevel];
    BOOL v30 = v29 != [v6 userInterfaceLevel];
  }
  else
  {
LABEL_19:
    BOOL v30 = 1;
  }
  int64_t v31 = [(CKMessageEntryView *)self style];
  int64_t v32 = v31;
  if (v4 || v30 || v31 != style)
  {
    if (IMOSLoggingEnabled())
    {
      double v33 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        int v40 = 67109632;
        *(_DWORD *)id v41 = v4;
        *(_WORD *)&v41[4] = 1024;
        *(_DWORD *)&v41[6] = v30;
        __int16 v42 = 1024;
        BOOL v43 = v32 != style;
        _os_log_impl(&dword_18EF18000, v33, OS_LOG_TYPE_INFO, "resetStyle: %{BOOL}d traitCollectionChanged: %{BOOL}d styleChange: %{BOOL}d", (uint8_t *)&v40, 0x14u);
      }
    }
    objc_storeStrong((id *)&self->_entryViewTraitCollection, v6);
    if (IMOSLoggingEnabled())
    {
      id v34 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        id v35 = [(UITraitCollection *)*p_entryViewTraitCollection description];
        int v40 = 138412290;
        *(void *)id v41 = v35;
        _os_log_impl(&dword_18EF18000, v34, OS_LOG_TYPE_INFO, "Updated _entryViewTraitCollection property. Description: {%@}", (uint8_t *)&v40, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      id v36 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        BOOL v37 = [(CKMessageEntryView *)self isRunningInNotificationExtension];
        id v38 = @"NO";
        if (v37) {
          id v38 = @"YES";
        }
        int v40 = 138412290;
        *(void *)id v41 = v38;
        _os_log_impl(&dword_18EF18000, v36, OS_LOG_TYPE_INFO, "Update style. isRunningInNotificationExtension: {%@}", (uint8_t *)&v40, 0xCu);
      }
    }
    [(CKMessageEntryView *)self setStyle:style];
    if (IMOSLoggingEnabled())
    {
      v39 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        LOWORD(v40) = 0;
        _os_log_impl(&dword_18EF18000, v39, OS_LOG_TYPE_INFO, "Returned from -[CKMessageEntryView setStyle:]", (uint8_t *)&v40, 2u);
      }
    }
    [(CKMessageEntryView *)self updateEntryView];
    [(CKMessageEntryView *)self updateAppsMenu];
    [(CKMessageEntryView *)self setNeedsLayout];
    [(CKMessageEntryView *)self layoutIfNeeded];
  }
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  [(CKMessageEntryView *)self setStyle:[(CKMessageEntryView *)self style]];

  [(CKMessageEntryView *)self updateEntryView];
}

- (void)switcherView:(id)a3 didSelectPluginAtIndex:(id)a4
{
  id v5 = a4;
  dispatch_time_t v6 = dispatch_time(0, 10000000);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__CKMessageEntryView_switcherView_didSelectPluginAtIndex___block_invoke;
  v8[3] = &unk_1E5620AF8;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_after(v6, MEMORY[0x1E4F14428], v8);
}

void __58__CKMessageEntryView_switcherView_didSelectPluginAtIndex___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 504));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 504));
    [v4 messageEntryView:*(void *)(a1 + 32) didSelectPluginAtIndex:*(void *)(a1 + 40)];
  }
}

- (void)switcherView:(id)a3 didMagnify:(BOOL)a4
{
  BOOL v4 = a4;
  [(CKMessageEntryView *)self updateAppStripFrame];
  dispatch_time_t v6 = [(CKMessageEntryView *)self sendButton];
  BOOL v7 = !v4;
  [v6 setEnabled:v7];

  char v8 = [(CKMessageEntryView *)self audioButton];
  [v8 setEnabled:v7];

  id v9 = [(CKMessageEntryView *)self dictationButton];
  [v9 setEnabled:v7];
}

- (void)updateTextViewsForShouldHideCaret:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(CKMessageEntryView *)self contentView];
  BOOL v4 = [v6 textView];
  [v4 setHideCaret:v3];

  id v5 = [v6 subjectView];
  [v5 setHideCaret:v3];
}

- (void)prepareForResizeAnimationIfNeeded
{
  id v24 = [(CKMessageEntryView *)self contentView];
  uint64_t v2 = [v24 pluginView];
  if (v2 && [v24 shouldShowPlugin])
  {
    [v24 computedPluginViewFrame];
    double width = v26.size.width;
    v26.size.height = 0.0;
    double MinX = CGRectGetMinX(v26);
    id v5 = [v24 pluginView];
    objc_msgSend(v5, "setFrame:", MinX, 0.0, width, 0.0);

    [v24 computedClearPluginButtonFrame];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    double v11 = v10;
    double v13 = v12;
    v27.origin.CGFloat y = 0.0;
    v27.size.height = 0.0;
    v27.origin.CGFloat x = MinX;
    v27.size.double width = width;
    double MidX = CGRectGetMidX(v27);
    v28.origin.CGFloat x = v7;
    v28.origin.CGFloat y = v9;
    v28.size.double width = v11;
    v28.size.height = v13;
    double v15 = MidX - CGRectGetWidth(v28) * 0.5;
    v29.origin.CGFloat y = 0.0;
    v29.size.height = 0.0;
    v29.origin.CGFloat x = MinX;
    v29.size.double width = width;
    double MidY = CGRectGetMidY(v29);
    v30.origin.CGFloat x = v7;
    v30.origin.CGFloat y = v9;
    v30.size.double width = v11;
    v30.size.height = v13;
    double v17 = MidY - CGRectGetHeight(v30) * 0.5;
    uint64_t v18 = [v24 clearPluginButton];
    [v18 setAlpha:0.0];

    double v19 = [v24 clearPluginButton];
    objc_msgSend(v19, "setFrame:", v15, v17, v11, v13);

    [v24 bounds];
    double v21 = v20;
    if (CKPixelWidth_once_12 != -1) {
      dispatch_once(&CKPixelWidth_once_12, &__block_literal_global_1616_0);
    }
    double v22 = *(double *)&CKPixelWidth_sPixel_12;
    uint64_t v23 = [v24 pluginDividerLine];
    objc_msgSend(v23, "setFrame:", 0.0, 0.0, v21, v22);
  }
}

- (void)_configureForDisplayModeSending
{
  BOOL v3 = [(CKMessageEntryView *)self sendButton];
  [v3 setHidden:1];

  BOOL v4 = [(CKMessageEntryView *)self dictationButton];
  [v4 setHidden:1];

  id v5 = [(CKMessageEntryView *)self sendButtonSpinner];
  [v5 setHidden:0];

  double v6 = [(CKMessageEntryView *)self sendButtonSpinner];
  [v6 startAnimating];

  [(CKMessageEntryView *)self setPowerLevels:0];
  [(CKMessageEntryView *)self setDuration:0.0];
  CGFloat v7 = [(CKMessageEntryView *)self audioButton];
  [v7 setHidden:1];

  double v8 = [(CKMessageEntryView *)self inputButtonContainerView];
  [v8 setAlpha:1.0];

  CGFloat v9 = [(CKMessageEntryView *)self contentClipView];
  [v9 setAlpha:1.0];

  if (CKIsRunningInMacCatalyst())
  {
    double v10 = [(CKMessageEntryView *)self cancelButton];
    [v10 setHidden:1];

    double v11 = [(CKMessageEntryView *)self stopButton];
    [v11 setHidden:1];

    double v12 = [(CKMessageEntryView *)self sendAudioButton];
    [v12 setHidden:1];

    double v13 = [(CKMessageEntryView *)self browserButton];
    [v13 setHidden:0];

    double v14 = [(CKMessageEntryView *)self plusButton];
    [v14 setHidden:0];

    double v15 = [(CKMessageEntryView *)self emojiButton];
    [v15 setHidden:0];
  }
  uint64_t v16 = [(CKMessageEntryView *)self recordedAudioView];
  [v16 removeFromSuperview];

  double v17 = [(CKMessageEntryView *)self waveformView];
  [v17 removeFromSuperview];

  id v18 = [(CKMessageEntryView *)self recordedAudioView];
  [v18 setAudioMediaObject:0];
}

- (void)_configureForDisplayModeText
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(CKMessageEntryView *)self sendButtonSpinner];
  [v3 setHidden:0];

  BOOL v4 = [(CKMessageEntryView *)self sendButtonSpinner];
  [v4 stopAnimating];

  id v5 = [(CKMessageEntryView *)self contentClipView];
  [v5 setHidden:0];

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  double v6 = [(CKMessageEntryView *)self contentClipView];
  CGFloat v7 = [v6 subviews];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v43;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v43 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v42 + 1) + 8 * v11++) setHidden:0];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v9);
  }

  [(CKMessageEntryView *)self setPowerLevels:0];
  [(CKMessageEntryView *)self setDuration:0.0];
  double v12 = [(CKMessageEntryView *)self sendButton];
  [v12 setHidden:1];

  double v13 = [(CKMessageEntryView *)self audioButton];
  [v13 setHidden:1];

  double v14 = [(CKMessageEntryView *)self dictationButton];
  [v14 setHidden:0];

  double v15 = [(CKMessageEntryView *)self dictationButton];
  objc_msgSend(v15, "setEnabled:", objc_msgSend(MEMORY[0x1E4F42B30], "dictationInputModeIsFunctional"));

  uint64_t v16 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v17 = [v16 isAudioMessagesEntryViewRecordingEnabled];

  if (v17)
  {
    BOOL v18 = [(CKMessageEntryView *)self shouldShowAudioButton];
    double v19 = [(CKMessageEntryView *)self dictationButton];
    [v19 setHidden:v18];

    double v20 = [(CKMessageEntryView *)self audioButton];
    [v20 setHidden:v18 ^ 1];

    double v21 = [(CKMessageEntryView *)self audioHintLabel];
    [v21 setHidden:1];

    double v22 = [(CKMessageEntryView *)self contentClipView];
    [v22 setHidden:0];

    uint64_t v23 = [(CKMessageEntryView *)self plusButton];
    id v24 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    objc_msgSend(v23, "setHidden:", objc_msgSend(v24, "isSendMenuEnabled") ^ 1);

    double v25 = [(CKMessageEntryView *)self buttonAndTextAreaContainerView];
    [v25 setHidden:0];
  }
  CGRect v26 = [(CKMessageEntryView *)self inputButtonContainerView];
  [v26 setAlpha:1.0];

  CGRect v27 = [(CKMessageEntryView *)self contentClipView];
  [v27 setAlpha:1.0];

  CGRect v28 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v29 = [v28 isAudioMessagesEntryViewRecordingEnabled];

  int v30 = CKIsRunningInMacCatalyst();
  if (v29)
  {
    if (!v30) {
      return;
    }
    int64_t v31 = [(CKMessageEntryView *)self browserButton];
    [v31 setHidden:0];

    int64_t v32 = [(CKMessageEntryView *)self plusButton];
    [v32 setHidden:0];

    double v33 = [(CKMessageEntryView *)self emojiButton];
    [v33 setHidden:0];
  }
  else
  {
    if (v30)
    {
      id v34 = [(CKMessageEntryView *)self cancelButton];
      [v34 setHidden:1];

      id v35 = [(CKMessageEntryView *)self stopButton];
      [v35 setHidden:1];

      id v36 = [(CKMessageEntryView *)self sendAudioButton];
      [v36 setHidden:1];

      BOOL v37 = [(CKMessageEntryView *)self browserButton];
      [v37 setHidden:0];

      id v38 = [(CKMessageEntryView *)self plusButton];
      [v38 setHidden:0];

      v39 = [(CKMessageEntryView *)self emojiButton];
      [v39 setHidden:0];
    }
    int v40 = [(CKMessageEntryView *)self recordedAudioView];
    [v40 removeFromSuperview];

    id v41 = [(CKMessageEntryView *)self waveformView];
    [v41 removeFromSuperview];

    double v33 = [(CKMessageEntryView *)self recordedAudioView];
    [v33 setAudioMediaObject:0];
  }
}

- (void)_configureForDisplayModeRecording
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isAudioMessagesEntryViewRecordingEnabled];

  if (v4)
  {
    [(CKMessageEntryView *)self _setupAudioMessageRecordingView];
    id v5 = [(CKMessageEntryView *)self inputButtonContainerView];
    [v5 setAlpha:0.0];

    id v27 = [(CKMessageEntryView *)self contentClipView];
    [v27 setAlpha:0.0];
  }
  else
  {
    if (CKIsRunningInMacCatalyst())
    {
      double v6 = [(CKMessageEntryView *)self stopButton];
      [v6 setHidden:0];

      CGFloat v7 = [(CKMessageEntryView *)self sendAudioButton];
      [v7 setHidden:1];
    }
    [(CKMessageEntryView *)self _setupWaveformView];
    uint64_t v8 = [(CKMessageEntryView *)self buttonAndTextAreaContainerView];
    uint64_t v9 = [(CKMessageEntryView *)self waveformView];
    [v8 addSubview:v9];

    uint64_t v10 = [(CKMessageEntryView *)self recordedAudioView];
    [v10 removeFromSuperview];

    uint64_t v11 = [(CKMessageEntryView *)self recordedAudioView];
    [v11 setAudioMediaObject:0];

    double v12 = [(CKMessageEntryView *)self inputButtonContainerView];
    [v12 setAlpha:1.0];

    double v13 = [(CKMessageEntryView *)self contentClipView];
    [v13 setAlpha:1.0];

    double v14 = [(CKMessageEntryView *)self audioButton];
    [v14 setHidden:1];

    double v15 = [(CKMessageEntryView *)self emojiButton];
    [v15 setHidden:1];

    uint64_t v16 = [(CKMessageEntryView *)self cancelButton];
    [v16 setHidden:1];

    int v17 = [(CKMessageEntryView *)self dictationButton];
    [v17 setHidden:1];

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    BOOL v18 = [(CKMessageEntryView *)self contentClipView];
    double v19 = [v18 subviews];

    uint64_t v20 = [v19 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v29 != v22) {
            objc_enumerationMutation(v19);
          }
          [*(id *)(*((void *)&v28 + 1) + 8 * i) setHidden:1];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v21);
    }

    id v24 = [(CKMessageEntryView *)self browserButton];
    [v24 setHidden:0];

    double v25 = [(CKMessageEntryView *)self plusButton];
    [v25 setHidden:0];

    CGRect v26 = [(CKMessageEntryView *)self photoButton];
    [v26 setHidden:0];
  }
}

- (void)_configureForDisplayModeRecorded
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isAudioMessagesEntryViewRecordingEnabled];

  if (v4)
  {
    id v5 = [(CKMessageEntryView *)self plusButton];
    [v5 setHidden:1];

    double v6 = [(CKMessageEntryView *)self contentClipView];
    [v6 setHidden:1];

    [(CKMessageEntryView *)self _setupAudioMessageRecordingView];
    id v23 = [(CKMessageEntryView *)self audioRecordingView];
    [v23 setState:2];
  }
  else
  {
    CGFloat v7 = [(CKMessageEntryView *)self inputButtonContainerView];
    [v7 setAlpha:1.0];

    uint64_t v8 = [(CKMessageEntryView *)self contentClipView];
    [v8 setAlpha:1.0];

    uint64_t v9 = [(CKMessageEntryView *)self audioButton];
    [v9 setHidden:1];

    uint64_t v10 = [(CKMessageEntryView *)self emojiButton];
    [v10 setHidden:1];

    uint64_t v11 = [(CKMessageEntryView *)self cancelButton];
    [v11 setHidden:1];

    double v12 = [(CKMessageEntryView *)self dictationButton];
    [v12 setHidden:1];

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    double v13 = [(CKMessageEntryView *)self contentClipView];
    double v14 = [v13 subviews];

    uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v14);
          }
          [*(id *)(*((void *)&v24 + 1) + 8 * i) setHidden:1];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v16);
    }

    double v19 = [(CKMessageEntryView *)self browserButton];
    [v19 setHidden:0];

    uint64_t v20 = [(CKMessageEntryView *)self plusButton];
    [v20 setHidden:0];

    uint64_t v21 = [(CKMessageEntryView *)self photoButton];
    [v21 setHidden:0];

    uint64_t v22 = [(CKMessageEntryView *)self sendButton];
    [v22 setHidden:0];
  }
}

- (void)configureForDisplayMode:(unint64_t)a3
{
  if ([(CKMessageEntryView *)self displayMode] == a3) {
    return;
  }
  [(CKMessageEntryView *)self setDisplayMode:a3];
  if (a3 == 1)
  {
    [(CKMessageEntryView *)self _configureForDisplayModeText];
    [(CKMessageEntryView *)self clearAudioRecordingUI];
    goto LABEL_26;
  }
  if (a3 == 4)
  {
    [(CKMessageEntryView *)self _configureForDisplayModeSending];
    goto LABEL_26;
  }
  id v5 = [(CKMessageEntryView *)self audioButton];
  [v5 setHidden:1];

  double v6 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  char v7 = [v6 isAudioMessagesEntryViewRecordingEnabled];

  if ((v7 & 1) == 0)
  {
    uint64_t v8 = [(CKMessageEntryView *)self contentClipView];
    [v8 setAlpha:0.0];
  }
  int v9 = CKIsRunningInMacCatalyst();
  uint64_t v10 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v11 = [v10 isAudioMessagesEntryViewRecordingEnabled];

  if (v9)
  {
    if ((v11 & 1) == 0)
    {
      double v12 = [(CKMessageEntryView *)self cancelButton];
      [v12 setHidden:0];
    }
    double v13 = [(CKMessageEntryView *)self browserButton];
    [v13 setHidden:1];

    double v14 = [(CKMessageEntryView *)self plusButton];
    [v14 setHidden:1];

    uint64_t v15 = [(CKMessageEntryView *)self emojiButton];
    [v15 setHidden:1];

    uint64_t v16 = [(CKMessageEntryView *)self inputButtonContainerView];
    uint64_t v17 = [(CKMessageEntryView *)self cancelButton];
    [v16 addSubview:v17];

LABEL_16:
    if (a3 == 2) {
      goto LABEL_17;
    }
LABEL_18:
    double v19 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v20 = [v19 isAudioMessagesEntryViewRecordingEnabled];

    if (v20)
    {
      id v21 = [(CKMessageEntryView *)self contentClipView];
      [v21 setAlpha:0.0];
    }
    else
    {
      if (CKIsRunningInMacCatalyst())
      {
        uint64_t v22 = [(CKMessageEntryView *)self stopButton];
        [v22 setHidden:1];

        id v23 = [(CKMessageEntryView *)self sendAudioButton];
        [v23 setHidden:0];
      }
      [(CKMessageEntryView *)self loadRecordedAudioViewsIfNeeded];
      long long v24 = [(CKMessageEntryView *)self waveformView];
      [v24 removeFromSuperview];

      long long v25 = [(CKMessageEntryView *)self buttonAndTextAreaContainerView];
      long long v26 = [(CKMessageEntryView *)self recordedAudioView];
      [v25 addSubview:v26];

      long long v27 = [(CKMessageEntryView *)self audioComposition];
      long long v28 = [v27 mediaObjects];
      id v21 = [v28 firstObject];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v21 = v21;
        uint64_t v29 = [(CKMessageEntryView *)self recordedAudioView];
        [v29 setAudioMediaObject:v21];
      }
    }

    if (a3 == 3) {
      [(CKMessageEntryView *)self _configureForDisplayModeRecorded];
    }
    goto LABEL_26;
  }
  if (!v11)
  {
    uint64_t v16 = [(CKMessageEntryView *)self inputButtonContainerView];
    [v16 setAlpha:0.0];
    goto LABEL_16;
  }
  if (a3 != 2)
  {
    BOOL v18 = [(CKMessageEntryView *)self inputButtonContainerView];
    [v18 setAlpha:0.0];

    goto LABEL_18;
  }
LABEL_17:
  [(CKMessageEntryView *)self _configureForDisplayModeRecording];
LABEL_26:
  [(CKMessageEntryView *)self setNeedsLayout];
  if (CKIsRunningInMacCatalyst())
  {
    [(CKMessageEntryView *)self layoutIfNeeded];
  }
}

- (void)setBrowserButtonEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CKMessageEntryView *)self browserButton];
  [v4 setEnabled:v3];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  [(CKMessageEntryView *)self adjustedCoverInsets];
  double v6 = v5;
  double v8 = v7;
  double v11 = width - (v9 + v10);
  double v12 = [(CKMessageEntryView *)self contentView];
  objc_msgSend(v12, "sizeThatFits:", v11, 1.79769313e308);
  double v14 = v13;
  uint64_t v15 = [(CKMessageEntryView *)self audioRecordingView];

  if (v15)
  {
    uint64_t v16 = [(CKMessageEntryView *)self audioRecordingView];
    [(CKMessageEntryView *)self bounds];
    double v18 = v17;
    double v19 = +[CKUIBehavior sharedBehaviors];
    [v19 audioRecordingViewButtonSpacing];
    objc_msgSend(v16, "sizeThatFits:", v18 + v20 * -2.0, 1.79769313e308);
    double v22 = v21;

    if ([(CKMessageEntryView *)self shouldUseLinearResizeForAudioMessage]) {
      double v22 = v14 + (v22 - v14) * 0.3;
    }
  }
  else
  {
    double v22 = v14;
    if ([(CKMessageEntryView *)self shouldShowAudioMessageHint])
    {
      id v23 = [(CKMessageEntryView *)self audioHintLabel];
      [v23 frame];
      double v22 = v24;
    }
  }
  if ([(CKMessageEntryView *)self entryFieldCollapsed])
  {
    long long v25 = +[CKUIBehavior sharedBehaviors];
    long long v26 = [v25 entryViewlayoutMetrics];

    [v26 defaultEntryViewHeight];
    double v28 = v27;
    uint64_t v29 = [(CKMessageEntryView *)self composition];
    if ([v29 hasContent])
    {
    }
    else
    {
      BOOL v31 = [(CKMessageEntryView *)self shouldShowSubject];

      if (v31)
      {
        [v26 defaultSubjectEntryViewHeight];
        double v28 = v32;
      }
    }
    [(CKMessageEntryView *)self bottomInsetForAppStrip];
    double v30 = v28 + v33;
  }
  else
  {
    double v30 = v8 + v6 + v22;
  }
  [(CKMessageEntryView *)self safeAreaInsets];
  double v35 = ceil(v30 + v34);

  double v36 = ceil(width);
  double v37 = v35;
  result.height = v37;
  result.double width = v36;
  return result;
}

- (CGRect)coverFrameThatFitsInSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(CKMessageEntryView *)self adjustedCoverInsets];
  double v8 = width - (v6 + v7);
  double v11 = height - (v9 + v10);
  double v12 = +[CKUIBehavior sharedBehaviors];
  [v12 entryViewCoverMinHeight];
  double v14 = v13;

  if (v14 >= v11) {
    double v11 = v14;
  }
  uint64_t v15 = [(CKMessageEntryView *)self contentView];
  objc_msgSend(v15, "sizeThatFits:", v8, v11);
  double v17 = v16;
  double v19 = v18;
  if ([(CKMessageEntryView *)self entryFieldCollapsed])
  {
    double v20 = +[CKUIBehavior sharedBehaviors];
    double v21 = [v20 entryViewlayoutMetrics];

    [v21 defaultEntryContentViewHeight];
    double v23 = v22;
    double v24 = [(CKMessageEntryView *)self composition];
    if ([v24 hasContent])
    {
    }
    else
    {
      BOOL v25 = [(CKMessageEntryView *)self shouldShowSubject];

      if (v25)
      {
        [v21 defaultSubjectEntryContentViewHeight];
        double v23 = v26;
      }
    }
  }
  else
  {
    double v23 = fmin(v19, v11);
  }
  -[CKMessageEntryView _computedFinalCoverFrameRectForContentSize:](self, "_computedFinalCoverFrameRectForContentSize:", v17, v23);
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;

  double v35 = v28;
  double v36 = v30;
  double v37 = v32;
  double v38 = v34;
  result.size.double height = v38;
  result.size.double width = v37;
  result.origin.CGFloat y = v36;
  result.origin.CGFloat x = v35;
  return result;
}

- (CGRect)_computedFinalCoverFrameRectForContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(CKMessageEntryView *)self safeAreaInsets];
  double v7 = v6;
  [(CKMessageEntryView *)self adjustedCoverInsets];
  double v9 = v8;
  double v11 = v10;
  [(CKMessageEntryView *)self bounds];
  double v13 = v12 - width - v11;
  [(CKMessageEntryView *)self bounds];
  double v15 = v14;
  if (self->_shouldCoverViewBeShrunkenForSendMenu)
  {
    double v16 = [(CKMessageEntryView *)self delegate];
    double v17 = [v16 messageEntryViewActiveSendMenuPresentation:self];

    if (v17)
    {
      double v18 = (void *)[v17 newPopoverLayoutMetrics];
      if (v18)
      {
        double v19 = [(CKMessageEntryView *)self window];
        double v20 = [v18 coordinateSpace];
        [v18 frame];
        objc_msgSend(v20, "convertRect:toCoordinateSpace:", v19);
        double v22 = v21;
        double v24 = v23;
        double v48 = v9;
        double v49 = v7;
        double v26 = v25;
        double v28 = v27;

        -[CKMessageEntryView convertRect:fromView:](self, "convertRect:fromView:", 0, v22, v24, v26, v28);
        CGFloat v30 = v29;
        CGFloat v32 = v31;
        CGFloat v34 = v33;
        CGFloat v36 = v35;
        [(CKMessageEntryView *)self bounds];
        double v47 = v15;
        double MinX = CGRectGetMinX(v50);
        v51.origin.CGFloat x = v30;
        v51.origin.CGFloat y = v32;
        v51.size.double width = v34;
        v51.size.double height = v36;
        double v38 = CGRectGetMinX(v51);
        if (MinX >= v38) {
          double v38 = MinX;
        }
        [(CKMessageEntryView *)self bounds];
        double MaxX = CGRectGetMaxX(v52);
        v53.origin.CGFloat x = v30;
        v53.origin.CGFloat y = v32;
        double v9 = v48;
        v53.size.double width = v34;
        v53.size.double height = v36;
        double v40 = CGRectGetMaxX(v53);
        if (MaxX < v40) {
          double v40 = MaxX;
        }
        double v15 = v47;
        double v41 = v40 - v46 + 24.0;
        double width = width - vabdd_f64(v13, v41);

        double v13 = v41;
        double v7 = v49;
      }
    }
  }
  double v42 = v15 - height - (v7 + v9);
  double v43 = v13;
  double v44 = width;
  double v45 = height;
  result.size.double height = v45;
  result.size.double width = v44;
  result.origin.CGFloat y = v42;
  result.origin.CGFloat x = v43;
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v54.receiver = self;
  v54.super_class = (Class)CKMessageEntryView;
  -[CKMessageEntryView hitTest:withEvent:](&v54, sel_hitTest_withEvent_, a4);
  double v7 = (CKEntryViewButton *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [(CKMessageEntryView *)self audioRecordingView];
  if (v8)
  {
    double v9 = (void *)v8;
    double v10 = [(CKMessageEntryView *)self audioRecordingView];
    int v11 = [(CKEntryViewButton *)v7 isDescendantOfView:v10];

    if (v11)
    {
      double v12 = v7;
      goto LABEL_27;
    }
  }
  [(CKEntryViewButton *)self->_sendButton frame];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v21 = [(CKEntryViewButton *)self->_sendButton superview];
  -[CKMessageEntryView convertRect:fromView:](self, "convertRect:fromView:", v21, v14, v16, v18, v20);
  double v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;

  [(CKMessageEntryView *)self frame];
  if (v7 == self->_sendButton) {
    goto LABEL_16;
  }
  if (v7 == self->_audioButton) {
    goto LABEL_16;
  }
  v58.size.double width = v28 - v23;
  v58.origin.CGFloat x = v23;
  v58.origin.CGFloat y = v25;
  v58.size.double height = v27;
  v56.CGFloat x = x;
  v56.CGFloat y = y;
  if (!CGRectContainsPoint(v58, v56)) {
    goto LABEL_16;
  }
  if ([(CKEntryViewButton *)self->_sendButton isEnabled]
    && ([(CKEntryViewButton *)self->_sendButton isHidden] & 1) == 0)
  {
    sendButton = self->_sendButton;
LABEL_14:
    [(CKEntryViewButton *)sendButton button];
    double v29 = v7;
    double v7 = (CKEntryViewButton *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  if ([(CKEntryViewButton *)self->_audioButton isEnabled]
    && ([(CKEntryViewButton *)self->_audioButton isHidden] & 1) == 0)
  {
    sendButton = self->_audioButton;
    goto LABEL_14;
  }
  double v29 = [(CKMessageEntryView *)self delegate];
  [v29 messageEntryViewSendButtonHitWhileDisabled:self];
LABEL_15:

LABEL_16:
  double v31 = [(CKEntryViewPlusButton *)self->_plusButton button];
  if ([(CKMessageEntryView *)self isUserInteractionEnabled])
  {
    id WeakRetained = [(CKEntryViewButton *)v31 window];
    if (!WeakRetained
      || ![(CKEntryViewButton *)v31 isEnabled]
      || ([(CKEntryViewButton *)v31 isHidden] & 1) != 0)
    {
      goto LABEL_25;
    }
    double v33 = [(CKMessageEntryView *)self audioRecordingView];

    if (!v33)
    {
      [(CKEntryViewButton *)v31 frame];
      double v35 = v34;
      double v37 = v36;
      double v39 = v38;
      double v41 = v40;
      double v42 = [(CKEntryViewButton *)v31 superview];
      -[CKMessageEntryView convertRect:fromView:](self, "convertRect:fromView:", v42, v35, v37, v39, v41);
      CGFloat v44 = v43;
      CGFloat v46 = v45;
      CGFloat v48 = v47;
      CGFloat v50 = v49;

      v59.origin.CGFloat x = v44;
      v59.origin.CGFloat y = v46;
      v59.size.double width = v48;
      v59.size.double height = v50;
      double MaxX = CGRectGetMaxX(v59);
      if (v7 == v31)
      {
LABEL_24:
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained messageEntryViewPlusButtonHit:self];
LABEL_25:

        goto LABEL_26;
      }
      v60.size.double width = MaxX;
      v60.origin.CGFloat x = 0.0;
      v60.origin.CGFloat y = v46;
      v60.size.double height = v50;
      v57.CGFloat x = x;
      v57.CGFloat y = y;
      if (CGRectContainsPoint(v60, v57))
      {
        CGRect v52 = v31;

        double v7 = v52;
        goto LABEL_24;
      }
    }
  }
LABEL_26:
  double v12 = v7;

LABEL_27:

  return v12;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = +[CKUIBehavior sharedBehaviors];
  char v9 = [v8 entryViewFollowsKeyboardLayoutGuide];

  if ((v9 & 1) == 0)
  {
    double v10 = +[CKUIBehavior sharedBehaviors];
    char v11 = [v10 isEntryViewInputAccessory];

    if (v11)
    {
      double v20 = 0.0;
      double v21 = 0.0;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (objc_opt_respondsToSelector())
      {
        id v13 = objc_loadWeakRetained((id *)&self->_delegate);
        int v14 = [v13 messageEntryViewWidth:&v21 andOffset:&v20];

        if (v14)
        {
          double x = v20;
          double width = v21;
        }
      }
      else
      {
      }
    }
    else
    {
      double v15 = [(CKMessageEntryView *)self superview];

      if (v15)
      {
        double v16 = [(CKMessageEntryView *)self superview];
        [v16 bounds];
        double v18 = v17;

        double y = v18 - height;
      }
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)CKMessageEntryView;
  -[CKMessageEntryView setFrame:](&v19, sel_setFrame_, x, y, width, height);
}

- (void)prepareForBrowserSwitcherCompactTransitionIsSnapshotting:(BOOL)a3
{
  BOOL v3 = a3;
  [(CKMessageEntryView *)self setIsTransitioningForBrowserSwitcher:1];
  if (v3)
  {
    double v5 = [(CKMessageEntryView *)self appStripBackgroundBlurView];
    [v5 frame];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;

    int v14 = [(CKMessageEntryView *)self appStrip];
    [v14 setHidden:1];

    id v15 = [(CKMessageEntryView *)self appStripBackgroundBlurView];
    objc_msgSend(v15, "setFrame:", v7, v9, v11, v13 + 20.0);
  }
}

- (void)finishBrowserSwitcherCompactTransition
{
  [(CKMessageEntryView *)self setIsTransitioningForBrowserSwitcher:0];
  id v3 = [(CKMessageEntryView *)self appStrip];
  [v3 setHidden:0];
}

- (void)setMarginInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  [(CKMessageEntryView *)self marginInsets];
  if (v11 != left || v8 != top || v10 != right || v9 != bottom)
  {
    self->_marginInsets.double top = top;
    self->_marginInsets.double left = left;
    self->_marginInsets.double bottom = bottom;
    self->_marginInsets.double right = right;
    unsigned __int8 v41 = 0;
    id v15 = [(CKMessageEntryView *)self plusButton];
    if (v15)
    {
      BOOL v16 = 1;
    }
    else
    {
      double v17 = [(CKMessageEntryView *)self photoButton];
      if (v17)
      {
        BOOL v16 = 1;
      }
      else
      {
        double v18 = [(CKMessageEntryView *)self browserButton];
        BOOL v16 = v18 != 0;
      }
    }

    uint64_t v19 = [(CKMessageEntryView *)self shouldShowPluginButtons] & v16;
    BOOL v20 = [(CKConversation *)self->_conversation isStewieConversation];
    double v21 = [(CKConversation *)self->_conversation sendingService];
    if (objc_msgSend(v21, "__ck_isiMessageLite"))
    {
      uint64_t v22 = 1;
    }
    else
    {
      double v23 = [(CKMessageEntryView *)self conversation];
      double v24 = [v23 sendingService];
      if (objc_msgSend(v24, "__ck_isSatelliteSMS"))
      {
        uint64_t v22 = 1;
      }
      else
      {
        CGFloat v25 = [(CKMessageEntryView *)self conversation];
        double v26 = [v25 chat];
        uint64_t v22 = v20 | [v26 shouldDisplayOffGridModeStatus];
      }
    }

    +[CKMessageEntryView coverViewInsetsForMarginInsets:shouldShowPluginButtons:shouldShowCharacterCount:shouldCenterCharacterCount:isStewieMode:](CKMessageEntryView, "coverViewInsetsForMarginInsets:shouldShowPluginButtons:shouldShowCharacterCount:shouldCenterCharacterCount:isStewieMode:", v19, [(CKMessageEntryView *)self shouldShowCharacterCount], &v41, v22, top, left, bottom, right);
    double v28 = v27;
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;
    [(CKMessageEntryView *)self coverInsets];
    if (v38 == v30 && v35 == v28 && v37 == v34 && v36 == v32)
    {
      int v39 = [(CKMessageEntryView *)self shouldCenterCharacterCount];
      int v40 = v41;
      if (v41 == v39) {
        return;
      }
    }
    else
    {
      int v40 = v41;
    }
    [(CKMessageEntryView *)self setShouldCenterCharacterCount:v40 != 0];
    -[CKMessageEntryView setCoverInsets:](self, "setCoverInsets:", v28, v30, v32, v34);
    [(CKMessageEntryView *)self setNeedsLayout];
  }
}

- (void)setBackdropGroupName:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(NSString *)self->_backdropGroupName isEqualToString:v4])
  {
    double v5 = (NSString *)[v4 copy];
    backdropGroupName = self->_backdropGroupName;
    self->_backdropGroupName = v5;

    if (IMOSLoggingEnabled())
    {
      double v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v8 = 138412290;
        id v9 = v4;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Setting backdrop group name %@", (uint8_t *)&v8, 0xCu);
      }
    }
    [(CKMessageEntryBackgroundViewProtocol *)self->_backgroundView setBackdropGroupName:self->_backdropGroupName];
  }
}

- (double)placeholderHeight
{
  id v3 = +[CKUIBehavior sharedBehaviors];
  id v4 = [v3 entryViewlayoutMetrics];
  if ([(CKMessageEntryView *)self shouldShowSubject]) {
    [v4 defaultSubjectEntryViewHeight];
  }
  else {
    [v4 defaultEntryViewHeight];
  }
  double v6 = v5;
  double v7 = [(CKMessageEntryView *)self sendLaterPluginInfo];

  if (v7)
  {
    int v8 = +[CKUIBehavior sharedBehaviors];
    [v8 messageEntryContentViewSendLaterInsets];
    double v10 = v9;
    double v12 = v11;

    double v13 = +[CKUIBehavior sharedBehaviors];
    [v13 entryViewMaxSendLaterHeight];
    double v6 = v6 + v10 + v12 + v14;
  }
  [(CKMessageEntryView *)self adjustedCoverInsets];
  double v16 = v15;
  double v18 = v17;
  [v3 entryViewVerticalCoverInsets];
  double v20 = v18 - v19;
  double v22 = v16 - v21;
  [(CKMessageEntryView *)self safeAreaInsets];
  double v24 = ceil(v23 + v20 + v6 + v22);

  return v24;
}

- (double)coverViewWidth
{
  uint64_t v2 = [(CKMessageEntryView *)self contentClipView];
  [v2 bounds];
  double Width = CGRectGetWidth(v5);

  return Width;
}

- (CGRect)sendButtonFrameInScreenCoordinates
{
  id v3 = [(CKMessageEntryView *)self sendButton];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(CKMessageEntryView *)self audioButton];
  }
  double v6 = v5;

  double v7 = [v6 superview];
  [v6 frame];
  objc_msgSend(v7, "convertRect:toView:", 0);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (CGRect)activeKeyboardHeight
{
  uint64_t v2 = [MEMORY[0x1E4F42B08] activeKeyboard];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (CKMessageEntryView)initWithFrame:(CGRect)a3 marginInsets:(UIEdgeInsets)a4 shouldShowSendButton:(BOOL)a5 shouldShowSubject:(BOOL)a6 shouldShowPluginButtons:(BOOL)a7 shouldShowCharacterCount:(BOOL)a8 traitCollection:(id)a9 shouldDisableAttachments:(BOOL)a10 shouldDisableKeyboardStickers:(BOOL)a11
{
  BYTE3(v12) = a11;
  *(_WORD *)((char *)&v12 + 1) = 0;
  LOBYTE(v12) = a10;
  return -[CKMessageEntryView initWithFrame:marginInsets:shouldAllowImpact:shouldShowSendButton:shouldShowSubject:shouldShowPluginButtons:shouldShowCharacterCount:traitCollection:shouldDisableAttachments:shouldUseNonEmojiKeyboard:shouldUseNonHandwritingKeyboard:shouldDisableKeyboardStickers:](self, "initWithFrame:marginInsets:shouldAllowImpact:shouldShowSendButton:shouldShowSubject:shouldShowPluginButtons:shouldShowCharacterCount:traitCollection:shouldDisableAttachments:shouldUseNonEmojiKeyboard:shouldUseNonHandwritingKeyboard:shouldDisableKeyboardStickers:", 1, a5, a6, a7, a8, a9, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.top, a4.left, a4.bottom, a4.right, v12);
}

- (CKMessageEntryView)initWithFrame:(CGRect)a3 marginInsets:(UIEdgeInsets)a4 shouldAllowImpact:(BOOL)a5 shouldShowSendButton:(BOOL)a6 shouldShowSubject:(BOOL)a7 shouldShowPluginButtons:(BOOL)a8 shouldShowCharacterCount:(BOOL)a9 traitCollection:(id)a10 shouldDisableAttachments:(BOOL)a11 shouldUseNonEmojiKeyboard:(BOOL)a12 shouldUseNonHandwritingKeyboard:(BOOL)a13 shouldDisableKeyboardStickers:(BOOL)a14
{
  BOOL v14 = a9;
  uint64_t v15 = a8;
  BOOL v16 = a7;
  BOOL v17 = a6;
  BOOL v18 = a5;
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v275[5] = *MEMORY[0x1E4F143B8];
  id v28 = a10;
  v274.receiver = self;
  v274.super_class = (Class)CKMessageEntryView;
  double v267 = height;
  double v29 = -[CKMessageEntryView initWithFrame:](&v274, sel_initWithFrame_, x, y, width, height);
  if (!v29) {
    goto LABEL_69;
  }
  BOOL v260 = v14;
  BOOL v269 = v17;
  id v272 = v28;
  +[CKMessageEntryView setCurrentEntryView:v29];
  double v30 = [[CKScheduledUpdater alloc] initWithTarget:v29 action:sel__updateUIForEntryFieldCollapsedStateChange];
  [(CKMessageEntryView *)v29 setEntryFieldCollapsedUpdater:v30];

  double v31 = [(CKMessageEntryView *)v29 entryFieldCollapsedUpdater];
  int v32 = 1;
  [v31 setUpdateSynchronouslyIfPossible:1];

  id v33 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
  [(CKMessageEntryView *)v29 setButtonAndTextAreaContainerView:v33];

  double v34 = [(CKMessageEntryView *)v29 buttonAndTextAreaContainerView];
  [(CKMessageEntryView *)v29 addSubview:v34];

  -[CKMessageEntryView setLastFoundMentionRange:](v29, "setLastFoundMentionRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
  double v35 = [(CKMessageEntryView *)v29 conversation];
  double v36 = [v35 sendingService];
  if ((objc_msgSend(v36, "__ck_isiMessageLite") & 1) == 0)
  {
    unsigned int v264 = v15;
    BOOL v37 = v18;
    BOOL v38 = v16;
    int v39 = [(CKMessageEntryView *)v29 conversation];
    int v40 = [v39 sendingService];
    if ((objc_msgSend(v40, "__ck_isSatelliteSMS") & 1) == 0)
    {
      unsigned __int8 v41 = [(CKMessageEntryView *)v29 conversation];
      double v42 = [v41 chat];
      int v32 = [v42 shouldDisplayOffGridModeStatus];
    }
    BOOL v16 = v38;
    BOOL v18 = v37;
    uint64_t v15 = v264;
  }
  double v258 = x;
  double v262 = y;
  double v265 = width;

  double v43 = [(CKMessageEntryView *)v29 conversation];
  uint64_t v44 = [v43 isStewieConversation] | v32;

  unsigned __int8 v273 = 0;
  int v256 = v44;
  +[CKMessageEntryView coverViewInsetsForMarginInsets:shouldShowPluginButtons:shouldShowCharacterCount:shouldCenterCharacterCount:isStewieMode:](CKMessageEntryView, "coverViewInsetsForMarginInsets:shouldShowPluginButtons:shouldShowCharacterCount:shouldCenterCharacterCount:isStewieMode:", v15, v44 | v260, &v273, v44, top, left, bottom, right);
  double v46 = v45;
  double v48 = v47;
  double v50 = v49;
  double v52 = v51;
  -[CKMessageEntryView setMarginInsets:](v29, "setMarginInsets:", top, left, bottom, right);
  -[CKMessageEntryView setCoverInsets:](v29, "setCoverInsets:", v46, v48, v50, v52);
  [(CKMessageEntryView *)v29 setShouldShowSendButton:v269];
  [(CKMessageEntryView *)v29 setShouldShowSubject:v16];
  [(CKMessageEntryView *)v29 setShouldShowPluginButtons:v15];
  [(CKMessageEntryView *)v29 setShouldShowCharacterCount:v44 | v260];
  [(CKMessageEntryView *)v29 setShouldCenterCharacterCount:v273];
  [(CKMessageEntryView *)v29 setShouldDisableAttachments:a11];
  [(CKMessageEntryView *)v29 setShouldAllowImpactSend:v18];
  CGRect v53 = [MEMORY[0x1E4F42B30] sharedInputModeController];
  objc_super v54 = [v53 enabledDictationLanguages];
  -[CKMessageEntryView setDictationEnabledForLanguage:](v29, "setDictationEnabledForLanguage:", [v54 count] != 0);

  [(CKMessageEntryView *)v29 setShouldShowDictationButton:1];
  [(CKMessageEntryView *)v29 setAccessibilityIdentifier:@"entryView"];
  double v55 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v55 addObserver:v29 selector:sel_textEffectsWindowOffsetDidChange_ name:*MEMORY[0x1E4F43E20] object:0];

  CGPoint v56 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v56 addObserver:v29 selector:sel__keyboardsSettingsChanged_ name:@"AppleKeyboardsSettingsChangedNotification" object:0];

  CGPoint v57 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v57 addObserver:v29 selector:sel__dictationAvailabilityDidChange name:*MEMORY[0x1E4F43AA8] object:0];

  CGRect v58 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  LODWORD(v54) = [v58 isAudioMessagesEntryViewRecordingEnabled];

  if (v54)
  {
    CGRect v59 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v59 addObserver:v29 selector:sel_applicationWillResignActive name:*MEMORY[0x1E4F43710] object:0];
  }
  CGRect v60 = +[CKUIBehavior sharedBehaviors];
  int v61 = [v60 entryViewFollowsKeyboardLayoutGuide];

  double v62 = v265;
  if (v61)
  {
    [(CKMessageEntryView *)v29 setTranslatesAutoresizingMaskIntoConstraints:0];
  }
  else
  {
    id v63 = [(CKMessageEntryView *)v29 layer];
    objc_msgSend(v63, "setAnchorPoint:", 1.0, 1.0);
  }
  [(CKMessageEntryView *)v29 setOpaque:0];
  [(CKMessageEntryView *)v29 updateBackgroundView];
  uint64_t v64 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v65 = [(id)v64 isSendMenuEnabled];

  id v66 = +[CKUIBehavior sharedBehaviors];
  LOBYTE(v64) = [v66 entryViewSupportsPlusButton];

  double v67 = -[CKMessageEntryViewButtonContainerView initWithFrame:]([CKMessageEntryViewButtonContainerView alloc], "initWithFrame:", v258, v262, v265, v267);
  [(CKMessageEntryViewButtonContainerView *)v67 setClipsToBounds:v65 ^ 1u];
  double v68 = [(CKMessageEntryViewButtonContainerView *)v67 layer];
  objc_msgSend(v68, "setAnchorPoint:", 0.0, 0.0);

  double v69 = [(CKMessageEntryView *)v29 buttonAndTextAreaContainerView];
  [v69 addSubview:v67];

  v270 = v67;
  [(CKMessageEntryView *)v29 setInputButtonContainerView:v67];
  double v70 = objc_msgSend(objc_alloc(MEMORY[0x1E4F43028]), "initWithFrame:", v258, v262, v265, v267);
  [(CKMessageEntryView *)v29 setMessageEditingBlurOverlayView:v70];
  [(CKMessageEntryView *)v29 addSubview:v70];
  v263 = v70;
  [v70 setHidden:1];
  double v71 = +[CKUIBehavior sharedBehaviors];
  v72 = v71;
  if (v64) {
    [v71 entryViewPlusButtonSize];
  }
  else {
    [v71 browserButtonSize];
  }
  double v74 = v73;

  -[CKMessageEntryView setInputButtonSize:](v29, "setInputButtonSize:", v74, v74);
  v75 = +[CKUIBehavior sharedBehaviors];
  int v76 = [v75 entryViewSupportsPhotoButton];

  double v77 = &off_1E561D000;
  double v78 = (double *)MEMORY[0x1E4F1DAD8];
  if (v76)
  {
    double v79 = +[CKEntryViewButton entryViewButtonOfType:0];
    [v79 setOpaque:0];
    double v80 = [v79 button];
    [v80 addTarget:v29 action:sel_photoButtonTouchDown_ forEvents:1];

    v81 = [v79 button];
    [v81 addTarget:v29 action:sel_photoButtonTouchUpOutside_ forEvents:128];

    double v82 = [v79 button];
    [v82 addTarget:v29 action:sel_photoButtonTouchCancel_ forEvents:256];

    double v83 = [v79 button];
    [v83 addTarget:v29 action:sel_photoButtonTapped_ forEvents:64];

    [v79 accessibilitySetIdentification:@"photoButton"];
    [v79 setExclusiveTouch:0];
    objc_msgSend(v79, "setBounds:", *v78, v78[1], v74, v74);
    if ([(CKMessageEntryView *)v29 shouldShowPluginButtons])
    {
      [(CKMessageEntryView *)v29 setPhotoButton:v79];
      [(CKMessageEntryViewButtonContainerView *)v67 addSubview:v79];
    }
  }
  v84 = +[CKUIBehavior sharedBehaviors];
  int v85 = [v84 entryViewSupportsPlusButton];

  if (v85)
  {
    v86 = objc_alloc_init(CKEntryViewPlusButton);
    double v87 = +[CKUIBehavior sharedBehaviors];
    int v88 = [v87 browserButtonShouldUseMenu];

    BOOL v89 = [(CKEntryViewPlusButton *)v86 button];
    BOOL v90 = v89;
    if (v88)
    {
      double v91 = [(CKMessageEntryView *)v29 entryViewTraitCollection];
      double v92 = [(CKMessageEntryView *)v29 conversation];
      v93 = +[CKAppMenuDataSource appMenuWithTarget:v29 traitCollection:v91 conversation:v92];
      [v90 setMenu:v93];

      double v77 = &off_1E561D000;
      double v94 = [(CKEntryViewPlusButton *)v86 button];
      [v94 setContextMenuIsPrimary:1];

      double v95 = [(CKEntryViewPlusButton *)v86 button];
      [v95 setContextMenuEnabled:1];
    }
    else
    {
      [v89 addTarget:v29 action:sel_plusButtonTouchDown_ forEvents:1];

      v96 = [(CKEntryViewPlusButton *)v86 button];
      [v96 addTarget:v29 action:sel_plusButtonTouchUpOutside_ forEvents:128];

      double v97 = [(CKEntryViewPlusButton *)v86 button];
      [v97 addTarget:v29 action:sel_plusButtonTouchCancel_ forEvents:256];

      double v98 = [(CKEntryViewPlusButton *)v86 button];
      [v98 addTarget:v29 action:sel_plusButtonTouchDragExit_ forEvents:32];

      double v99 = [(CKEntryViewPlusButton *)v86 button];
      [v99 addTarget:v29 action:sel_plusButtonTouchDragEnter_ forEvents:16];

      v100 = [(CKEntryViewPlusButton *)v86 button];
      [v100 addTarget:v29 action:sel_didSelectPlusButton_ forEvents:64];

      double v101 = +[CKUIBehavior sharedBehaviors];
      int v102 = [v101 supportsEntryViewPlusButtonLongPress];

      if (!v102)
      {
LABEL_24:
        double v110 = +[CKUIBehavior sharedBehaviors];
        double v111 = [v110 entryViewPlusButtonDefaultBackgroundColor];
        [(CKEntryViewPlusButton *)v86 setPlusButtonBackgroundColor:v111];

        [(CKEntryViewPlusButton *)v86 accessibilitySetIdentification:@"Apps Button"];
        [(CKEntryViewPlusButton *)v86 setExclusiveTouch:0];
        -[CKEntryViewPlusButton setBounds:](v86, "setBounds:", *v78, v78[1], v74, v74);
        if ([(CKMessageEntryView *)v29 shouldShowPluginButtons])
        {
          [(CKMessageEntryView *)v29 setPlusButton:v86];
          [(CKMessageEntryViewButtonContainerView *)v270 addSubview:v86];
        }

        goto LABEL_27;
      }
      double v95 = (void *)[objc_alloc(MEMORY[0x1E4F42B70]) initWithTarget:v29 action:sel_plusButtonLongPressed_];
      v103 = +[CKUIBehavior sharedBehaviors];
      [v103 entryViewPlusButtonLongPressDuration];
      double v105 = v104;

      [v95 setMinimumPressDuration:v105];
      double v106 = [(CKEntryViewPlusButton *)v86 button];
      [v106 addGestureRecognizer:v95];

      v107 = [MEMORY[0x1E4F432E0] defaultConfiguration];
      uint64_t v108 = [objc_alloc(MEMORY[0x1E4F42DD8]) initWithConfiguration:v107 view:v86];
      plusButtonFeedbackGenerator = v29->_plusButtonFeedbackGenerator;
      v29->_plusButtonFeedbackGenerator = (UISelectionFeedbackGenerator *)v108;
    }
    goto LABEL_24;
  }
LABEL_27:
  double v112 = +[CKUIBehavior sharedBehaviors];
  int v113 = [v112 entryViewSupportsBrowserButton];

  if (v113)
  {
    v114 = [v77[275] entryViewButtonOfType:2];
    int v115 = +[CKUIBehavior sharedBehaviors];
    int v116 = [v115 browserButtonShouldUseMenu];

    double v117 = [v114 button];
    double v118 = v117;
    if (v116)
    {
      v119 = [(CKMessageEntryView *)v29 entryViewTraitCollection];
      double v120 = [(CKMessageEntryView *)v29 conversation];
      double v121 = +[CKAppMenuDataSource appMenuWithTarget:v29 traitCollection:v119 conversation:v120];
      [v118 setMenu:v121];

      double v77 = &off_1E561D000;
      v122 = [v114 button];
      [v122 setContextMenuIsPrimary:1];

      double v118 = [v114 button];
      [v118 setContextMenuEnabled:1];
    }
    else
    {
      [v117 addTarget:v29 action:sel_browserButtonTapped_ forEvents:64];
    }

    [v114 setOpaque:0];
    [v114 setAccessibilityIdentifier:@"browserButton"];
    [v114 setExclusiveTouch:0];
    double v123 = *v78;
    double v124 = v78[1];
    v125 = [v114 button];
    double v126 = [v125 image];
    [v126 size];
    objc_msgSend(v114, "setBounds:", v123, v124, v127, v128);

    if ([(CKMessageEntryView *)v29 shouldShowPluginButtons]) {
      [(CKMessageEntryViewButtonContainerView *)v270 addSubview:v114];
    }
    [(CKMessageEntryView *)v29 setBrowserButton:v114];

    double v62 = v265;
  }
  if (CKIsRunningInMacCatalyst())
  {
    double v129 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v129 addObserver:v29 selector:sel_visiblePluginsChanged_ name:@"CKBrowserSelectionControllerVisibleSwitcherPluginsChangedNotification" object:0];
  }
  double v130 = +[CKUIBehavior sharedBehaviors];
  int v131 = [v130 isEntryViewCollapsable];

  if (v131)
  {
    double v132 = [v77[275] entryViewButtonOfType:1];
    double v133 = [v132 button];
    [v133 addTarget:v29 action:sel_arrowButtonTapped_ forEvents:64];

    [v132 setOpaque:0];
    [v132 setAccessibilityIdentifier:@"arrowExpandButton"];
    [v132 setExclusiveTouch:0];
    objc_msgSend(v132, "setBounds:", *v78, v78[1], 24.0, 24.0);
    [v132 setCkTintColor:0xFFFFFFFFLL];
    if ([(CKMessageEntryView *)v29 shouldShowPluginButtons])
    {
      v134 = [(CKMessageEntryView *)v29 buttonAndTextAreaContainerView];
      [v134 addSubview:v132];
    }
    [(CKMessageEntryView *)v29 setArrowButton:v132];
    double v135 = (void *)[objc_alloc(MEMORY[0x1E4F42E70]) initWithTarget:v29 action:sel_collapseGestureRecognized];
    [v135 setDirection:1];
    [v135 setDelegate:v29];
    [v132 addGestureRecognizer:v135];
  }
  id v136 = objc_alloc(MEMORY[0x1E4F42FF0]);
  double v137 = *MEMORY[0x1E4F1DB28];
  double v138 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v139 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v140 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v141 = objc_msgSend(v136, "initWithFrame:", *MEMORY[0x1E4F1DB28], v138, v139, v140);
  [v141 setOpaque:0];
  [v141 setClipsToBounds:1];
  double v142 = +[CKUIBehavior sharedBehaviors];
  [v142 entryViewCoverMinHeight];
  double v144 = v143 * 0.5;
  [v141 _setContinuousCornerRadius:v143 * 0.5];
  v266 = v142;
  [v142 entryFieldCoverLineWidth];
  double v146 = v145;
  v147 = [v141 layer];
  [v147 setBorderWidth:v146];

  v148 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v149 = [v148 isDashedBalloonsEnabled];

  if (v149)
  {
    id v150 = [MEMORY[0x1E4F39C88] layer];
    v151 = +[CKUIBehavior sharedBehaviors];
    v152 = [v151 theme];
    id v153 = [v152 entryFieldBorderColor];
    objc_msgSend(v150, "setStrokeColor:", objc_msgSend(v153, "CGColor"));

    [v150 setFillColor:0];
    [v150 setLineJoin:*MEMORY[0x1E4F3A478]];
    [v150 setLineCap:*MEMORY[0x1E4F3A458]];
    uint64_t v154 = [v266 entryViewDashedLinePattern];
    [v150 setLineDashPattern:v154];

    [v150 setLineWidth:0.0];
    [v150 setCornerRadius:v144];
    [v150 setCornerCurve:*MEMORY[0x1E4F39EA8]];
    [v150 setAllowsEdgeAntialiasing:1];
    v155 = [v141 layer];
    [v155 addSublayer:v150];

    [(CKMessageEntryView *)v29 setDashedContentClipViewLayer:v150];
  }
  v156 = [v141 layer];
  objc_msgSend(v156, "setAnchorPoint:", 1.0, 0.5);

  v157 = +[CKUIBehavior sharedBehaviors];
  v158 = [v157 theme];
  v159 = [v158 entryViewContentBackgroundColor];
  [v141 setBackgroundColor:v159];

  [(CKMessageEntryView *)v29 setContentClipView:v141];
  double v160 = [(CKMessageEntryView *)v29 buttonAndTextAreaContainerView];
  [v160 addSubview:v141];

  [(CKMessageEntryView *)v29 updateKnockoutView];
  double v161 = (void *)[objc_alloc(MEMORY[0x1E4F42E70]) initWithTarget:v29 action:sel_expandGestureRecongnized];
  [v161 setDirection:2];
  v259 = v161;
  [v141 addGestureRecognizer:v161];
  v162 = -[CKMessageEntryContentView initWithFrame:shouldShowSubject:shouldDisableAttachments:shouldUseNonEmojiKeyboard:shouldUseNonHandwritingKeyboard:shouldDisableKeyboardStickers:]([CKMessageEntryContentView alloc], "initWithFrame:shouldShowSubject:shouldDisableAttachments:shouldUseNonEmojiKeyboard:shouldUseNonHandwritingKeyboard:shouldDisableKeyboardStickers:", v16, a11, a12, a13, a14, v137, v138, v139, v140);
  BOOL v163 = +[CKUIBehavior sharedBehaviors];
  [v163 entryFieldCoverLineWidth];
  double v165 = v164;

  [(CKMessageEntryContentView *)v162 setContainerViewLineWidth:v165];
  char v166 = +[CKUIBehavior sharedBehaviors];
  [v166 sendButtonSize];
  double v168 = v167;
  double v169 = +[CKUIBehavior sharedBehaviors];
  [v169 entryViewSendButtonCoverSpace];
  [(CKMessageEntryContentView *)v162 setSendButtonTextInsetWidth:v168 + v170];

  [(CKMessageEntryContentView *)v162 setOpaque:0];
  [(CKMessageEntryContentView *)v162 setDelegate:v29];
  [(CKMessageEntryView *)v29 setContentView:v162];
  [v141 addSubview:v162];
  -[CKMessageEntryView coverFrameThatFitsInSize:](v29, "coverFrameThatFitsInSize:", v62, v267);
  double v271 = v162;
  [(CKMessageEntryContentView *)v162 setMaxContentWidthWhenExpanded:v171];
  double v172 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v137, v138, v139, v140);
  [v172 setAlpha:0.5];
  [v172 setUserInteractionEnabled:1];
  v173 = +[CKUIBehavior sharedBehaviors];
  v174 = [v173 balloonTextFont];
  [v172 setFont:v174];

  [(CKMessageEntryView *)v29 setCollpasedPlaceholderLabel:v172];
  [v141 addSubview:v172];
  double v268 = v172;
  id v261 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v29 action:sel_collapsedPlaceholderLabelTapped_];
  objc_msgSend(v172, "addGestureRecognizer:");
  uint64_t v175 = [(CKMessageEntryView *)v29 recorder];

  if (!v175)
  {
    v176 = objc_alloc_init(CKAudioRecorder);
    [(CKAudioRecorder *)v176 setDelegate:v29];
    [(CKMessageEntryView *)v29 setRecorder:v176];
  }
  [(CKMessageEntryView *)v29 configureForDisplayMode:1];
  if ([(CKMessageEntryView *)v29 shouldShowCharacterCount])
  {
    v177 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v137, v138, v139, v140);
    double v178 = v177;
    if (v273) {
      uint64_t v179 = 1;
    }
    else {
      uint64_t v179 = 2;
    }
    [v177 setTextAlignment:v179];
    double v180 = [(CKMessageEntryView *)v29 conversation];
    int v181 = [v180 isStewieConversation];

    v182 = +[CKUIBehavior sharedBehaviors];
    BOOL v183 = v182;
    if (v181) {
      [v182 characterCountSatelliteFont];
    }
    else {
    double v184 = [v182 characterCountFont];
    }

    [v178 setFont:v184];
    double v185 = +[CKUIBehavior sharedBehaviors];
    v186 = [v185 theme];
    int v187 = [v186 entryFieldPlaceholderColor];
    [v178 setTextColor:v187];

    [v178 setBackgroundColor:0];
    [v178 setOpaque:0];
    [v178 setHidden:1];
    [(CKMessageEntryView *)v29 setCharacterCountLabel:v178];
    double v188 = [(CKMessageEntryView *)v29 buttonAndTextAreaContainerView];
    [v188 addSubview:v178];

    v189 = sMaximumCharacterCountString(v256);
    [v178 setText:v189];

    objc_msgSend(v178, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    -[CKMessageEntryView setCharacterCountSize:](v29, "setCharacterCountSize:");
    [v178 setText:0];
    [(CKMessageEntryView *)v29 setCharacterCountHidden:1];
  }
  if ([(CKMessageEntryView *)v29 shouldShowSendButton]
    && !CKIsRunningInMacCatalyst())
  {
    v190 = +[CKEntryViewButton entryViewButtonOfType:4 wantsVibrancy:0];
    [v190 setOpaque:0];
    [v190 setEnabled:0];
    v191 = [v190 button];
    [v191 addTarget:v29 action:sel_touchUpInsideSendButton_ forControlEvents:64];

    v192 = [v190 button];
    [v192 setDisabledDimsImage:1];

    [v190 accessibilitySetIdentification:@"sendButton"];
    [v190 setExclusiveTouch:1];
    v193 = [v190 layer];
    objc_msgSend(v193, "setAnchorPoint:", 1.0, 1.0);

    [v190 setAccessibilityLabel:@"Send Button"];
    [(CKMessageEntryView *)v29 setSendButton:v190];
    v194 = [(CKMessageEntryView *)v29 contentClipView];
    [v194 addSubview:v190];

    double v195 = +[CKEntryViewButton entryViewButtonOfType:5 wantsVibrancy:0];
    [v195 setOpaque:0];
    [v195 accessibilitySetIdentification:@"audioButton"];
    [v195 setExclusiveTouch:1];
    double v196 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v197 = [v196 isAudioMessagesEntryViewRecordingEnabled];

    if (v197)
    {
      v198 = (void *)[objc_alloc(MEMORY[0x1E4F42B70]) initWithTarget:v29 action:sel_audioButtonLongPressed_];
      [v198 setMinimumPressDuration:0.0];
      v199 = [v195 button];
      [v199 addGestureRecognizer:v198];
    }
    else
    {
      v198 = +[CKUIBehavior sharedBehaviors];
      objc_msgSend(v195, "setCkTintColor:", objc_msgSend(v198, "entryViewButtonDefaultColor"));
    }

    [(CKMessageEntryView *)v29 setAudioButton:v195];
    v200 = [(CKMessageEntryView *)v29 contentClipView];
    [v200 addSubview:v195];

    v201 = +[CKUIBehavior sharedBehaviors];
    [v201 sendButtonSize];
    double v203 = v202;
    v204 = +[CKUIBehavior sharedBehaviors];
    [v204 sendButtonSize];
    double v206 = v205;

    -[CKMessageEntryView setSendButtonSize:](v29, "setSendButtonSize:", v203, v206);
  }
  v207 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v208 = [v207 isAudioMessagesEntryViewRecordingEnabled];

  if (v208)
  {
    v209 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v137, v138, v139, v140);
    [v209 setNumberOfLines:0];
    v210 = CKFrameworkBundle();
    id v211 = [v210 localizedStringForKey:@"AUDIO_HINT_TAP" value:&stru_1EDE4CA38 table:@"ChatKit"];
    [v209 setText:v211];

    [v209 setHidden:1];
    [v209 setTextAlignment:1];
    v212 = +[CKUIBehavior sharedBehaviors];
    v213 = [v212 audioHintFont];
    [v209 setFont:v213];

    [v209 setAdjustsFontSizeToFitWidth:1];
    v214 = +[CKUIBehavior sharedBehaviors];
    v215 = [v214 theme];
    int v216 = [v215 transcriptTextColor];
    [v209 setTextColor:v216];

    [v209 setOpaque:0];
    [(CKMessageEntryView *)v29 setAudioHintLabel:v209];
    v217 = [(CKMessageEntryView *)v29 contentClipView];
    [v217 addSubview:v209];
  }
  uint64_t v218 = [(CKMessageEntryView *)v29 createDictationButton];
  [(CKMessageEntryView *)v29 setDictationButton:v218];
  v219 = [(CKMessageEntryView *)v29 contentClipView];
  v257 = (void *)v218;
  [v219 addSubview:v218];

  v220 = (void *)[objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
  [(CKMessageEntryView *)v29 setSendButtonSpinner:v220];

  int v221 = [(CKMessageEntryView *)v29 sendButtonSpinner];
  [v221 setUserInteractionEnabled:1];

  v222 = [(CKMessageEntryView *)v29 sendButtonSpinner];
  [v222 setOpaque:0];

  if (CKIsRunningInMacCatalyst())
  {
    v223 = [MEMORY[0x1E4F427E0] buttonWithType:0];
    v224 = +[CKUIBehavior sharedBehaviors];
    v225 = [v224 entryViewMacEmojiButtonImage];
    [v223 setImage:v225 forState:0];

    v226 = [MEMORY[0x1E4F42A98] configurationWithPointSize:3 weight:3 scale:16.0];
    [v223 setPreferredSymbolConfiguration:v226 forImageInState:0];

    [v223 addTarget:v29 action:sel_showEmojiPicker forControlEvents:64];
    v227 = +[CKUIBehavior sharedBehaviors];
    v228 = [v227 theme];
    v229 = [v228 entryFieldButtonColor];
    [v223 setTintColor:v229];

    [v223 setAdjustsImageWhenHighlighted:1];
    [(CKMessageEntryView *)v29 setEmojiButton:v223];
    v230 = [(CKMessageEntryView *)v29 buttonAndTextAreaContainerView];
    v231 = [(CKMessageEntryView *)v29 emojiButton];
    [v230 addSubview:v231];

    v232 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    LODWORD(v231) = [v232 isAudioMessagesEntryViewRecordingEnabled];

    id v233 = +[CKEntryViewButton entryViewButtonOfType:5 wantsVibrancy:v231 ^ 1];
    [v233 setOpaque:0];
    [v233 accessibilitySetIdentification:@"audioButton"];
    [v233 setExclusiveTouch:1];
    v234 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    LODWORD(v229) = [v234 isAudioMessagesEntryViewRecordingEnabled];

    v235 = [v233 button];
    v236 = v235;
    id v237 = v272;
    if (v229)
    {
      [v235 addTarget:v29 action:sel_audioButtonTappedInEntryView_ forControlEvents:64];

      [v233 setCkTintColor:0xFFFFFFFFLL];
    }
    else
    {
      [v235 addTarget:v29 action:sel_audioButtonTapped_ forControlEvents:64];

      [v233 setCkTintColor:0xFFFFFFFFLL];
      v238 = +[CKEntryViewButton entryViewButtonOfType:7 wantsVibrancy:0];
      v239 = [v238 button];
      objc_msgSend(v239, "setImageEdgeInsets:", *MEMORY[0x1E4F437F8], *(double *)(MEMORY[0x1E4F437F8] + 8), *(double *)(MEMORY[0x1E4F437F8] + 16), *(double *)(MEMORY[0x1E4F437F8] + 24));

      v240 = [v238 button];
      [v240 addTarget:v29 action:sel_stopButtonTapped_ forControlEvents:64];

      [v238 setCkTintColor:3];
      [(CKMessageEntryView *)v29 setStopButton:v238];
    }
    [(CKMessageEntryView *)v29 setAudioButton:v233];
    v241 = [(CKMessageEntryView *)v29 contentClipView];
    [v241 addSubview:v233];

    v242 = [(CKMessageEntryView *)v29 contentView];
    v243 = [(CKMessageEntryView *)v29 sendButtonSpinner];
    [v242 addSubview:v243];
  }
  else
  {
    v223 = [(CKMessageEntryView *)v29 buttonAndTextAreaContainerView];
    id v233 = [(CKMessageEntryView *)v29 sendButtonSpinner];
    [v223 addSubview:v233];
    id v237 = v272;
  }

  v244 = (void *)MEMORY[0x1E4F42AF8];
  v245 = objc_msgSend(NSString, "stringWithFormat:", @"%C", 3);
  v246 = [v244 keyCommandWithInput:v245 modifierFlags:0 action:sel_keyCommandSend_];

  [v246 setWantsPriorityOverSystemBehavior:1];
  v247 = [MEMORY[0x1E4F42AF8] keyCommandWithInput:@"\r" modifierFlags:0 action:sel_keyCommandSend_];
  [v247 setWantsPriorityOverSystemBehavior:1];
  id v248 = [MEMORY[0x1E4F42AF8] keyCommandWithInput:@"\r" modifierFlags:0x10000 action:sel_keyCommandSend_];
  [v248 setWantsPriorityOverSystemBehavior:1];
  v249 = [MEMORY[0x1E4F42AF8] keyCommandWithInput:*MEMORY[0x1E4F43A80] modifierFlags:0x80000 action:sel_optionUpArrowClicked_];
  [v249 setWantsPriorityOverSystemBehavior:1];
  v250 = [MEMORY[0x1E4F42AF8] keyCommandWithInput:*MEMORY[0x1E4F439D8] modifierFlags:0x80000 action:sel_optionDownArrowClicked_];
  [v250 setWantsPriorityOverSystemBehavior:1];
  v275[0] = v246;
  v275[1] = v247;
  v275[2] = v248;
  v275[3] = v249;
  v275[4] = v250;
  int v251 = [MEMORY[0x1E4F1C978] arrayWithObjects:v275 count:5];
  [(CKMessageEntryView *)v29 setKeyCommands:v251];
  [(CKMessageEntryView *)v29 setEntryViewTraitCollection:v237];
  v252 = +[CKUIBehavior sharedBehaviors];
  int v253 = [v252 isAccessibilityPreferredContentSizeCategory];

  if (v253) {
    [(CKMessageEntryView *)v29 setEntryFieldCollapsed:0 animated:0];
  }
  v254 = (void *)[objc_alloc(MEMORY[0x1E4F42E70]) initWithTarget:v29 action:sel__swipeDownGestureRecognized_];
  [v254 setDelegate:v29];
  [v254 setDirection:8];
  [(CKMessageEntryView *)v29 addGestureRecognizer:v254];
  [(CKMessageEntryView *)v29 setSwipeGestureRecognizer:v254];

  id v28 = v272;
LABEL_69:

  return v29;
}

- (id)createDictationButton
{
  double v3 = +[CKEntryViewButton entryViewButtonOfType:8 wantsVibrancy:0];
  [v3 setCkTintColor:0xFFFFFFFFLL];
  [v3 setEnabled:1];
  [v3 setOpaque:0];
  [v3 accessibilitySetIdentification:@"dictationButton"];
  uint64_t v4 = [v3 button];
  [(id)v4 addTarget:self action:sel_dictationButtonTapped_ forControlEvents:64];

  double v5 = [v3 button];
  [v5 setDisabledDimsImage:1];

  double v6 = [v3 button];
  LOBYTE(v4) = objc_opt_respondsToSelector();

  if (v4)
  {
    double v7 = [v3 button];
    [v7 _setIsMicButton:1];
  }

  return v3;
}

- (CKEntryViewButton)keyboardButton
{
  keyboardButton = self->_keyboardButton;
  if (!keyboardButton)
  {
    uint64_t v4 = +[CKEntryViewButton entryViewButtonOfType:9 wantsVibrancy:0];
    [(CKEntryViewButton *)v4 setCkTintColor:0xFFFFFFFFLL];
    [(CKEntryViewButton *)v4 setEnabled:1];
    [(CKEntryViewButton *)v4 setOpaque:0];
    [(CKEntryViewButton *)v4 accessibilitySetIdentification:@"keyboardButton"];
    double v5 = [(CKEntryViewButton *)v4 button];
    [v5 addTarget:self action:sel_keyboardButtonTapped_ forControlEvents:64];

    double v6 = [(CKEntryViewButton *)v4 button];
    [v6 setDisabledDimsImage:1];

    double v7 = self->_keyboardButton;
    self->_keyboardButton = v4;

    keyboardButton = self->_keyboardButton;
  }

  return keyboardButton;
}

- (void)optionUpArrowClicked:(id)a3
{
  uint64_t v4 = [(CKMessageEntryView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CKMessageEntryView *)self delegate];
    [v6 messageEntryViewPopulatePreviousSentMessage:self];
  }
}

- (void)optionDownArrowClicked:(id)a3
{
  uint64_t v4 = [(CKMessageEntryView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CKMessageEntryView *)self delegate];
    [v6 messageEntryViewPopulateNextSentMessage:self];
  }
}

- (void)showEffectPicker
{
  double v3 = [(CKMessageEntryView *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(CKMessageEntryView *)self delegate];
    [v5 messageEntryViewWantsEffectPicker:self];
  }
}

- (void)handleLongPress:(id)a3
{
  if ([a3 state] == 1 && !-[CKMessageEntryView hasRecording](self, "hasRecording"))
  {
    [(CKMessageEntryView *)self showEffectPicker];
  }
}

- (void)deferredSetup
{
  uint64_t v2 = (void *)MEMORY[0x1E4F42B08];
  BOOL v3 = CKShowAppStripInEntryView();

  [v2 setPredictionViewPrewarmsPredictiveCandidates:v3];
}

- (void)updateKnockoutView
{
  BOOL v3 = +[CKUIBehavior sharedBehaviors];
  int v4 = [v3 entryViewBackgroundShouldUseVariableBlur];

  id v5 = [(CKMessageEntryView *)self knockoutView];

  if (!v5)
  {
    if (v4)
    {
      id v13 = objc_alloc(MEMORY[0x1E4F43028]);
      [(CKMessageEntryView *)self bounds];
      BOOL v14 = (UIVisualEffectView *)objc_msgSend(v13, "initWithFrame:");
      knockoutVisualEffectView = self->_knockoutVisualEffectView;
      self->_knockoutVisualEffectView = v14;

      BOOL v16 = self->_knockoutVisualEffectView;
    }
    else
    {
      BOOL v16 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    }
    BOOL v17 = v16;
    BOOL v18 = [(CKMessageEntryView *)self contentClipView];
    [v18 insertSubview:v17 atIndex:0];

    [(CKMessageEntryView *)self setKnockoutView:v17];
    if (v4) {
      goto LABEL_3;
    }
LABEL_8:
    if (UIAccessibilityIsReduceTransparencyEnabled()
      || (+[CKUIBehavior sharedBehaviors],
          double v19 = objc_claimAutoreleasedReturnValue(),
          char v20 = [v19 knockoutViewShouldUseBackgroundColor],
          v19,
          (v20 & 1) == 0))
    {
      id v25 = [(CKMessageEntryView *)self knockoutView];
      [v25 setBackgroundColor:0];
    }
    else
    {
      if (CKMessageEntryViewStyleIsForDarkFullscreenMoment([(CKMessageEntryView *)self style])) {
        [MEMORY[0x1E4F428B8] blackColor];
      }
      else {
      double v21 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
      }
      double v22 = [(CKMessageEntryView *)self entryViewTraitCollection];
      double v23 = [v21 resolvedColorForTraitCollection:v22];

      id v25 = [v23 colorWithAlphaComponent:0.300000012];

      double v24 = [(CKMessageEntryView *)self knockoutView];
      [v24 setBackgroundColor:v25];
    }
    goto LABEL_15;
  }
  if (!v4) {
    goto LABEL_8;
  }
LABEL_3:
  id v6 = +[CKUIBehavior sharedBehaviors];
  double v7 = [v6 theme];
  id v25 = [v7 messageEntryViewTextFieldBackgroundColor];

  double v8 = [(CKMessageEntryView *)self entryViewTraitCollection];
  double v9 = [v25 resolvedColorForTraitCollection:v8];

  [(UIVisualEffectView *)self->_knockoutVisualEffectView setBackgroundColor:v9];
  double v10 = +[CKUIBehavior sharedBehaviors];
  double v11 = [v10 theme];
  uint64_t v12 = [v11 messageEntryViewTextFieldBackgroundEffects];
  [(UIVisualEffectView *)self->_knockoutVisualEffectView setBackgroundEffects:v12];

LABEL_15:
}

- (void)updateBackgroundView
{
  BOOL v3 = +[CKUIBehavior sharedBehaviors];
  int v4 = [v3 entryFieldShouldUseBackdropView];

  if (v4)
  {
    if (!self->_backgroundView)
    {
      id v5 = +[CKUIBehavior sharedBehaviors];
      id v6 = (objc_class *)[v5 entryViewBackgroundClass];

      double v7 = (CKMessageEntryBackgroundViewProtocol *)objc_alloc_init(v6);
      backgroundView = self->_backgroundView;
      self->_backgroundView = v7;

      double v9 = [(CKMessageEntryView *)self buttonAndTextAreaContainerView];
      [v9 addSubview:self->_backgroundView];
    }
    double v10 = [(CKMessageEntryView *)self entryViewTraitCollection];
    [(CKMessageEntryBackgroundViewProtocol *)self->_backgroundView setEntryViewTraitCollection:v10];

    int64_t v11 = [(CKMessageEntryView *)self style];
    uint64_t v12 = self->_backgroundView;
    [(CKMessageEntryBackgroundViewProtocol *)v12 setStyle:v11];
  }
}

- (BOOL)shouldReloadBackgroundView
{
  uint64_t v2 = [(CKMessageEntryView *)self backgroundView];
  uint64_t v3 = objc_opt_class();

  int v4 = +[CKUIBehavior sharedBehaviors];
  uint64_t v5 = [v4 entryViewBackgroundClass];

  return v3 != v5;
}

- (void)setShouldHideBackgroundView:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CKMessageEntryView *)self backgroundView];
  [v4 setHidden:v3];
}

- (BOOL)shouldHideBackgroundView
{
  uint64_t v2 = [(CKMessageEntryView *)self backgroundView];
  char v3 = [v2 isHidden];

  return v3;
}

- (void)setStyle:(int64_t)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if (self->_style == 6 && IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Message entry view doesn't support transitioning from CKMessageEntryViewStyleNotificationDarkTransparent", buf, 2u);
    }
  }
  self->_int64_t style = a3;
  [(CKMessageEntryView *)self _overrideUserInterfaceStyleForEntryViewStyleIfNeeded:a3];
  id v6 = [(CKMessageEntryView *)self contentView];
  [v6 setStyle:self->_style];

  if (IMOSLoggingEnabled())
  {
    double v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v51 = a3;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Returned from -[CKMessageEntryContentView setStyle:]. style={%d}", buf, 8u);
    }
  }
  BOOL v8 = CKMessageEntryViewStyleIsForDarkFullscreenMoment([(CKMessageEntryView *)self style]);
  double v9 = [(CKMessageEntryView *)self inputButtonContainerView];
  double v10 = +[CKUIBehavior sharedBehaviors];
  int64_t v11 = [v10 theme];
  uint64_t v12 = v11;
  if (v8)
  {
    id v13 = [v11 entryFieldDarkEffectButtonColor];
    [v9 setTintColor:v13];

    BOOL v14 = [(CKMessageEntryView *)self appStrip];
    uint64_t v15 = [v14 appStripLayout];
    [v15 setShouldDimPluginCells:1];

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    BOOL v16 = [(CKMessageEntryView *)self appStrip];
    BOOL v17 = [v16 appStripCollectionView];
    BOOL v18 = [v17 visibleCells];

    uint64_t v19 = [v18 countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v45 != v20) {
            objc_enumerationMutation(v18);
          }
          double v22 = [*(id *)(*((void *)&v44 + 1) + 8 * i) browserImage];
          double v23 = [v22 layer];
          double v24 = +[CKUIBehavior sharedBehaviors];
          id v25 = [v24 theme];
          [v25 browserAppStripDimmedPluginCellOpacity];
          *(float *)&double v26 = v26;
          [v23 setOpacity:v26];
        }
        uint64_t v19 = [v18 countByEnumeratingWithState:&v44 objects:v49 count:16];
      }
      while (v19);
    }
  }
  else
  {
    double v27 = [v11 entryFieldButtonColor];
    [v9 setTintColor:v27];

    id v28 = [(CKMessageEntryView *)self appStrip];
    double v29 = [v28 appStripLayout];
    [v29 setShouldDimPluginCells:0];

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    double v30 = [(CKMessageEntryView *)self appStrip];
    double v31 = [v30 appStripCollectionView];
    BOOL v18 = [v31 visibleCells];

    uint64_t v32 = [v18 countByEnumeratingWithState:&v40 objects:v48 count:16];
    if (v32)
    {
      uint64_t v33 = *(void *)v41;
      do
      {
        for (uint64_t j = 0; j != v32; ++j)
        {
          if (*(void *)v41 != v33) {
            objc_enumerationMutation(v18);
          }
          double v35 = [*(id *)(*((void *)&v40 + 1) + 8 * j) browserImage];
          double v36 = [v35 layer];
          BOOL v37 = +[CKUIBehavior sharedBehaviors];
          BOOL v38 = [v37 theme];
          [v38 browserAppStripLightPluginCellOpacity];
          *(float *)&double v39 = v39;
          [v36 setOpacity:v39];
        }
        uint64_t v32 = [v18 countByEnumeratingWithState:&v40 objects:v48 count:16];
      }
      while (v32);
    }
  }

  [(CKMessageEntryView *)self configureTextViewWithInputContextHistoryFromTranscript];
  [(CKMessageEntryView *)self updateEntryView];
}

- (void)_overrideUserInterfaceStyleForEntryViewStyleIfNeeded:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [(CKMessageEntryView *)self entryViewTraitCollection];
      double v7 = [v6 description];
      int v15 = 138412290;
      BOOL v16 = v7;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Call to _overrideUserInterfaceStyleForEntryViewStyleIfNeeded. entryViewTraitCollection: {%@}", (uint8_t *)&v15, 0xCu);
    }
  }
  BOOL v8 = [(CKMessageEntryView *)self entryViewTraitCollection];
  uint64_t v9 = [v8 userInterfaceStyle];

  uint64_t v10 = 2;
  if (((0x27u >> (a3 - 1)) & 1) == 0) {
    uint64_t v10 = v9;
  }
  if ((unint64_t)(a3 - 1) >= 6) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = v10;
  }
  [(CKMessageEntryView *)self _setOverrideUserInterfaceStyle:v11];
  uint64_t v12 = [(CKMessageEntryView *)self appStripBackgroundBlurView];

  if (v12)
  {
    if (v11 == 1) {
      uint64_t v13 = 3901;
    }
    else {
      uint64_t v13 = 2030;
    }
    BOOL v14 = [(CKMessageEntryView *)self appStripBackgroundBlurView];
    [v14 transitionToStyle:v13];
  }
  [(CKMessageEntryView *)self setNeedsLayout];
}

- (void)setConversation:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (CKConversation *)a3;
  if (self->_conversation != v5)
  {
    objc_storeStrong((id *)&self->_conversation, a3);
    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 removeObserver:self name:@"CKConversationPreferredServiceChangedNotification" object:0];
    uint64_t v7 = *MEMORY[0x1E4F6B9A8];
    [v6 removeObserver:self name:*MEMORY[0x1E4F6B9A8] object:0];
    uint64_t v8 = *MEMORY[0x1E4F6B888];
    [v6 removeObserver:self name:*MEMORY[0x1E4F6B888] object:0];
    uint64_t v9 = *MEMORY[0x1E4F6BAA8];
    [v6 removeObserver:self name:*MEMORY[0x1E4F6BAA8] object:0];
    [v6 removeObserver:self name:*MEMORY[0x1E4F43E60] object:0];
    if (v5)
    {
      [v6 addObserver:self selector:sel_conversationPreferredServiceChanged_ name:@"CKConversationPreferredServiceChangedNotification" object:v5];
      uint64_t v10 = [(CKConversation *)v5 chat];
      [v6 addObserver:self selector:sel_messageReceived_ name:v7 object:v10];

      uint64_t v11 = [(CKConversation *)v5 chat];
      [v6 addObserver:self selector:sel__contactLimitsChanged_ name:v8 object:v11];

      [v6 addObserver:self selector:sel_updateEntryView name:v9 object:0];
      [v6 addObserver:self selector:sel_updateEntryView name:*MEMORY[0x1E4F6E340] object:0];
      [v6 addObserver:self selector:sel_interruptAudioRecorder_ name:*MEMORY[0x1E4F15000] object:0];
      uint64_t v12 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      LODWORD(v11) = [v12 isCarrierPigeonEnabled];

      if (v11) {
        [v6 addObserver:self selector:sel_updateEntryView name:*MEMORY[0x1E4F6BA80] object:0];
      }
      if (!IMOSLoggingEnabled()) {
        goto LABEL_13;
      }
      uint64_t v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v16 = 138412290;
        uint64_t v17 = v5;
        _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "Conversation was provided: %@. Added core observers.", (uint8_t *)&v16, 0xCu);
      }
    }
    else
    {
      if (!IMOSLoggingEnabled())
      {
LABEL_13:
        [(CKMessageEntryView *)self updateEntryView];
        [(CKMessageEntryView *)self updateAppsMenu];
        BOOL v14 = [(CKMessageEntryView *)self audioRecordingView];
        int v15 = [v14 sendButton];
        objc_msgSend(v15, "setEnabled:", -[CKMessageEntryView sendButtonEnabled](self, "sendButtonEnabled"));

        [(CKMessageEntryView *)self configureTextViewWithInputContextHistoryFromTranscript];
        goto LABEL_14;
      }
      uint64_t v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "Conversation was nil. Did not add core observers.", (uint8_t *)&v16, 2u);
      }
    }

    goto LABEL_13;
  }
LABEL_14:
}

- (void)invalidateCompositionForReason:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v16 = 134217984;
      int64_t v17 = a3;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "invalidating composition for reason: %ld", (uint8_t *)&v16, 0xCu);
    }
  }
  switch(a3)
  {
    case 2:
      id v6 = [(CKMessageEntryView *)self composition];
      uint64_t v7 = [CKComposition alloc];
      uint64_t v8 = [v6 text];
      uint64_t v9 = [v6 subject];
      uint64_t v10 = [(CKComposition *)v7 initWithText:v8 subject:v9 shelfPluginPayload:0];

      uint64_t v11 = [v6 sendLaterPluginInfo];
      [(CKComposition *)v10 setSendLaterPluginInfo:v11];

      [(CKMessageEntryView *)self setComposition:v10];
      break;
    case 1:
      uint64_t v12 = [(CKMessageEntryView *)self composition];
      uint64_t v13 = [[CKComposition alloc] initWithText:0 subject:0];
      BOOL v14 = [v12 sendLaterPluginInfo];
      [(CKComposition *)v13 setSendLaterPluginInfo:v14];

      [(CKMessageEntryView *)self setComposition:v13];
      int v15 = [(CKMessageEntryView *)self contentView];
      [v15 hideTextEffectsPickerIfNeededAndResetTypingAttributes];

      break;
    case 0:
      [(CKMessageEntryView *)self setComposition:0];
      break;
  }
}

- (void)setComposition:(id)a3
{
  id v5 = a3;
  if ([v5 isAudioComposition])
  {
    [(CKMessageEntryView *)self setAudioComposition:v5];
  }
  else
  {
    [(CKMessageEntryView *)self setAudioComposition:0];
    id v4 = [(CKMessageEntryView *)self contentView];
    [v4 setComposition:v5];
  }
}

- (CKComposition)composition
{
  char v3 = [(CKMessageEntryView *)self audioComposition];
  if (!v3)
  {
    id v4 = [(CKMessageEntryView *)self contentView];
    char v3 = [v4 composition];
  }

  return (CKComposition *)v3;
}

- (void)compositionWithAcceptedAutocorrection:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  id v5 = [(CKMessageEntryView *)self composition];
  int v6 = [v5 isAudioComposition];

  if (v6)
  {
    if (v4)
    {
      uint64_t v7 = [(CKMessageEntryView *)self composition];
      v4[2](v4, v7);
    }
  }
  else
  {
    uint64_t v8 = [(CKMessageEntryView *)self contentView];
    uint64_t v9 = [(CKMessageEntryView *)self conversation];
    uint64_t v10 = [v9 chat];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __60__CKMessageEntryView_compositionWithAcceptedAutocorrection___block_invoke;
    v11[3] = &unk_1E5622750;
    v11[4] = self;
    uint64_t v12 = v4;
    [v8 acceptAutocorrectionForChat:v10 completionHandler:v11];
  }
}

void __60__CKMessageEntryView_compositionWithAcceptedAutocorrection___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) contentView];
  char v3 = [v2 textView];
  [v3 acceptAutomaticMentionConfirmation];

  id v4 = [*(id *)(a1 + 32) composition];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    int v6 = v4;
    (*(void (**)(void))(v5 + 16))();
    id v4 = v6;
  }
}

- (CKSendLaterPluginInfo)sendLaterPluginInfo
{
  uint64_t v2 = [(CKMessageEntryView *)self contentView];
  char v3 = [v2 sendLaterPluginInfo];

  return (CKSendLaterPluginInfo *)v3;
}

- (void)setSendLaterPluginInfo:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(CKMessageEntryView *)self contentView];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__CKMessageEntryView_setSendLaterPluginInfo_animated___block_invoke;
  v8[3] = &unk_1E5620C40;
  v8[4] = self;
  [v7 setSendLaterPluginInfo:v6 animated:v4 completionHandler:v8];
}

uint64_t __54__CKMessageEntryView_setSendLaterPluginInfo_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateEntryView];
}

- (void)setCharacterCountHidden:(BOOL)a3
{
  if (self->_characterCountHidden != a3)
  {
    self->_characterCountHidden = a3;
    if ([(CKMessageEntryView *)self shouldShowCharacterCount])
    {
      [(CKMessageEntryView *)self setNeedsLayout];
    }
  }
}

- (BOOL)isInPencilMode
{
  uint64_t v2 = [(CKMessageEntryView *)self contentView];
  char v3 = [v2 textView];
  if ([v3 isInPencilMode])
  {
    char v4 = 1;
  }
  else
  {
    uint64_t v5 = [v2 subjectView];
    char v4 = [v5 isInPencilMode];
  }
  return v4;
}

- (BOOL)isRecording
{
  uint64_t v2 = [(CKMessageEntryView *)self recorder];
  char v3 = [v2 isRecording];

  return v3;
}

- (BOOL)hasRecording
{
  char v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isAudioMessagesEntryViewRecordingEnabled];

  if (!v4) {
    return [(CKMessageEntryView *)self displayMode] == 3;
  }
  uint64_t v5 = [(CKMessageEntryView *)self audioComposition];
  BOOL v6 = v5 != 0;

  return v6;
}

- (BOOL)layoutIsCurrentlyCompact
{
  char v3 = [(CKMessageEntryView *)self contentClipView];
  [v3 frame];
  double v5 = v4;
  BOOL v6 = [(CKMessageEntryView *)self contentView];
  [v6 frame];
  BOOL v8 = v5 < v7;

  return v8;
}

- (BOOL)shouldEntryViewBeExpandedLayout
{
  char v3 = +[CKUIBehavior sharedBehaviors];
  int v4 = [v3 isEntryViewCollapsable];

  if (!v4) {
    return 1;
  }
  if ([(CKMessageEntryView *)self entryFieldCollapsed]) {
    return 0;
  }
  BOOL v6 = [(CKMessageEntryView *)self composition];
  double v7 = [v6 shelfPluginPayload];

  if (v7) {
    return 1;
  }
  uint64_t v9 = [(CKMessageEntryView *)self contentView];
  uint64_t v10 = [v9 textView];

  [v10 frame];
  double Width = CGRectGetWidth(v30);
  char v12 = [v10 isInPencilMode];
  char v13 = [v10 isPencilWriting];
  BOOL v14 = [v10 attributedText];
  int v15 = v14;
  char v16 = v12 ^ 1 | v13;
  if ((v16 & 1) == 0)
  {
    uint64_t v17 = __53__CKMessageEntryView_shouldEntryViewBeExpandedLayout__block_invoke((uint64_t)v14, v14, v10);

    int v15 = (void *)v17;
  }
  [v15 size];
  double v19 = v18;
  if ([(CKMessageEntryView *)self layoutIsCurrentlyCompact]) {
    double v20 = 0.8;
  }
  else {
    double v20 = 0.45;
  }
  if (v19 <= Width * v20)
  {
    if ([(CKMessageEntryView *)self shouldShowSubject])
    {
      double v21 = [(CKMessageEntryView *)self contentView];
      double v22 = [v21 subjectView];

      [v22 frame];
      double v23 = CGRectGetWidth(v31);
      double v24 = [v22 attributedText];
      id v25 = v24;
      if ((v16 & 1) == 0)
      {
        uint64_t v26 = __53__CKMessageEntryView_shouldEntryViewBeExpandedLayout__block_invoke((uint64_t)v24, v24, v22);

        id v25 = (void *)v26;
      }
      [v25 size];
      double v28 = v27;
      if ([(CKMessageEntryView *)self layoutIsCurrentlyCompact]) {
        double v29 = 0.8;
      }
      else {
        double v29 = 0.45;
      }
      BOOL v5 = v28 > v23 * v29;
    }
    else
    {
      BOOL v5 = 0;
    }
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

id __53__CKMessageEntryView_shouldEntryViewBeExpandedLayout__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v17 = 0;
  double v18 = &v17;
  uint64_t v19 = 0x3032000000;
  double v20 = __Block_byref_object_copy__44;
  double v21 = __Block_byref_object_dispose__44;
  id v22 = 0;
  uint64_t v6 = [v4 length];
  uint64_t v7 = *MEMORY[0x1E4FB06B8];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__CKMessageEntryView_shouldEntryViewBeExpandedLayout__block_invoke_345;
  v13[3] = &unk_1E5629368;
  id v8 = v5;
  id v14 = v8;
  char v16 = &v17;
  id v9 = v4;
  id v15 = v9;
  objc_msgSend(v9, "enumerateAttribute:inRange:options:usingBlock:", v7, 0, v6, 0, v13);
  uint64_t v10 = (void *)v18[5];
  if (!v10) {
    uint64_t v10 = v9;
  }
  id v11 = v10;

  _Block_object_dispose(&v17, 8);

  return v11;
}

void __53__CKMessageEntryView_shouldEntryViewBeExpandedLayout__block_invoke_345(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (([*(id *)(a1 + 32) _isSystemAttachment:a2] & 1) == 0)
  {
    uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (!v7)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F28E48]);
      uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    }
    objc_msgSend(*(id *)(a1 + 40), "attributedSubstringFromRange:", a3, a4);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    [v7 appendAttributedString:v11];
  }
}

- (void)setEntryFieldCollapsed:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (a3
    && (+[CKUIBehavior sharedBehaviors],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 isEntryViewCollapsable],
        v7,
        (v8 & 1) == 0))
  {
    if (IMOSLoggingEnabled())
    {
      char v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v14 = 0;
        _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "Entry view was asked to collapse when it isn't allowed by UIBehavior.", v14, 2u);
      }
    }
  }
  else
  {
    uint64_t v9 = [(CKMessageEntryView *)self entryFieldCollapsedUpdater];
    char v10 = [v9 isHoldingUpdates];

    if ((v10 & 1) == 0)
    {
      [(CKMessageEntryView *)self setEntryFieldUpdaterCollapsedValue:v5];
      [(CKMessageEntryView *)self setEntryFieldUpdaterAnimatedValue:v4];
      id v11 = [(CKMessageEntryView *)self entryFieldCollapsedUpdater];
      [v11 setNeedsUpdate];

      char v12 = [(CKMessageEntryView *)self audioComposition];
      if (v12)
      {
      }
      else if (![(CKMessageEntryView *)self isRecording])
      {
        [(CKMessageEntryView *)self configureForDisplayMode:1];
      }
    }
  }
}

- (id)_currentInputDelegate
{
  char v3 = [(CKMessageEntryView *)self contentView];
  BOOL v4 = [v3 activeView];

  BOOL v5 = [(CKMessageEntryView *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [v5 textViewOnscreenWithEntryView];
    if ([v6 isFirstResponder])
    {
      id v7 = v6;

      BOOL v4 = v7;
    }
  }

  return v4;
}

- (BOOL)shouldShowAppStrip
{
  return self->_showAppStrip;
}

- (void)setShouldBlurForMessageEditing:(BOOL)a3
{
  if (self->_shouldBlurForMessageEditing != a3)
  {
    self->_shouldBlurForMessageEditing = a3;
    if (a3)
    {
      [(CKMessageEntryView *)self _animateMessageEditingBlurOverlayViewIn];
      [(CKMessageEntryView *)self setShowAppStrip:0 animated:0 completion:0];
      [(CKMessageEntryView *)self setUserInteractionEnabled:0];
      BOOL v4 = [(CKMessageEntryView *)self audioButton];
      BOOL v5 = [v4 button];
      [v5 setUserInteractionEnabled:0];

      id v11 = [(CKMessageEntryView *)self sendButton];
      uint64_t v6 = [v11 button];
      id v7 = v6;
      uint64_t v8 = 0;
    }
    else
    {
      [(CKMessageEntryView *)self _animateMessageEditingBlurOverlayViewOut];
      [(CKMessageEntryView *)self setUserInteractionEnabled:1];
      uint64_t v9 = [(CKMessageEntryView *)self audioButton];
      char v10 = [v9 button];
      [v10 setUserInteractionEnabled:1];

      id v11 = [(CKMessageEntryView *)self sendButton];
      uint64_t v6 = [v11 button];
      id v7 = v6;
      uint64_t v8 = 1;
    }
    [v6 setUserInteractionEnabled:v8];
  }
}

- (void)_animateMessageEditingBlurOverlayViewIn
{
  char v3 = [(CKMessageEntryView *)self messageEditingBlurOverlayView];
  [v3 setHidden:0];

  BOOL v4 = +[CKUIBehavior sharedBehaviors];
  [v4 messageEditingAnimateInDuration];
  double v6 = v5;

  id v7 = +[CKUIBehavior sharedBehaviors];
  [v7 messageEditingAnimateInDamping];
  double v9 = v8;

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__CKMessageEntryView__animateMessageEditingBlurOverlayViewIn__block_invoke;
  aBlock[3] = &unk_1E5620C40;
  aBlock[4] = self;
  char v10 = _Block_copy(aBlock);
  [MEMORY[0x1E4F42FF0] animateWithDuration:4 delay:v10 usingSpringWithDamping:&__block_literal_global_351_2 initialSpringVelocity:v6 options:0.0 animations:v9 completion:0.0];
}

void __61__CKMessageEntryView__animateMessageEditingBlurOverlayViewIn__block_invoke(uint64_t a1)
{
  uint64_t v2 = +[CKUIBehavior sharedBehaviors];
  char v3 = [v2 theme];
  BOOL v4 = [v3 messageEditingTranscriptOverlayBackgroundEffects];
  double v5 = [*(id *)(a1 + 32) messageEditingBlurOverlayView];
  [v5 setBackgroundEffects:v4];

  id v9 = +[CKUIBehavior sharedBehaviors];
  double v6 = [v9 theme];
  id v7 = [v6 messageEditingTranscriptOverlayBackgroundColor];
  double v8 = [*(id *)(a1 + 32) messageEditingBlurOverlayView];
  [v8 setBackgroundColor:v7];
}

- (void)_animateMessageEditingBlurOverlayViewOut
{
  char v3 = +[CKUIBehavior sharedBehaviors];
  [v3 messageEditingAnimateOutDuration];
  double v5 = v4;

  double v6 = +[CKUIBehavior sharedBehaviors];
  [v6 messageEditingAnimateOutDamping];
  double v8 = v7;

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__CKMessageEntryView__animateMessageEditingBlurOverlayViewOut__block_invoke;
  aBlock[3] = &unk_1E5620C40;
  aBlock[4] = self;
  id v9 = _Block_copy(aBlock);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__CKMessageEntryView__animateMessageEditingBlurOverlayViewOut__block_invoke_2;
  v11[3] = &unk_1E5620BF0;
  v11[4] = self;
  char v10 = _Block_copy(v11);
  [MEMORY[0x1E4F42FF0] animateWithDuration:4 delay:v9 usingSpringWithDamping:v10 initialSpringVelocity:v5 options:0.0 animations:v8 completion:0.0];
}

void __62__CKMessageEntryView__animateMessageEditingBlurOverlayViewOut__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) messageEditingBlurOverlayView];
  [v2 setBackgroundEffects:MEMORY[0x1E4F1CBF0]];

  id v3 = [*(id *)(a1 + 32) messageEditingBlurOverlayView];
  [v3 setBackgroundColor:0];
}

void __62__CKMessageEntryView__animateMessageEditingBlurOverlayViewOut__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) messageEditingBlurOverlayView];
  [v1 setHidden:1];
}

- (void)setShowAppStrip:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  double v8 = (void (**)(id, void))a5;
  if ([(CKMessageEntryView *)self _isRunningInMVS]) {
    goto LABEL_3;
  }
  id v9 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v10 = [v9 isSendMenuEnabled];

  if (v10) {
    goto LABEL_3;
  }
  if (v6 && !CKShowAppStripInEntryView())
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v19, OS_LOG_TYPE_INFO, "Asked to show the app strip but the user preference is to hide it", buf, 2u);
      }
    }
    goto LABEL_3;
  }
  id v11 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v12 = [v11 stewieEnabled];

  if (v12)
  {
    char v13 = [(CKMessageEntryView *)self conversation];
    int v14 = [v13 isStewieConversation];

    if (v14)
    {
LABEL_3:
      if (v8) {
        v8[2](v8, 0);
      }
      goto LABEL_29;
    }
  }
  id v15 = [(CKMessageEntryView *)self _currentInputDelegate];
  if (self->_showAppStrip != v6
    || ([(CKMessageEntryView *)self lastConfiguredInputDelegate],
        char v16 = objc_claimAutoreleasedReturnValue(),
        v16,
        v16 != v15))
  {
    self->_showAppStrip = v6;
    [(CKMessageEntryView *)self setLastConfiguredInputDelegate:v15];
    if (v6 && !self->_appStrip)
    {
      [(CKMessageEntryView *)self setNeedsLayout];
      [(CKMessageEntryView *)self layoutIfNeeded];
    }
    uint64_t v17 = +[CKUIBehavior sharedBehaviors];
    char v18 = [v17 isAppStripInKeyboard];

    if (v18)
    {
      if (v6)
      {
        [v15 setHidePrediction:1];
      }
      else
      {
        [v15 setHidePrediction:0];
        double v20 = [MEMORY[0x1E4F42B08] snapshotViewForPredictionViewTransition];
        double v21 = [(CKMessageEntryView *)self appStrip];
        [v21 updatePredictiveTypeSnapshot:v20];
      }
      uint64_t v29 = MEMORY[0x1E4F143A8];
      uint64_t v30 = 3221225472;
      CGRect v31 = __58__CKMessageEntryView_setShowAppStrip_animated_completion___block_invoke;
      uint64_t v32 = &unk_1E5629390;
      uint64_t v33 = self;
      double v34 = v8;
      id v22 = _Block_copy(&v29);
      double v23 = v22;
      if (v6)
      {
        (*((void (**)(void *, uint64_t))v22 + 2))(v22, 1);
        double v24 = [(CKMessageEntryView *)self appStrip];
        id v25 = v24;
        uint64_t v26 = 1;
        BOOL v27 = v5;
        double v28 = 0;
      }
      else
      {
        double v24 = [(CKMessageEntryView *)self appStrip];
        id v25 = v24;
        uint64_t v26 = 0;
        BOOL v27 = v5;
        double v28 = v23;
      }
      [v24 animateAppStripVisible:v26 animated:v27 completion:v28];
    }
    else if (v8)
    {
      v8[2](v8, 1);
    }
  }

LABEL_29:
}

void __58__CKMessageEntryView_setShowAppStrip_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, 1);
  }
  [*(id *)(a1 + 32) setNeedsLayout];
  id v3 = [MEMORY[0x1E4F42B08] activeKeyboard];
  [v3 textInputTraitsDidChange];
}

- (CGRect)anchorRect
{
  id v3 = [(CKMessageEntryView *)self contentView];
  double v4 = [v3 textView];

  [v4 textContainerInset];
  double v6 = v5;
  double v8 = v7;
  id v9 = [v4 textContainer];
  int v10 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v11 = [v10 isTextKit2Enabled];

  if (v11)
  {
    [(CKMessageEntryView *)self rangeOfTappedMention];
    if (!v12)
    {
      double v22 = *MEMORY[0x1E4F1DB28];
      double v24 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v26 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v28 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      goto LABEL_6;
    }
    char v13 = [v4 textLayoutManager];
    int v14 = [v13 documentRange];
    id v15 = [v14 location];
    char v16 = objc_msgSend(v13, "locationFromLocation:withOffset:", v15, -[CKMessageEntryView rangeOfTappedMention](self, "rangeOfTappedMention"));

    [(CKMessageEntryView *)self rangeOfTappedMention];
    char v18 = [v13 locationFromLocation:v16 withOffset:v17];
    uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4FB08B0]) initWithLocation:v16 endLocation:v18];
    double v20 = [v13 documentRange];
    [v13 ensureLayoutForRange:v20];

    uint64_t v53 = 0;
    objc_super v54 = (double *)&v53;
    uint64_t v55 = 0x4010000000;
    CGPoint v56 = "";
    long long v57 = 0u;
    long long v58 = 0u;
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __32__CKMessageEntryView_anchorRect__block_invoke;
    v52[3] = &unk_1E5625F98;
    void v52[4] = &v53;
    [v13 enumerateTextSegmentsInRange:v19 type:0 options:0 usingBlock:v52];
    objc_msgSend(v4, "convertRect:toView:", self, v8 + v54[4], v6 + v54[5], v54[6], v54[7]);
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    _Block_object_dispose(&v53, 8);
  }
  else
  {
    char v13 = [v4 layoutManager];
    uint64_t v29 = [(CKMessageEntryView *)self rangeOfTappedMention];
    objc_msgSend(v13, "boundingRectForGlyphRange:inTextContainer:", v29, v30, v9);
    uint64_t v32 = v31;
    uint64_t v34 = v33;
    uint64_t v36 = v35;
    uint64_t v38 = v37;
    uint64_t v53 = 0;
    objc_super v54 = (double *)&v53;
    uint64_t v55 = 0x4010000000;
    CGPoint v56 = "";
    *(void *)&long long v57 = v31;
    *((void *)&v57 + 1) = v33;
    *(void *)&long long v58 = v35;
    *((void *)&v58 + 1) = v37;
    uint64_t v39 = [(CKMessageEntryView *)self rangeOfTappedMention];
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    void v51[2] = __32__CKMessageEntryView_anchorRect__block_invoke_2;
    v51[3] = &unk_1E5625FC0;
    v51[5] = v32;
    v51[6] = v34;
    v51[7] = v36;
    v51[8] = v38;
    v51[4] = &v53;
    objc_msgSend(v13, "enumerateEnclosingRectsForGlyphRange:withinSelectedGlyphRange:inTextContainer:usingBlock:", v39, v40, 0x7FFFFFFFFFFFFFFFLL, 0, v9, v51);
    long long v41 = v54;
    double v42 = v6 + v54[5];
    v54[4] = v8 + v54[4];
    v41[5] = v42;
    objc_msgSend(v4, "convertRect:toView:", self);
    double v22 = v43;
    double v24 = v44;
    double v26 = v45;
    double v28 = v46;
    _Block_object_dispose(&v53, 8);
  }

LABEL_6:
  double v47 = v22;
  double v48 = v24;
  double v49 = v26;
  double v50 = v28;
  result.size.double height = v50;
  result.size.double width = v49;
  result.origin.double y = v48;
  result.origin.double x = v47;
  return result;
}

uint64_t __32__CKMessageEntryView_anchorRect__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double v5 = *(double **)(*(void *)(a1 + 32) + 8);
  v5[4] = a2;
  v5[5] = a3;
  v5[6] = a4;
  v5[7] = a5;
  return 0;
}

BOOL __32__CKMessageEntryView_anchorRect__block_invoke_2(uint64_t a1, unsigned char *a2, double a3, double a4, double a5, double a6)
{
  BOOL result = CGRectIntersectsRect(*(CGRect *)&a3, *(CGRect *)(a1 + 40));
  if (result)
  {
    char v13 = *(double **)(*(void *)(a1 + 32) + 8);
    void v13[4] = a3;
    v13[5] = a4;
    v13[6] = a5;
    v13[7] = a6;
    *a2 = 1;
  }
  return result;
}

- (void)expandAppStrip
{
  if (![(CKMessageEntryView *)self showAppStrip])
  {
    id v4 = [(CKMessageEntryView *)self browserButton];
    id v3 = [v4 button];
    [(CKMessageEntryView *)self browserButtonTapped:v3];
  }
}

- (void)minifyAppStrip
{
  id v2 = [(CKMessageEntryView *)self appStrip];
  [v2 minifyImmediately:1];
}

- (void)selectPluginAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(CKMessageEntryView *)self appStrip];
  [v5 selectPluginAtIndexPath:v4];
}

- (void)clearAppStripSelection
{
  id v2 = [(CKMessageEntryView *)self appStrip];
  [v2 clearSelection];
}

- (id)pasteBoardTextFromComposition:(id)a3
{
  id v4 = a3;
  id v5 = [(CKMessageEntryView *)self contentView];
  double v6 = [v5 textView];

  double v7 = [v4 text];

  double v8 = [v6 attributedTextForCompositionText:v7];

  return v8;
}

- (id)snapshotForCompactBrowserAnimation
{
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  backgroundView = self->_backgroundView;
  if (isKindOfClass)
  {
    id v5 = [(CKMessageEntryBackgroundViewProtocol *)backgroundView contentView];
  }
  else
  {
    id v5 = backgroundView;
  }
  double v6 = v5;
  [(CKMessageEntryBackgroundViewProtocol *)v5 alpha];
  double v8 = v7;
  [(CKMessageEntryBackgroundViewProtocol *)v6 setAlpha:1.0];
  id v9 = [(CKMessageEntryView *)self browserButton];
  [v9 setHidden:1];

  int v10 = [(CKMessageEntryView *)self snapshotViewAfterScreenUpdates:1];
  int v11 = [(CKMessageEntryView *)self browserButton];
  [v11 setHidden:0];

  [(CKMessageEntryBackgroundViewProtocol *)v6 setAlpha:v8];

  return v10;
}

- (CGRect)browserButtonFrame
{
  id v2 = [(CKMessageEntryView *)self browserButton];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (void)beginDeferringEntryFieldCollapsedStateChanges
{
  id v2 = [(CKMessageEntryView *)self entryFieldCollapsedUpdater];
  [v2 beginHoldingUpdatesForKey:@"com.apple.ChatKit.CKMessageEntryView.entryFieldCollapsedStateChanges"];
}

- (void)endDeferringEntryFieldCollapsedStateChanges
{
  id v2 = [(CKMessageEntryView *)self entryFieldCollapsedUpdater];
  [v2 endHoldingUpdatesForKey:@"com.apple.ChatKit.CKMessageEntryView.entryFieldCollapsedStateChanges"];
}

- (void)_updateUIForEntryFieldCollapsedStateChange
{
  if ([(CKMessageEntryView *)self entryFieldUpdaterCollapsedValue]
    && ![(CKMessageEntryView *)self entryFieldCollapsed])
  {
    [(CKMessageEntryView *)self compositionWithAcceptedAutocorrection:0];
    if ([(CKMessageEntryView *)self entryFieldUpdaterAnimatedValue])
    {
      [(CKMessageEntryView *)self _animateToCompactLayoutCollapsing:1 completion:0];
    }
    else
    {
      [(CKMessageEntryView *)self setEntryFieldCollapsed:1];
      [(CKMessageEntryView *)self updateEntryView];
      double v3 = [(CKMessageEntryView *)self delegate];
      [v3 messageEntryViewDidChange:self isTextChange:0 isShelfChange:0];
    }
  }
  else
  {
    if ([(CKMessageEntryView *)self entryFieldUpdaterCollapsedValue]
      || ![(CKMessageEntryView *)self entryFieldCollapsed])
    {
      return;
    }
    if ([(CKMessageEntryView *)self entryFieldUpdaterAnimatedValue])
    {
      [(CKMessageEntryView *)self _animateExpandForManualToggle:1 completion:0];
      return;
    }
    [(CKMessageEntryView *)self setEntryFieldCollapsed:0];
    [(CKMessageEntryView *)self updateEntryView];
  }
  id v4 = [(CKMessageEntryView *)self delegate];
  [v4 messageEntryViewDidChange:self isTextChange:0 isShelfChange:0];
}

- (UIEdgeInsets)adjustedCoverInsets
{
  [(CKMessageEntryView *)self coverInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if (CKIsRunningInMacCatalyst())
  {
    double v11 = [(CKMessageEntryView *)self emojiButton];
    [v11 bounds];
    double v13 = v12;

    double v14 = [(CKMessageEntryView *)self browserButton];
    double v15 = 0.0;
    double v16 = 0.0;
    if (v14)
    {
      uint64_t v17 = [(CKMessageEntryView *)self browserButton];
      [v17 frame];
      double v16 = v18 + -5.0;
    }
    double v19 = v13 + -3.0;

    double v20 = [(CKMessageEntryView *)self plusButton];
    if (v20)
    {
      double v21 = [(CKMessageEntryView *)self plusButton];
      [v21 frame];
      double v15 = v22;
    }
    double v23 = +[CKUIBehavior sharedBehaviors];
    [v23 minTranscriptMarginInsets];
    double v25 = v19 + v24;
    double v26 = +[CKUIBehavior sharedBehaviors];
    [v26 entryViewCoverHorizontalMargin];
    double v28 = v25 + v27;

    uint64_t v29 = +[CKUIBehavior sharedBehaviors];
    [v29 minTranscriptMarginInsets];
    double v31 = v15 + v16 + v30;
    uint64_t v32 = +[CKUIBehavior sharedBehaviors];
    [v32 entryViewCoverHorizontalMargin];
    double v34 = v31 + v33;
  }
  else
  {
    [(CKMessageEntryView *)self bottomInsetForAppStrip];
    double v8 = v8 + v35;
    [(CKMessageEntryView *)self safeAreaInsets];
    double v34 = v6 + v36;
    [(CKMessageEntryView *)self safeAreaInsets];
    double v28 = v10 + v37;
  }
  double v38 = v4;
  double v39 = v34;
  double v40 = v8;
  double v41 = v28;
  result.double right = v41;
  result.double bottom = v40;
  result.double left = v39;
  result.double top = v38;
  return result;
}

- (void)_animateExpandForManualToggle:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (![(CKMessageEntryView *)self animatingLayoutChange])
  {
    double v7 = [(CKMessageEntryView *)self contentView];
    [v7 frame];
    if (v8 == 0.0)
    {
    }
    else
    {
      BOOL v9 = [(CKMessageEntryView *)self layoutIsCurrentlyCompact];

      if (v9)
      {
        [(CKMessageEntryView *)self setAnimatingLayoutChange:1];
        [(CKMessageEntryView *)self bounds];
        CGFloat v11 = v10;
        CGFloat v13 = v12;
        double v15 = v14;
        double v17 = v16;
        [(CKMessageEntryView *)self setEntryFieldCollapsed:0];
        double v18 = [(CKMessageEntryView *)self delegate];
        [v18 messageEntryViewMaxHeight:self];
        double v20 = v19;

        -[NSObject ck_constrainedSizeThatFits:](self, "ck_constrainedSizeThatFits:", v15, v20);
        double v126 = v21;
        double v23 = v22;
        double v24 = +[CKUIBehavior sharedBehaviors];
        [v24 entryViewHorizontalCoverInsets];
        double v26 = v25;
        [(CKMessageEntryView *)self safeAreaInsets];
        double v28 = v27;

        -[CKMessageEntryView coverFrameThatFitsInSize:](self, "coverFrameThatFitsInSize:", v15, v20);
        double v30 = v29;
        double v125 = v31;
        [(CKMessageEntryView *)self adjustedCoverInsets];
        uint64_t v32 = +[CKUIBehavior sharedBehaviors];
        [v32 browserButtonSize];

        v130.origin.double x = v11;
        v130.origin.double y = v13;
        v130.size.double width = v15;
        v130.size.double height = v17;
        double v33 = +[CKUIBehavior sharedBehaviors];
        [v33 browserButtonSize];

        double v34 = [(CKMessageEntryView *)self arrowButton];
        [v34 frame];
        double v35 = v26 + v28 + CGRectGetWidth(v131) * 0.5;

        double v36 = v17 - v23;
        double v37 = [(CKMessageEntryView *)self contentView];
        [v37 willAnimateBoundsChange];

        [MEMORY[0x1E4F39CF8] begin];
        dispatch_time_t v38 = dispatch_time(0, 130000000);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __63__CKMessageEntryView__animateExpandForManualToggle_completion___block_invoke;
        block[3] = &unk_1E5620C40;
        void block[4] = self;
        double v39 = MEMORY[0x1E4F14428];
        dispatch_after(v38, MEMORY[0x1E4F14428], block);
        dispatch_time_t v40 = dispatch_time(0, 480000000);
        v127[0] = MEMORY[0x1E4F143A8];
        v127[1] = 3221225472;
        v127[2] = __63__CKMessageEntryView__animateExpandForManualToggle_completion___block_invoke_2;
        v127[3] = &unk_1E5620F48;
        id v128 = v6;
        dispatch_after(v40, v39, v127);

        double v41 = [MEMORY[0x1E4F39C90] animation];
        [v41 setMass:1.0];
        [v41 setStiffness:359.0];
        [v41 setDamping:29.0];
        [v41 setInitialVelocity:0.0];
        [v41 setDuration:0.48];
        [v41 setFillMode:*MEMORY[0x1E4F39FA0]];
        [v41 setKeyPath:@"position.x"];
        double v42 = NSNumber;
        double v43 = [(CKMessageEntryView *)self photoButton];
        [v43 origin];
        double v44 = objc_msgSend(v42, "numberWithDouble:");
        [v41 setFromValue:v44];

        [v41 setToValue:&unk_1EDF167A8];
        double v45 = [(CKMessageEntryView *)self photoButton];
        double v46 = [v45 layer];
        [v46 addAnimation:v41 forKey:@"PhotoButtonPositionX"];

        double v47 = NSNumber;
        double v48 = [(CKMessageEntryView *)self browserButton];
        [v48 origin];
        double v49 = objc_msgSend(v47, "numberWithDouble:");
        [v41 setFromValue:v49];

        [v41 setToValue:&unk_1EDF167C0];
        double v50 = [(CKMessageEntryView *)self browserButton];
        int v51 = [v50 layer];
        [v51 addAnimation:v41 forKey:@"BrowserButtonPositionX"];

        [v41 setKeyPath:@"position.y"];
        uint64_t v52 = NSNumber;
        uint64_t v53 = [(CKMessageEntryView *)self photoButton];
        [v53 center];
        uint64_t v55 = [v52 numberWithDouble:v54];
        [v41 setFromValue:v55];

        CGPoint v56 = NSNumber;
        long long v57 = [(CKMessageEntryView *)self photoButton];
        [v57 center];
        CGRect v59 = [v56 numberWithDouble:v58 - (v17 - v23)];
        [v41 setToValue:v59];

        CGRect v60 = [(CKMessageEntryView *)self photoButton];
        int v61 = [v60 layer];
        [v61 addAnimation:v41 forKey:@"PhotoButtonPositionY"];

        double v62 = [(CKMessageEntryView *)self browserButton];
        id v63 = [v62 layer];
        [v63 addAnimation:v41 forKey:@"BrowserButtonPositionY"];

        uint64_t v64 = NSNumber;
        int v65 = [(CKMessageEntryView *)self sendButton];
        [v65 center];
        double v67 = [v64 numberWithDouble:v66];
        [v41 setFromValue:v67];

        double v68 = NSNumber;
        double v69 = [(CKMessageEntryView *)self sendButton];
        [v69 center];
        double v71 = [v68 numberWithDouble:v70 - (v17 - v23)];
        [v41 setToValue:v71];

        v72 = [(CKMessageEntryView *)self sendButton];
        double v73 = [v72 layer];
        [v73 addAnimation:v41 forKey:@"sendButtonPosition"];

        [v41 setKeyPath:@"opacity"];
        [v41 setFromValue:&unk_1EDF167D8];
        [v41 setToValue:&unk_1EDF167F0];
        double v74 = [(CKMessageEntryView *)self photoButton];
        v75 = [v74 layer];
        [v75 addAnimation:v41 forKey:@"myAnimation5o"];

        int v76 = [(CKMessageEntryView *)self browserButton];
        double v77 = [v76 layer];
        [v77 addAnimation:v41 forKey:@"myAnimation5o"];

        [v41 setKeyPath:@"position.x"];
        double v78 = [NSNumber numberWithDouble:v35];
        [v41 setFromValue:v78];

        double v79 = [NSNumber numberWithDouble:v35];
        [v41 setToValue:v79];

        double v80 = [(CKMessageEntryView *)self arrowButton];
        v81 = [v80 layer];
        [v81 addAnimation:v41 forKey:@"ArrowPositionx"];

        [v41 setKeyPath:@"position.y"];
        double v82 = NSNumber;
        double v83 = [(CKMessageEntryView *)self arrowButton];
        [v83 center];
        int v85 = [v82 numberWithDouble:v84];
        [v41 setFromValue:v85];

        v86 = NSNumber;
        double v87 = [(CKMessageEntryView *)self arrowButton];
        [v87 center];
        BOOL v89 = [v86 numberWithDouble:v88 - (v17 - v23)];
        [v41 setToValue:v89];

        BOOL v90 = [(CKMessageEntryView *)self arrowButton];
        double v91 = [v90 layer];
        [v91 addAnimation:v41 forKey:@"ArrowPositiony"];

        [v41 setKeyPath:@"transform.scale.xy"];
        [v41 setFromValue:&unk_1EDF17258];
        [v41 setToValue:&unk_1EDF17268];
        double v92 = [(CKMessageEntryView *)self arrowButton];
        v93 = [v92 layer];
        [v93 addAnimation:v41 forKey:@"ArrowScale"];

        [v41 setKeyPath:@"opacity"];
        [v41 setFromValue:&unk_1EDF167F0];
        [v41 setToValue:&unk_1EDF167D8];
        double v94 = [(CKMessageEntryView *)self arrowButton];
        double v95 = [v94 layer];
        [v95 addAnimation:v41 forKey:@"ArrowOpacity"];

        [v41 setKeyPath:@"bounds"];
        v96 = (void *)MEMORY[0x1E4F29238];
        double v97 = [(CKMessageEntryView *)self contentClipView];
        [v97 bounds];
        double v98 = objc_msgSend(v96, "valueWithRect:");
        [v41 setFromValue:v98];

        double v99 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", 0.0, 0.0, v30, v125);
        [v41 setToValue:v99];

        v100 = [(CKMessageEntryView *)self contentClipView];
        double v101 = [v100 layer];
        [v101 addAnimation:v41 forKey:@"PillBounds"];

        if (v4)
        {
          [v41 setKeyPath:@"opacity"];
          [v41 setFromValue:&unk_1EDF167D8];
          [v41 setToValue:&unk_1EDF167F0];
          int v102 = [(CKMessageEntryView *)self collpasedPlaceholderLabel];
          v103 = [v102 layer];
          [v103 addAnimation:v41 forKey:@"placeholderOpacity"];

          [v41 setFromValue:&unk_1EDF167F0];
          [v41 setToValue:&unk_1EDF167D8];
          double v104 = [(CKMessageEntryView *)self contentView];
          double v105 = [v104 layer];
          [v105 addAnimation:v41 forKey:@"contentOpacity"];
        }
        if ([(CKMessageEntryView *)self shouldShowAppStrip])
        {
          [v41 setKeyPath:@"position.y"];
          double v106 = [(CKMessageEntryView *)self appStrip];
          [v106 center];
          double v108 = v107;

          double v109 = [NSNumber numberWithDouble:v108];
          [v41 setFromValue:v109];

          double v110 = [NSNumber numberWithDouble:v108 - v36];
          [v41 setToValue:v110];

          double v111 = [(CKMessageEntryView *)self appStrip];
          double v112 = [v111 layer];
          [v112 addAnimation:v41 forKey:@"appStripFrame"];

          int v113 = [(CKMessageEntryView *)self appStripBackgroundBlurContainerView];
          [v113 center];
          double v115 = v114;

          int v116 = [NSNumber numberWithDouble:v115];
          [v41 setFromValue:v116];

          double v117 = [NSNumber numberWithDouble:v115 - v36];
          [v41 setToValue:v117];

          double v118 = [(CKMessageEntryView *)self appStripBackgroundBlurContainerView];
          v119 = [v118 layer];
          [v119 addAnimation:v41 forKey:@"appStripBlurContainerViewFrame"];
        }
        [v41 setKeyPath:@"bounds"];
        double v120 = (void *)MEMORY[0x1E4F29238];
        [(CKMessageEntryView *)self bounds];
        double v121 = objc_msgSend(v120, "valueWithRect:");
        [v41 setFromValue:v121];

        v122 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", 0.0, 0.0, v126, v23);
        [v41 setToValue:v122];

        double v123 = [(CKMessageEntryView *)self backgroundView];
        objc_msgSend(v123, "setBounds:", 0.0, 0.0, v126, v23);

        double v124 = [(CKMessageEntryView *)self layer];
        [v124 addAnimation:v41 forKey:@"selfBounds"];

        [MEMORY[0x1E4F39CF8] commit];
      }
    }
  }
}

void __63__CKMessageEntryView__animateExpandForManualToggle_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) inputDelegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    BOOL v4 = [*(id *)(a1 + 32) inputDelegate];
    [v4 messageEntryViewDidExpand:*(void *)(a1 + 32)];
  }
  [*(id *)(a1 + 32) setAnimatingLayoutChange:0];
  [*(id *)(a1 + 32) setNeedsLayout];
  [*(id *)(a1 + 32) layoutIfNeeded];
  id v5 = [*(id *)(a1 + 32) delegate];
  [v5 messageEntryViewDidChange:*(void *)(a1 + 32) isTextChange:0 isShelfChange:0];
}

uint64_t __63__CKMessageEntryView__animateExpandForManualToggle_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)expandGestureRecongnized
{
  if ([(CKMessageEntryView *)self entryFieldCollapsed])
  {
    [(CKMessageEntryView *)self _animateExpandForManualToggle:1 completion:0];
  }
}

- (void)collapseGestureRecognized
{
}

- (BOOL)_shouldNotAnimateCollapseInteractive
{
  return ![(CKMessageEntryView *)self shouldShowPluginButtons];
}

- (void)_animateToCompactLayoutCollapsing:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (![(CKMessageEntryView *)self _shouldNotAnimateCollapseInteractive]
    && ![(CKMessageEntryView *)self animatingLayoutChange]
    && ![(CKMessageEntryView *)self layoutIsCurrentlyCompact])
  {
    [(CKMessageEntryView *)self setAnimatingLayoutChange:1];
    if (v4) {
      [(CKMessageEntryView *)self setEntryFieldCollapsed:1];
    }
    [(CKMessageEntryView *)self bounds];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v15 = +[CKUIBehavior sharedBehaviors];
    [v15 entryViewHorizontalCoverInsets];
    double v17 = v16;
    [(CKMessageEntryView *)self safeAreaInsets];
    double v19 = v17 + v18;

    -[CKMessageEntryView coverFrameThatFitsInSize:](self, "coverFrameThatFitsInSize:", v12, v14);
    double v138 = v20;
    CGFloat rect = v21;
    double v137 = v22;
    double v24 = v23;
    [(CKMessageEntryView *)self adjustedCoverInsets];
    double v26 = v25;
    double v27 = +[CKUIBehavior sharedBehaviors];
    [v27 browserButtonSize];
    double v29 = v28;

    v143.origin.double x = v8;
    v143.origin.double y = v10;
    v143.size.double width = v12;
    v143.size.double height = v14;
    CGFloat v30 = CGRectGetWidth(v143) - v19 - v29 + -16.5;
    double v31 = +[CKUIBehavior sharedBehaviors];
    [v31 browserButtonSize];
    double v33 = v30 - v32 + -14.5 - v26;

    -[CKMessageEntryView sizeThatFits:](self, "sizeThatFits:", v12, 1.79769313e308);
    double v35 = v34;
    double v36 = [(CKMessageEntryView *)self contentClipView];
    [v36 bounds];
    double v38 = v37;
    double v40 = v39;

    if (v38 != v33 || v40 != v24)
    {
      v144.size.double height = v24;
      v144.origin.double x = v138 + v137 - v33;
      double v42 = v14 - v35;
      v144.origin.double y = rect;
      v144.size.double width = v33;
      double v135 = v24;
      double v43 = CGRectGetMinX(v144) + 14.5;
      double v44 = v29 * 0.5;
      double v45 = v19 + v44;
      double v46 = +[CKUIBehavior sharedBehaviors];
      [v46 browserButtonSize];
      double v48 = v19 + v44 + v44 + v47 * 0.5 + 16.5;

      [MEMORY[0x1E4F39CF8] begin];
      [MEMORY[0x1E4F39CF8] setAnimationDuration:0.73];
      dispatch_time_t v49 = dispatch_time(0, 380000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __67__CKMessageEntryView__animateToCompactLayoutCollapsing_completion___block_invoke;
      block[3] = &unk_1E5620C40;
      void block[4] = self;
      double v50 = MEMORY[0x1E4F14428];
      dispatch_after(v49, MEMORY[0x1E4F14428], block);
      dispatch_time_t v51 = dispatch_time(0, 730000000);
      v140[0] = MEMORY[0x1E4F143A8];
      v140[1] = 3221225472;
      v140[2] = __67__CKMessageEntryView__animateToCompactLayoutCollapsing_completion___block_invoke_2;
      v140[3] = &unk_1E5622330;
      v140[4] = self;
      id v141 = v6;
      dispatch_after(v51, v50, v140);

      uint64_t v52 = [MEMORY[0x1E4F39C90] animation];
      [v52 setKeyPath:@"position.x"];
      [v52 setDuration:0.65];
      [v52 setMass:1.0];
      [v52 setStiffness:226.0];
      double v53 = 24.0;
      if (v42 <= 100.0)
      {
        double v54 = 23.0;
      }
      else
      {
        double v53 = 26.0;
        double v54 = 26.0;
      }
      objc_msgSend(v52, "setDamping:", v53, *(void *)&v135);
      [v52 setInitialVelocity:0.0];
      [v52 setFillMode:*MEMORY[0x1E4F39FA0]];
      [v52 setKeyPath:@"position.x"];
      [v52 setFromValue:&unk_1EDF167A8];
      uint64_t v55 = [NSNumber numberWithDouble:v45];
      [v52 setToValue:v55];

      CGPoint v56 = [(CKMessageEntryView *)self photoButton];
      long long v57 = [v56 layer];
      [v57 addAnimation:v52 forKey:@"PhotoButtonPositionX"];

      [v52 setFromValue:&unk_1EDF167C0];
      double v58 = [NSNumber numberWithDouble:v48];
      [v52 setToValue:v58];

      CGRect v59 = [(CKMessageEntryView *)self browserButton];
      CGRect v60 = [v59 layer];
      [v60 addAnimation:v52 forKey:@"BrowserButtonPositionX"];

      [v52 setKeyPath:@"position.y"];
      int v61 = NSNumber;
      double v62 = [(CKMessageEntryView *)self photoButton];
      [v62 center];
      uint64_t v64 = [v61 numberWithDouble:v63];
      [v52 setFromValue:v64];

      int v65 = NSNumber;
      double v66 = [(CKMessageEntryView *)self photoButton];
      [v66 center];
      double v68 = [v65 numberWithDouble:v67 - v42];
      [v52 setToValue:v68];

      double v69 = [(CKMessageEntryView *)self photoButton];
      double v70 = [v69 layer];
      [v70 addAnimation:v52 forKey:@"PhotoButtonPositionY"];

      double v71 = [(CKMessageEntryView *)self browserButton];
      v72 = [v71 layer];
      [v72 addAnimation:v52 forKey:@"BrowserButtonPositionY"];

      double v73 = NSNumber;
      double v74 = [(CKMessageEntryView *)self sendButton];
      [v74 center];
      int v76 = [v73 numberWithDouble:v75];
      [v52 setFromValue:v76];

      double v77 = NSNumber;
      double v78 = [(CKMessageEntryView *)self sendButton];
      [v78 center];
      double v80 = [v77 numberWithDouble:v79 - v42];
      [v52 setToValue:v80];

      v81 = [(CKMessageEntryView *)self sendButton];
      double v82 = [v81 layer];
      [v82 addAnimation:v52 forKey:@"sendButtonPosition"];

      [v52 setKeyPath:@"opacity"];
      [v52 setFromValue:&unk_1EDF167F0];
      [v52 setToValue:&unk_1EDF167D8];
      double v83 = [(CKMessageEntryView *)self photoButton];
      double v84 = [v83 layer];
      [v84 addAnimation:v52 forKey:@"PhotoButtonOpacity"];

      int v85 = [(CKMessageEntryView *)self browserButton];
      v86 = [v85 layer];
      [v86 addAnimation:v52 forKey:@"BrowserButtonOpacity"];

      [v52 setKeyPath:@"position.x"];
      double v87 = NSNumber;
      double v88 = [(CKMessageEntryView *)self arrowButton];
      [v88 center];
      BOOL v89 = objc_msgSend(v87, "numberWithDouble:");
      [v52 setFromValue:v89];

      BOOL v90 = [NSNumber numberWithDouble:v43];
      [v52 setToValue:v90];

      double v91 = [(CKMessageEntryView *)self arrowButton];
      double v92 = [v91 layer];
      [v92 addAnimation:v52 forKey:@"myAnimation4"];

      [v52 setKeyPath:@"position.y"];
      v93 = NSNumber;
      double v94 = [(CKMessageEntryView *)self arrowButton];
      [v94 center];
      v96 = [v93 numberWithDouble:v95];
      [v52 setFromValue:v96];

      double v97 = NSNumber;
      double v98 = [(CKMessageEntryView *)self arrowButton];
      [v98 center];
      v100 = [v97 numberWithDouble:v99 - v42];
      [v52 setToValue:v100];

      double v101 = [(CKMessageEntryView *)self arrowButton];
      int v102 = [v101 layer];
      [v102 addAnimation:v52 forKey:@"ArrowPositiony"];

      [v52 setKeyPath:@"opacity"];
      [v52 setFromValue:&unk_1EDF167D8];
      [v52 setToValue:&unk_1EDF167F0];
      v103 = [(CKMessageEntryView *)self arrowButton];
      double v104 = [v103 layer];
      [v104 addAnimation:v52 forKey:@"myAnimation5"];

      [v52 setKeyPath:@"transform.scale.xy"];
      [v52 setFromValue:&unk_1EDF17268];
      [v52 setToValue:&unk_1EDF17258];
      double v105 = [(CKMessageEntryView *)self arrowButton];
      double v106 = [v105 layer];
      [v106 addAnimation:v52 forKey:@"myAnimation6"];

      double v107 = [(CKMessageEntryView *)self buttonAndTextAreaContainerView];
      [v107 frame];
      double v109 = v108;
      double v111 = v110;
      double v113 = v112;
      double v115 = v114;

      int v116 = [(CKMessageEntryView *)self buttonAndTextAreaContainerView];
      objc_msgSend(v116, "setFrame:", v109, v111 - v42, v113, v42 + v115);

      [v52 setKeyPath:@"bounds.size.height"];
      double v117 = NSNumber;
      double v118 = [(CKMessageEntryView *)self buttonAndTextAreaContainerView];
      [v118 bounds];
      double v120 = [v117 numberWithDouble:v119];
      [v52 setFromValue:v120];

      double v121 = [NSNumber numberWithDouble:v35];
      [v52 setToValue:v121];

      v122 = [(CKMessageEntryView *)self buttonAndTextAreaContainerView];
      double v123 = [v122 layer];
      [v123 addAnimation:v52 forKey:@"buttonTextContainerHeight"];

      [v52 setKeyPath:@"bounds"];
      double v124 = (void *)MEMORY[0x1E4F29238];
      double v125 = [(CKMessageEntryView *)self contentClipView];
      [v125 bounds];
      double v126 = objc_msgSend(v124, "valueWithRect:");
      [v52 setFromValue:v126];

      double v127 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", 0.0, 0.0, v33, v136);
      [v52 setToValue:v127];

      [v52 setDamping:v54];
      id v128 = [(CKMessageEntryView *)self contentClipView];
      double v129 = [v128 layer];
      [v129 addAnimation:v52 forKey:@"PillBounds"];

      CGRect v130 = [(CKMessageEntryView *)self composition];
      LODWORD(v129) = [v130 hasContent];

      if (v129 && v4)
      {
        [v52 setKeyPath:@"opacity"];
        [v52 setFromValue:&unk_1EDF167F0];
        [v52 setToValue:&unk_1EDF167D8];
        CGRect v131 = [(CKMessageEntryView *)self collpasedPlaceholderLabel];
        double v132 = [v131 layer];
        [v132 addAnimation:v52 forKey:@"myANimation5o"];

        [v52 setFromValue:&unk_1EDF167D8];
        [v52 setToValue:&unk_1EDF167F0];
        double v133 = [(CKMessageEntryView *)self contentView];
        v134 = [v133 layer];
        [v134 addAnimation:v52 forKey:@"myANimation5o"];
      }
      [MEMORY[0x1E4F39CF8] commit];
    }
  }
}

void __67__CKMessageEntryView__animateToCompactLayoutCollapsing_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) inputDelegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    BOOL v4 = [*(id *)(a1 + 32) inputDelegate];
    [v4 messageEntryViewDidCollapse:*(void *)(a1 + 32)];
  }
  [*(id *)(a1 + 32) setNeedsLayout];
  [*(id *)(a1 + 32) layoutIfNeeded];
  id v5 = [*(id *)(a1 + 32) delegate];
  [v5 messageEntryViewDidChange:*(void *)(a1 + 32) isTextChange:0 isShelfChange:0];

  id v6 = [*(id *)(a1 + 32) inputDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [*(id *)(a1 + 32) inputDelegate];
    [v8 messageEntryViewDidCollapse:*(void *)(a1 + 32)];
  }
}

uint64_t __67__CKMessageEntryView__animateToCompactLayoutCollapsing_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAnimatingLayoutChange:0];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    char v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)setDisablePluginButtons:(BOOL)a3
{
  if (self->_disablePluginButtons != a3)
  {
    self->_disablePluginButtons = a3;
    [(CKMessageEntryView *)self updateEntryView];
  }
}

- (void)setComposingRecipient:(BOOL)a3
{
  if (self->_composingRecipient != a3)
  {
    self->_composingRecipient = a3;
    [(CKMessageEntryView *)self updateEntryView];
  }
}

- (void)setFailedRecipients:(BOOL)a3
{
  if (self->_failedRecipients != a3)
  {
    self->_failedRecipients = a3;
    [(CKMessageEntryView *)self updateEntryView];
  }
}

- (void)setUnreachableEmergencyRecipient:(BOOL)a3
{
  if (self->_unreachableEmergencyRecipient != a3)
  {
    self->_unreachableEmergencyRecipient = a3;
    [(CKMessageEntryView *)self updateEntryView];
  }
}

- (void)setSendingMessage:(BOOL)a3
{
  if (self->_sendingMessage != a3)
  {
    BOOL v3 = a3;
    self->_sendingMessage = a3;
    [(CKMessageEntryView *)self updateEntryView];
    if (v3)
    {
      [(CKMessageEntryView *)self minifyAppStrip];
    }
  }
}

- (void)setAudioComposition:(id)a3
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v5 = (CKComposition *)a3;
  id v6 = [(CKMessageEntryView *)self audioController];
  char v7 = [v6 isPlaying];

  if ((v7 & 1) == 0)
  {
    if (self->_audioComposition != v5) {
      objc_storeStrong((id *)&self->_audioComposition, a3);
    }
    if ([(CKComposition *)v5 isAudioComposition])
    {
      id v8 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      int v9 = [v8 isAudioMessagesEntryViewRecordingEnabled];

      if (v9)
      {
        CGFloat v10 = [(CKComposition *)v5 mediaObjects];
        double v11 = [v10 firstObject];

        if (v11)
        {
          [(CKMessageEntryView *)self setAudioController:0];
          double v12 = [CKAudioController alloc];
          v32[0] = v11;
          double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
          double v14 = [(CKMessageEntryView *)self conversation];
          double v15 = [(CKAudioController *)v12 initWithMediaObjects:v13 conversation:v14];

          [(CKAudioController *)v15 setDelegate:self];
          [(CKMessageEntryView *)self setAudioController:v15];
          double v16 = [(CKMessageEntryView *)self audioRecordingView];
          LODWORD(v13) = v16 == 0;

          if (v13)
          {
            [(CKMessageEntryView *)self configureForDisplayMode:3];
            double v17 = [(CKMessageEntryView *)self audioRecordingView];
            [v17 setState:2];

            double v18 = [(CKMessageEntryView *)self audioRecordingView];
            [v18 setPlaybackCurrentTime:NAN];

            [v11 duration];
            double v20 = v19;
            double v21 = [(CKMessageEntryView *)self audioRecordingView];
            [v21 setPlaybackDuration:v20];

            double v22 = [(CKMessageEntryView *)self audioRecordingView];
            double v23 = [v11 powerLevels];
            [v22 setWithIntensities:v23];

            double v24 = [(CKMessageEntryView *)self recorder];
            [v24 resetState];

            double v25 = [(CKMessageEntryView *)self recorder];
            [v25 setPaused:1];

            double v26 = [(CKMessageEntryView *)self recorder];
            objc_msgSend(v26, "setTotalPacketsCount:", objc_msgSend(v11, "totalPacketsCount"));

            double v27 = [(CKMessageEntryView *)self recorder];
            double v28 = [v11 temporaryFileURL];
            [v27 setFileURL:v28];
          }
        }
      }
      if (IMOSLoggingEnabled())
      {
        double v29 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)double v31 = 0;
          _os_log_impl(&dword_18EF18000, v29, OS_LOG_TYPE_INFO, "[Event] Audio Composition loaded into entry view. Calling updateEntryView.", v31, 2u);
        }
      }
      [(CKMessageEntryView *)self updateEntryView];
      CGFloat v30 = [(CKMessageEntryView *)self delegate];
      [v30 messageEntryViewDidChange:self isTextChange:0 isShelfChange:0];
    }
  }
}

- (BOOL)messageEntryContentView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  return ![(CKMessageEntryView *)self audioRecordingIsInEntryView];
}

- (BOOL)messageEntryContentViewShouldResignFirstResponder:(id)a3
{
  BOOL v4 = [(CKMessageEntryView *)self inputDelegate];
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    return 1;
  }
  id v6 = [(CKMessageEntryView *)self inputDelegate];
  char v7 = [v6 messageEntryViewShouldResignFirstResponder:self];

  return v7;
}

- (BOOL)messageEntryContentView:(id)a3 canPerformDictationAction:(id)a4
{
  int v5 = [a4 isEqualToString:@"UITextInputDictationActionTypeSend"];
  if (v5)
  {
    LOBYTE(v5) = [(CKMessageEntryView *)self _canSend];
  }
  return v5;
}

- (unint64_t)numberOfSuggestionsInSuggestionView:(id)a3 forSection:(unint64_t)a4
{
  id v5 = a3;
  id v6 = [(CKMessageEntryView *)self mentionSuggestionView];

  if (v6 != v5) {
    return 0;
  }
  id v8 = [(CKMessageEntryView *)self currentMentionSuggestions];
  unint64_t v9 = [v8 count];

  return v9;
}

- (id)suggestionView:(id)a3 entityAtIndex:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(CKMessageEntryView *)self mentionSuggestionView];
  if ((id)v7 != v6)
  {
    id v8 = (void *)v7;
    unint64_t v9 = 0;
LABEL_5:

    goto LABEL_7;
  }
  CGFloat v10 = [(CKMessageEntryView *)self currentMentionSuggestions];
  unint64_t v11 = [v10 count];

  if (v11 > a4)
  {
    id v8 = [(CKMessageEntryView *)self currentMentionSuggestions];
    unint64_t v9 = [v8 objectAtIndex:a4];
    goto LABEL_5;
  }
  unint64_t v9 = 0;
LABEL_7:

  return v9;
}

- (id)suggestionView:(id)a3 indexPathOfEntityWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  double v16 = &v15;
  uint64_t v17 = 0x3032000000;
  double v18 = __Block_byref_object_copy__44;
  double v19 = __Block_byref_object_dispose__44;
  id v20 = 0;
  id v8 = [(CKMessageEntryView *)self mentionSuggestionView];

  if (v8 == v6)
  {
    unint64_t v9 = [(CKMessageEntryView *)self currentMentionSuggestions];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __69__CKMessageEntryView_suggestionView_indexPathOfEntityWithIdentifier___block_invoke;
    v12[3] = &unk_1E5625F70;
    id v13 = v7;
    double v14 = &v15;
    [v9 enumerateObjectsUsingBlock:v12];
  }
  id v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v10;
}

void __69__CKMessageEntryView_suggestionView_indexPathOfEntityWithIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = [a2 defaultIMHandle];
  id v8 = [v7 ID];
  int v9 = [v8 isEqualToString:*(void *)(a1 + 32)];

  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F28D58] indexPathWithIndex:a3];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    double v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    *a4 = 1;
  }
}

- (void)messageEntryContentView:(id)a3 willAddPluginEntryViewControllerToViewHierarchy:(id)a4
{
  id v5 = a4;
  id v6 = [(CKMessageEntryView *)self delegate];
  id v7 = [v6 parentViewControllerForPluginViewControllerInMessageEntryView:self];

  [v7 addChildViewController:v5];
}

- (void)messageEntryContentView:(id)a3 didAddPluginEntryViewControllerToViewHierarchy:(id)a4
{
  id v5 = a4;
  id v6 = [(CKMessageEntryView *)self delegate];
  id v7 = [v6 parentViewControllerForPluginViewControllerInMessageEntryView:self];

  [v5 didMoveToParentViewController:v7];
}

- (double)balloonMaxWidthForMessageEntryRichTextView:(id)a3
{
  BOOL v4 = [(CKMessageEntryView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    return 0.0;
  }
  id v6 = [(CKMessageEntryView *)self delegate];
  [v6 balloonMaxWidthForMessageEntryView:self];
  double v8 = v7;

  return v8;
}

- (BOOL)messageEntryContentViewShouldAllowLinkCustomization:(id)a3
{
  BOOL v3 = [(CKMessageEntryView *)self conversation];
  BOOL v4 = [v3 sendingService];
  char v5 = [v4 supportsCapability:*MEMORY[0x1E4F6E0C0]];

  return v5;
}

- (void)messageEntryContentViewWillPresentCustomizationPicker:(id)a3
{
  BOOL v4 = [(CKMessageEntryView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CKMessageEntryView *)self delegate];
    [v6 messageEntryViewWillPresentCustomizationPicker:self];
  }
}

- (void)messageEntryContentViewDidPresentCustomizationPicker:(id)a3
{
  BOOL v4 = [(CKMessageEntryView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CKMessageEntryView *)self delegate];
    [v6 messageEntryViewDidPresentCustomizationPicker:self];
  }
}

- (void)messageEntryContentViewWillDismissCustomizationPicker:(id)a3
{
  BOOL v4 = [(CKMessageEntryView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CKMessageEntryView *)self delegate];
    [v6 messageEntryViewWillDismissCustomizationPicker:self];
  }
}

- (void)messageEntryContentViewDidDismissCustomizationPicker:(id)a3
{
  BOOL v4 = [(CKMessageEntryView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CKMessageEntryView *)self delegate];
    [v6 messageEntryViewDidDismissCustomizationPicker:self];
  }
}

- (void)messageEntryContentViewCancelWasTapped:(id)a3 shelfPluginPayload:(id)a4
{
  id v19 = a4;
  char v5 = [v19 pluginBundleID];
  if ([v5 length])
  {
    id v6 = [v19 pluginBundleID];
    uint64_t v7 = [v6 rangeOfString:*MEMORY[0x1E4F6CBE8]];

    double v8 = v19;
    if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_11;
    }
    int v9 = +[CKBalloonPluginManager sharedInstance];
    uint64_t v10 = [v19 pluginBundleID];
    char v5 = [v9 viewControllerForPluginIdentifier:v10];

    if (objc_opt_respondsToSelector())
    {
      uint64_t v11 = [(CKMessageEntryView *)self conversation];
      double v12 = [v11 senderIdentifier];
      [v5 setSender:v12];
    }
    if (objc_opt_respondsToSelector())
    {
      id v13 = [(CKMessageEntryView *)self conversation];
      double v14 = [v13 recipientStrings];

      [v5 setRecipients:v14];
    }
    if (objc_opt_respondsToSelector()) {
      [v5 didCancelSendingPluginPayload:v19];
    }
    uint64_t v15 = [MEMORY[0x1E4F6BC18] sharedInstance];
    double v16 = [v19 associatedMessageGUID];
    uint64_t v17 = [v19 pluginBundleID];
    double v18 = [v15 existingDataSourceForMessageGUID:v16 bundleID:v17];

    [v18 endShowingLastConsumedBreadcrumb];
  }

  double v8 = v19;
LABEL_11:
}

- (void)messageEntryContentView:(id)a3 didRequestGenerativeContentForImageURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id location = 0;
  objc_initWeak(&location, self);
  if (v7)
  {
    double v8 = IMBalloonExtensionIDWithSuffix();
    int v9 = +[CKBalloonPluginManager sharedInstance];
    uint64_t v10 = [v9 viewControllerForPluginIdentifier:v8];

    if (objc_opt_respondsToSelector())
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __85__CKMessageEntryView_messageEntryContentView_didRequestGenerativeContentForImageURL___block_invoke;
      v11[3] = &unk_1E5621290;
      id v12 = v10;
      id v13 = v7;
      objc_copyWeak(&v14, &location);
      dispatch_async(MEMORY[0x1E4F14428], v11);
      objc_destroyWeak(&v14);
    }
  }
  objc_destroyWeak(&location);
}

void __85__CKMessageEntryView_messageEntryContentView_didRequestGenerativeContentForImageURL___block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __85__CKMessageEntryView_messageEntryContentView_didRequestGenerativeContentForImageURL___block_invoke_2;
  v3[3] = &unk_1E56293B8;
  objc_copyWeak(&v4, (id *)(a1 + 48));
  [v1 didSelectGPAsset:v2 recipeData:0 completion:v3];
  objc_destroyWeak(&v4);
}

void __85__CKMessageEntryView_messageEntryContentView_didRequestGenerativeContentForImageURL___block_invoke_2(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __85__CKMessageEntryView_messageEntryContentView_didRequestGenerativeContentForImageURL___block_invoke_3;
  v3[3] = &unk_1E5625EE8;
  objc_copyWeak(v4, (id *)(a1 + 32));
  v4[1] = a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
  objc_destroyWeak(v4);
}

void __85__CKMessageEntryView_messageEntryContentView_didRequestGenerativeContentForImageURL___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v3 = [WeakRetained delegate];
  id v4 = objc_loadWeakRetained(v2);
  [v3 messageEntryViewWantsGenerativePlaygroundPluginPresented:v4 presentationStyle:*(void *)(a1 + 40)];
}

- (void)messageEntryContentView:(id)a3 didStagePluginPayload:(id)a4
{
  id v5 = a4;
  id v6 = [(CKMessageEntryView *)self delegate];
  [v6 messageEntryView:self didInsertPluginPayload:v5];
}

- (void)messageEntryContentViewDidChange:(id)a3 isTextChange:(BOOL)a4 isShelfChange:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  int v9 = [v8 textView];
  uint64_t v10 = [v9 text];
  uint64_t v11 = [v10 length];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __82__CKMessageEntryView_messageEntryContentViewDidChange_isTextChange_isShelfChange___block_invoke;
  v15[3] = &unk_1E5623A38;
  v15[4] = self;
  id v16 = v8;
  uint64_t v17 = v11;
  id v12 = v8;
  [(CKMessageEntryView *)self handleContentViewChangeWithCompletion:v15];
  id v13 = [(CKMessageEntryView *)self appStrip];
  LODWORD(v10) = [v13 isMagnified];

  if (v10) {
    [(CKMessageEntryView *)self minifyAppStrip];
  }
  id v14 = [(CKMessageEntryView *)self delegate];
  [v14 messageEntryViewDidChange:self isTextChange:v6 isShelfChange:v5];
}

void __82__CKMessageEntryView_messageEntryContentViewDidChange_isTextChange_isShelfChange___block_invoke(uint64_t a1, uint64_t a2)
{
  id v17 = +[CKUIBehavior sharedBehaviors];
  if ([v17 isAppStripInKeyboard]
    && [*(id *)(a1 + 32) showsKeyboardPredictionBar]
    && CKShowAppStripInEntryView())
  {
    int v4 = [*(id *)(a1 + 40) isActive];

    if (!v4) {
      return;
    }
    id v17 = [*(id *)(a1 + 32) delegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v5 = *(void *)(a1 + 48);
      BOOL v6 = [*(id *)(a1 + 40) textView];
      id v7 = [v6 text];
      uint64_t v8 = [v7 length];

      if (v5 == v8)
      {
        if ([*(id *)(a1 + 32) shouldShowAppStrip])
        {
          int v9 = [*(id *)(a1 + 40) activeView];
          uint64_t v10 = [v9 text];
          if ([v10 length])
          {
            uint64_t v11 = [MEMORY[0x1E4F42B20] activeInstance];
            int v12 = [v11 isMinimized];

            if (!v12)
            {
              uint64_t v13 = 0;
LABEL_16:
              [v17 messageEntryView:*(void *)(a1 + 32) shouldShowAppStrip:v13 animated:a2];
              goto LABEL_17;
            }
          }
          else
          {
          }
        }
        if (([*(id *)(a1 + 32) shouldShowAppStrip] & 1) == 0)
        {
          id v14 = [*(id *)(a1 + 40) activeView];
          uint64_t v15 = [v14 text];
          uint64_t v16 = [v15 length];

          if (!v16)
          {
            uint64_t v13 = 1;
            goto LABEL_16;
          }
        }
      }
    }
  }
LABEL_17:
}

- (void)messageEntryContentViewShelfDidChange:(id)a3
{
  [(CKMessageEntryView *)self handleContentViewChangeWithCompletion:0];
  if (![(CKMessageEntryView *)self isSendingMessage])
  {
    id v4 = [(CKMessageEntryView *)self delegate];
    [v4 messageEntryViewDidChange:self isTextChange:0 isShelfChange:1];
  }
}

- (void)messageEntryContentViewWantsSendLaterPickerPresented:(id)a3
{
  id v4 = [(CKMessageEntryView *)self delegate];
  [v4 messageEntryViewWantsSendLaterPickerPresented:self];
}

- (void)messageEntryContentViewSendLaterPluginInfoUpdated:(id)a3
{
  id v4 = [(CKMessageEntryView *)self delegate];
  [v4 messageEntryViewSendLaterPluginInfoUpdated:self];

  [(CKMessageEntryView *)self updateEntryView];
}

- (void)handleContentViewChangeWithCompletion:(id)a3
{
  id v4 = a3;
  [(CKMessageEntryView *)self setEntryFieldCollapsed:0];
  BOOL v5 = [(CKMessageEntryView *)self layoutIsCurrentlyCompact];
  BOOL v6 = [(CKMessageEntryView *)self shouldEntryViewBeExpandedLayout];
  if (v5 && v6)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __60__CKMessageEntryView_handleContentViewChangeWithCompletion___block_invoke;
    v19[3] = &unk_1E5620F48;
    id v20 = v4;
    [(CKMessageEntryView *)self _animateExpandForManualToggle:0 completion:v19];
    id v7 = v20;
LABEL_9:

    goto LABEL_10;
  }
  if (![(CKMessageEntryView *)self entryFieldCollapsed] && !v5 && !v6)
  {
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __60__CKMessageEntryView_handleContentViewChangeWithCompletion___block_invoke_2;
    id v17 = &unk_1E5620F48;
    id v18 = v4;
    [(CKMessageEntryView *)self _animateToCompactLayoutCollapsing:0 completion:&v14];
    id v7 = v18;
    goto LABEL_9;
  }
  if (v4 && ![(CKMessageEntryView *)self animatingLayoutChange]) {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
LABEL_10:
  -[CKMessageEntryView setAudioComposition:](self, "setAudioComposition:", 0, v14, v15, v16, v17);
  [(CKMessageEntryView *)self configureForDisplayMode:1];
  uint64_t v8 = [(CKMessageEntryView *)self conversation];
  int v9 = [(CKMessageEntryView *)self composition];
  if ([(CKMessageEntryView *)self shouldShowCharacterCount])
  {
    if ([v8 shouldShowCharacterCount]
      && [v9 isTextOnly]
      && ([v9 subject],
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          uint64_t v11 = [v10 length],
          v10,
          !v11))
    {
      int v12 = [v9 hasContent];
      char v13 = v12;
      [(CKMessageEntryView *)self setCharacterCountHidden:v12 ^ 1u];
      if (v13) {
        goto LABEL_16;
      }
    }
    else
    {
      [(CKMessageEntryView *)self setCharacterCountHidden:1];
    }
    [(CKMessageEntryView *)self setNeedsLayout];
  }
LABEL_16:
  [(CKMessageEntryView *)self updateEntryView];
}

uint64_t __60__CKMessageEntryView_handleContentViewChangeWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

uint64_t __60__CKMessageEntryView_handleContentViewChangeWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (BOOL)showsKeyboardPredictionBar
{
  BOOL v3 = [(CKMessageEntryView *)self isPredictionBarEnabled];
  if (v3)
  {
    if ([(CKMessageEntryView *)self is3rdPartyKeyboardVisible]) {
      LOBYTE(v3) = 0;
    }
    else {
      LOBYTE(v3) = ![(CKMessageEntryView *)self isSendingMessage];
    }
  }
  return v3;
}

- (BOOL)isPredictionBarEnabled
{
  return objc_msgSend(MEMORY[0x1E4F42B08], "__ck_isPredictionBarEnabled");
}

- (BOOL)is3rdPartyKeyboardVisible
{
  uint64_t v2 = [MEMORY[0x1E4F42B30] sharedInputModeController];
  BOOL v3 = [v2 currentInputMode];
  char v4 = [v3 isExtensionInputMode];

  return v4;
}

- (BOOL)audioRecordingIsInEntryView
{
  if ([(CKMessageEntryView *)self isRecording]) {
    return 1;
  }
  char v4 = [(CKMessageEntryView *)self audioComposition];
  BOOL v3 = v4 != 0;

  return v3;
}

- (BOOL)messageEntryContentViewShouldBeginEditing:(id)a3
{
  if ([(CKMessageEntryView *)self isTransitioningForBrowserSwitcher]
    || [(CKMessageEntryView *)self audioRecordingIsInEntryView])
  {
    return 0;
  }
  BOOL v5 = [(CKMessageEntryView *)self delegate];
  char v6 = [v5 messageEntryViewShouldBeginEditing:self];

  return v6;
}

- (CGSize)messageEntryContentViewMaxShelfPluginViewSize:(id)a3
{
  char v4 = [(CKMessageEntryView *)self delegate];
  [v4 messageEntryViewMaxShelfPluginViewSize:self];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void)messageEntryContentViewDidBeginEditing:(id)a3 wasAlreadyActive:(BOOL)a4
{
  BOOL v4 = a4;
  double v6 = [(CKMessageEntryView *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    double v8 = [(CKMessageEntryView *)self delegate];
    [v8 messageEntryViewDidBeginEditing:self];
  }
  if (v4)
  {
    double v9 = [(CKMessageEntryView *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v12 = [(CKMessageEntryView *)self delegate];
      objc_msgSend(v12, "messageEntryView:shouldShowAppStrip:animated:", self, -[CKMessageEntryView shouldShowAppStrip](self, "shouldShowAppStrip"), 0);
    }
  }
  else
  {
    [(CKMessageEntryView *)self setEntryFieldCollapsed:0];
    uint64_t v11 = [(CKMessageEntryView *)self delegate];
    [v11 messageEntryViewDidBeginEditingNotAlreadyActive:self];

    [(CKMessageEntryView *)self updateEntryView];
  }
}

- (void)messageEntryContentViewDidEndEditing:(id)a3
{
  BOOL v4 = [(CKMessageEntryView *)self delegate];
  [v4 messageEntryViewDidEndEditing:self];

  if ([(CKMessageEntryView *)self entryFieldCollapsed])
  {
    [(CKMessageEntryView *)self updateEntryView];
  }
  else if (![(CKMessageEntryView *)self shouldEntryViewBeExpandedLayout])
  {
    [(CKMessageEntryView *)self setEntryFieldCollapsed:1 animated:1];
  }
}

- (void)messageEntryContentViewDidChangePencilMode:(id)a3
{
  id v4 = [(CKMessageEntryView *)self delegate];
  [v4 messageEntryViewDidChangePencilMode:self];
}

- (BOOL)messageEntryContentView:(id)a3 shouldInsertMediaObjects:(id)a4
{
  id v5 = a4;
  double v6 = [(CKMessageEntryView *)self delegate];
  LOBYTE(self) = [v6 messageEntryView:self shouldInsertMediaObjects:v5];

  return (char)self;
}

- (void)messageEntryContentView:(id)a3 didTapMediaObject:(id)a4
{
  id v5 = a4;
  id v6 = [(CKMessageEntryView *)self delegate];
  [v6 messageEntryView:self didTapMediaObject:v5];
}

- (void)messageEntryContentViewWasTapped:(id)a3 isLongPress:(BOOL)a4
{
  -[CKMessageEntryView setEntryFieldCollapsed:](self, "setEntryFieldCollapsed:", 0, a4);
  [(CKMessageEntryView *)self setEntryFieldCollapsed:[(CKMessageEntryView *)self layoutIsCurrentlyCompact] & [(CKMessageEntryView *)self shouldEntryViewBeExpandedLayout] animated:1];
  id v5 = [(CKMessageEntryView *)self inputDelegate];
  [v5 messageEntryViewInputDidTakeFocus:self];
}

- (void)messageEntryContentViewDidTapHandwritingKey:(id)a3
{
  id v4 = [(CKMessageEntryView *)self inputDelegate];
  [v4 messageEntryViewHandwritingButtonHit:self];
}

- (void)messageEntryContentViewTextFormattingAnimationsOptionsPresentationInProgress:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CKMessageEntryView *)self delegate];
  [v4 messageEntryViewTextFormattingAnimationsOptionsPresentationInProgress:v3];
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CKMessageEntryView *)self swipeGestureRecognizer];

  if (v8 == v7)
  {
    char v10 = (objc_class *)objc_opt_class();
    uint64_t v11 = NSStringFromClass(v10);
    char v12 = [v11 isEqualToString:@"UIVariableDelayLoupeGesture"];

    char v9 = v12 ^ 1;
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

- (void)photoButtonTouchDown:(id)a3
{
  p_inputDelegate = &self->_inputDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputDelegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_inputDelegate);
    [v7 messageEntryViewPhotoButtonTouchDown:self];
  }
}

- (void)photoButtonTouchUpOutside:(id)a3
{
  p_inputDelegate = &self->_inputDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputDelegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_inputDelegate);
    [v7 messageEntryViewPhotoButtonTouchUpOutside:self];
  }
}

- (void)photoButtonTouchCancel:(id)a3
{
  p_inputDelegate = &self->_inputDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputDelegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_inputDelegate);
    [v7 messageEntryViewPhotoButtonTouchCancel:self];
  }
}

- (void)photoButtonTapped:(id)a3
{
  p_inputDelegate = &self->_inputDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputDelegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = +[CKUIBehavior sharedBehaviors];
    int v8 = [v7 isAccessibilityPreferredContentSizeCategory];

    if (v8) {
      [(CKMessageEntryView *)self setEntryFieldCollapsed:0 animated:1];
    }
    id v9 = objc_loadWeakRetained((id *)p_inputDelegate);
    [v9 messageEntryViewPhotoButtonHit:self];

    [(CKMessageEntryView *)self setNeedsLayout];
  }
}

- (void)_handlePlusButtonTouchInside:(id)a3
{
  id v4 = [(CKMessageEntryView *)self composition];
  int v5 = [v4 hasContent];

  if (v5) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 1;
  }

  [(CKMessageEntryView *)self _updateSendMenuPresentationState:v6];
}

- (void)plusButtonTouchDown:(id)a3
{
  id v4 = a3;
  int v5 = IMLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CKMessageEntryView plusButtonTouchDown:]();
  }

  [(CKMessageEntryView *)self _handlePlusButtonTouchInside:v4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputDelegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_inputDelegate);
    [v8 messageEntryView:self touchDownInsidePlusButton:v4];
  }
  if (!self->_plusButtonFeedbackGeneratorIsActive)
  {
    self->_plusButtonFeedbackGeneratorIsActive = 1;
    [(UISelectionFeedbackGenerator *)self->_plusButtonFeedbackGenerator userInteractionStarted];
  }
}

- (void)plusButtonTouchUpOutside:(id)a3
{
  id v4 = a3;
  int v5 = IMLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CKMessageEntryView plusButtonTouchUpOutside:]();
  }

  [(CKMessageEntryView *)self _updateSendMenuPresentationState:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputDelegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_inputDelegate);
    [v8 messageEntryView:self touchUpOutsidePlusButton:v4];
  }
  if (self->_plusButtonFeedbackGeneratorIsActive)
  {
    self->_plusButtonFeedbackGeneratorIsActive = 0;
    [(UISelectionFeedbackGenerator *)self->_plusButtonFeedbackGenerator userInteractionEnded];
  }
}

- (void)plusButtonTouchCancel:(id)a3
{
  id v4 = a3;
  int v5 = IMLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CKMessageEntryView plusButtonTouchCancel:]();
  }

  [(CKMessageEntryView *)self _updateSendMenuPresentationState:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputDelegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_inputDelegate);
    [v8 messageEntryView:self touchCancelForPlusButton:v4];
  }
  if (self->_plusButtonFeedbackGeneratorIsActive)
  {
    self->_plusButtonFeedbackGeneratorIsActive = 0;
    [(UISelectionFeedbackGenerator *)self->_plusButtonFeedbackGenerator userInteractionCancelled];
  }
}

- (void)plusButtonTouchDragEnter:(id)a3
{
  id v4 = a3;
  int v5 = IMLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CKMessageEntryView plusButtonTouchDragEnter:]();
  }

  [(CKMessageEntryView *)self _handlePlusButtonTouchInside:v4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputDelegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_inputDelegate);
    [v8 messageEntryView:self touchDragEnterForPlusButton:v4];
  }
  if (!self->_plusButtonFeedbackGeneratorIsActive)
  {
    self->_plusButtonFeedbackGeneratorIsActive = 1;
    [(UISelectionFeedbackGenerator *)self->_plusButtonFeedbackGenerator userInteractionStarted];
  }
}

- (void)plusButtonTouchDragExit:(id)a3
{
  id v4 = a3;
  int v5 = IMLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CKMessageEntryView plusButtonTouchDragExit:]();
  }

  [(CKMessageEntryView *)self _updateSendMenuPresentationState:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputDelegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_inputDelegate);
    [v8 messageEntryView:self touchDragExitForPlusButton:v4];
  }
  if (self->_plusButtonFeedbackGeneratorIsActive)
  {
    self->_plusButtonFeedbackGeneratorIsActive = 0;
    [(UISelectionFeedbackGenerator *)self->_plusButtonFeedbackGenerator userInteractionEnded];
  }
}

- (void)didSelectPlusButton:(id)a3
{
  id v4 = a3;
  int v5 = IMLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CKMessageEntryView didSelectPlusButton:]();
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputDelegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_inputDelegate);
    [v8 messageEntryView:self didSelectPlusButton:v4];
  }
  if (self->_plusButtonFeedbackGeneratorIsActive)
  {
    self->_plusButtonFeedbackGeneratorIsActive = 0;
    [(UISelectionFeedbackGenerator *)self->_plusButtonFeedbackGenerator userInteractionEnded];
  }
}

- (void)plusButtonLongPressed:(id)a3
{
  id v4 = a3;
  int v5 = IMLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CKMessageEntryView plusButtonLongPressed:]();
  }

  uint64_t v6 = [v4 state];
  if (v6 == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_inputDelegate);
    char v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0
      && (id v9 = objc_loadWeakRetained((id *)&self->_inputDelegate),
          int v10 = [v9 shouldLaunchPhotosAppForPlusButtonLongPressInMessageEntryView:self],
          v9,
          !v10))
    {
      uint64_t v11 = IMLogHandleForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[CKMessageEntryView plusButtonLongPressed:]();
      }
    }
    else
    {
      uint64_t v11 = [v4 view];
      id v12 = objc_loadWeakRetained((id *)&self->_inputDelegate);
      char v13 = objc_opt_respondsToSelector();

      if (v13)
      {
        id v14 = objc_loadWeakRetained((id *)&self->_inputDelegate);
        [v14 messageEntryView:self didLongPressPlusButton:v11];
      }
      if (self->_plusButtonFeedbackGeneratorIsActive)
      {
        [(UISelectionFeedbackGenerator *)self->_plusButtonFeedbackGenerator selectionChanged];
        self->_plusButtonFeedbackGeneratorIsActive = 0;
        [(UISelectionFeedbackGenerator *)self->_plusButtonFeedbackGenerator userInteractionEnded];
      }
    }
  }
  else
  {
    uint64_t v15 = v6;
    uint64_t v11 = IMLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[CKMessageEntryView plusButtonLongPressed:](v15, v11);
    }
  }
}

- (void)browserButtonTapped:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0
    || (id v7 = objc_loadWeakRetained((id *)p_delegate),
        int v8 = [v7 shouldMessageEntryViewReportBrowserButtonHitToInputDelegate:self],
        v7,
        v8))
  {
    id v9 = objc_loadWeakRetained((id *)&self->_inputDelegate);
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      uint64_t v11 = +[CKUIBehavior sharedBehaviors];
      int v12 = [v11 isAccessibilityPreferredContentSizeCategory];

      if (v12) {
        [(CKMessageEntryView *)self setEntryFieldCollapsed:0 animated:1];
      }
      id v13 = objc_loadWeakRetained((id *)&self->_inputDelegate);
      [v13 messageEntryViewBrowserButtonHit:self];

      [(CKMessageEntryView *)self setNeedsLayout];
    }
  }
}

- (void)arrowButtonTapped:(id)a3
{
}

- (void)collapsedPlaceholderLabelTapped:(id)a3
{
}

- (void)presentAudioActionButtons
{
  BOOL v3 = [(CKMessageEntryView *)self cancelButton];
  [v3 setCkTintColor:0xFFFFFFFFLL];

  id v4 = [(CKMessageEntryView *)self cancelButton];
  [v4 setUserInteractionEnabled:1];

  [(CKMessageEntryView *)self configureForDisplayMode:2];
}

- (void)dictationButtonTapped:(id)a3
{
  id v7 = objc_alloc_init(MEMORY[0x1E4F42958]);
  [v7 setInvocationSource:@"UIDictationInputModeInvocationSourceMicButtonInMessagesTextField"];
  id v4 = [MEMORY[0x1E4F42B30] sharedInputModeController];
  int v5 = [(CKMessageEntryView *)self contentView];
  char v6 = [v5 textView];
  [v4 toggleDictationForResponder:v6 WithOptions:v7];
}

- (double)_accessoryViewFadeDuration
{
  return 0.0;
}

- (void)beginSendMenuFullScreenPresentation
{
}

- (void)beginSendMenuPopoverPresentation
{
}

- (void)endSendMenuPresentation
{
}

- (void)sendMenuPopoverMetricsDidChange:(id)a3
{
  id v4 = a3;
  int v5 = [(CKMessageEntryView *)self delegate];
  char v6 = [v5 messageEntryViewActiveSendMenuPresentation:self];

  if (v6)
  {
    id v7 = (void *)[v6 newPopoverLayoutMetrics];
    int v8 = v7;
    if (v7)
    {
      uint64_t v9 = [v7 state];
      if (v4 && [v4 state] == v9 || (unint64_t)(v9 - 1) >= 2)
      {
        [(CKMessageEntryView *)self setNeedsLayout];
      }
      else
      {
        [(CKMessageEntryView *)self layoutIfNeeded];
        char v10 = +[CKUIBehavior sharedBehaviors];
        uint64_t v11 = [v10 entryViewSendMenuContentViewWidthAnimator];
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __54__CKMessageEntryView_sendMenuPopoverMetricsDidChange___block_invoke;
        v12[3] = &unk_1E5620C40;
        void v12[4] = self;
        [v11 addAnimations:v12];
        [v11 startAnimation];
      }
    }
  }
}

uint64_t __54__CKMessageEntryView_sendMenuPopoverMetricsDidChange___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsLayout];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 layoutIfNeeded];
}

- (void)_setupWaveformView
{
  BOOL v3 = [(CKMessageEntryView *)self waveformView];

  if (!v3)
  {
    id v4 = [CKMessageEntryWaveformView alloc];
    int v5 = -[CKMessageEntryWaveformView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(CKMessageEntryWaveformView *)v5 setBackgroundColor:0];
    [(CKMessageEntryWaveformView *)v5 setOpaque:0];
    [(CKMessageEntryWaveformView *)v5 setUserInteractionEnabled:0];
    [(CKMessageEntryView *)self setWaveformView:v5];
    -[CKMessageEntryWaveformView sizeThatFits:](v5, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __40__CKMessageEntryView__setupWaveformView__block_invoke;
    v8[3] = &unk_1E5625B88;
    v8[4] = self;
    void v8[5] = v6;
    v8[6] = v7;
    [MEMORY[0x1E4F42FF0] performWithoutAnimation:v8];
  }
}

uint64_t __40__CKMessageEntryView__setupWaveformView__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setWaveformViewSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  [*(id *)(a1 + 32) setNeedsLayout];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 layoutIfNeeded];
}

- (void)keyCommandSend:(id)a3
{
  id v4 = a3;
  if ([(CKMessageEntryView *)self sendButtonEnabled]
    && [(CKMessageEntryView *)self shouldAllowSendWhenSendButtonDisabled])
  {
    [(CKMessageEntryView *)self touchUpInsideSendButton:v4];
  }
}

- (void)touchUpInsideSendButton:(id)a3
{
  id v4 = a3;
  int v5 = _os_activity_create(&dword_18EF18000, "com.apple.messages.SendButtonTapped", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v5, &v12);
  if ([(CKMessageEntryView *)self entryFieldCollapsed]
    && ![(CKMessageEntryView *)self hasRecording])
  {
    [(CKMessageEntryView *)self setEntryFieldCollapsed:0 animated:1];
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 postNotificationName:@"CKMessageEntryViewSendButtonPressedNotification" object:0];

    uint64_t v7 = [(CKMessageEntryView *)self contentView];
    [v7 collapseTextFieldsIfInPencilMode];

    int v8 = [(CKMessageEntryView *)self delegate];
    [v8 messageEntryViewSendButtonHit:self];

    uint64_t v9 = [MEMORY[0x1E4F42B08] activeKeyboard];
    [v9 updateLayout];

    if ([(CKMessageEntryView *)self _isRunningInMVS])
    {
      char v10 = [(CKMessageEntryView *)self sendButton];
      [v10 setEnabled:0];
    }
    if ([(CKMessageEntryView *)self hasRecording])
    {
      uint64_t v11 = [(CKMessageEntryView *)self audioMessageAppDelegate];
      [v11 audioMessageDidSendMessage];
    }
  }
  os_activity_scope_leave(&v12);
}

- (BOOL)_canSend
{
  BOOL v3 = [(CKMessageEntryView *)self conversation];
  id v4 = [v3 sendingService];
  int v5 = +[CKUIBehavior sharedBehaviors];
  if ([v5 isSendButtonEnabledOnPlatform])
  {
    char v6 = [(CKMessageEntryView *)self sendButtonEnabled];
  }
  else
  {
    uint64_t v7 = +[CKUIBehavior sharedBehaviors];
    char v6 = [v7 isSendButtonEnabledOnPlatform];
  }
  BOOL v8 = v6 & ![(CKMessageEntryView *)self shouldRecordForService:v4];

  return v8;
}

- (void)showMessageEffectsHint
{
  CKFrameworkBundle();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v3 = [v4 localizedStringForKey:@"MESSAGE_EFFECTS_COMPOSITION_HINT" value:&stru_1EDE4CA38 table:@"ChatKit"];
  [(CKMessageEntryView *)self showHintWithText:v3 animatingReferenceButton:0];
}

- (void)showHintWithText:(id)a3 animatingReferenceButton:(BOOL)a4
{
  id v5 = a3;
  char v6 = [(CKMessageEntryView *)self audioButton];
  uint64_t v7 = [(CKMessageEntryView *)self contentClipView];
  BOOL v8 = [(CKMessageEntryView *)self inputButtonContainerView];
  uint64_t v9 = [(CKMessageEntryView *)self sendButton];
  char v10 = [CKMessageEntryHintView alloc];
  uint64_t v11 = [v6 button];
  [(CKMessageEntryView *)self coverInsets];
  os_activity_scope_state_s v12 = -[CKMessageEntryHintView initWithReferenceButton:coverInsets:](v10, "initWithReferenceButton:coverInsets:", v11);

  id v13 = [(CKMessageEntryHintView *)v12 hintLabel];
  [v13 setText:v5];

  id v14 = [(CKMessageEntryView *)self buttonAndTextAreaContainerView];
  [v14 addSubview:v12];

  [(CKMessageEntryView *)self setHintView:v12];
  [(CKMessageEntryView *)self configureForDisplayMode:1];
  [(CKMessageEntryView *)self updateEntryView];
  [(CKMessageEntryView *)self setNeedsLayout];
  [(CKMessageEntryView *)self layoutIfNeeded];
  [(CKMessageEntryHintView *)v12 setHidden:0 animated:1 completion:0];
  [v6 setAlpha:0.0];
  uint64_t v15 = (void *)MEMORY[0x1E4F42FF0];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __64__CKMessageEntryView_showHintWithText_animatingReferenceButton___block_invoke;
  v28[3] = &unk_1E5620AA8;
  id v16 = v7;
  id v29 = v16;
  id v17 = v8;
  id v30 = v17;
  id v18 = v9;
  id v31 = v18;
  [v15 animateWithDuration:327680 delay:v28 options:0 animations:0.5 completion:0.0];
  double v24 = v12;
  double v27 = v18;
  double v25 = v6;
  double v26 = v17;
  id v19 = v18;
  id v20 = v17;
  id v21 = v16;
  id v22 = v6;
  double v23 = v12;
  im_dispatch_after();
}

uint64_t __64__CKMessageEntryView_showHintWithText_animatingReferenceButton___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  [*(id *)(a1 + 40) setAlpha:0.0];
  uint64_t v2 = *(void **)(a1 + 48);

  return [v2 setAlpha:0.0];
}

void __64__CKMessageEntryView_showHintWithText_animatingReferenceButton___block_invoke_2(uint64_t a1)
{
  id location = 0;
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = objc_initWeak(&location, v2);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__CKMessageEntryView_showHintWithText_animatingReferenceButton___block_invoke_3;
  v10[3] = &unk_1E5625BD8;
  objc_copyWeak(&v11, &location);
  v10[4] = *(void *)(a1 + 40);
  [v2 setHidden:1 animated:1 completion:v10];

  [*(id *)(a1 + 48) setAlpha:1.0];
  id v4 = (void *)MEMORY[0x1E4F42FF0];
  uint64_t v5 = *(void *)(a1 + 80);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__CKMessageEntryView_showHintWithText_animatingReferenceButton___block_invoke_4;
  v6[3] = &unk_1E5620AA8;
  id v7 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 64);
  id v9 = *(id *)(a1 + 72);
  [v4 animateWithDuration:v5 delay:v6 options:0 animations:0.5 completion:0.0];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

uint64_t __64__CKMessageEntryView_showHintWithText_animatingReferenceButton___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained removeFromSuperview];

  [*(id *)(a1 + 32) setHintView:0];
  id v3 = *(void **)(a1 + 32);

  return [v3 updateEntryView];
}

uint64_t __64__CKMessageEntryView_showHintWithText_animatingReferenceButton___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  [*(id *)(a1 + 40) setAlpha:1.0];
  uint64_t v2 = *(void **)(a1 + 48);

  return [v2 setAlpha:1.0];
}

- (void)conversationPreferredServiceChanged:(id)a3
{
  [(CKMessageEntryView *)self updateEntryView];
  [(CKMessageEntryView *)self updateAppsMenu];
  id v6 = [(CKMessageEntryView *)self conversation];
  id v4 = [v6 sendingService];
  uint64_t v5 = [(CKMessageEntryView *)self audioRecordingView];
  [v5 setService:v4];
}

- (BOOL)shouldRecordForService:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x1E4F6E778], "sharedFeatureFlags", a3);
  char v5 = [v4 isAudioMessagesEntryViewRecordingEnabled];

  if ((v5 & 1) == 0)
  {
    id v6 = [(CKMessageEntryView *)self audioComposition];

    if (v6) {
      return 0;
    }
  }
  id v7 = [(CKMessageEntryView *)self contentView];
  id v8 = [v7 pluginView];

  if (v8) {
    return 0;
  }
  char v10 = [(CKMessageEntryView *)self contentView];
  id v11 = [v10 composition];
  uint64_t v12 = [v11 hasContent];

  return v12 ^ 1;
}

- (void)updateAudioMessageRecordingAvailability
{
  id v14 = [(CKMessageEntryView *)self conversation];
  id v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isPriusEnabled];

  if (!v4)
  {
    id v8 = [v14 recipients];
    if ([v8 count])
    {
      id v9 = [v14 sendingService];
      char v10 = objc_msgSend(v9, "__ck_isSMS");

      if (v10) {
        goto LABEL_7;
      }
      id v8 = [v14 sendingService];
      if ([(CKMessageEntryView *)self shouldRecordForService:v8]) {
        goto LABEL_9;
      }
    }
LABEL_10:
    uint64_t v11 = 0;
    goto LABEL_11;
  }
  char v5 = [(CKMessageEntryView *)self conversation];
  id v6 = [v5 chat];
  int v7 = [v6 supportsCapabilities:64];

  if (!v7)
  {
LABEL_7:
    uint64_t v11 = 0;
    goto LABEL_12;
  }
  id v8 = [v14 sendingService];
  if (![(CKMessageEntryView *)self shouldRecordForService:v8]) {
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v12 = [(CKMessageEntryView *)self composition];
  uint64_t v11 = [v12 hasContent] ^ 1;

LABEL_11:
LABEL_12:
  [(CKMessageEntryView *)self setAudioMessageRecordingAvailable:v11];
  id v13 = [(CKMessageEntryView *)self audioMessageAppDelegate];
  [v13 audioMessageRecordingAvailabilityChanged];
}

- (void)updateEntryView
{
  uint64_t v161 = *MEMORY[0x1E4F143B8];
  id v3 = [(CKMessageEntryView *)self conversation];
  int v4 = [v3 sendingService];
  char v5 = +[CKUIBehavior sharedBehaviors];
  if ([v5 isSendButtonEnabledOnPlatform])
  {
    int v144 = [(CKMessageEntryView *)self sendButtonEnabled];
  }
  else
  {
    id v6 = +[CKUIBehavior sharedBehaviors];
    int v144 = [v6 isSendButtonEnabledOnPlatform];
  }
  BOOL v145 = [(CKMessageEntryView *)self shouldRecordForService:v4];
  BOOL v143 = [(CKMessageEntryView *)self shouldShowAudioButton];
  [(CKMessageEntryView *)self updateAudioMessageRecordingAvailability];
  BOOL v142 = [(CKMessageEntryView *)self pluginButtonsEnabled];
  int v7 = [(CKMessageEntryView *)self conversation];
  v147 = [v7 lastAddressedHandle];

  id v8 = [(CKMessageEntryView *)self conversation];
  double v146 = [v8 lastAddressedSIMID];

  int v9 = [v3 isBlockedByCommunicationLimits];
  [(CKMessageEntryView *)self setUserInteractionEnabled:(v9 | [(CKMessageEntryView *)self shouldBlurForMessageEditing]) ^ 1];
  if ([MEMORY[0x1E4F6BDC0] iMessageEnabledForSenderLastAddressedHandle:v147 simID:v146])
  {
    char v10 = [(CKMessageEntryView *)self conversation];
    uint64_t v11 = [v10 recipients];
    BOOL v12 = [v11 count] != 0;
  }
  else
  {
    BOOL v12 = 0;
  }
  id v13 = [(CKMessageEntryView *)self contentView];
  id v14 = [MEMORY[0x1E4F6E778] sharedInstance];
  unsigned int v15 = [v14 isTextKit2Enabled];

  id v16 = [(CKMessageEntryView *)self conversation];
  id v17 = [v16 chat];
  int v18 = [v17 supportsCapabilities:0x100000];

  id v19 = [(CKMessageEntryView *)self conversation];
  id v20 = [v19 chat];
  if (v20) {
    uint64_t v21 = v18 & v15;
  }
  else {
    uint64_t v21 = v12;
  }

  id v22 = [v13 textView];
  [v22 setExpressiveTextEnabled:v21];

  if (v21)
  {
    double v23 = [(CKMessageEntryView *)self contentView];
    [v23 unpauseTextEffectsCoordinator];
  }
  if (!v9)
  {
    if ([(CKMessageEntryView *)self hasFailedRecipients]
      || [(CKMessageEntryView *)self hasUnreachableEmergencyRecipient])
    {
      BOOL v142 = 0;
    }
    id v141 = [(CKMessageEntryView *)self _placeholderTextForConversation:v3];
    char v139 = [(CKMessageEntryView *)self _sendButtonColor];
    [v13 setPlaceholderText:v141];
    objc_msgSend(v13, "setBalloonColor:", -[CKMessageEntryView _balloonColor](self, "_balloonColor"));
    [v13 setConversation:v3];
    if ([v3 isStewieConversation]) {
      char v27 = 1;
    }
    else {
      char v27 = [v3 isEmergencyTranscriptSharingConversation];
    }
    double v28 = [v3 recipients];
    unint64_t v29 = [v28 count];

    id v30 = [MEMORY[0x1E4F6BC48] sharedInstance];
    char v31 = [v30 isMessagingActiveOverSatellite];

    double v32 = [v3 handles];
    if ([v32 count]) {
      char v33 = [v3 isSatelliteSendingService];
    }
    else {
      char v33 = 0;
    }

    if (v29 < 2) {
      char v34 = v33;
    }
    else {
      char v34 = 0;
    }
    double v35 = [v13 textView];
    double v36 = v35;
    char v37 = v31 ^ 1 | v34 | v27;
    if (v37)
    {
      [v35 setEditable:1];

      double v38 = [v13 textView];
      double v39 = v38;
      uint64_t v40 = 1;
    }
    else
    {
      [v35 setEditable:0];

      double v38 = [v13 textView];
      double v39 = v38;
      uint64_t v40 = 0;
    }
    [v38 setUserInteractionEnabled:v40];

    if ([v3 isStewieConversation]) {
      [v13 setShouldStripEmojis:1];
    }
    double v140 = [v3 recipient];
    double v41 = [v13 textView];
    double v42 = [v140 IDSCanonicalAddress];
    [v41 setAutocorrectionContext:v42];

    double v43 = [v3 chat];
    double v44 = [v43 valueForChatProperty:*MEMORY[0x1E4F6BE68]];
    int v45 = [v44 BOOLValue];

    uint64_t v46 = [v4 supportsCapability:*MEMORY[0x1E4F6E0C0]] & (v45 ^ 1);
    if (v46) {
      uint64_t v47 = 1;
    }
    else {
      uint64_t v47 = [v4 supportsCapability:*MEMORY[0x1E4F6DFF8]];
    }
    double v48 = [v13 textView];
    [v48 setAcceptsPayloads:v46];

    dispatch_time_t v49 = [v13 textView];
    [v49 setSendCurrentLocationFromKeyboardEnabled:v47];

    unsigned int v50 = objc_msgSend(v4, "__ck_isSMS");
    dispatch_time_t v51 = [v13 textView];
    [v51 setSmartDashesType:v50];

    uint64_t v52 = [v13 textView];
    [v52 setSmartQuotesType:v50];

    double v53 = [v13 subjectView];
    [v53 setSmartDashesType:v50];

    double v54 = [v13 subjectView];
    [v54 setSmartQuotesType:v50];

    uint64_t v55 = [(CKMessageEntryView *)self sendButton];
    LODWORD(v54) = [v55 isEnabled];

    if (v144 != v54)
    {
      CGPoint v56 = @"disable";
      if (v144) {
        CGPoint v56 = @"enable";
      }
      double v138 = v56;
      if (IMOSLoggingEnabled())
      {
        long long v57 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v158 = v138;
          __int16 v159 = 2112;
          double v160 = v3;
          _os_log_impl(&dword_18EF18000, v57, OS_LOG_TYPE_INFO, "Will %@ Send Button... for conversation: %@", buf, 0x16u);
        }
      }
      if (IMOSLoggingEnabled())
      {
        double v58 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        {
          CGRect v59 = [(CKMessageEntryView *)self conversation];
          CGRect v60 = [v59 sendingService];
          *(_DWORD *)buf = 138412290;
          v158 = v60;
          _os_log_impl(&dword_18EF18000, v58, OS_LOG_TYPE_INFO, "Conversation Sending Service: %@", buf, 0xCu);
        }
      }
      if (IMOSLoggingEnabled())
      {
        int v61 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
        {
          int v62 = [MEMORY[0x1E4F6BDC0] iMessageEnabledForSenderLastAddressedHandle:v147 simID:v146];
          double v63 = @"NO";
          if (v62) {
            double v63 = @"YES";
          }
          *(_DWORD *)buf = 138412290;
          v158 = v63;
          _os_log_impl(&dword_18EF18000, v61, OS_LOG_TYPE_INFO, "iMessage enabled: %@", buf, 0xCu);
        }
      }
      if (IMOSLoggingEnabled())
      {
        uint64_t v64 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
        {
          int v65 = [MEMORY[0x1E4F6BDC0] smsEnabled];
          double v66 = @"NO";
          if (v65) {
            double v66 = @"YES";
          }
          *(_DWORD *)buf = 138412290;
          v158 = v66;
          _os_log_impl(&dword_18EF18000, v64, OS_LOG_TYPE_INFO, "SMS enabled: %@", buf, 0xCu);
        }
      }
      if (IMOSLoggingEnabled())
      {
        double v67 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
        {
          char v137 = v37;
          double v68 = [(CKMessageEntryView *)self composition];
          double v69 = [v68 text];
          double v70 = [(CKMessageEntryView *)self contentView];
          double v71 = [v70 textView];
          v72 = [v71 compositionText];
          int v73 = [v69 isEqualToAttributedString:v72];
          double v74 = @"NO";
          if (v73) {
            double v74 = @"YES";
          }
          *(_DWORD *)buf = 138412290;
          v158 = v74;
          _os_log_impl(&dword_18EF18000, v67, OS_LOG_TYPE_INFO, "Composition text matches contentView text: %@", buf, 0xCu);

          char v37 = v137;
        }
      }
      if (IMOSLoggingEnabled())
      {
        double v75 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
        {
          int v76 = [(CKMessageEntryView *)self composition];
          double v77 = [v76 text];
          uint64_t v78 = [v77 length];
          double v79 = @"YES";
          if (!v78) {
            double v79 = @"NO";
          }
          *(_DWORD *)buf = 138412290;
          v158 = v79;
          _os_log_impl(&dword_18EF18000, v75, OS_LOG_TYPE_INFO, "Composition Length > 0: %@", buf, 0xCu);
        }
      }
      if (IMOSLoggingEnabled())
      {
        double v80 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
        {
          v81 = [(CKMessageEntryView *)self composition];
          int v82 = [v81 hasContent];
          double v83 = @"NO";
          if (v82) {
            double v83 = @"YES";
          }
          *(_DWORD *)buf = 138412290;
          v158 = v83;
          _os_log_impl(&dword_18EF18000, v80, OS_LOG_TYPE_INFO, "Composition has content: %@", buf, 0xCu);
        }
      }
      if (IMOSLoggingEnabled())
      {
        double v84 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
        {
          int v85 = [(CKMessageEntryView *)self conversation];
          v86 = [v85 sendingService];
          BOOL v87 = [(CKMessageEntryView *)self shouldRecordForService:v86];
          double v88 = @"NO";
          if (v87) {
            double v88 = @"YES";
          }
          *(_DWORD *)buf = 138412290;
          v158 = v88;
          _os_log_impl(&dword_18EF18000, v84, OS_LOG_TYPE_INFO, "shouldRecordForService: %@", buf, 0xCu);
        }
      }
      if (IMOSLoggingEnabled())
      {
        BOOL v89 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
        {
          BOOL v90 = [(CKMessageEntryView *)self contentView];
          int v91 = [v90 isShowingDictationPlaceholder];
          double v92 = @"NO";
          if (v91) {
            double v92 = @"YES";
          }
          *(_DWORD *)buf = 138412290;
          v158 = v92;
          _os_log_impl(&dword_18EF18000, v89, OS_LOG_TYPE_INFO, "isShowingDictationPlaceholder: %@", buf, 0xCu);
        }
      }
      if (IMOSLoggingEnabled())
      {
        v93 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
        {
          double v94 = [(CKMessageEntryView *)self conversation];
          double v95 = [v94 pendingHandles];
          uint64_t v96 = [v95 count];
          *(_DWORD *)buf = 134217984;
          v158 = (__CFString *)v96;
          _os_log_impl(&dword_18EF18000, v93, OS_LOG_TYPE_INFO, "Conversation pendingHandles count: %lu", buf, 0xCu);
        }
      }
      if (IMOSLoggingEnabled())
      {
        double v97 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
        {
          double v98 = [(CKMessageEntryView *)self conversation];
          double v99 = [v98 chat];
          v100 = [v99 participants];
          uint64_t v101 = [v100 count];
          *(_DWORD *)buf = 134217984;
          v158 = (__CFString *)v101;
          _os_log_impl(&dword_18EF18000, v97, OS_LOG_TYPE_INFO, "Conversation chat participant count: %lu", buf, 0xCu);
        }
      }
      if (IMOSLoggingEnabled())
      {
        int v102 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v102, OS_LOG_TYPE_INFO))
        {
          v103 = [(CKMessageEntryView *)self conversation];
          uint64_t v104 = [v103 recipientCount];
          double v105 = @"YES";
          if (!v104) {
            double v105 = @"NO";
          }
          *(_DWORD *)buf = 138412290;
          v158 = v105;
          _os_log_impl(&dword_18EF18000, v102, OS_LOG_TYPE_INFO, "Recipient Count > 0: %@", buf, 0xCu);
        }
      }
      if (IMOSLoggingEnabled())
      {
        double v106 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v106, OS_LOG_TYPE_INFO))
        {
          BOOL v107 = [(CKMessageEntryView *)self isComposingRecipient];
          double v108 = @"NO";
          if (v107) {
            double v108 = @"YES";
          }
          *(_DWORD *)buf = 138412290;
          v158 = v108;
          _os_log_impl(&dword_18EF18000, v106, OS_LOG_TYPE_INFO, "Composing Recipients: %@", buf, 0xCu);
        }
      }
      if (IMOSLoggingEnabled())
      {
        double v109 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v109, OS_LOG_TYPE_INFO))
        {
          BOOL v110 = [(CKMessageEntryView *)self hasFailedRecipients];
          double v111 = @"NO";
          if (v110) {
            double v111 = @"YES";
          }
          *(_DWORD *)buf = 138412290;
          v158 = v111;
          _os_log_impl(&dword_18EF18000, v109, OS_LOG_TYPE_INFO, "Has Failed Recipients: %@", buf, 0xCu);
        }
      }
      if (IMOSLoggingEnabled())
      {
        double v112 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v112, OS_LOG_TYPE_INFO))
        {
          BOOL v113 = [(CKMessageEntryView *)self hasUnreachableEmergencyRecipient];
          double v114 = @"NO";
          if (v113) {
            double v114 = @"YES";
          }
          *(_DWORD *)buf = 138412290;
          v158 = v114;
          _os_log_impl(&dword_18EF18000, v112, OS_LOG_TYPE_INFO, "Has Unreachable Emergency Recipient: %@", buf, 0xCu);
        }
      }
    }
    BOOL v115 = [(CKMessageEntryView *)self _isDictationEnabled];
    if (v145 && [(CKMessageEntryView *)self displayMode] == 1)
    {
      char v116 = [MEMORY[0x1E4F42B30] dictationInputModeIsFunctional];
      char v117 = v37;
      char v118 = !v115;
      char v119 = v117 & v116;
    }
    else
    {
      char v119 = 0;
      char v118 = 1;
    }
    double v120 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v121 = [v120 isAudioMessagesEntryViewRecordingEnabled];

    if (v121)
    {
      BOOL v143 = [(CKMessageEntryView *)self shouldShowAudioButton];
      unint64_t v122 = [(CKMessageEntryView *)self displayMode];
      char v123 = v145;
      char v118 = v143 || !v145 || !v115;
      if (v122 != 1) {
        char v123 = 1;
      }
      LOBYTE(v145) = v123;
    }
    BOOL v124 = [(CKMessageEntryView *)self isSendingMessage];
    v148[0] = MEMORY[0x1E4F143A8];
    v148[1] = 3221225472;
    v148[2] = __37__CKMessageEntryView_updateEntryView__block_invoke;
    v148[3] = &unk_1E5622950;
    v148[4] = self;
    char v149 = v118;
    char v150 = v119;
    BOOL v151 = !v143;
    BOOL v152 = !v124;
    char v153 = v139;
    char v154 = v144;
    BOOL v155 = v145;
    BOOL v156 = v142;
    [MEMORY[0x1E4F42FF0] performWithoutAnimation:v148];
    double v125 = [(CKMessageEntryView *)self sendButtonClickInteraction];
    BOOL v126 = v125 == 0;

    if (v126)
    {
      id v127 = objc_alloc_init(MEMORY[0x1E4F430D8]);
      [(CKMessageEntryView *)self setSendButtonClickInteraction:v127];
    }
    id v128 = [(CKMessageEntryView *)self clickInteractionDelegate];

    if (v128)
    {
      double v129 = [(CKMessageEntryView *)self clickInteractionDelegate];
      CGRect v130 = [(CKMessageEntryView *)self sendButtonClickInteraction];
      [v130 setDelegate:v129];
    }
    CGRect v131 = [(CKMessageEntryView *)self sendButton];
    double v132 = [v131 interactions];
    double v133 = [(CKMessageEntryView *)self sendButtonClickInteraction];
    int v134 = [v132 containsObject:v133];

    if ((![(CKMessageEntryView *)self shouldAllowImpactSend] | v134))
    {
      if (([(CKMessageEntryView *)self shouldAllowImpactSend] | v134 ^ 1))
      {
LABEL_140:
        [(CKMessageEntryView *)self updateKnockoutView];
        [(CKMessageEntryView *)self updateBackgroundView];
        [(CKMessageEntryView *)self setNeedsLayout];

        goto LABEL_141;
      }
      double v135 = [(CKMessageEntryView *)self sendButton];
      double v136 = [(CKMessageEntryView *)self sendButtonClickInteraction];
      [v135 removeInteraction:v136];
    }
    else
    {
      double v135 = [(CKMessageEntryView *)self sendButton];
      double v136 = [(CKMessageEntryView *)self sendButtonClickInteraction];
      [v135 addInteraction:v136];
    }

    goto LABEL_140;
  }
  if (IMOSLoggingEnabled())
  {
    double v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      double v25 = [v3 chat];
      double v26 = [v25 chatIdentifier];
      *(_DWORD *)buf = 138412290;
      v158 = v26;
      _os_log_impl(&dword_18EF18000, v24, OS_LOG_TYPE_INFO, "Disabling sendButton due to conversation being blocked by downtime with chatIdentifier: %@", buf, 0xCu);
    }
  }
LABEL_141:
}

void __37__CKMessageEntryView_updateEntryView__block_invoke(uint64_t a1)
{
  id v20 = [*(id *)(a1 + 32) dictationButton];
  [v20 setHidden:*(unsigned __int8 *)(a1 + 40)];
  [v20 setEnabled:*(unsigned __int8 *)(a1 + 41)];
  uint64_t v2 = [*(id *)(a1 + 32) audioButton];
  [v2 setHidden:*(unsigned __int8 *)(a1 + 42)];

  id v3 = [*(id *)(a1 + 32) audioButton];
  [v3 setUserInteractionEnabled:*(unsigned __int8 *)(a1 + 43)];

  if ([*(id *)(a1 + 32) shouldShowSendButton] && !CKIsRunningInMacCatalyst())
  {
    int v4 = [*(id *)(a1 + 32) sendButton];
    [v4 setCkTintColor:*(char *)(a1 + 44)];
    if ([*(id *)(a1 + 32) entryFieldCollapsed]) {
      [v4 setCkTintColor:*(char *)(a1 + 44)];
    }
    [v4 setEnabled:*(unsigned __int8 *)(a1 + 45)];
    [v4 setHidden:*(unsigned __int8 *)(a1 + 46)];
    [v4 setUserInteractionEnabled:*(unsigned __int8 *)(a1 + 43)];
  }
  else
  {
    if (!CKIsRunningInMacCatalyst()) {
      goto LABEL_11;
    }
    int v4 = [*(id *)(a1 + 32) audioButton];
    char v5 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    char v6 = [v5 isAudioMessagesEntryViewRecordingEnabled];

    if ((v6 & 1) == 0) {
      [v4 setCkTintColor:0xFFFFFFFFLL];
    }
    int v7 = [*(id *)(a1 + 32) sendAudioButton];
    objc_msgSend(v7, "setCkTintColor:", objc_msgSend(*(id *)(a1 + 32), "_sendButtonColor"));
  }
LABEL_11:
  if ([*(id *)(a1 + 32) shouldShowPluginButtons])
  {
    id v8 = [*(id *)(a1 + 32) photoButton];
    [v8 setCkTintColor:0xFFFFFFFFLL];

    int v9 = [*(id *)(a1 + 32) photoButton];
    [v9 setEnabled:*(unsigned __int8 *)(a1 + 47)];

    char v10 = [*(id *)(a1 + 32) photoButton];
    [v10 setUserInteractionEnabled:*(unsigned __int8 *)(a1 + 43)];

    uint64_t v11 = [*(id *)(a1 + 32) browserButton];
    BOOL v12 = +[CKUIBehavior sharedBehaviors];
    objc_msgSend(v11, "setCkTintColor:", objc_msgSend(v12, "entryViewButtonDefaultColor"));

    id v13 = [*(id *)(a1 + 32) browserButton];
    [v13 setEnabled:*(unsigned __int8 *)(a1 + 47)];

    id v14 = [*(id *)(a1 + 32) browserButton];
    [v14 setUserInteractionEnabled:*(unsigned __int8 *)(a1 + 43)];

    uint64_t v15 = [*(id *)(a1 + 32) _shouldEnablePlusButton];
    id v16 = [*(id *)(a1 + 32) plusButton];
    [v16 setUserInteractionEnabled:v15];

    id v17 = [*(id *)(a1 + 32) plusButton];
    [v17 setEnabled:v15];
  }
  if (([*(id *)(a1 + 32) photoButtonEnabled] & 1) == 0)
  {
    int v18 = [*(id *)(a1 + 32) photoButton];
    [v18 setEnabled:0];

    id v19 = [*(id *)(a1 + 32) photoButton];
    [v19 setUserInteractionEnabled:0];
  }
}

- (BOOL)_isDictationEnabled
{
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2050000000;
  id v3 = (void *)getAFPreferencesClass_softClass;
  id v22 = (void *)getAFPreferencesClass_softClass;
  if (!getAFPreferencesClass_softClass)
  {
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    id v16 = __getAFPreferencesClass_block_invoke;
    id v17 = &unk_1E5620B90;
    int v18 = &v19;
    __getAFPreferencesClass_block_invoke((uint64_t)&v14);
    id v3 = (void *)v20[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v19, 8);
  char v5 = [v4 sharedPreferences];
  if ([v5 dictationIsEnabled]) {
    int v6 = 1;
  }
  else {
    int v6 = [v5 suppressDictationOptIn] ^ 1;
  }
  BOOL v7 = [(CKMessageEntryView *)self dictationEnabledForLanguage];
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  id v8 = (uint64_t (*)(void))getAFDictationRestrictedSymbolLoc_ptr;
  id v22 = getAFDictationRestrictedSymbolLoc_ptr;
  if (!getAFDictationRestrictedSymbolLoc_ptr)
  {
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    id v16 = __getAFDictationRestrictedSymbolLoc_block_invoke;
    id v17 = &unk_1E5620B90;
    int v18 = &v19;
    int v9 = (void *)AssistantServicesLibrary();
    char v10 = dlsym(v9, "AFDictationRestricted");
    *(void *)(v18[1] + 24) = v10;
    getAFDictationRestrictedSymbolLoc_ptr = *(_UNKNOWN **)(v18[1] + 24);
    id v8 = (uint64_t (*)(void))v20[3];
  }
  _Block_object_dispose(&v19, 8);
  if (!v8) {
    -[CKMessageEntryView _isDictationEnabled]();
  }
  BOOL v11 = v7 & (v8() ^ 1);
  if (v6) {
    BOOL v12 = v11;
  }
  else {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)_serviceForEntryViewForConversation:(id)a3
{
  id v3 = a3;
  id v4 = [v3 sendingService];
  char v5 = [v3 chat];
  int v6 = [v5 isInterworking];

  if (v6)
  {
    BOOL v7 = (void *)MEMORY[0x1E4F6BDB8];
    id v8 = [v3 chat];
    int v9 = [v8 interworkingService];
    uint64_t v10 = [v7 serviceWithName:v9];
    BOOL v11 = (void *)v10;
    if (v10) {
      BOOL v12 = (void *)v10;
    }
    else {
      BOOL v12 = v4;
    }
    id v13 = v12;

    id v4 = v13;
  }

  return v4;
}

- (id)_placeholderTextForConversation:(id)a3
{
  id v4 = a3;
  if (![v4 recipientCount])
  {
    BOOL v11 = &stru_1EDE4CA38;
    goto LABEL_10;
  }
  char v5 = [v4 chat];
  int v6 = [v5 isStewieEmergencyChat];

  if (v6)
  {
    BOOL v7 = CKFrameworkBundle();
    id v8 = v7;
    int v9 = @"STEWIE_EMERGENCY_TEXT_ENTRY_PLACEHOLDER";
    uint64_t v10 = @"ChatKit-SYDROB_FEATURES";
  }
  else
  {
    BOOL v12 = [v4 chat];
    int v13 = [v12 shouldDisplayOffGridModeStatus];

    if (v13)
    {
      BOOL v7 = CKFrameworkBundle();
      id v8 = v7;
      int v9 = @"PLACEHOLDER_TEXT_VIEW_SATELLITE_MESSAGE";
      uint64_t v10 = @"ChatKit-CarrierPigeon";
    }
    else
    {
      id v16 = [v4 chat];
      int v17 = [v16 isStewieRoadsideChat];

      if (v17)
      {
        int v18 = [MEMORY[0x1E4F6BC48] sharedInstance];
        uint64_t v19 = [v4 chat];
        id v20 = [v19 chatIdentifier];
        id v8 = [v18 roadsideProviderNameForChatIdentifier:v20];

        uint64_t v21 = NSString;
        id v22 = CKFrameworkBundle();
        double v23 = [v22 localizedStringForKey:@"STEWIE_ROADSIDE_TEXT_ENTRY_PLACEHOLDER" value:&stru_1EDE4CA38 table:@"ChatKit-Avocet"];
        objc_msgSend(v21, "localizedStringWithFormat:", v23, v8);
        BOOL v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      }
      if ([v4 isMapKitBusinessConversation])
      {
        double v24 = NSString;
        double v25 = CKFrameworkBundle();
        double v26 = [v25 localizedStringForKey:@"BUSINESS_CHAT_TO" value:&stru_1EDE4CA38 table:@"ChatKit"];
        char v27 = [v4 recipient];
        double v28 = [v27 name];
        id v8 = objc_msgSend(v24, "stringWithFormat:", v26, v28);

        unint64_t v29 = [MEMORY[0x1E4F42738] sharedApplication];
        uint64_t v30 = [v29 userInterfaceLayoutDirection];

        if (v30 == 1) {
          char v31 = @"\u200F";
        }
        else {
          char v31 = @"\u200E";
        }
        uint64_t v14 = [(__CFString *)v31 stringByAppendingString:v8];
        goto LABEL_8;
      }
      if (CKMessageEntryViewStyleIsForReply([(CKMessageEntryView *)self style]))
      {
        BOOL v7 = CKFrameworkBundle();
        id v8 = v7;
        int v9 = @"INLINE_REPLY_TEXT_ENTRY_PLACEHOLDER";
      }
      else
      {
        double v32 = [(CKMessageEntryView *)self sendLaterPluginInfo];

        if (!v32)
        {
          id v8 = [(CKMessageEntryView *)self _serviceForEntryViewForConversation:v4];
          uint64_t v14 = objc_msgSend(v8, "__ck_entryViewDisplayName");
          goto LABEL_8;
        }
        BOOL v7 = CKFrameworkBundle();
        id v8 = v7;
        int v9 = @"SEND_LATER_TEXT_ENTRY_PLACEHOLDER";
      }
      uint64_t v10 = @"ChatKit";
    }
  }
  uint64_t v14 = [v7 localizedStringForKey:v9 value:&stru_1EDE4CA38 table:v10];
LABEL_8:
  BOOL v11 = (__CFString *)v14;
LABEL_9:

LABEL_10:

  return v11;
}

- (BOOL)_shouldEnablePlusButton
{
  id v3 = [(CKMessageEntryView *)self conversation];
  id v4 = [v3 chat];

  if (v4)
  {
    LOBYTE(v5) = [v4 supportsCapabilities:2048];
  }
  else
  {
    int v6 = [(CKMessageEntryView *)self conversation];
    BOOL v7 = [v6 sendingService];
    int v8 = [v7 supportsCapability:*MEMORY[0x1E4F6DFC8]];

    if (v8
      && ([MEMORY[0x1E4F6BC48] sharedInstance],
          int v9 = objc_claimAutoreleasedReturnValue(),
          int v10 = [v9 isSatelliteConnectionActive],
          v9,
          (IMIsRunningInMessagesViewService() & 1) == 0))
    {
      int v5 = (IMIsRunningInMessagesTranscriptExtension() | v10) ^ 1;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }

  return v5;
}

- (BOOL)_isApplePayCashInShelf
{
  id v3 = [(CKMessageEntryView *)self composition];
  id v4 = [v3 shelfPluginPayload];
  int v5 = [v4 pluginBundleID];
  if ([v5 containsString:*MEMORY[0x1E4F6CC30]])
  {
    char v6 = 1;
  }
  else
  {
    BOOL v7 = [(CKMessageEntryView *)self composition];
    int v8 = [v7 shelfPluginPayload];
    int v9 = [v8 pluginBundleID];
    char v6 = [v9 containsString:*MEMORY[0x1E4F6CC38]];
  }
  return v6;
}

- (char)_balloonColor
{
  id v3 = [(CKMessageEntryView *)self conversation];
  id v4 = v3;
  if (v3
    && ([v3 recipients],
        int v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 count],
        v5,
        v6))
  {
    BOOL v7 = +[CKUIBehavior sharedBehaviors];
    int v8 = [v7 theme];
    char v9 = objc_msgSend(v8, "applyPayCashSendButtonColorForEntryViewStyle:", -[CKMessageEntryView style](self, "style"));

    if (![(CKMessageEntryView *)self _isApplePayCashInShelf]) {
      char v9 = [v4 sendButtonColor];
    }
  }
  else
  {
    char v9 = -1;
  }

  return v9;
}

- (char)_sendButtonColor
{
  uint64_t v2 = self;
  id v3 = [(CKMessageEntryView *)self conversation];
  id v4 = v3;
  if (v3
    && ([v3 recipients],
        int v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 count],
        v5,
        v6))
  {
    if ([(CKMessageEntryView *)v2 _isApplePayCashInShelf])
    {
      BOOL v7 = +[CKUIBehavior sharedBehaviors];
      int v8 = [v7 theme];
      LOBYTE(v2) = objc_msgSend(v8, "applyPayCashSendButtonColorForEntryViewStyle:", -[CKMessageEntryView style](v2, "style"));
    }
    else
    {
      int v10 = [(CKMessageEntryView *)v2 sendLaterPluginInfo];

      if (v10) {
        LOBYTE(v2) = 15;
      }
      else {
        uint64_t v2 = (CKMessageEntryView *)[v4 sendButtonColor];
      }
    }
  }
  else
  {
    LOBYTE(v2) = -1;
  }

  return (char)v2;
}

- (void)_contactLimitsChanged:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    int v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "[Event] Contact limits changed.", v6, 2u);
    }
  }
  [(CKMessageEntryView *)self updateEntryView];
}

- (void)configureTextViewWithInputContextHistoryFromTranscript
{
  id v8 = [(CKMessageEntryView *)self delegate];
  id v3 = [v8 inputContextHistoryForMessageEntryView:self];
  id v4 = [(CKMessageEntryView *)self contentView];
  int v5 = [v4 textView];

  uint64_t v6 = [v5 inputContextHistory];
  if (v3 != v6)
  {
    [v5 setInputContextHistory:v3];
    BOOL v7 = [MEMORY[0x1E4F42B08] activeKeyboard];
    [v7 responseContextDidChange];
  }
}

- (BOOL)sendButtonEnabled
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v3 = [(CKMessageEntryView *)self composition];
  int v4 = [v3 hasContent];

  int v5 = [(CKMessageEntryView *)self conversation];
  uint64_t v6 = [v5 sendingService];

  if ((v4 & 1) == 0 && ![(CKMessageEntryView *)self shouldRecordForService:v6]
    || ([(CKMessageEntryView *)self contentView],
        BOOL v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isShowingDictationPlaceholder],
        v7,
        v8))
  {
    BOOL v9 = [(CKMessageEntryView *)self shouldRecordForService:v6];
    int v10 = [(CKMessageEntryView *)self contentView];
    int v11 = [v10 isShowingDictationPlaceholder];

    if (!IMOSLoggingEnabled())
    {
LABEL_49:
      BOOL v48 = 0;
      goto LABEL_50;
    }
    BOOL v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v60 = 67109632;
      BOOL v61 = v4;
      __int16 v62 = 1024;
      BOOL v63 = v11;
      __int16 v64 = 1024;
      BOOL v65 = v9;
      _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Send Button: Disabled > hasContent: %{BOOL}d, isShowingDictationPlaceholder: %{BOOL}d, isAudioMessagingAvailable: %{BOOL}d", (uint8_t *)&v60, 0x14u);
    }
LABEL_7:

    goto LABEL_49;
  }
  int v13 = [(CKMessageEntryView *)self conversation];
  int v14 = [v13 isStewieConversation];

  if (v14)
  {
    uint64_t v15 = [(CKMessageEntryView *)self composition];
    id v16 = [v15 text];
    int v17 = [v16 string];
    int v18 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    uint64_t v19 = [v17 stringByTrimmingCharactersInSet:v18];

    if (![v19 length])
    {
      if (IMOSLoggingEnabled())
      {
        double v26 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          LOWORD(v60) = 0;
          _os_log_impl(&dword_18EF18000, v26, OS_LOG_TYPE_INFO, "Send Button: Disabled > conversation is Stewie and trimmed text length is 0", (uint8_t *)&v60, 2u);
        }
        goto LABEL_24;
      }
      goto LABEL_48;
    }
    id v20 = [MEMORY[0x1E4F6BC48] sharedInstance];
    char v21 = [v20 isStewieActive];

    if ((v21 & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        double v26 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          LOWORD(v60) = 0;
          _os_log_impl(&dword_18EF18000, v26, OS_LOG_TYPE_INFO, "Send Button: Disabled > conversation is Stewie and stewie is not active", (uint8_t *)&v60, 2u);
        }
        goto LABEL_24;
      }
LABEL_48:

      goto LABEL_49;
    }
    id v22 = [(CKMessageEntryView *)self conversation];
    double v23 = [v22 chat];
    if ([v23 isStewieEmergencyChat])
    {
      double v24 = [MEMORY[0x1E4F6BC48] sharedInstance];
      char v25 = [v24 isStewieEmergencyActive];

      if ((v25 & 1) == 0)
      {
        if (IMOSLoggingEnabled())
        {
          double v26 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            LOWORD(v60) = 0;
            _os_log_impl(&dword_18EF18000, v26, OS_LOG_TYPE_INFO, "Send Button: Disabled > conversation is Stewie emergency chat and stewie emergency is not active", (uint8_t *)&v60, 2u);
          }
LABEL_24:

          goto LABEL_48;
        }
        goto LABEL_48;
      }
    }
    else
    {
    }
    char v27 = [(CKMessageEntryView *)self conversation];
    double v28 = [v27 chat];
    int v29 = [v28 isStewieRoadsideChat];

    if (v29)
    {
      uint64_t v30 = [MEMORY[0x1E4F6BC48] sharedInstance];
      int v31 = [v30 isStewieRoadsideActive];

      double v32 = [MEMORY[0x1E4F6BC48] sharedInstance];
      char v33 = [v32 mostRecentlyUsedRoadsideChatIdentifier];

      if (!v31) {
        goto LABEL_67;
      }
      char v34 = [(CKMessageEntryView *)self conversation];
      double v35 = [v34 chat];
      double v36 = [v35 chatIdentifier];
      char v37 = [v36 isEqualToString:v33];

      if ((v37 & 1) == 0)
      {
LABEL_67:
        if (IMOSLoggingEnabled())
        {
          uint64_t v47 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
          {
            LOWORD(v60) = 0;
            _os_log_impl(&dword_18EF18000, v47, OS_LOG_TYPE_INFO, "Send Button: Disabled > conversation is Stewie roadside chat and stewie roadside is not active or current chat is not mostRecentlyUsedRoadsideChatIdentifier.", (uint8_t *)&v60, 2u);
          }
        }
        goto LABEL_48;
      }
    }
  }
  if ([(CKMessageEntryView *)self _isExceedingByteLimitForService:v6]) {
    goto LABEL_49;
  }
  if ([(CKMessageEntryView *)self hasFailedRecipients]
    || [(CKMessageEntryView *)self hasUnreachableEmergencyRecipient])
  {
    BOOL v38 = [(CKMessageEntryView *)self hasFailedRecipients];
    BOOL v39 = [(CKMessageEntryView *)self hasUnreachableEmergencyRecipient];
    if (!IMOSLoggingEnabled()) {
      goto LABEL_49;
    }
    BOOL v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v60 = 67109376;
      BOOL v61 = v38;
      __int16 v62 = 1024;
      BOOL v63 = v39;
      _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Send Button: Disabled > hasFailedRecipients: %{BOOL}d, hasUnreachableEmergencyRecipient: %{BOOL}d", (uint8_t *)&v60, 0xEu);
    }
    goto LABEL_7;
  }
  uint64_t v40 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v41 = [v40 isCarrierPigeonEnabled];

  if (v41)
  {
    double v42 = [(CKMessageEntryView *)self conversation];
    if ([v42 isPending])
    {
      double v43 = [(CKMessageEntryView *)self conversation];
      double v44 = [v43 recipients];
      if ((unint64_t)[v44 count] > 1)
      {
        int v45 = [MEMORY[0x1E4F6BC48] sharedInstance];
        char v46 = [v45 isMessagingActiveOverSatellite];

        if (v46) {
          goto LABEL_49;
        }
        goto LABEL_53;
      }
    }
LABEL_53:
    unsigned int v50 = [(CKMessageEntryView *)self conversation];
    if ([v50 isStewieConversation])
    {
    }
    else
    {
      dispatch_time_t v51 = [MEMORY[0x1E4F6BC48] sharedInstance];
      int v52 = [v51 isMessagingActiveOverSatellite];

      if (v52)
      {
        double v53 = [(CKMessageEntryView *)self conversation];
        int v54 = [v53 isSatelliteSendingService];

        if (!v54) {
          goto LABEL_49;
        }
      }
    }
  }
  uint64_t v55 = [(CKMessageEntryView *)self conversation];
  uint64_t v56 = [v55 recipientCount];

  BOOL v57 = [(CKMessageEntryView *)self isComposingRecipient];
  if (IMOSLoggingEnabled())
  {
    double v58 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
    {
      int v60 = 67109376;
      BOOL v61 = v56 != 0;
      __int16 v62 = 1024;
      BOOL v63 = v57;
      _os_log_impl(&dword_18EF18000, v58, OS_LOG_TYPE_INFO, "Send Button: > hasRecipients: %{BOOL}d, isComposingRecipient: %{BOOL}d", (uint8_t *)&v60, 0xEu);
    }
  }
  CGRect v59 = [(CKMessageEntryView *)self conversation];
  if ([v59 recipientCount]) {
    BOOL v48 = 1;
  }
  else {
    BOOL v48 = [(CKMessageEntryView *)self isComposingRecipient];
  }

LABEL_50:
  return v48;
}

- (BOOL)_isExceedingByteLimitForService:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(CKMessageEntryView *)self conversation];
  uint64_t v6 = [v5 chat];
  int v7 = [v6 shouldDisplayOffGridModeStatus];

  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F6BDB8] iMessageLiteService];

    id v4 = (id)v8;
  }
  BOOL v9 = [v4 serviceProperties];
  int v10 = [v9 valueForKey:*MEMORY[0x1E4F6E210]];
  int v11 = [v10 intValue];

  if (v11 < 1) {
    goto LABEL_11;
  }
  BOOL v12 = [(CKMessageEntryView *)self composition];
  int v13 = [v12 text];
  int v14 = [v13 string];
  uint64_t v15 = v11;

  if ([v14 lengthOfBytesUsingEncoding:4] <= v11)
  {

LABEL_11:
    BOOL v19 = 0;
    goto LABEL_12;
  }
  if (IMOSLoggingEnabled())
  {
    id v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v17 = [NSNumber numberWithInteger:v15];
      int v18 = [v4 name];
      int v21 = 138412546;
      id v22 = v17;
      __int16 v23 = 2112;
      double v24 = v18;
      _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "Send Button: Disabled, exceeding maximum byte limit: %@ for service: %@", (uint8_t *)&v21, 0x16u);
    }
  }

  BOOL v19 = 1;
LABEL_12:

  return v19;
}

- (BOOL)shouldAllowSendWhenSendButtonDisabled
{
  id v3 = +[CKUIBehavior sharedBehaviors];
  char v4 = [v3 isSendButtonEnabledOnPlatform];

  if (v4) {
    return 1;
  }
  int v5 = [(CKMessageEntryView *)self conversation];
  uint64_t v6 = [v5 chat];
  int v7 = [v6 lastFinishedMessage];

  return v7
      || ![(CKMessageEntryView *)self hasFailedRecipients]
      && ![(CKMessageEntryView *)self hasUnreachableEmergencyRecipient];
}

- (BOOL)pluginButtonsEnabled
{
  id v3 = [(CKMessageEntryView *)self conversation];
  uint64_t v4 = [v3 recipientCount];

  if (v4)
  {
    int v5 = [(CKMessageEntryView *)self composition];
    uint64_t v6 = [v5 mediaObjects];

    int v7 = [(CKMessageEntryView *)self conversation];
    if ([v7 canAcceptMediaObjectType:2 givenMediaObjects:v6])
    {
    }
    else
    {
      uint64_t v8 = [(CKMessageEntryView *)self conversation];
      int v9 = [v8 canAcceptMediaObjectType:3 givenMediaObjects:v6];

      if (!v9) {
        return 0;
      }
    }
  }
  int v10 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v11 = [v10 isCarrierPigeonEnabled];

  if (v11)
  {
    BOOL v12 = [(CKMessageEntryView *)self conversation];
    int v13 = [v12 sendingService];
    char v14 = objc_msgSend(v13, "__ck_isSatelliteSMS");

    if (v14) {
      return 0;
    }
  }
  uint64_t v15 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v16 = [v15 stewieEnabled];

  if (v16)
  {
    int v17 = [(CKMessageEntryView *)self conversation];
    char v18 = [v17 isStewieConversation];

    if (v18) {
      return 0;
    }
  }
  if ([(CKMessageEntryView *)self shouldDisablePluginButtons]) {
    return 0;
  }
  return ![(CKMessageEntryView *)self _isRunningInMVS];
}

- (BOOL)photoButtonEnabled
{
  if ([(CKMessageEntryView *)self _isRunningInMVS]) {
    return 0;
  }
  id v3 = +[CKUIBehavior sharedBehaviors];
  int v4 = [v3 entryViewSupportsPhotoButton];

  if (!v4) {
    return 0;
  }
  int v5 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v6 = [v5 stewieEnabled];

  if (v6)
  {
    int v7 = [(CKMessageEntryView *)self conversation];
    char v8 = [v7 isStewieConversation];

    if (v8) {
      return 0;
    }
  }
  int v10 = +[CKBalloonPluginManager sharedInstance];
  char v11 = [v10 isCameraAllowed];

  return v11;
}

- (BOOL)shouldShowAudioButton
{
  id v3 = [(CKMessageEntryView *)self audioButton];
  int v4 = [v3 isHidden];

  int v5 = [(CKMessageEntryView *)self conversation];
  int v6 = [v5 sendingService];
  BOOL v7 = [(CKMessageEntryView *)self shouldRecordForService:v6];

  if (v7)
  {
    if ([(CKMessageEntryView *)self displayMode] != 1)
    {
      if ((v4 & 1) == 0)
      {
        int v8 = IMOSLoggingEnabled();
        if (v8)
        {
          int v9 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)double v32 = 0;
            int v10 = "Hiding audio button because the display mode is not text";
            goto LABEL_16;
          }
          goto LABEL_17;
        }
        return v8;
      }
      goto LABEL_18;
    }
    if ([(CKMessageEntryView *)self _isRunningInMVS])
    {
      if ((v4 & 1) == 0)
      {
        int v8 = IMOSLoggingEnabled();
        if (v8)
        {
          int v9 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)double v32 = 0;
            int v10 = "Hiding the audio button because we are running in MessagesViewService";
LABEL_16:
            _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, v10, v32, 2u);
            goto LABEL_17;
          }
          goto LABEL_17;
        }
        return v8;
      }
LABEL_18:
      LOBYTE(v8) = 0;
      return v8;
    }
    if ([(CKMessageEntryView *)self isRunningInNotificationExtension])
    {
      if (v4) {
        goto LABEL_18;
      }
      int v8 = IMOSLoggingEnabled();
      if (!v8) {
        return v8;
      }
      int v9 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
        goto LABEL_17;
      }
      *(_WORD *)double v32 = 0;
      int v10 = "Not showing the audio button because we are running in the Notification Extension";
      goto LABEL_16;
    }
    char v11 = [(CKMessageEntryView *)self conversation];
    int v12 = [v11 isStewieConversation];

    if (v12)
    {
      if (v4) {
        goto LABEL_18;
      }
      int v8 = IMOSLoggingEnabled();
      if (!v8) {
        return v8;
      }
      int v9 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
        goto LABEL_17;
      }
      *(_WORD *)double v32 = 0;
      int v10 = "Not showing the audio button because this is a stewie conversation";
      goto LABEL_16;
    }
    int v13 = [(CKMessageEntryView *)self conversation];
    uint64_t v14 = [v13 chat];
    if (v14)
    {
      uint64_t v15 = (void *)v14;
      int v16 = [(CKMessageEntryView *)self conversation];
      int v17 = [v16 chat];
      char v18 = [v17 supportsCapabilities:0x10000];

      if ((v18 & 1) == 0)
      {
        int v8 = IMOSLoggingEnabled();
        if (!v8) {
          return v8;
        }
        int v9 = OSLogHandleForIMFoundationCategory();
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
          goto LABEL_17;
        }
        *(_WORD *)double v32 = 0;
        int v10 = "Not showing the audio button because chat does not support capability.";
        goto LABEL_16;
      }
    }
    else
    {
    }
    if (CKIsRunningInMacCatalyst())
    {
      BOOL v19 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      int v20 = [v19 isCarrierPigeonEnabled];

      if (v20)
      {
        int v21 = [(CKMessageEntryView *)self contentView];
        id v22 = [v21 textView];
        __int16 v23 = [v22 text];
        uint64_t v24 = [v23 length];

        if (v24) {
          goto LABEL_18;
        }
      }
      uint64_t v25 = [(CKMessageEntryView *)self sendLaterPluginInfo];

      if (v25)
      {
        int v8 = IMOSLoggingEnabled();
        if (!v8) {
          return v8;
        }
        int v9 = OSLogHandleForIMFoundationCategory();
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
          goto LABEL_17;
        }
        *(_WORD *)double v32 = 0;
        int v10 = "Not showing audioButton because we have SendLater staged.";
        goto LABEL_16;
      }
      if (!v4 || !IMOSLoggingEnabled()) {
        goto LABEL_59;
      }
      int v29 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_INFO)) {
        goto LABEL_58;
      }
      *(_WORD *)double v32 = 0;
      uint64_t v30 = "Showing the audio button because we are running on Catalyst and the send button is hidden";
    }
    else if ([(CKMessageEntryView *)self _isDictationEnabled])
    {
      double v26 = [(CKMessageEntryView *)self conversation];
      char v27 = [v26 chat];
      int v28 = [v27 shouldShowAudioButtonInEntryView];

      if (!v28)
      {
        if (v4) {
          goto LABEL_18;
        }
        int v8 = IMOSLoggingEnabled();
        if (!v8) {
          return v8;
        }
        int v9 = OSLogHandleForIMFoundationCategory();
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
          goto LABEL_17;
        }
        *(_WORD *)double v32 = 0;
        int v10 = "Defaulting to hiding the audio button";
        goto LABEL_16;
      }
      if (!v4 || !IMOSLoggingEnabled()) {
        goto LABEL_59;
      }
      int v29 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_INFO)) {
        goto LABEL_58;
      }
      *(_WORD *)double v32 = 0;
      uint64_t v30 = "Showing the audio button because the chat prefers it";
    }
    else
    {
      if (!v4 || !IMOSLoggingEnabled()) {
        goto LABEL_59;
      }
      int v29 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
LABEL_58:

LABEL_59:
        LOBYTE(v8) = 1;
        return v8;
      }
      *(_WORD *)double v32 = 0;
      uint64_t v30 = "Showing the audio button because dictation is disabled";
    }
    _os_log_impl(&dword_18EF18000, v29, OS_LOG_TYPE_INFO, v30, v32, 2u);
    goto LABEL_58;
  }
  if (v4) {
    goto LABEL_18;
  }
  int v8 = IMOSLoggingEnabled();
  if (v8)
  {
    int v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v32 = 0;
      int v10 = "Hiding audio button because the send button is showing";
      goto LABEL_16;
    }
LABEL_17:

    goto LABEL_18;
  }
  return v8;
}

- (BOOL)_isRunningInMVS
{
  return CKIsRunningInMessagesViewService() != 0;
}

- (void)loadRecordedAudioViewsIfNeeded
{
  id v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  char v4 = [v3 isAudioMessagesEntryViewRecordingEnabled];

  if ((v4 & 1) == 0)
  {
    int v5 = [(CKMessageEntryView *)self recordedAudioView];
    if (!v5)
    {
      int v6 = [CKMessageEntryRecordedAudioView alloc];
      BOOL v7 = -[CKMessageEntryRecordedAudioView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      [(CKMessageEntryRecordedAudioView *)v7 setBackgroundColor:0];
      [(CKMessageEntryRecordedAudioView *)v7 setOpaque:0];
      [(CKMessageEntryRecordedAudioView *)v7 setDelegate:self];
      [(CKMessageEntryView *)self setRecordedAudioView:v7];
      [(CKMessageEntryView *)self setNeedsLayout];
      int v5 = v7;
    }
  }
}

- (void)_swipeDownGestureRecognized:(id)a3
{
  char v4 = [(CKMessageEntryView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CKMessageEntryView *)self delegate];
    [v6 messageEntryViewSwipeDownGestureRecognized:self];
  }
}

- (void)textEffectsWindowOffsetDidChange:(id)a3
{
  [(CKMessageEntryView *)self frame];

  -[CKMessageEntryView setFrame:](self, "setFrame:");
}

- (void)sendCurrentLocationMessage
{
  id v3 = [(CKMessageEntryView *)self delegate];
  [v3 sendCurrentLocationMessage:self];
}

- (void)_dictationAvailabilityDidChange
{
  id v3 = [MEMORY[0x1E4F42B30] sharedInputModeController];
  char v4 = [v3 enabledDictationLanguages];
  -[CKMessageEntryView setDictationEnabledForLanguage:](self, "setDictationEnabledForLanguage:", [v4 count] != 0);

  [(CKMessageEntryView *)self updateEntryView];
}

- (void)appSelectionInterfaceSelectedItem:(id)a3
{
  id v7 = a3;
  char v4 = [(CKMessageEntryView *)self inputDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CKMessageEntryView *)self inputDelegate];
    [v6 messageEntryViewSelectedAppMenuItem:v7];
  }
}

- (void)updateAppsMenu
{
  if (CKIsRunningInMacCatalyst())
  {
    id v3 = [(CKMessageEntryView *)self browserButton];

    if (v3)
    {
      char v4 = [(CKMessageEntryView *)self browserButton];
      char v5 = [v4 button];
      id v6 = [(CKMessageEntryView *)self entryViewTraitCollection];
      id v7 = [(CKMessageEntryView *)self conversation];
      int v8 = +[CKAppMenuDataSource appMenuWithTarget:self traitCollection:v6 conversation:v7];
      [v5 setMenu:v8];
    }
    int v9 = [(CKMessageEntryView *)self plusButton];

    if (v9)
    {
      id v14 = [(CKMessageEntryView *)self plusButton];
      int v10 = [v14 button];
      char v11 = [(CKMessageEntryView *)self entryViewTraitCollection];
      int v12 = [(CKMessageEntryView *)self conversation];
      int v13 = +[CKAppMenuDataSource appMenuWithTarget:self traitCollection:v11 conversation:v12];
      [v10 setMenu:v13];
    }
  }
}

- (void)messageEntryRecordedAudioView:(id)a3 mediaObjectDidFinishPlaying:(id)a4
{
  id v4 = [(CKMessageEntryView *)self audioMessageAppDelegate];
  [v4 audioMessageDidEndPlayback];
}

- (void)messageEntryRecordedAudioViewPressedPlay:(id)a3
{
}

- (void)messageEntryRecordedAudioViewPressedPause:(id)a3
{
}

- (void)messageEntryRecordedAudioViewPressedDelete:(id)a3
{
  if ([(CKMessageEntryView *)self hasRecording])
  {
    id v4 = [(CKMessageEntryView *)self audioMessageAppDelegate];
    [v4 audioMessageDidCancelMessage];
  }
  [(CKMessageEntryView *)self setAudioComposition:0];

  [(CKMessageEntryView *)self configureForDisplayMode:1];
}

- (void)messageEntryRecordedAudioViewPlaybackProgressDidChange:(double)a3
{
  id v4 = [(CKMessageEntryView *)self audioMessageAppDelegate];
  [v4 audioMessageDidChangeCurrentPlaybackTime:a3];
}

- (void)messageEntryRecordedAudioViewPlaybackDidStop
{
  if ([(CKMessageEntryView *)self hasRecording])
  {
    id v3 = [(CKMessageEntryView *)self audioMessageAppDelegate];
    [v3 audioMessageDidEndPlayback];
  }
}

- (void)_trackAudioMessageRecordingStarted
{
  id v2 = [MEMORY[0x1E4F6E890] sharedInstance];
  [v2 trackEvent:*MEMORY[0x1E4F6D770]];
}

- (void)_trackAudioMessageSentWithComposition:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v3 = (void *)MEMORY[0x1E4F6E890];
    id v4 = a3;
    char v5 = [v3 sharedInstance];
    [v5 trackEvent:*MEMORY[0x1E4F6D778]];

    id v6 = [v4 mediaObjects];

    id v7 = [v6 firstObject];

    if (v7)
    {
      [v7 duration];
      double v9 = v8;
      int v10 = [MEMORY[0x1E4F6E890] sharedInstance];
      uint64_t v11 = *MEMORY[0x1E4F6D780];
      id v14 = @"AudioMessageDuration";
      int v12 = [NSNumber numberWithDouble:v9];
      v15[0] = v12;
      int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
      [v10 trackEvent:v11 withDictionary:v13];
    }
  }
}

- (void)startRecordingForRaiseGesture
{
  id v3 = [(CKMessageEntryView *)self recorder];
  id v4 = [(CKMessageEntryView *)self audioComposition];

  if (v4)
  {
    if (IMOSLoggingEnabled())
    {
      char v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v11 = 0;
        _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Not allowing audio recording invoked by raise to record gesture due to already existing audio composition.", v11, 2u);
      }
LABEL_10:
    }
  }
  else
  {
    id v6 = [(CKMessageEntryView *)self conversation];
    id v7 = [v6 sendingService];
    if (![(CKMessageEntryView *)self shouldRecordForService:v7])
    {

      goto LABEL_12;
    }
    char v8 = [v3 isRecording];

    if ((v8 & 1) == 0)
    {
      double v9 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      int v10 = [v9 isAudioMessagesEntryViewRecordingEnabled];

      if (v10) {
        [(CKMessageEntryView *)self setRecordingStartedFromRaiseGesture:1];
      }
      [v3 startRecordingForRaiseGesture:1 shouldPlaySound:0];
      char v5 = [(CKMessageEntryView *)self audioMessageAppDelegate];
      [v5 audioMessageStartedRecordingFromMessages];
      goto LABEL_10;
    }
  }
LABEL_12:
}

- (void)stopRecordingForRaiseGestureWithFailure:(BOOL)a3
{
  char v5 = [(CKMessageEntryView *)self recorder];
  id v6 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v7 = [v6 isAudioMessagesEntryViewRecordingEnabled];

  if (v7)
  {
    if (IMOSLoggingEnabled())
    {
      char v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Stopping audio recording invoked by raise to record gesture.", buf, 2u);
      }
    }
    [(CKMessageEntryView *)self setRecordingStartedFromRaiseGesture:0];
    if (v5)
    {
      double v9 = [(CKMessageEntryView *)self audioRecordingView];

      if (v9)
      {
        int v10 = [(CKMessageEntryView *)self audioComposition];

        if (v10)
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v11 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              int v12 = "Raise to record gesture attempted with an existing audio message.";
LABEL_20:
              _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, v12, buf, 2u);
              goto LABEL_21;
            }
            goto LABEL_21;
          }
        }
        else
        {
          int v13 = [(CKMessageEntryView *)self recorder];
          [v13 setPaused:1];

          if (IMOSLoggingEnabled())
          {
            id v14 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "Stopping audio recorder.", buf, 2u);
            }
          }
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __62__CKMessageEntryView_stopRecordingForRaiseGestureWithFailure___block_invoke;
          v18[3] = &unk_1E5629408;
          v18[4] = self;
          BOOL v19 = a3;
          [v5 stopRecordingAndPlaySound:1 completion:v18];
        }
      }
      else if (IMOSLoggingEnabled())
      {
        uint64_t v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          int v12 = "Tried to stop a recording with a nil audio recording view.";
          goto LABEL_20;
        }
        goto LABEL_21;
      }
    }
    else if (IMOSLoggingEnabled())
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        int v12 = "Tried to stop a recording with a nil audio recorder.";
        goto LABEL_20;
      }
LABEL_21:
    }
  }
  else if ([v5 isRecording])
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __62__CKMessageEntryView_stopRecordingForRaiseGestureWithFailure___block_invoke_579;
    v15[3] = &unk_1E5629430;
    v15[4] = self;
    id v16 = v5;
    BOOL v17 = a3;
    [v16 stopRecordingAndPlaySound:1 completion:v15];
  }
}

void __62__CKMessageEntryView_stopRecordingForRaiseGestureWithFailure___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) sendEnableRotationAfterRecordingToDelegate];
  id v4 = [*(id *)(a1 + 32) audioComposition];

  if (!v3 || v4)
  {
    if (!v3)
    {
      if (IMOSLoggingEnabled())
      {
        int v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)id v22 = 0;
          _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "Raise to record Audio recording canceled because there is no composition", v22, 2u);
        }
      }
      id v14 = [*(id *)(a1 + 32) recorder];
      [v14 setPaused:0];

      [*(id *)(a1 + 32) clearAudioRecordingUI];
    }
  }
  else
  {
    char v5 = [v3 mediaObjects];
    id v6 = [v5 firstObject];

    [v6 duration];
    if (*(unsigned char *)(a1 + 40)
      || (double v8 = v7,
          +[CKUIBehavior sharedBehaviors],
          double v9 = objc_claimAutoreleasedReturnValue(),
          [v9 raiseToTalkErrorMaxDuration],
          double v11 = v10,
          v9,
          v8 < v11))
    {
      if (IMOSLoggingEnabled())
      {
        int v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Raise to record Audio recording canceled because it was too short", buf, 2u);
        }
      }
      [*(id *)(a1 + 32) clearAudioRecordingUI];
    }
    else
    {
      if (v6)
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v15 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)__int16 v23 = 0;
            _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "Raise to record Audio recording completed with valid audio media object. Setting up recording view for playback.", v23, 2u);
          }
        }
        id v16 = [*(id *)(a1 + 32) audioRecordingView];
        [v16 setPlaybackDuration:v8];

        BOOL v17 = [*(id *)(a1 + 32) audioRecordingView];
        [v17 setState:2];

        char v18 = [*(id *)(a1 + 32) audioRecordingView];
        BOOL v19 = [v18 intensities];
        [v6 setPowerLevels:v19];

        int v20 = [*(id *)(a1 + 32) conversation];
        [v20 setUnsentComposition:v3];

        int v21 = [*(id *)(a1 + 32) audioRecordingView];
        [v21 setPlaybackCurrentTime:NAN];
      }
      [*(id *)(a1 + 32) setAudioComposition:v3];
      [*(id *)(a1 + 32) configureForDisplayMode:3];
    }
  }
}

void __62__CKMessageEntryView_stopRecordingForRaiseGestureWithFailure___block_invoke_579(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(a1 + 32) sendEnableRotationAfterRecordingToDelegate];
  [*(id *)(a1 + 40) duration];
  double v5 = v4;
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      double v7 = @"YES";
      if (*(unsigned char *)(a1 + 48)) {
        double v8 = @"YES";
      }
      else {
        double v8 = @"NO";
      }
      if (!v3) {
        double v7 = @"NO";
      }
      int v24 = 138412546;
      uint64_t v25 = v8;
      __int16 v26 = 2112;
      char v27 = v7;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Stop recording with failure detected: %@, composition: %@", (uint8_t *)&v24, 0x16u);
    }
  }
  double v9 = [*(id *)(a1 + 32) audioComposition];
  if (v3) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  int v11 = v10;

  if (v11)
  {
    int v12 = [v3 mediaObjects];
    int v13 = [v12 firstObject];
    id v14 = [*(id *)(a1 + 32) waveformView];
    uint64_t v15 = [v14 powerLevels];
    [v13 setPowerLevels:v15];

    [*(id *)(a1 + 32) setAudioComposition:v3];
    if (!*(unsigned char *)(a1 + 48)
      || (+[CKUIBehavior sharedBehaviors],
          id v16 = objc_claimAutoreleasedReturnValue(),
          [v16 raiseToTalkErrorMaxDuration],
          BOOL v18 = v5 < v17,
          v16,
          !v18))
    {
      BOOL v19 = +[CKUIBehavior sharedBehaviors];
      [v19 raiseToTalkAutoSendMaxDuration];
      if (v5 >= v20)
      {
      }
      else
      {
        BOOL v21 = *(unsigned char *)(a1 + 48) == 0;

        if (v21)
        {
          id v22 = [*(id *)(a1 + 32) delegate];
          [v22 messageEntryViewRaiseGestureAutoSend:*(void *)(a1 + 32)];

          goto LABEL_21;
        }
      }
      [*(id *)(a1 + 32) configureForDisplayMode:3];
      __int16 v23 = [*(id *)(a1 + 32) audioMessageAppDelegate];
      [v23 audioMessageStoppedRecordingFromMessages];

      goto LABEL_27;
    }
    [*(id *)(a1 + 32) configureForDisplayMode:1];
  }
  else
  {
    [*(id *)(a1 + 32) setAudioComposition:0];
    [*(id *)(a1 + 32) configureForDisplayMode:1];
  }
LABEL_21:
  [*(id *)(a1 + 32) setPowerLevels:0];
  [*(id *)(a1 + 32) setDuration:0.0];
LABEL_27:
}

- (void)cancelAudioMessage
{
  [(CKMessageEntryView *)self sendEnableRotationAfterRecordingToDelegate];
  [(CKMessageEntryView *)self setAudioComposition:0];
  id v3 = [(CKMessageEntryView *)self recorder];
  int v4 = [v3 isRecording];

  if (v4)
  {
    double v5 = [(CKMessageEntryView *)self recorder];
    [v5 cancelRecording];
  }
  id v6 = [(CKMessageEntryView *)self audioMessageAppDelegate];
  [v6 audioMessageDidCancelMessage];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__CKMessageEntryView_cancelAudioMessage__block_invoke;
  v7[3] = &unk_1E5620C40;
  v7[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v7 animations:1.0];
}

uint64_t __40__CKMessageEntryView_cancelAudioMessage__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) clearAudioRecordingUI];
  id v2 = *(void **)(a1 + 32);

  return [v2 configureForDisplayMode:1];
}

- (void)startPlaying
{
}

- (void)_startPlaying:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(CKMessageEntryView *)self recordedAudioView];
  [v5 play];

  if (v3)
  {
    id v6 = [(CKMessageEntryView *)self audioMessageAppDelegate];
    [v6 audioMessageDidStartPlayback];
  }
}

- (void)pausePlaying
{
}

- (void)_pausePlaying:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(CKMessageEntryView *)self recordedAudioView];
  [v5 pause];

  if (v3)
  {
    id v6 = [(CKMessageEntryView *)self audioMessageAppDelegate];
    [v6 audioMessageDidEndPlayback];
  }
}

- (void)disableRotationWhileRecordingAudioMessage
{
  BOOL v3 = [(CKMessageEntryView *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(CKMessageEntryView *)self delegate];
    [v5 disableRotationWhileRecordingAudioMessage];
  }
}

- (void)audioRecorderDidStartRecording:(id)a3
{
  char v4 = objc_msgSend(MEMORY[0x1E4F6E778], "sharedFeatureFlags", a3);
  int v5 = [v4 isAudioMessagesEntryViewRecordingEnabled];

  if (v5) {
    [(CKMessageEntryView *)self disableRotationWhileRecordingAudioMessage];
  }
  [(CKMessageEntryView *)self _trackAudioMessageRecordingStarted];
  [(CKMessageEntryView *)self configureForDisplayMode:2];
  id v6 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v7 = [v6 isAudioMessagesEntryViewRecordingEnabled];

  if (v7)
  {
    double v8 = [(CKMessageEntryView *)self audioRecordingView];
    [v8 setState:1];

    double v9 = [(CKMessageEntryView *)self audioComposition];
    if (!v9)
    {
      BOOL v10 = [(CKMessageEntryView *)self inputDelegate];
      char v11 = objc_opt_respondsToSelector();

      if ((v11 & 1) == 0) {
        return;
      }
      id v12 = [(CKMessageEntryView *)self inputDelegate];
      [v12 messageEntryViewDidStageAudioRecordingUI:self];
      double v9 = v12;
    }
  }
}

- (void)audioRecorderRecordingDidChange:(id)a3
{
  if ([a3 isRecording])
  {
    char v4 = [(CKMessageEntryView *)self waveformView];
    [v4 clearPowerLevels];
    [v4 setDuration:0.0];
    [(CKMessageEntryView *)self setPowerLevels:0];
    [(CKMessageEntryView *)self setDuration:0.0];
  }
  int v5 = [(CKMessageEntryView *)self delegate];
  [v5 messageEntryViewRecordingDidChange:self];

  [(CKMessageEntryView *)self updateEntryView];
}

- (void)audioRecorderRecordingDidFail:(id)a3
{
  [(CKMessageEntryView *)self configureForDisplayMode:1];

  [(CKMessageEntryView *)self showAudioHintWithReason:2];
}

- (void)audioRecorderDidUpdateAveragePower:(float)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  int v5 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v6 = [v5 isAudioMessagesEntryViewRecordingEnabled];

  if (v6)
  {
    if ([(CKMessageEntryView *)self recordingStartedFromRaiseGesture])
    {
      int v7 = +[CKUIBehavior sharedBehaviors];
      [v7 audioRecordingViewMinimumDBLevel];
      double v9 = v8;

      BOOL v10 = +[CKUIBehavior sharedBehaviors];
      [v10 audioRecordingViewMaximumDBLevel];
      double v12 = v11;

      id v25 = [(CKMessageEntryView *)self audioRecordingView];
      [v25 addToWaveformWithIntensity:(a3 - v9) / (v12 - v9)];
    }
  }
  else
  {
    int v13 = [(CKMessageEntryView *)self recorder];
    id v14 = [(CKMessageEntryView *)self waveformView];
    [v13 duration];
    objc_msgSend(v14, "setDuration:");
    [v14 appendPowerLevel:CKLinearForDbPowerLevel(a3) * 32767.0];
    *(float *)&double v15 = a3;
    id v16 = [NSNumber numberWithFloat:v15];
    double v17 = [(CKMessageEntryView *)self powerLevels];

    if (v17)
    {
      BOOL v18 = [(CKMessageEntryView *)self powerLevels];
      [v18 addObject:v16];
    }
    else
    {
      id v19 = objc_alloc(MEMORY[0x1E4F1CA48]);
      v26[0] = v16;
      double v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
      BOOL v21 = (void *)[v19 initWithArray:v20];
      [(CKMessageEntryView *)self setPowerLevels:v21];
    }
    [v13 duration];
    -[CKMessageEntryView setDuration:](self, "setDuration:");
    id v22 = [(CKMessageEntryView *)self audioMessageAppDelegate];
    [v13 duration];
    double v24 = v23;
    *(float *)&double v23 = a3;
    [v22 audioMessageDidChangeAudioPowerLevel:v23 duration:v24];
  }
}

- (BOOL)isShowingAudioRecordingView
{
  id v2 = [(CKMessageEntryView *)self audioRecordingView];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_setupAudioMessageRecordingView
{
  BOOL v3 = [(CKMessageEntryView *)self audioRecordingView];

  if (!v3)
  {
    char v4 = [CKAudioMessageRecordingView alloc];
    int v5 = [(CKMessageEntryView *)self contentClipView];
    [v5 frame];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    id v14 = [(CKMessageEntryView *)self conversation];
    double v15 = [v14 sendingService];
    id v16 = -[CKAudioMessageRecordingView initWithFrame:service:](v4, "initWithFrame:service:", v15, v7, v9, v11, v13);
    [(CKMessageEntryView *)self setAudioRecordingView:v16];

    double v17 = [(CKMessageEntryView *)self audioRecordingView];
    [v17 setAlpha:0.0];

    BOOL v18 = [(CKMessageEntryView *)self audioRecordingView];
    [v18 setDelegate:self];

    id v19 = [(CKMessageEntryView *)self audioRecordingView];
    [v19 setupDisplayLink];

    double v20 = [(CKMessageEntryView *)self audioRecordingView];
    BOOL v21 = [v20 sendButton];
    objc_msgSend(v21, "setEnabled:", -[CKMessageEntryView sendButtonEnabled](self, "sendButtonEnabled"));

    id v22 = [(CKMessageEntryView *)self audioRecordingView];
    [(CKMessageEntryView *)self addSubview:v22];

    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __53__CKMessageEntryView__setupAudioMessageRecordingView__block_invoke;
    v24[3] = &unk_1E5620C40;
    v24[4] = self;
    [MEMORY[0x1E4F42FF0] performWithoutAnimation:v24];
    double v23 = [(CKMessageEntryView *)self delegate];
    [v23 messageEntryViewDidChange:self isTextChange:0 isShelfChange:0];
  }
}

void __53__CKMessageEntryView__setupAudioMessageRecordingView__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) audioRecordingView];
  [v1 setState:1];
}

- (void)startRecordingForAudioButtonInEntryView
{
  BOOL v3 = [(CKMessageEntryView *)self composition];
  if ([v3 hasContent]) {
    goto LABEL_4;
  }
  char v4 = [(CKMessageEntryView *)self audioComposition];
  if (v4)
  {

LABEL_4:
LABEL_5:
    [(CKMessageEntryView *)self showAudioHintWithReason:1];
    return;
  }
  int v5 = [(CKMessageEntryView *)self sendLaterPluginInfo];

  if (v5) {
    goto LABEL_5;
  }

  [(CKMessageEntryView *)self startRecording];
}

- (void)audioButtonLongPressed:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 state];
  if ((unint64_t)(v5 - 3) < 2)
  {
    double v10 = [(CKMessageEntryView *)self audioMessageButtonTimer];

    if (v10)
    {
      [(CKMessageEntryView *)self setShouldUseLinearResizeForAudioMessage:0];
      double v11 = [(CKMessageEntryView *)self audioMessageButtonTimer];
      [v11 invalidate];

      [(CKMessageEntryView *)self setAudioMessageButtonTimer:0];
      [(CKMessageEntryView *)self cancelAudioMessage];
      [(CKMessageEntryView *)self showAudioHintWithReason:0];
      goto LABEL_11;
    }
    double v23 = [(CKMessageEntryView *)self audioRecordingView];
    int v24 = [v23 isStopButtonHighlighted];

    if (!v24) {
      goto LABEL_11;
    }
    [(CKMessageEntryView *)self setupAudioMessageQuickSendViewAndStopRecording];
    double v20 = [(CKMessageEntryView *)self audioRecordingView];
    BOOL v21 = v20;
    BOOL v22 = 0;
LABEL_10:
    [v20 setIsStopButtonHighlighted:v22];

    goto LABEL_11;
  }
  if (v5 == 2)
  {
    double v12 = [(CKMessageEntryView *)self audioRecordingView];
    [v4 locationInView:v12];
    CGFloat v14 = v13;
    CGFloat v16 = v15;

    double v17 = [(CKMessageEntryView *)self audioRecordingView];
    BOOL v18 = [v17 stopButton];
    [v18 frame];
    v33.double x = v14;
    v33.double y = v16;
    BOOL v19 = CGRectContainsPoint(v34, v33);

    double v20 = [(CKMessageEntryView *)self audioRecordingView];
    BOOL v21 = v20;
    BOOL v22 = v19;
    goto LABEL_10;
  }
  if (v5 == 1)
  {
    [(CKMessageEntryView *)self setShouldUseLinearResizeForAudioMessage:1];
    [(CKMessageEntryView *)self _setupAudioMessageRecordingView];
    double v6 = (void *)[objc_alloc(MEMORY[0x1E4F42AA8]) initWithStyle:1];
    [v6 prepare];
    id location = 0;
    objc_initWeak(&location, self);
    double v7 = (void *)MEMORY[0x1E4F1CB00];
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    char v27 = __45__CKMessageEntryView_audioButtonLongPressed___block_invoke;
    uint64_t v28 = &unk_1E5629458;
    objc_copyWeak(&v31, &location);
    int v29 = self;
    id v8 = v6;
    id v30 = v8;
    double v9 = [v7 scheduledTimerWithTimeInterval:0 repeats:&v25 block:0.5];
    -[CKMessageEntryView setAudioMessageButtonTimer:](self, "setAudioMessageButtonTimer:", v9, v25, v26, v27, v28, v29);

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }
LABEL_11:
}

void __45__CKMessageEntryView_audioButtonLongPressed___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  [a1[4] setShouldUseLinearResizeForAudioMessage:0];
  [a1[5] impactOccurred];
  BOOL v3 = [WeakRetained audioMessageButtonTimer];
  [v3 invalidate];

  [WeakRetained setAudioMessageButtonTimer:0];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__CKMessageEntryView_audioButtonLongPressed___block_invoke_2;
  v5[3] = &unk_1E5620C40;
  v5[4] = a1[4];
  [MEMORY[0x1E4F42FF0] animateWithDuration:v5 animations:0.5];
  [a1[4] startRecordingForAudioButtonInEntryView];
  id v4 = [a1[4] delegate];
  [v4 messageEntryViewDidChange:a1[4] isTextChange:0 isShelfChange:0];
}

uint64_t __45__CKMessageEntryView_audioButtonLongPressed___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) configureForDisplayMode:2];
}

- (void)showAudioHintWithReason:(int64_t)a3
{
  uint64_t v5 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v6 = [v5 isAudioMessagesEntryViewRecordingEnabled];

  if (v6)
  {
    double v7 = [(CKMessageEntryView *)self audioHintLabel];
    int v8 = [v7 isHidden];

    if (v8)
    {
      if (a3 == 2)
      {
        double v9 = [(CKMessageEntryView *)self audioHintLabel];
        double v10 = CKFrameworkBundle();
        double v11 = v10;
        double v12 = @"AUDIO_HINT_RECORDING_NOT_AVAILABLE";
      }
      else if (a3 == 1)
      {
        double v9 = [(CKMessageEntryView *)self audioHintLabel];
        double v10 = CKFrameworkBundle();
        double v11 = v10;
        double v12 = @"AUDIO_HINT_COMPOSITION";
      }
      else
      {
        if (a3)
        {
LABEL_10:
          CGFloat v14 = [(CKMessageEntryView *)self audioButton];
          [v14 setUserInteractionEnabled:0];

          double v15 = [(CKMessageEntryView *)self plusButton];
          CGFloat v16 = [v15 button];
          [v16 setEnabled:0];

          double v17 = [(CKMessageEntryView *)self sendButton];
          [v17 setEnabled:0];

          BOOL v18 = [(CKMessageEntryView *)self audioHintLabel];
          [v18 setAlpha:0.0];

          BOOL v19 = [(CKMessageEntryView *)self audioHintLabel];
          [v19 setHidden:0];

          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __46__CKMessageEntryView_showAudioHintWithReason___block_invoke;
          v21[3] = &unk_1E5620C40;
          v21[4] = self;
          v20[0] = MEMORY[0x1E4F143A8];
          v20[1] = 3221225472;
          v20[2] = __46__CKMessageEntryView_showAudioHintWithReason___block_invoke_2;
          v20[3] = &unk_1E5620BF0;
          v20[4] = self;
          [MEMORY[0x1E4F42FF0] animateWithDuration:v21 animations:v20 completion:0.25];
          return;
        }
        double v9 = [(CKMessageEntryView *)self audioHintLabel];
        double v10 = CKFrameworkBundle();
        double v11 = v10;
        double v12 = @"AUDIO_HINT_TAP";
      }
      double v13 = [v10 localizedStringForKey:v12 value:&stru_1EDE4CA38 table:@"ChatKit"];
      [v9 setText:v13];

      goto LABEL_10;
    }
  }
}

void __46__CKMessageEntryView_showAudioHintWithReason___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setShouldShowAudioMessageHint:1];
  [*(id *)(a1 + 32) setNeedsLayout];
  [*(id *)(a1 + 32) layoutIfNeeded];
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 messageEntryViewDidChange:*(void *)(a1 + 32) isTextChange:0 isShelfChange:0];

  BOOL v3 = [*(id *)(a1 + 32) audioHintLabel];
  [v3 setAlpha:1.0];

  id v4 = [*(id *)(a1 + 32) contentView];
  [v4 setHidden:1];
}

uint64_t __46__CKMessageEntryView_showAudioHintWithReason___block_invoke_2()
{
  return im_dispatch_after();
}

uint64_t __46__CKMessageEntryView_showAudioHintWithReason___block_invoke_3(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__CKMessageEntryView_showAudioHintWithReason___block_invoke_4;
  v3[3] = &unk_1E5620C40;
  uint64_t v4 = *(void *)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __46__CKMessageEntryView_showAudioHintWithReason___block_invoke_5;
  v2[3] = &unk_1E5620BF0;
  v2[4] = v4;
  return [MEMORY[0x1E4F42FF0] animateWithDuration:v3 animations:v2 completion:0.25];
}

void __46__CKMessageEntryView_showAudioHintWithReason___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setShouldShowAudioMessageHint:0];
  [*(id *)(a1 + 32) setNeedsLayout];
  [*(id *)(a1 + 32) layoutIfNeeded];
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 messageEntryViewDidChange:*(void *)(a1 + 32) isTextChange:0 isShelfChange:0];

  BOOL v3 = [*(id *)(a1 + 32) audioHintLabel];
  [v3 setAlpha:0.0];

  id v4 = [*(id *)(a1 + 32) audioButton];
  [v4 setUserInteractionEnabled:1];
}

void __46__CKMessageEntryView_showAudioHintWithReason___block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) contentView];
  [v2 setHidden:0];

  BOOL v3 = [*(id *)(a1 + 32) plusButton];
  id v4 = [v3 button];
  [v4 setEnabled:1];

  uint64_t v5 = [*(id *)(a1 + 32) sendButton];
  [v5 setEnabled:1];

  id v6 = [*(id *)(a1 + 32) audioHintLabel];
  [v6 setHidden:1];
}

- (void)startRecording
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(CKMessageEntryView *)self recorder];
  [(CKMessageEntryView *)self setPowerLevels:0];
  [(CKMessageEntryView *)self setDuration:0.0];
  id v4 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  char v5 = [v4 isAudioMessagesEntryViewRecordingEnabled];

  if ((v5 & 1) == 0)
  {
    id v6 = [(CKMessageEntryView *)self waveformView];
    [v6 setDuration:0.0];

    double v7 = [(CKMessageEntryView *)self waveformView];
    [v7 clearPowerLevels];

    [(CKMessageEntryView *)self presentAudioActionButtons];
  }
  if (IMOSLoggingEnabled())
  {
    int v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      double v9 = [(CKMessageEntryView *)self recorder];
      double v10 = [(CKMessageEntryView *)self recorder];
      int v11 = [v10 isRecording];
      double v12 = @"NO";
      if (v11) {
        double v12 = @"YES";
      }
      int v16 = 138412546;
      double v17 = v9;
      __int16 v18 = 2112;
      BOOL v19 = v12;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Start recording with recorder: %@ isRecordingAlready: %@", (uint8_t *)&v16, 0x16u);
    }
  }
  double v13 = [(CKMessageEntryView *)self conversation];
  CGFloat v14 = [v13 sendingService];
  if ([(CKMessageEntryView *)self shouldRecordForService:v14])
  {
    char v15 = [v3 isRecording];

    if ((v15 & 1) == 0) {
      [v3 startRecordingForRaiseGesture:0 shouldPlaySound:0];
    }
  }
  else
  {
  }
}

- (double)powerLevelForAudioMessageRecordingView:(id)a3
{
  uint64_t v4 = [(CKMessageEntryView *)self recorder];
  if (v4
    && (char v5 = (void *)v4,
        [(CKMessageEntryView *)self recorder],
        id v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 isRecording],
        v6,
        v5,
        (v7 & 1) != 0))
  {
    int v8 = [(CKMessageEntryView *)self recorder];
    [v8 averagePower];
    float v10 = v9;
  }
  else
  {
    return nanf(0);
  }
  return v10;
}

- (void)setupAudioMessageQuickSendViewAndStopRecording
{
  BOOL v3 = [(CKMessageEntryView *)self recorder];

  if (!v3)
  {
    if (!IMOSLoggingEnabled()) {
      return;
    }
    id v6 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      goto LABEL_13;
    }
    __int16 v11 = 0;
    char v7 = "Tried to stop a recording with a nil audio recorder.";
    int v8 = (uint8_t *)&v11;
LABEL_12:
    _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, v7, v8, 2u);
LABEL_13:

    return;
  }
  uint64_t v4 = [(CKMessageEntryView *)self audioRecordingView];

  if (!v4)
  {
    if (!IMOSLoggingEnabled()) {
      return;
    }
    id v6 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    char v7 = "Tried to stop a recording with a nil audio recording view.";
    int v8 = buf;
    goto LABEL_12;
  }
  char v5 = [(CKMessageEntryView *)self recorder];
  [v5 setPaused:1];

  [(CKMessageEntryView *)self stopRecording];
  id v9 = [(CKMessageEntryView *)self audioRecordingView];
  [v9 setPlaybackCurrentTime:NAN];
}

- (void)stopRecording
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    BOOL v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = [(CKMessageEntryView *)self recorder];
      char v5 = [(CKMessageEntryView *)self recorder];
      int v6 = [v5 isRecording];
      char v7 = @"NO";
      if (v6) {
        char v7 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      double v12 = v4;
      __int16 v13 = 2112;
      CGFloat v14 = v7;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Stop recording with recorder: %@ isRecordingAlready: %@", buf, 0x16u);
    }
  }
  int v8 = [(CKMessageEntryView *)self recorder];
  if ([v8 isRecording])
  {
    [(CKMessageEntryView *)self sendEnableRotationAfterRecordingToDelegate];
    id v9 = [(CKMessageEntryView *)self recorder];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __35__CKMessageEntryView_stopRecording__block_invoke;
    v10[3] = &unk_1E5622818;
    v10[4] = self;
    [v9 stopRecording:v10];
  }
}

void __35__CKMessageEntryView_stopRecording__block_invoke(uint64_t a1, void *a2)
{
  id v16 = a2;
  if (v16)
  {
    BOOL v3 = [v16 mediaObjects];
    uint64_t v4 = [v3 firstObject];

    if (v4)
    {
      [v4 duration];
      double v6 = v5;
      char v7 = [*(id *)(a1 + 32) audioRecordingView];
      [v7 setPlaybackDuration:v6];

      int v8 = [*(id *)(a1 + 32) audioRecordingView];
      [v8 setState:2];

      id v9 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      int v10 = [v9 isAudioMessagesEntryViewRecordingEnabled];

      __int16 v11 = *(void **)(a1 + 32);
      if (v10)
      {
        double v12 = [v11 audioRecordingView];
        [v12 intensities];
      }
      else
      {
        double v12 = [v11 waveformView];
        [v12 powerLevels];
      __int16 v13 = };
      [v4 setPowerLevels:v13];

      CGFloat v14 = [*(id *)(a1 + 32) conversation];
      [v14 setUnsentComposition:v16];
    }
    [*(id *)(a1 + 32) setAudioComposition:v16];
    [*(id *)(a1 + 32) configureForDisplayMode:3];
  }
  uint64_t v15 = [*(id *)(a1 + 32) recorder];
  [v15 setCompletion:0];
}

- (void)audioMessageRecordingViewDidResume:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(CKMessageEntryView *)self recorder];

  if (v5)
  {
    if (IMOSLoggingEnabled())
    {
      double v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        char v7 = [(CKMessageEntryView *)self recorder];
        int v8 = [(CKMessageEntryView *)self recorder];
        int v9 = [v8 isRecording];
        int v10 = @"NO";
        if (v9) {
          int v10 = @"YES";
        }
        int v25 = 138412546;
        uint64_t v26 = v7;
        __int16 v27 = 2112;
        uint64_t v28 = v10;
        _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Resume recording with recorder: %@ isRecordingAlready: %@", (uint8_t *)&v25, 0x16u);
      }
    }
    __int16 v11 = [(CKMessageEntryView *)self audioComposition];

    if (v11)
    {
      double v12 = [(CKMessageEntryView *)self audioComposition];
      __int16 v13 = [v12 mediaObjects];
      CGFloat v14 = [v13 firstObject];

      [v14 duration];
      double v16 = v15;
      double v17 = [(CKMessageEntryView *)self audioRecordingView];
      [v17 setPlaybackDuration:v16];

      __int16 v18 = [(CKMessageEntryView *)self audioRecordingView];
      BOOL v19 = [v14 powerLevels];
      [v18 setWithIntensities:v19];

      uint64_t v20 = [(CKMessageEntryView *)self recorder];
      [v20 setPaused:1];

      BOOL v21 = [(CKMessageEntryView *)self recorder];
      objc_msgSend(v21, "setTotalPacketsCount:", objc_msgSend(v14, "totalPacketsCount"));

      BOOL v22 = [(CKMessageEntryView *)self recorder];
      double v23 = [v14 temporaryFileURL];
      [v22 setFileURL:v23];
    }
    [(CKMessageEntryView *)self startRecording];
    int v24 = [(CKMessageEntryView *)self recorder];
    [v24 setPaused:0];
  }
}

- (void)audioMessageRecordingViewDidSend:(id)a3
{
  id v4 = [(CKMessageEntryView *)self recorder];

  if (v4)
  {
    double v5 = [(CKMessageEntryView *)self recorder];
    [v5 setPaused:0];

    double v6 = [(CKMessageEntryView *)self audioController];
    [v6 stop];

    [(CKMessageEntryView *)self sendAudioMessage];
  }
}

- (void)sendAudioMessage
{
  BOOL v3 = [(CKMessageEntryView *)self recorder];
  int v4 = [v3 isRecording];

  if (v4)
  {
    [(CKMessageEntryView *)self sendEnableRotationAfterRecordingToDelegate];
    id location = 0;
    objc_initWeak(&location, self);
    double v5 = [(CKMessageEntryView *)self recorder];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __38__CKMessageEntryView_sendAudioMessage__block_invoke;
    v6[3] = &unk_1E5629480;
    objc_copyWeak(&v7, &location);
    [v5 stopRecording:v6];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  else if ([(CKMessageEntryView *)self hasRecording])
  {
    [(CKMessageEntryView *)self _handleSendAudioMessage];
  }
}

void __38__CKMessageEntryView_sendAudioMessage__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v4)
  {
    [WeakRetained setAudioComposition:v4];
    [WeakRetained _handleSendAudioMessage];
  }
  [WeakRetained configureForDisplayMode:1];
}

- (void)_handleSendAudioMessage
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    BOOL v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v4 = [(CKMessageEntryView *)self audioComposition];
      int v10 = 138412290;
      __int16 v11 = v4;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Sending audio message with audio composition: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  double v5 = [(CKMessageEntryView *)self recorder];

  if (v5)
  {
    double v6 = [(CKMessageEntryView *)self recorder];
    [v6 resetState];
  }
  [(CKMessageEntryView *)self _deleteTemporaryAudioFile];
  id v7 = [(CKMessageEntryView *)self audioComposition];
  [(CKMessageEntryView *)self _trackAudioMessageSentWithComposition:v7];

  int v8 = [(CKMessageEntryView *)self audioMessageAppDelegate];
  [v8 audioMessageDidSendMessage];

  int v9 = [(CKMessageEntryView *)self delegate];
  [v9 messageEntryViewSendButtonHit:self];
}

- (void)audioMessageRecordingViewDidCancel:(id)a3
{
  id v4 = [(CKMessageEntryView *)self audioController];

  if (v4)
  {
    double v5 = [(CKMessageEntryView *)self audioController];
    [v5 stop];

    [(CKMessageEntryView *)self setAudioController:0];
  }
  double v6 = [(CKMessageEntryView *)self recorder];

  if (v6)
  {
    id v7 = [(CKMessageEntryView *)self recorder];
    [v7 setPaused:0];

    int v8 = [(CKMessageEntryView *)self recorder];
    [v8 cancelRecording];

    int v9 = [(CKMessageEntryView *)self recorder];
    [v9 resetState];

    [(CKMessageEntryView *)self clearAudioRecordingUI];
    [(CKMessageEntryView *)self _deleteTemporaryAudioFile];
  }
}

- (void)_deleteTemporaryAudioFile
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isAudioMessagesEntryViewRecordingEnabled];

  if (v4)
  {
    double v5 = [(CKMessageEntryView *)self audioComposition];

    if (v5)
    {
      double v6 = [(CKMessageEntryView *)self audioComposition];
      id v7 = [v6 mediaObjects];
      int v8 = [v7 firstObject];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = v8;
        if (IMOSLoggingEnabled())
        {
          int v10 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            __int16 v11 = [v9 temporaryFileURL];
            *(_DWORD *)buf = 138412290;
            id v18 = v11;
            _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Deleting temporary audio file at url: %@", buf, 0xCu);
          }
        }
        uint64_t v12 = [MEMORY[0x1E4F28CB8] defaultManager];
        __int16 v13 = [v9 temporaryFileURL];
        id v16 = 0;
        [v12 removeItemAtURL:v13 error:&v16];
        id v14 = v16;

        if (v14 && IMOSLoggingEnabled())
        {
          double v15 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v18 = v14;
            _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "Failed to delete temporary audio file with error: %@", buf, 0xCu);
          }
        }
      }
    }
  }
}

- (void)audioMessageRecordingViewDidPlay:(id)a3
{
  id v3 = [(CKMessageEntryView *)self audioController];
  [v3 play];
}

- (void)audioMessageRecordingViewDidPause:(id)a3
{
  id v3 = [(CKMessageEntryView *)self audioController];
  [v3 pause];
}

- (void)audioMessageRecordingViewDidStartScrubbing:(id)a3
{
  int v4 = [(CKMessageEntryView *)self audioController];
  int v5 = [v4 isPlaying];

  if (v5)
  {
    double v6 = [(CKMessageEntryView *)self audioController];
    [v6 pause];

    [(CKMessageEntryView *)self setAudioControllerWasPlayingBeforeScrubbing:1];
  }
}

- (void)audioMessageRecordingViewDidUpdateScrubbing:(id)a3 atTime:(double)a4
{
  id v5 = [(CKMessageEntryView *)self audioController];
  [v5 layoutViewsForScrubbingTime:a4];
}

- (void)audioMessageRecordingViewDidStopScrubbing:(id)a3 atTime:(double)a4
{
  double v6 = [(CKMessageEntryView *)self audioController];
  [v6 setCurrentTime:a4];

  if ([(CKMessageEntryView *)self audioControllerWasPlayingBeforeScrubbing])
  {
    id v7 = [(CKMessageEntryView *)self audioController];
    [v7 play];

    [(CKMessageEntryView *)self setAudioControllerWasPlayingBeforeScrubbing:0];
  }
}

- (void)clearAudioRecordingUI
{
  id v3 = [(CKMessageEntryView *)self audioRecordingView];

  if (v3)
  {
    int v4 = [(CKMessageEntryView *)self audioRecordingView];
    [v4 invalidateDisplayLink];

    id v5 = [(CKMessageEntryView *)self audioRecordingView];
    [v5 removeFromSuperview];

    [(CKMessageEntryView *)self setAudioRecordingView:0];
    [(CKMessageEntryView *)self setAudioComposition:0];
    double v6 = [(CKMessageEntryView *)self conversation];
    [v6 setUnsentComposition:0];

    [(CKMessageEntryView *)self setComposition:0];
    [(CKMessageEntryView *)self configureForDisplayMode:1];
    id v7 = [(CKMessageEntryView *)self delegate];
    [v7 messageEntryViewDidChange:self isTextChange:0 isShelfChange:0];

    int v8 = [(CKMessageEntryView *)self inputDelegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      int v10 = [(CKMessageEntryView *)self inputDelegate];
      [v10 messageEntryViewDidClearAudioRecordingUI:self];
    }
    id v11 = [(CKMessageEntryView *)self recorder];
    [v11 resetState];
  }
}

- (CGRect)audioRecordingPillViewFrameInThrowViewCoordinates
{
  id v3 = [(CKMessageEntryView *)self audioRecordingView];

  if (v3)
  {
    int v4 = [(CKMessageEntryView *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      double v6 = [(CKMessageEntryView *)self delegate];
      id v7 = [(CKMessageEntryView *)self audioRecordingView];
      int v8 = [v7 backgroundView];
      [v6 messageEntryView:self frameInThrowViewCoordinatesForView:v8];
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;
    }
    else
    {
      double v6 = [(CKMessageEntryView *)self audioRecordingView];
      id v7 = [v6 backgroundView];
      double v17 = [(CKMessageEntryView *)self audioRecordingView];
      id v18 = [v17 backgroundView];
      [v18 bounds];
      objc_msgSend(v7, "convertRect:toView:", 0);
      double v10 = v19;
      double v12 = v20;
      double v14 = v21;
      double v16 = v22;
    }
  }
  else
  {
    double v10 = *MEMORY[0x1E4F1DB28];
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  double v23 = v10;
  double v24 = v12;
  double v25 = v14;
  double v26 = v16;
  result.size.double height = v26;
  result.size.double width = v25;
  result.origin.double y = v24;
  result.origin.double x = v23;
  return result;
}

- (id)audioRecordingPillViewSnapshot
{
  id v3 = [(CKMessageEntryView *)self audioRecordingView];

  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42A58]);
    char v5 = [(CKMessageEntryView *)self audioRecordingView];
    double v6 = [v5 backgroundView];
    [v6 frame];
    double v8 = v7;
    double v9 = [(CKMessageEntryView *)self audioRecordingView];
    double v10 = [v9 backgroundView];
    [v10 frame];
    double v12 = objc_msgSend(v4, "initWithSize:", v8, v11);

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __52__CKMessageEntryView_audioRecordingPillViewSnapshot__block_invoke;
    v16[3] = &unk_1E5620DE8;
    v16[4] = self;
    double v13 = [v12 imageWithActions:v16];
    id v14 = (id)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v13];
  }
  else
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F42AA0]);
  }

  return v14;
}

void __52__CKMessageEntryView_audioRecordingPillViewSnapshot__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) audioRecordingView];
  id v3 = [v2 backgroundView];
  [v3 frame];
  double v5 = v4;
  double v6 = [*(id *)(a1 + 32) audioRecordingView];
  double v7 = [v6 backgroundView];
  [v7 frame];
  double v9 = v8;

  id v11 = [*(id *)(a1 + 32) audioRecordingView];
  double v10 = [v11 backgroundView];
  objc_msgSend(v10, "drawViewHierarchyInRect:afterScreenUpdates:", 0, 0.0, 0.0, v5, v9);
}

- (void)applicationWillResignActive
{
  id v3 = [(CKMessageEntryView *)self recorder];

  if (v3)
  {
    double v4 = [(CKMessageEntryView *)self recorder];
    int v5 = [v4 isRecording];

    if (v5)
    {
      double v6 = [(CKMessageEntryView *)self audioRecordingView];
      uint64_t v7 = [v6 state];

      if (v7 != 2)
      {
        double v8 = [(CKMessageEntryView *)self recorder];
        [v8 setPaused:1];

        [(CKMessageEntryView *)self stopRecording];
        double v9 = [(CKMessageEntryView *)self audioComposition];
        double v10 = [v9 mediaObjects];
        id v16 = [v10 firstObject];

        if (v16)
        {
          [v16 duration];
          double v12 = v11;
          double v13 = [(CKMessageEntryView *)self audioRecordingView];
          [v13 setPlaybackDuration:v12];
        }
        id v14 = [(CKMessageEntryView *)self audioRecordingView];
        [v14 setState:2];

        double v15 = [(CKMessageEntryView *)self audioRecordingView];
        [v15 setPlaybackCurrentTime:NAN];
      }
    }
  }
}

- (void)audioController:(id)a3 mediaObjectDidFinishPlaying:(id)a4
{
  id v4 = [(CKMessageEntryView *)self audioRecordingView];
  [v4 setPlaybackCurrentTime:NAN];
}

- (void)audioController:(id)a3 mediaObjectProgressDidChange:(id)a4 currentTime:(double)a5 duration:(double)a6
{
  id v7 = [(CKMessageEntryView *)self audioRecordingView];
  [v7 setPlaybackCurrentTime:a5];
}

- (void)audioController:(id)a3 layoutViewsForScrubbingTime:(double)a4 mediaObject:(id)a5
{
  id v6 = [(CKMessageEntryView *)self audioRecordingView];
  [v6 setPlaybackCurrentTime:a4];
}

- (void)audioControllerDidStop:(id)a3
{
  id v3 = [(CKMessageEntryView *)self audioRecordingView];
  [v3 setState:2];
}

- (void)sendEnableRotationAfterRecordingToDelegate
{
  id v3 = [(CKMessageEntryView *)self delegate];

  if (v3)
  {
    id v4 = [(CKMessageEntryView *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = [(CKMessageEntryView *)self delegate];
      [v6 enableRotationAfterRecording];
    }
  }
}

- (void)setTextEffectCoordinatorPaused:(BOOL)a3 reason:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(CKMessageEntryView *)self contentView];
  [v7 setTextEffectCoordinatorPaused:v4 reason:v6];
}

- (NSArray)keyCommands
{
  return self->_keyCommands;
}

- (void)setKeyCommands:(id)a3
{
}

- (int64_t)style
{
  return self->_style;
}

- (CKMessageEntryViewAudioMessageAppDelegate)audioMessageAppDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioMessageAppDelegate);

  return (CKMessageEntryViewAudioMessageAppDelegate *)WeakRetained;
}

- (void)setAudioMessageAppDelegate:(id)a3
{
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
}

- (UIEdgeInsets)marginInsets
{
  double top = self->_marginInsets.top;
  double left = self->_marginInsets.left;
  double bottom = self->_marginInsets.bottom;
  double right = self->_marginInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (NSString)backdropGroupName
{
  return self->_backdropGroupName;
}

- (UIEdgeInsets)coverInsets
{
  double top = self->_coverInsets.top;
  double left = self->_coverInsets.left;
  double bottom = self->_coverInsets.bottom;
  double right = self->_coverInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setCoverInsets:(UIEdgeInsets)a3
{
  self->_coverInsets = a3;
}

- (BOOL)shouldShowSendButton
{
  return self->_shouldShowSendButton;
}

- (void)setShouldShowSendButton:(BOOL)a3
{
  self->_shouldShowSendButton = a3;
}

- (BOOL)shouldShowDictationButton
{
  return self->_shouldShowDictationButton;
}

- (void)setShouldShowDictationButton:(BOOL)a3
{
  self->_shouldShowDictationButton = a3;
}

- (BOOL)shouldShowSubject
{
  return self->_shouldShowSubject;
}

- (void)setShouldShowSubject:(BOOL)a3
{
  self->_shouldShowSubject = a3;
}

- (BOOL)shouldShowPluginButtons
{
  return self->_shouldShowPluginButtons;
}

- (void)setShouldShowPluginButtons:(BOOL)a3
{
  self->_shouldShowPluginButtons = a3;
}

- (BOOL)shouldShowCharacterCount
{
  return self->_shouldShowCharacterCount;
}

- (void)setShouldShowCharacterCount:(BOOL)a3
{
  self->_shouldShowCharacterCount = a3;
}

- (BOOL)shouldDisableAttachments
{
  return self->_shouldDisableAttachments;
}

- (void)setShouldDisableAttachments:(BOOL)a3
{
  self->_shouldDisableAttachments = a3;
}

- (CKMessageEntryViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKMessageEntryViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_UIClickInteractionDelegate)clickInteractionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clickInteractionDelegate);

  return (_UIClickInteractionDelegate *)WeakRetained;
}

- (void)setClickInteractionDelegate:(id)a3
{
}

- (CKMessageEntryViewInputDelegate)inputDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputDelegate);

  return (CKMessageEntryViewInputDelegate *)WeakRetained;
}

- (void)setInputDelegate:(id)a3
{
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void)setAppStrip:(id)a3
{
}

- (CKEntryViewButton)dictationButton
{
  return self->_dictationButton;
}

- (void)setDictationButton:(id)a3
{
}

- (UIActivityIndicatorView)sendButtonSpinner
{
  return self->_sendButtonSpinner;
}

- (void)setSendButtonSpinner:(id)a3
{
}

- (CKMessageEntryContentView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (CKMessageEntryWaveformView)waveformView
{
  return self->_waveformView;
}

- (void)setWaveformView:(id)a3
{
}

- (BOOL)animatingLayoutChange
{
  return self->_animatingLayoutChange;
}

- (void)setAnimatingLayoutChange:(BOOL)a3
{
  self->_animatingLayoutChange = a3;
}

- (BOOL)showAppStrip
{
  return self->_showAppStrip;
}

- (void)setShowAppStrip:(BOOL)a3
{
  self->_showAppStrip = a3;
}

- (CKEntryViewButton)photoButton
{
  return self->_photoButton;
}

- (void)setPhotoButton:(id)a3
{
}

- (CKEntryViewButton)sendButton
{
  return self->_sendButton;
}

- (void)setSendButton:(id)a3
{
}

- (UIView)buttonAndTextAreaContainerView
{
  return self->_buttonAndTextAreaContainerView;
}

- (void)setButtonAndTextAreaContainerView:(id)a3
{
}

- (BOOL)isKeyboardVisible
{
  return self->_keyboardVisible;
}

- (UITraitCollection)entryViewTraitCollection
{
  return self->_entryViewTraitCollection;
}

- (BOOL)languageHasSpaces
{
  return self->_languageHasSpaces;
}

- (void)setLanguageHasSpaces:(BOOL)a3
{
  self->_languageHasSpaces = a3;
}

- (unint64_t)displayMode
{
  return self->_displayMode;
}

- (void)setDisplayMode:(unint64_t)a3
{
  self->_displayMode = a3;
}

- (BOOL)entryFieldCollapsed
{
  return self->_entryFieldCollapsed;
}

- (void)setEntryFieldCollapsed:(BOOL)a3
{
  self->_entryFieldCollapsed = a3;
}

- (BOOL)shouldBlurForMessageEditing
{
  return self->_shouldBlurForMessageEditing;
}

- (BOOL)shouldUseLinearResizeForAudioMessage
{
  return self->_shouldUseLinearResizeForAudioMessage;
}

- (void)setShouldUseLinearResizeForAudioMessage:(BOOL)a3
{
  self->_shouldUseLinearResizeForAudioMessage = a3;
}

- (BOOL)extendAppStripBlurToKeyplaneTop
{
  return self->_extendAppStripBlurToKeyplaneTop;
}

- (void)setExtendAppStripBlurToKeyplaneTop:(BOOL)a3
{
  self->_extendAppStripBlurToKeyplaneTop = a3;
}

- (BOOL)shouldDisablePluginButtons
{
  return self->_disablePluginButtons;
}

- (BOOL)isComposingRecipient
{
  return self->_composingRecipient;
}

- (BOOL)hasFailedRecipients
{
  return self->_failedRecipients;
}

- (BOOL)hasUnreachableEmergencyRecipient
{
  return self->_unreachableEmergencyRecipient;
}

- (BOOL)isSendingMessage
{
  return self->_sendingMessage;
}

- (CKAudioRecorder)recorder
{
  return self->_recorder;
}

- (void)setRecorder:(id)a3
{
}

- (UIKeyboardLayoutGuide)entryViewKeyboardLayoutGuide
{
  return self->_entryViewKeyboardLayoutGuide;
}

- (void)setEntryViewKeyboardLayoutGuide:(id)a3
{
}

- (double)previousBottomSafeAreaInset
{
  return self->_previousBottomSafeAreaInset;
}

- (void)setPreviousBottomSafeAreaInset:(double)a3
{
  self->_previousBottomSafeAreaInset = a3;
}

- (BOOL)shouldShowSendButtonSpinner
{
  return self->_shouldShowSendButtonSpinner;
}

- (void)setShouldShowSendButtonSpinner:(BOOL)a3
{
  self->_shouldShowSendButtonSpinner = a3;
}

- (CKEntryViewPlusButton)plusButton
{
  return self->_plusButton;
}

- (void)setPlusButton:(id)a3
{
}

- (UISelectionFeedbackGenerator)plusButtonFeedbackGenerator
{
  return self->_plusButtonFeedbackGenerator;
}

- (BOOL)plusButtonFeedbackGeneratorIsActive
{
  return self->_plusButtonFeedbackGeneratorIsActive;
}

- (UIView)inputButtonContainerView
{
  return self->_inputButtonContainerView;
}

- (void)setInputButtonContainerView:(id)a3
{
}

- (CKEntryViewButton)browserButton
{
  return self->_browserButton;
}

- (void)setBrowserButton:(id)a3
{
}

- (CKEntryViewButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
}

- (CKEntryViewButton)stopButton
{
  return self->_stopButton;
}

- (void)setStopButton:(id)a3
{
}

- (CKEntryViewButton)arrowButton
{
  return self->_arrowButton;
}

- (void)setArrowButton:(id)a3
{
}

- (_UIClickInteraction)sendButtonClickInteraction
{
  return self->_sendButtonClickInteraction;
}

- (void)setSendButtonClickInteraction:(id)a3
{
}

- (UILabel)characterCountLabel
{
  return self->_characterCountLabel;
}

- (void)setCharacterCountLabel:(id)a3
{
}

- (CGSize)inputButtonSize
{
  double width = self->_inputButtonSize.width;
  double height = self->_inputButtonSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setInputButtonSize:(CGSize)a3
{
  self->_inputButtonSize = a3;
}

- (CGSize)sendButtonSize
{
  double width = self->_sendButtonSize.width;
  double height = self->_sendButtonSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSendButtonSize:(CGSize)a3
{
  self->_sendButtonSize = a3;
}

- (CGSize)characterCountSize
{
  double width = self->_characterCountSize.width;
  double height = self->_characterCountSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCharacterCountSize:(CGSize)a3
{
  self->_characterCountSize = a3;
}

- (CKMessageEntryBackgroundViewProtocol)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (UIView)knockoutView
{
  return self->_knockoutView;
}

- (void)setKnockoutView:(id)a3
{
}

- (UIVisualEffectView)knockoutVisualEffectView
{
  return self->_knockoutVisualEffectView;
}

- (void)setKnockoutVisualEffectView:(id)a3
{
}

- (UIVisualEffectView)messageEditingBlurOverlayView
{
  return self->_messageEditingBlurOverlayView;
}

- (void)setMessageEditingBlurOverlayView:(id)a3
{
}

- (BOOL)isCharacterCountHidden
{
  return self->_characterCountHidden;
}

- (BOOL)shouldCenterCharacterCount
{
  return self->_shouldCenterCharacterCount;
}

- (void)setShouldCenterCharacterCount:(BOOL)a3
{
  self->_shouldCenterCharacterCount = a3;
}

- (BOOL)shouldAllowImpactSend
{
  return self->_shouldAllowImpactSend;
}

- (void)setShouldAllowImpactSend:(BOOL)a3
{
  self->_shouldAllowImpactSend = a3;
}

- (UIView)contentClipView
{
  return self->_contentClipView;
}

- (void)setContentClipView:(id)a3
{
}

- (CAShapeLayer)dashedContentClipViewLayer
{
  return self->_dashedContentClipViewLayer;
}

- (void)setDashedContentClipViewLayer:(id)a3
{
}

- (BOOL)isTransitioningForBrowserSwitcher
{
  return self->_isTransitioningForBrowserSwitcher;
}

- (void)setIsTransitioningForBrowserSwitcher:(BOOL)a3
{
  self->_isTransitioningForBrowserSwitcher = a3;
}

- (int64_t)sendMenuPresentationState
{
  return self->_sendMenuPresentationState;
}

- (void)setSendMenuPresentationState:(int64_t)a3
{
  self->_int64_t sendMenuPresentationState = a3;
}

- (BOOL)shouldCoverViewBeShrunkenForSendMenu
{
  return self->_shouldCoverViewBeShrunkenForSendMenu;
}

- (void)setShouldCoverViewBeShrunkenForSendMenu:(BOOL)a3
{
  self->_shouldCoverViewBeShrunkenForSendMenu = a3;
}

- (UILabel)collpasedPlaceholderLabel
{
  return self->_collpasedPlaceholderLabel;
}

- (void)setCollpasedPlaceholderLabel:(id)a3
{
}

- (UIButton)emojiButton
{
  return self->_emojiButton;
}

- (void)setEmojiButton:(id)a3
{
}

- (UIView)appStripBackgroundBlurContainerView
{
  return self->_appStripBackgroundBlurContainerView;
}

- (void)setAppStripBackgroundBlurContainerView:(id)a3
{
}

- (UIKBVisualEffectView)appStripBackgroundBlurView
{
  return self->_appStripBackgroundBlurView;
}

- (void)setAppStripBackgroundBlurView:(id)a3
{
}

- (UITextInputTraits_Private)lastConfiguredInputDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lastConfiguredInputDelegate);

  return (UITextInputTraits_Private *)WeakRetained;
}

- (void)setLastConfiguredInputDelegate:(id)a3
{
}

- (CKMentionSuggestionView)mentionSuggestionView
{
  return self->_mentionSuggestionView;
}

- (void)setMentionSuggestionView:(id)a3
{
}

- (NSArray)currentMentionSuggestions
{
  return self->_currentMentionSuggestions;
}

- (void)setCurrentMentionSuggestions:(id)a3
{
}

- (BOOL)showingMentionsSuggestions
{
  return self->_showingMentionsSuggestions;
}

- (void)setShowingMentionsSuggestions:(BOOL)a3
{
  self->_showingMentionsSuggestions = a3;
}

- (BOOL)isUpdatingMentionAttributedText
{
  return self->_isUpdatingMentionAttributedText;
}

- (void)setIsUpdatingMentionAttributedText:(BOOL)a3
{
  self->_isUpdatingMentionAttributedText = a3;
}

- (NSMutableSet)entityHandles
{
  return self->_entityHandles;
}

- (void)setEntityHandles:(id)a3
{
}

- (NSMutableDictionary)entityDictionary
{
  return self->_entityDictionary;
}

- (void)setEntityDictionary:(id)a3
{
}

- (_NSRange)rangeOfTappedMention
{
  p_rangeOfTappedMention = &self->_rangeOfTappedMention;
  NSUInteger location = self->_rangeOfTappedMention.location;
  NSUInteger length = p_rangeOfTappedMention->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRangeOfTappedMention:(_NSRange)a3
{
  self->_rangeOfTappedMention = a3;
}

- (CKMentionEntityNode)entityTree
{
  return self->_entityTree;
}

- (void)setEntityTree:(id)a3
{
}

- (_UISupplementalLexicon)mentionsLexicon
{
  return self->_mentionsLexicon;
}

- (void)setMentionsLexicon:(id)a3
{
}

- (_NSRange)lastFoundMentionRange
{
  p_lastFoundMentionRange = &self->_lastFoundMentionRange;
  NSUInteger location = self->_lastFoundMentionRange.location;
  NSUInteger length = p_lastFoundMentionRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setLastFoundMentionRange:(_NSRange)a3
{
  self->_lastFoundMentionRange = a3;
}

- (unint64_t)currentTappedCharacterIndex
{
  return self->_currentTappedCharacterIndex;
}

- (void)setCurrentTappedCharacterIndex:(unint64_t)a3
{
  self->_currentTappedCharacterIndedouble x = a3;
}

- (id)didSelectEntityCompletionHandler
{
  return self->_didSelectEntityCompletionHandler;
}

- (void)setDidSelectEntityCompletionHandler:(id)a3
{
}

- (CKScheduledUpdater)entryFieldCollapsedUpdater
{
  return self->_entryFieldCollapsedUpdater;
}

- (void)setEntryFieldCollapsedUpdater:(id)a3
{
}

- (BOOL)entryFieldUpdaterCollapsedValue
{
  return self->_entryFieldUpdaterCollapsedValue;
}

- (void)setEntryFieldUpdaterCollapsedValue:(BOOL)a3
{
  self->_entryFieldUpdaterCollapsedValue = a3;
}

- (BOOL)entryFieldUpdaterAnimatedValue
{
  return self->_entryFieldUpdaterAnimatedValue;
}

- (void)setEntryFieldUpdaterAnimatedValue:(BOOL)a3
{
  self->_entryFieldUpdaterAnimatedValue = a3;
}

- (UISwipeGestureRecognizer)swipeGestureRecognizer
{
  return self->_swipeGestureRecognizer;
}

- (void)setSwipeGestureRecognizer:(id)a3
{
}

- (CKAudioController)audioController
{
  return self->_audioController;
}

- (void)setAudioController:(id)a3
{
}

- (BOOL)audioControllerWasPlayingBeforeScrubbing
{
  return self->_audioControllerWasPlayingBeforeScrubbing;
}

- (void)setAudioControllerWasPlayingBeforeScrubbing:(BOOL)a3
{
  self->_audioControllerWasPlayingBeforeScrubbing = a3;
}

- (BOOL)recordingStartedFromRaiseGesture
{
  return self->_recordingStartedFromRaiseGesture;
}

- (void)setRecordingStartedFromRaiseGesture:(BOOL)a3
{
  self->_recordingStartedFromRaiseGesture = a3;
}

- (BOOL)shouldShowAudioMessageHint
{
  return self->_shouldShowAudioMessageHint;
}

- (void)setShouldShowAudioMessageHint:(BOOL)a3
{
  self->_shouldShowAudioMessageHint = a3;
}

- (CKAudioMessageRecordingView)audioRecordingView
{
  return self->_audioRecordingView;
}

- (void)setAudioRecordingView:(id)a3
{
}

- (NSTimer)audioMessageButtonTimer
{
  return self->_audioMessageButtonTimer;
}

- (void)setAudioMessageButtonTimer:(id)a3
{
}

- (CKComposition)audioComposition
{
  return self->_audioComposition;
}

- (CKComposition)previousAudioComposition
{
  return self->_previousAudioComposition;
}

- (void)setPreviousAudioComposition:(id)a3
{
}

- (CKMessageEntryRecordedAudioView)recordedAudioView
{
  return self->_recordedAudioView;
}

- (void)setRecordedAudioView:(id)a3
{
}

- (CGSize)waveformViewSize
{
  double width = self->_waveformViewSize.width;
  double height = self->_waveformViewSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setWaveformViewSize:(CGSize)a3
{
  self->_waveformViewSize = a3;
}

- (CKEntryViewButton)audioButton
{
  return self->_audioButton;
}

- (void)setAudioButton:(id)a3
{
}

- (UILabel)audioHintLabel
{
  return self->_audioHintLabel;
}

- (void)setAudioHintLabel:(id)a3
{
}

- (CKEntryViewButton)sendAudioButton
{
  return self->_sendAudioButton;
}

- (void)setSendAudioButton:(id)a3
{
}

- (void)setKeyboardButton:(id)a3
{
}

- (BOOL)dictationEnabledForLanguage
{
  return self->_dictationEnabledForLanguage;
}

- (void)setDictationEnabledForLanguage:(BOOL)a3
{
  self->_dictationEnabledForLanguage = a3;
}

- (CKMessageEntryHintView)hintView
{
  return self->_hintView;
}

- (void)setHintView:(id)a3
{
}

- (BOOL)isAudioMessageRecordingAvailable
{
  return self->_audioMessageRecordingAvailable;
}

- (void)setAudioMessageRecordingAvailable:(BOOL)a3
{
  self->_audioMessageRecordingAvailable = a3;
}

- (NSMutableArray)powerLevels
{
  return self->_powerLevels;
}

- (void)setPowerLevels:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerLevels, 0);
  objc_storeStrong((id *)&self->_hintView, 0);
  objc_storeStrong((id *)&self->_keyboardButton, 0);
  objc_storeStrong((id *)&self->_sendAudioButton, 0);
  objc_storeStrong((id *)&self->_audioHintLabel, 0);
  objc_storeStrong((id *)&self->_audioButton, 0);
  objc_storeStrong((id *)&self->_recordedAudioView, 0);
  objc_storeStrong((id *)&self->_previousAudioComposition, 0);
  objc_storeStrong((id *)&self->_audioComposition, 0);
  objc_storeStrong((id *)&self->_audioMessageButtonTimer, 0);
  objc_storeStrong((id *)&self->_audioRecordingView, 0);
  objc_storeStrong((id *)&self->_audioController, 0);
  objc_storeStrong((id *)&self->_swipeGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_entryFieldCollapsedUpdater, 0);
  objc_storeStrong(&self->_didSelectEntityCompletionHandler, 0);
  objc_storeStrong((id *)&self->_mentionsLexicon, 0);
  objc_storeStrong((id *)&self->_entityTree, 0);
  objc_storeStrong((id *)&self->_entityDictionary, 0);
  objc_storeStrong((id *)&self->_entityHandles, 0);
  objc_storeStrong((id *)&self->_currentMentionSuggestions, 0);
  objc_storeStrong((id *)&self->_mentionSuggestionView, 0);
  objc_destroyWeak((id *)&self->_lastConfiguredInputDelegate);
  objc_storeStrong((id *)&self->_appStripBackgroundBlurView, 0);
  objc_storeStrong((id *)&self->_appStripBackgroundBlurContainerView, 0);
  objc_storeStrong((id *)&self->_emojiButton, 0);
  objc_storeStrong((id *)&self->_collpasedPlaceholderLabel, 0);
  objc_storeStrong((id *)&self->_dashedContentClipViewLayer, 0);
  objc_storeStrong((id *)&self->_contentClipView, 0);
  objc_storeStrong((id *)&self->_messageEditingBlurOverlayView, 0);
  objc_storeStrong((id *)&self->_knockoutVisualEffectView, 0);
  objc_storeStrong((id *)&self->_knockoutView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_characterCountLabel, 0);
  objc_storeStrong((id *)&self->_sendButtonClickInteraction, 0);
  objc_storeStrong((id *)&self->_arrowButton, 0);
  objc_storeStrong((id *)&self->_stopButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_browserButton, 0);
  objc_storeStrong((id *)&self->_inputButtonContainerView, 0);
  objc_storeStrong((id *)&self->_plusButtonFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_plusButton, 0);
  objc_storeStrong((id *)&self->_entryViewKeyboardLayoutGuide, 0);
  objc_storeStrong((id *)&self->_recorder, 0);
  objc_storeStrong((id *)&self->_entryViewTraitCollection, 0);
  objc_storeStrong((id *)&self->_buttonAndTextAreaContainerView, 0);
  objc_storeStrong((id *)&self->_sendButton, 0);
  objc_storeStrong((id *)&self->_photoButton, 0);
  objc_storeStrong((id *)&self->_waveformView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_sendButtonSpinner, 0);
  objc_storeStrong((id *)&self->_dictationButton, 0);
  objc_storeStrong((id *)&self->_appStrip, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_destroyWeak((id *)&self->_inputDelegate);
  objc_destroyWeak((id *)&self->_clickInteractionDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_backdropGroupName, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_destroyWeak((id *)&self->_audioMessageAppDelegate);

  objc_storeStrong((id *)&self->_keyCommands, 0);
}

- (void)plusButtonTouchDown:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_18EF18000, v0, v1, "PlusButton Touch Down", v2, v3, v4, v5, v6);
}

- (void)plusButtonTouchUpOutside:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_18EF18000, v0, v1, "PlusButton Touch Up Outside", v2, v3, v4, v5, v6);
}

- (void)plusButtonTouchCancel:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_18EF18000, v0, v1, "PlusButton Touch Cancel", v2, v3, v4, v5, v6);
}

- (void)plusButtonTouchDragEnter:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_18EF18000, v0, v1, "PlusButton Drag Enter", v2, v3, v4, v5, v6);
}

- (void)plusButtonTouchDragExit:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_18EF18000, v0, v1, "PlusButton Drag Exit", v2, v3, v4, v5, v6);
}

- (void)didSelectPlusButton:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_18EF18000, v0, v1, "PlusButton Selected", v2, v3, v4, v5, v6);
}

- (void)plusButtonLongPressed:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_18EF18000, v0, v1, "Not launching photos app following long press on plus button, delegate told us not to", v2, v3, v4, v5, v6);
}

- (void)plusButtonLongPressed:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_18EF18000, a2, OS_LOG_TYPE_DEBUG, "Ignoring gesture recognizer callback with state=%ld", (uint8_t *)&v2, 0xCu);
}

- (void)plusButtonLongPressed:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_18EF18000, v0, v1, "PlusButton Long Press gesture detected", v2, v3, v4, v5, v6);
}

- (void)_isDictationEnabled
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v1 = [NSString stringWithUTF8String:"BOOL _AFDictationRestricted(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CKMessageEntryView.m", 142, @"%s", dlerror());

  __break(1u);
}

@end