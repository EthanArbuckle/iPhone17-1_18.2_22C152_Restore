@interface MFComposeWebView
+ (NSArray)menuCommands;
+ (id)_basicWebViewConfiguration;
+ (id)_webViewConfiguration:(BOOL)a3;
+ (void)setURLCacheBlock:(id)a3;
- (BOOL)_canPerformCommandAction:(SEL)a3 withSender:(id)a4;
- (BOOL)_getExtensionAndMimeTypeForImageData:(id)a3 outExtension:(id *)a4 outMimeType:(id *)a5;
- (BOOL)_shouldShowAddLinkButton;
- (BOOL)_shouldShowInsertPhotosButton;
- (BOOL)_shouldShowMarkupButton;
- (BOOL)_sourceIsManaged;
- (BOOL)allowsAttachmentElements;
- (BOOL)becomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)isDirty;
- (BOOL)isQuickReply;
- (BOOL)resignFirstResponder;
- (CGRect)_linkAccessoryButtonFrameForSourceRect:(CGRect)a3;
- (CGRect)_rectFromMessageDict:(id)a3;
- (CGRect)rectOfElementWithID:(id)a3;
- (MFComposeWebView)initWithFrame:(CGRect)a3;
- (MFComposeWebView)initWithFrame:(CGRect)a3 isQuickReply:(BOOL)a4;
- (MFComposeWebViewDelegate)composeWebViewDelegate;
- (MFMailComposeCoordinator)composeCoordinator;
- (MFMailComposeViewDelegate)mailComposeViewDelegate;
- (MFMailSignatureController)signatureControllerProxy;
- (MSInputContextHistory)previousInputContextHistory;
- (NSArray)_leadingInputAssistantItemGroups;
- (NSArray)_trailingInputAssistantItemGroups;
- (NSMutableDictionary)richLinkActivityIndicators;
- (NSString)compositionContextID;
- (UIBarButtonItem)documentItem;
- (UIBarButtonItem)textFromCameraButtonItem;
- (UIBarButtonItemGroup)appleIntelligenceGroup;
- (UIBarButtonItemGroup)insertAttachmentGroup;
- (UIView)inputViewForPreservingFocus;
- (_NSRange)selectedRange;
- (id)_actionWithTitle:(void *)a3 glyphName:(int)a4 usePrivateCatalog:(void *)a5 handler:;
- (id)_actionWithTitle:(void *)a3 glyphName:(void *)a4 handler:;
- (id)_addInlineAttachmentWithData:(id)a3 fileName:(id)a4 type:(id)a5 contentID:(id)a6;
- (id)_attachmentInfoByIdentifier;
- (id)_attachmentInfoByURL;
- (id)_barButtonItemWithAction:(void *)a3 target:(uint64_t)a4 selector:;
- (id)_barButtonItemWithImageName:(void *)a3 title:(void *)a4 target:(uint64_t)a5 selector:;
- (id)_bodyFieldProxy;
- (id)_captureTextFromCameraAction;
- (id)_filenameForVideoAttachmentAtURL:(id)a3;
- (id)_findInteractionScrollViewForInsetAdjustment:(id)a3;
- (id)_formattingAction;
- (id)_importDocumentActionWithTitle:(id *)a1;
- (id)_insertPhotoActionWithTitle:(void *)a1;
- (id)_insertPhotoFromCameraActionWithTitle:(void *)a1;
- (id)_mailComposeEditingLeadingInputAssistantGroups;
- (id)_mailComposeEditingTrailingInputAssistantGroups;
- (id)_makeAttachmentDataWithFileURL:(id)a3 type:(id)a4;
- (id)_makeRichLinkTemplateButtonWithOrigin:(CGPoint)a3;
- (id)_markupActionWithTitle:(void *)a1;
- (id)_scanDocumentAction;
- (id)_showWritingToolsAction;
- (id)_textInputTraits;
- (id)containsRichText;
- (id)contentIDsForMediaAttachments;
- (id)getCaretPosition;
- (id)htmlString;
- (id)inputView;
- (id)keyCommands;
- (id)makeLinkAccessoryButton;
- (id)mimeTypeForFilename:(id)a3;
- (id)nextAttachmentName;
- (id)plainTextContent;
- (int64_t)_webView:(id)a3 dataOwnerForDragSession:(id)a4;
- (int64_t)_webView:(id)a3 dataOwnerForDropSession:(id)a4;
- (int64_t)_webView:(id)a3 decidePolicyForFocusedElement:(id)a4;
- (void)_addAttachment:(id)a3;
- (void)_addContextMenusToBuilder:(id)a3;
- (void)_captureTextFromCamera;
- (void)_changeQuoteLevelBy:(int64_t)a3;
- (void)_close;
- (void)_composeWebView:(id)a3 composeBodyIsEmpty:(BOOL)a4;
- (void)_composeWebView:(id)a3 didChangeHeight:(double)a4;
- (void)_decreaseQuoteLevel:(id)a3;
- (void)_decreaseQuoteLevelKeyCommandInvoked:(id)a3;
- (void)_didTapAddLink:(id)a3;
- (void)_didTapCameraButton:(id)a3;
- (void)_didTapEditLink:(id)a3;
- (void)_didTapEditTextDescription:(id)a3;
- (void)_didTapInsertDrawing:(id)a3;
- (void)_didTapInsertDrawingOrMarkupButton:(id)a3;
- (void)_didTapInsertPhotoButton:(id)a3;
- (void)_didTapMarkupButton:(id)a3;
- (void)_didTapRemoveLink;
- (void)_didTapShowWritingTools:(id)a3;
- (void)_findInteraction:(id)a3 navigatorPlacementWillChange:(id)a4;
- (void)_importDocumentCommandInvoked:(id)a3;
- (void)_increaseQuoteLevel:(id)a3;
- (void)_increaseQuoteLevelKeyCommandInvoked:(id)a3;
- (void)_insertDocumentFromData:(id)a3 isImage:(BOOL)a4 contentID:(id)a5;
- (void)_insertMediaWithAssetIdentifier:(id)a3 mediaURL:(id)a4 mediaType:(id)a5 mediaData:(id)a6 isVideo:(BOOL)a7 completion:(id)a8;
- (void)_menuDidHide:(id)a3;
- (void)_removeAttachment:(id)a3;
- (void)_removeInlineAttachment:(id)a3;
- (void)_scanDocumentCommandInvoked:(id)a3;
- (void)_showmakeLinkAccessoryButton;
- (void)_updateAppearanceForWritingToolsSession:(BOOL)a3;
- (void)_webView:(id)a3 didChangeFontAttributes:(id)a4;
- (void)_webView:(id)a3 didInsertAttachment:(id)a4 withSource:(id)a5;
- (void)_webView:(id)a3 didInvalidateDataForAttachment:(id)a4;
- (void)_webView:(id)a3 didRemoveAttachment:(id)a4;
- (void)_webView:(id)a3 didStartInputSession:(id)a4;
- (void)_webView:(id)a3 takeFocus:(int64_t)a4;
- (void)_webView:(id)a3 willStartInputSession:(id)a4;
- (void)addMailAttributesBeforeDisplayHidingTrailingEmptyQuotes:(BOOL)a3 shouldQuote:(BOOL)a4;
- (void)appendMarkupString:(id)a3 quote:(BOOL)a4;
- (void)appendOrReplace:(id)a3 withMarkupString:(id)a4 quote:(BOOL)a5 completion:(id)a6;
- (void)attachmentTapped:(id)a3;
- (void)buildMenuWithBuilder:(id)a3;
- (void)composeBodyFieldAddAttachmentWithData:(id)a3 filename:(id)a4 mimeType:(id)a5 uniqueID:(id)a6;
- (void)composeBodyFieldAddLinkPreviewsEnabled:(id)a3;
- (void)composeBodyFieldDidChange;
- (void)composeBodyFieldDidThrowException:(id)a3;
- (void)composeBodyFieldIsDirtyChanged:(BOOL)a3;
- (void)composeBodyFieldQuickReplyEnabled:(id)a3;
- (void)composeBodyFieldSelectionContainsLinkStateDidChange:(BOOL)a3;
- (void)composeBodyFieldSmartReplyAvailable:(id)a3;
- (void)compositionDidFailToFinish;
- (void)compositionSession:(id)a3 didReceiveText:(id)a4 replacementRange:(_NSRange)a5 inContext:(id)a6 finished:(BOOL)a7;
- (void)compositionWillFinish;
- (void)didEndWritingToolsSession:(id)a3 accepted:(BOOL)a4;
- (void)donateHasUsedAttachment;
- (void)enableQuickReply:(BOOL)a3;
- (void)getHTMLDataObject:(id)a3;
- (void)getHTMLDataObjectRemovingSignature:(BOOL)a3 completion:(id)a4;
- (void)getHTMLDataObjectRemovingSignature:(BOOL)a3 removeQuotes:(BOOL)a4 completion:(id)a5;
- (void)hideMakeLinkAccessoryButton;
- (void)insertDocumentWithData:(id)a3 fileName:(id)a4 mimeType:(id)a5 contentID:(id)a6;
- (void)insertDocumentWithURL:(id)a3 isDrawingFile:(BOOL)a4;
- (void)insertMediaWithPhotoPickerItem:(id)a3 completion:(id)a4;
- (void)insertPhotoOrVideoWithAssetIdentifier:(id)a3 infoDictionary:(id)a4 completion:(id)a5;
- (void)insertRichLinkWithURL:(id)a3 completionHandler:(id)a4;
- (void)insertScannedDocumentWithData:(id)a3;
- (void)invalidateInputContextHistory;
- (void)makeRichLinkFromSelection;
- (void)markupSelectedAttachment;
- (void)pasteRichLink;
- (void)placeCaretAtStartOfBodyField;
- (void)prepareDataForDocumentAtURLForInsertion:(id)a3 completion:(id)a4;
- (void)prependMarkupString:(id)a3 quote:(BOOL)a4;
- (void)prependPreamble:(id)a3 quote:(BOOL)a4;
- (void)prependString:(id)a3;
- (void)proofreadingSession:(id)a3 didReceiveSuggestions:(id)a4 processedRange:(_NSRange)a5 inContext:(id)a6 finished:(BOOL)a7;
- (void)releaseFocusAfterDismissing:(BOOL)a3;
- (void)removeMediaWithContentIdentifier:(id)a3;
- (void)removeRichLinkFromSelection;
- (void)replaceAttachment:(id)a3 withDocumentAtURL:(id)a4 completion:(id)a5;
- (void)replaceFilenamePlaceholderWithAttachment:(id)a3 fileName:(id)a4 mimeType:(id)a5 contentID:(id)a6;
- (void)replaceImagesIfNecessary;
- (void)retainFocusAfterPresenting;
- (void)richLinkDidFinishLoading:(id)a3;
- (void)richLinkDidStartLoading:(id)a3;
- (void)selectedAttachmentIdentifiersDidChange:(id)a3;
- (void)setAppleIntelligenceGroup:(id)a3;
- (void)setCaretPosition:(unint64_t)a3;
- (void)setComposeCoordinator:(id)a3;
- (void)setComposeWebViewDelegate:(id)a3;
- (void)setCompositionContextID:(id)a3;
- (void)setDirty:(BOOL)a3;
- (void)setDocumentItem:(id)a3;
- (void)setInputViewForPreservingFocus:(id)a3;
- (void)setInsertAttachmentGroup:(id)a3;
- (void)setIsQuickReply:(BOOL)a3;
- (void)setMailComposeViewDelegate:(id)a3;
- (void)setMarkupString:(id)a3;
- (void)setMarkupString:(id)a3 quote:(BOOL)a4;
- (void)setOriginalAttachmentInfo:(id)a3;
- (void)setPrefersFirstLineSelection;
- (void)setPreviousInputContextHistory:(id)a3;
- (void)setReplacementFilenamesByContentID:(id)a3;
- (void)setRichLinkActivityIndicators:(id)a3;
- (void)setTextFromCameraButtonItem:(id)a3;
- (void)set_leadingInputAssistantItemGroups:(id)a3;
- (void)set_trailingInputAssistantItemGroups:(id)a3;
- (void)showOriginalAttachments;
- (void)showRichLinkAccessoryButtonForExistingRichLink:(BOOL)a3 message:(id)a4;
- (void)stripCustomBodyIdentifiers;
- (void)updateInputAssistantItem;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
- (void)willBeginWritingToolsSession:(id)a3 requestContexts:(id)a4;
- (void)writingToolsSession:(id)a3 didReceiveAction:(int64_t)a4;
@end

@implementation MFComposeWebView

+ (void)setURLCacheBlock:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__MFComposeWebView_setURLCacheBlock___block_invoke;
  block[3] = &unk_1E5F7A240;
  id v7 = v3;
  uint64_t v4 = setURLCacheBlock__onceToken;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&setURLCacheBlock__onceToken, block);
  }
}

+ (NSArray)menuCommands
{
  v34[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)menuCommands_commands;
  if (!menuCommands_commands)
  {
    v33 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"a" modifierFlags:1179648 action:sel__importDocumentCommandInvoked_];
    if (bundle_onceToken != -1) {
      dispatch_once(&bundle_onceToken, &__block_literal_global_1139);
    }
    id v3 = (id)bundle_bundle;
    uint64_t v4 = [v3 localizedStringForKey:@"IMPORT_DOCUMENT" value:&stru_1F0817A00 table:@"Main"];
    [v33 setDiscoverabilityTitle:v4];

    v32 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"v" modifierFlags:1179648 action:sel__pasteAsQuotationKeyCommandInvoked_];
    if (bundle_onceToken != -1) {
      dispatch_once(&bundle_onceToken, &__block_literal_global_1139);
    }
    id v5 = (id)bundle_bundle;
    v6 = [v5 localizedStringForKey:@"PASTE_AS_QUOTATION" value:&stru_1F0817A00 table:@"Main"];
    [v32 setDiscoverabilityTitle:v6];

    v31 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"v" modifierFlags:1703936 action:sel__pasteAndMatchStyleKeyCommandInvoked_];
    id v7 = _EFLocalizedString();
    [v31 setDiscoverabilityTitle:v7];

    v30 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"'" modifierFlags:0x100000 action:sel__increaseQuoteLevelKeyCommandInvoked_];
    if (bundle_onceToken != -1) {
      dispatch_once(&bundle_onceToken, &__block_literal_global_1139);
    }
    id v8 = (id)bundle_bundle;
    v9 = [v8 localizedStringForKey:@"INCREASE_QUOTE_LEVEL" value:&stru_1F0817A00 table:@"Main"];
    [v30 setDiscoverabilityTitle:v9];

    v29 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"'" modifierFlags:1572864 action:sel__decreaseQuoteLevelKeyCommandInvoked_];
    if (bundle_onceToken != -1) {
      dispatch_once(&bundle_onceToken, &__block_literal_global_1139);
    }
    id v10 = (id)bundle_bundle;
    v11 = [v10 localizedStringForKey:@"DECREASE_QUOTE_LEVEL" value:&stru_1F0817A00 table:@"Main"];
    [v29 setDiscoverabilityTitle:v11];

    v28 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"k" modifierFlags:0x100000 action:sel__didTapAddLink_];
    v12 = _EFLocalizedString();
    [v28 setDiscoverabilityTitle:v12];

    v27 = [v33 _nonRepeatableKeyCommand];
    v26 = +[MFMailMenuCommand shortcutWithCommand:menu:](MFMailMenuCommand, "shortcutWithCommand:menu:");
    v34[0] = v26;
    v13 = [v32 _nonRepeatableKeyCommand];
    v14 = +[MFMailMenuCommand shortcutWithCommand:v13 menu:6];
    v34[1] = v14;
    v15 = [v31 _nonRepeatableKeyCommand];
    v16 = +[MFMailMenuCommand shortcutWithCommand:v15 menu:6];
    v34[2] = v16;
    v17 = [v28 _nonRepeatableKeyCommand];
    v18 = +[MFMailMenuCommand shortcutWithCommand:v17 menu:6];
    v34[3] = v18;
    v19 = [v30 _nonRepeatableKeyCommand];
    v20 = +[MFMailMenuCommand shortcutWithCommand:v19 menu:5];
    v34[4] = v20;
    v21 = [v29 _nonRepeatableKeyCommand];
    v22 = +[MFMailMenuCommand shortcutWithCommand:v21 menu:5];
    v34[5] = v22;
    uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:6];
    v24 = (void *)menuCommands_commands;
    menuCommands_commands = v23;

    v2 = (void *)menuCommands_commands;
  }

  return (NSArray *)v2;
}

void __37__MFComposeWebView_setURLCacheBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) copy];
  v2 = (void *)sURLCacheBlock;
  sURLCacheBlock = v1;
}

+ (id)_webViewConfiguration:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = [(id)objc_opt_class() _basicWebViewConfiguration];
  id v5 = [v4 userContentController];
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__3;
  v26 = __Block_byref_object_dispose__3;
  id v27 = 0;
  id v6 = objc_alloc(MEMORY[0x1E4F467C0]);
  if (v3) {
    MFUserStyleSheetCSS(2);
  }
  else {
  id v7 = MFUserStyleSheetCSS(1);
  }
  uint64_t v8 = [v6 initWithSource:v7 forMainFrameOnly:0];
  v9 = (void *)v23[5];
  v23[5] = v8;

  [v5 _addUserStyleSheet:v23[5]];
  id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v11 = [MEMORY[0x1E4F28F08] mainQueue];
  uint64_t v12 = *MEMORY[0x1E4FB2438];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __42__MFComposeWebView__webViewConfiguration___block_invoke;
  v19[3] = &unk_1E5F7A268;
  v21 = &v22;
  id v13 = v5;
  id v20 = v13;
  uint64_t v14 = [v10 addObserverForName:v12 object:0 queue:v11 usingBlock:v19];
  v15 = (void *)_webViewConfiguration__darkerSystemColorsStatusObserver;
  _webViewConfiguration__darkerSystemColorsStatusObserver = v14;

  v16 = v20;
  id v17 = v4;

  _Block_object_dispose(&v22, 8);

  return v17;
}

void __42__MFComposeWebView__webViewConfiguration___block_invoke(uint64_t a1)
{
  id v7 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v2 = objc_alloc(MEMORY[0x1E4F467C0]);
  BOOL v3 = MFUserStyleSheetCSS(1);
  uint64_t v4 = [v2 initWithSource:v3 forMainFrameOnly:0];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  [*(id *)(a1 + 32) _addUserStyleSheet:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  [*(id *)(a1 + 32) _removeUserStyleSheet:v7];
}

+ (id)_basicWebViewConfiguration
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F466F8]);
  [v3 setSelectionGranularity:1];
  [v3 _setAttachmentElementEnabled:1];
  [v3 _setColorFilterEnabled:1];
  [v3 _setAllowsJavaScriptMarkup:0];
  uint64_t v4 = [v3 preferences];
  [v4 _setAllowFileAccessFromFileURLs:1];

  uint64_t v5 = [v3 preferences];
  [v5 _setPunchOutWhiteBackgroundsInDarkMode:1];

  v43[0] = *MEMORY[0x1E4F60CD8];
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:1];
  [v3 _setAdditionalSupportedImageTypes:v6];

  if (_basicWebViewConfiguration_onceToken != -1) {
    dispatch_once(&_basicWebViewConfiguration_onceToken, &__block_literal_global_14);
  }
  [(id)sProxySchemeHandler setOnWebViewConfiguration:v3];
  id v35 = objc_alloc_init(MEMORY[0x1E4F46780]);
  id v7 = [MEMORY[0x1E4F28B50] bundleForClass:a1];
  uint64_t v8 = [v7 builtInPlugInsURL];
  v9 = [v8 URLByAppendingPathComponent:@"MessageUI.wkbundle"];
  [v35 setInjectedBundleURL:v9];

  v34 = (void *)[objc_alloc(MEMORY[0x1E4F46690]) _initWithConfiguration:v35];
  v40[0] = @"isPad";
  id v10 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(MEMORY[0x1E4FB16C8], "mf_isPad"));
  v42[0] = v10;
  v40[1] = @"defaultComposeFontPixelSize";
  v11 = NSNumber;
  objc_msgSend(MEMORY[0x1E4FB08E0], "mf_defaultComposeFontPixelSize");
  _UIAccessibilityLargeTextFontSize();
  uint64_t v12 = objc_msgSend(v11, "numberWithDouble:");
  v42[1] = v12;
  v40[2] = @"defaultComposeFontFamily";
  id v13 = objc_msgSend(MEMORY[0x1E4FB08E0], "mf_messageBodyFont");
  uint64_t v14 = [v13 familyName];
  v42[2] = v14;
  v40[3] = @"remoteContentProxySchemePrefix";
  v15 = [(id)sProxySchemeHandler schemePrefix];
  v42[3] = v15;
  uint64_t v41 = *MEMORY[0x1E4F60138];
  uint64_t v16 = v41;
  id v17 = NSNumber;
  v18 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  v19 = objc_msgSend(v17, "numberWithInteger:", objc_msgSend(v18, "integerForKey:", v41));
  v42[4] = v19;
  id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v40 count:5];
  [v34 _setObjectsForBundleParametersWithDictionary:v20];

  [v3 setProcessPool:v34];
  v21 = [v3 defaultWebpagePreferences];
  [v21 _setNetworkConnectionIntegrityPolicy:256];

  uint64_t v22 = [MEMORY[0x1E4F73E48] sharedHandler];
  [v3 setURLSchemeHandler:v22 forURLScheme:*MEMORY[0x1E4F77AF8]];

  if (objc_opt_respondsToSelector()) {
    [v3 _setMarkedTextInputEnabled:1];
  }
  uint64_t v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v24 = [MEMORY[0x1E4F28F08] mainQueue];
  uint64_t v25 = *MEMORY[0x1E4FB27A8];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __46__MFComposeWebView__basicWebViewConfiguration__block_invoke_79;
  v38[3] = &unk_1E5F7A290;
  id v26 = v34;
  id v39 = v26;
  uint64_t v27 = [v23 addObserverForName:v25 object:0 queue:v24 usingBlock:v38];
  v28 = (void *)_basicWebViewConfiguration_contentSizeCategoryObserver;
  _basicWebViewConfiguration_contentSizeCategoryObserver = v27;

  v29 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __46__MFComposeWebView__basicWebViewConfiguration__block_invoke_2;
  v36[3] = &unk_1E5F7A2B8;
  id v30 = v26;
  id v37 = v30;
  uint64_t v31 = objc_msgSend(v29, "ef_observeKeyPath:options:usingBlock:", v16, 1, v36);
  v32 = (void *)_basicWebViewConfiguration_blockRemoteContentObserver;
  _basicWebViewConfiguration_blockRemoteContentObserver = v31;

  return v3;
}

