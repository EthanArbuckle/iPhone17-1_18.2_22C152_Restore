@interface CKMessageEntryRichTextView
- (BOOL)_reconfigureWithLayoutManager:(id)a3 triggeredByLayoutManagerAccess:(BOOL)a4 triggeringSelector:(SEL)a5;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)canPerformDictationAction:(id)a3;
- (BOOL)canResignFirstResponder;
- (BOOL)disableAttachments;
- (BOOL)disableKeyboardStickers;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)handleTapOrLongPressOnMediaObjectForTransferGUID:(id)a3 characterIndex:(int64_t)a4 location:(CGPoint)a5 touchedCharacterFrame:(CGRect)a6;
- (BOOL)isSingleLineDocument;
- (BOOL)shouldPreserveAdaptiveImageGlyphsInCompositionText;
- (BOOL)supportsAdaptiveImageGlyph;
- (BOOL)supportsCustomizationForLinkPreviewTextAttachment:(id)a3;
- (CKMessageEntryRichTextView)initWithFrame:(CGRect)a3 usingTextLayoutManager:(BOOL)a4 shouldDisableAttachments:(BOOL)a5 shouldDisableKeyboardStickers:(BOOL)a6;
- (NSMutableDictionary)composeImages;
- (NSMutableDictionary)embeddedRichLinkConfigurations;
- (NSMutableDictionary)mediaObjects;
- (NSMutableDictionary)pluginDisplayContainers;
- (_NSRange)_rangeFromUITextRange:(id)a3;
- (char)balloonColor;
- (double)maxWidthForLinkPreviewTextAttachment:(id)a3;
- (id)_compositionFromSelection;
- (id)_messagesReplacementTextForWritingToolText:(id)a3;
- (id)adaptiveImageGlyphForTransferGUID:(id)a3;
- (id)attributedTextForCompositionText:(id)a3;
- (id)cachedMediaObjectForTransferGUID:(id)a3;
- (id)cachedPluginDisplayContainerForGUID:(id)a3;
- (id)composeImageForTransferGUID:(id)a3 traitCollection:(id)a4;
- (id)compositionText;
- (id)existingMediaObjectMatchingAdaptiveImageGlyph:(id)a3;
- (id)mediaObjectForAdaptiveImageGlyph:(id)a3;
- (id)pasteConfiguration;
- (id)pasteboard;
- (id)targetForAction:(SEL)a3 withSender:(id)a4;
- (void)_adaptiveImageGlyphWasGeneratedNotification:(id)a3;
- (void)_ck_beginPasteOperationAndPasteAsRichText:(BOOL)a3;
- (void)_showCustomInputView;
- (void)_updateTextContentForRichLinkInteractionType:(int64_t)a3 onTextAttachment:(id)a4;
- (void)copy:(id)a3;
- (void)correctedTypedText:(id)a3 rangeOfReplacement:(id)a4;
- (void)cut:(id)a3;
- (void)dealloc;
- (void)handlePastedString:(id)a3 toRange:(id)a4;
- (void)handleTapOrLongPress:(id)a3;
- (void)inlineMediaViewTextAttachmentDidRequestGenerativeInteraction:(id)a3;
- (void)insertAdaptiveImageGlyph:(id)a3 replacementRange:(id)a4;
- (void)insertAdaptiveImageGlyph:(id)a3 withMediaObject:(id)a4;
- (void)linkPreviewTextAttachment:(id)a3 didAddPluginEntryViewControllerToViewHierarchy:(id)a4;
- (void)linkPreviewTextAttachment:(id)a3 didSelectInteractionType:(int64_t)a4;
- (void)linkPreviewTextAttachment:(id)a3 willAddPluginEntryViewControllerToViewHierarchy:(id)a4;
- (void)linkPreviewTextAttachmentDidDismissCustomizationPicker:(id)a3;
- (void)linkPreviewTextAttachmentDidPresentCustomizationPicker:(id)a3;
- (void)linkPreviewTextAttachmentDidUpdateTextAttachmentSize:(id)a3;
- (void)linkPreviewTextAttachmentWillDismissCustomizationPicker:(id)a3;
- (void)linkPreviewTextAttachmentWillPresentCustomizationPicker:(id)a3;
- (void)paste:(id)a3;
- (void)pasteAndMatchStyle:(id)a3;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)previewDidChange:(id)a3;
- (void)replaceTextInRange:(_NSRange)a3 withLinks:(id)a4;
- (void)setAttributedText:(id)a3;
- (void)setBalloonColor:(char)a3;
- (void)setComposeImages:(id)a3;
- (void)setCompositionText:(id)a3;
- (void)setDisableAttachments:(BOOL)a3;
- (void)setDisableKeyboardStickers:(BOOL)a3;
- (void)setEmbeddedRichLinkConfigurations:(id)a3;
- (void)setMediaObjects:(id)a3;
- (void)setPluginDisplayContainers:(id)a3;
- (void)textStorage:(id)a3 willProcessEditing:(unint64_t)a4 range:(_NSRange)a5 changeInLength:(int64_t)a6;
- (void)updateContentsOfFileTransferPreviews;
- (void)validateCommand:(id)a3;
- (void)writingToolsCoordinator:(id)a3 replaceRange:(_NSRange)a4 inContext:(id)a5 proposedText:(id)a6 reason:(int64_t)a7 animationParameters:(id)a8 completion:(id)a9;
@end

@implementation CKMessageEntryRichTextView

- (CKMessageEntryRichTextView)initWithFrame:(CGRect)a3 usingTextLayoutManager:(BOOL)a4 shouldDisableAttachments:(BOOL)a5 shouldDisableKeyboardStickers:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (a4)
  {
    v26.receiver = self;
    v26.super_class = (Class)CKMessageEntryRichTextView;
    v13 = -[CKMessageEntryTextView initUsingTextLayoutManagerWithFrame:](&v26, sel_initUsingTextLayoutManagerWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    v14 = [(CKMessageEntryRichTextView *)v13 textContainer];
    objc_msgSend(v14, "setSize:", width, 1.79769313e308);

    v15 = [(CKMessageEntryRichTextView *)v13 textContainer];
    [v15 setWidthTracksTextView:1];

    if ([(CKMessageEntryRichTextView *)v13 isScrollEnabled]) {
      goto LABEL_8;
    }
    id v16 = [(CKMessageEntryRichTextView *)v13 textContainer];
    [v16 setHeightTracksTextView:1];
  }
  else
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4FB08B8]);
    id v17 = objc_alloc_init(MEMORY[0x1E4FB0880]);
    objc_msgSend(v17, "setSize:", width, 1.79769313e308);
    [v17 setWidthTracksTextView:1];
    if (([(CKMessageEntryRichTextView *)self isScrollEnabled] & 1) == 0) {
      [v17 setHeightTracksTextView:1];
    }
    v18 = objc_alloc_init(CKTextEntryLayoutManager);
    [(CKTextEntryLayoutManager *)v18 setAllowsNonContiguousLayout:1];
    [(CKTextEntryLayoutManager *)v18 addTextContainer:v17];
    [v16 addLayoutManager:v18];
    v27.receiver = self;
    v27.super_class = (Class)CKMessageEntryRichTextView;
    v13 = -[CKMessageEntryTextView initWithFrame:textContainer:](&v27, sel_initWithFrame_textContainer_, v17, x, y, width, height);
  }
LABEL_8:
  if (v13)
  {
    v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v19 addObserver:v13 selector:sel_previewDidChange_ name:@"CKPreviewDidChangeNotification" object:0];
    [v19 addObserver:v13 selector:sel_previewDidChange_ name:@"CKRichIconDidChangeNotification" object:0];
    [v19 addObserver:v13 selector:sel__adaptiveImageGlyphWasGeneratedNotification_ name:@"CKAdaptiveImageGlyphGeneratedNotification" object:0];
    v20 = [(CKMessageEntryRichTextView *)v13 textStorage];
    [v20 setDelegate:v13];

    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(CKMessageEntryRichTextView *)v13 setMediaObjects:v21];
    id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(CKMessageEntryRichTextView *)v13 setPluginDisplayContainers:v22];
    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(CKMessageEntryRichTextView *)v13 setEmbeddedRichLinkConfigurations:v23];
    id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(CKMessageEntryRichTextView *)v13 setComposeImages:v24];
    [(CKMessageEntryTextView *)v13 setAllowCalloutActions:1];
    [(CKMessageEntryRichTextView *)v13 setDisableAttachments:v7];
    [(CKMessageEntryRichTextView *)v13 setDisableKeyboardStickers:v6];
  }
  return v13;
}

