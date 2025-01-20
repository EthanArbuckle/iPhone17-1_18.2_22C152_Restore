@interface ACTKeyboardController
- (ACTKeyboardController)init;
- (ACTKeyboardController)initWithInputMode:(id)a3;
- (ACTKeyboardLayoutUtils)layoutUtils;
- (BOOL)asyncPredictions;
- (BOOL)canSuggestSupplementalItemsForCurrentSelection;
- (BOOL)generatesCandidates;
- (BOOL)hardwareKeyboardMode;
- (BOOL)hasPrediction:(id)a3;
- (BOOL)inlineCompletionEnabled;
- (BOOL)inputIsPunctuationFollowingContinuousPath;
- (BOOL)insertsSpaceAfterPredictiveInput;
- (BOOL)isAutoshifted;
- (BOOL)isContinuousPathNonSpacePunctuation:(unsigned int)a3;
- (BOOL)isKeyStringAboveSpaceBar:(id)a3;
- (BOOL)isKeyplane:(id)a3 alternateOfKeyplane:(id)a4;
- (BOOL)isKeyplane:(id)a3 shiftAlternateOfKeyplane:(id)a4;
- (BOOL)isScreenLocked;
- (BOOL)isShifted;
- (BOOL)justAcceptedAutocorrection;
- (BOOL)lastInputWasContinuousPath;
- (BOOL)lastInputWasSelection;
- (BOOL)longPredictionListEnabled;
- (BOOL)nextKeyIsFlick;
- (BOOL)nextKeyIsMultitap;
- (BOOL)secureTextEntry;
- (BOOL)shouldAcceptCandidate:(id)a3 beforeInputString:(id)a4;
- (BOOL)shouldSkipCandidateSelection;
- (BOOL)syncToKeyboardStateByWaitingForResults:(BOOL)a3;
- (BOOL)touchPassesDragThresholdAtPoint:(CGPoint)a3 pathIndex:(unint64_t)a4;
- (BOOL)usesAutocapitalization;
- (BOOL)usesAutocorrection;
- (BOOL)usesPrediction;
- (BOOL)usesTransliteration;
- (BOOL)wordLearningEnabled;
- (NSArray)keys;
- (NSArray)predictions;
- (NSCondition)requestCondition;
- (NSLock)cpRequestTokenLock;
- (NSMutableDictionary)activeTouchState;
- (NSMutableSet)leftKeys;
- (NSMutableSet)rightKeys;
- (NSString)clientIdentifier;
- (NSString)inputModeIdentifier;
- (NSString)lastCommittedText;
- (NSString)markedText;
- (NSString)recipientIdentifier;
- (NSString)text;
- (NSUUID)documentIdentifier;
- (TIAutocorrectionList)autocorrectionList;
- (TICandidateRequestToken)currentRequestToken;
- (TICandidateRequestToken)lastCPRequestToken;
- (TIInputContextHistory)inputContextHistory;
- (TIInputMode)inputMode;
- (TIKeyboardCandidate)autocorrection;
- (TIKeyboardCandidate)inlineCompletion;
- (TIKeyboardCandidateResultSet)candidateResultSet;
- (TIKeyboardInputManager)existingInputManager;
- (TIKeyboardInputManager)inputManager;
- (TIKeyboardInputManagerFactory)keyboardInputManagerFactory;
- (TIKeyboardInputManagerState)inputManagerState;
- (TIKeyboardInputManagerWrapper)inputManagerWrapper;
- (TIKeyboardIntermediateText)intermediateText;
- (TIKeyboardState)keyboardState;
- (TISmartPunctuationController)smartPunctuationController;
- (TTKSimpleKeyboardPlane)ttkLayout;
- (UIKBTree)keyboard;
- (UIKBTree)keyplane;
- (_NSRange)selectedRange;
- (_NSRange)selectedRangeForText:(id)a3;
- (float)distanceFromKey:(id)a3 toPoint:(CGPoint)a4;
- (id)adjustContinuousPathCandidate:(id)a3;
- (id)candidateByApplyingSmartPunctuationToCandidate:(id)a3;
- (id)candidateToConfirmInputString;
- (id)candidatesForString:(id)a3;
- (id)clonedKeyboardState;
- (id)createKeyboardInputManagerWrapper;
- (id)displayStringOverrideForKey:(id)a3;
- (id)keyContainingPoint:(CGPoint)a3 inKeyplane:(id)a4;
- (id)keyToAccessKeyplane:(id)a3 fromKeyplane:(id)a4;
- (id)performSkipTapAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7 forcedKeyCode:(int64_t)a8;
- (id)performTouchUpAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7 secondaryString:(BOOL)a8;
- (id)trimmedCandidate:(id)a3;
- (int64_t)keyCodeWithString:(id)a3 inKeyplane:(id)a4;
- (int64_t)performTouchDownAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7;
- (int64_t)performTouchDragAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7;
- (int64_t)retestTouchAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7;
- (unint64_t)autocapitalizationType;
- (unint64_t)autocorrectionType;
- (unint64_t)supplementalLexiconIdentifier;
- (void)acceptAutocorrection;
- (void)acceptCandidate:(id)a3;
- (void)acceptCandidate:(id)a3 predictiveCandidate:(BOOL)a4;
- (void)acceptCandidateInputEvent:(id)a3 fromCandidateBar:(BOOL)a4;
- (void)addInput:(id)a3 fromVariantKey:(BOOL)a4 fromGestureKey:(BOOL)a5;
- (void)addInput:(id)a3 fromVariantKey:(BOOL)a4 fromGestureKey:(BOOL)a5 touchEvent:(id)a6;
- (void)addInput:(id)a3 fromVariantKey:(BOOL)a4 touchEvent:(id)a5;
- (void)addStringFromGestureKeyInput:(id)a3;
- (void)addStringFromVariantKey:(id)a3;
- (void)adjustCursorByOffset:(int64_t)a3;
- (void)adjustKeyplaneEmulatingKBStar:(id)a3;
- (void)adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4;
- (void)alternateKeyplane;
- (void)closeRequestToken:(id)a3;
- (void)commitText;
- (void)dealloc;
- (void)deleteBackwards;
- (void)deleteInput;
- (void)deleteInput:(id)a3;
- (void)deleteText:(id)a3 rawText:(id)a4;
- (void)divideKeyplane:(id)a3 intoLeft:(id)a4 right:(id)a5;
- (void)enumerateKeyplaneNamesAdjacentToKeyplane:(id)a3 usingBlock:(id)a4;
- (void)generateAutocorrectionsOrCandidates;
- (void)generateAutocorrectionsWithCount:(unint64_t)a3;
- (void)generateAutocorrectionsWithKeyboardState:(id)a3;
- (void)generateAutocorrectionsWithShiftState:(int)a3;
- (void)generateCandidates;
- (void)generateCandidatesWithKeyboardState:(id)a3;
- (void)handleKeyboardInput:(id)a3;
- (void)insertText:(id)a3;
- (void)insertTextAfterSelection:(id)a3;
- (void)mergeFrameFromKey:(id)a3 intoKey:(id)a4;
- (void)performTouchCancelAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7;
- (void)performTouchEndRestAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7;
- (void)performTouchRestAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7;
- (void)pushAutocorrections:(id)a3 requestToken:(id)a4;
- (void)pushCandidateResultSet:(id)a3 requestToken:(id)a4;
- (void)registerLayoutWithFavonius;
- (void)rejectCandidate:(id)a3;
- (void)reset;
- (void)setActiveTouchState:(id)a3;
- (void)setAsyncPredictions:(BOOL)a3;
- (void)setAutocapitalizationType:(unint64_t)a3;
- (void)setAutocorrectionList:(id)a3;
- (void)setAutocorrectionType:(unint64_t)a3;
- (void)setCanSuggestSupplementalItemsForCurrentSelection:(BOOL)a3;
- (void)setCandidateResultSet:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setCpRequestTokenLock:(id)a3;
- (void)setCurrentRequestToken:(id)a3;
- (void)setDocumentIdentifier:(id)a3;
- (void)setHardwareKeyboardMode:(BOOL)a3;
- (void)setInitialKeyplane;
- (void)setInlineCompletionEnabled:(BOOL)a3;
- (void)setInputContextHistory:(id)a3;
- (void)setInputIsPunctuationFollowingContinuousPath:(BOOL)a3;
- (void)setInputManagerState:(id)a3;
- (void)setInputManagerWrapper:(id)a3;
- (void)setInputModeIdentifier:(id)a3;
- (void)setInsertsSpaceAfterPredictiveInput:(BOOL)a3;
- (void)setIntermediateText:(id)a3;
- (void)setIsScreenLocked:(BOOL)a3;
- (void)setJustAcceptedAutocorrection:(BOOL)a3;
- (void)setKeyboard:(id)a3;
- (void)setKeyboardConfiguration:(id)a3;
- (void)setKeyboardInputManagerFactory:(id)a3;
- (void)setKeyboardState:(id)a3;
- (void)setKeyplane:(id)a3;
- (void)setKeys:(id)a3;
- (void)setLastCPRequestToken:(id)a3;
- (void)setLastInputWasContinuousPath:(BOOL)a3;
- (void)setLastInputWasSelection:(BOOL)a3;
- (void)setLeftKeys:(id)a3;
- (void)setLongPredictionListEnabled:(BOOL)a3;
- (void)setMarkedText:(id)a3;
- (void)setNextKeyIsFlick:(BOOL)a3;
- (void)setNextKeyIsMultitap:(BOOL)a3;
- (void)setRecipientIdentifier:(id)a3;
- (void)setRightKeys:(id)a3;
- (void)setSecureTextEntry:(BOOL)a3;
- (void)setSelectedRange:(_NSRange)a3;
- (void)setShouldSkipCandidateSelection:(BOOL)a3;
- (void)setSupplementalLexiconIdentifier:(unint64_t)a3;
- (void)setTtkLayout:(id)a3;
- (void)setUsesAutocapitalization:(BOOL)a3;
- (void)setUsesAutocorrection:(BOOL)a3;
- (void)setUsesPrediction:(BOOL)a3;
- (void)setUsesTransliteration:(BOOL)a3;
- (void)setWordLearningEnabled:(BOOL)a3;
- (void)shiftKeyplane;
- (void)syncToDocumentState:(id)a3;
- (void)syncToEmptyDocument;
- (void)syncToKeyboardState;
- (void)tearDown;
- (void)textAccepted:(id)a3 predictiveCandidate:(BOOL)a4;
- (void)updateAutoshift;
- (void)updateDocumentState;
- (void)updateKeyboardOutput:(id)a3 withInputForSmartPunctuation:(id)a4;
@end

@implementation ACTKeyboardController

- (ACTKeyboardController)init
{
  return [(ACTKeyboardController *)self initWithInputMode:0];
}

- (ACTKeyboardController)initWithInputMode:(id)a3
{
  id v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)ACTKeyboardController;
  v6 = [(ACTKeyboardController *)&v31 init];
  if (v6)
  {
    id v7 = objc_alloc_init((Class)NSMutableDictionary);
    v8 = (void *)*((void *)v6 + 31);
    *((void *)v6 + 31) = v7;

    objc_storeStrong((id *)v6 + 12, a3);
    v9 = [v5 normalizedIdentifier];
    id v10 = [v9 copy];
    v11 = (void *)*((void *)v6 + 11);
    *((void *)v6 + 11) = v10;

    v6[49] = 1;
    v6[60] = 1;
    id v12 = objc_alloc_init((Class)NSMutableString);
    v13 = (void *)*((void *)v6 + 4);
    *((void *)v6 + 4) = v12;

    v14 = [ACTKeyboardLayoutUtils alloc];
    v15 = [v5 locale];
    v16 = [(ACTKeyboardLayoutUtils *)v14 initWithLocale:v15];
    v17 = (void *)*((void *)v6 + 9);
    *((void *)v6 + 9) = v16;

    *(_OWORD *)(v6 + 168) = xmmword_862A0;
    v6[56] = 1;
    v18 = NSClassFromString(@"TISmartPunctuationController");
    if (v18)
    {
      id v19 = objc_alloc_init(v18);
      v20 = (void *)*((void *)v6 + 23);
      *((void *)v6 + 23) = v19;

      Class v21 = NSClassFromString(@"TISmartPunctuationOptions");
      v22 = [v5 locale];
      v23 = [(objc_class *)v21 smartPunctuationOptionsForLocale:v22];
      [*((id *)v6 + 23) setSmartPunctuationOptions:v23];

      [*((id *)v6 + 23) setSmartQuotesEnabled:0];
      [*((id *)v6 + 23) setSmartDashesEnabled:0];
    }
    id v24 = objc_alloc_init((Class)NSCondition);
    v25 = (void *)*((void *)v6 + 32);
    *((void *)v6 + 32) = v24;

    id v26 = objc_alloc_init((Class)NSLock);
    v27 = (void *)*((void *)v6 + 34);
    *((void *)v6 + 34) = v26;

    uint64_t v28 = +[NSUUID UUID];
    v29 = (void *)*((void *)v6 + 36);
    *((void *)v6 + 36) = v28;

    +[TIKeyboardInputManager swizzleTestingParameters];
  }

  return (ACTKeyboardController *)v6;
}

- (void)dealloc
{
  v3 = [(ACTKeyboardController *)self inputManager];
  [v3 suspend];

  v4.receiver = self;
  v4.super_class = (Class)ACTKeyboardController;
  [(ACTKeyboardController *)&v4 dealloc];
}

- (void)setAutocorrectionList:(id)a3
{
  objc_super v4 = (TIAutocorrectionList *)a3;
  obj = self;
  objc_sync_enter(obj);
  autocorrectionList = obj->_autocorrectionList;
  obj->_autocorrectionList = v4;

  objc_sync_exit(obj);
}

- (TIAutocorrectionList)autocorrectionList
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_autocorrectionList;
  objc_sync_exit(v2);

  return v3;
}

- (void)setKeyboard:(id)a3
{
  id v5 = (UIKBTree *)a3;
  p_keyboard = &self->_keyboard;
  if (self->_keyboard != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)p_keyboard, a3);
    id v7 = [(UIKBTree *)self->_keyboard subtrees];
    v8 = [v7 objectAtIndex:0];
    [(ACTKeyboardController *)self setKeyplane:v8];

    [(ACTKeyboardController *)self setInitialKeyplane];
    p_keyboard = (UIKBTree **)[(ACTKeyboardController *)self updateAutoshift];
    id v5 = v9;
  }

  _objc_release_x1(p_keyboard, v5);
}

- (void)setKeyplane:(id)a3
{
  v22 = (UIKBTree *)a3;
  if (self->_keyplane != v22)
  {
    objc_storeStrong((id *)&self->_keyplane, a3);
    [(UIKBTree *)self->_keyplane zipGeometrySet];
    [(ACTKeyboardController *)self adjustKeyplaneEmulatingKBStar:self->_keyplane];
    id v5 = [(ACTKeyboardController *)self keyplane];
    v6 = [v5 keys];
    [(ACTKeyboardController *)self setKeys:v6];

    id v7 = [(ACTKeyboardController *)self keyplane];
    v8 = [v7 cachedKeysByKeyName:@"Latin-Accents"];
    v9 = [(ACTKeyboardController *)self keyboardState];
    id v10 = [v9 layoutState];
    [v10 setHasAccentKey:v8 != 0];

    v11 = [(ACTKeyboardController *)self keyplane];
    id v12 = [v11 isAlphabeticPlane];
    v13 = [(ACTKeyboardController *)self keyboardState];
    v14 = [v13 layoutState];
    [v14 setIsAlphabeticPlane:v12];

    leftKeys = self->_leftKeys;
    self->_leftKeys = 0;

    rightKeys = self->_rightKeys;
    self->_rightKeys = 0;

    v17 = [(UIKBTree *)self->_keyplane name];
    LODWORD(v12) = [v17 containsString:@"Wildcat"];

    if (v12)
    {
      v18 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      id v19 = self->_leftKeys;
      self->_leftKeys = v18;

      v20 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      Class v21 = self->_rightKeys;
      self->_rightKeys = v20;

      [(ACTKeyboardController *)self divideKeyplane:self->_keyplane intoLeft:self->_leftKeys right:self->_rightKeys];
    }
  }
  [(ACTKeyboardController *)self registerLayoutWithFavonius];
}