void __46__MFComposeWebView__basicWebViewConfiguration__block_invoke()
{
  if (!sURLCacheBlock
    || ((*(void (**)(void))(sURLCacheBlock + 16))(), (v0 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v1 = EMLogCompose();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      __46__MFComposeWebView__basicWebViewConfiguration__block_invoke_cold_1(v1);
    }

    v0 = 0;
  }
  id v2 = [MEMORY[0x1E4F74230] sharedConnection];
  uint64_t v3 = [v2 isMailPrivacyProtectionAllowed];

  id v4 = objc_alloc(MEMORY[0x1E4F60440]);
  uint64_t v5 = [v4 initWithCache:v0 sourceBundleIdentifier:*MEMORY[0x1E4F77E48]];
  id v6 = (void *)sURLSession;
  sURLSession = v5;

  id v7 = objc_alloc(MEMORY[0x1E4F60438]);
  uint64_t v8 = [v7 initWithSession:sURLSession schemePrefix:@"x-apple-mail-proxy-" allowProxying:v3];
  v9 = (void *)sProxySchemeHandler;
  sProxySchemeHandler = v8;
}

void __46__MFComposeWebView__basicWebViewConfiguration__block_invoke_79(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = NSNumber;
  objc_msgSend(MEMORY[0x1E4FB08E0], "mf_defaultComposeFontPixelSize");
  _UIAccessibilityLargeTextFontSize();
  objc_msgSend(v2, "numberWithDouble:");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_setObject:forBundleParameter:");
}

void __46__MFComposeWebView__basicWebViewConfiguration__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = NSNumber;
  id v5 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];
  id v4 = objc_msgSend(v3, "numberWithInteger:", objc_msgSend(v5, "integerValue"));
  [v2 _setObject:v4 forBundleParameter:*MEMORY[0x1E4F60138]];
}

- (MFComposeWebView)initWithFrame:(CGRect)a3
{
  return -[MFComposeWebView initWithFrame:isQuickReply:](self, "initWithFrame:isQuickReply:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (MFComposeWebView)initWithFrame:(CGRect)a3 isQuickReply:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = [(id)objc_opt_class() _webViewConfiguration:a4];
  v54.receiver = self;
  v54.super_class = (Class)MFComposeWebView;
  v11 = -[MFComposeWebView initWithFrame:configuration:](&v54, sel_initWithFrame_configuration_, v10, x, y, width, height);

  if (v11)
  {
    [(MFComposeWebView *)v11 _overrideViewportWithArguments:&unk_1F08419B8];
    uint64_t v12 = (void *)MEMORY[0x1E4F1CB10];
    id v13 = NSString;
    uint64_t v14 = [MEMORY[0x1E4F29128] UUID];
    v15 = [v14 UUIDString];
    uint64_t v16 = [v13 stringWithFormat:@"applewebdata://%@", v15];
    id v17 = [v12 URLWithString:v16];
    id v18 = (id)[(MFComposeWebView *)v11 loadHTMLString:@"<body dir=auto>" baseURL:v17];

    [(MFComposeWebView *)v11 setNavigationDelegate:v11];
    [(MFComposeWebView *)v11 _setInputDelegate:v11];
    [(MFComposeWebView *)v11 setUIDelegate:v11];
    [(MFComposeWebView *)v11 _setDragInteractionPolicy:1];
    [(MFComposeWebView *)v11 setFindInteractionEnabled:1];
    v19 = [(MFComposeWebView *)v11 _remoteObjectRegistry];
    uint64_t v20 = [MEMORY[0x1E4F46788] remoteObjectInterfaceWithProtocol:&unk_1F0880AE8];
    bodyFieldObserverInterface = v11->_bodyFieldObserverInterface;
    v11->_bodyFieldObserverInterface = (_WKRemoteObjectInterface *)v20;

    [v19 registerExportedObject:v11 interface:v11->_bodyFieldObserverInterface];
    uint64_t v22 = [MEMORY[0x1E4F46788] remoteObjectInterfaceWithProtocol:&unk_1F08D1168];
    richLinkGeneratorInterface = v11->_richLinkGeneratorInterface;
    v11->_richLinkGeneratorInterface = (_WKRemoteObjectInterface *)v22;

    uint64_t v24 = [MEMORY[0x1E4F73E78] linkGenerator];
    [v19 registerExportedObject:v24 interface:v11->_richLinkGeneratorInterface];

    uint64_t v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v25 addObserver:v11 selector:sel__menuDidHide_ name:*MEMORY[0x1E4FB2CB0] object:0];

    v11->_shouldShowStandardButtons = 1;
    uint64_t v26 = objc_opt_new();
    attachmentsByUniqueIdentifier = v11->_attachmentsByUniqueIdentifier;
    v11->_attachmentsByUniqueIdentifier = (NSMutableDictionary *)v26;

    uint64_t v28 = objc_opt_new();
    attachmentCIDsByIdentifier = v11->_attachmentCIDsByIdentifier;
    v11->_attachmentCIDsByIdentifier = (NSMutableDictionary *)v28;

    uint64_t v30 = objc_opt_new();
    originalAttachmentWrappers = v11->_originalAttachmentWrappers;
    v11->_originalAttachmentWrappers = (NSArray *)v30;

    v11->_originalAttachmentsWereRestored = 0;
    uint64_t v32 = objc_opt_new();
    richLinkActivityIndicators = v11->_richLinkActivityIndicators;
    v11->_richLinkActivityIndicators = (NSMutableDictionary *)v32;

    v11->_isQuickRepldouble y = v4;
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v11);
    v34 = (void *)MEMORY[0x1E4F60528];
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __47__MFComposeWebView_initWithFrame_isQuickReply___block_invoke;
    v51[3] = &unk_1E5F7A2E0;
    objc_copyWeak(&v52, &location);
    [v34 addScriptHandlerForWebView:v11 key:@"PlainTextLinkHighlighted" handler:v51];
    id v35 = (void *)MEMORY[0x1E4F60528];
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __47__MFComposeWebView_initWithFrame_isQuickReply___block_invoke_2;
    v49[3] = &unk_1E5F7A2E0;
    objc_copyWeak(&v50, &location);
    [v35 addScriptHandlerForWebView:v11 key:@"RichLinkHighlighted" handler:v49];
    v36 = (void *)MEMORY[0x1E4F60528];
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __47__MFComposeWebView_initWithFrame_isQuickReply___block_invoke_3;
    v47[3] = &unk_1E5F7A2E0;
    objc_copyWeak(&v48, &location);
    [v36 addScriptHandlerForWebView:v11 key:@"RichLinkPlaceholderInserted" handler:v47];
    id v37 = (void *)MEMORY[0x1E4F60528];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __47__MFComposeWebView_initWithFrame_isQuickReply___block_invoke_4;
    v45[3] = &unk_1E5F7A308;
    objc_copyWeak(&v46, &location);
    [v37 addScriptHandlerForWebView:v11 key:@"RichLinkLoaded" handler:v45];
    if ((_os_feature_enabled_impl() & v4) == 1)
    {
      v38 = (void *)MEMORY[0x1E4F60528];
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __47__MFComposeWebView_initWithFrame_isQuickReply___block_invoke_5;
      void v43[3] = &unk_1E5F7A330;
      objc_copyWeak(&v44, &location);
      [v38 addScriptHandlerForWebView:v11 key:@"DidChangeHeight" handler:v43];
      id v39 = (void *)MEMORY[0x1E4F60528];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __47__MFComposeWebView_initWithFrame_isQuickReply___block_invoke_6;
      v41[3] = &unk_1E5F7A330;
      objc_copyWeak(&v42, &location);
      [v39 addScriptHandlerForWebView:v11 key:@"MessageBodyIsEmpty" handler:v41];
      objc_destroyWeak(&v42);
      objc_destroyWeak(&v44);
    }
    objc_destroyWeak(&v46);
    objc_destroyWeak(&v48);
    objc_destroyWeak(&v50);
    objc_destroyWeak(&v52);
    objc_destroyWeak(&location);
  }
  return v11;
}

void __47__MFComposeWebView_initWithFrame_isQuickReply___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained showRichLinkAccessoryButtonForExistingRichLink:0 message:v3];
}

void __47__MFComposeWebView_initWithFrame_isQuickReply___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained showRichLinkAccessoryButtonForExistingRichLink:1 message:v3];
}

void __47__MFComposeWebView_initWithFrame_isQuickReply___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained richLinkDidStartLoading:v3];
}

void __47__MFComposeWebView_initWithFrame_isQuickReply___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained richLinkDidFinishLoading:v3];
}

void __47__MFComposeWebView_initWithFrame_isQuickReply___block_invoke_5(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [v4 doubleValue];
  objc_msgSend(WeakRetained, "_composeWebView:didChangeHeight:", WeakRetained);
}

void __47__MFComposeWebView_initWithFrame_isQuickReply___block_invoke_6(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_composeWebView:composeBodyIsEmpty:", WeakRetained, objc_msgSend(v4, "BOOLValue"));
}

- (BOOL)becomeFirstResponder
{
  v7.receiver = self;
  v7.super_class = (Class)MFComposeWebView;
  BOOL v3 = [(MFComposeWebView *)&v7 becomeFirstResponder];
  if (v3)
  {
    [(MFComposeWebView *)self updateInputAssistantItem];
    id v4 = [(MFComposeWebView *)self mailComposeViewDelegate];
    if (objc_opt_respondsToSelector()) {
      [v4 composeWebViewDidBecomeFirstResponder];
    }
    +[MessageUITipsManager setShouldDisplayTo:1];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_composeCoordinator);
    [WeakRetained setFocusedField:@"body"];
  }
  return v3;
}

- (BOOL)resignFirstResponder
{
  v6.receiver = self;
  v6.super_class = (Class)MFComposeWebView;
  BOOL v3 = [(MFComposeWebView *)&v6 resignFirstResponder];
  if (v3)
  {
    id v4 = [(MFComposeWebView *)self mailComposeViewDelegate];
    if (objc_opt_respondsToSelector()) {
      [v4 composeWebViewDidResignFirstResponder];
    }
    +[MessageUITipsManager setShouldDisplayTo:0];
  }
  return v3;
}

- (id)keyCommands
{
  char v2 = MFIsMobileMail();
  BOOL v3 = (void *)keyCommands_commands;
  if (!keyCommands_commands && (v2 & 1) == 0)
  {
    id v4 = +[MFComposeWebView menuCommands];
    uint64_t v5 = objc_msgSend(v4, "ef_compactMap:", &__block_literal_global_224);
    objc_super v6 = (void *)keyCommands_commands;
    keyCommands_commands = v5;

    BOOL v3 = (void *)keyCommands_commands;
  }

  return v3;
}

id __31__MFComposeWebView_keyCommands__block_invoke(uint64_t a1, void *a2)
{
  char v2 = [a2 command];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  [(MFComposeWebView *)self _canPerformCommandAction:a3 withSender:v6];
  if (sel_selectAll_ == a3)
  {
    if (![(MFComposeWebView *)self _contentViewIsFirstResponder])
    {
      unsigned __int8 selectionContainsLink = 0;
      goto LABEL_18;
    }
    v14.receiver = self;
    objc_super v7 = &v14;
    goto LABEL_8;
  }
  if (self->_shouldShowStandardButtons)
  {
    if (sel_makeRichLinkFromSelection == a3)
    {
      unsigned __int8 selectionContainsLink = self->_selectionContainsLink;
      goto LABEL_18;
    }
    if (sel_pasteRichLink == a3)
    {
      id v10 = [MEMORY[0x1E4FB1A78] generalPasteboard];
      v11 = [v10 URL];
      unsigned __int8 selectionContainsLink = objc_msgSend(v11, "ef_isHTTPOrHTTPSURL");

      goto LABEL_18;
    }
    id v13 = self;
    objc_super v7 = (objc_super *)&v13;
LABEL_8:
    v7->super_class = (Class)MFComposeWebView;
    unsigned __int8 selectionContainsLink = -[objc_super canPerformAction:withSender:](v7, sel_canPerformAction_withSender_, a3, v6, v13);
    goto LABEL_18;
  }
  unsigned __int8 selectionContainsLink = sel__increaseQuoteLevel_ == a3 || sel__decreaseQuoteLevel_ == a3;
LABEL_18:

  return selectionContainsLink;
}

- (BOOL)_canPerformCommandAction:(SEL)a3 withSender:(id)a4
{
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (sel__pasteAsQuotation_ == a3)
    {
      uint64_t v8 = [MEMORY[0x1E4FB1A78] generalPasteboard];
      v9 = [v8 items];
      char v7 = [v9 count] != 0;
    }
    else
    {
      id v6 = +[MFComposeWebView menuCommands];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __56__MFComposeWebView__canPerformCommandAction_withSender___block_invoke;
      v11[3] = &__block_descriptor_40_e27_B16__0__MFMailMenuCommand_8l;
      v11[4] = a3;
      char v7 = objc_msgSend(v6, "ef_any:", v11);
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

BOOL __56__MFComposeWebView__canPerformCommandAction_withSender___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 command];
  BOOL v4 = [v3 action] == *(void *)(a1 + 32);

  return v4;
}

- (id)_textInputTraits
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  v55.receiver = self;
  v55.super_class = (Class)MFComposeWebView;
  id v48 = [(MFComposeWebView *)&v55 _textInputTraits];
  v47 = [(MFComposeWebView *)self mailComposeViewDelegate];
  if (v47)
  {
    if (_os_feature_enabled_impl() && EMIsGreymatterAvailableWithOverride())
    {
      id v3 = [(MFComposeWebView *)self previousInputContextHistory];
      BOOL v45 = v3 == 0;

      if (v45)
      {
        BOOL v4 = [v47 inputContextHistory];
        [(MFComposeWebView *)self setPreviousInputContextHistory:v4];

        id v5 = EMLogCompose();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          id v6 = [(MFComposeWebView *)self previousInputContextHistory];
          char v7 = objc_msgSend(v6, "ef_publicDescription");
          *(_DWORD *)buf = 138543362;
          v58 = v7;
          _os_log_impl(&dword_1AF945000, v5, OS_LOG_TYPE_DEFAULT, "[SmartReply] Updated input context history: %{public}@", buf, 0xCu);
        }
      }
      id v46 = [(MFComposeWebView *)self previousInputContextHistory];
      id v8 = objc_alloc(MEMORY[0x1E4FB1848]);
      v9 = [v46 threadIdentifier];
      id v10 = [v46 recipientNamesByEmailAddress];
      v11 = [v46 firstPerson];
      uint64_t v12 = [v46 primaryRecipients];
      id v13 = [v46 secondaryRecipients];
      objc_super v14 = [v46 infoDict];
      id v50 = (void *)[v8 initWithThreadIdentifier:v9 participantsIDtoNames:v10 firstPerson:v11 primaryRecipients:v12 secondaryRecipients:v13 info:v14];

      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      obj = [v46 originalContentMessages];
      uint64_t v15 = [(__CFString *)obj countByEnumeratingWithState:&v51 objects:v56 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v52;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v52 != v16) {
              objc_enumerationMutation(obj);
            }
            id v18 = *(void **)(*((void *)&v51 + 1) + 8 * i);
            v19 = [v18 sender];
            uint64_t v20 = [v19 emailAddressValue];
            v21 = [v20 simpleAddress];

            id v22 = objc_alloc_init(MEMORY[0x1E4FAE3D0]);
            uint64_t v23 = [v18 bodyText];
            [v22 setText:v23];

            [v22 setSenderIdentifier:v21];
            uint64_t v24 = [v18 date];
            [v22 setTimestamp:v24];

            uint64_t v25 = [v18 searchableMessageID];
            uint64_t v26 = [v25 stringValue];
            [v22 setEntryIdentifier:v26];

            uint64_t v27 = (void *)MEMORY[0x1E4F1CAD0];
            uint64_t v28 = [v18 toList];
            v29 = objc_msgSend(v28, "ef_map:", &__block_literal_global_252);
            uint64_t v30 = [v27 setWithArray:v29];
            [v22 setPrimaryRecipientIdentifiers:v30];

            uint64_t v31 = (void *)MEMORY[0x1E4F1CAD0];
            uint64_t v32 = [v18 ccList];
            v33 = objc_msgSend(v32, "ef_map:", &__block_literal_global_254);
            v34 = [v31 setWithArray:v33];
            [v22 setSecondaryRecipientIdentifiers:v34];

            [v50 addEntry:v22];
          }
          uint64_t v15 = [(__CFString *)obj countByEnumeratingWithState:&v51 objects:v56 count:16];
        }
        while (v15);
      }
    }
    else
    {
      id v46 = [v47 allRecipientNamesAndAddresses];
      uint64_t v35 = [v47 sendingEmailAddressIfExists];
      v36 = (void *)v35;
      id v37 = &stru_1F0817A00;
      if (v35) {
        id v37 = (__CFString *)v35;
      }
      obj = v37;

      id v38 = objc_alloc(MEMORY[0x1E4FB1848]);
      id v39 = [v46 second];
      v40 = [MEMORY[0x1E4F1CAD0] setWithObject:obj];
      id v50 = (void *)[v38 initWithRecipientIdentifiers:v39 senderIdentifiers:v40];

      uint64_t v41 = [v46 first];
      [v50 updateRecipientNames:v41];

      BOOL v45 = 0;
    }

    id v42 = v50;
    [v48 setInputContextHistory:v50];
    if (v45)
    {
      v43 = [MEMORY[0x1E4FB18E0] activeKeyboard];
      [v43 responseContextDidChange];

      id v42 = v50;
    }
  }

  return v48;
}

id __36__MFComposeWebView__textInputTraits__block_invoke(uint64_t a1, void *a2)
{
  char v2 = [a2 emailAddressValue];
  id v3 = [v2 simpleAddress];

  return v3;
}

id __36__MFComposeWebView__textInputTraits__block_invoke_2(uint64_t a1, void *a2)
{
  char v2 = [a2 emailAddressValue];
  id v3 = [v2 simpleAddress];

  return v3;
}

- (void)_close
{
  id v3 = [(MFComposeWebView *)self _remoteObjectRegistry];
  [v3 unregisterExportedObject:self interface:self->_bodyFieldObserverInterface];

  BOOL v4 = [(MFComposeWebView *)self _remoteObjectRegistry];
  id v5 = [MEMORY[0x1E4F73E78] linkGenerator];
  [v4 unregisterExportedObject:v5 interface:self->_richLinkGeneratorInterface];

  v6.receiver = self;
  v6.super_class = (Class)MFComposeWebView;
  [(MFComposeWebView *)&v6 _close];
}

- (void)markupSelectedAttachment
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1AF945000, log, OS_LOG_TYPE_DEBUG, "Too few selected attachments to present Markup.", v1, 2u);
}