- (void)setPluginDisplayContainers:(id)a3
{
}

- (void)setMediaObjects:(id)a3
{
}

- (void)setEmbeddedRichLinkConfigurations:(id)a3
{
}

- (void)setDisableKeyboardStickers:(BOOL)a3
{
  self->_disableKeyboardStickers = a3;
}

- (void)setDisableAttachments:(BOOL)a3
{
  self->_disableAttachments = a3;
}

- (void)setComposeImages:(id)a3
{
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CKMessageEntryRichTextView;
  [(CKMessageEntryTextView *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composeImages, 0);
  objc_storeStrong((id *)&self->_embeddedRichLinkConfigurations, 0);
  objc_storeStrong((id *)&self->_pluginDisplayContainers, 0);

  objc_storeStrong((id *)&self->_mediaObjects, 0);
}

- (id)pasteConfiguration
{
  v3 = +[CKUIBehavior sharedBehaviors];
  objc_super v4 = objc_msgSend(v3, "pasteConfigurationDisablingKeyboardStickers:", -[CKMessageEntryRichTextView disableKeyboardStickers](self, "disableKeyboardStickers"));

  return v4;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (![(CKMessageEntryTextView *)self allowCalloutActions])
  {
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        id v22 = "-[CKMessageEntryRichTextView canPerformAction:withSender:]";
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "%s callouts disabled", buf, 0xCu);
      }
    }
    goto LABEL_9;
  }
  if (sel_paste_ != a3)
  {
    if (sel_delete_ == a3)
    {
      v18 = [(CKMessageEntryRichTextView *)self selectedTextRange];
      if ([v18 isEmpty])
      {
        LOBYTE(v7) = 0;
      }
      else
      {
        v20.receiver = self;
        v20.super_class = (Class)CKMessageEntryRichTextView;
        LOBYTE(v7) = [(CKMessageEntryRichTextView *)&v20 canPerformAction:a3 withSender:v6];
      }
    }
    else
    {
      v19.receiver = self;
      v19.super_class = (Class)CKMessageEntryRichTextView;
      LOBYTE(v7) = [(CKMessageEntryRichTextView *)&v19 canPerformAction:a3 withSender:v6];
    }
    goto LABEL_10;
  }
  if ([(CKMessageEntryRichTextView *)self disableAttachments])
  {
    v10 = [(CKMessageEntryRichTextView *)self pasteboard];
    char v11 = [v10 hasImages];

    if (v11)
    {
LABEL_9:
      LOBYTE(v7) = 0;
      goto LABEL_10;
    }
  }
  v12 = [(CKMessageEntryRichTextView *)self pasteboard];
  int v7 = objc_msgSend(v12, "__ck_canCreateComposition");

  if (IMOSLoggingEnabled())
  {
    v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a3);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      if (v7) {
        v15 = @"YES";
      }
      else {
        v15 = @"NO";
      }
      id v16 = [(CKMessageEntryRichTextView *)self pasteboard];
      id v17 = [v16 itemProviders];
      *(_DWORD *)buf = 136315906;
      id v22 = "-[CKMessageEntryRichTextView canPerformAction:withSender:]";
      __int16 v23 = 2112;
      id v24 = v14;
      __int16 v25 = 2112;
      objc_super v26 = v15;
      __int16 v27 = 2112;
      v28 = v17;
      _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "%s %@ - %@ - %@", buf, 0x2Au);
    }
  }
LABEL_10:

  return v7;
}

- (void)validateCommand:(id)a3
{
  id v4 = a3;
  if ((char *)[v4 action] == sel_paste_)
  {
    objc_msgSend(v4, "setAttributes:", objc_msgSend(v4, "attributes") & 0xFFFFFFFFFFFFFFFELL);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CKMessageEntryRichTextView;
    [(CKMessageEntryRichTextView *)&v5 validateCommand:v4];
  }
}

- (BOOL)canResignFirstResponder
{
  v2 = self;
  v3 = [(CKMessageEntryRichTextView *)self delegate];
  LOBYTE(v2) = [v3 messageEntryRichTextViewShouldResignFirstResponder:v2];

  return (char)v2;
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if ([(CKMessageEntryTextView *)self preventShowingCalloutMenu])
  {
    int v7 = 0;
  }
  else if (sel_delete_ == a3)
  {
    v8 = [(CKMessageEntryRichTextView *)self selectedTextRange];
    if ([v8 isEmpty])
    {
      int v7 = 0;
    }
    else
    {
      v11.receiver = self;
      v11.super_class = (Class)CKMessageEntryRichTextView;
      int v7 = [(CKMessageEntryRichTextView *)&v11 targetForAction:a3 withSender:v6];
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CKMessageEntryRichTextView;
    int v7 = [(CKMessageEntryRichTextView *)&v10 targetForAction:a3 withSender:v6];
  }

  return v7;
}

- (id)pasteboard
{
  return (id)[MEMORY[0x1E4F42C50] generalPasteboard];
}

- (BOOL)isSingleLineDocument
{
  v3.receiver = self;
  v3.super_class = (Class)CKMessageEntryRichTextView;
  return [(CKMessageEntryRichTextView *)&v3 isSingleLineDocument];
}

- (void)copy:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CKMessageEntryRichTextView;
  [(CKMessageEntryRichTextView *)&v7 copy:a3];
  id v4 = [(CKMessageEntryRichTextView *)self _compositionFromSelection];
  objc_super v5 = [(CKMessageEntryRichTextView *)self pasteboard];
  id v6 = [v4 pasteboardItemProviders];
  [v5 setItemProviders:v6];
}

- (void)cut:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(CKMessageEntryRichTextView *)self _compositionFromSelection];
  id v6 = [v5 pasteboardItemProviders];
  v8.receiver = self;
  v8.super_class = (Class)CKMessageEntryRichTextView;
  [(CKMessageEntryRichTextView *)&v8 cut:v4];

  objc_super v7 = [(CKMessageEntryRichTextView *)self pasteboard];
  [v7 setItemProviders:v6];
}

- (id)_compositionFromSelection
{
  objc_super v3 = [(CKMessageEntryRichTextView *)self compositionText];
  uint64_t v4 = [(CKMessageEntryRichTextView *)self selectedRange];
  id v6 = objc_msgSend(v3, "attributedSubstringFromRange:", v4, v5);

  objc_super v7 = [[CKComposition alloc] initWithText:v6 subject:0];

  return v7;
}

- (void)handlePastedString:(id)a3 toRange:(id)a4
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = [(CKMessageEntryRichTextView *)self _rangeFromUITextRange:a4];
    uint64_t v9 = v8;
    [(CKMessageEntryRichTextView *)self unmarkText];
    if (!CKIsRunningInMacCatalyst())
    {
      objc_super v10 = CKFrameworkBundle();
      objc_super v11 = [v10 localizedStringForKey:@"PASTE" value:&stru_1EDE4CA38 table:@"ChatKit"];
      [(CKMessageEntryRichTextView *)self _registerUndoOperationForReplacementWithActionName:v11 replacementText:v6];
    }
    v12 = [(CKMessageEntryRichTextView *)self attributedText];
    v13 = (void *)[v12 mutableCopy];

    objc_msgSend(v13, "replaceCharactersInRange:withAttributedString:", v7, v9, v6);
    v15[0] = v7;
    v15[1] = v9;
    id v14 = CKSeparatedTextForTextInView(v13, (uint64_t)v15, 0);
    [(CKMessageEntryRichTextView *)self setAttributedText:v14];

    -[CKMessageEntryRichTextView setSelectedRange:](self, "setSelectedRange:", [v6 length] + v15[0], 0);
  }
}

- (void)paste:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Begin call to paste:", v6, 2u);
    }
  }
  [(CKMessageEntryRichTextView *)self _ck_beginPasteOperationAndPasteAsRichText:1];
}

- (void)pasteAndMatchStyle:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Begin call to pasteAndMatchStyle:", v6, 2u);
    }
  }
  [(CKMessageEntryRichTextView *)self _ck_beginPasteOperationAndPasteAsRichText:0];
}