- (void)divideKeyplane:(id)a3 intoLeft:(id)a4 right:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (v8 && v9)
  {
    [v8 removeAllObjects];
    [v10 removeAllObjects];
    v11 = [v7 subtrees];
    id v12 = [v11 firstObject];

    v48[0] = 0;
    v48[1] = v48;
    v48[2] = 0x4010000000;
    v48[3] = &unk_82CF2;
    CGSize size = CGRectNull.size;
    CGPoint origin = CGRectNull.origin;
    CGSize v50 = size;
    v45[0] = 0;
    v45[1] = v45;
    v45[2] = 0x4010000000;
    v45[3] = &unk_82CF2;
    CGPoint v46 = origin;
    CGSize v47 = size;
    v14 = [v12 keys];
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_1BA58;
    v44[3] = &unk_8CF98;
    v44[4] = v48;
    v44[5] = v45;
    [v14 enumerateObjectsUsingBlock:v44];

    UIRectInset();
    uint64_t v31 = v15;
    uint64_t v17 = v16;
    uint64_t v19 = v18;
    uint64_t v21 = v20;
    UIRectInset();
    uint64_t v23 = v22;
    uint64_t v25 = v24;
    uint64_t v27 = v26;
    uint64_t v29 = v28;
    v30 = [v7 keys];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1BB08;
    v32[3] = &unk_8CFC0;
    uint64_t v36 = v31;
    uint64_t v37 = v17;
    uint64_t v38 = v19;
    uint64_t v39 = v21;
    v35 = v48;
    id v33 = v8;
    uint64_t v40 = v23;
    uint64_t v41 = v25;
    uint64_t v42 = v27;
    uint64_t v43 = v29;
    id v34 = v10;
    [v30 enumerateObjectsUsingBlock:v32];

    _Block_object_dispose(v45, 8);
    _Block_object_dispose(v48, 8);
  }
}

- (void)mergeFrameFromKey:(id)a3 intoKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5 && v6 && [v5 count] == (char *)&def_3B118 + 1)
  {
    id v8 = [v5 lastObject];
    uint64_t v49 = 0;
    CGSize v50 = &v49;
    uint64_t v51 = 0x3032000000;
    v52 = sub_1BF54;
    v53 = sub_1BF64;
    id v54 = [v7 firstObject];
    uint64_t v45 = 0;
    CGPoint v46 = (double *)&v45;
    uint64_t v47 = 0x2020000000;
    uint64_t v48 = 0x7FEFFFFFFFFFFFFFLL;
    if ([v7 count])
    {
      [v8 frame];
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_1BF6C;
      v37[3] = &unk_8CFE8;
      uint64_t v41 = v9;
      uint64_t v42 = v10;
      uint64_t v43 = v11;
      uint64_t v44 = v12;
      id v38 = v8;
      uint64_t v39 = &v45;
      uint64_t v40 = &v49;
      [v7 enumerateObjectsUsingBlock:v37];
    }
    if (v46[3] < 2.0)
    {
      [v8 frame];
      CGFloat v14 = v13;
      CGFloat v16 = v15;
      CGFloat v18 = v17;
      CGFloat v20 = v19;
      [(id)v50[5] frame];
      v59.origin.x = v21;
      v59.origin.y = v22;
      v59.size.width = v23;
      v59.size.height = v24;
      v55.origin.x = v14;
      v55.origin.y = v16;
      v55.size.width = v18;
      v55.size.height = v20;
      CGRect v56 = CGRectUnion(v55, v59);
      objc_msgSend((id)v50[5], "setFrame:", v56.origin.x, v56.origin.y, v56.size.width, v56.size.height);
      [v8 paddedFrame];
      CGFloat v26 = v25;
      CGFloat v28 = v27;
      CGFloat v30 = v29;
      CGFloat v32 = v31;
      [(id)v50[5] paddedFrame];
      v60.origin.x = v33;
      v60.origin.y = v34;
      v60.size.width = v35;
      v60.size.height = v36;
      v57.origin.x = v26;
      v57.origin.y = v28;
      v57.size.width = v30;
      v57.size.height = v32;
      CGRect v58 = CGRectUnion(v57, v60);
      objc_msgSend((id)v50[5], "setPaddedFrame:", v58.origin.x, v58.origin.y, v58.size.width, v58.size.height);
    }
    [v8 setVisible:0];
    _Block_object_dispose(&v45, 8);
    _Block_object_dispose(&v49, 8);
  }
}

- (void)adjustKeyplaneEmulatingKBStar:(id)a3
{
  id v45 = a3;
  objc_super v4 = [v45 keys];
  id v5 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v54 objects:v60 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v55;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v55 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        uint64_t v11 = self;
        uint64_t v12 = [(ACTKeyboardController *)self layoutUtils];
        double v13 = objc_msgSend(v12, "representedStringForKey:shifted:", v10, objc_msgSend(v45, "isShiftKeyplane"));
        CGFloat v14 = [v13 lowercaseString];

        if (v14)
        {
          id v15 = [v5 objectForKey:v14];
          if (!v15)
          {
            id v15 = objc_alloc_init((Class)NSMutableArray);
            [v5 setObject:v15 forKey:v14];
          }
          [v15 addObject:v10];
        }
        [v10 setVisible:1];

        self = v11;
      }
      id v7 = [obj countByEnumeratingWithState:&v54 objects:v60 count:16];
    }
    while (v7);
  }

  if (self->_ttkLayout)
  {
    CGFloat v16 = objc_opt_new();
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    uint64_t v42 = self;
    id v43 = [(TTKSimpleKeyboardPlane *)self->_ttkLayout keys];
    id v17 = [v43 countByEnumeratingWithState:&v50 objects:v59 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v51;
      do
      {
        for (j = 0; j != v18; j = (char *)j + 1)
        {
          if (*(void *)v51 != v19) {
            objc_enumerationMutation(v43);
          }
          CGFloat v21 = *(void **)(*((void *)&v50 + 1) + 8 * (void)j);
          CGFloat v22 = [v21 string];
          CGFloat v23 = @" ";
          if (([v22 isEqualToString:@"space"] & 1) == 0)
          {
            CGFloat v23 = [v21 string];
          }

          CGFloat v24 = [v5 valueForKey:v23];

          if (v24)
          {
            double v25 = [v5 objectForKeyedSubscript:v23];
            CGFloat v26 = [v25 firstObject];

            double v27 = [v26 name];
            [v16 setObject:v21 forKey:v27];
          }
        }
        id v18 = [v43 countByEnumeratingWithState:&v50 objects:v59 count:16];
      }
      while (v18);
    }

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    CGFloat v28 = [v5 allValues];
    id v29 = [v28 countByEnumeratingWithState:&v46 objects:v58 count:16];
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v47;
      do
      {
        for (k = 0; k != v30; k = (char *)k + 1)
        {
          if (*(void *)v47 != v31) {
            objc_enumerationMutation(v28);
          }
          CGFloat v33 = [*(id *)(*((void *)&v46 + 1) + 8 * (void)k) firstObject];
          CGFloat v34 = [v33 name];
          CGFloat v35 = [v16 objectForKey:v34];

          if (v35)
          {
            CGFloat v36 = [v33 name];
            uint64_t v37 = [v16 objectForKey:v36];

            [v37 frame];
            objc_msgSend(v33, "setFrame:");
            [v37 frame];
            objc_msgSend(v33, "setPaddedFrame:");
          }
        }
        id v30 = [v28 countByEnumeratingWithState:&v46 objects:v58 count:16];
      }
      while (v30);
    }

    self = v42;
  }
  id v38 = [v5 objectForKey:@"dictation"];
  uint64_t v39 = [v5 objectForKey:@" "];
  [(ACTKeyboardController *)self mergeFrameFromKey:v38 intoKey:v39];

  uint64_t v40 = [v5 objectForKey:@"international"];
  uint64_t v41 = [v5 objectForKey:@"more"];
  [(ACTKeyboardController *)self mergeFrameFromKey:v40 intoKey:v41];
}

- (BOOL)isShifted
{
  v2 = [(ACTKeyboardController *)self keyplane];
  unsigned __int8 v3 = [v2 isShiftKeyplane];

  return v3;
}

- (BOOL)isAutoshifted
{
  v2 = [(ACTKeyboardController *)self keyboardState];
  BOOL v3 = [v2 shiftState] == 2;

  return v3;
}

- (void)shiftKeyplane
{
  BOOL v3 = [(ACTKeyboardController *)self keyboard];
  objc_super v4 = [(ACTKeyboardController *)self keyplane];
  id v5 = [v4 shiftAlternateKeyplaneName];
  id v6 = [v3 subtreeWithName:v5];
  [(ACTKeyboardController *)self setKeyplane:v6];

  id v7 = [(ACTKeyboardController *)self keyplane];
  id v8 = [v7 isShiftKeyplane];

  id v9 = [(ACTKeyboardController *)self keyboardState];
  [v9 setShiftState:v8];
}

- (void)alternateKeyplane
{
  BOOL v3 = [(ACTKeyboardController *)self keyboard];
  objc_super v4 = [(ACTKeyboardController *)self keyplane];
  id v5 = [v4 alternateKeyplaneName];
  id v6 = [v3 subtreeWithName:v5];
  [(ACTKeyboardController *)self setKeyplane:v6];

  id v7 = [(ACTKeyboardController *)self keyplane];
  id v8 = [v7 isShiftKeyplane];

  id v9 = [(ACTKeyboardController *)self keyboardState];
  [v9 setShiftState:v8];

  [(ACTKeyboardController *)self updateAutoshift];
}

- (void)updateAutoshift
{
  if ([(ACTKeyboardController *)self isShifted])
  {
    BOOL v3 = [(ACTKeyboardController *)self keyplane];
    unsigned __int8 v4 = [v3 BOOLForProperty:@"shift-is-plane-chooser"];

    if ((v4 & 1) == 0) {
      [(ACTKeyboardController *)self shiftKeyplane];
    }
  }
  if (![(ACTKeyboardController *)self isShifted])
  {
    id v13 = [(ACTKeyboardController *)self keyplane];
    if (![v13 usesAutoShift]) {
      goto LABEL_16;
    }
    unsigned int v5 = [(ACTKeyboardController *)self usesAutocapitalization];

    if (!v5) {
      return;
    }
    id v13 = [(ACTKeyboardController *)self text];
    unint64_t v6 = [(ACTKeyboardController *)self autocapitalizationType];
    if (v6 == 1)
    {
      if ([v13 length])
      {
        id v9 = [(ACTKeyboardController *)self inputManagerState];
        uint64_t v10 = +[NSString _stringWithUnichar:](NSString, "_stringWithUnichar:", [v13 _lastLongCharacter]);
        unsigned int v11 = [v9 stringEndsWord:v10];

        if (!v11)
        {
LABEL_16:

          return;
        }
      }
    }
    else if (v6 != 3)
    {
      if (v6 != 2) {
        goto LABEL_16;
      }
      id v7 = [(ACTKeyboardController *)self inputManagerState];
      unsigned __int8 v8 = [v7 nextInputWouldStartSentence];

      if ((v8 & 1) == 0) {
        goto LABEL_16;
      }
    }
    [(ACTKeyboardController *)self shiftKeyplane];
    uint64_t v12 = [(ACTKeyboardController *)self keyboardState];
    [v12 setShiftState:2];

    goto LABEL_16;
  }
}

- (void)setInitialKeyplane
{
  BOOL v3 = [(ACTKeyboardController *)self keyboard];
  id v9 = [v3 subtrees];

  unsigned __int8 v4 = [v9 objectAtIndex:0];
  if ([v4 isShiftKeyplane])
  {
    unsigned int v5 = [(ACTKeyboardController *)self keyboard];
    unint64_t v6 = [v4 shiftAlternateKeyplaneName];
    uint64_t v7 = [v5 subtreeWithName:v6];

    unsigned __int8 v4 = (void *)v7;
  }
  [(ACTKeyboardController *)self setKeyplane:v4];
  unsigned __int8 v8 = [(ACTKeyboardController *)self keyboardState];
  [v8 setShiftState:0];
}

- (void)setKeyboardConfiguration:(id)a3
{
  id v9 = a3;
  unsigned __int8 v4 = [v9 inputManagerState];
  [(ACTKeyboardController *)self setInputManagerState:v4];

  unsigned int v5 = [v9 intermediateText];

  if (v5)
  {
    unint64_t v6 = [v9 intermediateText];
    [(ACTKeyboardController *)self setIntermediateText:v6];
  }
  layoutUtils = self->_layoutUtils;
  unsigned __int8 v8 = [v9 accentKeyString];
  [(ACTKeyboardLayoutUtils *)layoutUtils setLayoutKeyOverride:v8 forKey:UIKeyboardKeyAccent uiKeyboardStringNothing:UIKeyboardStringNothing];

  [(ACTKeyboardController *)self registerLayoutWithFavonius];
  [(ACTKeyboardController *)self updateDocumentState];
}

- (void)setIntermediateText:(id)a3
{
  objc_storeStrong((id *)&self->_intermediateText, a3);
  id v5 = a3;
  unint64_t v6 = [v5 displayString];
  [(ACTKeyboardController *)self setMarkedText:v6];

  uint64_t v7 = [v5 inputString];
  unsigned __int8 v8 = [(ACTKeyboardController *)self keyboardState];
  [v8 setInputForMarkedText:v7];

  id v10 = [v5 searchString];

  id v9 = [(ACTKeyboardController *)self keyboardState];
  [v9 setSearchStringForMarkedText:v10];
}

- (void)registerLayoutWithFavonius
{
  id v3 = objc_alloc((Class)TIKeyboardLayout);
  unsigned __int8 v4 = [(ACTKeyboardController *)self keys];
  id v24 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  if (self->_leftKeys && self->_rightKeys) {
    [v24 setUsesTwoHands:1];
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [(ACTKeyboardController *)self keys];
  id v5 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v26;
    double y = CGRectNull.origin.y;
    double width = CGRectNull.size.width;
    double height = CGRectNull.size.height;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v26 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if ([v12 visible])
        {
          id v13 = [(ACTKeyboardController *)self layoutUtils];
          uint64_t v14 = objc_msgSend(v13, "representedStringForKey:shifted:", v12, -[ACTKeyboardController isShifted](self, "isShifted"));

          if (v14) {
            id v15 = (__CFString *)v14;
          }
          else {
            id v15 = &stru_8DEF0;
          }
          CGFloat v16 = [(ACTKeyboardController *)self inputModeIdentifier];
          id v17 = TIInputModeGetLanguageWithRegion();
          id v18 = +[NSLocale localeWithLocaleIdentifier:v17];

          uint64_t v19 = [(__CFString *)v15 lowercaseStringWithLocale:v18];
          CGFloat v20 = (void *)v19;
          if (v19) {
            uint64_t v21 = v19;
          }
          else {
            uint64_t v21 = (uint64_t)v15;
          }
          [v12 paddedFrame];
          objc_msgSend(v24, "addKeyWithExactString:frame:", v21);
        }
        else
        {
          objc_msgSend(v24, "addKeyWithExactString:frame:", &stru_8DEF0, CGRectNull.origin.x, y, width, height);
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v6);
  }

  CGFloat v22 = [(ACTKeyboardController *)self keyboardState];
  [v22 setKeyLayout:v24];
}

- (id)clonedKeyboardState
{
  v2 = [(ACTKeyboardController *)self keyboardState];
  id v3 = [v2 copy];

  return v3;
}

- (void)reset
{
  +[TILanguageModelLoaderManager clearDynamicLearningCaches];
  if (self->_inputManagerWrapper)
  {
    id v3 = [(ACTKeyboardController *)self inputManager];
    [v3 clearSoftLearning];

    unsigned __int8 v4 = [(ACTKeyboardController *)self inputManager];
    [v4 suspend];

    inputManagerWrapper = self->_inputManagerWrapper;
    self->_inputManagerWrapper = 0;
  }
  id v6 = [(ACTKeyboardController *)self inputManager];
  [v6 resume];

  uint64_t v7 = +[NSUUID UUID];
  [(ACTKeyboardController *)self setDocumentIdentifier:v7];

  [(ACTKeyboardController *)self syncToEmptyDocument];
}

- (void)tearDown
{
  id v2 = [(ACTKeyboardController *)self inputManager];
  [v2 tearDown];
}

- (TIKeyboardInputManager)inputManager
{
  id v2 = [(ACTKeyboardController *)self inputManagerWrapper];
  id v3 = [v2 inputManager];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (TIKeyboardInputManager *)v4;
}

- (TIKeyboardInputManager)existingInputManager
{
  id v2 = [(TIKeyboardInputManagerWrapper *)self->_inputManagerWrapper inputManager];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (TIKeyboardInputManager *)v3;
}