- (CGRect)_rectFromMessageDict:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_msgSend(v3, "ef_objectOfClass:forKey:", objc_opt_class(), @"x");
  [v4 floatValue];
  float v6 = v5;

  char v7 = objc_msgSend(v3, "ef_objectOfClass:forKey:", objc_opt_class(), @"y");
  [v7 floatValue];
  float v9 = v8;

  id v10 = objc_msgSend(v3, "ef_objectOfClass:forKey:", objc_opt_class(), @"width");
  [v10 floatValue];
  float v12 = v11;

  id v13 = objc_msgSend(v3, "ef_objectOfClass:forKey:", objc_opt_class(), @"height");
  [v13 floatValue];
  double v15 = v14;

  double v16 = v6;
  double v17 = v9;
  double v18 = v12;
  double v19 = v15;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (CGRect)_linkAccessoryButtonFrameForSourceRect:(CGRect)a3
{
  double height = a3.size.height;
  double y = a3.origin.y;
  double v6 = a3.origin.x + a3.size.width;
  double v7 = a3.origin.x + a3.size.width + 8.0;
  double v8 = a3.origin.y + -2.0;
  v17.size.double width = 34.0;
  v17.size.double height = 28.0;
  v17.origin.double x = v7;
  v17.origin.double y = a3.origin.y + -2.0;
  double MaxX = CGRectGetMaxX(v17);
  id v10 = [(MFComposeWebView *)self scrollView];
  [v10 frame];
  double v12 = v11;

  if (MaxX + 8.0 > v12)
  {
    double v7 = v6 + -34.0 + -8.0;
    double v8 = y + height + -28.0 + -2.0;
  }
  double v13 = 34.0;
  double v14 = 28.0;
  double v15 = v7;
  double v16 = v8;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (void)showRichLinkAccessoryButtonForExistingRichLink:(BOOL)a3 message:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  [(MFComposeWebView *)self _rectFromMessageDict:v6];
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;
  if (v4 || v9 > 0.0 && v10 > 0.0 && !CGRectEqualToRect(*(CGRect *)&v7, self->_richLinkSourceRect))
  {
    self->_richLinkSourceRect.origin.double x = v11;
    self->_richLinkSourceRect.origin.double y = v12;
    self->_richLinkSourceRect.size.double width = v13;
    self->_richLinkSourceRect.size.double height = v14;
    -[MFComposeWebView _linkAccessoryButtonFrameForSourceRect:](self, "_linkAccessoryButtonFrameForSourceRect:", v11, v12, v13, v14);
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    long long v53 = [v6 valueForKey:@"url"];
    uint64_t v23 = [v6 objectForKeyedSubscript:@"isAnchor"];
    int v24 = [v23 BOOLValue];

    uint64_t v25 = [(MFComposeWebView *)self makeLinkAccessoryButton];
    [v25 setTag:v4];
    objc_msgSend(v25, "setFrame:", v16, v18, v20, v22);
    if (v4) {
      [MEMORY[0x1E4F73E78] titleConvertToPlainLink];
    }
    else {
    uint64_t v26 = [MEMORY[0x1E4F73E78] titleConvertToRichLink];
    }
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __75__MFComposeWebView_showRichLinkAccessoryButtonForExistingRichLink_message___block_invoke;
    v63[3] = &unk_1E5F7A3B8;
    BOOL v64 = v4;
    v63[4] = self;
    long long v52 = (void *)v26;
    uint64_t v31 = [MEMORY[0x1E4FB13F0] actionWithTitle:v26 image:0 identifier:0 handler:v63];
    uint64_t v32 = [MEMORY[0x1E4F1CA48] arrayWithObject:v31];
    if (v53)
    {
      v33 = (void *)MEMORY[0x1E4FB13F0];
      v34 = [MEMORY[0x1E4F73E78] titleOpenLink];
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __75__MFComposeWebView_showRichLinkAccessoryButtonForExistingRichLink_message___block_invoke_2;
      v60[3] = &unk_1E5F7A3E0;
      id v35 = v53;
      id v61 = v35;
      v62 = self;
      v36 = [v33 actionWithTitle:v34 image:0 identifier:0 handler:v60];

      [v32 addObject:v36];
      if (_os_feature_enabled_impl() && !v4 && ((v24 ^ 1) & 1) == 0)
      {
        long long v51 = v36;
        id v37 = _EFLocalizedString();
        v58[0] = MEMORY[0x1E4F143A8];
        v58[1] = 3221225472;
        v58[2] = __75__MFComposeWebView_showRichLinkAccessoryButtonForExistingRichLink_message___block_invoke_3;
        v58[3] = &unk_1E5F79038;
        v58[4] = self;
        id v59 = v35;
        id v38 = -[MFComposeWebView _actionWithTitle:glyphName:handler:](self, v37, 0, v58);

        [v32 addObject:v38];
        id v39 = _EFLocalizedString();
        v57[0] = MEMORY[0x1E4F143A8];
        v57[1] = 3221225472;
        v57[2] = __75__MFComposeWebView_showRichLinkAccessoryButtonForExistingRichLink_message___block_invoke_4;
        v57[3] = &unk_1E5F79088;
        v57[4] = self;
        v40 = -[MFComposeWebView _actionWithTitle:glyphName:handler:](self, v39, 0, v57);

        [v32 addObject:v40];
        uint64_t v41 = [v6 valueForKey:@"description"];
        int v42 = [v41 isEqualToString:&stru_1F0817A00];
        if (v41) {
          int v43 = v42;
        }
        else {
          int v43 = 1;
        }
        if (v43 == 1)
        {
          id v44 = _EFLocalizedString();
          v56[0] = MEMORY[0x1E4F143A8];
          v56[1] = 3221225472;
          v56[2] = __75__MFComposeWebView_showRichLinkAccessoryButtonForExistingRichLink_message___block_invoke_5;
          v56[3] = &unk_1E5F79088;
          v56[4] = self;
          BOOL v45 = -[MFComposeWebView _actionWithTitle:glyphName:handler:](self, v44, 0, v56);

          [v32 addObject:v45];
        }
        else
        {
          id v46 = _EFLocalizedString();
          v54[0] = MEMORY[0x1E4F143A8];
          v54[1] = 3221225472;
          v54[2] = __75__MFComposeWebView_showRichLinkAccessoryButtonForExistingRichLink_message___block_invoke_6;
          v54[3] = &unk_1E5F79038;
          v54[4] = self;
          id v55 = v41;
          v47 = -[MFComposeWebView _actionWithTitle:glyphName:handler:](self, v46, 0, v54);

          [v32 addObject:v47];
          BOOL v45 = v55;
        }
        v36 = v51;
      }
    }
    id v48 = [MEMORY[0x1E4FB1970] menuWithChildren:v32];
    [v25 setMenu:v48];

    v49 = [(MFComposeWebView *)self scrollView];
    id v50 = [(MFComposeWebView *)self makeLinkAccessoryButton];
    [v49 addSubview:v50];

    [(MFComposeWebView *)self _showmakeLinkAccessoryButton];
  }
  else if (*MEMORY[0x1E4F1DB30] == v13 && *(double *)(MEMORY[0x1E4F1DB30] + 8) == v14)
  {
    p_richLinkSourceRect = &self->_richLinkSourceRect;
    v29 = (CGPoint *)MEMORY[0x1E4F1DB28];
    if (!CGRectEqualToRect(*MEMORY[0x1E4F1DB28], self->_richLinkSourceRect))
    {
      v66.origin.double x = p_richLinkSourceRect->origin.x;
      v66.origin.double y = self->_richLinkSourceRect.origin.y;
      v66.size.double width = self->_richLinkSourceRect.size.width;
      v66.size.double height = self->_richLinkSourceRect.size.height;
      CGRect v67 = CGRectInset(v66, -22.0, -10.0);
      CGRect v68 = CGRectOffset(v67, 14.0, 0.0);
      v65.double x = v11;
      v65.double y = v12;
      if (!CGRectContainsPoint(v68, v65))
      {
        CGSize v30 = (CGSize)v29[1];
        p_richLinkSourceRect->origin = *v29;
        self->_richLinkSourceRect.size = v30;
        [(MFComposeWebView *)self hideMakeLinkAccessoryButton];
      }
    }
  }
}

uint64_t __75__MFComposeWebView_showRichLinkAccessoryButtonForExistingRichLink_message___block_invoke(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 40);
  char v2 = *(void **)(a1 + 32);
  if (v1) {
    return [v2 removeRichLinkFromSelection];
  }
  else {
    return [v2 makeRichLinkFromSelection];
  }
}

void __75__MFComposeWebView_showRichLinkAccessoryButtonForExistingRichLink_message___block_invoke_2(uint64_t a1)
{
  char v2 = [MEMORY[0x1E4F1CB10] URLWithString:*(void *)(a1 + 32)];
  objc_msgSend(v2, "ef_urlByAddingSchemeIfNeeded");
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  id v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v3 openURL:v4 options:MEMORY[0x1E4F1CC08] completionHandler:0];

  [*(id *)(a1 + 40) hideMakeLinkAccessoryButton];
}

uint64_t __75__MFComposeWebView_showRichLinkAccessoryButtonForExistingRichLink_message___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didTapEditLink:*(void *)(a1 + 40)];
}

- (id)_actionWithTitle:(void *)a3 glyphName:(void *)a4 handler:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    a1 = -[MFComposeWebView _actionWithTitle:glyphName:usePrivateCatalog:handler:](a1, v7, v8, 0, v9);
  }

  return a1;
}

uint64_t __75__MFComposeWebView_showRichLinkAccessoryButtonForExistingRichLink_message___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didTapRemoveLink];
}

uint64_t __75__MFComposeWebView_showRichLinkAccessoryButtonForExistingRichLink_message___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didTapEditTextDescription:0];
}

uint64_t __75__MFComposeWebView_showRichLinkAccessoryButtonForExistingRichLink_message___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didTapEditTextDescription:*(void *)(a1 + 40)];
}

- (void)richLinkDidStartLoading:(id)a3
{
  id v29 = a3;
  -[MFComposeWebView _rectFromMessageDict:](self, "_rectFromMessageDict:");
  double x = v31.origin.x;
  double y = v31.origin.y;
  double width = v31.size.width;
  double height = v31.size.height;
  p_richLinkSourceRect = &self->_richLinkSourceRect;
  if (CGRectIntersectsRect(v31, self->_richLinkSourceRect))
  {
    double x = p_richLinkSourceRect->origin.x;
    double y = self->_richLinkSourceRect.origin.y;
    double width = self->_richLinkSourceRect.size.width;
    double height = self->_richLinkSourceRect.size.height;
    CGSize v9 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    p_richLinkSourceRect->origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    self->_richLinkSourceRect.size = v9;
  }
  double v10 = objc_msgSend(v29, "ef_objectOfClass:forKey:", objc_opt_class(), @"linkID");
  if (v10)
  {
    if (width != *MEMORY[0x1E4F1DB30] || height != *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      double v12 = [(MFComposeWebView *)self richLinkActivityIndicators];
      double v13 = [v12 objectForKeyedSubscript:v10];

      if (!v13)
      {
        -[MFComposeWebView _linkAccessoryButtonFrameForSourceRect:](self, "_linkAccessoryButtonFrameForSourceRect:", x, y, width, height);
        double v15 = v14;
        double v17 = v16;
        [(MFComposeWebView *)self hideMakeLinkAccessoryButton];
        double v18 = -[MFComposeWebView _makeRichLinkTemplateButtonWithOrigin:](self, "_makeRichLinkTemplateButtonWithOrigin:", v15, v17);
        id v19 = objc_alloc(MEMORY[0x1E4FB1400]);
        double v20 = objc_msgSend(v19, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        [v20 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v20 setActivityIndicatorViewStyle:3];
        [v20 startAnimating];
        [v18 addSubview:v20];
        double v21 = [v18 centerXAnchor];
        double v22 = [v20 centerXAnchor];
        uint64_t v23 = [v21 constraintEqualToAnchor:v22];
        [v18 addConstraint:v23];

        int v24 = [v18 centerYAnchor];
        uint64_t v25 = [v20 centerYAnchor];
        uint64_t v26 = [v24 constraintEqualToAnchor:v25];
        [v18 addConstraint:v26];

        uint64_t v27 = [(MFComposeWebView *)self scrollView];
        [v27 addSubview:v18];

        uint64_t v28 = [(MFComposeWebView *)self richLinkActivityIndicators];
        [v28 setObject:v20 forKeyedSubscript:v10];
      }
    }
  }
}

- (void)richLinkDidFinishLoading:(id)a3
{
  id v8 = a3;
  if (v8)
  {
    id v4 = [(MFComposeWebView *)self richLinkActivityIndicators];
    float v5 = [v4 objectForKeyedSubscript:v8];

    id v6 = [v5 superview];
    [v6 removeFromSuperview];

    [v5 removeFromSuperview];
    id v7 = [(MFComposeWebView *)self richLinkActivityIndicators];
    [v7 removeObjectForKey:v8];
  }
}

- (id)makeLinkAccessoryButton
{
  makeLinkAccessoryButton = self->_makeLinkAccessoryButton;
  if (!makeLinkAccessoryButton)
  {
    -[MFComposeWebView _makeRichLinkTemplateButtonWithOrigin:](self, "_makeRichLinkTemplateButtonWithOrigin:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    id v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    float v5 = self->_makeLinkAccessoryButton;
    self->_makeLinkAccessoryButton = v4;

    id v6 = self->_makeLinkAccessoryButton;
    id v7 = objc_msgSend(MEMORY[0x1E4FB1818], "mf_systemImageNamed:forView:", @"chevron.down", 22);
    [(UIButton *)v6 setImage:v7 forState:0];

    [(UIButton *)self->_makeLinkAccessoryButton setHidden:1];
    [(UIButton *)self->_makeLinkAccessoryButton setAlpha:0.0];
    [(UIButton *)self->_makeLinkAccessoryButton setContextMenuInteractionEnabled:1];
    [(UIButton *)self->_makeLinkAccessoryButton setShowsMenuAsPrimaryAction:1];
    id v8 = [(MFComposeWebView *)self scrollView];
    [v8 addSubview:self->_makeLinkAccessoryButton];

    makeLinkAccessoryButton = self->_makeLinkAccessoryButton;
  }

  return makeLinkAccessoryButton;
}

- (id)_makeRichLinkTemplateButtonWithOrigin:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  float v5 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
  objc_msgSend(v5, "setFrame:", x, y, 34.0, 28.0);
  id v6 = [MEMORY[0x1E4FB1618] whiteColor];
  [v5 setTintColor:v6];

  id v7 = [MEMORY[0x1E4FB1618] systemGray2Color];
  [v5 setBackgroundColor:v7];

  id v8 = [v5 layer];
  [v8 setCornerRadius:9.0];

  return v5;
}

- (void)_showmakeLinkAccessoryButton
{
  char v2 = [(MFComposeWebView *)self makeLinkAccessoryButton];
  [v2 setHidden:0];
  id v3 = (void *)MEMORY[0x1E4FB1EB0];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__MFComposeWebView__showmakeLinkAccessoryButton__block_invoke;
  v5[3] = &unk_1E5F79088;
  id v4 = v2;
  id v6 = v4;
  [v3 animateWithDuration:v5 animations:&__block_literal_global_307 completion:0.1];
}

uint64_t __48__MFComposeWebView__showmakeLinkAccessoryButton__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (void)hideMakeLinkAccessoryButton
{
  makeLinkAccessoryButton = self->_makeLinkAccessoryButton;
  if (makeLinkAccessoryButton)
  {
    if (([(UIButton *)makeLinkAccessoryButton isHidden] & 1) == 0)
    {
      id v4 = [(MFComposeWebView *)self makeLinkAccessoryButton];
      float v5 = (void *)MEMORY[0x1E4FB1EB0];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __47__MFComposeWebView_hideMakeLinkAccessoryButton__block_invoke;
      v9[3] = &unk_1E5F79088;
      id v10 = v4;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __47__MFComposeWebView_hideMakeLinkAccessoryButton__block_invoke_2;
      v7[3] = &unk_1E5F7A210;
      id v8 = v10;
      id v6 = v10;
      [v5 animateWithDuration:v9 animations:v7 completion:0.1];
    }
  }
}

uint64_t __47__MFComposeWebView_hideMakeLinkAccessoryButton__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __47__MFComposeWebView_hideMakeLinkAccessoryButton__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setHidden:1];
}

- (void)insertRichLinkWithURL:(id)a3 completionHandler:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(MFComposeWebView *)self _bodyFieldProxy];
  [v7 insertRichLinkWithURL:v8 completionHandler:v6];
}

- (void)makeRichLinkFromSelection
{
  id v2 = [(MFComposeWebView *)self _bodyFieldProxy];
  [v2 makeRichLinkFromSelection];
}

- (void)removeRichLinkFromSelection
{
  id v3 = [(MFComposeWebView *)self _bodyFieldProxy];
  [v3 removeRichLinkFromSelection];

  [(MFComposeWebView *)self hideMakeLinkAccessoryButton];
}

- (void)pasteRichLink
{
  id v3 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  id v5 = [v3 URL];

  if (objc_msgSend(v5, "ef_isHTTPOrHTTPSURL"))
  {
    id v4 = [(MFComposeWebView *)self _bodyFieldProxy];
    [v4 insertRichLinkWithURL:v5 completionHandler:&__block_literal_global_309];
  }
}

- (void)enableQuickReply:(BOOL)a3
{
  if (self->_isQuickReply != a3)
  {
    BOOL v3 = a3;
    self->_isQuickRepldouble y = a3;
    id v4 = [(MFComposeWebView *)self _bodyFieldProxy];
    [v4 enableQuickReply:v3];
  }
}

- (void)invalidateInputContextHistory
{
  [(MFComposeWebView *)self setPreviousInputContextHistory:0];
  id v2 = [MEMORY[0x1E4FB18E0] activeKeyboard];
  [v2 responseContextDidChange];
}

- (MFMailSignatureController)signatureControllerProxy
{
  signatureControllerProxdouble y = self->_signatureControllerProxy;
  if (!signatureControllerProxy)
  {
    id v4 = [(MFComposeWebView *)self _remoteObjectRegistry];
    id v5 = [MEMORY[0x1E4F46788] remoteObjectInterfaceWithProtocol:&unk_1F08D11C8];
    id v6 = [v4 remoteObjectProxyWithInterface:v5];
    id v7 = self->_signatureControllerProxy;
    self->_signatureControllerProxdouble y = v6;

    signatureControllerProxdouble y = self->_signatureControllerProxy;
  }

  return signatureControllerProxy;
}

- (id)_bodyFieldProxy
{
  bodyFieldProxdouble y = self->_bodyFieldProxy;
  if (!bodyFieldProxy)
  {
    id v4 = [MEMORY[0x1E4F46788] remoteObjectInterfaceWithProtocol:&unk_1F08D1228];
    id v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    id v8 = objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0);
    [v4 setClasses:v8 forSelector:sel_htmlStringsAttachmentURLsAndPlainTextAlternativeRemovingSignature_attachmentInfoByIdentifier_completion_ argumentIndex:1 ofReply:1];

    CGSize v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    double v13 = objc_msgSend(v9, "setWithObjects:", v10, v11, v12, objc_opt_class(), 0);
    [v4 setClasses:v13 forSelector:sel_plainTextContentUsingAttachmentInfoByIdentifier_completionHandler_ argumentIndex:0 ofReply:1];

    double v14 = [(MFComposeWebView *)self _remoteObjectRegistry];
    double v15 = [v14 remoteObjectProxyWithInterface:v4];
    double v16 = self->_bodyFieldProxy;
    self->_bodyFieldProxdouble y = v15;

    bodyFieldProxdouble y = self->_bodyFieldProxy;
  }

  return bodyFieldProxy;
}

- (MFMailComposeViewDelegate)mailComposeViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);

  return (MFMailComposeViewDelegate *)WeakRetained;
}

- (void)setMailComposeViewDelegate:(id)a3
{
}

- (void)setCompositionContextID:(id)a3
{
}

- (NSString)compositionContextID
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained compositionContext];
    uint64_t v6 = [v5 contextID];
  }
  else
  {
    uint64_t v6 = self->_compositionContextID;
  }

  return v6;
}

- (void)setMarkupString:(id)a3
{
}

- (id)_attachmentInfoByURL
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  BOOL v3 = [WeakRetained compositionContext];
  id v19 = [v3 attachments];

  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v19, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v19;
  uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        CGSize v9 = objc_msgSend(v8, "contentID", v19);
        uint64_t v10 = (void *)MFCreateURLForContentID();

        uint64_t v11 = [MFComposeAttachmentInfo alloc];
        uint64_t v12 = [v8 fileName];
        uint64_t v13 = [v8 isBasicImage];
        uint64_t v14 = [v8 isDisplayableImage];
        double v15 = [v8 className];
        double v16 = [(MFComposeAttachmentInfo *)v11 initWithURL:v10 filename:v12 isBasicImage:v13 isDisplayableImage:v14 className:v15];
        double v17 = [v10 absoluteString];
        [v4 setObject:v16 forKeyedSubscript:v17];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v5);
  }

  return v4;
}

- (void)appendOrReplace:(id)a3 withMarkupString:(id)a4 quote:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = [(MFComposeWebView *)self _bodyFieldProxy];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  uint64_t v15 = [WeakRetained compositionType];
  double v16 = [(MFComposeWebView *)self _attachmentInfoByURL];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __70__MFComposeWebView_appendOrReplace_withMarkupString_quote_completion___block_invoke;
  v18[3] = &unk_1E5F7A428;
  v18[4] = self;
  id v17 = v12;
  id v19 = v17;
  [v13 appendOrReplace:v10 withMarkupString:v11 quote:v7 composeType:v15 attachmentInfoByURL:v16 completionHandler:v18];
}