- (void)_ck_beginPasteOperationAndPasteAsRichText:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v14 = "-[CKMessageEntryRichTextView _ck_beginPasteOperationAndPasteAsRichText:]";
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
    }
  }
  id v6 = objc_alloc_init(_TtC7ChatKit27CKCompositionBuilderContext);
  -[CKCompositionBuilderContext setIsInLockdownMode:](v6, "setIsInLockdownMode:", [MEMORY[0x1E4F6E730] deviceIsLockedDown]);
  [(CKCompositionBuilderContext *)v6 setIsPastingAfterBracketCharacter:[(UITextView *)self ck_isCursorDirectlyAfterBracketCharacter]];
  [(CKCompositionBuilderContext *)v6 setCanUseRichTextAttributes:v3];
  uint64_t v7 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v8 = [v7 isExpressiveTextEnabled];

  if (v8) {
    [(CKCompositionBuilderContext *)v6 setSupportsExpressiveText:[(CKMessageEntryTextView *)self isExpressiveTextEnabled]];
  }
  uint64_t v9 = [(CKMessageEntryRichTextView *)self delegate];
  uint64_t v10 = [v9 messageEntryRichTextViewSupportsInlineAdaptiveImageGlyphs:self];

  [(CKCompositionBuilderContext *)v6 setConversationSupportsInlineAdaptiveImageGlyphs:v10];
  objc_super v11 = [(CKMessageEntryRichTextView *)self pasteboard];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__CKMessageEntryRichTextView__ck_beginPasteOperationAndPasteAsRichText___block_invoke;
  v12[3] = &unk_1E5621AF8;
  v12[4] = self;
  objc_msgSend(v11, "__ck_compositionWithContext:completionHandler:", v6, v12);
}

void __72__CKMessageEntryRichTextView__ck_beginPasteOperationAndPasteAsRichText___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = [*(id *)(a1 + 32) delegate];
    [v7 messageEntryRichTextView:*(void *)(a1 + 32) didPasteComposition:v5];

    int v8 = *(void **)(a1 + 32);
    uint64_t v9 = [v5 text];
    uint64_t v10 = [v8 attributedTextForCompositionText:v9];

    if (v10)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      void v15[2] = __72__CKMessageEntryRichTextView__ck_beginPasteOperationAndPasteAsRichText___block_invoke_2;
      v15[3] = &unk_1E5620AF8;
      id v11 = v10;
      uint64_t v12 = *(void *)(a1 + 32);
      id v16 = v11;
      uint64_t v17 = v12;
      dispatch_async(MEMORY[0x1E4F14428], v15);
    }
    else if (IMOSLoggingEnabled())
    {
      id v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        objc_super v19 = "-[CKMessageEntryRichTextView _ck_beginPasteOperationAndPasteAsRichText:]_block_invoke";
        _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "%s Got nil attributed text for pasteboard composition", buf, 0xCu);
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      objc_super v19 = "-[CKMessageEntryRichTextView _ck_beginPasteOperationAndPasteAsRichText:]_block_invoke";
      _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "%s - got nil pasteboard composition", buf, 0xCu);
    }
  }
}

void __72__CKMessageEntryRichTextView__ck_beginPasteOperationAndPasteAsRichText___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v9 = "-[CKMessageEntryRichTextView _ck_beginPasteOperationAndPasteAsRichText:]_block_invoke_2";
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "%s - Pasting rich text", buf, 0xCu);
    }
  }
  uint64_t v3 = *(void *)(a1 + 32);
  v7.receiver = *(id *)(a1 + 40);
  v7.super_class = (Class)CKMessageEntryRichTextView;
  objc_msgSendSuper2(&v7, sel__pasteAttributedString_pasteAsRichText_, v3, 1);
  id v4 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v5 = [v4 isExpressiveTextEnabled];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 40) textStorage];
    objc_msgSend(v6, "ck_repairTextEffects");
  }
}

- (id)cachedPluginDisplayContainerForGUID:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    int v5 = [(CKMessageEntryRichTextView *)self pluginDisplayContainers];
    id v6 = [v5 objectForKey:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)cachedMediaObjectForTransferGUID:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    int v5 = [(CKMessageEntryRichTextView *)self mediaObjects];
    id v6 = [v5 objectForKey:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)_showCustomInputView
{
  [(CKMessageEntryTextView *)self resignFirstResponder];
  id v3 = [(CKMessageEntryRichTextView *)self delegate];
  [v3 messageEntryRichTextViewDidTapHandwritingKey:self];
}

- (id)_messagesReplacementTextForWritingToolText:(id)a3
{
  id v4 = +[CKComposition compositionForWritingToolsText:a3];
  int v5 = [v4 text];
  id v6 = [(CKMessageEntryRichTextView *)self attributedTextForCompositionText:v5];
  if (!v6) {
    id v6 = objc_alloc_init(MEMORY[0x1E4F28B18]);
  }

  return v6;
}

- (void)writingToolsCoordinator:(id)a3 replaceRange:(_NSRange)a4 inContext:(id)a5 proposedText:(id)a6 reason:(int64_t)a7 animationParameters:(id)a8 completion:(id)a9
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v16 = a9;
  id v17 = a8;
  id v18 = a5;
  id v19 = a3;
  uint64_t v20 = [(CKMessageEntryRichTextView *)self _messagesReplacementTextForWritingToolText:a6];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __128__CKMessageEntryRichTextView_writingToolsCoordinator_replaceRange_inContext_proposedText_reason_animationParameters_completion___block_invoke;
  aBlock[3] = &unk_1E5624DD0;
  id v26 = v20;
  id v27 = v16;
  id v21 = v20;
  id v22 = v16;
  __int16 v23 = _Block_copy(aBlock);
  v24.receiver = self;
  v24.super_class = (Class)CKMessageEntryRichTextView;
  -[CKMessageEntryRichTextView writingToolsCoordinator:replaceRange:inContext:proposedText:reason:animationParameters:completion:](&v24, sel_writingToolsCoordinator_replaceRange_inContext_proposedText_reason_animationParameters_completion_, v19, location, length, v18, v21, a7, v17, v23);
}

uint64_t __128__CKMessageEntryRichTextView_writingToolsCoordinator_replaceRange_inContext_proposedText_reason_animationParameters_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (!a2) {
    a2 = *(void *)(a1 + 32);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, a2);
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * v11);
        v13 = [v12 key];
        if ([v13 keyCode] == 75) {
          goto LABEL_9;
        }
        id v14 = [v12 key];
        if ([v14 keyCode] == 78)
        {

LABEL_9:
LABEL_10:
          [(CKMessageEntryTextView *)self resignFirstResponder];
          goto LABEL_11;
        }
        uint64_t v15 = [v12 key];
        uint64_t v16 = [v15 keyCode];

        if (v16 == 77) {
          goto LABEL_10;
        }
LABEL_11:
        ++v11;
      }
      while (v9 != v11);
      uint64_t v17 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      uint64_t v9 = v17;
    }
    while (v17);
  }
  v18.receiver = self;
  v18.super_class = (Class)CKMessageEntryRichTextView;
  [(CKMessageEntryRichTextView *)&v18 pressesBegan:v6 withEvent:v7];
}

- (void)correctedTypedText:(id)a3 rangeOfReplacement:(id)a4
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6)
  {
    if (v7)
    {
      uint64_t v9 = [v7 end];
      uint64_t v10 = [(CKMessageEntryRichTextView *)self endOfDocument];
      uint64_t v11 = [(CKMessageEntryRichTextView *)self comparePosition:v9 toPosition:v10];

      if (!v11)
      {
        id v16 = v6;
        v17[0] = @"TextCorrections";
        uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
        v17[1] = @"UnderlineRanges";
        v18[0] = v12;
        uint64_t v15 = v8;
        v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
        v18[1] = v13;
        id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];

        [(CKMessageEntryTextView *)self setProofreadingInfo:v14];
      }
    }
  }
}

- (void)setAttributedText:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CKMessageEntryRichTextView;
  [(CKMessageEntryTextView *)&v3 setAttributedText:a3];
}

- (void)setCompositionText:(id)a3
{
  id v4 = a3;
  id v9 = [(CKMessageEntryRichTextView *)self mediaObjects];
  [v9 removeAllObjects];
  int v5 = [(CKMessageEntryRichTextView *)self embeddedRichLinkConfigurations];
  [v5 removeAllObjects];

  id v6 = [(CKMessageEntryRichTextView *)self composeImages];
  [v6 removeAllObjects];

  id v7 = [(CKMessageEntryRichTextView *)self undoManager];
  [v7 removeAllActions];

  uint64_t v8 = [(CKMessageEntryRichTextView *)self attributedTextForCompositionText:v4];

  [(CKMessageEntryRichTextView *)self setAttributedText:v8];
}