- (id)createKeyboardInputManagerWrapper
{
  id v3 = objc_alloc_init((Class)TIKeyboardInputManagerWrapper);
  id v4 = [(ACTKeyboardController *)self keyboardInputManagerFactory];

  if (v4)
  {
    id v5 = [(ACTKeyboardController *)self keyboardInputManagerFactory];
    id v6 = [v5 newKeyboardInputManager];
  }
  else
  {
    id v7 = objc_alloc((Class)TIKeyboardInputManager);
    id v5 = [(ACTKeyboardController *)self inputMode];
    id v6 = [v7 initWithInputMode:v5 keyboardState:0];
  }
  unsigned __int8 v8 = v6;

  [v3 setInputManager:v8];
  [v3 changingContextWithTrigger:TIContextChangeTriggerGainFocus];

  return v3;
}

- (TIKeyboardInputManagerWrapper)inputManagerWrapper
{
  inputManagerWrapper = self->_inputManagerWrapper;
  if (!inputManagerWrapper)
  {
    id v4 = [(ACTKeyboardController *)self createKeyboardInputManagerWrapper];
    if (objc_opt_respondsToSelector())
    {
      id v5 = [[ACTClientProxy alloc] initWithClient:self];
      [v4 setClientProxy:v5];
    }
    [(ACTKeyboardController *)self setInputManagerWrapper:v4];

    inputManagerWrapper = self->_inputManagerWrapper;
  }

  return inputManagerWrapper;
}

- (BOOL)hardwareKeyboardMode
{
  id v3 = [(ACTKeyboardController *)self keyboardState];

  if (!v3) {
    return self->_hardwareKeyboardMode;
  }
  id v4 = [(ACTKeyboardController *)self keyboardState];
  unsigned __int8 v5 = [v4 hardwareKeyboardMode];

  return v5;
}

- (void)setHardwareKeyboardMode:(BOOL)a3
{
  BOOL v3 = a3;
  self->_hardwareKeyboardMode = a3;
  id v4 = [(ACTKeyboardController *)self keyboardState];
  [v4 setHardwareKeyboardMode:v3];
}

- (BOOL)shouldSkipCandidateSelection
{
  id v2 = [(ACTKeyboardController *)self keyboardState];
  unsigned __int8 v3 = [v2 shouldSkipCandidateSelection];

  return v3;
}

- (void)setShouldSkipCandidateSelection:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(ACTKeyboardController *)self keyboardState];
  [v4 setShouldSkipCandidateSelection:v3];
}

- (void)commitText
{
  BOOL v3 = [(ACTKeyboardController *)self inputManagerState];
  unsigned int v4 = [v3 usesCandidateSelection];

  if (!v4)
  {
    if (![(ACTKeyboardController *)self usesAutocorrection]) {
      return;
    }
    id v7 = [(ACTKeyboardController *)self autocorrectionList];
    unsigned __int8 v8 = [v7 candidates];
    id v33 = [v8 firstObject];

    uint64_t v9 = [v33 rawInput];
    if (!v9) {
      goto LABEL_8;
    }
    id v10 = (void *)v9;
    unsigned int v11 = [v33 rawInput];
    uint64_t v12 = [v33 input];
    if ([v11 isEqualToString:v12])
    {

LABEL_8:
      [(ACTKeyboardController *)self acceptAutocorrection];
      goto LABEL_16;
    }
    id v13 = [v33 input];
    uint64_t v14 = [v33 candidate];
    if ([v13 isEqualToString:v14])
    {
    }
    else
    {
      id v15 = [v33 rawInput];
      CGFloat v16 = [v33 candidate];
      unsigned __int8 v17 = [v15 isEqualToString:v16];

      if ((v17 & 1) == 0) {
        goto LABEL_8;
      }
    }
    id v18 = [v33 input];
    id v19 = [(ACTKeyboardController *)self selectedRangeForText:v18];
    uint64_t v21 = v20;

    CGFloat v22 = -[NSMutableString substringWithRange:](self->_text, "substringWithRange:", v19, v21);
    CGFloat v23 = [v33 input];
    LOBYTE(v21) = [v22 isEqualToString:v23];

    if ((v21 & 1) == 0)
    {
      id v24 = [v33 rawInput];
      id v25 = [(ACTKeyboardController *)self selectedRangeForText:v24];
      uint64_t v27 = v26;

      uint64_t v28 = -[NSMutableString substringWithRange:](self->_text, "substringWithRange:", v25, v27);

      CGFloat v22 = (void *)v28;
    }
    id v29 = objc_alloc((Class)TIKeyboardCandidateSingle);
    id v30 = [v33 input];
    uint64_t v31 = [v33 rawInput];
    id v32 = [v29 initWithCandidate:v22 forInput:v30 rawInput:v31];

    [(ACTKeyboardController *)self textAccepted:v32 predictiveCandidate:0];
    [(ACTKeyboardController *)self setAutocorrectionList:0];

    goto LABEL_16;
  }
  unsigned __int8 v5 = [(ACTKeyboardController *)self candidateResultSet];
  id v33 = [v5 firstCandidate];

  id v6 = v33;
  if (v33)
  {
    [(ACTKeyboardController *)self acceptCandidate:v33];
LABEL_16:
    id v6 = v33;
  }
}

- (void)syncToDocumentState:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (TIKeyboardState *)objc_alloc_init((Class)TIKeyboardState);
  keyboardState = self->_keyboardState;
  self->_keyboardState = v5;

  id v7 = [(ACTKeyboardController *)self documentIdentifier];
  [(TIKeyboardState *)self->_keyboardState setDocumentIdentifier:v7];

  id v8 = objc_alloc_init((Class)TITextInputTraits);
  [(TIKeyboardState *)self->_keyboardState setTextInputTraits:v8];

  text = self->_text;
  uint64_t v10 = [v4 contextBeforeInput];
  unsigned int v11 = (void *)v10;
  if (v10) {
    CFStringRef v12 = (const __CFString *)v10;
  }
  else {
    CFStringRef v12 = &stru_8DEF0;
  }
  [(NSMutableString *)text setString:v12];

  id v13 = [(NSMutableString *)self->_text length];
  uint64_t v14 = [v4 selectedText];
  id v15 = [v14 length];
  self->_selectedRange.location = (NSUInteger)v13;
  self->_selectedRange.length = (NSUInteger)v15;

  CGFloat v16 = self->_text;
  uint64_t v17 = [v4 selectedText];
  id v18 = (void *)v17;
  if (v17) {
    CFStringRef v19 = (const __CFString *)v17;
  }
  else {
    CFStringRef v19 = &stru_8DEF0;
  }
  [(NSMutableString *)v16 appendString:v19];

  uint64_t v20 = self->_text;
  uint64_t v21 = [v4 contextAfterInput];
  CGFloat v22 = (void *)v21;
  if (v21) {
    CFStringRef v23 = (const __CFString *)v21;
  }
  else {
    CFStringRef v23 = &stru_8DEF0;
  }
  [(NSMutableString *)v20 appendString:v23];

  id v24 = [(ACTKeyboardController *)self autocorrectionList];
  id v25 = [v24 corrections];
  uint64_t v26 = [v25 autocorrection];
  if (v26)
  {
    uint64_t v27 = (void *)v26;
    int v28 = TISwearWordPolicyV1Enabled();

    if (!v28) {
      goto LABEL_14;
    }
    id v24 = [(ACTKeyboardController *)self inputManagerWrapper];
    id v25 = [(ACTKeyboardController *)self autocorrectionList];
    id v29 = [v25 corrections];
    id v30 = [v29 autocorrection];
    v109[0] = _NSConcreteStackBlock;
    v109[1] = 3221225472;
    v109[2] = sub_1DFDC;
    v109[3] = &unk_8D010;
    v109[4] = self;
    [v24 textAccepted:v30 completionHandler:v109];
  }
LABEL_14:
  [(ACTKeyboardController *)self setAutocorrectionList:0];
  [(ACTKeyboardController *)self setCandidateResultSet:0];
  uint64_t v31 = [v4 markedText];
  [(ACTKeyboardController *)self setMarkedText:v31];

  if ([v4 documentIsEmpty])
  {
    [(ACTKeyboardController *)self setIntermediateText:0];
  }
  else
  {
    id v32 = [v4 markedText];
    id v33 = [v4 markedText];
    CGFloat v34 = +[TIKeyboardIntermediateText intermediateTextWithInputString:displayString:selectionLocation:lastInputString:](TIKeyboardIntermediateText, "intermediateTextWithInputString:displayString:selectionLocation:lastInputString:", v32, v33, [v4 selectedRangeInMarkedText], 0);
    [(ACTKeyboardController *)self setIntermediateText:v34];
  }
  [(ACTKeyboardController *)self updateDocumentState];
  CGFloat v35 = [(ACTKeyboardController *)self inputModeIdentifier];
  CGFloat v36 = [(ACTKeyboardController *)self keyboardState];
  [v36 setInputMode:v35];

  uint64_t v37 = [(ACTKeyboardController *)self keyboardState];
  [v37 setAutocorrectionEnabled:1];

  unint64_t v38 = [(ACTKeyboardController *)self autocorrectionType];
  uint64_t v39 = [(ACTKeyboardController *)self keyboardState];
  uint64_t v40 = [v39 textInputTraits];
  [v40 setAutocorrectionType:v38];

  BOOL v41 = [(ACTKeyboardController *)self usesPrediction];
  uint64_t v42 = [(ACTKeyboardController *)self keyboardState];
  [v42 setAutocorrectionListUIDisplayed:v41];

  BOOL v43 = [(ACTKeyboardController *)self usesAutocapitalization];
  uint64_t v44 = [(ACTKeyboardController *)self keyboardState];
  [v44 setAutocapitalizationEnabled:v43];

  unint64_t v45 = [(ACTKeyboardController *)self autocapitalizationType];
  long long v46 = [(ACTKeyboardController *)self keyboardState];
  [v46 setAutocapitalizationType:v45];

  BOOL hardwareKeyboardMode = self->_hardwareKeyboardMode;
  long long v48 = [(ACTKeyboardController *)self keyboardState];
  [v48 setHardwareKeyboardMode:hardwareKeyboardMode];

  long long v49 = [(ACTKeyboardController *)self keyboardState];
  [v49 setShortcutConversionEnabled:1];

  BOOL v50 = [(ACTKeyboardController *)self wordLearningEnabled];
  long long v51 = [(ACTKeyboardController *)self keyboardState];
  [v51 setWordLearningEnabled:v50];

  BOOL v52 = [(ACTKeyboardController *)self inlineCompletionEnabled];
  long long v53 = [(ACTKeyboardController *)self keyboardState];
  [v53 setInlineCompletionEnabled:v52];

  long long v54 = [(ACTKeyboardController *)self clientIdentifier];
  long long v55 = [(ACTKeyboardController *)self keyboardState];
  [v55 setClientIdentifier:v54];

  long long v56 = [(ACTKeyboardController *)self recipientIdentifier];
  long long v57 = [(ACTKeyboardController *)self keyboardState];
  [v57 setRecipientIdentifier:v56];

  CGRect v58 = [(ACTKeyboardController *)self inputContextHistory];
  CGRect v59 = [(ACTKeyboardController *)self keyboardState];
  [v59 setInputContextHistory:v58];

  unint64_t v60 = [(ACTKeyboardController *)self supplementalLexiconIdentifier];
  v61 = [(ACTKeyboardController *)self keyboardState];
  [v61 setSupplementalLexiconIdentifier:v60];

  BOOL v62 = [(ACTKeyboardController *)self canSuggestSupplementalItemsForCurrentSelection];
  uint64_t v63 = [(ACTKeyboardController *)self keyboardState];
  [(id)v63 setCanSuggestSupplementalItemsForCurrentSelection:v62];

  v64 = [(ACTKeyboardController *)self keyboardState];
  LOBYTE(v63) = objc_opt_respondsToSelector();

  if (v63)
  {
    BOOL v65 = [(ACTKeyboardController *)self longPredictionListEnabled];
    v66 = [(ACTKeyboardController *)self keyboardState];
    [v66 setLongPredictionListEnabled:v65];
  }
  id v67 = objc_alloc_init((Class)TIKeyboardLayoutState);
  v68 = [(ACTKeyboardController *)self keyboardState];
  [v68 setLayoutState:v67];

  v69 = [(ACTKeyboardController *)self inputModeIdentifier];
  v70 = [(ACTKeyboardController *)self keyboardState];
  v71 = [v70 layoutState];
  [v71 setInputMode:v69];

  v72 = [(ACTKeyboardController *)self keyplane];
  v73 = [v72 cachedKeysByKeyName:@"Candidate-Selection"];
  BOOL v74 = [v73 count] != 0;
  v75 = [(ACTKeyboardController *)self keyboardState];
  v76 = [v75 layoutState];
  [v76 setHasCandidateKey:v74];

  v77 = [(ACTKeyboardController *)self keyplane];
  v78 = [v77 cachedKeysByKeyName:@"Latin-Accents"];
  BOOL v79 = [v78 count] != 0;
  v80 = [(ACTKeyboardController *)self keyboardState];
  v81 = [v80 layoutState];
  [v81 setHasAccentKey:v79];

  v82 = [(ACTKeyboardController *)self keyplane];
  v83 = [v82 cachedKeysByKeyName:@"Multitap-Complete-Key"];
  BOOL v84 = [v83 count] != 0;
  v85 = [(ACTKeyboardController *)self keyboardState];
  v86 = [v85 layoutState];
  [v86 setCanMultitap:v84];

  v87 = [(ACTKeyboardController *)self keyplane];
  id v88 = [v87 isAlphabeticPlane];
  v89 = [(ACTKeyboardController *)self keyboardState];
  v90 = [v89 layoutState];
  [v90 setIsAlphabeticPlane:v88];

  v91 = [(ACTKeyboardController *)self keyplane];
  id v92 = [v91 isKanaPlane];
  v93 = [(ACTKeyboardController *)self keyboardState];
  v94 = [v93 layoutState];
  [v94 setIsKanaPlane:v92];

  v95 = [(ACTKeyboardController *)self keyplane];
  v96 = [v95 name];
  LODWORD(v93) = [v96 containsString:@"Wildcat"];

  v97 = [(ACTKeyboardController *)self keyboardState];
  v98 = [v97 layoutState];
  [v98 setUserInterfaceIdiom:v93];

  BOOL v99 = [(ACTKeyboardController *)self secureTextEntry];
  v100 = [(ACTKeyboardController *)self keyboardState];
  [v100 setSecureTextEntry:v99];

  BOOL v101 = [(ACTKeyboardController *)self isScreenLocked];
  v102 = [(ACTKeyboardController *)self keyboardState];
  [v102 setIsScreenLocked:v101];

  [(ACTKeyboardController *)self setInitialKeyplane];
  v103 = [(ACTKeyboardController *)self layoutUtils];
  v104 = [v103 keyOverrides];
  [v104 removeAllObjects];

  v105 = [(ACTKeyboardController *)self activeTouchState];
  [v105 removeAllObjects];

  v106 = [(ACTKeyboardController *)self inputManagerWrapper];
  v107 = [(ACTKeyboardController *)self clonedKeyboardState];
  v108[0] = _NSConcreteStackBlock;
  v108[1] = 3221225472;
  v108[2] = sub_1DFE8;
  v108[3] = &unk_8D010;
  v108[4] = self;
  [v106 syncToKeyboardState:v107 completionHandler:v108];

  [(ACTKeyboardController *)self setLastInputWasSelection:0];
  [(ACTKeyboardController *)self setLastInputWasContinuousPath:0];
  [(ACTKeyboardController *)self setInputIsPunctuationFollowingContinuousPath:0];
  [(ACTKeyboardController *)self updateAutoshift];
  [(ACTKeyboardController *)self generateAutocorrectionsOrCandidates];
}

- (void)syncToEmptyDocument
{
  id v3 = objc_msgSend(objc_alloc((Class)TIDocumentState), "initWithContextBefore:markedText:selectedText:contextAfter:selectedRangeInMarkedText:", &stru_8DEF0, 0, 0, 0, 0x7FFFFFFFFFFFFFFFLL, 0);
  [(ACTKeyboardController *)self syncToDocumentState:v3];
}

- (void)syncToKeyboardState
{
}