void __70__MFComposeWebView_appendOrReplace_withMarkupString_quote_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = EMLogCompose();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [v3 allKeys];
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_1AF945000, v4, OS_LOG_TYPE_DEFAULT, "Appending or replacing attachments %{public}@", (uint8_t *)&v7, 0xCu);
  }
  [*(id *)(*(void *)(a1 + 32) + 1896) addEntriesFromDictionary:v3];
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(void))(v6 + 16))();
  }
}

- (id)_attachmentInfoByIdentifier
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSMutableDictionary count](self->_attachmentsByUniqueIdentifier, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = self->_attachmentsByUniqueIdentifier;
  uint64_t v2 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v2)
  {
    uint64_t v17 = *(void *)v22;
    do
    {
      uint64_t v20 = v2;
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v5 = [(NSMutableDictionary *)self->_attachmentsByUniqueIdentifier objectForKeyedSubscript:v4];
        uint64_t v6 = [MFComposeAttachmentInfo alloc];
        int v7 = [v5 contentID];
        id v8 = (void *)MFCreateURLForContentID();
        uint64_t v9 = [v5 fileName];
        uint64_t v10 = [v5 isBasicImage];
        uint64_t v11 = [v5 isDisplayableImage];
        id v12 = [v5 className];
        uint64_t v13 = [(MFComposeAttachmentInfo *)v6 initWithURL:v8 filename:v9 isBasicImage:v10 isDisplayableImage:v11 className:v12];
        [v19 setObject:v13 forKeyedSubscript:v4];
      }
      uint64_t v2 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v2);
  }

  uint64_t v14 = (void *)[v19 copy];

  return v14;
}

- (id)plainTextContent
{
  id v3 = [MEMORY[0x1E4F60E18] promise];
  uint64_t v4 = [(MFComposeWebView *)self _bodyFieldProxy];
  uint64_t v5 = [(MFComposeWebView *)self _attachmentInfoByIdentifier];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __36__MFComposeWebView_plainTextContent__block_invoke;
  v9[3] = &unk_1E5F7A450;
  id v6 = v3;
  id v10 = v6;
  [v4 plainTextContentUsingAttachmentInfoByIdentifier:v5 completionHandler:v9];

  int v7 = [v6 future];

  return v7;
}

void __36__MFComposeWebView_plainTextContent__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v21 = a2;
  uint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v21, "count"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v3 = v21;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v24;
    uint64_t v22 = *MEMORY[0x1E4F77AF8];
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v24 != v5) {
          objc_enumerationMutation(v3);
        }
        int v7 = *(void **)(*((void *)&v23 + 1) + 8 * v6);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          plainTextDocumentFromStringsAndQuoteLevels(v7, 0);
          id v8 = (id)objc_claimAutoreleasedReturnValue();
          [v2 addObject:v8];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_16;
          }
          id v8 = v7;
          if ([v8 isFileURL])
          {
            uint64_t v9 = (void *)MEMORY[0x1E4F1CB10];
            id v10 = NSString;
            uint64_t v11 = [v8 resourceSpecifier];
            id v12 = [v10 stringWithFormat:@"%@:%@", v22, v11];
            uint64_t v13 = [v9 URLWithString:v12];

            id v8 = (id)v13;
LABEL_12:
            double v16 = [MEMORY[0x1E4F77B78] defaultManager];
            uint64_t v17 = [v16 attachmentForCID:v8];

            if (v17) {
              [v2 addObject:v17];
            }

            goto LABEL_15;
          }
          uint64_t v14 = [v8 scheme];
          char v15 = [v14 isEqualToString:v22];

          if (v15) {
            goto LABEL_12;
          }
        }
LABEL_15:

LABEL_16:
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v4);
  }

  double v18 = *(void **)(a1 + 32);
  id v19 = (void *)[v2 copy];
  [v18 finishWithResult:v19];
}

- (void)setCaretPosition:(unint64_t)a3
{
  id v4 = [(MFComposeWebView *)self _bodyFieldProxy];
  [v4 setCaretPosition:a3];
}

- (id)getCaretPosition
{
  id v3 = [MEMORY[0x1E4F60E18] promise];
  id v4 = [(MFComposeWebView *)self _bodyFieldProxy];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __36__MFComposeWebView_getCaretPosition__block_invoke;
  v8[3] = &unk_1E5F7A478;
  id v5 = v3;
  id v9 = v5;
  [v4 getCaretPosition:v8];

  uint64_t v6 = [v5 future];

  return v6;
}

uint64_t __36__MFComposeWebView_getCaretPosition__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithResult:a2];
}

- (_NSRange)selectedRange
{
  NSUInteger v2 = 0;
  NSUInteger v3 = 0;
  result.length = v3;
  result.id location = v2;
  return result;
}

- (void)insertDocumentWithURL:(id)a3 isDrawingFile:(BOOL)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__MFComposeWebView_insertDocumentWithURL_isDrawingFile___block_invoke;
  v4[3] = &unk_1E5F7A4C8;
  v4[4] = self;
  [(MFComposeWebView *)self prepareDataForDocumentAtURLForInsertion:a3 completion:v4];
}

void __56__MFComposeWebView_insertDocumentWithURL_isDrawingFile___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56__MFComposeWebView_insertDocumentWithURL_isDrawingFile___block_invoke_2;
  v14[3] = &unk_1E5F7A4A0;
  uint64_t v15 = *(void *)(a1 + 32);
  id v10 = v7;
  id v16 = v10;
  id v11 = v8;
  id v17 = v11;
  id v12 = v9;
  id v18 = v12;
  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F60F28], "mainThreadScheduler", v14[0], 3221225472, __56__MFComposeWebView_insertDocumentWithURL_isDrawingFile___block_invoke_2, &unk_1E5F7A4A0, v15);
  [v13 performSyncBlock:v14];
}

uint64_t __56__MFComposeWebView_insertDocumentWithURL_isDrawingFile___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) insertDocumentWithData:*(void *)(a1 + 40) fileName:*(void *)(a1 + 48) mimeType:*(void *)(a1 + 56) contentID:0];
}

- (void)prepareDataForDocumentAtURLForInsertion:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *, void *, void *))a4;
  id v8 = [v6 lastPathComponent];
  id v9 = [(MFComposeWebView *)self mimeTypeForFilename:v8];
  int v10 = [v6 startAccessingSecurityScopedResource];
  id v14 = 0;
  id v11 = [MEMORY[0x1E4F734C0] dataWithContentsOfURL:v6 options:1 error:&v14];
  id v12 = v14;
  if (v10) {
    [v6 stopAccessingSecurityScopedResource];
  }
  if (!v11 || !v8 || !v9)
  {
    uint64_t v13 = EMLogCompose();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413314;
      id v16 = v6;
      __int16 v17 = 2112;
      id v18 = v11;
      __int16 v19 = 2112;
      uint64_t v20 = v8;
      __int16 v21 = 2112;
      uint64_t v22 = v9;
      __int16 v23 = 2112;
      id v24 = v12;
      _os_log_error_impl(&dword_1AF945000, v13, OS_LOG_TYPE_ERROR, "Error while preparing data for the document at url: %@\ndata: %@\nfileName: %@\nmimeType: %@\n%@", buf, 0x34u);
    }
  }
  if (v7) {
    v7[2](v7, v11, v8, v9);
  }
}

- (id)mimeTypeForFilename:(id)a3
{
  NSUInteger v3 = [MEMORY[0x1E4F77B98] mimeTypeForFileName:a3];
  if (![(__CFString *)v3 length])
  {

    NSUInteger v3 = @"application/octet-stream";
  }

  return v3;
}

- (void)setOriginalAttachmentInfo:(id)a3
{
  id v5 = a3;
  if ([v5 count]) {
    objc_storeStrong((id *)&self->_originalAttachmentWrappers, a3);
  }
}

- (void)showOriginalAttachments
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (!self->_originalAttachmentsWereRestored)
  {
    NSUInteger v2 = self;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id obj = self->_originalAttachmentWrappers;
    uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v3)
    {
      uint64_t v16 = *(void *)v25;
      id v18 = v2;
      do
      {
        uint64_t v17 = v3;
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v25 != v16) {
            objc_enumerationMutation(obj);
          }
          id v5 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          id v6 = [v5 contentID];
          id v7 = [v5 preferredFilename];
          id v8 = [v5 mimeType];
          id v9 = [v5 regularFileContents];
          int v10 = [(MFComposeWebView *)v18 _bodyFieldProxy];
          v19[0] = MEMORY[0x1E4F143A8];
          v19[1] = 3221225472;
          v19[2] = __43__MFComposeWebView_showOriginalAttachments__block_invoke;
          v19[3] = &unk_1E5F7A4F0;
          void v19[4] = v18;
          id v11 = v9;
          id v20 = v11;
          id v12 = v7;
          id v21 = v12;
          id v13 = v8;
          id v22 = v13;
          id v14 = v6;
          id v23 = v14;
          [v10 countDuplicatedAttachments:v12 completionHandler:v19];

          NSUInteger v2 = v18;
        }
        uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v3);
    }

    v2->_originalAttachmentsWereRestored = 1;
  }
}

void __43__MFComposeWebView_showOriginalAttachments__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  for (int i = 0; i < (int)[v4 intValue]; ++i)
    [*(id *)(a1 + 32) replaceFilenamePlaceholderWithAttachment:*(void *)(a1 + 40) fileName:*(void *)(a1 + 48) mimeType:*(void *)(a1 + 56) contentID:*(void *)(a1 + 64)];
}

- (void)insertDocumentWithData:(id)a3 fileName:(id)a4 mimeType:(id)a5 contentID:(id)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = EMLogCompose();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v13;
    _os_log_impl(&dword_1AF945000, v14, OS_LOG_TYPE_DEFAULT, "Inserting document data with content ID %{public}@", buf, 0xCu);
  }

  if (v10
    && v11
    && ([(MFComposeWebView *)self _addInlineAttachmentWithData:v10 fileName:v11 type:v12 contentID:v13], v15 = objc_claimAutoreleasedReturnValue(), (uint64_t v16 = v15) != 0))
  {
    uint64_t v17 = [v15 className];
    unsigned int v22 = [v17 isEqualToString:0x1F0817B60];

    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    id v18 = [(MFComposeWebView *)self _bodyFieldProxy];
    uint64_t v19 = [v16 isSinglePagePDFFile];
    id v20 = [v16 fileUTType];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __71__MFComposeWebView_insertDocumentWithData_fileName_mimeType_contentID___block_invoke;
    v23[3] = &unk_1E5F7A518;
    objc_copyWeak(&v25, (id *)buf);
    id v21 = v16;
    long long v24 = v21;
    [v18 insertAttachmentAsImage:v22 isSinglePagePDF:v19 contentType:v20 completionHandler:v23];

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v21 = EMLogCompose();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[MFComposeWebView insertDocumentWithData:fileName:mimeType:contentID:]();
    }
  }
}

void __71__MFComposeWebView_insertDocumentWithData_fileName_mimeType_contentID___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = [*(id *)(a1 + 32) contentID];
    [WeakRetained[237] setObject:v4 forKeyedSubscript:v6];

    [WeakRetained composeBodyFieldDidChange];
    id v5 = [WeakRetained mailComposeViewDelegate];
    [v5 didInsertAttachment:*(void *)(a1 + 32)];
  }
}

- (void)insertPhotoOrVideoWithAssetIdentifier:(id)a3 infoDictionary:(id)a4 completion:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4FB2A20]];
  id v11 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4FB31F0]];
  id v12 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4FB2A18]];
  id v13 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4FB3230]];
  BOOL v14 = v10 != 0;
  BOOL v15 = v11 == 0;
  if (v14 && v15) {
    uint64_t v16 = v10;
  }
  else {
    uint64_t v16 = v11;
  }
  [(MFComposeWebView *)self _insertMediaWithAssetIdentifier:v17 mediaURL:v16 mediaType:v12 mediaData:v13 isVideo:v14 & v15 completion:v9];
}

- (void)insertMediaWithPhotoPickerItem:(id)a3 completion:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = [v12 contentIdentifier];
  id v8 = [v12 assetURL];
  id v9 = [v12 contentType];
  id v10 = [v9 identifier];
  id v11 = [v12 assetData];
  -[MFComposeWebView _insertMediaWithAssetIdentifier:mediaURL:mediaType:mediaData:isVideo:completion:](self, "_insertMediaWithAssetIdentifier:mediaURL:mediaType:mediaData:isVideo:completion:", v7, v8, v10, v11, [v12 isVideo], v6);
}

- (void)_insertMediaWithAssetIdentifier:(id)a3 mediaURL:(id)a4 mediaType:(id)a5 mediaData:(id)a6 isVideo:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  if (v9)
  {
    id v29 = v17;
    uint64_t v19 = [(MFComposeWebView *)self _filenameForVideoAttachmentAtURL:v15];
    if (v16)
    {
      id v20 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v16];
    }
    else
    {
      id v20 = 0;
    }
    id v25 = [v20 preferredMIMEType];
    long long v26 = [MEMORY[0x1E4F60F28] globalAsyncSchedulerWithQualityOfService:25];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __100__MFComposeWebView__insertMediaWithAssetIdentifier_mediaURL_mediaType_mediaData_isVideo_completion___block_invoke;
    v42[3] = &unk_1E5F7A540;
    v42[4] = self;
    id v43 = v15;
    id v27 = v25;
    id v44 = v27;
    id v28 = v19;
    id v45 = v28;
    id v46 = v14;
    id v47 = v18;
    [v26 performBlock:v42];

    id v17 = v29;
  }
  else
  {
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x3032000000;
    v40[3] = __Block_byref_object_copy__3;
    void v40[4] = __Block_byref_object_dispose__3;
    id v41 = (id)0xAAAAAAAAAAAAAAAALL;
    id v21 = v17;
    id v41 = v21;
    if (!v15 || v21)
    {
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __100__MFComposeWebView__insertMediaWithAssetIdentifier_mediaURL_mediaType_mediaData_isVideo_completion___block_invoke_5;
      v30[3] = &unk_1E5F7A568;
      v30[4] = self;
      v33 = v40;
      id v31 = v14;
      id v32 = v18;
      long long v24 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
      [v24 performSyncBlock:v30];

      id v23 = v31;
    }
    else
    {
      unsigned int v22 = [MEMORY[0x1E4F60F28] globalAsyncSchedulerWithQualityOfService:25];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __100__MFComposeWebView__insertMediaWithAssetIdentifier_mediaURL_mediaType_mediaData_isVideo_completion___block_invoke_3;
      v34[3] = &unk_1E5F7A590;
      id v39 = v40;
      id v35 = v15;
      v36 = self;
      id v37 = v14;
      id v38 = v18;
      [v22 performBlock:v34];

      id v23 = v35;
    }

    _Block_object_dispose(v40, 8);
  }
}

void __100__MFComposeWebView__insertMediaWithAssetIdentifier_mediaURL_mediaType_mediaData_isVideo_completion___block_invoke(uint64_t a1)
{
  NSUInteger v2 = [*(id *)(a1 + 32) _makeAttachmentDataWithFileURL:*(void *)(a1 + 40) type:*(void *)(a1 + 48)];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __100__MFComposeWebView__insertMediaWithAssetIdentifier_mediaURL_mediaType_mediaData_isVideo_completion___block_invoke_2;
  v5[3] = &unk_1E5F7A540;
  uint64_t v6 = *(void *)(a1 + 32);
  id v3 = v2;
  id v7 = v3;
  id v8 = *(id *)(a1 + 56);
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 64);
  id v11 = *(id *)(a1 + 72);
  id v4 = objc_msgSend(MEMORY[0x1E4F60F28], "mainThreadScheduler", v5[0], 3221225472, __100__MFComposeWebView__insertMediaWithAssetIdentifier_mediaURL_mediaType_mediaData_isVideo_completion___block_invoke_2, &unk_1E5F7A540, v6);
  [v4 performSyncBlock:v5];
}

uint64_t __100__MFComposeWebView__insertMediaWithAssetIdentifier_mediaURL_mediaType_mediaData_isVideo_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) insertDocumentWithData:*(void *)(a1 + 40) fileName:*(void *)(a1 + 48) mimeType:*(void *)(a1 + 56) contentID:*(void *)(a1 + 64)];
  uint64_t result = *(void *)(a1 + 72);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __100__MFComposeWebView__insertMediaWithAssetIdentifier_mediaURL_mediaType_mediaData_isVideo_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F734C0] dataWithContentsOfURL:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __100__MFComposeWebView__insertMediaWithAssetIdentifier_mediaURL_mediaType_mediaData_isVideo_completion___block_invoke_4;
  v8[3] = &unk_1E5F7A568;
  uint64_t v5 = *(void *)(a1 + 64);
  uint64_t v6 = *(void **)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v12 = v5;
  id v10 = v6;
  id v11 = *(id *)(a1 + 56);
  id v7 = objc_msgSend(MEMORY[0x1E4F60F28], "mainThreadScheduler", v8[0], 3221225472, __100__MFComposeWebView__insertMediaWithAssetIdentifier_mediaURL_mediaType_mediaData_isVideo_completion___block_invoke_4, &unk_1E5F7A568, v9);
  [v7 performSyncBlock:v8];
}

uint64_t __100__MFComposeWebView__insertMediaWithAssetIdentifier_mediaURL_mediaType_mediaData_isVideo_completion___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) _insertDocumentFromData:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) isImage:1 contentID:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __100__MFComposeWebView__insertMediaWithAssetIdentifier_mediaURL_mediaType_mediaData_isVideo_completion___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) _insertDocumentFromData:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) isImage:1 contentID:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)removeMediaWithContentIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v23 = 0;
  long long v24 = &v23;
  uint64_t v25 = 0x3032000000;
  long long v26 = __Block_byref_object_copy__3;
  id v27 = __Block_byref_object_dispose__3;
  id v28 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__3;
  id v21 = __Block_byref_object_dispose__3;
  id v22 = 0;
  attachmentsByUniqueIdentifier = self->_attachmentsByUniqueIdentifier;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__MFComposeWebView_removeMediaWithContentIdentifier___block_invoke;
  v13[3] = &unk_1E5F7A5B8;
  id v6 = v4;
  id v14 = v6;
  id v15 = &v23;
  id v16 = &v17;
  [(NSMutableDictionary *)attachmentsByUniqueIdentifier enumerateKeysAndObjectsUsingBlock:v13];
  if (v24[5] && v18[5])
  {
    id v7 = -[MFComposeWebView _attachmentForIdentifier:](self, "_attachmentForIdentifier:");
    id v8 = [(MFComposeWebView *)self _bodyFieldProxy];
    uint64_t v9 = v18[5];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __53__MFComposeWebView_removeMediaWithContentIdentifier___block_invoke_2;
    v11[3] = &unk_1E5F79038;
    v11[4] = self;
    id v10 = v7;
    id v12 = v10;
    [v8 removeMediaAttachment:v9 completionHandler:v11];
  }
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
}

void __53__MFComposeWebView_removeMediaWithContentIdentifier___block_invoke(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v11 = a2;
  id v8 = a3;
  uint64_t v9 = [v8 contentID];
  if ([v9 isEqualToString:a1[4]])
  {
    int v10 = [v8 isMediaFile];

    if (v10)
    {
      objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a3);
      objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
      *a4 = 1;
    }
  }
  else
  {
  }
}

uint64_t __53__MFComposeWebView_removeMediaWithContentIdentifier___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeAttachment:*(void *)(a1 + 40)];
}

- (void)insertScannedDocumentWithData:(id)a3
{
}

- (void)_insertDocumentFromData:(id)a3 isImage:(BOOL)a4 contentID:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    id v10 = v8;
    id v18 = 0;
    id v19 = 0;
    BOOL v11 = [(MFComposeWebView *)self _getExtensionAndMimeTypeForImageData:v10 outExtension:&v19 outMimeType:&v18];
    id v12 = v19;
    id v13 = v18;
    if (v11)
    {
      id v14 = NSString;
      if (v6)
      {
        unint64_t imageCount = self->_imageCount;
        self->_unint64_t imageCount = imageCount + 1;
        id v16 = [v14 stringWithFormat:@"image%lu.%@", imageCount, v12];
      }
      else
      {
        uint64_t v17 = [(MFComposeWebView *)self nextAttachmentName];
        id v16 = [v14 stringWithFormat:@"%@.%@", v17, v12];
      }
      [(MFComposeWebView *)self insertDocumentWithData:v10 fileName:v16 mimeType:v13 contentID:v9];
    }
    else
    {
      id v16 = 0;
    }
  }
}

- (id)contentIDsForMediaAttachments
{
  uint64_t v2 = [(NSMutableDictionary *)self->_attachmentsByUniqueIdentifier allValues];
  uint64_t v3 = objc_msgSend(v2, "ef_compactMap:", &__block_literal_global_403);

  return v3;
}