- (id)compositionText
{
  objc_super v3 = [(CKMessageEntryRichTextView *)self mediaObjects];
  id v4 = [(CKMessageEntryRichTextView *)self pluginDisplayContainers];
  int v5 = [(CKMessageEntryRichTextView *)self attributedText];
  id v6 = (void *)[v5 mutableCopy];
  objc_msgSend(v6, "setAttributes:range:", 0, 0, objc_msgSend(v5, "length"));
  uint64_t v7 = [v5 length];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __45__CKMessageEntryRichTextView_compositionText__block_invoke;
  v14[3] = &unk_1E5624DF8;
  id v15 = v3;
  id v8 = v6;
  id v16 = v8;
  uint64_t v17 = self;
  objc_super v18 = v4;
  id v9 = v4;
  id v10 = v3;
  objc_msgSend(v5, "enumerateAttributesInRange:options:usingBlock:", 0, v7, 0, v14);
  uint64_t v11 = v18;
  id v12 = v8;

  return v12;
}

void __45__CKMessageEntryRichTextView_compositionText__block_invoke(id *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = a2;
  uint64_t v7 = [v6 objectForKey:@"CKFileTransferGUIDAttributeName"];
  id v8 = [v6 objectForKey:*MEMORY[0x1E4FB06B8]];
  uint64_t v9 = [v6 objectForKey:*MEMORY[0x1E4FB06B0]];
  uint64_t v10 = [v6 objectForKey:@"CKPluginPayloadGUIDAttributeName"];
  uint64_t v11 = *MEMORY[0x1E4F6D538];
  uint64_t v12 = [v6 objectForKey:*MEMORY[0x1E4F6D538]];
  v61 = (void *)v12;
  uint64_t v58 = v10;
  if (v7 && v8)
  {
    v13 = objc_msgSend(a1[4], "objectForKey:", v7, v10);
    if (v13)
    {
      id v14 = a1[5];
      id v15 = CKCompositionMediaObjectForTextAttachmentAttributeName;
LABEL_13:
      objc_msgSend(v14, "addAttribute:value:range:", *v15, v13, a3, a4);
LABEL_24:

      goto LABEL_25;
    }
    id v16 = IMLogHandleForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __45__CKMessageEntryRichTextView_compositionText__block_invoke_cold_1(v7, v16, v17, v18, v19, v20, v21, v22);
    }
    goto LABEL_22;
  }
  if (v9)
  {
    v13 = objc_msgSend(a1[6], "mediaObjectForAdaptiveImageGlyph:", v9, v10);
    if (v13)
    {
      id v14 = a1[5];
      id v15 = CKCompositionAdaptiveImageGlyphMediaObjectAttributeName;
      goto LABEL_13;
    }
    id v16 = IMLogHandleForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __45__CKMessageEntryRichTextView_compositionText__block_invoke_cold_4();
    }
    goto LABEL_22;
  }
  if (v10)
  {
    v13 = objc_msgSend(a1[7], "objectForKey:", v10, v10);
    if (v13)
    {
      id v14 = a1[5];
      id v15 = CKCompositionPluginDisplayContainerAttributeName;
      goto LABEL_13;
    }
    id v16 = IMLogHandleForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __45__CKMessageEntryRichTextView_compositionText__block_invoke_cold_3(v10, v16, v27, v28, v29, v30, v31, v32);
    }
LABEL_22:

LABEL_23:
    uint64_t v12 = (uint64_t)v61;
    goto LABEL_24;
  }
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v23 = a4;
      uint64_t v24 = objc_msgSend(v8, "configuration", v58);
      v13 = [v24 entryItemUUID];

      __int16 v25 = [a1[6] embeddedRichLinkConfigurations];
      id v26 = [v25 objectForKey:v13];

      if (v26)
      {
        objc_msgSend(a1[5], "addAttribute:value:range:", @"EmbeddedRichLinkConfiguration", v26, a3, v23);
      }
      else
      {
        v51 = IMLogHandleForCategory();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
          __45__CKMessageEntryRichTextView_compositionText__block_invoke_cold_2((uint64_t)v13, v51, v52, v53, v54, v55, v56, v57);
        }
      }
      a4 = v23;
      goto LABEL_23;
    }
  }
LABEL_25:
  v33 = (void *)v9;
  v60 = (void *)v7;
  if (v12) {
    objc_msgSend(a1[5], "addAttribute:value:range:", v11, v12, a3, a4);
  }
  uint64_t v34 = a4;
  v35 = objc_msgSend(MEMORY[0x1E4F6E778], "sharedFeatureFlags", v58);
  int v36 = [v35 isRichLinkImprovementsEnabled];

  if (v36)
  {
    uint64_t v37 = *MEMORY[0x1E4F6D4F8];
    v38 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F6D4F8]];
    if (v38) {
      objc_msgSend(a1[5], "addAttribute:value:range:", v37, v38, a3, v34);
    }
  }
  v39 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v40 = [v39 isExpressiveTextEnabled];

  if (v40)
  {
    uint64_t v41 = *MEMORY[0x1E4F6E400];
    v42 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F6E400]];
    if (v42) {
      objc_msgSend(a1[5], "addAttribute:value:range:", v41, v42, a3, v34);
    }
    v43 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F6E420]];
    v44 = v43;
    if (v43 && [v43 unsignedIntegerValue] == 1) {
      objc_msgSend(a1[5], "ck_addTextStyle:options:range:", 4, 1, a3, v34);
    }
    v45 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F6E410]];
    v46 = v45;
    if (v45 && [v45 unsignedIntegerValue] == 1) {
      objc_msgSend(a1[5], "ck_addTextStyle:options:range:", 8, 1, a3, v34);
    }
    v47 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F6E3F8]];
    v48 = v47;
    if (v47 && [v47 unsignedIntegerValue] == 1) {
      objc_msgSend(a1[5], "ck_addTextStyle:options:range:", 1, 1, a3, v34);
    }
    v49 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F6E408]];
    v50 = v49;
    if (v49 && [v49 unsignedIntegerValue] == 1) {
      objc_msgSend(a1[5], "ck_addTextStyle:options:range:", 2, 1, a3, v34);
    }
  }
}

- (BOOL)_reconfigureWithLayoutManager:(id)a3 triggeredByLayoutManagerAccess:(BOOL)a4 triggeringSelector:(SEL)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CKMessageEntryRichTextView;
  BOOL v9 = [(CKMessageEntryRichTextView *)&v18 _reconfigureWithLayoutManager:v8 triggeredByLayoutManagerAccess:v6 triggeringSelector:a5];
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v11 = [v10 isTextKit2Enabled];

    if (v11)
    {
      v13 = NSString;
      id v14 = (objc_class *)objc_opt_class();
      id v15 = NSStringFromClass(v14);
      uint64_t v16 = [v13 stringWithFormat:@"%@ (%p) has been reconfigured to use TextKit 1 but TextKit 2 is enabled. This is not supported and indicates a programmer error.", v15, self];

      id v17 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v16 userInfo:0];
      objc_exception_throw(v17);
    }
  }

  return v9;
}

- (void)setBalloonColor:(char)a3
{
  if (self->_balloonColor != a3)
  {
    self->_balloonColor = a3;
    [(CKMessageEntryRichTextView *)self updateContentsOfFileTransferPreviews];
  }
}

- (void)replaceTextInRange:(_NSRange)a3 withLinks:(id)a4
{
  NSUInteger location = a3.location;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v21 = self;
  uint64_t v22 = [(CKMessageEntryRichTextView *)self compositionText];
  __int16 v25 = (void *)[v22 mutableCopy];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = -(uint64_t)location;
    uint64_t v24 = *(void *)v27;
    uint64_t v10 = *MEMORY[0x1E4F6C110];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v13 = [v12 url];
        id v14 = +[CKEmbeddedRichLinkConfiguration richLinkConfigurationWithURL:v13];

        uint64_t v30 = @"EmbeddedRichLinkConfiguration";
        uint64_t v31 = v14;
        id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
        uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v10 attributes:v15];
        uint64_t v17 = [v12 range] - v9;
        [v12 range];
        objc_msgSend(v25, "replaceCharactersInRange:withAttributedString:", v17, v18, v16);
        [v12 range];
        v9 += v19 - [v16 length];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v8);
  }

  uint64_t v20 = (void *)[v25 copy];
  [(CKMessageEntryRichTextView *)v21 setCompositionText:v20];
}

