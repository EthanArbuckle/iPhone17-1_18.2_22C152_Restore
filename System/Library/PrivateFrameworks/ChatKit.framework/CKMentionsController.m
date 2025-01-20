@interface CKMentionsController
- (BOOL)allowsMentions;
- (BOOL)attributedString:(id)a3 nextCharacterRangeFromRange:(_NSRange)a4 containsPossibleChild:(id)a5;
- (BOOL)attributedString:(id)a3 shouldAddAutoCompleteAttributeForRange:(_NSRange)a4;
- (BOOL)canShowPaddle:(_NSRange)a3;
- (BOOL)canSuggestSupplementalItemsForCurrentSelection;
- (BOOL)isUpdatingMentionAttributedText;
- (BOOL)isValidPrefixCharacter:(unsigned __int16)a3;
- (BOOL)languageHasSpaces;
- (BOOL)preventShowingCalloutMenu;
- (BOOL)range:(_NSRange)a3 hasValidPrefixCharacterForString:(id)a4;
- (BOOL)shouldUpdateMentionsInRange:(_NSRange)a3 withReplacementText:(id)a4;
- (BOOL)shouldUpdateMentionsInTextView:(id)a3 inRange:(_NSRange)a4 withReplacementText:(id)a5;
- (BOOL)showingMentionsSuggestions;
- (CGRect)anchorRect;
- (CKConversation)conversation;
- (CKMentionEntityNode)entityTree;
- (CKMentionSuggestionView)mentionSuggestionView;
- (CKMentionsAnimationController)mentionsAnimationController;
- (CKMentionsController)initWithEntryTextView:(id)a3 conversation:(id)a4;
- (CKMentionsControllerTextEffectsDelegate)textEffectsDelegate;
- (CKMessageEntryTextView)textView;
- (CKPaddleOverlayView)paddleOverlayView;
- (NSArray)currentMentionSuggestions;
- (NSMutableDictionary)entityDictionary;
- (NSMutableSet)entityHandles;
- (_NSRange)_rangeFromUITextRange:(id)a3;
- (_NSRange)currentMentionWithoutPrefixRange;
- (_NSRange)lastFoundMentionRange;
- (_NSRange)rangeOfTappedMention;
- (_UISupplementalLexicon)mentionsLexicon;
- (id)_nodeForMentionNodeId:(id)a3;
- (id)_nodeIdForMentionNode:(id)a3;
- (id)didSelectEntityCompletionHandler;
- (id)entitiesForKey:(id)a3;
- (id)suggestionView:(id)a3 entityAtIndex:(unint64_t)a4;
- (id)suggestionView:(id)a3 indexPathOfEntityWithIdentifier:(id)a4;
- (int64_t)numberOfCurrentMentionWithoutPrefixRangeTouches;
- (unint64_t)currentTappedCharacterIndex;
- (unint64_t)numberOfSuggestionsInSuggestionView:(id)a3 forSection:(unint64_t)a4;
- (void)_enumerateAllAutomaticConfirmedMentionsInAttributedString:(id)a3 usingBlock:(id)a4;
- (void)_enumerateNode:(id)a3 parentNodes:(id)a4 enumerator:(id)a5;
- (void)_populateSupplementalLexiconAsynchronously;
- (void)_updateMentionsLexiconWithItems:(id)a3;
- (void)acceptAutomaticMentionConfirmation;
- (void)associateEntity:(id)a3 withKey:(id)a4;
- (void)cancelChooseSupplementalItemToInsert;
- (void)checkForMentions;
- (void)checkForMentionsInAttributedString:(id)a3 inTextView:(id)a4;
- (void)checkForMentionsInAttributedString:(id)a3 textViewToUpdate:(id)a4 restoreSelectedRange:(_NSRange)a5;
- (void)chooseSupplementalItemToInsert:(id)a3 replacementRange:(id)a4 completionHandler:(id)a5;
- (void)configureAttributedString:(id)a3 inTextView:(id)a4 forMentionOverrideInRange:(_NSRange)a5 shouldOverride:(BOOL)a6;
- (void)confirmAutomaticMention:(id)a3 inTextView:(id)a4 isSending:(BOOL)a5 selectedRange:(_NSRange *)a6;
- (void)confirmAutomaticMention:(id)a3 inTextView:(id)a4 selectedRange:(_NSRange *)a5;
- (void)didDismissPaddleOverlayView:(id)a3;
- (void)didFinishAnimatingMentionWithAnimationIdentifier:(id)a3;
- (void)didSetAttributedTextOfTextView;
- (void)didTapMentionAtCharacterIndex:(double)a3;
- (void)dismissPaddleOverlayIfNecessaryForText:(id)a3;
- (void)insertMentionByName:(id)a3;
- (void)insertMentionWithEntity:(id)a3 replacementRange:(_NSRange)a4 fallbackName:(id)a5 source:(unsigned __int8)a6;
- (void)insertSupplementalItem:(id)a3 forString:(id)a4 replacementRange:(id)a5;
- (void)insertionPointEnteredRange:(_NSRange)a3 forMention:(id)a4 withEntities:(id)a5;
- (void)insertionPointEnteredRange:(id)a3 string:(id)a4 supplementalItems:(id)a5;
- (void)insertionPointExitedRangeWithSupplementalItems;
- (void)localeChanged;
- (void)mentionsAnimationController:(id)a3 didFinishMentionAnimationWithIdentifier:(id)a4;
- (void)reloadMentionsData;
- (void)replaceAttributedText:(id)a3 inTextView:(id)a4 atIndex:(unint64_t)a5 updatedSelectedRange:(_NSRange *)a6 replacementRange:(_NSRange *)a7;
- (void)resetStyleInAttributedString:(id)a3 inTextView:(id)a4 andApplyStyleUsingBlock:(id)a5;
- (void)setConversation:(id)a3;
- (void)setCurrentMentionSuggestions:(id)a3;
- (void)setCurrentMentionWithoutPrefixRange:(_NSRange)a3;
- (void)setCurrentTappedCharacterIndex:(unint64_t)a3;
- (void)setDidSelectEntityCompletionHandler:(id)a3;
- (void)setEntityDictionary:(id)a3;
- (void)setEntityHandles:(id)a3;
- (void)setEntityTree:(id)a3;
- (void)setIsUpdatingMentionAttributedText:(BOOL)a3;
- (void)setLanguageHasSpaces:(BOOL)a3;
- (void)setLastFoundMentionRange:(_NSRange)a3;
- (void)setMentionSuggestionView:(id)a3;
- (void)setMentionsAnimationController:(id)a3;
- (void)setMentionsLexicon:(id)a3;
- (void)setNumberOfCurrentMentionWithoutPrefixRangeTouches:(int64_t)a3;
- (void)setPaddleOverlayView:(id)a3;
- (void)setPreventShowingCalloutMenu:(BOOL)a3;
- (void)setRangeOfTappedMention:(_NSRange)a3;
- (void)setShowMentionSuggestions:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setShowingMentionsSuggestions:(BOOL)a3;
- (void)setTextEffectsDelegate:(id)a3;
- (void)setTextView:(id)a3;
- (void)showMentionSuggestionsForEntities:(id)a3 replacementRange:(_NSRange)a4;
- (void)suggestionView:(id)a3 didSelectEntity:(id)a4;
- (void)suggestionViewDidSelectEntity:(id)a3;
- (void)updateMentionsAssociations;
- (void)updateTextViewIfNecessary:(id)a3 withAttributedString:(id)a4;
- (void)updateTextViewIfNecessary:(id)a3 withAttributedString:(id)a4 selectedRange:(_NSRange)a5;
- (void)updateTypingAttributesIfNeededForTextView:(id)a3;
@end

@implementation CKMentionsController

- (CKMentionsController)initWithEntryTextView:(id)a3 conversation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CKMentionsController;
  v9 = [(CKMentionsController *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_textView, a3);
    objc_storeStrong((id *)&v10->_conversation, a4);
    [v7 setMentionsDelegate:v10];
    v11 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v12 = [v11 isTextKit2Enabled];

    if (v12)
    {
      v13 = [CKMentionsAnimationController alloc];
      v14 = [(CKMentionsController *)v10 textView];
      uint64_t v15 = [(CKMentionsAnimationController *)v13 initWithEntryTextView:v14];
      mentionsAnimationController = v10->_mentionsAnimationController;
      v10->_mentionsAnimationController = (CKMentionsAnimationController *)v15;

      [(CKMentionsAnimationController *)v10->_mentionsAnimationController setDelegate:v10];
    }
  }

  return v10;
}

- (unint64_t)numberOfSuggestionsInSuggestionView:(id)a3 forSection:(unint64_t)a4
{
  id v5 = a3;
  id v6 = [(CKMentionsController *)self mentionSuggestionView];

  if (v6 != v5) {
    return 0;
  }
  id v8 = [(CKMentionsController *)self currentMentionSuggestions];
  unint64_t v9 = [v8 count];

  return v9;
}

- (id)suggestionView:(id)a3 entityAtIndex:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(CKMentionsController *)self mentionSuggestionView];
  if ((id)v7 != v6)
  {
    id v8 = (void *)v7;
    unint64_t v9 = 0;
LABEL_5:

    goto LABEL_7;
  }
  v10 = [(CKMentionsController *)self currentMentionSuggestions];
  unint64_t v11 = [v10 count];

  if (v11 > a4)
  {
    id v8 = [(CKMentionsController *)self currentMentionSuggestions];
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
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  objc_super v18 = __Block_byref_object_copy__30;
  v19 = __Block_byref_object_dispose__30;
  id v20 = 0;
  id v8 = [(CKMentionsController *)self mentionSuggestionView];

  if (v8 == v6)
  {
    unint64_t v9 = [(CKMentionsController *)self currentMentionSuggestions];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __71__CKMentionsController_suggestionView_indexPathOfEntityWithIdentifier___block_invoke;
    v12[3] = &unk_1E5625F70;
    id v13 = v7;
    v14 = &v15;
    [v9 enumerateObjectsUsingBlock:v12];
  }
  id v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v10;
}

void __71__CKMentionsController_suggestionView_indexPathOfEntityWithIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = [a2 defaultIMHandle];
  id v8 = [v7 ID];
  int v9 = [v8 isEqualToString:*(void *)(a1 + 32)];

  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F28D58] indexPathWithIndex:a3];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    int v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    *a4 = 1;
  }
}

- (void)suggestionView:(id)a3 didSelectEntity:(id)a4
{
  id v7 = a4;
  id v5 = [(CKMentionsController *)self didSelectEntityCompletionHandler];

  if (v5)
  {
    id v6 = [(CKMentionsController *)self didSelectEntityCompletionHandler];
    [(CKMentionsController *)self setDidSelectEntityCompletionHandler:0];
    ((void (**)(void, id))v6)[2](v6, v7);
  }
  else
  {
    [(CKMentionsController *)self suggestionViewDidSelectEntity:v7];
  }
}

- (CKMentionSuggestionView)mentionSuggestionView
{
  if (!self->_mentionSuggestionView
    && [(CKMentionsController *)self shouldShowMentionSuggestions])
  {
    v3 = objc_alloc_init(CKMentionSuggestionView);
    mentionSuggestionView = self->_mentionSuggestionView;
    self->_mentionSuggestionView = v3;

    [(CKMentionSuggestionView *)self->_mentionSuggestionView setClipsToBounds:1];
    [(CKMentionSuggestionView *)self->_mentionSuggestionView setDataSource:self];
    [(CKMentionSuggestionView *)self->_mentionSuggestionView setDelegate:self];
    id v5 = [(CKMentionsController *)self textView];
    [v5 setNeedsLayout];
  }
  id v6 = self->_mentionSuggestionView;

  return v6;
}