- (BOOL)syncToKeyboardStateByWaitingForResults:(BOOL)a3
{
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  BOOL v15 = !a3;
  id v4 = [(ACTKeyboardController *)self inputManagerWrapper];
  unsigned __int8 v5 = [(ACTKeyboardController *)self clonedKeyboardState];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1E1FC;
  v11[3] = &unk_8D038;
  v11[4] = self;
  v11[5] = &v12;
  [v4 syncToKeyboardState:v5 completionHandler:v11];

  id v6 = +[NSDate dateWithTimeIntervalSinceNow:0.5];
  if (*((unsigned char *)v13 + 24))
  {
LABEL_4:
    char v9 = 1;
  }
  else
  {
    while (1)
    {
      [v6 timeIntervalSinceNow];
      if (v7 <= 0.0) {
        break;
      }
      id v8 = +[NSRunLoop currentRunLoop];
      [v8 acceptInputForMode:NSDefaultRunLoopMode beforeDate:v6];

      if (*((unsigned char *)v13 + 24)) {
        goto LABEL_4;
      }
    }
    char v9 = *((unsigned char *)v13 + 24) != 0;
  }

  _Block_object_dispose(&v12, 8);
  return v9;
}

- (void)updateDocumentState
{
  id v3 = [(ACTKeyboardController *)self text];
  NSUInteger location = self->_selectedRange.location;
  NSUInteger length = self->_selectedRange.length;
  id v23 = v3;
  if ((unint64_t)[v3 length] <= 0x1000)
  {
    id v8 = v23;
  }
  else
  {
    id v6 = objc_msgSend(v23, "rangeOfComposedCharacterSequenceAtIndex:", (char *)objc_msgSend(v23, "length") - 2048);
    uint64_t v7 = [v23 substringFromIndex:v6];

    location -= (unint64_t)v6;
    id v8 = (void *)v7;
  }
  id v24 = v8;
  if (location)
  {
    char v9 = [v8 substringToIndex:location];
    if (length)
    {
LABEL_6:
      uint64_t v10 = objc_msgSend(v24, "substringWithRange:", location, length);
      goto LABEL_9;
    }
  }
  else
  {
    char v9 = &stru_8DEF0;
    if (length) {
      goto LABEL_6;
    }
  }
  uint64_t v10 = 0;
LABEL_9:
  unint64_t v11 = location + length;
  if (v11 >= (unint64_t)[v24 length])
  {
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = [v24 substringFromIndex:v11];
  }
  id v13 = +[TIDocumentState documentStateWithContextBefore:v9 selectedText:v10 contextAfter:v12];
  uint64_t v14 = [(ACTKeyboardController *)self markedText];
  id v15 = [v14 length];

  if (v15)
  {
    CGFloat v16 = [(ACTKeyboardController *)self intermediateText];
    uint64_t v17 = [v16 displayString];
    id v18 = [(ACTKeyboardController *)self intermediateText];
    id v19 = [v18 selectedRange];
    uint64_t v21 = objc_msgSend(v13, "documentStateAfterSettingMarkedText:selectedRange:", v17, v19, v20);

    id v13 = (void *)v21;
  }
  CGFloat v22 = [(ACTKeyboardController *)self keyboardState];
  [v22 setDocumentState:v13];
}

- (void)insertText:(id)a3
{
  if (a3)
  {
    text = self->_text;
    NSUInteger location = self->_selectedRange.location;
    NSUInteger length = self->_selectedRange.length;
    id v7 = a3;
    -[NSMutableString replaceCharactersInRange:withString:](text, "replaceCharactersInRange:withString:", location, length, v7);
    id v8 = [v7 length];

    self->_selectedRange.location += (NSUInteger)v8;
    self->_selectedRange.NSUInteger length = 0;
    [(ACTKeyboardController *)self updateDocumentState];
  }
}

- (void)insertTextAfterSelection:(id)a3
{
  if (a3)
  {
    -[NSMutableString replaceCharactersInRange:withString:](self->_text, "replaceCharactersInRange:withString:", self->_selectedRange.location, self->_selectedRange.length, a3);
    [(ACTKeyboardController *)self updateDocumentState];
  }
}

- (void)deleteBackwards
{
  if (self->_selectedRange.length)
  {
    [(NSMutableString *)self->_text deleteCharactersInRange:self->_selectedRange.location];
  }
  else
  {
    NSUInteger location = self->_selectedRange.location;
    if (!location) {
      goto LABEL_6;
    }
    id v4 = [(NSMutableString *)self->_text _rangeOfBackwardDeletionClusterAtIndex:location - 1];
    -[NSMutableString deleteCharactersInRange:](self->_text, "deleteCharactersInRange:", v4, v5);
    self->_selectedRange.NSUInteger location = (NSUInteger)v4;
  }
  self->_selectedRange.NSUInteger length = 0;
LABEL_6:

  [(ACTKeyboardController *)self updateDocumentState];
}

- (_NSRange)selectedRangeForText:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = self->_selectedRange.length + self->_selectedRange.location;
  if (v5 <= (unint64_t)[v4 length]) {
    NSUInteger v6 = 0;
  }
  else {
    NSUInteger v6 = v5 - (void)[v4 length];
  }

  NSUInteger v7 = v6;
  NSUInteger v8 = v5 - v6;
  result.NSUInteger length = v8;
  result.NSUInteger location = v7;
  return result;
}

- (void)deleteText:(id)a3 rawText:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  id location = [(ACTKeyboardController *)self selectedRangeForText:v15];
  NSUInteger length = v8;
  id v10 = [(ACTKeyboardController *)self selectedRangeForText:v6];
  NSUInteger v12 = v11;
  id v13 = -[NSMutableString substringWithRange:](self->_text, "substringWithRange:", location, length);
  if (v6)
  {
    uint64_t v14 = -[NSMutableString substringWithRange:](self->_text, "substringWithRange:", v10, v12);
  }
  else
  {
    uint64_t v14 = 0;
  }
  if ([v13 isEqualToString:v15]) {
    goto LABEL_5;
  }
  if ([v14 isEqualToString:v6])
  {
    self->_selectedRange.id location = (NSUInteger)v10;
    self->_selectedRange.NSUInteger length = v12;
    NSUInteger length = v12;
    id location = v10;
  }
  else
  {
    if (v15 && !v14)
    {
LABEL_5:
      self->_selectedRange.id location = (NSUInteger)location;
      self->_selectedRange.NSUInteger length = length;
      goto LABEL_11;
    }
    id location = self->_selectedRange.location;
    NSUInteger length = self->_selectedRange.length;
  }
LABEL_11:
  -[NSMutableString deleteCharactersInRange:](self->_text, "deleteCharactersInRange:", location, length);
  self->_selectedRange.NSUInteger length = 0;
  [(ACTKeyboardController *)self updateDocumentState];
}

- (void)setSelectedRange:(_NSRange)a3
{
  if (a3.location != self->_selectedRange.location || a3.length != self->_selectedRange.length)
  {
    self->_selectedRange = a3;
    [(ACTKeyboardController *)self setAutocorrectionList:0];
    [(ACTKeyboardController *)self updateDocumentState];
    NSUInteger v5 = [(ACTKeyboardController *)self inputManagerWrapper];
    id v6 = [(ACTKeyboardController *)self clonedKeyboardState];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1E7E4;
    v7[3] = &unk_8D010;
    v7[4] = self;
    [v5 syncToKeyboardState:v6 completionHandler:v7];
  }
}

- (void)adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v5 = a3;
  NSUInteger v7 = [(ACTKeyboardController *)self inputManagerWrapper];
  NSUInteger v8 = [(ACTKeyboardController *)self clonedKeyboardState];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1E8E8;
  v9[3] = &unk_8D010;
  v9[4] = self;
  [v7 adjustPhraseBoundaryInForwardDirection:v5 granularity:v4 keyboardState:v8 completionHandler:v9];
}

- (void)adjustCursorByOffset:(int64_t)a3
{
  BOOL v5 = [(ACTKeyboardController *)self keyboardState];
  id v6 = [v5 documentState];
  NSUInteger v7 = [v6 documentStateAfterCursorAdjustment:a3];
  NSUInteger v8 = [(ACTKeyboardController *)self keyboardState];
  [v8 setDocumentState:v7];

  id v10 = [(ACTKeyboardController *)self inputManagerWrapper];
  char v9 = [(ACTKeyboardController *)self clonedKeyboardState];
  [v10 syncToKeyboardState:v9 completionHandler:&stru_8D078];
}

- (int64_t)performTouchDownAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  double y = a3.y;
  double x = a3.x;
  uint64_t v14 = [(ACTKeyboardController *)self activeTouchState];
  id v15 = +[NSNumber numberWithUnsignedInteger:a6];
  CGFloat v16 = [v14 objectForKey:v15];

  uint64_t v17 = [(ACTKeyboardController *)self keyplane];
  id v18 = -[ACTKeyboardController keyContainingPoint:inKeyplane:](self, "keyContainingPoint:inKeyplane:", v17, x, y);

  if ([v18 interactionType] == 14)
  {
    id v19 = [(ACTKeyboardController *)self keyplane];
    CFStringRef v20 = @"Shift";
LABEL_5:
    int64_t v21 = [(ACTKeyboardController *)self keyCodeWithString:v20 inKeyplane:v19];

    goto LABEL_7;
  }
  if ([v18 interactionType] == 11)
  {
    id v19 = [(ACTKeyboardController *)self keyplane];
    CFStringRef v20 = @"More";
    goto LABEL_5;
  }
  int64_t v21 = -1;
LABEL_7:
  uint64_t v33 = 0;
  CGFloat v34 = &v33;
  uint64_t v35 = 0x2020000000;
  int64_t v36 = v21;
  double v22 = a4;
  if ([v18 interactionType] != 11)
  {
    id v23 = +[TIKeyboardTouchEvent touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:](TIKeyboardTouchEvent, "touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:", 0, a6, v7, v21, 1, x, y, v22, a5);
    id v24 = [(ACTKeyboardController *)self inputManagerWrapper];
    id v25 = [(ACTKeyboardController *)self clonedKeyboardState];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1ED0C;
    v32[3] = &unk_8D0A0;
    void v32[4] = &v33;
    [v24 performHitTestForTouchEvent:v23 keyboardState:v25 continuation:v32];
  }
  uint64_t v26 = +[TIKeyboardTouchEvent touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:](TIKeyboardTouchEvent, "touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:", 0, a6, v7, v34[3], 1, x, y, v22, a5);
  uint64_t v27 = objc_alloc_init(_ACTKeyboardTouchState);
  [(_ACTKeyboardTouchState *)v27 setLastTouchEvent:v26];
  [(_ACTKeyboardTouchState *)v27 setDragged:0];
  -[_ACTKeyboardTouchState setInitialDragPoint:](v27, "setInitialDragPoint:", x, y);
  int v28 = [(ACTKeyboardController *)self activeTouchState];
  id v29 = +[NSNumber numberWithUnsignedInteger:a6];
  [v28 setObject:v27 forKey:v29];

  int64_t v30 = v34[3];
  _Block_object_dispose(&v33, 8);

  return v30;
}

- (BOOL)touchPassesDragThresholdAtPoint:(CGPoint)a3 pathIndex:(unint64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  NSUInteger v8 = [(ACTKeyboardController *)self activeTouchState];
  char v9 = +[NSNumber numberWithUnsignedInteger:a4];
  id v10 = [v8 objectForKey:v9];

  [v10 initialDragPoint];
  double v12 = v11;
  double v14 = v13;
  id v15 = [(ACTKeyboardController *)self keyboardState];
  CGFloat v16 = [v15 layoutState];
  uint64_t v17 = (char *)[v16 userInterfaceIdiom];

  unsigned int v18 = [v10 dragged];
  float v19 = 42.0;
  if (v18) {
    float v19 = 34.0;
  }
  float v20 = 18.0;
  if (v18) {
    float v20 = 12.0;
  }
  if (v17 != (unsigned char *)&def_3B118 + 1) {
    float v19 = v20;
  }
  float v21 = y - v14;
  float v22 = x - v12;
  BOOL v23 = fabsf(v22) >= v19;
  BOOL v24 = fabsf(v21) >= v19 || v23;

  return v24;
}

- (int64_t)retestTouchAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  double y = a3.y;
  double x = a3.x;
  double v14 = [(ACTKeyboardController *)self activeTouchState];
  id v15 = +[NSNumber numberWithUnsignedInteger:a6];
  CGFloat v16 = [v14 objectForKey:v15];

  uint64_t v17 = [v16 lastTouchEvent];
  if ([v17 continuousPathState] == 1) {
    id v18 = &def_3B118 + 3;
  }
  else {
    id v18 = [v17 continuousPathState];
  }
  if ([v17 forcedKeyCode] == (id)-2) {
    uint64_t v19 = -2;
  }
  else {
    uint64_t v19 = -1;
  }
  double v20 = a4;
  float v21 = +[TIKeyboardTouchEvent touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:](TIKeyboardTouchEvent, "touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:", 1, a6, v7, v19, v18, x, y, v20, a5);
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v34 = v19;
  float v22 = [(ACTKeyboardController *)self inputManagerWrapper];
  BOOL v23 = [(ACTKeyboardController *)self clonedKeyboardState];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1F118;
  v30[3] = &unk_8D0A0;
  v30[4] = &v31;
  [v22 performHitTestForTouchEvent:v21 keyboardState:v23 continuation:v30];

  BOOL v24 = +[TIKeyboardTouchEvent touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:](TIKeyboardTouchEvent, "touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:", 1, a6, v7, x, y, v20, a5);
  id v25 = objc_alloc_init(_ACTKeyboardTouchState);
  [(_ACTKeyboardTouchState *)v25 setLastTouchEvent:v24];
  [(_ACTKeyboardTouchState *)v25 setDragged:1];
  -[_ACTKeyboardTouchState setInitialDragPoint:](v25, "setInitialDragPoint:", x, y);
  uint64_t v26 = [(ACTKeyboardController *)self activeTouchState];
  uint64_t v27 = +[NSNumber numberWithUnsignedInteger:a6];
  [v26 setObject:v25 forKey:v27];

  int64_t v28 = v32[3];
  _Block_object_dispose(&v31, 8);

  return v28;
}

- (int64_t)performTouchDragAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  double y = a3.y;
  double x = a3.x;
  double v14 = [(ACTKeyboardController *)self activeTouchState];
  id v15 = +[NSNumber numberWithUnsignedInteger:a6];
  CGFloat v16 = [v14 objectForKey:v15];

  if (-[ACTKeyboardController touchPassesDragThresholdAtPoint:pathIndex:](self, "touchPassesDragThresholdAtPoint:pathIndex:", a6, x, y))
  {
    *(float *)&double v17 = a4;
    id v18 = -[ACTKeyboardController retestTouchAtLocation:radius:timestamp:pathIndex:fingerID:](self, "retestTouchAtLocation:radius:timestamp:pathIndex:fingerID:", a6, v7, x, y, v17, a5);
  }
  else
  {
    uint64_t v19 = [v16 lastTouchEvent];
    id v18 = [v19 forcedKeyCode];
  }
  return (int64_t)v18;
}

- (void)performTouchCancelAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  double y = a3.y;
  double x = a3.x;
  double v14 = [(ACTKeyboardController *)self activeTouchState];
  id v15 = +[NSNumber numberWithUnsignedInteger:a6];
  id v26 = [v14 objectForKey:v15];

  CGFloat v16 = [v26 lastTouchEvent];
  unsigned int v17 = [v16 continuousPathState];
  if (v17 == 2) {
    unsigned int v18 = 2;
  }
  else {
    unsigned int v18 = 6;
  }
  if (v17) {
    uint64_t v19 = v18;
  }
  else {
    uint64_t v19 = 0;
  }
  if ([v16 forcedKeyCode] == (id)-2) {
    uint64_t v20 = -2;
  }
  else {
    uint64_t v20 = -1;
  }
  float v21 = +[TIKeyboardTouchEvent touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:](TIKeyboardTouchEvent, "touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:", 3, a6, v7, v20, v19, x, y, a4, a5);
  float v22 = [(ACTKeyboardController *)self inputManagerWrapper];
  BOOL v23 = [(ACTKeyboardController *)self clonedKeyboardState];
  [v22 skipHitTestForTouchEvent:v21 keyboardState:v23];

  BOOL v24 = [(ACTKeyboardController *)self activeTouchState];
  id v25 = +[NSNumber numberWithUnsignedInteger:a6];
  [v24 removeObjectForKey:v25];
}