- (BOOL)canPerformDictationAction:(id)a3
{
  id v4 = a3;
  int v5 = [(CKMessageEntryRichTextView *)self delegate];
  LOBYTE(self) = [v5 messageEntryRichTextView:self canPerformDictationAction:v4];

  return (char)self;
}

- (void)textStorage:(id)a3 willProcessEditing:(unint64_t)a4 range:(_NSRange)a5 changeInLength:(int64_t)a6
{
  id v8 = a3;
  if (![(CKMessageEntryTextView *)self isShowingDictationPlaceholder])
  {
    uint64_t v9 = [(CKMessageEntryRichTextView *)self selectedRange];
    uint64_t v11 = v10;
    uint64_t v20 = v9;
    uint64_t v21 = v10;
    uint64_t v12 = CKSeparatedTextForTextInView(v8, (uint64_t)&v20, self);
    if (([v8 isEqualToAttributedString:v12] & 1) == 0)
    {
      [v8 setAttributedString:v12];
      if ((a6 & 0x8000000000000000) == 0 && (v9 != v20 || v11 != v21))
      {
        v13 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
        int v14 = [v13 isTextKit2Enabled];

        if (v14)
        {
          id v15 = (void *)(v20 - v9);
          uint64_t v16 = (void *)(v21 - v11);
          id location = 0;
          objc_initWeak(&location, self);
          v17[0] = MEMORY[0x1E4F143A8];
          v17[1] = 3221225472;
          void v17[2] = __82__CKMessageEntryRichTextView_textStorage_willProcessEditing_range_changeInLength___block_invoke;
          v17[3] = &unk_1E5624E20;
          objc_copyWeak(v18, &location);
          v18[1] = v15;
          v18[2] = v16;
          dispatch_async(MEMORY[0x1E4F14428], v17);
          objc_destroyWeak(v18);
          objc_destroyWeak(&location);
        }
        else
        {
          -[CKMessageEntryRichTextView setSelectedRange:](self, "setSelectedRange:", v20, v21);
        }
      }
    }
  }
}

void __82__CKMessageEntryRichTextView_textStorage_willProcessEditing_range_changeInLength___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = [WeakRetained selectedRange];
  uint64_t v6 = v5;

  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 40) + v4;
  uint64_t v9 = v7 + v6;
  id v10 = objc_loadWeakRetained(v2);
  objc_msgSend(v10, "setSelectedRange:", v8, v9);
}

- (BOOL)supportsAdaptiveImageGlyph
{
  return 0;
}

- (void)insertAdaptiveImageGlyph:(id)a3 replacementRange:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CKMessageEntryRichTextView;
  [(CKMessageEntryRichTextView *)&v6 insertAdaptiveImageGlyph:a3 replacementRange:a4];
  uint64_t v4 = IMLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Adaptive image glyph inserted", v5, 2u);
  }
}

- (void)insertAdaptiveImageGlyph:(id)a3 withMediaObject:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v6 transferGUID];
  if ([v8 length])
  {
    uint64_t v9 = [(CKMessageEntryRichTextView *)self mediaObjects];
    [v9 setObject:v6 forKeyedSubscript:v8];
  }
  else
  {
    uint64_t v9 = IMLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CKMessageEntryRichTextView insertAdaptiveImageGlyph:withMediaObject:]();
    }
  }

  id v10 = [(CKMessageEntryRichTextView *)self selectedTextRange];
  [(CKMessageEntryRichTextView *)self insertAdaptiveImageGlyph:v7 replacementRange:v10];
}

- (id)mediaObjectForAdaptiveImageGlyph:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKMessageEntryRichTextView *)self existingMediaObjectMatchingAdaptiveImageGlyph:v4];
  if (v5)
  {
    id v6 = (id)v5;
    id v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Found existing media object matching adaptive image glyph content identifier, e.g. repeated emoji in a message, reusing same transfer.", v13, 2u);
    }
  }
  else
  {
    id v7 = +[CKMediaObjectManager sharedInstance];
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F6EA58]) initWithAdaptiveImageGlyphFromUnknownSource:v4];
    uint64_t v9 = [v7 mediaObjectWithSticker:v8 stickerUserInfo:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v9;
      id v10 = [v6 transferGUID];
      if ([v10 length])
      {
        uint64_t v11 = [(CKMessageEntryRichTextView *)self mediaObjects];
        [v11 setObject:v6 forKeyedSubscript:v10];
      }
      else
      {
        uint64_t v11 = IMLogHandleForCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          -[CKMessageEntryRichTextView mediaObjectForAdaptiveImageGlyph:]();
        }
      }
    }
    else
    {
      id v10 = IMLogHandleForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[CKMessageEntryRichTextView mediaObjectForAdaptiveImageGlyph:]();
      }
      id v6 = 0;
    }
  }

  return v6;
}

- (id)existingMediaObjectMatchingAdaptiveImageGlyph:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKMessageEntryRichTextView *)self mediaObjects];
  id v6 = [v4 contentIdentifier];
  if ([v6 length])
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x3032000000;
    id v15 = __Block_byref_object_copy__21;
    uint64_t v16 = __Block_byref_object_dispose__21;
    id v17 = 0;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __76__CKMessageEntryRichTextView_existingMediaObjectMatchingAdaptiveImageGlyph___block_invoke;
    v9[3] = &unk_1E5624E48;
    id v10 = v6;
    uint64_t v11 = &v12;
    [v5 enumerateKeysAndObjectsUsingBlock:v9];
    id v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __76__CKMessageEntryRichTextView_existingMediaObjectMatchingAdaptiveImageGlyph___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  uint64_t v8 = [v7 transfer];
  uint64_t v9 = [v8 adaptiveImageGlyphContentIdentifier];
  if ([v9 length] && objc_msgSend(v9, "isEqualToString:", *(void *)(a1 + 32)))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
      *a4 = 1;
    }
    else
    {
      id v10 = IMLogHandleForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __76__CKMessageEntryRichTextView_existingMediaObjectMatchingAdaptiveImageGlyph___block_invoke_cold_1();
      }
    }
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)inlineMediaViewTextAttachmentDidRequestGenerativeInteraction:(id)a3
{
  id v4 = a3;
  id v6 = [(CKMessageEntryRichTextView *)self delegate];
  uint64_t v5 = [v4 fileURL];

  [v6 messageEntryRichTextView:self didTapGenerativeButtonForImageURL:v5];
}

- (void)linkPreviewTextAttachmentDidUpdateTextAttachmentSize:(id)a3
{
  id v4 = a3;
  id v5 = [(CKMessageEntryRichTextView *)self delegate];
  [v5 messageEntryRichTextView:self didUpdateSizeForTextAttachment:v4];
}

- (void)linkPreviewTextAttachment:(id)a3 didSelectInteractionType:(int64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (!a4)
  {
    uint64_t v11 = self;
    uint64_t v12 = 0;
LABEL_7:
    id v13 = v7;
    [(CKMessageEntryRichTextView *)v11 _updateTextContentForRichLinkInteractionType:v12 onTextAttachment:v7];
    goto LABEL_8;
  }
  if (a4 == 2)
  {
    uint64_t v11 = self;
    uint64_t v12 = 2;
    goto LABEL_7;
  }
  if (a4 != 1) {
    goto LABEL_9;
  }
  id v13 = v6;
  uint64_t v8 = [v6 configuration];
  uint64_t v9 = [v8 url];
  id v10 = [MEMORY[0x1E4F42C50] generalPasteboard];
  [v10 setURL:v9];

LABEL_8:
  id v7 = v13;
LABEL_9:
}

- (void)_updateTextContentForRichLinkInteractionType:(int64_t)a3 onTextAttachment:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  char v10 = 0;
  id v6 = a4;
  id v7 = [(CKMessageEntryRichTextView *)self attributedText];
  v11[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];

  uint64_t v9 = objc_msgSend(v7, "ck_attributedStringByApplyingRichLinkInteraction:toLinkTextAttachments:stringDidChange:", a3, v8, &v10);

  if (v10) {
    [(CKMessageEntryRichTextView *)self setAttributedText:v9];
  }
}

- (void)linkPreviewTextAttachment:(id)a3 willAddPluginEntryViewControllerToViewHierarchy:(id)a4
{
  id v5 = a4;
  id v6 = [(CKMessageEntryRichTextView *)self delegate];
  [v6 messageEntryRichTextView:self willAddPluginTextAttachmentViewControllerToViewHierarchy:v5];
}