- (_NSRange)_rangeFromUITextRange:(id)a3
{
  id v4 = a3;
  id v5 = [(CKMentionsController *)self textView];
  id v6 = [(CKMentionsController *)self textView];
  id v7 = [v6 beginningOfDocument];
  id v8 = [v4 start];
  uint64_t v9 = [v5 offsetFromPosition:v7 toPosition:v8];

  uint64_t v10 = [(CKMentionsController *)self textView];
  uint64_t v11 = [v4 start];
  int v12 = [v4 end];

  uint64_t v13 = [v10 offsetFromPosition:v11 toPosition:v12];
  NSUInteger v14 = v9;
  NSUInteger v15 = v13;
  result.length = v15;
  result.location = v14;
  return result;
}

- (CGRect)anchorRect
{
  v3 = [(CKMentionsController *)self textView];
  [v3 textContainerInset];
  double v5 = v4;
  double v7 = v6;
  id v8 = [v3 textContainer];
  uint64_t v9 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v10 = [v9 isTextKit2Enabled];

  if (v10)
  {
    [(CKMentionsController *)self rangeOfTappedMention];
    if (!v11)
    {
      double v26 = *MEMORY[0x1E4F1DB28];
      double v28 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v30 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v32 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      goto LABEL_6;
    }
    int v12 = [v3 textLayoutManager];
    uint64_t v13 = [v12 documentRange];
    NSUInteger v14 = [v13 location];
    NSUInteger v15 = objc_msgSend(v12, "locationFromLocation:withOffset:", v14, -[CKMentionsController rangeOfTappedMention](self, "rangeOfTappedMention"));

    [(CKMentionsController *)self rangeOfTappedMention];
    uint64_t v17 = [v12 locationFromLocation:v15 withOffset:v16];
    objc_super v18 = (void *)[objc_alloc(MEMORY[0x1E4FB08B0]) initWithLocation:v15 endLocation:v17];
    v19 = [v12 documentRange];
    [v12 ensureLayoutForRange:v19];

    uint64_t v58 = 0;
    v59 = (double *)&v58;
    uint64_t v60 = 0x4010000000;
    v61 = "";
    long long v62 = 0u;
    long long v63 = 0u;
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __34__CKMentionsController_anchorRect__block_invoke;
    v57[3] = &unk_1E5625F98;
    v57[4] = &v58;
    [v12 enumerateTextSegmentsInRange:v18 type:0 options:0 usingBlock:v57];
    double v20 = v59[4];
    double v21 = v59[5];
    double v22 = v59[6];
    double v23 = v59[7];
    v24 = [(CKMentionsController *)self textView];
    objc_msgSend(v3, "convertRect:toView:", v24, v7 + v20, v5 + v21, v22, v23);
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;
    double v32 = v31;

    _Block_object_dispose(&v58, 8);
  }
  else
  {
    int v12 = [v3 layoutManager];
    uint64_t v33 = [(CKMentionsController *)self rangeOfTappedMention];
    objc_msgSend(v12, "boundingRectForGlyphRange:inTextContainer:", v33, v34, v8);
    uint64_t v36 = v35;
    uint64_t v38 = v37;
    uint64_t v40 = v39;
    uint64_t v42 = v41;
    uint64_t v58 = 0;
    v59 = (double *)&v58;
    uint64_t v60 = 0x4010000000;
    v61 = "";
    *(void *)&long long v62 = v35;
    *((void *)&v62 + 1) = v37;
    *(void *)&long long v63 = v39;
    *((void *)&v63 + 1) = v41;
    uint64_t v43 = [(CKMentionsController *)self rangeOfTappedMention];
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __34__CKMentionsController_anchorRect__block_invoke_2;
    v56[3] = &unk_1E5625FC0;
    v56[5] = v36;
    v56[6] = v38;
    v56[7] = v40;
    v56[8] = v42;
    v56[4] = &v58;
    objc_msgSend(v12, "enumerateEnclosingRectsForGlyphRange:withinSelectedGlyphRange:inTextContainer:usingBlock:", v43, v44, 0x7FFFFFFFFFFFFFFFLL, 0, v8, v56);
    v45 = v59;
    double v46 = v5 + v59[5];
    v59[4] = v7 + v59[4];
    v45[5] = v46;
    v47 = [(CKMentionsController *)self textView];
    objc_msgSend(v3, "convertRect:toView:", v47, v45[4], v45[5], v45[6], v45[7]);
    double v26 = v48;
    double v28 = v49;
    double v30 = v50;
    double v32 = v51;

    _Block_object_dispose(&v58, 8);
  }

LABEL_6:
  double v52 = v26;
  double v53 = v28;
  double v54 = v30;
  double v55 = v32;
  result.size.height = v55;
  result.size.width = v54;
  result.origin.y = v53;
  result.origin.x = v52;
  return result;
}

uint64_t __34__CKMentionsController_anchorRect__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double v5 = *(double **)(*(void *)(a1 + 32) + 8);
  v5[4] = a2;
  v5[5] = a3;
  v5[6] = a4;
  v5[7] = a5;
  return 0;
}

BOOL __34__CKMentionsController_anchorRect__block_invoke_2(uint64_t a1, unsigned char *a2, double a3, double a4, double a5, double a6)
{
  BOOL result = CGRectIntersectsRect(*(CGRect *)&a3, *(CGRect *)(a1 + 40));
  if (result)
  {
    uint64_t v13 = *(double **)(*(void *)(a1 + 32) + 8);
    v13[4] = a3;
    v13[5] = a4;
    v13[6] = a5;
    v13[7] = a6;
    *a2 = 1;
  }
  return result;
}

- (CKPaddleOverlayView)paddleOverlayView
{
  if (!self->_paddleOverlayView
    && [(CKMentionsController *)self shouldShowMentionSuggestions])
  {
    v3 = [CKPaddleOverlayView alloc];
    double v4 = [(CKMentionsController *)self mentionSuggestionView];
    [(CKMentionsController *)self anchorRect];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    uint64_t v13 = [(CKMentionsController *)self textView];
    NSUInteger v14 = -[CKPaddleOverlayView initWithOverlayView:atAnchorRect:inView:delegate:](v3, "initWithOverlayView:atAnchorRect:inView:delegate:", v4, v13, self, v6, v8, v10, v12);
    paddleOverlayView = self->_paddleOverlayView;
    self->_paddleOverlayView = v14;
  }
  uint64_t v16 = self->_paddleOverlayView;

  return v16;
}

- (BOOL)isValidPrefixCharacter:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  if (![(CKMentionsController *)self languageHasSpaces]) {
    return 1;
  }
  double v4 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  if ([v4 characterIsMember:v3])
  {
    char v5 = 1;
  }
  else
  {
    double v6 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
    char v5 = [v6 characterIsMember:v3];
  }
  return v5;
}

- (BOOL)range:(_NSRange)a3 hasValidPrefixCharacterForString:(id)a4
{
  int64_t location = a3.location;
  id v6 = a4;
  double v7 = v6;
  if (!location || (int64_t v8 = location - 1, location == 1)) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = ([v6 characterAtIndex:location - 1] != 64
  }
       || location >= 2 && (int64_t v8 = location - 2, location - 2 < (unint64_t)[v7 length]))
      && -[CKMentionsController isValidPrefixCharacter:](self, "isValidPrefixCharacter:", [v7 characterAtIndex:v8]);

  return v9;
}

- (BOOL)allowsMentions
{
  v2 = [(CKMentionsController *)self conversation];
  char v3 = [v2 allowsMentions];

  return v3;
}

- (void)checkForMentions
{
  char v3 = [(CKMentionsController *)self textView];
  double v4 = [v3 attributedText];
  id v6 = (id)[v4 mutableCopy];

  LODWORD(v4) = +[CKMentionsUtilities supportsSupplementalLexiconMentions];
  char v5 = [(CKMentionsController *)self textView];
  if (v4) {
    [(CKMentionsController *)self resetStyleInAttributedString:v6 inTextView:v5 andApplyStyleUsingBlock:&__block_literal_global_90];
  }
  else {
    [(CKMentionsController *)self checkForMentionsInAttributedString:v6 inTextView:v5];
  }
}

- (void)_enumerateNode:(id)a3 parentNodes:(id)a4 enumerator:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  BOOL v9 = (unsigned int (**)(id, void, void *))a5;
  double v10 = [a4 arrayByAddingObject:v8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  double v11 = objc_msgSend(v8, "children", 0);
  double v12 = [v11 allValues];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
LABEL_3:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v19 != v15) {
        objc_enumerationMutation(v12);
      }
      uint64_t v17 = *(void *)(*((void *)&v18 + 1) + 8 * v16);
      if (!v9[2](v9, v17, v10)) {
        break;
      }
      [(CKMentionsController *)self _enumerateNode:v17 parentNodes:v10 enumerator:v9];
      if (v14 == ++v16)
      {
        uint64_t v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v14) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (id)_nodeIdForMentionNode:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v11 = 0;
    double v12 = &v11;
    uint64_t v13 = 0x3032000000;
    uint64_t v14 = __Block_byref_object_copy__30;
    uint64_t v15 = __Block_byref_object_dispose__30;
    uint64_t v16 = 0;
    uint64_t v16 = objc_alloc_init(CKMentionAutoCompleteNodeId);
    char v5 = [(CKMentionsController *)self entityTree];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __46__CKMentionsController__nodeIdForMentionNode___block_invoke;
    v8[3] = &unk_1E5625FE8;
    id v9 = v4;
    double v10 = &v11;
    [(CKMentionsController *)self _enumerateNode:v5 parentNodes:MEMORY[0x1E4F1CBF0] enumerator:v8];

    id v6 = (id)v12[5];
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

BOOL __46__CKMentionsController__nodeIdForMentionNode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  double v7 = v6;
  id v8 = *(id *)(a1 + 32);
  if (v8 == v5)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v9 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v27 != v11) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          uint64_t v14 = [v13 key];

          if (v14)
          {
            uint64_t v15 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
            uint64_t v16 = [v13 key];
            uint64_t v17 = [v15 nodeIdByAppendingKey:v16];
            uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
            long long v19 = *(void **)(v18 + 40);
            *(void *)(v18 + 40) = v17;
          }
        }
        uint64_t v10 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v10);
    }
    long long v20 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    long long v21 = [v5 key];
    uint64_t v22 = [v20 nodeIdByAppendingKey:v21];
    uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8);
    v24 = *(void **)(v23 + 40);
    *(void *)(v23 + 40) = v22;
  }
  return v8 != v5;
}

- (id)_nodeForMentionNodeId:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CKMentionsController *)self entityTree];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = objc_msgSend(v4, "keys", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      uint64_t v10 = 0;
      uint64_t v11 = v5;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = [v11 childWithKey:*(void *)(*((void *)&v15 + 1) + 8 * v10)];
        if (!v12)
        {
          id v13 = v11;

          goto LABEL_11;
        }
        id v5 = (void *)v12;

        ++v10;
        uint64_t v11 = v5;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  id v13 = v5;
LABEL_11:

  return v13;
}