- (void)performTouchRestAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  double y = a3.y;
  double x = a3.x;
  double v14 = [(ACTKeyboardController *)self activeTouchState];
  id v15 = +[NSNumber numberWithUnsignedInteger:a6];
  id v28 = [v14 objectForKey:v15];

  CGFloat v16 = [v28 lastTouchEvent];
  unsigned int v17 = v16;
  if (v16)
  {
    unsigned int v18 = [v16 continuousPathState];
    if (v18 == 2) {
      unsigned int v19 = 2;
    }
    else {
      unsigned int v19 = 6;
    }
    if (v18) {
      uint64_t v20 = v19;
    }
    else {
      uint64_t v20 = 0;
    }
    uint64_t v21 = (uint64_t)[v17 forcedKeyCode];
  }
  else
  {
    uint64_t v20 = 0;
    uint64_t v21 = -1;
  }
  float v22 = +[TIKeyboardTouchEvent touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:](TIKeyboardTouchEvent, "touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:", 4, a6, v7, v21, v20, x, y, a4, a5);
  BOOL v23 = [(ACTKeyboardController *)self inputManagerWrapper];
  BOOL v24 = [(ACTKeyboardController *)self clonedKeyboardState];
  [v23 skipHitTestForTouchEvent:v22 keyboardState:v24];

  id v25 = objc_alloc_init(_ACTKeyboardTouchState);
  [(_ACTKeyboardTouchState *)v25 setLastTouchEvent:v22];
  -[_ACTKeyboardTouchState setDragged:](v25, "setDragged:", [v28 dragged]);
  [v28 initialDragPoint];
  -[_ACTKeyboardTouchState setInitialDragPoint:](v25, "setInitialDragPoint:");
  id v26 = [(ACTKeyboardController *)self activeTouchState];
  uint64_t v27 = +[NSNumber numberWithUnsignedInteger:a6];
  [v26 setObject:v25 forKey:v27];
}

- (void)performTouchEndRestAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  double y = a3.y;
  double x = a3.x;
  double v14 = [(ACTKeyboardController *)self activeTouchState];
  id v15 = +[NSNumber numberWithUnsignedInteger:a6];
  id v25 = [v14 objectForKey:v15];

  CGFloat v16 = [v25 lastTouchEvent];
  unsigned int v17 = [v16 continuousPathState];
  if (v17 == 2) {
    unsigned int v18 = 2;
  }
  else {
    unsigned int v18 = 6;
  }
  if (v17) {
    uint64_t v19 = v18;
  }
  else {
    uint64_t v19 = 0;
  }
  uint64_t v20 = +[TIKeyboardTouchEvent touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:](TIKeyboardTouchEvent, "touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:", 5, a6, v7, [v16 forcedKeyCode], v19, x, y, a4, a5);
  uint64_t v21 = [(ACTKeyboardController *)self inputManagerWrapper];
  float v22 = [(ACTKeyboardController *)self clonedKeyboardState];
  [v21 performHitTestForTouchEvent:v20 keyboardState:v22 continuation:&stru_8D0E0];

  BOOL v23 = [(ACTKeyboardController *)self activeTouchState];
  BOOL v24 = +[NSNumber numberWithUnsignedInteger:a6];
  [v23 removeObjectForKey:v24];
}

- (id)adjustContinuousPathCandidate:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ACTKeyboardController *)self text];
  int v6 = [v5 length];
  if (v6 >= 3
    && [v4 length]
    && [v5 characterAtIndex:(v6 - 1)] == 46
    && [v5 characterAtIndex:(v6 - 2)] == 46
    && [v5 characterAtIndex:(v6 - 3)] == 46
    && [v4 characterAtIndex:0])
  {
    uint64_t v7 = [v4 substringFromIndex:1];

    id v4 = (id)v7;
  }

  return v4;
}

- (id)performTouchUpAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7 secondaryString:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v9 = *(void *)&a7;
  double y = a3.y;
  double x = a3.x;
  CGFloat v16 = [(ACTKeyboardController *)self activeTouchState];
  unsigned int v17 = &CFAbsoluteTimeGetCurrent_ptr;
  unsigned int v18 = +[NSNumber numberWithUnsignedInteger:a6];
  uint64_t v19 = [v16 objectForKey:v18];

  uint64_t v20 = [v19 lastTouchEvent];
  if (-[ACTKeyboardController touchPassesDragThresholdAtPoint:pathIndex:](self, "touchPassesDragThresholdAtPoint:pathIndex:", a6, x, y)|| [v20 continuousPathState] == 3|| objc_msgSend(v20, "continuousPathState") == 4)
  {
    *(float *)&double v21 = a4;
    -[ACTKeyboardController retestTouchAtLocation:radius:timestamp:pathIndex:fingerID:](self, "retestTouchAtLocation:radius:timestamp:pathIndex:fingerID:", a6, v9, x, y, v21, a5);
    float v22 = [(ACTKeyboardController *)self activeTouchState];
    BOOL v23 = +[NSNumber numberWithUnsignedInteger:a6];
    BOOL v24 = [v22 objectForKey:v23];

    uint64_t v25 = [v24 lastTouchEvent];

    uint64_t v20 = (void *)v25;
    uint64_t v19 = v24;
  }
  id v26 = [v20 forcedKeyCode];
  if ([v20 continuousPathState] == 4) {
    id v27 = &dword_4 + 1;
  }
  else {
    id v27 = [v20 continuousPathState];
  }
  id v28 = +[TIKeyboardTouchEvent touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:](TIKeyboardTouchEvent, "touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:", 2, a6, v9, v26, v27, x, y, a4, a5);
  if (v26 == (id)-2)
  {
    if (![(ACTKeyboardController *)self insertsSpaceAfterPredictiveInput]
      && ![(ACTKeyboardController *)self usesTransliteration])
    {
      id v29 = [(ACTKeyboardController *)self autocorrection];
      if (![v29 isAutocorrection])
      {
LABEL_32:

        goto LABEL_33;
      }
      int64_t v30 = [(ACTKeyboardController *)self autocorrection];
      uint64_t v31 = [v30 candidate];
      if (![v31 length])
      {

        goto LABEL_31;
      }
      [(ACTKeyboardController *)self autocorrection];
      uint64_t v33 = v32 = v28;
      unsigned __int8 v34 = [v33 isContinuousPathConversion];

      id v28 = v32;
      if ((v34 & 1) == 0)
      {
        [(ACTKeyboardController *)self setLastInputWasSelection:1];
        id v29 = [(ACTKeyboardController *)self inputManagerState];
        int64_t v30 = [v29 wordSeparator];
        [(ACTKeyboardController *)self addInput:v30 fromVariantKey:0 touchEvent:0];
LABEL_31:

        goto LABEL_32;
      }
    }
LABEL_33:
    long long v55 = [(ACTKeyboardController *)self inputManagerWrapper];
    long long v56 = [(ACTKeyboardController *)self clonedKeyboardState];
    [v55 skipHitTestForTouchEvent:v28 keyboardState:v56];

    [(ACTKeyboardController *)self generateAutocorrectionsOrCandidates];
    long long v57 = [(ACTKeyboardController *)self autocorrection];
    uint64_t v44 = [v57 candidate];

    if ([(ACTKeyboardController *)self usesTransliteration]
      || [(ACTKeyboardController *)self generatesCandidates])
    {
      BOOL v43 = 0;
      CGRect v58 = &CFAbsoluteTimeGetCurrent_ptr;
LABEL_48:
      [(ACTKeyboardController *)self updateAutoshift];
      v77 = [(ACTKeyboardController *)self activeTouchState];
      v78 = [v58[300] numberWithUnsignedInteger:a6];
      [v77 removeObjectForKey:v78];

      goto LABEL_49;
    }
    v85 = v28;
    CGRect v59 = [(ACTKeyboardController *)self autocorrectionList];
    unint64_t v60 = [v59 predictions];
    v61 = [(ACTKeyboardController *)self autocorrectionList];
    BOOL v62 = [v61 emojiList];
    uint64_t v63 = +[TIAutocorrectionList listWithCorrections:0 predictions:v60 emojiList:v62];

    if (![v44 length])
    {
      BOOL v43 = 0;
      goto LABEL_40;
    }
    if ([(ACTKeyboardController *)self insertsSpaceAfterPredictiveInput])
    {
      v64 = [(ACTKeyboardController *)self inputManagerState];
      BOOL v43 = [v64 wordSeparator];

      BOOL v65 = [(ACTKeyboardController *)self inputManagerState];
      v66 = [v65 wordSeparator];
      uint64_t v67 = [v44 stringByAppendingString:v66];

      id v68 = [(ACTKeyboardController *)self adjustContinuousPathCandidate:v67];
      [(ACTKeyboardController *)self addInput:v43 fromVariantKey:0 touchEvent:0];
      uint64_t v44 = (void *)v67;
LABEL_40:
      CGRect v58 = &CFAbsoluteTimeGetCurrent_ptr;
LABEL_47:
      id v28 = v85;
      [(ACTKeyboardController *)self setAutocorrectionList:v63];

      goto LABEL_48;
    }
    v69 = [(ACTKeyboardController *)self autocorrection];
    v70 = [v69 candidate];
    if ([v70 hasPrefix:@" "])
    {
      v71 = [(ACTKeyboardController *)self text];
      unsigned int v72 = [v71 hasSuffix:@"..."];

      if (!v72)
      {
        CGRect v58 = &CFAbsoluteTimeGetCurrent_ptr;
        goto LABEL_46;
      }
      id v80 = objc_alloc((Class)TIZephyrCandidate);
      v83 = [v69 candidate];
      v73 = [v83 substringFromIndex:1];
      BOOL v74 = [v69 input];
      v75 = [v69 rawInput];
      id v81 = objc_msgSend(v80, "initWithCandidate:forInput:rawInput:wordOriginFeedbackID:usageTrackingMask:sourceMask:", v73, v74, v75, objc_msgSend(v69, "wordOriginFeedbackID"), objc_msgSend(v69, "usageTrackingMask"), objc_msgSend(v69, "sourceMask"));

      [v81 setContinuousPathConversion:1];
      v70 = v69;
      v69 = v81;
    }
    CGRect v58 = &CFAbsoluteTimeGetCurrent_ptr;

LABEL_46:
    uint64_t v76 = [v69 candidate];

    [(ACTKeyboardController *)self acceptCandidate:v69];
    BOOL v43 = 0;
    uint64_t v44 = (void *)v76;
    goto LABEL_47;
  }
  uint64_t v35 = [(ACTKeyboardController *)self keys];
  int64_t v36 = [v35 objectAtIndex:v26];

  uint64_t v37 = [(ACTKeyboardController *)self layoutUtils];
  unint64_t v38 = objc_msgSend(v37, "representedStringForKey:shifted:includeSecondaryStrings:", v36, -[ACTKeyboardController isShifted](self, "isShifted"), v8);

  uint64_t v39 = 0;
  CFStringRef v40 = &stru_8DEF0;
  switch([v36 interactionType])
  {
    case 1u:
    case 2u:
    case 0xDu:
    case 0x10u:
      [(ACTKeyboardController *)self addInput:v38 fromVariantKey:0 touchEvent:v28];
      uint64_t v39 = v38;
      goto LABEL_17;
    case 4u:
      unint64_t v45 = [(ACTKeyboardController *)self inputManagerWrapper];
      long long v46 = [(ACTKeyboardController *)self clonedKeyboardState];
      [v45 skipHitTestForTouchEvent:v28 keyboardState:v46];

      [(ACTKeyboardController *)self deleteInput:v28];
      uint64_t v39 = @"\\b";
      goto LABEL_17;
    case 0xBu:
      goto LABEL_18;
    case 0xEu:
      long long v47 = [(ACTKeyboardController *)self inputManagerWrapper];
      long long v48 = [(ACTKeyboardController *)self clonedKeyboardState];
      [v47 skipHitTestForTouchEvent:v28 keyboardState:v48];

      [(ACTKeyboardController *)self shiftKeyplane];
      uint64_t v39 = &stru_8DEF0;
      goto LABEL_17;
    case 0xFu:
      BOOL v84 = v28;
      [(ACTKeyboardController *)self addInput:v38 fromVariantKey:0 touchEvent:v28];
      uint64_t v39 = v38;
      long long v49 = [(ACTKeyboardController *)self keyplane];
      BOOL v50 = [v49 name];
      unsigned __int8 v51 = [v50 containsString:@"Wildcat"];

      if (v51)
      {
        BOOL v52 = [(ACTKeyboardController *)self keyplane];
        long long v53 = [v52 name];
        long long v54 = [v53 uppercaseString];
        unsigned int v82 = [v54 containsString:@"-ALTERNATE"];

        unsigned int v17 = &CFAbsoluteTimeGetCurrent_ptr;
        id v28 = v84;
        if (!v82) {
          goto LABEL_19;
        }
      }
      else
      {
        unsigned int v17 = &CFAbsoluteTimeGetCurrent_ptr;
        id v28 = v84;
      }
LABEL_17:
      CFStringRef v40 = v39;
      if ([v36 BOOLForProperty:@"more-after"])
      {
LABEL_18:
        [(ACTKeyboardController *)self alternateKeyplane];
        uint64_t v39 = (__CFString *)v40;
      }
LABEL_19:
      if ([v36 BOOLForProperty:@"shift-after"]) {
        [(ACTKeyboardController *)self shiftKeyplane];
      }
      if ([v36 interactionType] != 14) {
        [(ACTKeyboardController *)self updateAutoshift];
      }
      [(ACTKeyboardController *)self generateAutocorrectionsOrCandidates];

      BOOL v41 = [(ACTKeyboardController *)self activeTouchState];
      uint64_t v42 = [v17[300] numberWithUnsignedInteger:a6];
      [v41 removeObjectForKey:v42];

      BOOL v43 = v39;
      uint64_t v44 = v43;
      break;
    default:
      goto LABEL_17;
  }
LABEL_49:

  return v44;
}

- (id)performSkipTapAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7 forcedKeyCode:(int64_t)a8
{
  id v10 = [(ACTKeyboardController *)self keys];
  double v11 = [v10 objectAtIndex:a8];

  if ([v11 interactionType] == 11)
  {
    CFStringRef v12 = &stru_8DEF0;
  }
  else
  {
    CFStringRef v12 = 0;
    CFStringRef v13 = 0;
    if (![v11 BOOLForProperty:@"more-after"]) {
      goto LABEL_5;
    }
  }
  [(ACTKeyboardController *)self alternateKeyplane];
  CFStringRef v13 = v12;
LABEL_5:
  if ([v11 BOOLForProperty:@"shift-after"]) {
    [(ACTKeyboardController *)self shiftKeyplane];
  }
  if ([v11 interactionType] != 14) {
    [(ACTKeyboardController *)self updateAutoshift];
  }
  [(ACTKeyboardController *)self generateAutocorrectionsOrCandidates];

  return (id)v13;
}

- (void)addStringFromVariantKey:(id)a3
{
}

- (void)addStringFromGestureKeyInput:(id)a3
{
}

- (int64_t)keyCodeWithString:(id)a3 inKeyplane:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  unsigned int v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = -1;
  BOOL v8 = [v7 keys];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_2037C;
  v13[3] = &unk_8D108;
  v13[4] = self;
  id v9 = v7;
  id v14 = v9;
  id v10 = v6;
  id v15 = v10;
  CGFloat v16 = &v17;
  [v8 enumerateObjectsUsingBlock:v13];

  int64_t v11 = v18[3];
  _Block_object_dispose(&v17, 8);

  return v11;
}

- (float)distanceFromKey:(id)a3 toPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v6 = a3;
  [v6 frame];
  double MinX = CGRectGetMinX(v24);
  [v6 frame];
  if (x >= MinX)
  {
    float v13 = 0.0;
    if (x <= CGRectGetMaxX(*(CGRect *)&v8)) {
      goto LABEL_6;
    }
    [v6 frame];
    double MaxX = CGRectGetMaxX(v25);
  }
  else
  {
    double MaxX = CGRectGetMinX(*(CGRect *)&v8);
  }
  float v13 = x - MaxX;
LABEL_6:
  [v6 frame];
  double MinY = CGRectGetMinY(v26);
  [v6 frame];
  if (y < MinY)
  {
    double v19 = CGRectGetMinY(*(CGRect *)&v15);
LABEL_10:
    float v21 = y - v19;
    goto LABEL_11;
  }
  CGFloat MaxY = CGRectGetMaxY(*(CGRect *)&v15);
  float v21 = 0.0;
  if (y > MaxY)
  {
    [v6 frame];
    double v19 = CGRectGetMaxY(v27);
    goto LABEL_10;
  }
LABEL_11:
  float v22 = sqrtf((float)(v21 * v21) + (float)(v13 * v13));

  return v22;
}