- (void)linkPreviewTextAttachment:(id)a3 didAddPluginEntryViewControllerToViewHierarchy:(id)a4
{
  id v5 = a4;
  id v6 = [(CKMessageEntryRichTextView *)self delegate];
  [v6 messageEntryRichTextView:self didAddPluginTextAttachmentViewControllerToViewHierarchy:v5];
}

- (double)maxWidthForLinkPreviewTextAttachment:(id)a3
{
  id v4 = [(CKMessageEntryRichTextView *)self delegate];
  [v4 balloonMaxWidthForMessageEntryRichTextView:self];
  double v6 = v5;

  return v6;
}

- (BOOL)supportsCustomizationForLinkPreviewTextAttachment:(id)a3
{
  objc_super v3 = self;
  id v4 = [(CKMessageEntryRichTextView *)self delegate];
  LOBYTE(v3) = [v4 messageEntryRichTextViewShouldAllowLinkCustomization:v3];

  return (char)v3;
}

- (void)linkPreviewTextAttachmentWillPresentCustomizationPicker:(id)a3
{
  id v4 = [(CKMessageEntryRichTextView *)self delegate];
  [v4 messageEntryRichTextViewWillPresentCustomizationPicker:self];
}

- (void)linkPreviewTextAttachmentDidPresentCustomizationPicker:(id)a3
{
  id v4 = [(CKMessageEntryRichTextView *)self delegate];
  [v4 messageEntryRichTextViewDidPresentCustomizationPicker:self];
}

- (void)linkPreviewTextAttachmentWillDismissCustomizationPicker:(id)a3
{
  id v4 = [(CKMessageEntryRichTextView *)self delegate];
  [v4 messageEntryRichTextViewWillDismissCustomizationPicker:self];
}

- (void)linkPreviewTextAttachmentDidDismissCustomizationPicker:(id)a3
{
  id v4 = [(CKMessageEntryRichTextView *)self delegate];
  [v4 messageEntryRichTextViewDidDismissCustomizationPicker:self];
}

- (void)updateContentsOfFileTransferPreviews
{
  objc_super v3 = [(CKMessageEntryRichTextView *)self attributedText];
  id v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = [v4 length];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __66__CKMessageEntryRichTextView_updateContentsOfFileTransferPreviews__block_invoke;
  char v10 = &unk_1E5624E70;
  uint64_t v11 = self;
  id v12 = v4;
  id v6 = v4;
  objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", @"CKFileTransferGUIDAttributeName", 0, v5, 0, &v7);
  -[CKMessageEntryRichTextView setAttributedText:](self, "setAttributedText:", v6, v7, v8, v9, v10, v11);
}

void __66__CKMessageEntryRichTextView_updateContentsOfFileTransferPreviews__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (v7)
  {
    id v28 = v7;
    uint64_t v8 = [*(id *)(a1 + 32) mediaObjects];
    uint64_t v9 = [v8 objectForKey:v28];

    char v10 = [v9 transfer];
    int v11 = [v10 isAdaptiveImageGlyph];

    id v12 = *(void **)(a1 + 40);
    if (v11)
    {
      uint64_t v13 = *MEMORY[0x1E4FB06B0];
      uint64_t v14 = [v12 attribute:*MEMORY[0x1E4FB06B0] atIndex:a3 effectiveRange:0];
      id v15 = [*(id *)(a1 + 32) adaptiveImageGlyphForTransferGUID:v28];
      if (v14 == v15)
      {
LABEL_11:

        id v7 = v28;
        goto LABEL_12;
      }
      uint64_t v16 = *(void **)(a1 + 40);
      uint64_t v17 = v13;
      uint64_t v18 = v15;
    }
    else
    {
      uint64_t v19 = *MEMORY[0x1E4FB06B8];
      uint64_t v14 = [v12 attribute:*MEMORY[0x1E4FB06B8] atIndex:a3 effectiveRange:0];
      uint64_t v20 = *(void **)(a1 + 32);
      uint64_t v21 = [v20 traitCollection];
      id v15 = [v20 composeImageForTransferGUID:v28 traitCollection:v21];

      uint64_t v22 = [v14 image];

      if (v22 == v15 || v14 == 0) {
        goto LABEL_11;
      }
      [v14 setImage:v15];
      double v24 = *MEMORY[0x1E4F1DAD8];
      double v25 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      [v15 size];
      objc_msgSend(v14, "setBounds:", v24, v25, v26, v27);
      uint64_t v16 = *(void **)(a1 + 40);
      uint64_t v17 = v19;
      uint64_t v18 = v14;
    }
    objc_msgSend(v16, "addAttribute:value:range:", v17, v18, a3, a4);
    goto LABEL_11;
  }
LABEL_12:
}

- (void)_adaptiveImageGlyphWasGeneratedNotification:(id)a3
{
  uint64_t v9 = [a3 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v5 = v9;
  if (isKindOfClass)
  {
    id v6 = [v9 transferGUID];
    id v7 = [(CKMessageEntryRichTextView *)self mediaObjects];
    uint64_t v8 = [v7 objectForKey:v6];

    if (v8) {
      [(CKMessageEntryRichTextView *)self updateContentsOfFileTransferPreviews];
    }

    uint64_t v5 = v9;
  }
}

- (void)previewDidChange:(id)a3
{
  id v12 = a3;
  id v4 = [v12 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v6 = v12;
  if (isKindOfClass)
  {
    id v7 = [v12 object];
    uint64_t v8 = [v7 transferGUID];
    uint64_t v9 = [(CKMessageEntryRichTextView *)self mediaObjects];
    char v10 = [v9 objectForKey:v8];

    if (v10)
    {
      int v11 = [(CKMessageEntryRichTextView *)self composeImages];
      [v11 removeObjectForKey:v8];

      [(CKMessageEntryRichTextView *)self updateContentsOfFileTransferPreviews];
    }

    id v6 = v12;
  }
}

- (id)adaptiveImageGlyphForTransferGUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKMessageEntryRichTextView *)self mediaObjects];
  id v6 = [v5 objectForKey:v4];

  id v7 = [v6 adaptiveImageGlyph];

  return v7;
}

- (BOOL)shouldPreserveAdaptiveImageGlyphsInCompositionText
{
  return 1;
}

- (id)composeImageForTransferGUID:(id)a3 traitCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CKMessageEntryRichTextView *)self composeImages];
  uint64_t v9 = [v8 objectForKey:v6];
  if (!v9)
  {
    char v10 = [(CKMessageEntryRichTextView *)self mediaObjects];
    int v11 = [v10 objectForKey:v6];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = IMLogHandleForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[CKMessageEntryRichTextView composeImageForTransferGUID:traitCollection:]();
      }

      uint64_t v9 = 0;
    }
    else
    {
      uint64_t v13 = [(CKMessageEntryRichTextView *)self delegate];
      [v13 maxWidthForPreviewImagesInMessageEntryRichTextView:self];
      double v15 = v14;

      uint64_t v16 = [v11 transfer];
      int v17 = [v16 isSticker];

      if (v17)
      {
        uint64_t v18 = [v11 previewForWidth:0 orientation:v15];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v19 = [v18 image];
        }
        else
        {
          id v19 = v18;
        }
        uint64_t v20 = v19;
        uint64_t v21 = +[CKUIBehavior sharedBehaviors];
        [v20 size];
        double v23 = v22;
        double v25 = v24;
        [v20 scale];
        double v27 = v26;
        id v28 = +[CKUIBehavior sharedBehaviors];
        [v28 stickerScreenScale];
        objc_msgSend(v21, "stickerSizeScaledWithInitialSize:imageScale:userScale:rectifiedScreenScale:maxWidth:", v23, v25, v27, 1.0, v29, 1.79769313e308);
        double v15 = v30;
      }
      uint64_t v9 = [v11 composeImagesForEntryContentViewWidth:v7 traitCollection:v15];
      [v8 setObject:v9 forKey:v6];
    }
  }
  uint64_t v31 = objc_msgSend(NSNumber, "numberWithChar:", -[CKMessageEntryRichTextView balloonColor](self, "balloonColor"));
  uint64_t v32 = [v9 objectForKey:v31];

  return v32;
}