- (void)dismissPaddleOverlayIfNecessaryForText:(id)a3
{
  id v4 = a3;
  if (!+[CKMentionsUtilities supportsSupplementalLexiconMentions])
  {
    if (objc_msgSend(v4, "attribute:existsInRange:", *MEMORY[0x1E4F6D508], 0, objc_msgSend(v4, "length"))) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if ([(CKMentionsController *)self currentTappedCharacterIndex] == 0x7FFFFFFFFFFFFFFFLL) {
LABEL_5:
  }
    [(CKMentionsController *)self setShowMentionSuggestions:0 animated:1 completion:0];
LABEL_6:
}

- (void)checkForMentionsInAttributedString:(id)a3 textViewToUpdate:(id)a4 restoreSelectedRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v9 = a3;
  id v10 = a4;
  if ([(CKMentionsController *)self allowsMentions])
  {
    if (![(CKMentionsController *)self isUpdatingMentionAttributedText])
    {
      uint64_t v11 = [v10 markedTextRange];

      if (!v11)
      {
        uint64_t v34 = 0;
        uint64_t v35 = &v34;
        uint64_t v36 = 0x2020000000;
        char v37 = 0;
        v33[0] = [(CKMentionsController *)self lastFoundMentionRange];
        v33[1] = v12;
        +[CKMentionsUtilities configureAttributedStringForMentionsChecking:v9 excludingRange:v33];
        [(CKMentionsController *)self dismissPaddleOverlayIfNecessaryForText:v9];
        v31[0] = 0;
        v31[1] = v31;
        v31[2] = 0x3032000000;
        v31[3] = __Block_byref_object_copy__30;
        v31[4] = __Block_byref_object_dispose__30;
        id v32 = 0;
        id v32 = [(CKMentionsController *)self entityTree];
        v29[0] = 0;
        v29[1] = v29;
        v29[2] = 0x3010000000;
        v29[3] = "";
        long long v30 = xmmword_18F81B060;
        id v13 = [v9 string];
        uint64_t v14 = [v9 string];
        uint64_t v15 = [v14 length];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __97__CKMentionsController_checkForMentionsInAttributedString_textViewToUpdate_restoreSelectedRange___block_invoke;
        v20[3] = &unk_1E5626010;
        id v16 = v9;
        v24 = v31;
        double v25 = v29;
        id v21 = v16;
        uint64_t v22 = self;
        NSUInteger v27 = location;
        NSUInteger v28 = length;
        id v17 = v10;
        id v23 = v17;
        long long v26 = &v34;
        objc_msgSend(v13, "enumerateSubstringsInRange:options:usingBlock:", 0, v15, 2, v20);

        NSUInteger v18 = location;
        NSUInteger v19 = length;
        [(CKMentionsController *)self confirmAutomaticMention:v16 inTextView:v17 selectedRange:&v18];
        -[CKMentionsController updateTextViewIfNecessary:withAttributedString:selectedRange:](self, "updateTextViewIfNecessary:withAttributedString:selectedRange:", v17, v16, v18, v19);
        if (!*((unsigned char *)v35 + 24)) {
          [(CKMentionsController *)self resetCurrentMentionWithoutPrefixTracking];
        }

        _Block_object_dispose(v29, 8);
        _Block_object_dispose(v31, 8);

        _Block_object_dispose(&v34, 8);
      }
    }
  }
}

void __97__CKMentionsController_checkForMentionsInAttributedString_textViewToUpdate_restoreSelectedRange___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  uint64_t v47 = 0;
  uint64_t v48 = 0;
  uint64_t v8 = *MEMORY[0x1E4F6D538];
  id v9 = [*(id *)(a1 + 32) attribute:*MEMORY[0x1E4F6D538] atIndex:a3 effectiveRange:&v47];

  if (!v9)
  {
    uint64_t v11 = [v7 mentionsSafeText];
    if (![v11 length]) {
      goto LABEL_22;
    }
    unint64_t v14 = 0;
    uint64_t v15 = 0;
    while (1)
    {
      id v16 = objc_msgSend(v11, "substringWithRange:", v14, 1);
      id v17 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) children];
      NSUInteger v18 = [v17 objectForKey:v16];

      if (!v18) {
        break;
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v18);

      ++v14;
      uint64_t v15 = v18;
      if ([v11 length] <= v14) {
        goto LABEL_11;
      }
    }
    *(_OWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 32) = xmmword_18F81B060;
    uint64_t v19 = [*(id *)(a1 + 40) entityTree];
    uint64_t v20 = *(void *)(*(void *)(a1 + 56) + 8);
    id v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;

    uint64_t v22 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) children];
    NSUInteger v18 = [v22 objectForKey:v16];

    if (!v18) {
      goto LABEL_22;
    }
LABEL_11:
    uint64_t v23 = +[CKMentionsUtilities range:appendingSubstringRange:](CKMentionsUtilities, "range:appendingSubstringRange:", *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 32), *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a3, a4);
    uint64_t v24 = *(void *)(*(void *)(a1 + 64) + 8);
    *(void *)(v24 + 32) = v23;
    *(void *)(v24 + 40) = v25;
    long long v26 = [v18 entities];
    if (![v26 count]) {
      goto LABEL_20;
    }
    uint64_t v27 = *(void *)(*(void *)(a1 + 64) + 8);
    NSUInteger v28 = *(void **)(a1 + 40);
    long long v29 = [*(id *)(a1 + 32) string];
    LODWORD(v28) = objc_msgSend(v28, "range:hasValidPrefixCharacterForString:", *(void *)(v27 + 32), *(void *)(v27 + 40), v29);

    if (!v28)
    {
LABEL_21:
      uint64_t v43 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v44 = *(void **)(v43 + 40);
      *(void *)(v43 + 40) = v18;
      id v45 = v18;

      goto LABEL_22;
    }
    long long v30 = [v18 entities];
    uint64_t v31 = [v30 count];

    uint64_t v32 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v33 = [*(id *)(a1 + 32) string];
    BOOL v34 = +[CKMentionsUtilities range:isPrefixedWithAtForString:](CKMentionsUtilities, "range:isPrefixedWithAtForString:", *(void *)(v32 + 32), *(void *)(v32 + 40), v33);

    BOOL v35 = +[CKMentionsUtilities range:containsEmptySelectedRange:](CKMentionsUtilities, "range:containsEmptySelectedRange:", *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 32), *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(void *)(a1 + 80), *(void *)(a1 + 88));
    int v36 = objc_msgSend(*(id *)(a1 + 40), "attributedString:shouldAddAutoCompleteAttributeForRange:", *(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 32), *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
    long long v26 = [*(id *)(a1 + 40) _nodeIdForMentionNode:v18];
    if (v31 == 1 && v34 && v36)
    {
      uint64_t v37 = *(void *)(a1 + 32);
      uint64_t v38 = *(void *)(a1 + 48);
      uint64_t v39 = *(void *)(*(void *)(a1 + 64) + 8);
      uint64_t v40 = *(void *)(v39 + 32);
      uint64_t v41 = *(void *)(v39 + 40);
      BYTE1(v46) = 1;
      LOBYTE(v46) = v35;
    }
    else
    {
      if (!v34 || !v35)
      {
        if (v35)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
          objc_msgSend(*(id *)(a1 + 40), "updateCurrentMentionWithoutPrefixTracking:", *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 32), *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
          +[CKMentionsUtilities configureAttributedString:inTextView:forUnconfirmedMentionInRange:](CKMentionsUtilities, "configureAttributedString:inTextView:forUnconfirmedMentionInRange:", *(void *)(a1 + 32), *(void *)(a1 + 48), *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 32), *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
        }
        goto LABEL_20;
      }
      uint64_t v37 = *(void *)(a1 + 32);
      uint64_t v38 = *(void *)(a1 + 48);
      uint64_t v42 = *(void *)(*(void *)(a1 + 64) + 8);
      uint64_t v40 = *(void *)(v42 + 32);
      uint64_t v41 = *(void *)(v42 + 40);
      LOWORD(v46) = 1;
    }
    +[CKMentionsUtilities configureAttributedString:v37 inTextView:v38 forDirectMentionInRange:v40 forChildNode:v41 nodeId:v18 addingVisualStyling:v26 shouldAddAutoComplete:v46];
LABEL_20:

    goto LABEL_21;
  }
  id v10 = [*(id *)(a1 + 32) attributesAtIndex:a3 effectiveRange:0];
  uint64_t v11 = [v10 objectForKeyedSubscript:v8];

  uint64_t v12 = [*(id *)(a1 + 40) entityHandles];
  int v13 = [v12 containsObject:v11];

  if (v13) {
    +[CKMentionsUtilities configureAttributedString:inTextView:forConfirmedMentionInRange:needingAnimation:](CKMentionsUtilities, "configureAttributedString:inTextView:forConfirmedMentionInRange:needingAnimation:", *(void *)(a1 + 32), *(void *)(a1 + 48), v47, v48, 0);
  }
  else {
    +[CKMentionsUtilities removeMentionsAtIndex:a3 onAttributedString:*(void *)(a1 + 32) inTextView:*(void *)(a1 + 48)];
  }
LABEL_22:
}

- (void)checkForMentionsInAttributedString:(id)a3 inTextView:(id)a4
{
  id v6 = a4;
  id v9 = a3;
  uint64_t v7 = [v6 selectedRange];
  -[CKMentionsController checkForMentionsInAttributedString:textViewToUpdate:restoreSelectedRange:](self, "checkForMentionsInAttributedString:textViewToUpdate:restoreSelectedRange:", v9, v6, v7, v8);
}

- (void)updateTextViewIfNecessary:(id)a3 withAttributedString:(id)a4
{
  id v6 = a4;
  id v9 = a3;
  uint64_t v7 = [v9 selectedRange];
  -[CKMentionsController updateTextViewIfNecessary:withAttributedString:selectedRange:](self, "updateTextViewIfNecessary:withAttributedString:selectedRange:", v9, v6, v7, v8);
}

- (void)updateTextViewIfNecessary:(id)a3 withAttributedString:(id)a4 selectedRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v8 = a4;
  id v9 = [(CKMentionsController *)self textView];
  id v10 = [v9 markedTextRange];

  if (!v10)
  {
    uint64_t v11 = [(CKMentionsController *)self textView];
    uint64_t v12 = [v11 attributedText];
    char v13 = [v8 isEqual:v12];

    if (v13)
    {
      unint64_t v14 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      int v15 = [v14 isTextKit2Enabled];

      if (v15)
      {
        id v16 = [(CKMentionsController *)self mentionsAnimationController];
        [v16 updateMentionAttributes:v8];
      }
      else
      {
        NSUInteger v18 = [(CKMentionsController *)self textView];
        uint64_t v19 = [v18 layoutManager];

        [v19 updateMentionAttributes:v8];
      }
    }
    else
    {
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      uint64_t v22 = __85__CKMentionsController_updateTextViewIfNecessary_withAttributedString_selectedRange___block_invoke;
      uint64_t v23 = &unk_1E5626038;
      uint64_t v24 = self;
      id v25 = v8;
      NSUInteger v26 = location;
      NSUInteger v27 = length;
      id v17 = (void (**)(void))_Block_copy(&v20);
      if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", v20, v21, v22, v23, v24)) {
        v17[2](v17);
      }
      else {
        dispatch_async(MEMORY[0x1E4F14428], v17);
      }
    }
  }
}