id __49__MFComposeWebView_contentIDsForMediaAttachments__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isMediaFile])
  {
    uint64_t v3 = [v2 contentID];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)updateInputAssistantItem
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1AF945000, v0, v1, "Expected the first group to be a standard system group, but got %{public}@.", v2, v3, v4, v5, v6);
}

id __44__MFComposeWebView_updateInputAssistantItem__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 count];
  uint64_t v7 = [v5 count];
  if (v6 && v7)
  {
    id v8 = [v4 arrayByAddingObjectsFromArray:v5];
  }
  else
  {
    if (v6) {
      id v9 = v4;
    }
    else {
      id v9 = v5;
    }
    id v8 = v9;
  }
  id v10 = v8;

  return v10;
}

- (void)getHTMLDataObject:(id)a3
{
}

- (void)getHTMLDataObjectRemovingSignature:(BOOL)a3 completion:(id)a4
{
}

- (void)getHTMLDataObjectRemovingSignature:(BOOL)a3 removeQuotes:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = [(MFComposeWebView *)self _bodyFieldProxy];
  id v10 = [(MFComposeWebView *)self _attachmentInfoByIdentifier];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __79__MFComposeWebView_getHTMLDataObjectRemovingSignature_removeQuotes_completion___block_invoke;
  v12[3] = &unk_1E5F7A620;
  BOOL v14 = a4;
  id v11 = v8;
  id v13 = v11;
  [v9 htmlStringsAttachmentURLsAndPlainTextAlternativeRemovingSignature:v6 attachmentInfoByIdentifier:v10 completion:v12];
}

void __79__MFComposeWebView_getHTMLDataObjectRemovingSignature_removeQuotes_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v15 = a2;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_msgSend(a3, "ef_map:", &__block_literal_global_409);
  id v12 = plainTextDocumentFromStringsAndQuoteLevels(v9, *(unsigned __int8 *)(a1 + 40));
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F77C38]) initWithContentIDs:v10];
  BOOL v14 = [[MFHTMLDataObject alloc] initWithHTMLString:v15 otherHTMLStringsAndAttachments:v11 plainTextAlternative:v12 quotedAttachmentsInfo:v13];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __79__MFComposeWebView_getHTMLDataObjectRemovingSignature_removeQuotes_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [MEMORY[0x1E4F77B78] defaultManager];
    id v4 = [MEMORY[0x1E4F1CB10] URLWithString:v2];
    id v5 = [v3 attachmentForCID:v4];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v2;
    }
    else {
      id v5 = 0;
    }
  }

  return v5;
}

- (void)placeCaretAtStartOfBodyField
{
  id v2 = [(MFComposeWebView *)self _bodyFieldProxy];
  [v2 placeCaretAtStartOfBody];
}

- (id)htmlString
{
  uint64_t v3 = EMLogCompose();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF945000, v3, OS_LOG_TYPE_DEFAULT, "MFComposeWebView - htmlString", buf, 2u);
  }

  id v4 = [MEMORY[0x1E4F60E18] promise];
  id v5 = [(MFComposeWebView *)self _bodyFieldProxy];
  BOOL v6 = [(MFComposeWebView *)self _attachmentInfoByIdentifier];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __30__MFComposeWebView_htmlString__block_invoke;
  v10[3] = &unk_1E5F7A648;
  id v7 = v4;
  id v11 = v7;
  [v5 htmlStringUsingAttachmentInfoByIdentifier:v6 completionHandler:v10];

  id v8 = [v7 future];

  return v8;
}

void __30__MFComposeWebView_htmlString__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = EMLogCompose();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1AF945000, v4, OS_LOG_TYPE_DEFAULT, "Finished retrieving the HTML string", v5, 2u);
  }

  [*(id *)(a1 + 32) finishWithResult:v3];
}

- (id)containsRichText
{
  id v3 = EMLogCompose();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF945000, v3, OS_LOG_TYPE_DEFAULT, "MFComposeWebView - containsRichText", buf, 2u);
  }

  id v4 = [MEMORY[0x1E4F60E18] promise];
  id v5 = [(MFComposeWebView *)self _bodyFieldProxy];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __36__MFComposeWebView_containsRichText__block_invoke;
  v9[3] = &unk_1E5F7A210;
  id v6 = v4;
  id v10 = v6;
  [v5 containsRichText:v9];

  id v7 = [v6 future];

  return v7;
}

void __36__MFComposeWebView_containsRichText__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = EMLogCompose();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = a2;
    _os_log_impl(&dword_1AF945000, v4, OS_LOG_TYPE_DEFAULT, "Does the webview contain rich text? Answer: %{BOOL}d", (uint8_t *)v7, 8u);
  }

  id v5 = *(void **)(a1 + 32);
  id v6 = [NSNumber numberWithBool:a2];
  [v5 finishWithResult:v6];
}

- (CGRect)rectOfElementWithID:(id)a3
{
  double v3 = *MEMORY[0x1E4F1DB20];
  double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (void)setPrefersFirstLineSelection
{
  id v2 = [(MFComposeWebView *)self _bodyFieldProxy];
  [v2 forceNextSelectionFromSecondToFirstLine];
}

- (void)prependMarkupString:(id)a3 quote:(BOOL)a4
{
  BOOL v4 = a4;
  id v12 = a3;
  if (!v12)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"MFComposeWebView.m", 1221, @"string is nil, JavaScript will crash" object file lineNumber description];
  }
  id v7 = [(MFComposeWebView *)self _bodyFieldProxy];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  uint64_t v9 = [WeakRetained compositionType];
  id v10 = [(MFComposeWebView *)self _attachmentInfoByIdentifier];
  [v7 addMarkupString:v12 quote:v4 emptyFirst:0 prepended:1 composeType:v9 attachmentInfoByURL:v10];
}

- (void)appendMarkupString:(id)a3 quote:(BOOL)a4
{
  BOOL v4 = a4;
  id v12 = a3;
  if (!v12)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"MFComposeWebView.m", 1226, @"string is nil, JavaScript will crash" object file lineNumber description];
  }
  id v7 = [(MFComposeWebView *)self _bodyFieldProxy];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  uint64_t v9 = [WeakRetained compositionType];
  id v10 = [(MFComposeWebView *)self _attachmentInfoByIdentifier];
  [v7 addMarkupString:v12 quote:v4 emptyFirst:0 prepended:0 composeType:v9 attachmentInfoByURL:v10];
}

- (void)addMailAttributesBeforeDisplayHidingTrailingEmptyQuotes:(BOOL)a3 shouldQuote:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = [(MFComposeWebView *)self _bodyFieldProxy];
  [v6 addMailAttributesBeforeDisplayHidingTrailingEmptyQuotes:v5 shouldQuote:v4];
}

- (void)prependString:(id)a3
{
  id v9 = a3;
  BOOL v4 = [(MFComposeWebView *)self _bodyFieldProxy];
  BOOL v5 = objc_msgSend(v9, "mf_stringByEscapingHTMLCodes");
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  uint64_t v7 = [WeakRetained compositionType];
  uint64_t v8 = [(MFComposeWebView *)self _attachmentInfoByIdentifier];
  [v4 addMarkupString:v5 quote:0 emptyFirst:0 prepended:1 composeType:v7 attachmentInfoByURL:v8];
}

- (void)prependPreamble:(id)a3 quote:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  id v6 = [(MFComposeWebView *)self _bodyFieldProxy];
  objc_msgSend(v6, "prependPreamble:quote:layoutDirection:", v7, v4, objc_msgSend((id)*MEMORY[0x1E4FB2608], "userInterfaceLayoutDirection"));
}

- (void)replaceImagesIfNecessary
{
  id v2 = [(MFComposeWebView *)self _bodyFieldProxy];
  [v2 replaceImagesIfNecessary];
}

- (void)stripCustomBodyIdentifiers
{
  id v2 = [(MFComposeWebView *)self _bodyFieldProxy];
  [v2 stripCustomBodyIdentifiers];
}

- (void)setReplacementFilenamesByContentID:(id)a3
{
  id v5 = a3;
  BOOL v4 = [(MFComposeWebView *)self _bodyFieldProxy];
  [v4 setReplacementFilenamesByContentID:v5];
}

- (void)setMarkupString:(id)a3 quote:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  id v6 = [(MFComposeWebView *)self _bodyFieldProxy];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  uint64_t v8 = [WeakRetained compositionType];
  id v9 = [(MFComposeWebView *)self _attachmentInfoByIdentifier];
  [v6 addMarkupString:v10 quote:v4 emptyFirst:1 prepended:1 composeType:v8 attachmentInfoByURL:v9];
}

- (void)replaceAttachment:(id)a3 withDocumentAtURL:(id)a4 completion:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v25 = (void (**)(id, NSObject *))a5;
  id v10 = EMLogCompose();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = objc_msgSend(v8, "ef_publicDescription");
    *(_DWORD *)buf = 134218242;
    id v27 = self;
    __int16 v28 = 2114;
    id v29 = v11;
    _os_log_impl(&dword_1AF945000, v10, OS_LOG_TYPE_DEFAULT, "<%p> Replacing attachment: %{public}@", buf, 0x16u);
  }
  id v12 = [v8 mimeType];
  id v13 = [(MFComposeWebView *)self _makeAttachmentDataWithFileURL:v9 type:v12];

  BOOL v14 = [v8 fileName];
  if (v13
    && ([v8 mimeType],
        id v15 = objc_claimAutoreleasedReturnValue(),
        [(MFComposeWebView *)self _addInlineAttachmentWithData:v13 fileName:v14 type:v15 contentID:0], id v16 = objc_claimAutoreleasedReturnValue(), v15, v16))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
    long long v24 = [WeakRetained compositionContext];

    [v24 removeAttachment:v8];
    id v18 = [(NSMutableDictionary *)self->_attachmentsByUniqueIdentifier allKeysForObject:v8];
    id v19 = [v18 firstObject];

    id v20 = [(MFComposeWebView *)self _attachmentForIdentifier:v19];
    [(NSMutableDictionary *)self->_attachmentsByUniqueIdentifier setObject:v16 forKeyedSubscript:v19];
    id v21 = [v16 fileWrapperUsingFetchedLocalData];
    id v22 = [v8 fileUTType];
    [v20 setFileWrapper:v21 contentType:v22 completion:0];

    uint64_t v23 = [(MFComposeWebView *)self mailComposeViewDelegate];
    [v23 didInsertAttachment:v16];

    if (v25) {
      v25[2](v25, v16);
    }
  }
  else
  {
    id v16 = MFLogGeneral();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[MFComposeWebView replaceAttachment:withDocumentAtURL:completion:]();
    }
  }
}

- (void)_changeQuoteLevelBy:(int64_t)a3
{
  id v5 = [(MFComposeWebView *)self _bodyFieldProxy];
  if (bundle_onceToken != -1) {
    dispatch_once(&bundle_onceToken, &__block_literal_global_1139);
  }
  BOOL v4 = [(id)bundle_bundle localizedStringForKey:@"UNDO_QUOTE_LEVEL" value:&stru_1F0817A00 table:@"Main"];
  [v5 changeQuoteLevelBy:a3 withUndoActionName:v4];
}

- (void)_increaseQuoteLevel:(id)a3
{
}

- (void)_decreaseQuoteLevel:(id)a3
{
}

- (id)_actionWithTitle:(void *)a3 glyphName:(int)a4 usePrivateCatalog:(void *)a5 handler:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  if (a1)
  {
    if (a4) {
      [MEMORY[0x1E4FB1818] _systemImageNamed:v10];
    }
    else {
    id v12 = [MEMORY[0x1E4FB1818] systemImageNamed:v10];
    }
    id v13 = (void *)MEMORY[0x1E4FB13F0];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __73__MFComposeWebView__actionWithTitle_glyphName_usePrivateCatalog_handler___block_invoke;
    v15[3] = &unk_1E5F7A670;
    id v16 = v11;
    a1 = [v13 actionWithTitle:v9 image:v12 identifier:0 handler:v15];
  }

  return a1;
}

uint64_t __73__MFComposeWebView__actionWithTitle_glyphName_usePrivateCatalog_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)buildMenuWithBuilder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MFComposeWebView;
  [(MFComposeWebView *)&v5 buildMenuWithBuilder:v4];
  [(MFComposeWebView *)self _addContextMenusToBuilder:v4];
}

- (void)_addContextMenusToBuilder:(id)a3
{
  v60[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [v4 system];
  id v6 = [MEMORY[0x1E4FB1998] contextSystem];
  if (v5 == v6)
  {
    char v7 = [(MFComposeWebView *)self _contentViewIsFirstResponder];

    if (v7)
    {
      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, self);
      id v44 = [MEMORY[0x1E4F1CA48] array];
      id v8 = _EFLocalizedString();
      v57[0] = MEMORY[0x1E4F143A8];
      v57[1] = 3221225472;
      v57[2] = __46__MFComposeWebView__addContextMenusToBuilder___block_invoke;
      v57[3] = &unk_1E5F7A698;
      objc_copyWeak(&v58, &location);
      id v41 = -[MFComposeWebView _actionWithTitle:glyphName:handler:](self, v8, @"doc.on.clipboard", v57);

      [v44 addObject:v41];
      if ([(MFComposeWebView *)self _shouldShowAddLinkButton])
      {
        id v9 = _EFLocalizedString();
        v55[0] = MEMORY[0x1E4F143A8];
        v55[1] = 3221225472;
        v55[2] = __46__MFComposeWebView__addContextMenusToBuilder___block_invoke_2;
        v55[3] = &unk_1E5F7A698;
        objc_copyWeak(&v56, &location);
        id v10 = -[MFComposeWebView _actionWithTitle:glyphName:handler:](self, v9, @"link", v55);

        [v44 addObject:v10];
        objc_destroyWeak(&v56);
      }
      v40 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F0817A00 image:0 identifier:0 options:1 children:v44];
      objc_msgSend(v4, "insertChildMenu:atEndOfMenuForIdentifier:");
      if (bundle_onceToken != -1) {
        dispatch_once(&bundle_onceToken, &__block_literal_global_1139);
      }
      id v11 = (id)bundle_bundle;
      id v12 = [v11 localizedStringForKey:@"INCREASE" value:&stru_1F0817A00 table:@"Main"];
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = 3221225472;
      v53[2] = __46__MFComposeWebView__addContextMenusToBuilder___block_invoke_3;
      v53[3] = &unk_1E5F7A698;
      id v39 = &v54;
      objc_copyWeak(&v54, &location);
      id v43 = -[MFComposeWebView _actionWithTitle:glyphName:handler:](self, v12, @"increase.quotelevel", v53);

      [v43 setAttributes:8];
      if (bundle_onceToken != -1) {
        dispatch_once(&bundle_onceToken, &__block_literal_global_1139);
      }
      id v13 = (id)bundle_bundle;
      BOOL v14 = [v13 localizedStringForKey:@"DECREASE" value:&stru_1F0817A00 table:@"Main"];
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __46__MFComposeWebView__addContextMenusToBuilder___block_invoke_4;
      v51[3] = &unk_1E5F7A698;
      id v38 = &v52;
      objc_copyWeak(&v52, &location);
      int v42 = -[MFComposeWebView _actionWithTitle:glyphName:handler:](self, v14, @"decrease.quotelevel", v51);

      [v42 setAttributes:8];
      id v15 = (void *)MEMORY[0x1E4FB1970];
      if (bundle_onceToken != -1) {
        dispatch_once(&bundle_onceToken, &__block_literal_global_1139);
      }
      id v16 = (id)bundle_bundle;
      uint64_t v17 = [v16 localizedStringForKey:@"QUOTE_LEVEL" value:&stru_1F0817A00 table:@"Main"];
      id v18 = [MEMORY[0x1E4FB1818] systemImageNamed:@"quotelevel"];
      v60[0] = v42;
      v60[1] = v43;
      id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:2];
      id v20 = [v15 menuWithTitle:v17 image:v18 identifier:0 options:0 children:v19];

      uint64_t v21 = *MEMORY[0x1E4FB2D50];
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __46__MFComposeWebView__addContextMenusToBuilder___block_invoke_5;
      v49[3] = &unk_1E5F7A6C0;
      id v22 = v20;
      id v50 = v22;
      [v4 replaceChildrenOfMenuForIdentifier:v21 fromChildrenBlock:v49];
      uint64_t v23 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
      if ([(MFComposeWebView *)self _shouldShowMarkupButton])
      {
        if (bundle_onceToken != -1) {
          dispatch_once(&bundle_onceToken, &__block_literal_global_1139);
        }
        id v24 = (id)bundle_bundle;
        uint64_t v25 = objc_msgSend(v24, "localizedStringForKey:value:table:", @"MARKUP_ATTACHMENT", &stru_1F0817A00, @"Main", &v52, &v54);
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __46__MFComposeWebView__addContextMenusToBuilder___block_invoke_6;
        v47[3] = &unk_1E5F7A698;
        objc_copyWeak(&v48, &location);
        long long v26 = -[MFComposeWebView _actionWithTitle:glyphName:handler:](self, v25, @"pencil.tip.crop.circle", v47);

        [v23 addObject:v26];
        objc_destroyWeak(&v48);
      }
      if (bundle_onceToken != -1) {
        dispatch_once(&bundle_onceToken, &__block_literal_global_1139);
      }
      id v27 = (id)bundle_bundle;
      __int16 v28 = [v27 localizedStringForKey:@"INSERT_PHOTO_OR_VIDEO" value:&stru_1F0817A00 table:@"Main"];
      id v29 = -[MFComposeWebView _insertPhotoActionWithTitle:](self, v28);
      objc_msgSend(v23, "ef_addOptionalObject:", v29);

      if (bundle_onceToken != -1) {
        dispatch_once(&bundle_onceToken, &__block_literal_global_1139);
      }
      id v30 = (id)bundle_bundle;
      id v31 = [v30 localizedStringForKey:@"IMPORT_DOCUMENT" value:&stru_1F0817A00 table:@"Main"];
      id v32 = -[MFComposeWebView _importDocumentActionWithTitle:]((id *)&self->super.super.super.super.isa, v31);
      objc_msgSend(v23, "ef_addOptionalObject:", v32);

      v33 = -[MFComposeWebView _scanDocumentAction](self);
      objc_msgSend(v23, "ef_addOptionalObject:", v33);

      if (bundle_onceToken != -1) {
        dispatch_once(&bundle_onceToken, &__block_literal_global_1139);
      }
      id v34 = (id)bundle_bundle;
      id v35 = [v34 localizedStringForKey:@"INSERT_DRAWING_BUTTON" value:&stru_1F0817A00 table:@"Main"];
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __46__MFComposeWebView__addContextMenusToBuilder___block_invoke_7;
      v45[3] = &unk_1E5F7A698;
      objc_copyWeak(&v46, &location);
      v36 = -[MFComposeWebView _actionWithTitle:glyphName:handler:](self, v35, @"pencil.tip.crop.circle.badge.plus", v45);

      [v23 addObject:v36];
      id v37 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F0817A00 image:0 identifier:0 options:1 children:v23];
      [v4 insertChildMenu:v37 atEndOfMenuForIdentifier:v21];

      objc_destroyWeak(&v46);
      objc_destroyWeak(v38);

      objc_destroyWeak(v39);
      objc_destroyWeak(&v58);

      objc_destroyWeak(&location);
    }
  }
  else
  {
  }
}

void __46__MFComposeWebView__addContextMenusToBuilder___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _pasteAndMatchStyleKeyCommandInvoked:WeakRetained];
}

void __46__MFComposeWebView__addContextMenusToBuilder___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didTapAddLink:WeakRetained];
}

void __46__MFComposeWebView__addContextMenusToBuilder___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _increaseQuoteLevel:WeakRetained];
}

void __46__MFComposeWebView__addContextMenusToBuilder___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _decreaseQuoteLevel:WeakRetained];
}

id __46__MFComposeWebView__addContextMenusToBuilder___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = [a2 arrayByAddingObject:*(void *)(a1 + 32)];

  return v2;
}

void __46__MFComposeWebView__addContextMenusToBuilder___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didTapMarkupButton:WeakRetained];
}