- (id)attributedTextForCompositionText:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKMessageEntryRichTextView *)self mediaObjects];
  id v6 = [(CKMessageEntryRichTextView *)self pluginDisplayContainers];
  id v7 = (void *)[v4 mutableCopy];
  uint64_t v8 = [v7 length];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __63__CKMessageEntryRichTextView_attributedTextForCompositionText___block_invoke;
  v49[3] = &unk_1E5624DF8;
  id v9 = v5;
  id v50 = v9;
  id v10 = v7;
  id v51 = v10;
  uint64_t v52 = self;
  id v11 = v6;
  id v53 = v11;
  objc_msgSend(v4, "enumerateAttributesInRange:options:usingBlock:", 0, v8, 0, v49);
  id v12 = [(CKMessageEntryRichTextView *)self typingAttributes];
  uint64_t v13 = (void *)[v12 mutableCopy];

  double v14 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v15 = [v14 isExpressiveTextEnabled];

  if (v15)
  {
    objc_msgSend(v13, "ck_removeBoldItalicUnderlineAndStrikethroughTypingAttributes");
    objc_msgSend(v13, "ck_removeTextAnimationsTypingAttributes");
  }
  objc_msgSend(v10, "addAttributes:range:", v13, 0, objc_msgSend(v10, "length"));
  uint64_t v16 = objc_msgSend(v10, "attributesAtIndex:effectiveRange:", objc_msgSend(v10, "length") - 1, 0);
  uint64_t v17 = *MEMORY[0x1E4FB06B8];
  uint64_t v18 = [v16 objectForKey:*MEMORY[0x1E4FB06B8]];

  if (v18)
  {
    id v19 = (void *)[v16 mutableCopy];
    [v19 removeObjectForKey:@"CKFileTransferGUIDAttributeName"];
    [v19 removeObjectForKey:v17];
    uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n" attributes:v19];
    [v10 appendAttributedString:v20];
  }
  uint64_t v21 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v22 = [v21 isExpressiveTextEnabled];

  if (v22)
  {
    uint64_t v23 = [v4 length];
    uint64_t v24 = *MEMORY[0x1E4F6E400];
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __63__CKMessageEntryRichTextView_attributedTextForCompositionText___block_invoke_2;
    v47[3] = &unk_1E5624860;
    id v25 = v10;
    id v48 = v25;
    objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v24, 0, v23, 0, v47);
    uint64_t v26 = *MEMORY[0x1E4F6E410];
    uint64_t v27 = [v4 length];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __63__CKMessageEntryRichTextView_attributedTextForCompositionText___block_invoke_3;
    v45[3] = &unk_1E5624860;
    id v28 = v25;
    id v46 = v28;
    objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v26, 0, v27, 0, v45);
    uint64_t v29 = *MEMORY[0x1E4F6E420];
    uint64_t v30 = [v4 length];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __63__CKMessageEntryRichTextView_attributedTextForCompositionText___block_invoke_4;
    v43[3] = &unk_1E5624860;
    id v31 = v28;
    id v44 = v31;
    objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v29, 0, v30, 0, v43);
    uint64_t v32 = *MEMORY[0x1E4F6E3F8];
    uint64_t v33 = [v4 length];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __63__CKMessageEntryRichTextView_attributedTextForCompositionText___block_invoke_5;
    v41[3] = &unk_1E5624860;
    id v34 = v31;
    id v42 = v34;
    objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v32, 0, v33, 0, v41);
    uint64_t v35 = *MEMORY[0x1E4F6E408];
    uint64_t v36 = [v4 length];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __63__CKMessageEntryRichTextView_attributedTextForCompositionText___block_invoke_6;
    v39[3] = &unk_1E5624860;
    id v40 = v34;
    objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v35, 0, v36, 0, v39);
  }
  id v37 = v10;

  return v37;
}

void __63__CKMessageEntryRichTextView_attributedTextForCompositionText___block_invoke(id *a1, void *a2, uint64_t a3, uint64_t a4)
{
  v59[2] = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = [v6 objectForKeyedSubscript:@"PluginDisplayContainer"];
  uint64_t v8 = [v6 objectForKeyedSubscript:@"AdaptiveImageGlyphMediaObject"];
  id v9 = [v6 objectForKeyedSubscript:@"MediaObjectForTextAttachment"];
  v47 = v9;
  if (v8)
  {
    id v10 = [v8 transferGUID];
    [a1[4] setObject:v8 forKey:v10];
    uint64_t v11 = [v8 adaptiveImageGlyph];
    id v12 = (void *)v11;
    if (v11)
    {
      v58[0] = *MEMORY[0x1E4FB06B0];
      v58[1] = @"CKFileTransferGUIDAttributeName";
      v59[0] = v11;
      v59[1] = v10;
      uint64_t v13 = (void *)MEMORY[0x1E4F1C9E8];
      double v14 = (void **)v59;
      int v15 = (__CFString **)v58;
      uint64_t v16 = 2;
    }
    else
    {
      uint64_t v56 = @"CKFileTransferGUIDAttributeName";
      uint64_t v57 = v10;
      uint64_t v13 = (void *)MEMORY[0x1E4F1C9E8];
      double v14 = &v57;
      int v15 = &v56;
      uint64_t v16 = 1;
    }
    id v19 = [v13 dictionaryWithObjects:v14 forKeys:v15 count:v16];
    objc_msgSend(a1[5], "setAttributes:range:", v19, a3, a4);
  }
  else
  {
    if (!v9) {
      goto LABEL_9;
    }
    id v10 = [v9 transferGUID];
    [a1[4] setObject:v47 forKey:v10];
    id v17 = a1[6];
    uint64_t v18 = [v17 traitCollection];
    id v12 = [v17 composeImageForTransferGUID:v10 traitCollection:v18];

    id v19 = (void *)[objc_alloc(MEMORY[0x1E4FB0870]) initWithData:0 ofType:0];
    [v19 setImage:v12];
    double v20 = *MEMORY[0x1E4F1DAD8];
    double v21 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    [v12 size];
    objc_msgSend(v19, "setBounds:", v20, v21, v22, v23);
    id v24 = a1[5];
    v54[0] = *MEMORY[0x1E4FB06B8];
    v54[1] = @"CKFileTransferGUIDAttributeName";
    v55[0] = v19;
    v55[1] = v10;
    id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:2];
    objc_msgSend(v24, "setAttributes:range:", v25, a3, a4);
  }
LABEL_9:
  uint64_t v48 = a4;
  uint64_t v26 = [a1[6] embeddedRichLinkConfigurations];
  uint64_t v27 = [v6 objectForKeyedSubscript:@"EmbeddedRichLinkConfiguration"];
  id v28 = v27;
  if (v27)
  {
    uint64_t v29 = [v27 entryItemUUID];
    [v26 setObject:v28 forKey:v29];
    uint64_t v30 = [[_TtC7ChatKit27CKLinkPreviewTextAttachment alloc] initWithDelegate:a1[6] configuration:v28];
    id v31 = a1[5];
    uint64_t v52 = *MEMORY[0x1E4FB06B8];
    id v53 = v30;
    uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
    objc_msgSend(v31, "setAttributes:range:", v32, a3, v48);
  }
  if (v7)
  {
    uint64_t v33 = [v7 pluginPayload];
    id v34 = [v33 messageGUID];
    [a1[7] setObject:v7 forKey:v34];
    uint64_t v35 = (void *)[objc_alloc(MEMORY[0x1E4FB0870]) initWithData:0 ofType:0];
    id v46 = v7;
    uint64_t v36 = [v7 composeImage];
    id v37 = +[CKUIBehavior sharedBehaviors];
    [v37 previewMaxWidth];
    double v39 = v38;

    [v36 size];
    double v42 = v40;
    double v43 = v41;
    if (v40 > v39 && v40 > 0.0)
    {
      double v43 = v39 * (v41 / v40);
      double v42 = v39;
    }
    [v35 setImage:v36];
    objc_msgSend(v35, "setBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v42, v43);
    id v44 = a1[5];
    v50[0] = *MEMORY[0x1E4FB06B8];
    v50[1] = @"CKPluginPayloadGUIDAttributeName";
    v51[0] = v35;
    v51[1] = v34;
    v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:2];
    objc_msgSend(v44, "setAttributes:range:", v45, a3, v48);

    id v7 = v46;
  }
}

void __63__CKMessageEntryRichTextView_attributedTextForCompositionText___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(*(id *)(a1 + 32), "ck_applyTextEffectType:range:", objc_msgSend(v7, "integerValue"), a3, a4);
    }
  }
}