uint64_t __85__CKMentionsController_updateTextViewIfNecessary_withAttributedString_selectedRange___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsUpdatingMentionAttributedText:1];
  v2 = [*(id *)(a1 + 32) textView];
  [v2 setAttributedText:*(void *)(a1 + 40)];

  char v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isTextKit2Enabled];

  id v5 = *(void **)(a1 + 32);
  if (v4)
  {
    id v6 = [v5 mentionsAnimationController];
  }
  else
  {
    uint64_t v7 = [v5 textView];
    id v6 = [v7 layoutManager];
  }
  [v6 updateMentionAttributes:*(void *)(a1 + 40)];

  id v8 = [*(id *)(a1 + 32) textView];
  objc_msgSend(v8, "setSelectedRange:", *(void *)(a1 + 48), *(void *)(a1 + 56));

  id v9 = [*(id *)(a1 + 32) textView];
  id v10 = [*(id *)(a1 + 32) textView];
  [v10 bounds];
  objc_msgSend(v9, "setNeedsDisplayInRect:");

  uint64_t v11 = *(void **)(a1 + 32);
  uint64_t v12 = [v11 textView];
  [v11 updateTypingAttributesIfNeededForTextView:v12];

  char v13 = *(void **)(a1 + 32);

  return [v13 setIsUpdatingMentionAttributedText:0];
}

- (void)updateTypingAttributesIfNeededForTextView:(id)a3
{
  id v13 = a3;
  char v3 = [v13 textColor];
  int v4 = +[CKUIBehavior sharedBehaviors];
  id v5 = [v4 theme];
  id v6 = [v5 entryFieldTextColor];
  char v7 = [v3 isEqual:v6];

  if ((v7 & 1) == 0)
  {
    id v8 = [v13 typingAttributes];
    id v9 = (void *)[v8 mutableCopy];

    id v10 = +[CKUIBehavior sharedBehaviors];
    uint64_t v11 = [v10 theme];
    uint64_t v12 = [v11 entryFieldTextColor];
    [v9 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4FB0700]];

    [v13 setTypingAttributes:v9];
  }
}

- (void)didFinishAnimatingMentionWithAnimationIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CKMentionsController *)self textView];
  id v6 = [v5 attributedText];
  char v7 = (void *)[v6 mutableCopy];

  uint64_t v8 = *MEMORY[0x1E4F6D510];
  uint64_t v9 = [v7 length];
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  uint64_t v24 = __73__CKMentionsController_didFinishAnimatingMentionWithAnimationIdentifier___block_invoke;
  id v25 = &unk_1E5625D98;
  id v10 = v4;
  id v26 = v10;
  id v11 = v7;
  id v27 = v11;
  objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", v8, 0, v9, 2, &v22);
  uint64_t v12 = [(CKMentionsController *)self textView];
  id v13 = [v12 markedTextRange];

  if (v13)
  {
    unint64_t v14 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v15 = [v14 isTextKit2Enabled];

    if (v15)
    {
      [(CKMentionsAnimationController *)self->_mentionsAnimationController updateMentionAttributes:v11];
    }
    else
    {
      id v16 = [(CKMentionsController *)self textView];
      id v17 = [v16 layoutManager];

      [v17 updateMentionAttributes:v11];
    }
  }
  NSUInteger v18 = [(CKMentionsController *)self textView];
  [(CKMentionsController *)self updateTextViewIfNecessary:v18 withAttributedString:v11];

  uint64_t v19 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v20 = [v19 isTextKit2Enabled];

  if (v20)
  {
    uint64_t v21 = [(CKMentionsController *)self textEffectsDelegate];
    [v21 mentionsControllerDidFinishAnimation:self];
  }
}

uint64_t __73__CKMentionsController_didFinishAnimatingMentionWithAnimationIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t result = [a2 isEqualToString:*(void *)(a1 + 32)];
  if (result)
  {
    uint64_t result = objc_msgSend(*(id *)(a1 + 40), "removeAttribute:range:", *MEMORY[0x1E4F6D510], a3, a4);
    *a5 = 1;
  }
  return result;
}

- (void)resetStyleInAttributedString:(id)a3 inTextView:(id)a4 andApplyStyleUsingBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(void))a5;
  if ([(CKMentionsController *)self allowsMentions])
  {
    if (![(CKMentionsController *)self isUpdatingMentionAttributedText])
    {
      id v11 = [v9 markedTextRange];

      if (!v11)
      {
        v23[0] = [(CKMentionsController *)self lastFoundMentionRange];
        v23[1] = v12;
        +[CKMentionsUtilities configureAttributedStringForMentionsChecking:v8 excludingRange:v23];
        [(CKMentionsController *)self dismissPaddleOverlayIfNecessaryForText:v8];
        uint64_t v13 = *MEMORY[0x1E4F6D538];
        unint64_t v14 = [v8 string];
        uint64_t v15 = [v14 length];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __88__CKMentionsController_resetStyleInAttributedString_inTextView_andApplyStyleUsingBlock___block_invoke;
        v20[3] = &unk_1E5626060;
        void v20[4] = self;
        id v16 = v8;
        id v21 = v16;
        id v17 = v9;
        id v22 = v17;
        objc_msgSend(v16, "enumerateAttribute:inRange:options:usingBlock:", v13, 0, v15, 2, v20);

        v10[2](v10);
        uint64_t v18 = [v17 selectedRange];
        -[CKMentionsController updateTextViewIfNecessary:withAttributedString:selectedRange:](self, "updateTextViewIfNecessary:withAttributedString:selectedRange:", v17, v16, v18, v19);
      }
    }
  }
}

void __88__CKMentionsController_resetStyleInAttributedString_inTextView_andApplyStyleUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (v7)
  {
    id v10 = v7;
    id v8 = [*(id *)(a1 + 32) entityHandles];
    int v9 = [v8 containsObject:v10];

    if (v9) {
      +[CKMentionsUtilities configureAttributedString:inTextView:forConfirmedMentionInRange:needingAnimation:](CKMentionsUtilities, "configureAttributedString:inTextView:forConfirmedMentionInRange:needingAnimation:", *(void *)(a1 + 40), *(void *)(a1 + 48), a3, a4, 0);
    }
    else {
      +[CKMentionsUtilities removeMentionsAtIndex:a3 onAttributedString:*(void *)(a1 + 40) inTextView:*(void *)(a1 + 48)];
    }
    id v7 = v10;
  }
}

- (void)insertionPointEnteredRange:(_NSRange)a3 forMention:(id)a4 withEntities:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v9 = a4;
  id v10 = a5;
  -[CKMentionsController setLastFoundMentionRange:](self, "setLastFoundMentionRange:", location, length);
  [(CKMentionsController *)self setCurrentMentionSuggestions:v10];
  id v11 = [(CKMentionsController *)self textView];
  uint64_t v12 = [v11 attributedText];
  uint64_t v13 = (void *)[v12 mutableCopy];

  unint64_t v14 = [(CKMentionsController *)self textView];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __75__CKMentionsController_insertionPointEnteredRange_forMention_withEntities___block_invoke;
  v18[3] = &unk_1E5626088;
  NSUInteger v23 = location;
  NSUInteger v24 = length;
  id v19 = v13;
  id v20 = v10;
  id v21 = self;
  id v22 = v9;
  id v15 = v9;
  id v16 = v10;
  id v17 = v13;
  [(CKMentionsController *)self resetStyleInAttributedString:v17 inTextView:v14 andApplyStyleUsingBlock:v18];
}

void __75__CKMentionsController_insertionPointEnteredRange_forMention_withEntities___block_invoke(uint64_t a1)
{
  v18[0] = 0;
  v18[1] = 0;
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v3 = *(void *)(a1 + 72);
  id v4 = [*(id *)(a1 + 32) attribute:*MEMORY[0x1E4F6D538] atIndex:v2 effectiveRange:v18];

  if (!v4)
  {
    if ([*(id *)(a1 + 40) count])
    {
      id v5 = *(void **)(a1 + 48);
      id v6 = [*(id *)(a1 + 32) string];
      LODWORD(v5) = objc_msgSend(v5, "range:hasValidPrefixCharacterForString:", v2, v3, v6);

      if (v5)
      {
        int v7 = [*(id *)(a1 + 56) characterAtIndex:0];
        id v8 = [*(id *)(a1 + 48) textView];
        uint64_t v9 = [v8 selectedRange];
        BOOL v11 = +[CKMentionsUtilities range:containsEmptySelectedRange:](CKMentionsUtilities, "range:containsEmptySelectedRange:", v2, v3, v9, v10);

        if (v7 == 64 && v11)
        {
          uint64_t v12 = v3 - 1;
          if (!v12) {
            __75__CKMentionsController_insertionPointEnteredRange_forMention_withEntities___block_invoke_cold_1();
          }
          uint64_t v13 = [*(id *)(a1 + 48) _nodeIdForMentionNode:0];
          uint64_t v14 = *(void *)(a1 + 32);
          id v15 = [*(id *)(a1 + 48) textView];
          LOWORD(v17) = 1;
          +[CKMentionsUtilities configureAttributedString:v14 inTextView:v15 forDirectMentionInRange:v2 + 1 forChildNode:v12 nodeId:0 addingVisualStyling:v13 shouldAddAutoComplete:v17];

          goto LABEL_11;
        }
        if (v11)
        {
          uint64_t v16 = *(void *)(a1 + 32);
          uint64_t v13 = [*(id *)(a1 + 48) textView];
          +[CKMentionsUtilities configureAttributedString:inTextView:forUnconfirmedMentionInRange:](CKMentionsUtilities, "configureAttributedString:inTextView:forUnconfirmedMentionInRange:", v16, v13, v2, v3);
LABEL_11:
        }
      }
    }
  }
}

- (BOOL)canShowPaddle:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v7.NSUInteger location = [(CKMentionsController *)self currentMentionWithoutPrefixRange];
  v8.NSUInteger location = location;
  v8.NSUInteger length = length;
  return NSIntersectionRange(v7, v8).length == length
      && [(CKMentionsController *)self numberOfCurrentMentionWithoutPrefixRangeTouches] > 1;
}

- (void)showMentionSuggestionsForEntities:(id)a3 replacementRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  if ([v7 count])
  {
    [(CKMentionsController *)self setCurrentMentionSuggestions:v7];
    -[CKMentionsController setRangeOfTappedMention:](self, "setRangeOfTappedMention:", location, length);
    [(CKMentionsController *)self setShowMentionSuggestions:1 animated:1 completion:0];
  }
}