- (id)keyContainingPoint:(CGPoint)a3 inKeyplane:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  [v7 frame];
  v28.double x = x;
  v28.double y = y;
  if (CGRectContainsPoint(v29, v28)
    || ([v7 name],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        unsigned int v9 = [v8 hasPrefix:@"Dynamic"],
        v8,
        v9))
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v10 = objc_msgSend(v7, "keys", 0);
    id v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v11)
    {
      id v12 = v11;
      float v13 = 0;
      uint64_t v14 = *(void *)v23;
      double v15 = 1.79769313e308;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v10);
          }
          uint64_t v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if ([v17 visible])
          {
            -[ACTKeyboardController distanceFromKey:toPoint:](self, "distanceFromKey:toPoint:", v17, x, y);
            double v19 = v18;
            if (v15 > v18)
            {
              id v20 = v17;

              float v13 = v20;
              double v15 = v19;
            }
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v12);
    }
    else
    {
      float v13 = 0;
    }
  }
  else
  {
    float v13 = 0;
  }

  return v13;
}

- (BOOL)isKeyStringAboveSpaceBar:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ACTKeyboardController *)self keyplane];
  int64_t v6 = [(ACTKeyboardController *)self keyCodeWithString:@" " inKeyplane:v5];

  if (v6 == -1)
  {
    BOOL v19 = 0;
  }
  else
  {
    id v7 = [(ACTKeyboardController *)self keyplane];
    uint64_t v8 = [v7 keys];
    unsigned int v9 = [v8 objectAtIndexedSubscript:v6];

    id v10 = [(ACTKeyboardController *)self keyplane];
    int64_t v11 = [(ACTKeyboardController *)self keyCodeWithString:v4 inKeyplane:v10];

    if (v11 == -1)
    {
      BOOL v19 = 0;
    }
    else
    {
      id v12 = [(ACTKeyboardController *)self keyplane];
      float v13 = [v12 keys];
      uint64_t v14 = [v13 objectAtIndexedSubscript:v11];

      [v9 frame];
      double v16 = v15;
      [v14 frame];
      CGFloat MidX = CGRectGetMidX(v22);
      [v14 frame];
      CGFloat v18 = v16 + CGRectGetMidY(v23);
      [v9 frame];
      v21.double x = MidX;
      v21.double y = v18;
      BOOL v19 = CGRectContainsPoint(v24, v21);
    }
  }

  return v19;
}

- (void)enumerateKeyplaneNamesAdjacentToKeyplane:(id)a3 usingBlock:(id)a4
{
  id v7 = (void (**)(id, void *))a4;
  BOOL v5 = [a3 shiftAlternateKeyplaneName];
  v7[2](v7, v5);

  int64_t v6 = [a3 alternateKeyplaneName];
  v7[2](v7, v6);
}

- (BOOL)isKeyplane:(id)a3 shiftAlternateOfKeyplane:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(ACTKeyboardController *)self keyboard];
  unsigned int v9 = [v6 shiftAlternateKeyplaneName];

  id v10 = [v8 subtreeWithName:v9];

  return v10 == v7;
}

- (BOOL)isKeyplane:(id)a3 alternateOfKeyplane:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(ACTKeyboardController *)self keyboard];
  unsigned int v9 = [v6 alternateKeyplaneName];

  id v10 = [v8 subtreeWithName:v9];

  return v10 == v7;
}

- (id)keyToAccessKeyplane:(id)a3 fromKeyplane:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(ACTKeyboardController *)self isKeyplane:v6 shiftAlternateOfKeyplane:v7])
  {
    CFStringRef v8 = @"Shift";
LABEL_5:
    unsigned int v9 = [(ACTKeyboardLayoutUtils *)self->_layoutUtils exactKeyForString:v8 keyplane:v7 includeSecondaryStrings:0];
    goto LABEL_7;
  }
  if ([(ACTKeyboardController *)self isKeyplane:v6 alternateOfKeyplane:v7])
  {
    CFStringRef v8 = @"More";
    goto LABEL_5;
  }
  unsigned int v9 = 0;
LABEL_7:

  return v9;
}

- (id)displayStringOverrideForKey:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ACTKeyboardController *)self layoutUtils];
  id v6 = [v5 keyOverrides];
  id v7 = [v6 objectForKey:v4];

  return v7;
}

- (void)acceptAutocorrection
{
  id v3 = [(ACTKeyboardController *)self autocorrectionList];
  unsigned int v4 = [v3 shouldAcceptTopCandidate];

  if (v4)
  {
    BOOL v5 = [(ACTKeyboardController *)self autocorrectionList];
    id v6 = [v5 candidates];
    id v7 = [v6 firstObject];
  }
  else
  {
    id v7 = 0;
  }
  [(ACTKeyboardController *)self textAccepted:v7 predictiveCandidate:0];
  [(ACTKeyboardController *)self setAutocorrectionList:0];
}

- (void)rejectCandidate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(ACTKeyboardController *)self inputManagerWrapper];
    [v5 candidateRejected:v4];
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  CGRect v26 = self;
  id v6 = [(ACTKeyboardController *)self autocorrectionList];
  id v7 = [v6 predictions];

  id obj = v7;
  id v8 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
  CGRect v27 = v4;
  if (v8)
  {
    id v9 = v8;
    id v10 = 0;
    uint64_t v11 = *(void *)v30;
    id v12 = &stru_8DEF0;
    float v13 = &stru_8DEF0;
    while (1)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(obj);
        }
        double v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        double v16 = [v15 input];
        uint64_t v17 = v16;
        if (v13)
        {
          id v18 = [(__CFString *)v16 length];
          id v19 = [(__CFString *)v13 length];

          if (v18 <= v19) {
            continue;
          }
          uint64_t v17 = [v15 input];
        }
        uint64_t v20 = [v15 rawInput];

        id v10 = [v15 typingEngine];
        id v12 = (__CFString *)v20;
        float v13 = v17;
      }
      id v9 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (!v9) {
        goto LABEL_16;
      }
    }
  }
  id v10 = 0;
  id v12 = &stru_8DEF0;
  float v13 = &stru_8DEF0;
LABEL_16:

  id v21 = [objc_alloc((Class)TIKeyboardCandidateSingle) initWithCandidate:v13 forInput:v13 rawInput:v12];
  [v21 setTypingEngine:v10];
  id v22 = [objc_alloc((Class)TICorrectionCandidates) initWithAutocorrection:v21 alternateCorrections:0];
  CGRect v23 = [(ACTKeyboardController *)v26 autocorrectionList];
  CGRect v24 = [v23 predictions];
  long long v25 = +[TIAutocorrectionList listWithCorrections:v22 predictions:v24];
  [(ACTKeyboardController *)v26 setAutocorrectionList:v25];
}

- (BOOL)hasPrediction:(id)a3
{
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  BOOL v5 = [(ACTKeyboardController *)self autocorrectionList];
  id v6 = [v5 predictions];

  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    char v9 = 0;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) candidate];
        BOOL v13 = [v12 compare:v4] == 0;

        v9 |= v13;
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
  else
  {
    char v9 = 0;
  }

  return v9 & 1;
}

- (void)acceptCandidate:(id)a3
{
}

- (void)acceptCandidate:(id)a3 predictiveCandidate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(ACTKeyboardController *)self inputManagerState];
  unsigned int v8 = [v7 usesCandidateSelection];

  if (v8)
  {
    char v9 = [(ACTKeyboardController *)self inputManagerState];
    unsigned int v10 = [v9 commitsAcceptedCandidate];

    if (v10)
    {
      uint64_t v11 = [v6 candidate];
      id v12 = [v11 length];

      if (v12)
      {
        BOOL v13 = [(ACTKeyboardController *)self inputManagerWrapper];
        [v13 textAccepted:v6];
      }
      [(ACTKeyboardController *)self setMarkedText:0];
      uint64_t v14 = [v6 candidate];
      [(ACTKeyboardController *)self insertText:v14];
    }
    long long v15 = [(ACTKeyboardController *)self inputManagerWrapper];
    long long v16 = [(ACTKeyboardController *)self clonedKeyboardState];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_211B0;
    v17[3] = &unk_8D130;
    v17[4] = self;
    [v15 handleAcceptedCandidate:v6 keyboardState:v16 completionHandler:v17];
  }
  else
  {
    [(ACTKeyboardController *)self textAccepted:v6 predictiveCandidate:v4];
  }
  [(ACTKeyboardController *)self setLastInputWasSelection:v4];
  [(ACTKeyboardController *)self setCandidateResultSet:0];
  [(ACTKeyboardController *)self setAutocorrectionList:0];
}

- (id)candidateByApplyingSmartPunctuationToCandidate:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ACTKeyboardController *)self smartPunctuationController];

  id v6 = v4;
  id v7 = v6;
  if (v5)
  {
    unsigned int v8 = [(ACTKeyboardController *)self smartPunctuationController];
    char v9 = [v6 candidate];
    unsigned int v10 = [v8 smartPunctuationResultsForString:v9];

    id v7 = v6;
    if ([v10 count])
    {
      uint64_t v11 = [v6 candidate];
      id v12 = +[NSMutableString stringWithString:v11];

      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      BOOL v13 = objc_msgSend(v10, "reverseObjectEnumerator", 0);
      id v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v28;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v28 != v16) {
              objc_enumerationMutation(v13);
            }
            long long v18 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            id v19 = [v18 range];
            uint64_t v21 = v20;
            id v22 = [v18 replacementString];
            objc_msgSend(v12, "replaceCharactersInRange:withString:", v19, v21, v22);
          }
          id v15 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v15);
      }

      id v23 = objc_alloc((Class)TIKeyboardCandidateSingle);
      CGRect v24 = [v6 input];
      long long v25 = [v6 rawInput];
      id v7 = [v23 initWithCandidate:v12 forInput:v24 rawInput:v25];
    }
  }

  return v7;
}

- (void)textAccepted:(id)a3 predictiveCandidate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [v6 candidate];
  id v8 = [v7 length];

  if (!v8)
  {
    char v9 = v6;
    goto LABEL_15;
  }
  char v9 = [(ACTKeyboardController *)self candidateByApplyingSmartPunctuationToCandidate:v6];

  unsigned int v10 = [(ACTKeyboardController *)self inputManagerWrapper];
  char v11 = objc_opt_respondsToSelector();

  id v12 = [(ACTKeyboardController *)self inputManagerWrapper];
  BOOL v13 = v12;
  if (v11)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_216D0;
    v21[3] = &unk_8D010;
    v21[4] = self;
    [v12 textAccepted:v9 completionHandler:v21];
  }
  else
  {
    [v12 textAccepted:v9];
  }

  if (v4)
  {
    id v14 = [(ACTKeyboardController *)self inputManager];
    [v14 dropInput];
  }
  if (![v9 isContinuousPathConversion]) {
    goto LABEL_12;
  }
  id v15 = [v9 input];
  if ([v15 length])
  {

LABEL_12:
    long long v18 = [v9 input];
    id v19 = [v9 rawInput];
    [(ACTKeyboardController *)self deleteText:v18 rawText:v19];

    goto LABEL_13;
  }
  uint64_t v16 = [v9 rawInput];
  id v17 = [v16 length];

  if (v17) {
    goto LABEL_12;
  }
  -[NSMutableString deleteCharactersInRange:](self->_text, "deleteCharactersInRange:", self->_selectedRange.location, self->_selectedRange.length);
  self->_selectedRange.NSUInteger length = 0;
  [(ACTKeyboardController *)self updateDocumentState];
LABEL_13:
  uint64_t v20 = [v9 candidate];
  [(ACTKeyboardController *)self insertText:v20];

  if ([v9 shouldInsertSpaceAfterSelection]) {
    [(ACTKeyboardController *)self insertTextAfterSelection:@" "];
  }
LABEL_15:
}

- (TIKeyboardCandidate)inlineCompletion
{
  id v3 = [(ACTKeyboardController *)self autocorrectionList];
  unsigned int v4 = [v3 shouldAcceptInlineCompletion];

  if (!v4)
  {
    uint64_t v16 = 0;
    goto LABEL_10;
  }
  BOOL v5 = [(ACTKeyboardController *)self autocorrectionList];
  id v6 = [v5 inlineCompletions];
  id v7 = [v6 firstObject];

  id v8 = [v7 candidate];
  char v9 = [v8 componentsSeparatedByString:@" "];

  unsigned int v10 = [(ACTKeyboardController *)self text];
  char v11 = (char *)[(ACTKeyboardController *)self selectedRange];
  BOOL v13 = [v10 substringFromIndex:&v11[v12 - 1]];

  if ([v13 isEqualToString:@" "])
  {
    if ((unint64_t)[v9 count] < 2)
    {
      uint64_t v16 = 0;
      goto LABEL_9;
    }
    uint64_t v14 = [v9 objectAtIndexedSubscript:1];
    uint64_t v15 = [v7 candidateByReplacingWithCandidate:v14 input:&stru_8DEF0 rawInput:&stru_8DEF0];
  }
  else
  {
    uint64_t v14 = [v9 firstObject];
    uint64_t v15 = [v7 candidateByReplacingWithCandidate:v14];
  }
  uint64_t v16 = (void *)v15;

  id v7 = (void *)v14;
LABEL_9:

LABEL_10:

  return (TIKeyboardCandidate *)v16;
}

- (TIKeyboardCandidate)autocorrection
{
  id v3 = [(ACTKeyboardController *)self autocorrectionList];
  unsigned int v4 = [v3 shouldAcceptTopCandidate];

  if (!v4) {
    goto LABEL_4;
  }
  BOOL v5 = [(ACTKeyboardController *)self autocorrectionList];
  id v6 = [v5 candidates];
  id v7 = [v6 firstObject];

  if (v7)
  {
    id v8 = [(ACTKeyboardController *)self trimmedCandidate:v7];
  }
  else
  {
LABEL_4:
    id v8 = [(ACTKeyboardController *)self candidateToConfirmInputString];
  }
  char v9 = [(ACTKeyboardController *)self text];
  unsigned int v10 = (char *)[(ACTKeyboardController *)self selectedRange];
  uint64_t v12 = [v9 substringToIndex:&v10[v11]];

  BOOL v13 = [v8 input];
  if (![v13 length]) {
    goto LABEL_13;
  }
  uint64_t v14 = [v8 input];
  if ([v12 hasSuffix:v14])
  {

LABEL_13:
    goto LABEL_14;
  }
  uint64_t v15 = [v8 rawInput];
  if (![v15 length])
  {

    goto LABEL_12;
  }
  uint64_t v16 = [v8 rawInput];
  unsigned __int8 v17 = [v12 hasSuffix:v16];

  if ((v17 & 1) == 0)
  {
LABEL_12:
    +[TIKeyboardCandidateSingle candidateWithUnchangedInput:&stru_8DEF0];
    id v8 = v13 = v8;
    goto LABEL_13;
  }
LABEL_14:

  return (TIKeyboardCandidate *)v8;
}

- (NSArray)predictions
{
  id v3 = [(ACTKeyboardController *)self candidateResultSet];
  unsigned int v4 = [v3 candidates];

  if (!v4 || ![v4 count])
  {
    BOOL v5 = [(ACTKeyboardController *)self autocorrectionList];
    uint64_t v6 = [v5 predictions];
    id v7 = (void *)v6;
    id v8 = &__NSArray0__struct;
    if (v6) {
      id v8 = (void *)v6;
    }
    id v9 = v8;

    unsigned int v4 = v9;
  }

  return (NSArray *)v4;
}

- (id)candidateToConfirmInputString
{
  id v3 = [(ACTKeyboardController *)self inputManager];
  unsigned int v4 = [v3 defaultCandidate];

  BOOL v5 = [(ACTKeyboardController *)self trimmedCandidate:v4];

  return v5;
}