- (id)_insertPhotoActionWithTitle:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    if (MFIsAuthorizedToAccessPhotoLibrary() && ([a1 _shouldShowInsertPhotosButton] & 1) != 0)
    {
      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, a1);
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __48__MFComposeWebView__insertPhotoActionWithTitle___block_invoke;
      v5[3] = &unk_1E5F7A698;
      objc_copyWeak(&v6, &location);
      a1 = -[MFComposeWebView _actionWithTitle:glyphName:handler:](a1, v3, @"photo.on.rectangle", v5);
      objc_destroyWeak(&v6);
      objc_destroyWeak(&location);
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (id)_importDocumentActionWithTitle:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 224);
    char v5 = [WeakRetained canShowAttachmentPicker];

    if (v5)
    {
      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, a1);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      _DWORD v7[2] = __51__MFComposeWebView__importDocumentActionWithTitle___block_invoke;
      v7[3] = &unk_1E5F7A698;
      objc_copyWeak(&v8, &location);
      -[MFComposeWebView _actionWithTitle:glyphName:handler:](a1, v3, @"doc", v7);
      a1 = (id *)objc_claimAutoreleasedReturnValue();
      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (id)_scanDocumentAction
{
  id v1 = a1;
  if (a1)
  {
    if ([MEMORY[0x1E4F45E20] isSupported])
    {
      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, v1);
      if (bundle_onceToken != -1) {
        dispatch_once(&bundle_onceToken, &__block_literal_global_1139);
      }
      id v2 = [(id)bundle_bundle localizedStringForKey:@"SCAN_DOCUMENT_MENU_ITEM" value:&stru_1F0817A00 table:@"Main"];
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __39__MFComposeWebView__scanDocumentAction__block_invoke;
      v4[3] = &unk_1E5F7A698;
      objc_copyWeak(&v5, &location);
      -[MFComposeWebView _actionWithTitle:glyphName:handler:](v1, v2, @"doc.text.viewfinder", v4);
      id v1 = (id)objc_claimAutoreleasedReturnValue();
      objc_destroyWeak(&v5);

      objc_destroyWeak(&location);
    }
    else
    {
      id v1 = 0;
    }
  }

  return v1;
}

void __46__MFComposeWebView__addContextMenusToBuilder___block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didTapInsertDrawing:WeakRetained];
}

- (BOOL)isDirty
{
  return self->_dirty;
}

- (void)setDirty:(BOOL)a3
{
  BOOL v3 = a3;
  ++self->_dirtyChangeIgnoreCount;
  self->_dirtdouble y = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v5 = [(MFComposeWebView *)self _bodyFieldProxy];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__MFComposeWebView_setDirty___block_invoke;
  v6[3] = &unk_1E5F7A698;
  objc_copyWeak(&v7, &location);
  [v5 setDirty:v3 completionHandler:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __29__MFComposeWebView_setDirty___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    --WeakRetained[231];
  }
}

- (id)nextAttachmentName
{
  BOOL v3 = NSString;
  if (bundle_onceToken != -1) {
    dispatch_once(&bundle_onceToken, &__block_literal_global_1139);
  }
  id v4 = (id)bundle_bundle;
  id v5 = [v4 localizedStringForKey:@"DEFAULT_ATTACHMENT_NAME" value:&stru_1F0817A00 table:@"Main"];
  unint64_t v6 = self->_attachmentSequenceNumber + 1;
  self->_attachmentSequenceNumber = v6;
  id v7 = [v3 localizedStringWithFormat:@"%@ %ld", v5, v6];

  return v7;
}

- (BOOL)allowsAttachmentElements
{
  return 1;
}

- (id)inputView
{
  BOOL v3 = [(MFComposeWebView *)self inputViewForPreservingFocus];

  if (v3)
  {
    id v4 = [(MFComposeWebView *)self inputViewForPreservingFocus];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)MFComposeWebView;
    id v4 = [(MFComposeWebView *)&v6 inputView];
  }

  return v4;
}

- (void)retainFocusAfterPresenting
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1850]);
  id v5 = (id)objc_msgSend(v3, "initWithFrame:inputViewStyle:", 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v5 setUserInteractionEnabled:0];
  [v5 setAllowsSelfSizing:1];
  [(MFComposeWebView *)self setInputViewForPreservingFocus:v5];
  id v4 = [(MFComposeWebView *)self firstResponder];
  [v4 reloadInputViews];
}

- (void)releaseFocusAfterDismissing:(BOOL)a3
{
  if (a3)
  {
    id v5 = self;
    [(MFComposeWebView *)v5 resignFirstResponder];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__MFComposeWebView_releaseFocusAfterDismissing___block_invoke;
    block[3] = &unk_1E5F79038;
    void block[4] = v5;
    id v8 = v5;
    id v4 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    [(MFComposeWebView *)self setInputViewForPreservingFocus:0];
    id v6 = [(MFComposeWebView *)self firstResponder];
    [v6 reloadInputViews];
  }
}

uint64_t __48__MFComposeWebView_releaseFocusAfterDismissing___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setInputViewForPreservingFocus:0];
  id v2 = *(void **)(a1 + 40);

  return [v2 becomeFirstResponder];
}

- (void)compositionWillFinish
{
  self->_isFinishing = 1;
}

- (void)compositionDidFailToFinish
{
  self->_isFinishing = 0;
}

- (id)_mailComposeEditingLeadingInputAssistantGroups
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = -[MFComposeWebView _formattingAction]((id *)&self->super.super.super.super.isa);
  if (v4)
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithPrimaryAction:v4];
    id v6 = objc_alloc(MEMORY[0x1E4FB14B8]);
    v17[0] = v5;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    id v8 = (void *)[v6 initWithBarButtonItems:v7 representativeItem:0];

    [v3 addObject:v8];
  }
  id v9 = -[MFComposeWebView _showWritingToolsAction](self);
  if (v9)
  {
    id v10 = -[MFComposeWebView _barButtonItemWithAction:target:selector:]((uint64_t)self, v9, self, (uint64_t)sel__didTapShowWritingTools_);
    id v11 = objc_alloc(MEMORY[0x1E4FB14B8]);
    id v16 = v10;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
    id v13 = (void *)[v11 initWithBarButtonItems:v12 representativeItem:0];

    [(MFComposeWebView *)self setAppleIntelligenceGroup:v13];
    [v3 addObject:v13];
  }
  [(MFComposeWebView *)self set_leadingInputAssistantItemGroups:v3];
  BOOL v14 = [(MFComposeWebView *)self _leadingInputAssistantItemGroups];

  return v14;
}

- (id)_formattingAction
{
  if (a1
    && (id WeakRetained = objc_loadWeakRetained(a1 + 224),
        char v3 = objc_opt_respondsToSelector(),
        WeakRetained,
        (v3 & 1) != 0))
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, a1);
    id v4 = objc_msgSend(MEMORY[0x1E4FB1818], "mf_assistantBarSystemImageNamed:", @"textformat");
    id v5 = (void *)MEMORY[0x1E4FB13F0];
    if (bundle_onceToken != -1) {
      dispatch_once(&bundle_onceToken, &__block_literal_global_1139);
    }
    id v6 = [(id)bundle_bundle localizedStringForKey:@"FORMAT_TEXT" value:&stru_1F0817A00 table:@"Main"];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __37__MFComposeWebView__formattingAction__block_invoke;
    v9[3] = &unk_1E5F7A198;
    objc_copyWeak(&v10, &location);
    id v7 = [v5 actionWithTitle:v6 image:v4 identifier:0 handler:v9];
    objc_destroyWeak(&v10);

    objc_destroyWeak(&location);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_showWritingToolsAction
{
  id v1 = a1;
  if (a1)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0
      && [MEMORY[0x1E4F466F0] _isWritingToolsAvailable])
    {
      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, v1);
      v3[0] = MEMORY[0x1E4F143A8];
      v3[1] = 3221225472;
      v3[2] = __43__MFComposeWebView__showWritingToolsAction__block_invoke;
      v3[3] = &unk_1E5F7A698;
      objc_copyWeak(&v4, &location);
      -[MFComposeWebView _actionWithTitle:glyphName:usePrivateCatalog:handler:](v1, @"Show Writing Tools", @"apple.writing.tools", 1, v3);
      id v1 = (id)objc_claimAutoreleasedReturnValue();
      objc_destroyWeak(&v4);
      objc_destroyWeak(&location);
    }
    else
    {
      id v1 = 0;
    }
  }

  return v1;
}

- (id)_barButtonItemWithAction:(void *)a3 target:(uint64_t)a4 selector:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = 0;
  if (a1 && v7)
  {
    id v10 = objc_alloc(MEMORY[0x1E4FB14A8]);
    id v11 = [v7 title];
    id v12 = [v7 image];
    id v9 = (void *)[v10 initWithTitle:v11 image:v12 target:v8 action:a4 menu:0];
  }

  return v9;
}

- (id)_mailComposeEditingTrailingInputAssistantGroups
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  if (WeakRetained)
  {
    id v37 = [MEMORY[0x1E4F1CA48] array];
    id v4 = [MEMORY[0x1E4F1CA48] array];
    id v36 = WeakRetained;
    if (bundle_onceToken != -1) {
      dispatch_once(&bundle_onceToken, &__block_literal_global_1139);
    }
    id v5 = (id)bundle_bundle;
    id v6 = [v5 localizedStringForKey:@"TAKE_PHOTO_OR_VIDEO" value:&stru_1F0817A00 table:@"Main"];
    id v7 = -[MFComposeWebView _insertPhotoFromCameraActionWithTitle:](self, v6);
    uint64_t v8 = -[MFComposeWebView _barButtonItemWithAction:target:selector:]((uint64_t)self, v7, self, (uint64_t)sel__didTapCameraButton_);

    id v35 = (void *)v8;
    objc_msgSend(v4, "ef_addOptionalObject:", v8);
    if (bundle_onceToken != -1) {
      dispatch_once(&bundle_onceToken, &__block_literal_global_1139);
    }
    id v9 = (id)bundle_bundle;
    id v10 = [v9 localizedStringForKey:@"PHOTO_LIBRARY" value:&stru_1F0817A00 table:@"Main"];
    id v11 = -[MFComposeWebView _insertPhotoActionWithTitle:](self, v10);
    uint64_t v12 = -[MFComposeWebView _barButtonItemWithAction:target:selector:]((uint64_t)self, v11, self, (uint64_t)sel__didTapInsertPhotoButton_);

    id v34 = (void *)v12;
    objc_msgSend(v4, "ef_addOptionalObject:", v12);
    id v13 = -[MFComposeWebView _scanDocumentAction](self);
    uint64_t v14 = -[MFComposeWebView _barButtonItemWithAction:target:selector:]((uint64_t)self, v13, self, (uint64_t)sel__scanDocumentCommandInvoked_);

    v33 = (void *)v14;
    objc_msgSend(v4, "ef_addOptionalObject:", v14);
    id v15 = [(MFComposeWebView *)self textFromCameraButtonItem];
    objc_msgSend(v4, "ef_addOptionalObject:", v15);

    if (bundle_onceToken != -1) {
      dispatch_once(&bundle_onceToken, &__block_literal_global_1139);
    }
    id v16 = (id)bundle_bundle;
    uint64_t v17 = [v16 localizedStringForKey:@"IMPORT_DOCUMENT" value:&stru_1F0817A00 table:@"Main"];
    id v18 = -[MFComposeWebView _importDocumentActionWithTitle:]((id *)&self->super.super.super.super.isa, v17);
    id v19 = -[MFComposeWebView _barButtonItemWithAction:target:selector:]((uint64_t)self, v18, self, (uint64_t)sel__importDocumentCommandInvoked_);

    [(MFComposeWebView *)self setDocumentItem:v19];
    objc_msgSend(v4, "ef_addOptionalObject:", v19);
    if ([v4 count])
    {
      if (bundle_onceToken != -1) {
        dispatch_once(&bundle_onceToken, &__block_literal_global_1139);
      }
      id v20 = (id)bundle_bundle;
      uint64_t v21 = [v20 localizedStringForKey:@"INSERT_ATTACHMENT_ACTIONS" value:&stru_1F0817A00 table:@"Main"];
      id v22 = -[MFComposeWebView _barButtonItemWithImageName:title:target:selector:]((uint64_t)self, @"paperclip", v21, 0, 0);

      uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4FB14B8]) initWithBarButtonItems:v4 representativeItem:v22];
      [v23 _setShouldAlwaysCollapse:1];
      [v37 addObject:v23];
      [(MFComposeWebView *)self setInsertAttachmentGroup:v23];
    }
    if (bundle_onceToken != -1) {
      dispatch_once(&bundle_onceToken, &__block_literal_global_1139);
    }
    id v24 = (id)bundle_bundle;
    uint64_t v25 = [v24 localizedStringForKey:@"INSERT_DRAWING_MENU_ITEM" value:&stru_1F0817A00 table:@"Main"];
    long long v26 = -[MFComposeWebView _markupActionWithTitle:](self, v25);
    id v27 = -[MFComposeWebView _barButtonItemWithAction:target:selector:]((uint64_t)self, v26, self, (uint64_t)sel__didTapInsertDrawingOrMarkupButton_);

    id v28 = objc_alloc(MEMORY[0x1E4FB14B8]);
    v38[0] = v27;
    id v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
    id WeakRetained = v36;
    id v30 = (void *)[v28 initWithBarButtonItems:v29 representativeItem:0];

    [v37 addObject:v30];
    [(MFComposeWebView *)self set_trailingInputAssistantItemGroups:v37];
  }
  id v31 = [(MFComposeWebView *)self _trailingInputAssistantItemGroups];

  return v31;
}

- (id)_insertPhotoFromCameraActionWithTitle:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    if ([a1 _shouldShowInsertPhotosButton])
    {
      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, a1);
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __58__MFComposeWebView__insertPhotoFromCameraActionWithTitle___block_invoke;
      v5[3] = &unk_1E5F7A698;
      objc_copyWeak(&v6, &location);
      a1 = -[MFComposeWebView _actionWithTitle:glyphName:handler:](a1, v3, @"camera", v5);
      objc_destroyWeak(&v6);
      objc_destroyWeak(&location);
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (id)_barButtonItemWithImageName:(void *)a3 title:(void *)a4 target:(uint64_t)a5 selector:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  if (a1)
  {
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4FB1818], "mf_assistantBarSystemImageNamed:", v9);
    id v13 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:v10 image:v12 target:v11 action:a5 menu:0];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (id)_markupActionWithTitle:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, a1);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __43__MFComposeWebView__markupActionWithTitle___block_invoke;
    v5[3] = &unk_1E5F7A698;
    objc_copyWeak(&v6, &location);
    a1 = -[MFComposeWebView _actionWithTitle:glyphName:handler:](a1, v3, @"pencil.tip.crop.circle", v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }

  return a1;
}

void __37__MFComposeWebView__formattingAction__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v4 = [v9 sender];
    id v5 = (void *)v4;
    if (v4) {
      id v6 = (void *)v4;
    }
    else {
      id v6 = WeakRetained;
    }
    id v7 = v6;

    [WeakRetained donateHasUsedAttachment];
    uint64_t v8 = [WeakRetained mailComposeViewDelegate];
    [v8 showStyleSelector:v7];
  }
}

void __48__MFComposeWebView__insertPhotoActionWithTitle___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didTapInsertPhotoButton:WeakRetained];
}

void __58__MFComposeWebView__insertPhotoFromCameraActionWithTitle___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didTapCameraButton:WeakRetained];
}

void __39__MFComposeWebView__scanDocumentAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _scanDocumentCommandInvoked:WeakRetained];
}

void __51__MFComposeWebView__importDocumentActionWithTitle___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _importDocumentCommandInvoked:WeakRetained];
}

void __43__MFComposeWebView__markupActionWithTitle___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didTapInsertDrawingOrMarkupButton:WeakRetained];
}

- (id)_captureTextFromCameraAction
{
  if (a1)
  {
    id v1 = [a1 firstResponder];
    if ([v1 canPerformAction:sel_captureTextFromCamera_ withSender:0])
    {
      id v2 = [MEMORY[0x1E4FB13F0] captureTextFromCameraActionForResponder:v1 identifier:0];
    }
    else
    {
      id v2 = 0;
    }
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

void __43__MFComposeWebView__showWritingToolsAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didTapShowWritingTools:WeakRetained];
}

- (void)_didTapCameraButton:(id)a3
{
  id v5 = a3;
  [(MFComposeWebView *)self donateHasUsedAttachment];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  [WeakRetained showPhotoPickerWithSourceType:1 fromSource:v5];
}

- (void)_didTapMarkupButton:(id)a3
{
  if ([(MFComposeWebView *)self _shouldShowMarkupButton])
  {
    [(MFComposeWebView *)self markupSelectedAttachment];
  }
}

- (void)_didTapInsertPhotoButton:(id)a3
{
  id v5 = a3;
  [(MFComposeWebView *)self donateHasUsedAttachment];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  [WeakRetained showPhotoPickerWithSourceType:0 fromSource:v5];
}

- (void)_didTapInsertDrawingOrMarkupButton:(id)a3
{
  [(MFComposeWebView *)self donateHasUsedAttachment];
  if ([(MFComposeWebView *)self _shouldShowMarkupButton])
  {
    [(MFComposeWebView *)self markupSelectedAttachment];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
    [WeakRetained insertDrawing];
  }
}

- (void)_didTapInsertDrawing:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  [WeakRetained insertDrawing];
}

- (void)_importDocumentCommandInvoked:(id)a3
{
  [(MFComposeWebView *)self donateHasUsedAttachment];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  [WeakRetained importDocument];
}

- (void)_scanDocumentCommandInvoked:(id)a3
{
  [(MFComposeWebView *)self donateHasUsedAttachment];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  [WeakRetained scanDocument];
}

- (void)_removeInlineAttachment:(id)a3
{
  id v13 = a3;
  uint64_t v4 = [(MFComposeWebView *)self undoManager];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 prepareWithInvocationTarget:self];
    id v7 = [v13 fetchDataSynchronously:0];
    uint64_t v8 = [v13 fileName];
    id v9 = [v13 mimeType];
    id v10 = (id)[v6 _addInlineAttachmentWithData:v7 fileName:v8 type:v9 contentID:0];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  uint64_t v12 = [WeakRetained compositionContext];
  [v12 removeAttachment:v13];
}

- (void)_increaseQuoteLevelKeyCommandInvoked:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  [WeakRetained changeQuoteLevel:1];
}

- (void)_decreaseQuoteLevelKeyCommandInvoked:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  [WeakRetained changeQuoteLevel:-1];
}

- (void)_didTapAddLink:(id)a3
{
  uint64_t v4 = [(MFComposeWebView *)self _bodyFieldProxy];
  [v4 setEditLinkFlag];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__MFComposeWebView__didTapAddLink___block_invoke;
  v6[3] = &unk_1E5F7A648;
  void v6[4] = self;
  [WeakRetained addLink:v6];
}

void __35__MFComposeWebView__didTapAddLink___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 length])
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CB10], "ef_urlWithString:", v3);
    if (v4)
    {
      id v5 = [*(id *)(a1 + 32) _bodyFieldProxy];
      id v6 = [v4 ef_urlByAddingSchemeIfNeeded];
      id v7 = [v6 absoluteString];
      [v5 addLink:v7];

      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1792));
      [WeakRetained setHasAddedEditableHyperlink:1];
    }
    else
    {
      id v9 = EMLogCompose();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __35__MFComposeWebView__didTapAddLink___block_invoke_cold_1();
      }
    }
  }
  else
  {
    uint64_t v4 = EMLogCompose();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_1AF945000, v4, OS_LOG_TYPE_DEFAULT, "Adding hyperlink was cancelled.", v10, 2u);
    }
  }
}

- (void)_didTapEditLink:(id)a3
{
  id v4 = a3;
  [(MFComposeWebView *)self hideMakeLinkAccessoryButton];
  id v5 = [(MFComposeWebView *)self _bodyFieldProxy];
  [v5 setEditLinkFlag];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _DWORD v7[2] = __36__MFComposeWebView__didTapEditLink___block_invoke;
  v7[3] = &unk_1E5F7A648;
  void v7[4] = self;
  [WeakRetained editLink:v4 completion:v7];
}

void __36__MFComposeWebView__didTapEditLink___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F1CB10], "ef_urlWithString:", v3);
    if (v4)
    {
      id v5 = [*(id *)(a1 + 32) _bodyFieldProxy];
      id v6 = [v4 ef_urlByAddingSchemeIfNeeded];
      id v7 = [v6 absoluteString];
      [v5 updateLinkFromExistingLink:v7 isEditing:1];
    }
    else
    {
      id v5 = EMLogCompose();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __36__MFComposeWebView__didTapEditLink___block_invoke_cold_1();
      }
    }
  }
  else
  {
    id v4 = EMLogCompose();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_1AF945000, v4, OS_LOG_TYPE_DEFAULT, "Editing hyperlink was cancelled.", v8, 2u);
    }
  }
}

- (void)_didTapRemoveLink
{
  [(MFComposeWebView *)self hideMakeLinkAccessoryButton];
  id v3 = [(MFComposeWebView *)self _bodyFieldProxy];
  [v3 removeLink];
}

- (void)_didTapEditTextDescription:(id)a3
{
  id v4 = a3;
  [(MFComposeWebView *)self hideMakeLinkAccessoryButton];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__MFComposeWebView__didTapEditTextDescription___block_invoke;
  v6[3] = &unk_1E5F7A648;
  void v6[4] = self;
  [WeakRetained editTextDescription:v4 completion:v6];
}

void __47__MFComposeWebView__didTapEditTextDescription___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 length])
  {
    id v4 = [*(id *)(a1 + 32) _bodyFieldProxy];
    [v4 addTextDescriptionToLink:v3];
  }
  else
  {
    id v4 = EMLogCompose();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1AF945000, v4, OS_LOG_TYPE_DEFAULT, "Adding text description to hyperlink was cancelled.", v5, 2u);
    }
  }
}