- (void)didTapMentionAtCharacterIndex:(double)a3
{
  if ([(CKMentionsController *)self allowsMentions])
  {
    id v5 = [(CKMentionsController *)self textView];
    id v6 = [v5 attributedText];
    id v7 = (void *)[v6 mutableCopy];

    uint64_t v15 = 0;
    uint64_t v16 = 0;
    id v8 = (id)objc_msgSend(v7, "attribute:atIndex:longestEffectiveRange:inRange:", *MEMORY[0x1E4F6D508], (unint64_t)a3, &v15, 0, objc_msgSend(v7, "length"));
    if ((objc_msgSend(v7, "attribute:existsInRange:", *MEMORY[0x1E4F6D538], v15, v16) & 1) == 0)
    {
      uint64_t v9 = [v7 attribute:*MEMORY[0x1E4F6D550] atIndex:v15 effectiveRange:0];
      uint64_t v10 = v9;
      if (v9)
      {
        id v11 = v9;
      }
      else
      {
        uint64_t v12 = [v7 string];
        objc_msgSend(v12, "substringWithRange:", v15, v16);
        id v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (+[CKMentionsUtilities supportsSupplementalLexiconMentions])
      {
        uint64_t v13 = [(CKMentionsController *)self currentMentionSuggestions];
      }
      else
      {
        uint64_t v14 = [(CKMentionsController *)self entitiesForKey:v11];
        if ([v14 count])
        {
          uint64_t v13 = [v14 allObjects];
        }
        else
        {
          uint64_t v13 = 0;
        }
      }
      -[CKMentionsController showMentionSuggestionsForEntities:replacementRange:](self, "showMentionSuggestionsForEntities:replacementRange:", v13, v15, v16);
    }
  }
}

- (void)configureAttributedString:(id)a3 inTextView:(id)a4 forMentionOverrideInRange:(_NSRange)a5 shouldOverride:(BOOL)a6
{
  BOOL v6 = a6;
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v11 = a3;
  *(void *)&long long v22 = [a4 selectedRange];
  *((void *)&v22 + 1) = v12;
  long long v21 = v22;
  if (location < [v11 length])
  {
    uint64_t v13 = [(CKMentionsController *)self textView];
    [(CKMentionsController *)self replaceAttributedText:v11 inTextView:v13 atIndex:location updatedSelectedRange:&v22 replacementRange:&v21];

    if (length >= 2)
    {
      unint64_t v14 = location + length;
      uint64_t v15 = [v11 length];
      if (v14 >= v15 - 1) {
        unint64_t v14 = v15 - 1;
      }
      uint64_t v16 = [(CKMentionsController *)self textView];
      [(CKMentionsController *)self replaceAttributedText:v11 inTextView:v16 atIndex:v14 updatedSelectedRange:&v22 replacementRange:&v21];
    }
  }
  uint64_t v17 = [(CKMentionsController *)self textView];
  [(CKMentionsController *)self updateTextViewIfNecessary:v17 withAttributedString:v11 selectedRange:v22];

  if (v6)
  {
    uint64_t v18 = [v11 attributedSubstringFromRange:v21];
    id v19 = [v18 string];

    if ([v19 length] && objc_msgSend(v19, "characterAtIndex:", 0) == 64) {
      [v11 addAttribute:*MEMORY[0x1E4F6D548] value:v19 range:v21];
    }
  }
  id v20 = [(CKMentionsController *)self textView];
  [(CKMentionsController *)self checkForMentionsInAttributedString:v11 inTextView:v20];
}

- (void)replaceAttributedText:(id)a3 inTextView:(id)a4 atIndex:(unint64_t)a5 updatedSelectedRange:(_NSRange *)a6 replacementRange:(_NSRange *)a7
{
  id v11 = a3;
  id v12 = a4;
  NSUInteger v20 = 0;
  NSUInteger v21 = 0;
  uint64_t v13 = objc_msgSend(v11, "attribute:atIndex:longestEffectiveRange:inRange:", *MEMORY[0x1E4F6D538], a5, &v20, 0, objc_msgSend(v11, "length"));

  if (v13)
  {
    unint64_t v14 = objc_msgSend(v11, "attribute:atIndex:longestEffectiveRange:inRange:", *MEMORY[0x1E4F6D540], v20, 0, v20, v21);
    uint64_t v15 = [v14 length];
    NSUInteger v16 = v20;
    if (v15 && a7->location > v20)
    {
      uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v14];
      objc_msgSend(v11, "deleteCharactersInRange:", v20, v21);
      [v11 insertAttributedString:v17 atIndex:v20];
      NSUInteger v18 = v20;
      a6->NSUInteger location = [v17 length] + v18;
      NSUInteger v19 = [v17 length];
      NSUInteger v21 = v19;
      a7->NSUInteger location = v20;
      a7->NSUInteger length = v19;

      NSUInteger v16 = v20;
    }
    +[CKMentionsUtilities configureAttributedString:inTextView:forNoMentionInRange:](CKMentionsUtilities, "configureAttributedString:inTextView:forNoMentionInRange:", v11, v12, v16, v21);
  }
}

- (BOOL)shouldUpdateMentionsInRange:(_NSRange)a3 withReplacementText:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  if ([(CKMentionsController *)self allowsMentions]
    && (location | length || [v7 length]))
  {
    id v8 = [(CKMentionsController *)self textView];
    BOOL v9 = -[CKMentionsController shouldUpdateMentionsInTextView:inRange:withReplacementText:](self, "shouldUpdateMentionsInTextView:inRange:withReplacementText:", v8, location, length, v7);
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (BOOL)shouldUpdateMentionsInTextView:(id)a3 inRange:(_NSRange)a4 withReplacementText:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  id v11 = [v9 attributedText];
  id v12 = (void *)[v11 mutableCopy];

  uint64_t v13 = [v10 length];
  uint64_t v14 = [v10 length];

  if (v14) {
    BOOL v15 = 0;
  }
  else {
    BOOL v15 = length > 1;
  }
  int v16 = v15;
  if (!v13
    && length == 1
    && +[CKMentionsUtilities attributedString:containsConfirmedMentionInRange:](CKMentionsUtilities, "attributedString:containsConfirmedMentionInRange:", v12, location, 1))
  {
    BOOL v17 = 0;
    uint64_t v18 = 1;
LABEL_14:
    -[CKMentionsController configureAttributedString:inTextView:forMentionOverrideInRange:shouldOverride:](self, "configureAttributedString:inTextView:forMentionOverrideInRange:shouldOverride:", v12, v9, location, length, v18);
    goto LABEL_16;
  }
  if (!v16)
  {
    BOOL v17 = 1;
    goto LABEL_16;
  }
  BOOL v17 = 1;
  if (+[CKMentionsUtilities attributedString:containsConfirmedMentionInRange:](CKMentionsUtilities, "attributedString:containsConfirmedMentionInRange:", v12, location, length))
  {
    uint64_t v18 = 0;
    goto LABEL_14;
  }
LABEL_16:

  return v17;
}

- (BOOL)attributedString:(id)a3 shouldAddAutoCompleteAttributeForRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v6 = *MEMORY[0x1E4F6D548];
  id v7 = a3;
  id v8 = [v7 attribute:v6 atIndex:location effectiveRange:0];
  id v9 = [v7 string];

  id v10 = objc_msgSend(v9, "substringWithRange:", location, length);

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v11 = [v8 isEqualToString:v10] ^ 1;
  }
  else {
    LOBYTE(v11) = 1;
  }

  return v11;
}

- (void)insertMentionByName:(id)a3
{
  id v19 = a3;
  BOOL v4 = [(CKMentionsController *)self allowsMentions];
  id v5 = v19;
  if (v4)
  {
    uint64_t v6 = [v19 mentionsSafeText];
    if ([v19 length] && objc_msgSend(v6, "length"))
    {
      id v7 = [(CKMentionsController *)self textView];
      id v8 = [(CKMentionsController *)self entitiesForKey:v6];
      id v9 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v19];
      if ([v8 count] == 1)
      {
        id v10 = [v8 anyObject];
        int v11 = [v10 defaultIMHandle];
        id v12 = [v11 ID];

        if ([v12 length])
        {
          uint64_t v13 = [v19 length];
          objc_msgSend(v9, "ck_removeAnimatedTextEffectsFromRange:", 0, v13);
          objc_msgSend(v9, "addAttribute:value:range:", *MEMORY[0x1E4F6D538], v12, 0, v13);
          +[CKMentionsUtilities configureAttributedString:inTextView:forConfirmedMentionInRange:needingAnimation:](CKMentionsUtilities, "configureAttributedString:inTextView:forConfirmedMentionInRange:needingAnimation:", v9, v7, 0, v13, 1);
        }
      }
      else
      {
        +[CKMentionsUtilities configureAttributedString:inTextView:forUnconfirmedMentionInRange:](CKMentionsUtilities, "configureAttributedString:inTextView:forUnconfirmedMentionInRange:", v9, v7, 0, [v19 length]);
      }
      if ([(CKMentionsController *)self languageHasSpaces])
      {
        uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:@" "];
        +[CKMentionsUtilities configureAttributedString:inTextView:forNoMentionInRange:](CKMentionsUtilities, "configureAttributedString:inTextView:forNoMentionInRange:", v14, v7, 0, 1);
        [v9 appendAttributedString:v14];
        BOOL v15 = [v7 attributedText];
        int v16 = (void *)[v15 mutableCopy];

        uint64_t v17 = [v7 selectedRange];
        [v16 insertAttributedString:v9 atIndex:v17 + v18];
        [v7 setAttributedText:v16];
        [(CKMentionsController *)self updateTextViewIfNecessary:v7 withAttributedString:v16];
      }
    }

    id v5 = v19;
  }
}

- (void)insertMentionWithEntity:(id)a3 replacementRange:(_NSRange)a4 fallbackName:(id)a5 source:(unsigned __int8)a6
{
  int v6 = a6;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v11 = a3;
  id v12 = a5;
  [(CKMentionsController *)self setShowMentionSuggestions:0 animated:1 completion:0];
  uint64_t v13 = [(CKMentionsController *)self textView];
  uint64_t v14 = [v13 attributedText];
  BOOL v15 = (void *)[v14 mutableCopy];

  objc_msgSend(v15, "ck_removeAnimatedTextEffectsFromRange:", location, length);
  id v16 = v12;
  id v17 = v16;
  if (v6)
  {
    uint64_t v18 = [v15 attribute:*MEMORY[0x1E4F6D550] atIndex:location effectiveRange:0];
    id v19 = v18;
    id v17 = v16;
    if (v18)
    {
      id v17 = v18;
    }
  }
  if (!v17) {
    -[CKMentionsController insertMentionWithEntity:replacementRange:fallbackName:source:]();
  }
  NSUInteger v20 = objc_msgSend(v15, "attributedSubstringFromRange:", location, length);
  NSUInteger v21 = [v20 string];

  objc_msgSend(v15, "replaceCharactersInRange:withString:", location, length, v17);
  NSUInteger v32 = location;
  uint64_t v33 = [v17 length];
  +[CKMentionsUtilities replaceAttributedString:withEntity:fromInputText:inRange:updatingRange:](CKMentionsUtilities, "replaceAttributedString:withEntity:fromInputText:inRange:updatingRange:", v15, v11, v17, location, v33, &v32);
  long long v22 = [(CKMentionsController *)self textView];
  +[CKMentionsUtilities configureAttributedString:inTextView:withOriginalText:inRange:](CKMentionsUtilities, "configureAttributedString:inTextView:withOriginalText:inRange:", v15, v22, v21, v32, v33);

  NSUInteger v23 = [(CKMentionsController *)self textView];
  +[CKMentionsUtilities configureAttributedString:inTextView:forConfirmedMentionInRange:needingAnimation:](CKMentionsUtilities, "configureAttributedString:inTextView:forConfirmedMentionInRange:needingAnimation:", v15, v23, v32, v33, 1);

  NSUInteger v24 = [(CKMentionsController *)self textView];
  [v24 selectedRange];
  uint64_t v26 = v25;

  uint64_t v27 = v33 + v32;
  if (v6)
  {
    if (v27 == [v15 length] && -[CKMentionsController languageHasSpaces](self, "languageHasSpaces"))
    {
      NSUInteger v28 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:@" "];
      NSUInteger v31 = v33 + v32;
      long long v29 = [(CKMentionsController *)self textView];
      +[CKMentionsUtilities configureAttributedString:inTextView:forNoMentionInRange:](CKMentionsUtilities, "configureAttributedString:inTextView:forNoMentionInRange:", v28, v29, 0, 1);

      [v15 insertAttributedString:v28 atIndex:v31];
      uint64_t v27 = [v15 length];
    }
    else
    {
      uint64_t v27 = v33 + v32;
    }
  }
  long long v30 = [(CKMentionsController *)self textView];
  -[CKMentionsController checkForMentionsInAttributedString:textViewToUpdate:restoreSelectedRange:](self, "checkForMentionsInAttributedString:textViewToUpdate:restoreSelectedRange:", v15, v30, v27, v26);
}