- (id)trimmedCandidate:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [v3 input];
  BOOL v5 = [v3 rawInput];
  uint64_t v6 = [v3 candidate];
  id v7 = [v4 length];
  id v8 = [v6 length];
  if (v7 >= v8) {
    id v9 = v8;
  }
  else {
    id v9 = v7;
  }
  unsigned int v10 = +[NSCharacterSet whitespaceCharacterSet];
  uint64_t v25 = 0;
  CGRect v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_21E0C;
  v21[3] = &unk_8D158;
  id v11 = v4;
  id v22 = v11;
  id v12 = v10;
  id v23 = v12;
  CGRect v24 = &v25;
  objc_msgSend(v6, "enumerateSubstringsInRange:options:usingBlock:", 0, v9, 2, v21);
  id v13 = v3;
  id v14 = v13;
  if (v26[3])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v15 = objc_alloc((Class)TIZephyrCandidate);
      uint64_t v16 = [v6 substringFromIndex:v26[3]];
      unsigned __int8 v17 = [v11 substringFromIndex:v26[3]];
      id v14 = objc_msgSend(v15, "initWithCandidate:forInput:rawInput:wordOriginFeedbackID:usageTrackingMask:sourceMask:", v16, v17, v5, objc_msgSend(v13, "wordOriginFeedbackID"), objc_msgSend(v13, "usageTrackingMask"), objc_msgSend(v13, "sourceMask"));

      objc_msgSend(v14, "setContinuousPathConversion:", objc_msgSend(v13, "isContinuousPathConversion"));
      long long v18 = v13;
    }
    else
    {
      long long v18 = [v6 substringFromIndex:v26[3]];
      id v19 = [v11 substringFromIndex:v26[3]];
      id v14 = +[TIKeyboardCandidateSingle candidateWithCandidate:v18 forInput:v19];
    }
  }

  _Block_object_dispose(&v25, 8);

  return v14;
}

- (BOOL)generatesCandidates
{
  id v3 = [(ACTKeyboardController *)self keyboardState];
  if (objc_opt_respondsToSelector())
  {
    unsigned int v4 = [(ACTKeyboardController *)self keyboardState];
    unsigned __int8 v5 = [v4 longPredictionListEnabled];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  uint64_t v6 = [(ACTKeyboardController *)self inputManagerState];
  char v7 = [v6 usesCandidateSelection] | v5;

  return v7;
}

- (void)generateAutocorrectionsOrCandidates
{
  unsigned int v3 = [(ACTKeyboardController *)self generatesCandidates];
  id v4 = [(ACTKeyboardController *)self clonedKeyboardState];
  if (v3) {
    [(ACTKeyboardController *)self generateCandidatesWithKeyboardState:v4];
  }
  else {
    [(ACTKeyboardController *)self generateAutocorrectionsWithKeyboardState:v4];
  }
}

- (void)generateAutocorrectionsWithShiftState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  unsigned __int8 v5 = [(ACTKeyboardController *)self clonedKeyboardState];
  [v5 setShiftState:v3];
  uint64_t v6 = [(ACTKeyboardController *)self inputManagerWrapper];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_22090;
  v7[3] = &unk_8D180;
  v7[4] = self;
  [v6 generateAutocorrectionsWithKeyboardState:v5 completionHandler:v7];
}

- (void)generateAutocorrectionsWithCount:(unint64_t)a3
{
  unsigned __int8 v5 = [(ACTKeyboardController *)self inputManagerWrapper];
  uint64_t v6 = [(ACTKeyboardController *)self clonedKeyboardState];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_22154;
  v7[3] = &unk_8D180;
  v7[4] = self;
  objc_msgSend(v5, "generateAutocorrectionsWithKeyboardState:candidateRange:completionHandler:", v6, 0, a3, v7);
}

- (void)pushAutocorrections:(id)a3 requestToken:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  char v7 = [v14 corrections];
  id v8 = [v7 autocorrection];
  unsigned int v9 = [v8 isContinuousPathConversion];

  if (v9)
  {
    unsigned int v10 = [(ACTKeyboardController *)self cpRequestTokenLock];
    [v10 lock];

    id v11 = [(ACTKeyboardController *)self lastCPRequestToken];
    unsigned int v12 = [v11 isSameRequestAs:v6];

    if (v12)
    {
      [(ACTKeyboardController *)self setAutocorrectionList:v14];
      [(ACTKeyboardController *)self setLastCPRequestToken:0];
    }
    id v13 = [(ACTKeyboardController *)self cpRequestTokenLock];
    [v13 unlock];
  }
  else
  {
    [(ACTKeyboardController *)self setAutocorrectionList:v14];
  }
}

- (void)pushCandidateResultSet:(id)a3 requestToken:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  char v7 = [v13 firstCandidate];
  unsigned int v8 = [v7 isContinuousPathConversion];

  if (v8)
  {
    unsigned int v9 = [(ACTKeyboardController *)self cpRequestTokenLock];
    [v9 lock];

    unsigned int v10 = [(ACTKeyboardController *)self lastCPRequestToken];
    unsigned int v11 = [v10 isSameRequestAs:v6];

    if (v11)
    {
      [(ACTKeyboardController *)self setCandidateResultSet:v13];
      [(ACTKeyboardController *)self setLastCPRequestToken:0];
    }
    unsigned int v12 = [(ACTKeyboardController *)self cpRequestTokenLock];
    [v12 unlock];
  }
  else
  {
    [(ACTKeyboardController *)self setCandidateResultSet:v13];
  }
}

- (void)closeRequestToken:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v10 = v4;
    unsigned __int8 v5 = [(ACTKeyboardController *)self currentRequestToken];
    unsigned int v6 = [v5 isSameRequestAs:v10];

    id v4 = v10;
    if (v6)
    {
      char v7 = [(ACTKeyboardController *)self requestCondition];
      [v7 lock];

      [(ACTKeyboardController *)self setCurrentRequestToken:0];
      unsigned int v8 = [(ACTKeyboardController *)self requestCondition];
      [v8 signal];

      unsigned int v9 = [(ACTKeyboardController *)self requestCondition];
      [v9 unlock];

      id v4 = v10;
    }
  }
}

- (void)generateAutocorrectionsWithKeyboardState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ACTKeyboardController *)self autocorrection];
  if (!v5
    || (unsigned int v6 = (void *)v5,
        [(ACTKeyboardController *)self autocorrection],
        char v7 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v8 = [v7 isForShortcutConversion],
        v7,
        v6,
        (v8 & 1) == 0))
  {
    if ([(ACTKeyboardController *)self asyncPredictions]
      && ([(ACTKeyboardController *)self inputManagerWrapper],
          unsigned int v9 = objc_claimAutoreleasedReturnValue(),
          char v10 = objc_opt_respondsToSelector(),
          v9,
          (v10 & 1) != 0))
    {
      unsigned int v11 = [NSClassFromString(@"TICandidateRequestToken") tokenForKeyboardState:v4];
      unsigned int v12 = [(ACTKeyboardController *)self requestCondition];
      [v12 lock];

      [(ACTKeyboardController *)self setAutocorrectionList:0];
      [(ACTKeyboardController *)self setCurrentRequestToken:v11];
      id v13 = [(ACTKeyboardController *)self requestCondition];
      [v13 unlock];

      id v14 = [(ACTKeyboardController *)self inputManagerWrapper];
      id v15 = [(ACTKeyboardController *)self clonedKeyboardState];
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_227C0;
      v30[3] = &unk_8D1A8;
      v30[4] = self;
      id v16 = v11;
      id v31 = v16;
      objc_msgSend(v14, "generateAutocorrectionsWithKeyboardState:candidateRange:requestToken:completionHandler:", v15, 0, 3, v16, v30);

      unsigned __int8 v17 = [(ACTKeyboardController *)self requestCondition];
      [v17 lock];

      long long v18 = [(ACTKeyboardController *)self currentRequestToken];

      if (v18)
      {
        do
        {
          if ([v4 needAutofill])
          {
            id v19 = +[NSDate dateWithTimeIntervalSinceNow:0.5];
            uint64_t v20 = [(ACTKeyboardController *)self requestCondition];
            unsigned __int8 v21 = [v20 waitUntilDate:v19];

            if ((v21 & 1) == 0)
            {
              id v22 = [(ACTKeyboardController *)self requestCondition];
              [v22 unlock];

              id v23 = +[NSDate dateWithTimeIntervalSinceNow:0.5];
              CGRect v24 = +[NSRunLoop currentRunLoop];
              [v24 acceptInputForMode:NSDefaultRunLoopMode beforeDate:v23];

              uint64_t v25 = [(ACTKeyboardController *)self requestCondition];
              [v25 lock];
            }
          }
          else
          {
            id v19 = [(ACTKeyboardController *)self requestCondition];
            [v19 wait];
          }

          CGRect v26 = [(ACTKeyboardController *)self currentRequestToken];
        }
        while (v26);
      }
      uint64_t v27 = [(ACTKeyboardController *)self requestCondition];
      [v27 unlock];
    }
    else
    {
      id v16 = [(ACTKeyboardController *)self inputManagerWrapper];
      uint64_t v28 = [(ACTKeyboardController *)self clonedKeyboardState];
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_22894;
      v29[3] = &unk_8D180;
      v29[4] = self;
      [v16 generateAutocorrectionsWithKeyboardState:v28 completionHandler:v29];
    }
  }
}

- (void)generateCandidates
{
  id v3 = [(ACTKeyboardController *)self clonedKeyboardState];
  [(ACTKeyboardController *)self generateCandidatesWithKeyboardState:v3];
}

- (void)acceptCandidateInputEvent:(id)a3 fromCandidateBar:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  char v7 = v6;
  unsigned int v12 = v6;
  if (v4)
  {
    unsigned __int8 v8 = [v6 acceptedCandidate];
    unsigned int v9 = [v8 candidate];
    if ([v9 length])
    {

      char v7 = v12;
LABEL_5:
      [(ACTKeyboardController *)self handleKeyboardInput:v7];
      [(ACTKeyboardController *)self setLastInputWasSelection:1];
      goto LABEL_8;
    }
    char v10 = [v12 acceptedCandidate];
    unsigned int v11 = [v10 isSecureContentCandidate];

    char v7 = v12;
    if (v11) {
      goto LABEL_5;
    }
  }
  if (![v7 isDoubleSpace]) {
    goto LABEL_9;
  }
  [(ACTKeyboardController *)self handleKeyboardInput:v12];
LABEL_8:
  [(ACTKeyboardController *)self updateAutoshift];
  [(ACTKeyboardController *)self generateAutocorrectionsOrCandidates];
LABEL_9:

  _objc_release_x2();
}

- (void)generateCandidatesWithKeyboardState:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  [(ACTKeyboardController *)self setCandidateResultSet:0];
  uint64_t v5 = [(ACTKeyboardController *)self inputManagerWrapper];
  id v6 = [(ACTKeyboardController *)self clonedKeyboardState];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_22D1C;
  v18[3] = &unk_8D1D0;
  v18[4] = self;
  v18[5] = &v19;
  objc_msgSend(v5, "generateCandidatesWithKeyboardState:candidateRange:completionHandler:", v6, 0, 0x7FFFFFFFLL, v18);

  char v7 = +[NSDate dateWithTimeIntervalSinceNow:0.5];
  if (*((unsigned char *)v20 + 24)) {
    goto LABEL_6;
  }
  while (1)
  {
    [v7 timeIntervalSinceNow];
    if (v8 <= 0.0) {
      break;
    }
    unsigned int v9 = +[NSRunLoop currentRunLoop];
    [v9 acceptInputForMode:NSDefaultRunLoopMode beforeDate:v7];

    if (*((unsigned char *)v20 + 24)) {
      goto LABEL_6;
    }
  }
  if (*((unsigned char *)v20 + 24))
  {
LABEL_6:
    char v10 = [(ACTKeyboardController *)self candidateResultSet];
    unsigned int v11 = [v10 uncommittedText];

    if (v11)
    {
      unsigned int v12 = [(ACTKeyboardController *)self candidateResultSet];
      id v13 = [v12 uncommittedText];
      [(ACTKeyboardController *)self setIntermediateText:v13];
    }
    id v14 = [(ACTKeyboardController *)self candidateResultSet];
    id v15 = [v14 committedText];

    if (v15)
    {
      id v16 = [(ACTKeyboardController *)self candidateResultSet];
      unsigned __int8 v17 = [v16 committedText];
      [(ACTKeyboardController *)self insertText:v17];
    }
  }

  _Block_object_dispose(&v19, 8);
}

- (id)candidatesForString:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  unsigned int v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = sub_1BF54;
  id v15 = sub_1BF64;
  id v16 = 0;
  uint64_t v5 = [(ACTKeyboardController *)self inputManagerWrapper];
  id v6 = [(ACTKeyboardController *)self keyboardState];
  char v7 = [v6 keyLayout];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_22EC0;
  v10[3] = &unk_8D1F8;
  v10[4] = &v11;
  [v5 generateReplacementsForString:v4 keyLayout:v7 continuation:v10];

  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (void)updateKeyboardOutput:(id)a3 withInputForSmartPunctuation:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  char v7 = [(ACTKeyboardController *)self smartPunctuationController];

  if (v7)
  {
    if ([v6 isPopupVariant]) {
      id v8 = &def_3B118 + 1;
    }
    else {
      id v8 = [v6 isFlick];
    }
    unsigned int v9 = [(ACTKeyboardController *)self smartPunctuationController];
    char v10 = [v6 string];
    uint64_t v11 = [(ACTKeyboardController *)self keyboardState];
    unsigned int v12 = [v11 documentState];
    uint64_t v13 = [v9 smartPunctuationOutputForInput:v10 isLockedInput:v8 documentState:v12];

    if ([v13 deletionCount]) {
      objc_msgSend(v17, "setDeletionCount:", objc_msgSend(v13, "deletionCount"));
    }
    id v14 = [v13 insertionText];
    if ([v14 length])
    {
      id v15 = [v17 insertionText];
      id v16 = [v15 length];

      if (!v16)
      {
LABEL_11:

        goto LABEL_12;
      }
      id v14 = [v13 insertionText];
      [v17 setInsertionText:v14];
    }

    goto LABEL_11;
  }
LABEL_12:
}

- (void)handleKeyboardInput:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 acceptedCandidate];

  if (!v5) {
    goto LABEL_9;
  }
  id v6 = [v4 acceptedCandidate];
  char v7 = [(ACTKeyboardController *)self candidateByApplyingSmartPunctuationToCandidate:v6];
  [v4 setAcceptedCandidate:v7];

  id v8 = [v4 acceptedCandidate];
  unsigned int v9 = [v8 input];
  char v10 = [v4 acceptedCandidate];
  uint64_t v11 = [v10 rawInput];
  [(ACTKeyboardController *)self deleteText:v9 rawText:v11];

  unsigned int v12 = [v4 acceptedCandidate];
  uint64_t v13 = [v12 candidate];

  id v14 = [v4 acceptedCandidate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_5;
  }
  id v15 = [v4 acceptedCandidate];
  unsigned int v16 = [v15 isContinuousPathConversion];

  if (v16)
  {
    [(ACTKeyboardController *)self adjustContinuousPathCandidate:v13];
    uint64_t v13 = v14 = v13;
LABEL_5:
  }
  [(ACTKeyboardController *)self insertText:v13];
  id v17 = [v4 acceptedCandidate];
  unsigned int v18 = [v17 isAutocorrection];

  if (v18) {
    [(ACTKeyboardController *)self setJustAcceptedAutocorrection:1];
  }

LABEL_9:
  uint64_t v19 = [(ACTKeyboardController *)self inputManagerWrapper];
  uint64_t v20 = [(ACTKeyboardController *)self clonedKeyboardState];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_23294;
  v22[3] = &unk_8D220;
  v22[4] = self;
  id v23 = v4;
  id v21 = v4;
  [v19 handleKeyboardInput:v21 keyboardState:v20 completionHandler:v22];
}

- (void)addInput:(id)a3 fromVariantKey:(BOOL)a4 fromGestureKey:(BOOL)a5
{
  uint64_t v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  [(ACTKeyboardController *)self addInput:v8 fromVariantKey:v6 fromGestureKey:v5 touchEvent:0];
  LOBYTE(v5) = [v8 isEqualToString:@"Shift"];

  if ((v5 & 1) == 0) {
    [(ACTKeyboardController *)self updateAutoshift];
  }

  [(ACTKeyboardController *)self generateAutocorrectionsOrCandidates];
}

- (void)addInput:(id)a3 fromVariantKey:(BOOL)a4 touchEvent:(id)a5
{
}

- (BOOL)isContinuousPathNonSpacePunctuation:(unsigned int)a3
{
  unsigned __int16 v3 = a3;
  id v4 = [(ACTKeyboardController *)self inputManager];
  uint64_t v5 = [v4 terminatorsDeletingAutospace];

  BOOL v6 = [v5 characterSet];
  LOBYTE(v3) = [v6 characterIsMember:v3];

  return v3;
}