- (void)_didTapShowWritingTools:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    [(MFComposeWebView *)self showWritingTools:v4];
  }
  else
  {
    id v5 = EMLogCompose();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[MFComposeWebView _didTapShowWritingTools:]();
    }
  }
}

- (void)replaceFilenamePlaceholderWithAttachment:(id)a3 fileName:(id)a4 mimeType:(id)a5 contentID:(id)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = EMLogCompose();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [MEMORY[0x1E4F60E00] partiallyRedactedStringForString:v11];
    *(_DWORD *)buf = 134218498;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2114;
    v33 = v15;
    _os_log_impl(&dword_1AF945000, v14, OS_LOG_TYPE_DEFAULT, "<%p> Replacing placehold with attachment for content ID: %{public}@, file name: %{public}@", buf, 0x20u);
  }
  if (v10
    && v11
    && ([(MFComposeWebView *)self _addInlineAttachmentWithData:v10 fileName:v11 type:v12 contentID:v13], v16 = objc_claimAutoreleasedReturnValue(), (uint64_t v17 = v16) != 0))
  {
    id v18 = [v16 className];
    if (([v18 isEqualToString:0x1F0817B60] & 1) != 0
      || [v18 isEqualToString:0x1F0817BA0])
    {
      id v19 = [(MFComposeWebView *)self _bodyFieldProxy];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __89__MFComposeWebView_replaceFilenamePlaceholderWithAttachment_fileName_mimeType_contentID___block_invoke;
      v30[3] = &unk_1E5F7A6E8;
      v30[4] = self;
      id v31 = v17;
      [v19 replaceFilenamePlaceholderWithImage:v11 completionHandler:v30];
    }
    else
    {
      uint64_t v21 = [(MFComposeWebView *)self _bodyFieldProxy];
      [v21 placeCaretAtStartOfBody];

      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      v33 = __Block_byref_object_copy__3;
      id v34 = __Block_byref_object_dispose__3;
      id v35 = 0;
      id v22 = [v17 fileWrapperUsingFetchedLocalData];
      uint64_t v23 = [v17 mimeType];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __89__MFComposeWebView_replaceFilenamePlaceholderWithAttachment_fileName_mimeType_contentID___block_invoke_2;
      v26[3] = &unk_1E5F7A710;
      v26[4] = self;
      id v29 = buf;
      id v27 = v11;
      id v28 = v17;
      uint64_t v24 = [(MFComposeWebView *)self _insertAttachmentWithFileWrapper:v22 contentType:v23 completion:v26];
      uint64_t v25 = *(void **)(*(void *)&buf[8] + 40);
      *(void *)(*(void *)&buf[8] + 40) = v24;

      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
    uint64_t v17 = EMLogCompose();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v20 = [MEMORY[0x1E4F60E00] partiallyRedactedStringForString:v11];
      -[MFComposeWebView replaceFilenamePlaceholderWithAttachment:fileName:mimeType:contentID:]((uint64_t)v13, v20, buf, v17);
    }
  }
}

void __89__MFComposeWebView_replaceFilenamePlaceholderWithAttachment_fileName_mimeType_contentID___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (v5)
  {
    id v3 = [*(id *)(a1 + 40) contentID];
    [*(id *)(*(void *)(a1 + 32) + 1896) setObject:v3 forKeyedSubscript:v5];
  }
  id v4 = [*(id *)(a1 + 32) mailComposeViewDelegate];
  [v4 didInsertAttachment:*(void *)(a1 + 40)];
}

void __89__MFComposeWebView_replaceFilenamePlaceholderWithAttachment_fileName_mimeType_contentID___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) _addAttachment:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    id v5 = [*(id *)(a1 + 32) _bodyFieldProxy];
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) uniqueIdentifier];
    [v5 replaceFilenamePlaceholderWithAttachment:v3 identifier:v4];

    id v6 = [*(id *)(a1 + 32) mailComposeViewDelegate];
    [v6 didInsertAttachment:*(void *)(a1 + 48)];
  }
}

- (id)_addInlineAttachmentWithData:(id)a3 fileName:(id)a4 type:(id)a5 contentID:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = EMLogCompose();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [MEMORY[0x1E4F60E00] partiallyRedactedStringForString:v11];
    int v25 = 134218498;
    long long v26 = self;
    __int16 v27 = 2114;
    id v28 = v13;
    __int16 v29 = 2114;
    id v30 = v15;
    _os_log_impl(&dword_1AF945000, v14, OS_LOG_TYPE_DEFAULT, "<%p> _addInlineAttachmentWithData for content ID: %{public}@, file name: %{public}@", (uint8_t *)&v25, 0x20u);
  }
  if (objc_msgSend(MEMORY[0x1E4F77B98], "shouldCreatePlaceholderAttachmentForAttachmentWithSize:", objc_msgSend(v10, "length"))&& (objc_msgSend(MEMORY[0x1E4F77B80], "isPlaceholderSerializedRepresentation:", v10) & 1) == 0)
  {
    id v16 = [MEMORY[0x1E4F77B80] attachmentPlaceholderForData:v10 fileName:v11 type:v12 contentID:v13];
    uint64_t v17 = [v16 serializedRepresentation];

    id v10 = (id)v17;
  }
  id v18 = [(MFComposeWebView *)self mailComposeViewDelegate];
  id v19 = [v18 compositionContext];
  id v20 = [v19 addAttachmentData:v10 mimeType:v12 fileName:v11 contentID:v13];

  if (v20)
  {
    [v18 didCreateAttachment:v20];
    uint64_t v21 = [(MFComposeWebView *)self undoManager];
    id v22 = v21;
    if (v21)
    {
      uint64_t v23 = [v21 prepareWithInvocationTarget:self];
      [v23 _removeInlineAttachment:v20];
    }
  }

  return v20;
}

- (id)_makeAttachmentDataWithFileURL:(id)a3 type:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v8 = [v5 path];
  id v9 = [v7 attributesOfItemAtPath:v8 error:0];

  uint64_t v10 = *MEMORY[0x1E4F28390];
  id v11 = [v9 objectForKey:*MEMORY[0x1E4F28390]];

  if (!v11) {
    goto LABEL_4;
  }
  id v12 = [v9 objectForKey:v10];
  uint64_t v13 = [v12 unsignedIntegerValue];

  if (![MEMORY[0x1E4F77B98] shouldCreatePlaceholderAttachmentForAttachmentWithSize:v13]) {
    goto LABEL_4;
  }
  uint64_t v14 = (void *)MEMORY[0x1E4F77B80];
  id v15 = [v5 path];
  id v16 = [v15 lastPathComponent];
  uint64_t v17 = [v14 attachmentPlaceholderForFileURL:v5 fileName:v16 fileSize:v13 type:v6 contentID:0];

  id v18 = [v17 serializedRepresentation];

  if (!v18)
  {
LABEL_4:
    id v18 = [MEMORY[0x1E4F734C0] dataWithContentsOfURL:v5];
  }

  return v18;
}

- (id)_filenameForVideoAttachmentAtURL:(id)a3
{
  id v4 = a3;
  if (bundle_onceToken != -1) {
    dispatch_once(&bundle_onceToken, &__block_literal_global_1139);
  }
  id v5 = (id)bundle_bundle;
  id v6 = [v5 localizedStringForKey:@"VIDEO" value:&stru_1F0817A00 table:@"Main"];

  id v7 = [(MFComposeWebView *)self mailComposeViewDelegate];
  uint64_t v8 = [v7 compositionContext];
  id v9 = [v8 attachments];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __53__MFComposeWebView__filenameForVideoAttachmentAtURL___block_invoke;
  v18[3] = &unk_1E5F7A738;
  id v10 = v6;
  id v19 = v10;
  id v11 = [v9 indexesOfObjectsPassingTest:v18];

  uint64_t v12 = [v11 count];
  if (v12)
  {
    id v13 = [NSString stringWithFormat:@"%@_%lu", v10, v12];
  }
  else
  {
    id v13 = v10;
  }
  uint64_t v14 = v13;
  id v15 = [v4 pathExtension];
  id v16 = [v14 stringByAppendingPathExtension:v15];

  return v16;
}

BOOL __53__MFComposeWebView__filenameForVideoAttachmentAtURL___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 fileName];
  BOOL v4 = [v3 rangeOfString:*(void *)(a1 + 32)] == 0;

  return v4;
}

- (BOOL)_getExtensionAndMimeTypeForImageData:(id)a3 outExtension:(id *)a4 outMimeType:(id *)a5
{
  CFDataRef v7 = (const __CFData *)a3;
  CFDataRef v8 = v7;
  if (v7 && (v9 = CGImageSourceCreateWithData(v7, 0), (id v10 = v9) != 0))
  {
    id v11 = CGImageSourceGetType(v9);
    BOOL v12 = v11 != 0;
    if (v11)
    {
      id v13 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v11];
      *a4 = [v13 preferredFilenameExtension];
      *a5 = [v13 preferredMIMEType];
    }
    CFRelease(v10);
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)_shouldShowAddLinkButton
{
  attachmentsByUniqueIdentifier = self->_attachmentsByUniqueIdentifier;
  uint64_t v3 = [(NSArray *)self->_selectedAttachmentIdentifiers firstObject];
  BOOL v4 = [(NSMutableDictionary *)attachmentsByUniqueIdentifier objectForKeyedSubscript:v3];

  BOOL v5 = !v4 && (_os_feature_enabled_impl() & 1) != 0;
  return v5;
}

- (BOOL)_shouldShowInsertPhotosButton
{
  if (![(MFComposeWebView *)self _sourceIsManaged]) {
    return 1;
  }
  id v2 = [MEMORY[0x1E4F74230] sharedConnection];
  char v3 = [v2 mayOpenFromUnmanagedToManaged];

  return v3;
}

- (BOOL)_shouldShowMarkupButton
{
  attachmentsByUniqueIdentifier = self->_attachmentsByUniqueIdentifier;
  char v3 = [(NSArray *)self->_selectedAttachmentIdentifiers firstObject];
  BOOL v4 = [(NSMutableDictionary *)attachmentsByUniqueIdentifier objectForKeyedSubscript:v3];

  if (v4) {
    char v5 = [v4 contentTypeConformsToMarkup];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (void)_composeWebView:(id)a3 didChangeHeight:(double)a4
{
  if (_os_feature_enabled_impl())
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_composeWebViewDelegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained composeWebView:self didChangeHeight:a4];
    }
  }
}

- (void)_composeWebView:(id)a3 composeBodyIsEmpty:(BOOL)a4
{
  BOOL v4 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_composeWebViewDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained composeWebView:self composeBodyIsEmpty:v4];
  }
}

- (void)composeBodyFieldDidThrowException:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__MFComposeWebView_composeBodyFieldDidThrowException___block_invoke;
  block[3] = &unk_1E5F79088;
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __54__MFComposeWebView_composeBodyFieldDidThrowException___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) raise];
}

- (void)composeBodyFieldDidChange
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_composeWebViewDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained composeWebViewTextChanged:self];
  }
}

- (void)composeBodyFieldIsDirtyChanged:(BOOL)a3
{
  if (!self->_dirtyChangeIgnoreCount) {
    self->_dirtdouble y = a3;
  }
}

- (void)composeBodyFieldAddAttachmentWithData:(id)a3 filename:(id)a4 mimeType:(id)a5 uniqueID:(id)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = EMLogCompose();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [MEMORY[0x1E4F60E00] partiallyRedactedStringForString:v11];
    *(_DWORD *)buf = 138543362;
    uint64_t v23 = v15;
    _os_log_impl(&dword_1AF945000, v14, OS_LOG_TYPE_DEFAULT, "Adding rich link preview [%{public}@]", buf, 0xCu);
  }
  if (v10 && v11 && v13)
  {
    id v16 = [(MFComposeWebView *)self _addInlineAttachmentWithData:v10 fileName:v11 type:v12 contentID:v13];
    if (v16)
    {
      uint64_t v17 = [(MFComposeWebView *)self _bodyFieldProxy];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __85__MFComposeWebView_composeBodyFieldAddAttachmentWithData_filename_mimeType_uniqueID___block_invoke;
      v20[3] = &unk_1E5F7A6E8;
      v20[4] = self;
      id v21 = v16;
      [v17 replaceRichLinkPlaceholderImage:v13 completionHandler:v20];
    }
    else
    {
      id v18 = EMLogCompose();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        id v19 = [MEMORY[0x1E4F60E00] partiallyRedactedStringForString:v11];
        -[MFComposeWebView composeBodyFieldAddAttachmentWithData:filename:mimeType:uniqueID:](v19, buf, v18);
      }
    }
  }
}

void __85__MFComposeWebView_composeBodyFieldAddAttachmentWithData_filename_mimeType_uniqueID___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (v5)
  {
    id v3 = [*(id *)(a1 + 40) contentID];
    [*(id *)(*(void *)(a1 + 32) + 1896) setObject:v3 forKeyedSubscript:v5];
  }
  id v4 = [*(id *)(a1 + 32) mailComposeViewDelegate];
  [v4 didInsertAttachment:*(void *)(a1 + 40)];
}

- (void)composeBodyFieldSelectionContainsLinkStateDidChange:(BOOL)a3
{
  self->_unsigned __int8 selectionContainsLink = a3;
}

- (void)attachmentTapped:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = EMLogCompose();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = v4;
    _os_log_impl(&dword_1AF945000, v5, OS_LOG_TYPE_DEFAULT, "Attachment tapped with content ID: %{public}@", (uint8_t *)&v9, 0xCu);
  }

  id v6 = [MEMORY[0x1E4F77B78] defaultManager];
  CFDataRef v7 = [v6 attachmentForContentID:v4];

  if (!v7)
  {
    id WeakRetained = EMLogCompose();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR)) {
      -[MFComposeWebView attachmentTapped:]();
    }
    goto LABEL_8;
  }
  if ([v7 contentTypeConformsToMarkup])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
    [WeakRetained markupAttachment:v7];
LABEL_8:
  }
}

- (void)composeBodyFieldQuickReplyEnabled:(id)a3
{
  id v4 = (void (**)(id, BOOL))a3;
  v4[2](v4, [(MFComposeWebView *)self isQuickReply]);
}

- (void)composeBodyFieldSmartReplyAvailable:(id)a3
{
}

- (void)composeBodyFieldAddLinkPreviewsEnabled:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  id v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  v4[2](v4, [v3 BOOLForKey:*MEMORY[0x1E4F600E0]] ^ 1);
}

- (void)selectedAttachmentIdentifiersDidChange:(id)a3
{
}

- (void)_findInteraction:(id)a3 navigatorPlacementWillChange:(id)a4
{
  id v5 = objc_msgSend(a4, "inlinePlacement", a3);
  if (v5)
  {
    id v9 = v5;
    double v6 = 0.0;
    if ([v5 isShowing])
    {
      [v9 intrinsicContentSize];
      double v6 = v7;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_composeWebViewDelegate);
    [WeakRetained findNavigatorPanelDidChangeHeight:v6];

    id v5 = v9;
  }
}

- (id)_findInteractionScrollViewForInsetAdjustment:(id)a3
{
  id v3 = [(MFComposeWebView *)self scrollView];

  return v3;
}

- (void)_menuDidHide:(id)a3
{
  self->_shouldShowStandardButtons = 1;
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
}

- (void)_webView:(id)a3 willStartInputSession:(id)a4
{
}

- (int64_t)_webView:(id)a3 decidePolicyForFocusedElement:(id)a4
{
  return 1;
}

- (void)_webView:(id)a3 didStartInputSession:(id)a4
{
  if (self)
  {
    if (self->__didReloadInputAssistantItemOnFocus) {
      return;
    }
    self->__didReloadInputAssistantItemOnFocus = 1;
  }
  id v5 = -[MFComposeWebView _captureTextFromCameraAction](self);
  if (v5)
  {
    double v6 = -[MFComposeWebView _barButtonItemWithAction:target:selector:]((uint64_t)self, v5, self, (uint64_t)sel__captureTextFromCamera);
    double v7 = [(MFComposeWebView *)self insertAttachmentGroup];

    if (v7)
    {
      CFDataRef v8 = (void *)MEMORY[0x1E4F1CA48];
      id v9 = [(MFComposeWebView *)self insertAttachmentGroup];
      id v10 = [v9 barButtonItems];
      uint64_t v11 = [v8 arrayWithArray:v10];

      id v12 = [(MFComposeWebView *)self documentItem];
      if (v12 && [v11 containsObject:v12])
      {
        objc_msgSend(v11, "insertObject:atIndex:", v6, objc_msgSend(v11, "indexOfObject:", v12));
        id v13 = [(MFComposeWebView *)self insertAttachmentGroup];
        [v13 setBarButtonItems:v11];
      }
      else
      {
        id v13 = [v11 arrayByAddingObject:v6];
        uint64_t v14 = [(MFComposeWebView *)self insertAttachmentGroup];
        [v14 setBarButtonItems:v13];
      }
    }
    else
    {
      [(MFComposeWebView *)self setTextFromCameraButtonItem:v6];
    }
  }
  else
  {
    double v6 = EMLogCompose();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v15 = 0;
      _os_log_impl(&dword_1AF945000, v6, OS_LOG_TYPE_DEFAULT, "Text-from-camera button was not added to input assistant.", v15, 2u);
    }
  }
}

- (void)_captureTextFromCamera
{
  [(MFComposeWebView *)self donateHasUsedAttachment];
  id v3 = EMLogCompose();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1AF945000, v3, OS_LOG_TYPE_DEFAULT, "Capturing text from camera", v5, 2u);
  }

  id v4 = [(MFComposeWebView *)self firstResponder];
  if ([v4 canPerformAction:sel_captureTextFromCamera_ withSender:0]) {
    [v4 captureTextFromCamera:0];
  }
}

- (void)_webView:(id)a3 didInvalidateDataForAttachment:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  double v6 = EMLogCompose();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134218242;
    CFDataRef v8 = self;
    __int16 v9 = 2114;
    id v10 = v5;
    _os_log_impl(&dword_1AF945000, v6, OS_LOG_TYPE_DEFAULT, "<%p> Webview did invalidate data for attachment: %{public}@", (uint8_t *)&v7, 0x16u);
  }

  [(MFComposeWebView *)self _removeAttachment:v5];
  [(MFComposeWebView *)self _addAttachment:v5];
}

- (void)_webView:(id)a3 didInsertAttachment:(id)a4 withSource:(id)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = EMLogCompose();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    id v43 = self;
    __int16 v44 = 2114;
    *(void *)id v45 = v6;
    _os_log_impl(&dword_1AF945000, v7, OS_LOG_TYPE_DEFAULT, "<%p> WebView didInsertAttachment: %{public}@", buf, 0x16u);
  }

  CFDataRef v8 = [v6 uniqueIdentifier];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  v33 = [WeakRetained compositionContext];
  uint64_t v9 = 1896;
  id v10 = [(NSMutableDictionary *)self->_attachmentCIDsByIdentifier objectForKeyedSubscript:v8];
  if (v10)
  {
    uint64_t v11 = EMLogCompose();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      id v43 = self;
      __int16 v44 = 2114;
      *(void *)id v45 = v6;
      *(_WORD *)&v45[8] = 2114;
      *(void *)&v45[10] = v10;
      _os_log_impl(&dword_1AF945000, v11, OS_LOG_TYPE_DEFAULT, "<%p> Webview did insert attachment: %{public}@, for content ID: %{public}@", buf, 0x20u);
    }

    [(NSMutableDictionary *)self->_attachmentCIDsByIdentifier setObject:0 forKeyedSubscript:v8];
    id v12 = [v33 attachments];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __60__MFComposeWebView__webView_didInsertAttachment_withSource___block_invoke;
    v40[3] = &unk_1E5F7A760;
    id v13 = v10;
    id v41 = v13;
    uint64_t v14 = objc_msgSend(v12, "ef_firstObjectPassingTest:", v40);

    id v15 = [v6 info];
    id v16 = EMLogCompose();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = objc_msgSend(v14, "ef_publicDescription");
      *(_DWORD *)buf = 134218498;
      id v43 = self;
      __int16 v44 = 2114;
      *(void *)id v45 = v17;
      *(_WORD *)&v45[8] = 2114;
      *(void *)&v45[10] = v15;
      _os_log_impl(&dword_1AF945000, v16, OS_LOG_TYPE_DEFAULT, "<%p> Found attachment %{public}@, for wkAttachment info: %{public}@", buf, 0x20u);
    }
    if (v14)
    {
      id v18 = EMLogCompose();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        id v43 = self;
        __int16 v44 = 2114;
        *(void *)id v45 = v15;
        _os_log_impl(&dword_1AF945000, v18, OS_LOG_TYPE_DEFAULT, "<%p> Loaded attachment with info: %{public}@", buf, 0x16u);
      }

      id v19 = [v14 fileWrapperUsingFetchedLocalData];
      id v20 = [v14 fileUTType];
      [v6 setFileWrapper:v19 contentType:v20 completion:0];

      [(NSMutableDictionary *)self->_attachmentsByUniqueIdentifier setObject:v14 forKeyedSubscript:v8];
      if (_os_feature_enabled_impl()) {
        uint64_t v21 = [v15 shouldPreserveFidelity];
      }
      else {
        uint64_t v21 = 0;
      }
      [v14 setShouldPreserveFidelity:v21];
      [WeakRetained didInsertAttachment:v14];
    }
    else if (!self->_attachmentDataMissingAlertDisplayed)
    {
      long long v26 = [v15 data];
      if (v26 || ([v15 fileWrapper], (long long v26 = objc_claimAutoreleasedReturnValue()) != 0))
      {
      }
      else
      {
        id v30 = [v15 filePath];
        int v32 = [v30 isEqualToString:&stru_1F0817A00];

        if (v32)
        {
          uint64_t v31 = EMLogCompose();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218498;
            id v43 = self;
            __int16 v44 = 2114;
            *(void *)id v45 = v6;
            *(_WORD *)&v45[8] = 2114;
            *(void *)&v45[10] = v13;
            _os_log_error_impl(&dword_1AF945000, v31, OS_LOG_TYPE_ERROR, "<%p> Failed to insert attachment %{public}@, content ID: %{public}@", buf, 0x20u);
          }

          self->_attachmentDataMissingAlertDisplayed = 1;
          if (objc_opt_respondsToSelector()) {
            [WeakRetained showMissingAttachmentDataAlert];
          }
        }
      }
    }

    uint64_t v9 = (uint64_t)&v41;