- (void)suggestionViewDidSelectEntity:(id)a3
{
  id v4 = a3;
  id v5 = [(CKMentionsController *)self textView];
  id v11 = [v5 attributedText];

  uint64_t v6 = [(CKMentionsController *)self rangeOfTappedMention];
  uint64_t v8 = v7;
  if (v7 > [v11 length]) {
    uint64_t v8 = [v11 length];
  }
  if (v8 + v6 > (unint64_t)[v11 length]) {
    uint64_t v8 = [v11 length] - v6;
  }
  id v9 = objc_msgSend(v11, "attributedSubstringFromRange:", v6, v8);
  id v10 = [v9 string];

  -[CKMentionsController insertMentionWithEntity:replacementRange:fallbackName:source:](self, "insertMentionWithEntity:replacementRange:fallbackName:source:", v4, v6, v8, v10, 1);
}

- (void)acceptAutomaticMentionConfirmation
{
  if (!+[CKMentionsUtilities supportsSupplementalLexiconMentions])
  {
    id v5 = [(CKMentionsController *)self textView];
    uint64_t v3 = [v5 attributedText];
    id v4 = (void *)[v3 mutableCopy];

    [(CKMentionsController *)self confirmAutomaticMention:v4 inTextView:v5 isSending:1 selectedRange:0];
    [(CKMentionsController *)self updateTextViewIfNecessary:v5 withAttributedString:v4];
  }
}

- (void)confirmAutomaticMention:(id)a3 inTextView:(id)a4 selectedRange:(_NSRange *)a5
{
}

- (void)_enumerateAllAutomaticConfirmedMentionsInAttributedString:(id)a3 usingBlock:(id)a4
{
  id v6 = a4;
  unint64_t v7 = (void *)MEMORY[0x1E4F6E778];
  id v8 = a3;
  id v9 = [v7 sharedFeatureFlags];
  int v10 = [v9 isTextKit2Enabled];

  if (v10)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __93__CKMentionsController__enumerateAllAutomaticConfirmedMentionsInAttributedString_usingBlock___block_invoke;
    v16[3] = &unk_1E56260B0;
    v16[4] = self;
    id v17 = v6;
    id v11 = v6;
    objc_msgSend(v8, "ck_textKit2_enumerateAllAutomaticConfirmedMentionsUsingBlock:", v16);

    id v12 = v17;
  }
  else
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __93__CKMentionsController__enumerateAllAutomaticConfirmedMentionsInAttributedString_usingBlock___block_invoke_2;
    v14[3] = &unk_1E56260D8;
    id v15 = v6;
    id v13 = v6;
    objc_msgSend(v8, "ck_textKit1_enumerateAllAutomaticConfirmedMentionsUsingBlock:", v14);

    id v12 = v15;
  }
}

void __93__CKMentionsController__enumerateAllAutomaticConfirmedMentionsInAttributedString_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F6D520];
  id v4 = a2;
  id v11 = [v4 objectForKeyedSubscript:v3];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F6D530]];
  uint64_t v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F6D528]];

  if (v6) {
    unint64_t v7 = (void *)v6;
  }
  else {
    unint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v8 = [[CKMentionAutoCompleteNodeId alloc] initWithKeys:v7];
  id v9 = [*(id *)(a1 + 32) _nodeForMentionNodeId:v8];
  int v10 = [[CKMentionAutoCompleteAttribute alloc] initWithMentionEntityNode:v9 originalText:v5 displayText:v11];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __93__CKMentionsController__enumerateAllAutomaticConfirmedMentionsInAttributedString_usingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)confirmAutomaticMention:(id)a3 inTextView:(id)a4 isSending:(BOOL)a5 selectedRange:(_NSRange *)a6
{
  id v10 = a3;
  id v11 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __83__CKMentionsController_confirmAutomaticMention_inTextView_isSending_selectedRange___block_invoke;
  v14[3] = &unk_1E5626100;
  BOOL v19 = a5;
  id v15 = v11;
  id v16 = self;
  id v17 = v10;
  uint64_t v18 = a6;
  id v12 = v10;
  id v13 = v11;
  [(CKMentionsController *)self _enumerateAllAutomaticConfirmedMentionsInAttributedString:v12 usingBlock:v14];
}

void __83__CKMentionsController_confirmAutomaticMention_inTextView_isSending_selectedRange___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v32 = a3;
  uint64_t v33 = a4;
  id v7 = a2;
  if (*(unsigned char *)(a1 + 64))
  {
    BOOL v8 = 0;
  }
  else
  {
    uint64_t v9 = [*(id *)(a1 + 32) selectedRange];
    BOOL v8 = +[CKMentionsUtilities range:containsEmptySelectedRange:](CKMentionsUtilities, "range:containsEmptySelectedRange:", a3, a4, v9, v10);
  }
  id v11 = *(void **)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 48);
  id v13 = [v7 mentionEntityNode];
  char v14 = objc_msgSend(v11, "attributedString:nextCharacterRangeFromRange:containsPossibleChild:", v12, a3, a4, v13);

  if (!v8 && (v14 & 1) == 0)
  {
    id v15 = objc_msgSend(*(id *)(a1 + 48), "attributedSubstringFromRange:", a3, a4);
    id v16 = [v15 string];

    id v17 = [v7 displayText];
    uint64_t v18 = [v16 localizedCompare:v17];

    BOOL v19 = *(void **)(a1 + 48);
    if (v18)
    {
      objc_msgSend(v19, "removeAttribute:range:", *MEMORY[0x1E4F6D518], a3, a4);
    }
    else
    {
      NSUInteger v20 = objc_msgSend(v19, "attribute:atIndex:longestEffectiveRange:inRange:", *MEMORY[0x1E4F6D548], a3, 0, a3, a4);
      uint64_t v21 = [v20 isEqualToString:v16];

      if ((v21 & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 48), "removeAttribute:range:", *MEMORY[0x1E4F6D518], a3, a4);
        long long v22 = [v7 mentionEntityNode];
        NSUInteger v23 = [v22 entities];

        NSUInteger v24 = objc_msgSend(*(id *)(a1 + 48), "attributedSubstringFromRange:", a3, a4);
        uint64_t v25 = [v24 string];

        uint64_t v26 = [v23 anyObject];
        uint64_t v27 = *(void *)(a1 + 48);
        NSUInteger v28 = [v7 originalText];
        +[CKMentionsUtilities replaceAttributedString:withEntity:fromInputText:inRange:updatingRange:](CKMentionsUtilities, "replaceAttributedString:withEntity:fromInputText:inRange:updatingRange:", v27, v26, v28, a3, a4, &v32);

        long long v29 = *(void **)(a1 + 56);
        if (v29) {
          *v29 += v33 - a4;
        }
        if (*(unsigned char *)(a1 + 64))
        {
          BOOL v30 = 0;
          NSUInteger v31 = &off_1E561D000;
        }
        else
        {
          NSUInteger v31 = &off_1E561D000;
          +[CKMentionsUtilities configureAttributedString:inTextView:withOriginalText:inRange:](CKMentionsUtilities, "configureAttributedString:inTextView:withOriginalText:inRange:", *(void *)(a1 + 48), *(void *)(a1 + 32), v25, v32, v33);
          BOOL v30 = *(unsigned char *)(a1 + 64) == 0;
        }
        objc_msgSend(v31[374], "configureAttributedString:inTextView:forConfirmedMentionInRange:needingAnimation:", *(void *)(a1 + 48), *(void *)(a1 + 32), v32, v33, v30);
      }
    }
  }
}

- (BOOL)attributedString:(id)a3 nextCharacterRangeFromRange:(_NSRange)a4 containsPossibleChild:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a3;
  id v9 = a5;
  NSUInteger v10 = location + length;
  if ([v8 length] >= v10 + 1)
  {
    uint64_t v12 = [v8 string];
    id v13 = objc_msgSend(v12, "substringWithRange:", v10, 1);
    char v14 = [v13 mentionsSafeText];

    id v15 = [v9 children];
    id v16 = [v15 objectForKey:v14];

    id v17 = [v16 possibleEntities];
    uint64_t v18 = [v9 entities];
    BOOL v19 = [v18 anyObject];
    int v20 = [v17 containsObject:v19];

    if (v20)
    {
      uint64_t v21 = [v9 entities];
      long long v22 = [v21 anyObject];
      NSUInteger v23 = [v22 defaultIMHandle];
      NSUInteger v24 = [v23 firstName];

      uint64_t v25 = [v9 entities];
      uint64_t v26 = [v25 anyObject];
      uint64_t v27 = [v26 defaultIMHandle];
      NSUInteger v28 = [v27 lastName];

      if (+[CKEntity string:v24 hasPrefix:v14]
        || +[CKEntity string:v28 hasPrefix:v14])
      {
        LOBYTE(v11) = 1;
        goto LABEL_10;
      }
    }
    if (!v16)
    {
      LOBYTE(v11) = 0;
      goto LABEL_12;
    }
    NSUInteger v24 = [v16 possibleEntities];
    NSUInteger v28 = [v9 entities];
    long long v29 = [v28 anyObject];
    int v11 = [v24 containsObject:v29] ^ 1;

LABEL_10:
LABEL_12:

    goto LABEL_13;
  }
  LOBYTE(v11) = 0;
LABEL_13:

  return v11;
}

- (void)reloadMentionsData
{
  [(CKMentionsController *)self updateMentionsAssociations];

  [(CKMentionsController *)self checkForMentions];
}