- (BOOL)shouldAcceptCandidate:(id)a3 beforeInputString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 candidate];
  if ([v8 length] || objc_msgSend(v6, "slotID"))
  {
  }
  else
  {
    id v19 = [v6 customInfoType];

    if (!v19) {
      goto LABEL_5;
    }
  }
  unsigned int v9 = [(ACTKeyboardController *)self inputManagerState];
  unsigned __int8 v10 = [v9 shouldSuppressAutocorrectionWithTerminator:v7];

  if (v10)
  {
LABEL_5:
    char v11 = 0;
    goto LABEL_15;
  }
  if ([v7 length] && (objc_msgSend(v6, "input"), (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [v6 candidate];
    if (v14)
    {
      id v15 = (void *)v14;
      unsigned int v16 = [v6 input];
      id v17 = [v16 stringByAppendingString:v7];
      unsigned int v18 = [v6 candidate];
      char v11 = [v18 rangeOfString:v17 options:9] == (id)0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      char v11 = 1;
    }
  }
  else
  {
    char v11 = 1;
  }
LABEL_15:

  return v11;
}

- (void)addInput:(id)a3 fromVariantKey:(BOOL)a4 fromGestureKey:(BOOL)a5 touchEvent:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v41 = a3;
  id v10 = a6;
  char v11 = [(ACTKeyboardController *)self inputManagerState];
  unsigned int v12 = [v11 stringEndsWord:v41];

  if (!v12) {
    goto LABEL_11;
  }
  if ([(ACTKeyboardController *)self usesAutocorrection]
    && ([(ACTKeyboardController *)self inputManagerState],
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v15 = [v14 usesCandidateSelection],
        v14,
        (v15 & 1) == 0))
  {
    id v19 = [(ACTKeyboardController *)self inlineCompletion];
    id v13 = v41;
    if (!v19)
    {
      uint64_t v20 = [(ACTKeyboardController *)self autocorrection];
      id v13 = v41;
      id v19 = (void *)v20;
      if (!v20) {
        goto LABEL_12;
      }
    }
  }
  else
  {
    unsigned int v16 = [(ACTKeyboardController *)self inputManagerState];
    unsigned int v17 = [v16 usesCandidateSelection];

    if (!v17)
    {
LABEL_11:
      id v19 = 0;
      goto LABEL_12;
    }
    unsigned int v18 = [(ACTKeyboardController *)self candidateResultSet];
    id v19 = [v18 defaultCandidate];

    id v13 = v41;
    if (!v19) {
      goto LABEL_12;
    }
  }
  if (![(ACTKeyboardController *)self shouldAcceptCandidate:v19 beforeInputString:v13])
  {

    goto LABEL_11;
  }
LABEL_12:
  -[ACTKeyboardController setInputIsPunctuationFollowingContinuousPath:](self, "setInputIsPunctuationFollowingContinuousPath:", 0, v13);
  if ([(ACTKeyboardController *)self lastInputWasContinuousPath])
  {
    unsigned int v21 = [(NSMutableString *)self->_text length];
    id v22 = [v41 length] == (char *)&def_3B118 + 1 ? objc_msgSend(v41, "_firstLongCharacter") : 0;
    if (-[ACTKeyboardController isContinuousPathNonSpacePunctuation:](self, "isContinuousPathNonSpacePunctuation:", v22)&& ((v21 - 1) & 0x80000000) == 0&& -[NSMutableString characterAtIndex:](self->_text, "characterAtIndex:") == 32)
    {
      [(ACTKeyboardController *)self setInputIsPunctuationFollowingContinuousPath:1];
    }
  }
  [(ACTKeyboardController *)self setLastInputWasContinuousPath:0];
  if (v19)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0 && [v19 performSelector:"isContinuousPathConversion"])
    {
      id v23 = [(ACTKeyboardController *)self autocorrectionList];
      CGRect v24 = [v23 predictions];
      uint64_t v25 = +[TIAutocorrectionList listWithCorrections:0 predictions:v24];
      [(ACTKeyboardController *)self setAutocorrectionList:v25];

      [(ACTKeyboardController *)self setLastInputWasContinuousPath:1];
    }
    else
    {
      [(ACTKeyboardController *)self setAutocorrectionList:0];
    }
    CGRect v26 = [(ACTKeyboardController *)self inputManagerState];
    unsigned int v27 = [v26 usesCandidateSelection];

    if (v27)
    {
      [(ACTKeyboardController *)self acceptCandidate:v19];
      goto LABEL_46;
    }
  }
  else
  {
    [(ACTKeyboardController *)self setAutocorrectionList:0];
  }
  id v28 = objc_alloc_init((Class)TIKeyboardInput);
  [v28 setString:v41];
  objc_msgSend(v28, "setUppercase:", -[ACTKeyboardController isShifted](self, "isShifted"));
  objc_msgSend(v28, "setAutoshifted:", -[ACTKeyboardController isAutoshifted](self, "isAutoshifted"));
  [v28 setPopupVariant:v8];
  if (objc_opt_respondsToSelector()) {
    [v28 setGesture:v7];
  }
  [v28 setTouchEvent:v10];
  [v28 setAcceptedCandidate:v19];
  if ([(ACTKeyboardController *)self nextKeyIsMultitap])
  {
    [v28 setMultitap:1];
    [(ACTKeyboardController *)self setNextKeyIsMultitap:0];
  }
  if ([(ACTKeyboardController *)self nextKeyIsFlick])
  {
    [v28 setFlick:1];
    [(ACTKeyboardController *)self setNextKeyIsFlick:0];
  }
  if (v10)
  {
    long long v29 = [(ACTKeyboardController *)self keys];
    long long v30 = objc_msgSend(v29, "objectAtIndex:", objc_msgSend(v10, "forcedKeyCode"));

    id v31 = [v30 stringForProperty:UIKBTreePropertyHint];
    [v28 setInputManagerHint:v31];
  }
  long long v32 = [v28 acceptedCandidate];
  char v33 = objc_opt_respondsToSelector();

  if (v33)
  {
    unsigned __int8 v34 = [v28 acceptedCandidate];
    unsigned int v35 = [v34 isContinuousPathConversion];
  }
  else
  {
    unsigned int v35 = 0;
  }
  int64_t v36 = [(ACTKeyboardController *)self inputManagerState];
  uint64_t v37 = [v36 wordSeparator];
  unsigned int v38 = [v41 isEqualToString:v37];

  if (v38)
  {
    unsigned int v39 = [(ACTKeyboardController *)self lastInputWasSelection];
    unsigned int v40 = v10 ? 0 : v39;
    if ((v40 | v35) == 1) {
      [v28 setSynthesizedByAcceptingCandidate:1];
    }
  }
  [(ACTKeyboardController *)self handleKeyboardInput:v28];

LABEL_46:
  [(ACTKeyboardController *)self setLastInputWasSelection:0];
}

- (void)deleteInput
{
}

- (void)deleteInput:(id)a3
{
  id v4 = a3;
  [(ACTKeyboardController *)self setAutocorrectionList:0];
  id v5 = objc_alloc_init((Class)TIKeyboardInput);
  [v5 setBackspace:1];
  [(ACTKeyboardController *)self handleKeyboardInput:v5];
  [v5 setTouchEvent:v4];

  [(ACTKeyboardController *)self updateAutoshift];
}

- (NSString)text
{
  return &self->_text->super;
}

- (ACTKeyboardLayoutUtils)layoutUtils
{
  return self->_layoutUtils;
}

- (BOOL)insertsSpaceAfterPredictiveInput
{
  return self->_insertsSpaceAfterPredictiveInput;
}

- (void)setInsertsSpaceAfterPredictiveInput:(BOOL)a3
{
  self->_insertsSpaceAfterPredictiveInput = a3;
}

- (TIKeyboardInputManagerFactory)keyboardInputManagerFactory
{
  return self->_keyboardInputManagerFactory;
}

- (void)setKeyboardInputManagerFactory:(id)a3
{
  self->_keyboardInputManagerFactordouble y = (TIKeyboardInputManagerFactory *)a3;
}

- (NSString)inputModeIdentifier
{
  return self->_inputModeIdentifier;
}

- (void)setInputModeIdentifier:(id)a3
{
}

- (TIInputMode)inputMode
{
  return self->_inputMode;
}

- (unint64_t)supplementalLexiconIdentifier
{
  return self->_supplementalLexiconIdentifier;
}

- (void)setSupplementalLexiconIdentifier:(unint64_t)a3
{
  self->_supplementalLexiconIdentifier = a3;
}

- (BOOL)canSuggestSupplementalItemsForCurrentSelection
{
  return self->_canSuggestSupplementalItemsForCurrentSelection;
}

- (void)setCanSuggestSupplementalItemsForCurrentSelection:(BOOL)a3
{
  self->_canSuggestSupplementalItemsForCurrentSelection = a3;
}

- (BOOL)asyncPredictions
{
  return self->_asyncPredictions;
}

- (void)setAsyncPredictions:(BOOL)a3
{
  self->_asyncPredictions = a3;
}

- (UIKBTree)keyboard
{
  return self->_keyboard;
}

- (UIKBTree)keyplane
{
  return self->_keyplane;
}

- (NSMutableSet)leftKeys
{
  return self->_leftKeys;
}

- (void)setLeftKeys:(id)a3
{
}

- (NSMutableSet)rightKeys
{
  return self->_rightKeys;
}

- (void)setRightKeys:(id)a3
{
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
}

- (NSString)recipientIdentifier
{
  return self->_recipientIdentifier;
}

- (void)setRecipientIdentifier:(id)a3
{
}

- (TIInputContextHistory)inputContextHistory
{
  return self->_inputContextHistory;
}

- (void)setInputContextHistory:(id)a3
{
}

- (TIKeyboardInputManagerState)inputManagerState
{
  return self->_inputManagerState;
}

- (void)setInputManagerState:(id)a3
{
}

- (BOOL)lastInputWasSelection
{
  return self->_lastInputWasSelection;
}

- (void)setLastInputWasSelection:(BOOL)a3
{
  self->_lastInputWasSelection = a3;
}

- (BOOL)lastInputWasContinuousPath
{
  return self->_lastInputWasContinuousPath;
}

- (void)setLastInputWasContinuousPath:(BOOL)a3
{
  self->_lastInputWasContinuousPath = a3;
}

- (BOOL)inputIsPunctuationFollowingContinuousPath
{
  return self->_inputIsPunctuationFollowingContinuousPath;
}

- (void)setInputIsPunctuationFollowingContinuousPath:(BOOL)a3
{
  self->_inputIsPunctuationFollowingContinuousPath = a3;
}

- (BOOL)nextKeyIsMultitap
{
  return self->_nextKeyIsMultitap;
}

- (void)setNextKeyIsMultitap:(BOOL)a3
{
  self->_nextKeyIsMultitap = a3;
}

- (BOOL)nextKeyIsFlick
{
  return self->_nextKeyIsFlick;
}

- (void)setNextKeyIsFlick:(BOOL)a3
{
  self->_nextKeyIsFlick = a3;
}

- (TIKeyboardState)keyboardState
{
  return self->_keyboardState;
}

- (void)setKeyboardState:(id)a3
{
}

- (BOOL)usesAutocorrection
{
  return self->_usesAutocorrection;
}

- (void)setUsesAutocorrection:(BOOL)a3
{
  self->_usesAutocorrection = a3;
}

- (unint64_t)autocorrectionType
{
  return self->_autocorrectionType;
}

- (void)setAutocorrectionType:(unint64_t)a3
{
  self->_autocorrectionType = a3;
}

- (unint64_t)autocapitalizationType
{
  return self->_autocapitalizationType;
}

- (void)setAutocapitalizationType:(unint64_t)a3
{
  self->_autocapitalizationType = a3;
}

- (BOOL)usesPrediction
{
  return self->_usesPrediction;
}

- (void)setUsesPrediction:(BOOL)a3
{
  self->_usesPrediction = a3;
}

- (BOOL)usesAutocapitalization
{
  return self->_usesAutocapitalization;
}

- (void)setUsesAutocapitalization:(BOOL)a3
{
  self->_usesAutocapitalization = a3;
}

- (BOOL)wordLearningEnabled
{
  return self->_wordLearningEnabled;
}

- (void)setWordLearningEnabled:(BOOL)a3
{
  self->_wordLearningEnabled = a3;
}

- (BOOL)inlineCompletionEnabled
{
  return self->_inlineCompletionEnabled;
}

- (void)setInlineCompletionEnabled:(BOOL)a3
{
  self->_inlineCompletionEnabled = a3;
}

- (BOOL)longPredictionListEnabled
{
  return self->_longPredictionListEnabled;
}

- (void)setLongPredictionListEnabled:(BOOL)a3
{
  self->_longPredictionListEnabled = a3;
}

- (TISmartPunctuationController)smartPunctuationController
{
  return self->_smartPunctuationController;
}

- (BOOL)usesTransliteration
{
  return self->_usesTransliteration;
}

- (void)setUsesTransliteration:(BOOL)a3
{
  self->_usesTransliteration = a3;
}

- (TTKSimpleKeyboardPlane)ttkLayout
{
  return self->_ttkLayout;
}

- (void)setTtkLayout:(id)a3
{
}

- (_NSRange)selectedRange
{
  NSUInteger length = self->_selectedRange.length;
  NSUInteger location = self->_selectedRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (NSString)markedText
{
  return self->_markedText;
}

- (void)setMarkedText:(id)a3
{
}

- (NSString)lastCommittedText
{
  return self->_lastCommittedText;
}

- (BOOL)secureTextEntry
{
  return self->_secureTextEntry;
}

- (void)setSecureTextEntry:(BOOL)a3
{
  self->_secureTextEntrdouble y = a3;
}

- (BOOL)isScreenLocked
{
  return self->_isScreenLocked;
}

- (void)setIsScreenLocked:(BOOL)a3
{
  self->_isScreenLocked = a3;
}

- (TIKeyboardCandidateResultSet)candidateResultSet
{
  return self->_candidateResultSet;
}

- (void)setCandidateResultSet:(id)a3
{
}

- (BOOL)justAcceptedAutocorrection
{
  return self->_justAcceptedAutocorrection;
}

- (void)setJustAcceptedAutocorrection:(BOOL)a3
{
  self->_justAcceptedAutocorrection = a3;
}

- (NSArray)keys
{
  return self->_keys;
}

- (void)setKeys:(id)a3
{
}

- (void)setInputManagerWrapper:(id)a3
{
}

- (TIKeyboardIntermediateText)intermediateText
{
  return self->_intermediateText;
}

- (NSMutableDictionary)activeTouchState
{
  return self->_activeTouchState;
}

- (void)setActiveTouchState:(id)a3
{
}

- (NSCondition)requestCondition
{
  return self->_requestCondition;
}

- (TICandidateRequestToken)currentRequestToken
{
  return self->_currentRequestToken;
}

- (void)setCurrentRequestToken:(id)a3
{
}

- (NSLock)cpRequestTokenLock
{
  return self->_cpRequestTokenLock;
}

- (void)setCpRequestTokenLock:(id)a3
{
}

- (TICandidateRequestToken)lastCPRequestToken
{
  return self->_lastCPRequestToken;
}

- (void)setLastCPRequestToken:(id)a3
{
}

- (NSUUID)documentIdentifier
{
  return self->_documentIdentifier;
}

- (void)setDocumentIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentIdentifier, 0);
  objc_storeStrong((id *)&self->_lastCPRequestToken, 0);
  objc_storeStrong((id *)&self->_cpRequestTokenLock, 0);
  objc_storeStrong((id *)&self->_currentRequestToken, 0);
  objc_storeStrong((id *)&self->_requestCondition, 0);
  objc_storeStrong((id *)&self->_activeTouchState, 0);
  objc_storeStrong((id *)&self->_intermediateText, 0);
  objc_storeStrong((id *)&self->_inputManagerWrapper, 0);
  objc_storeStrong((id *)&self->_keys, 0);
  objc_storeStrong((id *)&self->_candidateResultSet, 0);
  objc_storeStrong((id *)&self->_lastCommittedText, 0);
  objc_storeStrong((id *)&self->_markedText, 0);
  objc_storeStrong((id *)&self->_ttkLayout, 0);
  objc_storeStrong((id *)&self->_smartPunctuationController, 0);
  objc_storeStrong((id *)&self->_keyboardState, 0);
  objc_storeStrong((id *)&self->_inputManagerState, 0);
  objc_storeStrong((id *)&self->_inputContextHistory, 0);
  objc_storeStrong((id *)&self->_recipientIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_rightKeys, 0);
  objc_storeStrong((id *)&self->_leftKeys, 0);
  objc_storeStrong((id *)&self->_inputMode, 0);
  objc_storeStrong((id *)&self->_inputModeIdentifier, 0);
  objc_storeStrong((id *)&self->_layoutUtils, 0);
  objc_storeStrong((id *)&self->_autocorrectionList, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_keyplane, 0);

  objc_storeStrong((id *)&self->_keyboard, 0);
}

@end