void __63__CKMessageEntryRichTextView_attributedTextForCompositionText___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (v7)
  {
    id v10 = v7;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v7 = v10;
    if (isKindOfClass)
    {
      uint64_t v9 = [v10 unsignedIntegerValue];
      id v7 = v10;
      if (v9 == 1)
      {
        objc_msgSend(*(id *)(a1 + 32), "ck_addTextStyle:options:range:", 8, 3, a3, a4);
        id v7 = v10;
      }
    }
  }
}

void __63__CKMessageEntryRichTextView_attributedTextForCompositionText___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (v7)
  {
    id v10 = v7;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v7 = v10;
    if (isKindOfClass)
    {
      uint64_t v9 = [v10 unsignedIntegerValue];
      id v7 = v10;
      if (v9 == 1)
      {
        objc_msgSend(*(id *)(a1 + 32), "ck_addTextStyle:options:range:", 4, 3, a3, a4);
        id v7 = v10;
      }
    }
  }
}

void __63__CKMessageEntryRichTextView_attributedTextForCompositionText___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (v7)
  {
    id v10 = v7;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v7 = v10;
    if (isKindOfClass)
    {
      uint64_t v9 = [v10 unsignedIntegerValue];
      id v7 = v10;
      if (v9 == 1)
      {
        objc_msgSend(*(id *)(a1 + 32), "ck_addTextStyle:options:range:", 1, 3, a3, a4);
        id v7 = v10;
      }
    }
  }
}

void __63__CKMessageEntryRichTextView_attributedTextForCompositionText___block_invoke_6(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (v7)
  {
    id v10 = v7;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v7 = v10;
    if (isKindOfClass)
    {
      uint64_t v9 = [v10 unsignedIntegerValue];
      id v7 = v10;
      if (v9 == 1)
      {
        objc_msgSend(*(id *)(a1 + 32), "ck_addTextStyle:options:range:", 2, 3, a3, a4);
        id v7 = v10;
      }
    }
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKMessageEntryRichTextView *)self delegate];
  LOBYTE(self) = [v5 messageEntryRichTextView:self shouldRecognizeGesture:v4];

  return (char)self;
}

- (BOOL)handleTapOrLongPressOnMediaObjectForTransferGUID:(id)a3 characterIndex:(int64_t)a4 location:(CGPoint)a5 touchedCharacterFrame:(CGRect)a6
{
  double width = a6.size.width;
  double x = a5.x;
  id v10 = a3;
  uint64_t v11 = [(CKMessageEntryRichTextView *)self mediaObjects];
  id v12 = [v11 objectForKeyedSubscript:v10];

  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    double v14 = [(CKMessageEntryRichTextView *)self delegate];
    [v14 messageEntryRichTextView:self didTapMediaObject:v12];

    if (x <= width * 0.5) {
      int64_t v15 = a4;
    }
    else {
      int64_t v15 = a4 + 1;
    }
    -[CKMessageEntryRichTextView setSelectedRange:](self, "setSelectedRange:", v15, 0);
    [(CKMessageEntryRichTextView *)self becomeFirstResponder];
    BOOL v13 = 1;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (void)handleTapOrLongPress:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)CKMessageEntryRichTextView;
  [(CKMessageEntryTextView *)&v34 handleTapOrLongPress:v4];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0 || [v4 state] == 3)
  {
    id v6 = [(CKMessageEntryRichTextView *)self delegate];
    [v6 messageEntryRichTextViewWasTapped:self isLongPress:isKindOfClass & 1];

    id v7 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    char v8 = [v7 isTextKit2Enabled];

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = [(CKMessageEntryRichTextView *)self layoutManager];
      id v10 = [(CKMessageEntryRichTextView *)self textContainer];
      uint64_t v11 = [(CKMessageEntryRichTextView *)self attributedText];
      [(CKMessageEntryRichTextView *)self textContainerInset];
      double v13 = v12;
      double v15 = v14;
      [v4 locationInView:self];
      double v17 = v16 - v15;
      double v19 = v18 - v13;
      uint64_t v20 = objc_msgSend(v9, "glyphIndexForPoint:inTextContainer:", v10, v17, v19);
      unint64_t v21 = [v9 characterIndexForGlyphAtIndex:v20];
      if (v21 < [v11 length])
      {
        uint64_t v22 = [v11 attribute:@"CKFileTransferGUIDAttributeName" atIndex:v21 effectiveRange:0];
        double v23 = [(CKMessageEntryRichTextView *)self mediaObjects];
        uint64_t v33 = (void *)v22;
        id v24 = [v23 objectForKey:v22];

        if (v24)
        {
          objc_msgSend(v9, "boundingRectForGlyphRange:inTextContainer:", v20, 1, v10);
          v36.origin.double x = v25 + 10.0;
          v36.origin.double y = v26 + 10.0;
          double v28 = v27 + -20.0;
          v36.size.double height = v29 + -20.0;
          v36.size.double width = v27 + -20.0;
          v35.double x = v17;
          v35.double y = v19;
          if (CGRectContainsPoint(v36, v35))
          {
            uint64_t v30 = [(CKMessageEntryRichTextView *)self delegate];
            [v30 messageEntryRichTextView:self didTapMediaObject:v24];

            if (v17 <= v28 * 0.5) {
              uint64_t v31 = v20;
            }
            else {
              uint64_t v31 = v20 + 1;
            }
            -[CKMessageEntryRichTextView setSelectedRange:](self, "setSelectedRange:", v31, 0);
            [(CKMessageEntryRichTextView *)self becomeFirstResponder];
          }
        }
        else
        {
          uint64_t v32 = [v11 attribute:*MEMORY[0x1E4F6D508] atIndex:v21 effectiveRange:0];

          if (v32) {
            [(CKMessageEntryTextView *)self didTapMentionForTextView:self atCharacterIndex:(double)v21];
          }
        }
        if (+[CKMentionsUtilities supportsSupplementalLexiconMentions])
        {
          [(CKMessageEntryTextView *)self didLongPressMentionForTextView:self characterIndex:v21 isLongPress:isKindOfClass & 1];
        }
      }
    }
  }
}

- (_NSRange)_rangeFromUITextRange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKMessageEntryRichTextView *)self beginningOfDocument];
  id v6 = [v4 start];
  uint64_t v7 = [(CKMessageEntryRichTextView *)self offsetFromPosition:v5 toPosition:v6];

  char v8 = [v4 start];
  uint64_t v9 = [v4 end];

  uint64_t v10 = [(CKMessageEntryRichTextView *)self offsetFromPosition:v8 toPosition:v9];
  NSUInteger v11 = v7;
  NSUInteger v12 = v10;
  result.NSUInteger length = v12;
  result.id location = v11;
  return result;
}

- (char)balloonColor
{
  return self->_balloonColor;
}

- (BOOL)disableKeyboardStickers
{
  return self->_disableKeyboardStickers;
}

- (NSMutableDictionary)mediaObjects
{
  return self->_mediaObjects;
}

- (NSMutableDictionary)pluginDisplayContainers
{
  return self->_pluginDisplayContainers;
}

- (NSMutableDictionary)embeddedRichLinkConfigurations
{
  return self->_embeddedRichLinkConfigurations;
}

- (NSMutableDictionary)composeImages
{
  return self->_composeImages;
}

- (BOOL)disableAttachments
{
  return self->_disableAttachments;
}

void __45__CKMessageEntryRichTextView_compositionText__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __45__CKMessageEntryRichTextView_compositionText__block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __45__CKMessageEntryRichTextView_compositionText__block_invoke_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __45__CKMessageEntryRichTextView_compositionText__block_invoke_cold_4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Unexpected: did not find emojiImageMediaObject", v2, v3, v4, v5, v6);
}

- (void)insertAdaptiveImageGlyph:withMediaObject:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Failed to create media object for inserted adaptive image glyph.", v2, v3, v4, v5, v6);
}

- (void)mediaObjectForAdaptiveImageGlyph:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Failed to get file transfer guid for created emoji image media object", v2, v3, v4, v5, v6);
}

- (void)mediaObjectForAdaptiveImageGlyph:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Failed to create emoji image media object for adaptive image glyph.", v2, v3, v4, v5, v6);
}

void __76__CKMessageEntryRichTextView_existingMediaObjectMatchingAdaptiveImageGlyph___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Found media object matching adaptive image glyph content identifier, but not of the correct media object class", v2, v3, v4, v5, v6);
}

- (void)composeImageForTransferGUID:traitCollection:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Attempting to find an compse UIImage for an emoji image media object, instead of the NSEmojiImageTextAttachment", v2, v3, v4, v5, v6);
}

@end