- (void)setShowMentionSuggestions:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a3;
  id v7 = (void (**)(void))a5;
  int v8 = objc_msgSend(MEMORY[0x1E4F42B08], "__ck_isPredictionBarEnabled");
  id v9 = [(CKMentionsController *)self currentMentionSuggestions];
  unint64_t v10 = [v9 count];

  if (v8) {
    BOOL v11 = v10 > 1;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    if (_IMWillLog()) {
      _IMAlwaysLog();
    }
LABEL_12:
    if (v7)
    {
LABEL_13:
      v7[2](v7);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  if (![(CKMentionsController *)self allowsMentions]
    || [(CKMentionsController *)self showingMentionsSuggestions] == v5)
  {
    goto LABEL_12;
  }
  [(CKMentionsController *)self setShowingMentionsSuggestions:v5];
  [(CKMentionsController *)self setPreventShowingCalloutMenu:v5];
  if (!v5)
  {
    [(CKPaddleOverlayView *)self->_paddleOverlayView dismiss];
    id v17 = [MEMORY[0x1E4F42B08] activeKeyboard];
    [v17 textInputTraitsDidChange];

    uint64_t v18 = [(CKMentionsController *)self textView];
    [v18 setNeedsLayout];

    if (!v7) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  uint64_t v12 = [(CKMentionsController *)self textView];
  [v12 setNeedsLayout];

  id v13 = [(CKMentionsController *)self textView];
  [v13 layoutIfNeeded];

  BOOL v14 = CKIsRunningInMacCatalyst() == 0;
  id v15 = [(CKMentionsController *)self paddleOverlayView];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __70__CKMentionsController_setShowMentionSuggestions_animated_completion___block_invoke;
  v19[3] = &unk_1E5622358;
  int v20 = v7;
  [v15 showPaddleAnimated:v14 completion:v19];

LABEL_14:
}

uint64_t __70__CKMentionsController_setShowMentionSuggestions_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)updateMentionsAssociations
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if ([(CKMentionsController *)self allowsMentions])
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1CA80]);
    id v4 = [(CKMentionsController *)self conversation];
    BOOL v5 = [v4 recipients];
    uint64_t v6 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v5, "count"));
    [(CKMentionsController *)self setEntityHandles:v6];

    if (+[CKMentionsUtilities supportsSupplementalLexiconMentions])
    {
      [(CKMentionsController *)self _populateSupplementalLexiconAsynchronously];
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v7 = [(CKMentionsController *)self conversation];
      int v8 = [v7 recipients];

      uint64_t v9 = [v8 countByEnumeratingWithState:&v37 objects:v43 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v38 != v11) {
              objc_enumerationMutation(v8);
            }
            id v13 = [*(id *)(*((void *)&v37 + 1) + 8 * i) defaultIMHandle];
            BOOL v14 = [v13 ID];

            if ([v14 length])
            {
              id v15 = [(CKMentionsController *)self entityHandles];
              [v15 addObject:v14];
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v37 objects:v43 count:16];
        }
        while (v10);
      }
    }
    else
    {
      id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [(CKMentionsController *)self setEntityDictionary:v16];

      id v17 = objc_alloc_init(CKMentionEntityNode);
      [(CKMentionsController *)self setEntityTree:v17];

      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      uint64_t v18 = [(CKMentionsController *)self conversation];
      int v8 = [v18 recipients];

      uint64_t v19 = [v8 countByEnumeratingWithState:&v33 objects:v42 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v34;
        do
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v34 != v21) {
              objc_enumerationMutation(v8);
            }
            NSUInteger v23 = *(void **)(*((void *)&v33 + 1) + 8 * j);
            if ([v23 isMentionable])
            {
              long long v31 = 0u;
              long long v32 = 0u;
              long long v29 = 0u;
              long long v30 = 0u;
              NSUInteger v24 = objc_msgSend(v23, "mentionTokens", 0);
              uint64_t v25 = [v24 countByEnumeratingWithState:&v29 objects:v41 count:16];
              if (v25)
              {
                uint64_t v26 = v25;
                uint64_t v27 = *(void *)v30;
                do
                {
                  for (uint64_t k = 0; k != v26; ++k)
                  {
                    if (*(void *)v30 != v27) {
                      objc_enumerationMutation(v24);
                    }
                    [(CKMentionsController *)self associateEntity:v23 withKey:*(void *)(*((void *)&v29 + 1) + 8 * k)];
                  }
                  uint64_t v26 = [v24 countByEnumeratingWithState:&v29 objects:v41 count:16];
                }
                while (v26);
              }
            }
          }
          uint64_t v20 = [v8 countByEnumeratingWithState:&v33 objects:v42 count:16];
        }
        while (v20);
      }
    }
  }
}

- (void)_populateSupplementalLexiconAsynchronously
{
  v56[7] = *MEMORY[0x1E4F143B8];
  id v3 = +[CKUIBehavior sharedBehaviors];
  [v3 transcriptReplyPreviewContextContactImageDiameter];
  double v5 = v4;

  uint64_t v6 = (void *)MEMORY[0x1E4F1BB30];
  id v7 = [MEMORY[0x1E4F42D90] mainScreen];
  [v7 scale];
  long long v39 = objc_msgSend(v6, "scopeWithPointSize:scale:rightToLeft:style:", 0, 0, v5, v5, v8);

  id v9 = objc_alloc(MEMORY[0x1E4F1BB20]);
  uint64_t v10 = [MEMORY[0x1E4F1BB28] defaultSettings];
  long long v38 = (void *)[v9 initWithSettings:v10];

  uint64_t v11 = *MEMORY[0x1E4F1ADF0];
  v56[0] = *MEMORY[0x1E4F1ADE0];
  v56[1] = v11;
  uint64_t v12 = *MEMORY[0x1E4F1AEF0];
  v56[2] = *MEMORY[0x1E4F1AED8];
  v56[3] = v12;
  uint64_t v13 = *MEMORY[0x1E4F1AF08];
  v56[4] = *MEMORY[0x1E4F1AEF8];
  v56[5] = v13;
  BOOL v14 = [MEMORY[0x1E4F1BB20] descriptorForRequiredKeys];
  v56[6] = v14;
  long long v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:7];

  id v15 = dispatch_group_create();
  id v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v17 = dispatch_queue_create("com.apple.Messages.CKMessageEntryView.renderingQueue", v16);

  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (_IMWillLog())
  {
    uint64_t v19 = [(CKMentionsController *)self conversation];
    uint64_t v20 = [v19 recipients];
    uint64_t v34 = [v20 count];
    _IMAlwaysLog();
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v50 = 0u;
  long long v49 = 0u;
  long long v35 = self;
  uint64_t v21 = [(CKMentionsController *)self conversation];
  long long v22 = [v21 recipients];

  obuint64_t j = v22;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v50 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        NSUInteger v28 = [v27 cnContactWithKeys:v37];
        long long v29 = (void *)[v28 copy];

        double v53 = @"CKSupplementalItemEntityAttributeName";
        double v54 = v27;
        long long v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __66__CKMentionsController__populateSupplementalLexiconAsynchronously__block_invoke;
        block[3] = &unk_1E5623170;
        id v44 = v29;
        id v45 = v38;
        id v46 = v39;
        id v47 = v30;
        id v48 = v18;
        id v31 = v30;
        id v32 = v29;
        dispatch_group_async(v15, v17, block);
      }
      uint64_t v24 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
    }
    while (v24);
  }

  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __66__CKMentionsController__populateSupplementalLexiconAsynchronously__block_invoke_2;
  v40[3] = &unk_1E5620AF8;
  id v41 = v18;
  uint64_t v42 = v35;
  id v33 = v18;
  dispatch_group_notify(v15, MEMORY[0x1E4F14428], v40);
}

void __66__CKMentionsController__populateSupplementalLexiconAsynchronously__block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F43348]) initWithContact:*(void *)(a1 + 32)];
  id v3 = *(void **)(a1 + 40);
  v6[0] = *(void *)(a1 + 32);
  double v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  double v5 = [v3 avatarImageForContacts:v4 scope:*(void *)(a1 + 48)];
  [v2 setIcon:v5];

  [v2 setUserInfo:*(void *)(a1 + 56)];
  [*(id *)(a1 + 64) addObject:v2];
}

uint64_t __66__CKMentionsController__populateSupplementalLexiconAsynchronously__block_invoke_2(uint64_t a1)
{
  if (_IMWillLog())
  {
    [*(id *)(a1 + 32) count];
    _IMAlwaysLog();
  }
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);

  return [v2 _updateMentionsLexiconWithItems:v3];
}

- (void)_updateMentionsLexiconWithItems:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  double v5 = (void *)[objc_alloc(MEMORY[0x1E4F43340]) initWithItems:v4 searchPrefixes:1];

  [(CKMentionsController *)self setMentionsLexicon:v5];
  uint64_t v6 = [(CKMentionsController *)self mentionsLexicon];
  id v7 = [(CKMentionsController *)self textView];
  [v7 setSupplementalLexicon:v6];

  double v8 = [MEMORY[0x1E4F42A80] systemImageNamed:@"person.crop.circle"];
  id v9 = [(CKMentionsController *)self textView];
  [v9 setSupplementalLexiconAmbiguousItemIcon:v8];

  id v10 = [MEMORY[0x1E4F42B08] activeKeyboard];
  [v10 textInputTraitsDidChange];
}

- (void)associateEntity:(id)a3 withKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v19 = 0;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x3032000000;
    long long v22 = __Block_byref_object_copy__30;
    uint64_t v23 = __Block_byref_object_dispose__30;
    id v24 = 0;
    id v24 = [(CKMentionsController *)self entityTree];
    uint64_t v8 = [v7 length];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __48__CKMentionsController_associateEntity_withKey___block_invoke;
    v16[3] = &unk_1E5626128;
    id v18 = &v19;
    id v9 = v6;
    id v17 = v9;
    objc_msgSend(v7, "enumerateSubstringsInRange:options:usingBlock:", 0, v8, 2, v16);
    [(id)v20[5] addEntity:v9];
    id v10 = [v9 defaultIMHandle];
    uint64_t v11 = [v10 ID];

    if ([v11 length])
    {
      uint64_t v12 = [(CKMentionsController *)self entityHandles];
      [v12 addObject:v11];
    }
    uint64_t v13 = [(CKMentionsController *)self entityDictionary];
    BOOL v14 = [v13 objectForKey:v7];

    if (v14) {
      [v14 addObject:v9];
    }
    else {
      BOOL v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", v9, 0);
    }
    id v15 = [(CKMentionsController *)self entityDictionary];
    [v15 setObject:v14 forKey:v7];

    _Block_object_dispose(&v19, 8);
  }
}

void __48__CKMentionsController_associateEntity_withKey___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) children];
  id v4 = [v3 objectForKey:v7];

  if (!v4)
  {
    id v4 = objc_alloc_init(CKMentionEntityNode);
    [(CKMentionEntityNode *)v4 setKey:v7];
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addChild:v4];
  }
  [(CKMentionEntityNode *)v4 addPossibleEntity:*(void *)(a1 + 32)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)entitiesForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKMentionsController *)self entityDictionary];
  id v6 = [v4 mentionsSafeText];

  id v7 = [v5 objectForKey:v6];

  return v7;
}

- (void)didSetAttributedTextOfTextView
{
  uint64_t v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isTextKit2Enabled];

  if (v4)
  {
    id v5 = [(CKMentionsController *)self mentionsAnimationController];
    [v5 didSetAttributedTextOfTextView];
  }
}

- (BOOL)canSuggestSupplementalItemsForCurrentSelection
{
  uint64_t v3 = [(CKMentionsController *)self textView];
  int v4 = [v3 attributedText];

  if ([v4 length])
  {
    id v5 = [(CKMentionsController *)self textView];
    uint64_t v6 = [v5 selectedRange];

    if (v6) {
      unint64_t v7 = v6 - 1;
    }
    else {
      unint64_t v7 = 0;
    }
    uint64_t v8 = [v4 length];
    if (v7 >= v8 - 1) {
      unint64_t v9 = v8 - 1;
    }
    else {
      unint64_t v9 = v7;
    }
    BOOL v10 = !+[CKMentionsUtilities attributedString:containsConfirmedMentionInRange:](CKMentionsUtilities, "attributedString:containsConfirmedMentionInRange:", v4, v9, 1);
  }
  else
  {
    LOBYTE(v10) = 1;
  }

  return v10;
}