LABEL_32:

    goto LABEL_33;
  }
  id v22 = EMLogCompose();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    id v43 = self;
    __int16 v44 = 2114;
    *(void *)id v45 = v8;
    _os_log_impl(&dword_1AF945000, v22, OS_LOG_TYPE_DEFAULT, "<%p> Did not find the contentID for identifier: %{public}@, looking into _attachmentsByUniqueIdentifier.", buf, 0x16u);
  }

  uint64_t v23 = [(NSMutableDictionary *)self->_attachmentsByUniqueIdentifier objectForKeyedSubscript:v8];
  id v13 = [v23 contentID];

  if (v13)
  {
    uint64_t v24 = [v33 attachments];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    void v38[2] = __60__MFComposeWebView__webView_didInsertAttachment_withSource___block_invoke_536;
    v38[3] = &unk_1E5F7A760;
    id v39 = v13;
    int v25 = objc_msgSend(v24, "ef_any:", v38);

    uint64_t v9 = (uint64_t)&v39;
  }
  else
  {
    int v25 = 0;
  }
  __int16 v27 = EMLogCompose();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    id v43 = self;
    __int16 v44 = 1024;
    *(_DWORD *)id v45 = v25;
    *(_WORD *)&void v45[4] = 2114;
    *(void *)&v45[6] = v13;
    _os_log_impl(&dword_1AF945000, v27, OS_LOG_TYPE_DEFAULT, "<%p> Found existing: %{BOOL}d contentID: %{public}@ in context", buf, 0x1Cu);
  }

  if ((v25 & 1) == 0)
  {
    [(MFComposeWebView *)self _addAttachment:v6];
    id v28 = [(NSMutableDictionary *)self->_attachmentsByUniqueIdentifier objectForKeyedSubscript:v8];
    if ([v28 isSinglePagePDFFile])
    {
      __int16 v29 = [(MFComposeWebView *)self _bodyFieldProxy];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __60__MFComposeWebView__webView_didInsertAttachment_withSource___block_invoke_537;
      v35[3] = &unk_1E5F7A788;
      v35[4] = self;
      id v36 = v8;
      id v37 = v28;
      [v29 displayAttachmentWithIdentifierAsSinglePagePDF:v36 completionHandler:v35];
    }
  }
  if (v13) {
    goto LABEL_32;
  }
LABEL_33:
}

uint64_t __60__MFComposeWebView__webView_didInsertAttachment_withSource___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 contentID];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __60__MFComposeWebView__webView_didInsertAttachment_withSource___block_invoke_536(uint64_t a1, void *a2)
{
  id v3 = [a2 contentID];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void __60__MFComposeWebView__webView_didInsertAttachment_withSource___block_invoke_537(uint64_t a1, void *a2)
{
  id v4 = a2;
  [*(id *)(*(void *)(a1 + 32) + 1888) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
  id v3 = [*(id *)(a1 + 48) contentID];
  [*(id *)(*(void *)(a1 + 32) + 1896) setObject:v3 forKeyedSubscript:v4];
}

- (void)_webView:(id)a3 didRemoveAttachment:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = EMLogCompose();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134218242;
    CFDataRef v8 = self;
    __int16 v9 = 2114;
    id v10 = v5;
    _os_log_impl(&dword_1AF945000, v6, OS_LOG_TYPE_DEFAULT, "<%p> Webview did remove attachment: %{public}@", (uint8_t *)&v7, 0x16u);
  }

  [(MFComposeWebView *)self _removeAttachment:v5];
}

- (void)_webView:(id)a3 didChangeFontAttributes:(id)a4
{
  id v6 = a4;
  id v5 = [(MFComposeWebView *)self mailComposeViewDelegate];
  if (objc_opt_respondsToSelector()) {
    [v5 composeWebViewDidChangeFontAttributes:v6];
  }
}

- (int64_t)_webView:(id)a3 dataOwnerForDropSession:(id)a4
{
  if ([(MFComposeWebView *)self _sourceIsManaged]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (int64_t)_webView:(id)a3 dataOwnerForDragSession:(id)a4
{
  if ([(MFComposeWebView *)self _sourceIsManaged]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (void)_webView:(id)a3 takeFocus:(int64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  if (a4 == 1) {
    uint64_t v7 = 16;
  }
  else {
    uint64_t v7 = 32;
  }
  id v8 = WeakRetained;
  [WeakRetained takeFocusFromComposeWebView:self inDirection:v7];
}

- (void)willBeginWritingToolsSession:(id)a3 requestContexts:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MFComposeWebView;
  if ([(MFComposeWebView *)&v12 respondsToSelector:sel_willBeginWritingToolsSession_requestContexts_])
  {
    v11.receiver = self;
    v11.super_class = (Class)MFComposeWebView;
    [(MFComposeWebView *)&v11 willBeginWritingToolsSession:v6 requestContexts:v7];
  }
  if (v6)
  {
    id v8 = EMLogCompose();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_1AF945000, v8, OS_LOG_TYPE_DEFAULT, "[Writing Tools] Will begin writing tools session", v10, 2u);
    }

    [(MFComposeWebView *)self _updateAppearanceForWritingToolsSession:1];
  }
  else
  {
    __int16 v9 = EMLogCompose();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_1AF945000, v9, OS_LOG_TYPE_DEFAULT, "[Writing Tools] Will begin writing tools without an active session", v10, 2u);
    }
  }
}

- (void)writingToolsSession:(id)a3 didReceiveAction:(int64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MFComposeWebView;
  if ([(MFComposeWebView *)&v10 respondsToSelector:sel_writingToolsSession_didReceiveAction_])
  {
    v9.receiver = self;
    v9.super_class = (Class)MFComposeWebView;
    [(MFComposeWebView *)&v9 writingToolsSession:v6 didReceiveAction:a4];
  }
  if (a4 == 3)
  {
    id v7 = EMLogCompose();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1AF945000, v7, OS_LOG_TYPE_DEFAULT, "[Writing Tools] Did receive writing tools restart action", v8, 2u);
    }

    [(MFComposeWebView *)self _updateAppearanceForWritingToolsSession:1];
  }
}

- (void)compositionSession:(id)a3 didReceiveText:(id)a4 replacementRange:(_NSRange)a5 inContext:(id)a6 finished:(BOOL)a7
{
  BOOL v7 = a7;
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)MFComposeWebView;
  if ([(MFComposeWebView *)&v19 respondsToSelector:sel_compositionSession_didReceiveText_replacementRange_inContext_finished_])
  {
    v18.receiver = self;
    v18.super_class = (Class)MFComposeWebView;
    -[MFComposeWebView compositionSession:didReceiveText:replacementRange:inContext:finished:](&v18, sel_compositionSession_didReceiveText_replacementRange_inContext_finished_, v13, v14, location, length, v15, v7);
  }
  if (v7)
  {
    id v16 = EMLogCompose();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_1AF945000, v16, OS_LOG_TYPE_DEFAULT, "[Writing Tools] Did finish receiving text", v17, 2u);
    }

    [(MFComposeWebView *)self _updateAppearanceForWritingToolsSession:0];
  }
}

- (void)proofreadingSession:(id)a3 didReceiveSuggestions:(id)a4 processedRange:(_NSRange)a5 inContext:(id)a6 finished:(BOOL)a7
{
  BOOL v7 = a7;
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)MFComposeWebView;
  if ([(MFComposeWebView *)&v19 respondsToSelector:sel_proofreadingSession_didReceiveSuggestions_processedRange_inContext_finished_])
  {
    v18.receiver = self;
    v18.super_class = (Class)MFComposeWebView;
    -[MFComposeWebView proofreadingSession:didReceiveSuggestions:processedRange:inContext:finished:](&v18, sel_proofreadingSession_didReceiveSuggestions_processedRange_inContext_finished_, v13, v14, location, length, v15, v7);
  }
  if (v7)
  {
    id v16 = EMLogCompose();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_1AF945000, v16, OS_LOG_TYPE_DEFAULT, "[Writing Tools] Did finish proofreading session", v17, 2u);
    }

    [(MFComposeWebView *)self _updateAppearanceForWritingToolsSession:0];
  }
}

- (void)didEndWritingToolsSession:(id)a3 accepted:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MFComposeWebView;
  if ([(MFComposeWebView *)&v10 respondsToSelector:sel_didEndWritingToolsSession_accepted_])
  {
    v9.receiver = self;
    v9.super_class = (Class)MFComposeWebView;
    [(MFComposeWebView *)&v9 didEndWritingToolsSession:v6 accepted:v4];
  }
  BOOL v7 = EMLogCompose();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_1AF945000, v7, OS_LOG_TYPE_DEFAULT, "[Writing Tools] Did end writing tools session", v8, 2u);
  }

  [(MFComposeWebView *)self _updateAppearanceForWritingToolsSession:0];
}

- (void)_updateAppearanceForWritingToolsSession:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_composeWebViewDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained composeWebView:self hasActiveWritingToolsSession:v3];
  }
}

- (void)_addAttachment:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = EMLogCompose();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    id v39 = self;
    __int16 v40 = 2114;
    id v41 = v4;
    _os_log_impl(&dword_1AF945000, v5, OS_LOG_TYPE_DEFAULT, "<%p> Adding attachment: %{public}@", buf, 0x16u);
  }

  id v36 = [v4 uniqueIdentifier];
  id v6 = [v4 info];
  BOOL v7 = v6;
  if (v6)
  {
    id v8 = [v6 name];
    objc_super v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      objc_super v11 = [v7 filePath];
      id v10 = [v11 lastPathComponent];
    }
    objc_super v12 = [v7 contentType];
    if (v12)
    {
      id v13 = [MEMORY[0x1E4F442D8] typeWithMIMEType:v12];
      id v14 = v13;
      if (v13)
      {
        id v15 = v13;
      }
      else
      {
        id v15 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v12];
      }
      id v16 = v15;
    }
    else
    {
      id v16 = 0;
    }
    if ([v16 conformsToType:*MEMORY[0x1E4F443C8]])
    {
      uint64_t v17 = [v10 stringByAppendingString:@".zip"];

      objc_super v18 = [v7 data];
      if (v18)
      {
        id v19 = 0;
      }
      else
      {
        int v25 = (void *)MEMORY[0x1E4F1CB10];
        long long v26 = [v7 filePath];
        __int16 v27 = [v25 fileURLWithPath:v26 isDirectory:1];

        id v28 = [MEMORY[0x1E4F77BB0] archive];
        id v37 = 0;
        objc_super v18 = [v28 compressFolder:v27 error:&v37];
        id v19 = v37;
      }
      if (v19 || !v18)
      {
        __int16 v29 = EMLogCompose();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          id v30 = objc_msgSend(v19, "ef_publicDescription");
          [(MFComposeWebView *)v30 _addAttachment:v29];
        }
      }
      uint64_t v23 = @"application/zip";
    }
    else
    {
      uint64_t v20 = [v16 preferredMIMEType];
      uint64_t v21 = (void *)v20;
      id v22 = @"application/octet-stream";
      if (v20) {
        id v22 = (__CFString *)v20;
      }
      uint64_t v23 = v22;

      uint64_t v24 = [v7 data];
      id v19 = v24;
      if (v24)
      {
        id v19 = v24;
        objc_super v18 = v19;
      }
      else
      {
        uint64_t v31 = (void *)MEMORY[0x1E4F1C9B8];
        int v32 = [v7 filePath];
        objc_super v18 = [v31 dataWithContentsOfFile:v32 options:3 error:0];
      }
      uint64_t v17 = v10;
    }

    if (v18)
    {
      if (_os_feature_enabled_impl()) {
        uint64_t v33 = [v7 shouldPreserveFidelity];
      }
      else {
        uint64_t v33 = 0;
      }
      id v34 = [(MFComposeWebView *)self _addInlineAttachmentWithData:v18 fileName:v17 type:v23 contentID:0];
      [v34 setShouldPreserveFidelity:v33];
      [(NSMutableDictionary *)self->_attachmentsByUniqueIdentifier setObject:v34 forKeyedSubscript:v36];
      id v35 = [(MFComposeWebView *)self mailComposeViewDelegate];
      [v35 didInsertAttachment:v34];
    }
  }
}

- (void)_removeAttachment:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 uniqueIdentifier];
  id v6 = [(NSMutableDictionary *)self->_attachmentsByUniqueIdentifier objectForKeyedSubscript:v5];
  BOOL v7 = [v6 contentID];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  objc_super v9 = [WeakRetained compositionContext];

  id v10 = EMLogCompose();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    id v19 = self;
    __int16 v20 = 2114;
    id v21 = v4;
    __int16 v22 = 2114;
    uint64_t v23 = v7;
    _os_log_impl(&dword_1AF945000, v10, OS_LOG_TYPE_DEFAULT, "<%p> Removing attachment: %{public}@, content ID: %{public}@", buf, 0x20u);
  }

  if (!self->_isFinishing)
  {
    if (v7)
    {
      objc_super v11 = [v9 contentVariationAttachmentCID];
      char v12 = [v7 isEqualToString:v11];

      if ((v12 & 1) == 0)
      {
        id v13 = [v9 attachments];
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __38__MFComposeWebView__removeAttachment___block_invoke;
        v16[3] = &unk_1E5F7A760;
        id v17 = v7;
        id v14 = objc_msgSend(v13, "ef_firstObjectPassingTest:", v16);

        if (v14)
        {
          [v9 removeAttachment:v14];
          id v15 = [(MFComposeWebView *)self mailComposeViewDelegate];
          [v15 didRemoveAttachment:v14];
        }
        [(NSMutableDictionary *)self->_attachmentsByUniqueIdentifier removeObjectForKey:v5];
      }
    }
  }
}

uint64_t __38__MFComposeWebView__removeAttachment___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 contentID];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (BOOL)_sourceIsManaged
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mailComposeViewDelegate);
  BOOL v3 = [WeakRetained compositionContext];
  BOOL v4 = [v3 sourceAccountManagement] == 2;

  return v4;
}

- (void)donateHasUsedAttachment
{
}

- (MFComposeWebViewDelegate)composeWebViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_composeWebViewDelegate);

  return (MFComposeWebViewDelegate *)WeakRetained;
}

- (void)setComposeWebViewDelegate:(id)a3
{
}

- (BOOL)isQuickReply
{
  return self->_isQuickReply;
}

- (void)setIsQuickReply:(BOOL)a3
{
  self->_isQuickRepldouble y = a3;
}

- (MFMailComposeCoordinator)composeCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_composeCoordinator);

  return (MFMailComposeCoordinator *)WeakRetained;
}

- (void)setComposeCoordinator:(id)a3
{
}

- (UIView)inputViewForPreservingFocus
{
  return self->_inputViewForPreservingFocus;
}

- (void)setInputViewForPreservingFocus:(id)a3
{
}

- (UIBarButtonItem)textFromCameraButtonItem
{
  return self->_textFromCameraButtonItem;
}

- (void)setTextFromCameraButtonItem:(id)a3
{
}

- (UIBarButtonItemGroup)insertAttachmentGroup
{
  return self->_insertAttachmentGroup;
}

- (void)setInsertAttachmentGroup:(id)a3
{
}

- (UIBarButtonItem)documentItem
{
  return self->_documentItem;
}

- (void)setDocumentItem:(id)a3
{
}

- (NSMutableDictionary)richLinkActivityIndicators
{
  return self->_richLinkActivityIndicators;
}

- (void)setRichLinkActivityIndicators:(id)a3
{
}

- (MSInputContextHistory)previousInputContextHistory
{
  return self->_previousInputContextHistory;
}

- (void)setPreviousInputContextHistory:(id)a3
{
}

- (UIBarButtonItemGroup)appleIntelligenceGroup
{
  return self->_appleIntelligenceGroup;
}

- (void)setAppleIntelligenceGroup:(id)a3
{
}

- (NSArray)_leadingInputAssistantItemGroups
{
  return self->__leadingInputAssistantItemGroups;
}

- (void)set_leadingInputAssistantItemGroups:(id)a3
{
}

- (NSArray)_trailingInputAssistantItemGroups
{
  return self->__trailingInputAssistantItemGroups;
}

- (void)set_trailingInputAssistantItemGroups:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__trailingInputAssistantItemGroups, 0);
  objc_storeStrong((id *)&self->__leadingInputAssistantItemGroups, 0);
  objc_storeStrong((id *)&self->_appleIntelligenceGroup, 0);
  objc_storeStrong((id *)&self->_previousInputContextHistory, 0);
  objc_storeStrong((id *)&self->_richLinkActivityIndicators, 0);
  objc_storeStrong((id *)&self->_documentItem, 0);
  objc_storeStrong((id *)&self->_insertAttachmentGroup, 0);
  objc_storeStrong((id *)&self->_textFromCameraButtonItem, 0);
  objc_storeStrong((id *)&self->_inputViewForPreservingFocus, 0);
  objc_destroyWeak((id *)&self->_composeCoordinator);
  objc_destroyWeak((id *)&self->_composeWebViewDelegate);
  objc_storeStrong((id *)&self->_makeLinkAccessoryButton, 0);
  objc_storeStrong((id *)&self->_originalAttachmentWrappers, 0);
  objc_storeStrong((id *)&self->_attachmentCIDsByIdentifier, 0);
  objc_storeStrong((id *)&self->_attachmentsByUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_selectedAttachmentIdentifiers, 0);
  objc_storeStrong((id *)&self->_richLinkGeneratorInterface, 0);
  objc_storeStrong((id *)&self->_bodyFieldObserverInterface, 0);
  objc_storeStrong((id *)&self->_bodyFieldProxy, 0);
  objc_storeStrong((id *)&self->_signatureControllerProxy, 0);
  objc_storeStrong((id *)&self->_compositionContextID, 0);

  objc_destroyWeak((id *)&self->_mailComposeViewDelegate);
}

void __46__MFComposeWebView__basicWebViewConfiguration__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_1AF945000, log, OS_LOG_TYPE_ERROR, "sURLCacheBlock hasn't been set yet", v1, 2u);
}

- (void)insertDocumentWithData:fileName:mimeType:contentID:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1AF945000, v0, v1, "Failed to attach document with content ID %{public}@", v2, v3, v4, v5, v6);
}

- (void)replaceAttachment:withDocumentAtURL:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1AF945000, v0, v1, "#Attachments Failed to create replacement fileName [%@]", v2, v3, v4, v5, v6);
}

void __35__MFComposeWebView__didTapAddLink___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1AF945000, v0, v1, "Skip adding a link because it is invalid %@", v2, v3, v4, v5, v6);
}

void __36__MFComposeWebView__didTapEditLink___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1AF945000, v0, v1, "Skip editing a link because it is invalid %@", v2, v3, v4, v5, v6);
}

- (void)_didTapShowWritingTools:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1AF945000, v0, v1, "<%p> [Writing Tools] Unable to show Writing Tools panel", v2, v3, v4, v5, v6);
}

- (void)replaceFilenamePlaceholderWithAttachment:(uint64_t)a1 fileName:(void *)a2 mimeType:(uint8_t *)buf contentID:(os_log_t)log .cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1AF945000, log, OS_LOG_TYPE_ERROR, "Failed to attach item with content ID: %{public}@, file name: %{public}@", buf, 0x16u);
}

- (void)composeBodyFieldAddAttachmentWithData:(os_log_t)log filename:mimeType:uniqueID:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1AF945000, log, OS_LOG_TYPE_ERROR, "Failed to attach rich link preview [%{public}@]", buf, 0xCu);
}

- (void)attachmentTapped:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1AF945000, v0, v1, "Unable to find attachment for CID: %@", v2, v3, v4, v5, v6);
}

- (void)_addAttachment:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1AF945000, log, OS_LOG_TYPE_ERROR, "Failed to load folder: %{public}@", buf, 0xCu);
}

@end