- (void)insertSupplementalItem:(id)a3 forString:(id)a4 replacementRange:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  uint64_t v9 = [(CKMentionsController *)self _rangeFromUITextRange:a5];
  uint64_t v11 = v10;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v12 = [v14 userInfo];
    uint64_t v13 = [v12 objectForKeyedSubscript:@"CKSupplementalItemEntityAttributeName"];
  }
  else
  {
    uint64_t v13 = 0;
  }
  -[CKMentionsController insertMentionWithEntity:replacementRange:fallbackName:source:](self, "insertMentionWithEntity:replacementRange:fallbackName:source:", v13, v9, v11, v8, 0);
  if ([(CKMentionsController *)self allowsMentions])
  {
    if (![(CKMentionsController *)self isUpdatingMentionAttributedText]) {
      [(CKMentionsController *)self setShowMentionSuggestions:0 animated:1 completion:0];
    }
    [(CKMentionsController *)self checkForMentions];
  }
}

- (void)insertionPointEnteredRange:(id)a3 string:(id)a4 supplementalItems:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  unint64_t v10 = [(CKMentionsController *)self _rangeFromUITextRange:a3];
  unint64_t v12 = v11;
  objc_msgSend(v8, "__imArrayByApplyingBlock:", &__block_literal_global_154_0);
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  -[CKMentionsController insertionPointEnteredRange:forMention:withEntities:](self, "insertionPointEnteredRange:forMention:withEntities:", v10, v12, v9, v14);
  if (![(CKMentionsController *)self showingMentionsSuggestions])
  {
    unint64_t v13 = [(CKMentionsController *)self currentTappedCharacterIndex];
    if (v13 >= v10 && v13 - v10 < v12)
    {
      [(CKMentionsController *)self didTapMentionAtCharacterIndex:(double)v13];
      [(CKMentionsController *)self setCurrentTappedCharacterIndex:0x7FFFFFFFFFFFFFFFLL];
    }
  }
}

id __76__CKMentionsController_insertionPointEnteredRange_string_supplementalItems___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = [v2 userInfo];
    int v4 = [v3 objectForKeyedSubscript:@"CKSupplementalItemEntityAttributeName"];
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)insertionPointExitedRangeWithSupplementalItems
{
  -[CKMentionsController setLastFoundMentionRange:](self, "setLastFoundMentionRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
  uint64_t v3 = [(CKMentionsController *)self textView];
  int v4 = [v3 attributedText];
  id v6 = (id)[v4 mutableCopy];

  id v5 = [(CKMentionsController *)self textView];
  [(CKMentionsController *)self resetStyleInAttributedString:v6 inTextView:v5 andApplyStyleUsingBlock:&__block_literal_global_156];
}

- (void)chooseSupplementalItemToInsert:(id)a3 replacementRange:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(CKMentionsController *)self _rangeFromUITextRange:a4];
  uint64_t v12 = v11;
  unint64_t v13 = objc_msgSend(v8, "__imArrayByApplyingBlock:", &__block_literal_global_158);
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __90__CKMentionsController_chooseSupplementalItemToInsert_replacementRange_completionHandler___block_invoke_2;
  uint64_t v20 = &unk_1E5626198;
  id v21 = v8;
  id v22 = v9;
  id v14 = v8;
  id v15 = v9;
  id v16 = _Block_copy(&v17);
  -[CKMentionsController setDidSelectEntityCompletionHandler:](self, "setDidSelectEntityCompletionHandler:", v16, v17, v18, v19, v20);
  -[CKMentionsController showMentionSuggestionsForEntities:replacementRange:](self, "showMentionSuggestionsForEntities:replacementRange:", v13, v10, v12);
}

id __90__CKMentionsController_chooseSupplementalItemToInsert_replacementRange_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = [v2 userInfo];
    int v4 = [v3 objectForKeyedSubscript:@"CKSupplementalItemEntityAttributeName"];
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

void __90__CKMentionsController_chooseSupplementalItemToInsert_replacementRange_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = v3;
  if (v3)
  {
    id v5 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __90__CKMentionsController_chooseSupplementalItemToInsert_replacementRange_completionHandler___block_invoke_3;
    v9[3] = &unk_1E5626170;
    id v10 = v3;
    uint64_t v6 = [v5 indexOfObjectPassingTest:v9];
    if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
      __90__CKMentionsController_chooseSupplementalItemToInsert_replacementRange_completionHandler___block_invoke_2_cold_1();
    }
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v6];
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

BOOL __90__CKMentionsController_chooseSupplementalItemToInsert_replacementRange_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    int v4 = [v3 userInfo];
    id v5 = [v4 objectForKeyedSubscript:@"CKSupplementalItemEntityAttributeName"];
  }
  else
  {
    id v5 = 0;
  }
  BOOL v6 = v5 == *(void **)(a1 + 32);

  return v6;
}

- (void)cancelChooseSupplementalItemToInsert
{
  [(CKMentionsController *)self setDidSelectEntityCompletionHandler:0];
  [(CKMentionsController *)self setShowMentionSuggestions:0 animated:1 completion:0];

  [(CKMentionsController *)self checkForMentions];
}

- (void)localeChanged
{
  id v3 = [MEMORY[0x1E4F42F18] currentInputMode];
  if (v3)
  {
    int v4 = (void *)MEMORY[0x1E4F1CA20];
    id v9 = v3;
    id v5 = [v3 primaryLanguage];
    BOOL v6 = [v4 localeWithLocaleIdentifier:v5];
    uint64_t v7 = [v6 languageCode];

    id v8 = +[CKMentionsUtilities languagesWithoutSpaces];
    self->_languageHasSpaces = [v8 containsObject:v7] ^ 1;

    id v3 = v9;
  }
  else
  {
    self->_languageHasSpaces = 0;
  }
}

- (void)mentionsAnimationController:(id)a3 didFinishMentionAnimationWithIdentifier:(id)a4
{
}

- (void)didDismissPaddleOverlayView:(id)a3
{
  uint64_t v7 = (CKPaddleOverlayView *)a3;
  [(CKMentionsController *)self setPreventShowingCalloutMenu:0];
  if (self->_paddleOverlayView == v7)
  {
    self->_paddleOverlayView = 0;
  }
  if (self->_mentionSuggestionView)
  {
    int v4 = [(CKMentionsController *)self didSelectEntityCompletionHandler];

    if (v4)
    {
      id v5 = [(CKMentionsController *)self didSelectEntityCompletionHandler];
      [(CKMentionsController *)self setDidSelectEntityCompletionHandler:0];
      v5[2](v5, 0);
    }
    [(CKMentionsController *)self setShowingMentionsSuggestions:0];
    mentionSuggestionView = self->_mentionSuggestionView;
    self->_mentionSuggestionView = 0;
  }
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
}

- (unint64_t)currentTappedCharacterIndex
{
  return self->currentTappedCharacterIndex;
}

- (void)setCurrentTappedCharacterIndex:(unint64_t)a3
{
  self->currentTappedCharacterIndex = a3;
}

- (BOOL)preventShowingCalloutMenu
{
  return self->_preventShowingCalloutMenu;
}

- (void)setPreventShowingCalloutMenu:(BOOL)a3
{
  self->_preventShowingCalloutMenu = a3;
}

- (BOOL)languageHasSpaces
{
  return self->_languageHasSpaces;
}

- (void)setLanguageHasSpaces:(BOOL)a3
{
  self->_languageHasSpaces = a3;
}

- (CKMentionsControllerTextEffectsDelegate)textEffectsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textEffectsDelegate);

  return (CKMentionsControllerTextEffectsDelegate *)WeakRetained;
}

- (void)setTextEffectsDelegate:(id)a3
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

- (CKMessageEntryTextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
}

- (void)setPaddleOverlayView:(id)a3
{
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

- (_NSRange)rangeOfTappedMention
{
  NSUInteger length = self->_rangeOfTappedMention.length;
  NSUInteger location = self->_rangeOfTappedMention.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRangeOfTappedMention:(_NSRange)a3
{
  self->_rangeOfTappedMention = a3;
}

- (id)didSelectEntityCompletionHandler
{
  return self->_didSelectEntityCompletionHandler;
}

- (void)setDidSelectEntityCompletionHandler:(id)a3
{
}

- (BOOL)isUpdatingMentionAttributedText
{
  return self->_isUpdatingMentionAttributedText;
}

- (void)setIsUpdatingMentionAttributedText:(BOOL)a3
{
  self->_isUpdatingMentionAttributedText = a3;
}

- (_NSRange)lastFoundMentionRange
{
  NSUInteger length = self->_lastFoundMentionRange.length;
  NSUInteger location = self->_lastFoundMentionRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setLastFoundMentionRange:(_NSRange)a3
{
  self->_lastFoundMentionRange = a3;
}

- (CKMentionEntityNode)entityTree
{
  return self->_entityTree;
}

- (void)setEntityTree:(id)a3
{
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

- (_UISupplementalLexicon)mentionsLexicon
{
  return self->_mentionsLexicon;
}

- (void)setMentionsLexicon:(id)a3
{
}

- (_NSRange)currentMentionWithoutPrefixRange
{
  NSUInteger length = self->_currentMentionWithoutPrefixRange.length;
  NSUInteger location = self->_currentMentionWithoutPrefixRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setCurrentMentionWithoutPrefixRange:(_NSRange)a3
{
  self->_currentMentionWithoutPrefixRange = a3;
}

- (int64_t)numberOfCurrentMentionWithoutPrefixRangeTouches
{
  return self->_numberOfCurrentMentionWithoutPrefixRangeTouches;
}

- (void)setNumberOfCurrentMentionWithoutPrefixRangeTouches:(int64_t)a3
{
  self->_numberOfCurrentMentionWithoutPrefixRangeTouches = a3;
}

- (CKMentionsAnimationController)mentionsAnimationController
{
  return self->_mentionsAnimationController;
}

- (void)setMentionsAnimationController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mentionsAnimationController, 0);
  objc_storeStrong((id *)&self->_mentionsLexicon, 0);
  objc_storeStrong((id *)&self->_entityDictionary, 0);
  objc_storeStrong((id *)&self->_entityHandles, 0);
  objc_storeStrong((id *)&self->_entityTree, 0);
  objc_storeStrong(&self->_didSelectEntityCompletionHandler, 0);
  objc_storeStrong((id *)&self->_currentMentionSuggestions, 0);
  objc_storeStrong((id *)&self->_mentionSuggestionView, 0);
  objc_storeStrong((id *)&self->_paddleOverlayView, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_destroyWeak((id *)&self->_textEffectsDelegate);

  objc_storeStrong((id *)&self->_conversation, 0);
}

void __75__CKMentionsController_insertionPointEnteredRange_forMention_withEntities___block_invoke_cold_1()
{
}

- (void)insertMentionWithEntity:replacementRange:fallbackName:source:.cold.1()
{
}

void __90__CKMentionsController_chooseSupplementalItemToInsert_replacementRange_completionHandler___block_invoke_2_cold_1()
{
  __assert_rtn("-[CKMentionsController chooseSupplementalItemToInsert:replacementRange:completionHandler:]_block_invoke_2", "CKMentionsController.m", 1336, "indexOfMatch != NSNotFound");
}

@end