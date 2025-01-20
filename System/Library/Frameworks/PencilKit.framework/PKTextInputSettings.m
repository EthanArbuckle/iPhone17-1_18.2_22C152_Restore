@interface PKTextInputSettings
+ (id)sharedSettings;
+ (int64_t)featureLevel;
- (BOOL)UCBPaletteEnabled;
- (BOOL)_isFeatureAvailableAndEnabled;
- (BOOL)_shouldSaveSettings;
- (BOOL)activePreviewEnabled;
- (BOOL)alwaysIncludeReturnKeyAndInputAssistantItems;
- (BOOL)autoLineBreakEnabled;
- (BOOL)autoLineBreakRequireWeakCursor;
- (BOOL)continuousRecognition;
- (BOOL)enableOnNonEditableViews;
- (BOOL)enableOnRemoteViews;
- (BOOL)enableReserveSpace;
- (BOOL)enableReserveSpaceTapForNewlines;
- (BOOL)enableTargetedAppWorkarounds;
- (BOOL)enableViewControllerSupport;
- (BOOL)enableWeakCursor;
- (BOOL)floatingBackgroundEnabled;
- (BOOL)forceUserTextInputSettingEnabled;
- (BOOL)hideDefaultReturnKeyWhenSpecialReturnKeyIsPresent;
- (BOOL)isScribbleActive;
- (BOOL)lineBreakOnTapEnabled;
- (BOOL)lineBreakVerticalBarGestureEnabled;
- (BOOL)lineBreakVerticalBarUpToDelete;
- (BOOL)outOfProcessRecognition;
- (BOOL)preventLeftoverCharsInSubwordGestures;
- (BOOL)scratchOutMakesTheCursorStrong;
- (BOOL)slidingCanvasDebugBorder;
- (BOOL)styledActivePreview;
- (BOOL)supportedKeyboardLocaleExists;
- (BOOL)useLargeHitTestArea;
- (BOOL)useSingleComponentCanvas;
- (BOOL)useSlidingCanvas;
- (BOOL)useTransformStrokesAnimation;
- (NSArray)recognitionLocaleIdentifiers;
- (NSString)currentLanguageIdentifier;
- (NSString)recognitionLocaleIdentifier;
- (PKTextInputSettings)init;
- (double)asyncElementRequestTimeout;
- (double)autoLineBreakAreaWidthFactor;
- (double)autoLineBreakDualVerticalDistance;
- (double)autoLineBreakVerticalDistance;
- (double)continuousRecognitionWritingInterval;
- (double)debugElementFinderArtificialDelay;
- (double)debugFirstResponderArtificialDelay;
- (double)debugRecognitionRequestArtificialDelay;
- (double)drawingGestureDetectTapAwayFromCurrentStrokesHorizontalDistance;
- (double)drawingGestureDetectTapAwayFromCurrentStrokesVerticalDistance;
- (double)drawingGestureLongPressDetectionTimeInterval;
- (double)drawingGestureLongPressMaxDistance;
- (double)drawingGestureMinimumPanDistanceThreshold;
- (double)drawingGestureMinimumScrollDistanceThreshold;
- (double)drawingGestureTapDetectionDistanceThreshold;
- (double)drawingGestureTapDetectionTimeInterval;
- (double)emojiConversionDelay;
- (double)firstResponderAttractionHorizontal;
- (double)firstResponderAttractionVertical;
- (double)inkWeight;
- (double)inkWeightForIncreasedContrast;
- (double)interactionDisablingDelay;
- (double)minimumWritingSpaceWidth;
- (double)recognitionCoalescingDelay;
- (double)singleCharacterCommitDelay;
- (double)slidingCanvasHeight;
- (double)slidingCanvasWidth;
- (double)strongCursorMaximumYDistance;
- (double)strongCursorRestoreDelay;
- (double)subwordGestureEndingSpeedRange;
- (double)subwordGestureSpeedThreshold;
- (double)tapToLineBreakVerticalDistance;
- (double)textInputStandardCommitDelay;
- (double)textInputStrokeFadeOutDelay;
- (double)textInputStrokeFadeOutDuration;
- (double)textInputViewHitTestSlackHorizontal;
- (double)textInputViewHitTestSlackVertical;
- (double)weakCursorVisibilityTimeout;
- (id)availableRecognitionLocaleIdentifiers;
- (id)settingsDictionaryRepresentation;
- (int64_t)incrementalCommitWordsBack;
- (void)_loadDefaultValues;
- (void)_notifyRecognitionLocaleIdentifierDidChange;
- (void)_scheduleSavingSettingsSoon;
- (void)dealloc;
- (void)loadSettingsFromDictionary:(id)a3;
- (void)loadSettingsFromUserDefaults;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)resetToDefaultValues;
- (void)saveSettingsToUserDefaults;
- (void)setActivePreviewEnabled:(BOOL)a3;
- (void)setAlwaysIncludeReturnKeyAndInputAssistantItems:(BOOL)a3;
- (void)setAsyncElementRequestTimeout:(double)a3;
- (void)setAutoLineBreakAreaWidthFactor:(double)a3;
- (void)setAutoLineBreakDualVerticalDistance:(double)a3;
- (void)setAutoLineBreakEnabled:(BOOL)a3;
- (void)setAutoLineBreakRequireWeakCursor:(BOOL)a3;
- (void)setAutoLineBreakVerticalDistance:(double)a3;
- (void)setContinuousRecognition:(BOOL)a3;
- (void)setContinuousRecognitionWritingInterval:(double)a3;
- (void)setDebugElementFinderArtificialDelay:(double)a3;
- (void)setDebugFirstResponderArtificialDelay:(double)a3;
- (void)setDebugRecognitionRequestArtificialDelay:(double)a3;
- (void)setDrawingGestureDetectTapAwayFromCurrentStrokesHorizontalDistance:(double)a3;
- (void)setDrawingGestureDetectTapAwayFromCurrentStrokesVerticalDistance:(double)a3;
- (void)setDrawingGestureLongPressDetectionTimeInterval:(double)a3;
- (void)setDrawingGestureLongPressMaxDistance:(double)a3;
- (void)setDrawingGestureMinimumPanDistanceThreshold:(double)a3;
- (void)setDrawingGestureMinimumScrollDistanceThreshold:(double)a3;
- (void)setDrawingGestureTapDetectionDistanceThreshold:(double)a3;
- (void)setDrawingGestureTapDetectionTimeInterval:(double)a3;
- (void)setEmojiConversionDelay:(double)a3;
- (void)setEnableOnNonEditableViews:(BOOL)a3;
- (void)setEnableOnRemoteViews:(BOOL)a3;
- (void)setEnableReserveSpace:(BOOL)a3;
- (void)setEnableReserveSpaceTapForNewlines:(BOOL)a3;
- (void)setEnableTargetedAppWorkarounds:(BOOL)a3;
- (void)setEnableViewControllerSupport:(BOOL)a3;
- (void)setEnableWeakCursor:(BOOL)a3;
- (void)setFirstResponderAttractionHorizontal:(double)a3;
- (void)setFirstResponderAttractionVertical:(double)a3;
- (void)setFloatingBackgroundEnabled:(BOOL)a3;
- (void)setForceUserTextInputSettingEnabled:(BOOL)a3;
- (void)setHideDefaultReturnKeyWhenSpecialReturnKeyIsPresent:(BOOL)a3;
- (void)setIncrementalCommitWordsBack:(int64_t)a3;
- (void)setInkWeight:(double)a3;
- (void)setInkWeightForIncreasedContrast:(double)a3;
- (void)setInteractionDisablingDelay:(double)a3;
- (void)setLineBreakOnTapEnabled:(BOOL)a3;
- (void)setLineBreakVerticalBarGestureEnabled:(BOOL)a3;
- (void)setLineBreakVerticalBarUpToDelete:(BOOL)a3;
- (void)setMinimumWritingSpaceWidth:(double)a3;
- (void)setOutOfProcessRecognition:(BOOL)a3;
- (void)setPreventLeftoverCharsInSubwordGestures:(BOOL)a3;
- (void)setRecognitionCoalescingDelay:(double)a3;
- (void)setScratchOutMakesTheCursorStrong:(BOOL)a3;
- (void)setSingleCharacterCommitDelay:(double)a3;
- (void)setSlidingCanvasDebugBorder:(BOOL)a3;
- (void)setSlidingCanvasHeight:(double)a3;
- (void)setSlidingCanvasWidth:(double)a3;
- (void)setStrongCursorMaximumYDistance:(double)a3;
- (void)setStrongCursorRestoreDelay:(double)a3;
- (void)setStyledActivePreview:(BOOL)a3;
- (void)setSubwordGestureEndingSpeedRange:(double)a3;
- (void)setSubwordGestureSpeedThreshold:(double)a3;
- (void)setTapToLineBreakVerticalDistance:(double)a3;
- (void)setTextInputStandardCommitDelay:(double)a3;
- (void)setTextInputStrokeFadeOutDelay:(double)a3;
- (void)setTextInputStrokeFadeOutDuration:(double)a3;
- (void)setTextInputViewHitTestSlackHorizontal:(double)a3;
- (void)setTextInputViewHitTestSlackVertical:(double)a3;
- (void)setUCBPaletteEnabled:(BOOL)a3;
- (void)setUseLargeHitTestArea:(BOOL)a3;
- (void)setUseSingleComponentCanvas:(BOOL)a3;
- (void)setUseSlidingCanvas:(BOOL)a3;
- (void)setUseTransformStrokesAnimation:(BOOL)a3;
- (void)setValue:(id)a3 forKey:(id)a4;
- (void)setWeakCursorVisibilityTimeout:(double)a3;
@end

@implementation PKTextInputSettings

+ (id)sharedSettings
{
  if (qword_1EB3C5E40 != -1) {
    dispatch_once(&qword_1EB3C5E40, &__block_literal_global_9);
  }
  v2 = (void *)qword_1EB3C5E38;

  return v2;
}

void __37__PKTextInputSettings_sharedSettings__block_invoke()
{
  v0 = objc_alloc_init(PKTextInputSettings);
  v1 = (void *)qword_1EB3C5E38;
  qword_1EB3C5E38 = (uint64_t)v0;
}

- (PKTextInputSettings)init
{
  v6.receiver = self;
  v6.super_class = (Class)PKTextInputSettings;
  v2 = [(PKTextInputSettings *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(PKTextInputSettings *)v2 _loadDefaultValues];
    [(PKTextInputSettings *)v3 loadSettingsFromUserDefaults];
    v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v4 addObserver:v3 forKeyPath:@"ApplePencilTextInputEnabled" options:0 context:&PKTextInputEnabledDidChangeContext];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v3 removeObserver:self forKeyPath:@"ApplePencilTextInputEnabled" context:&PKTextInputEnabledDidChangeContext];

  v4.receiver = self;
  v4.super_class = (Class)PKTextInputSettings;
  [(PKTextInputSettings *)&v4 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == &PKTextInputEnabledDidChangeContext)
  {
    [(PKTextInputSettings *)self _notifyRecognitionLocaleIdentifierDidChange];
  }
  else
  {
    uint64_t v9 = v6;
    uint64_t v10 = v7;
    v8.receiver = self;
    v8.super_class = (Class)PKTextInputSettings;
    -[PKTextInputSettings observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)_notifyRecognitionLocaleIdentifierDidChange
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__PKTextInputSettings__notifyRecognitionLocaleIdentifierDidChange__block_invoke;
  aBlock[3] = &unk_1E64C61C0;
  aBlock[4] = self;
  v2 = (void (**)(void))_Block_copy(aBlock);
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    v2[2](v2);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v2);
  }
}

void __66__PKTextInputSettings__notifyRecognitionLocaleIdentifierDidChange__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"PKTextInputSettingsRecognitionLocaleIdentifierDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (BOOL)_shouldSaveSettings
{
  id v2 = [MEMORY[0x1E4F28B50] mainBundle];
  v3 = [v2 bundleIdentifier];
  char v4 = [v3 isEqualToString:@"com.apple.Preferences"];

  return v4;
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PKTextInputSettings;
  [(PKTextInputSettings *)&v5 setValue:a3 forKey:a4];
  if ([(PKTextInputSettings *)self _shouldSaveSettings]) {
    [(PKTextInputSettings *)self _scheduleSavingSettingsSoon];
  }
}

+ (int64_t)featureLevel
{
  if (qword_1EB3C5E50 != -1) {
    dispatch_once(&qword_1EB3C5E50, &__block_literal_global_22);
  }
  return qword_1EB3C5E48;
}

void __35__PKTextInputSettings_featureLevel__block_invoke()
{
  if (!MGGetBoolAnswer()) {
    goto LABEL_12;
  }
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  v1 = [v0 bundleIdentifier];
  if ([v1 isEqualToString:@"com.apple.PreBoard"])
  {
LABEL_5:
    uint64_t v4 = 0;
    goto LABEL_6;
  }
  id v2 = [MEMORY[0x1E4F28B50] mainBundle];
  v3 = [v2 bundleIdentifier];
  if ([v3 isEqualToString:@"com.apple.AskPermissionUI"])
  {

    goto LABEL_5;
  }
  if (qword_1EB3C5E58 != -1) {
    dispatch_once(&qword_1EB3C5E58, &__block_literal_global_616);
  }
  int v5 = _MergedGlobals_117;

  if (!v5)
  {
LABEL_12:
    uint64_t v4 = 0;
    goto LABEL_13;
  }
  if (dyld_program_sdk_at_least())
  {
    uint64_t v4 = 1;
    goto LABEL_13;
  }
  v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1F200E280, 0);
  uint64_t v6 = [MEMORY[0x1E4F28B50] mainBundle];
  v1 = [v6 bundleIdentifier];

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v1, "hash"));
  int v8 = [v0 containsObject:v7];

  uint64_t v4 = v8 ^ 1u;
LABEL_6:

LABEL_13:
  qword_1EB3C5E48 = v4;
}

- (BOOL)isScribbleActive
{
  if (![(PKTextInputSettings *)self _isFeatureAvailableAndEnabled]) {
    return 0;
  }
  if (*MEMORY[0x1E4FB2608])
  {
    id v2 = +[PKTextInputLanguageSelectionController sharedInstance];
    v3 = [v2 currentLanguageIdentifiers];
    BOOL v4 = [v3 count] != 0;

    return v4;
  }

  return +[PKTextInputLanguageSelectionController hasSomeSupportedAndEnabledLocale];
}

- (NSString)currentLanguageIdentifier
{
  if ([(PKTextInputSettings *)self _isFeatureAvailableAndEnabled])
  {
    id v2 = +[PKTextInputLanguageSelectionController sharedInstance];
    v3 = [v2 currentLanguageIdentifiers];
    BOOL v4 = [v3 firstObject];
  }
  else
  {
    BOOL v4 = 0;
  }

  return (NSString *)v4;
}

- (BOOL)_isFeatureAvailableAndEnabled
{
  if (!+[PKTextInputSettings featureLevel]) {
    return 0;
  }
  v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  BOOL v4 = [v3 objectForKey:@"ApplePencilTextInputEnabled"];

  BOOL v5 = [(PKTextInputSettings *)self forceUserTextInputSettingEnabled]
    || !v4
    || [v4 BOOLValue];

  return v5;
}

- (id)settingsDictionaryRepresentation
{
  v110[66] = *MEMORY[0x1E4F143B8];
  v109[0] = @"interactionDisablingDelay";
  v3 = NSNumber;
  [(PKTextInputSettings *)self interactionDisablingDelay];
  v108 = objc_msgSend(v3, "numberWithDouble:");
  v110[0] = v108;
  v109[1] = @"textInputStrokeFadeOutDelay";
  BOOL v4 = NSNumber;
  [(PKTextInputSettings *)self textInputStrokeFadeOutDelay];
  v107 = objc_msgSend(v4, "numberWithDouble:");
  v110[1] = v107;
  v109[2] = @"textInputStrokeFadeOutDuration";
  BOOL v5 = NSNumber;
  [(PKTextInputSettings *)self textInputStrokeFadeOutDuration];
  v106 = objc_msgSend(v5, "numberWithDouble:");
  v110[2] = v106;
  v109[3] = @"continuousRecognitionWritingInterval";
  uint64_t v6 = NSNumber;
  [(PKTextInputSettings *)self continuousRecognitionWritingInterval];
  v105 = objc_msgSend(v6, "numberWithDouble:");
  v110[3] = v105;
  v109[4] = @"continuousRecognition";
  v104 = objc_msgSend(NSNumber, "numberWithBool:", -[PKTextInputSettings continuousRecognition](self, "continuousRecognition"));
  v110[4] = v104;
  v109[5] = @"recognitionCoalescingDelay";
  uint64_t v7 = NSNumber;
  [(PKTextInputSettings *)self recognitionCoalescingDelay];
  v103 = objc_msgSend(v7, "numberWithDouble:");
  v110[5] = v103;
  v109[6] = @"outOfProcessRecognition";
  v102 = objc_msgSend(NSNumber, "numberWithBool:", -[PKTextInputSettings outOfProcessRecognition](self, "outOfProcessRecognition"));
  v110[6] = v102;
  v109[7] = @"textInputViewHitTestSlackHorizontal";
  int v8 = NSNumber;
  [(PKTextInputSettings *)self textInputViewHitTestSlackHorizontal];
  v101 = objc_msgSend(v8, "numberWithDouble:");
  v110[7] = v101;
  v109[8] = @"textInputViewHitTestSlackVertical";
  uint64_t v9 = NSNumber;
  [(PKTextInputSettings *)self textInputViewHitTestSlackVertical];
  v100 = objc_msgSend(v9, "numberWithDouble:");
  v110[8] = v100;
  v109[9] = @"firstResponderAttractionHorizontal";
  uint64_t v10 = NSNumber;
  [(PKTextInputSettings *)self firstResponderAttractionHorizontal];
  v99 = objc_msgSend(v10, "numberWithDouble:");
  v110[9] = v99;
  v109[10] = @"firstResponderAttractionVertical";
  v11 = NSNumber;
  [(PKTextInputSettings *)self firstResponderAttractionVertical];
  v98 = objc_msgSend(v11, "numberWithDouble:");
  v110[10] = v98;
  v109[11] = @"minimumWritingSpaceWidth";
  v12 = NSNumber;
  [(PKTextInputSettings *)self minimumWritingSpaceWidth];
  v97 = objc_msgSend(v12, "numberWithDouble:");
  v110[11] = v97;
  v109[12] = @"subwordGestureEndingSpeedRange";
  v13 = NSNumber;
  [(PKTextInputSettings *)self subwordGestureEndingSpeedRange];
  v96 = objc_msgSend(v13, "numberWithDouble:");
  v110[12] = v96;
  v109[13] = @"subwordGestureSpeedThreshold";
  v14 = NSNumber;
  [(PKTextInputSettings *)self subwordGestureSpeedThreshold];
  v95 = objc_msgSend(v14, "numberWithDouble:");
  v110[13] = v95;
  v109[14] = @"preventLeftoverCharsInSubwordGestures";
  v94 = objc_msgSend(NSNumber, "numberWithBool:", -[PKTextInputSettings preventLeftoverCharsInSubwordGestures](self, "preventLeftoverCharsInSubwordGestures"));
  v110[14] = v94;
  v109[15] = @"activePreviewEnabled";
  v93 = objc_msgSend(NSNumber, "numberWithBool:", -[PKTextInputSettings activePreviewEnabled](self, "activePreviewEnabled"));
  v110[15] = v93;
  v109[16] = @"styledActivePreview";
  v92 = objc_msgSend(NSNumber, "numberWithBool:", -[PKTextInputSettings styledActivePreview](self, "styledActivePreview"));
  v110[16] = v92;
  v109[17] = @"floatingBackgroundEnabled";
  v91 = objc_msgSend(NSNumber, "numberWithBool:", -[PKTextInputSettings floatingBackgroundEnabled](self, "floatingBackgroundEnabled"));
  v110[17] = v91;
  v109[18] = @"textInputStandardCommitDelay";
  v15 = NSNumber;
  [(PKTextInputSettings *)self textInputStandardCommitDelay];
  v90 = objc_msgSend(v15, "numberWithDouble:");
  v110[18] = v90;
  v109[19] = @"singleCharacterCommitDelay";
  v16 = NSNumber;
  [(PKTextInputSettings *)self singleCharacterCommitDelay];
  v89 = objc_msgSend(v16, "numberWithDouble:");
  v110[19] = v89;
  v109[20] = @"incrementalCommitWordsBack";
  v88 = objc_msgSend(NSNumber, "numberWithInteger:", -[PKTextInputSettings incrementalCommitWordsBack](self, "incrementalCommitWordsBack"));
  v110[20] = v88;
  v109[21] = @"debugRecognitionRequestArtificialDelay";
  v17 = NSNumber;
  [(PKTextInputSettings *)self debugRecognitionRequestArtificialDelay];
  v87 = objc_msgSend(v17, "numberWithDouble:");
  v110[21] = v87;
  v109[22] = @"debugElementFinderArtificialDelay";
  v18 = NSNumber;
  [(PKTextInputSettings *)self debugElementFinderArtificialDelay];
  v86 = objc_msgSend(v18, "numberWithDouble:");
  v110[22] = v86;
  v109[23] = @"debugFirstResponderArtificialDelay";
  v19 = NSNumber;
  [(PKTextInputSettings *)self debugFirstResponderArtificialDelay];
  v85 = objc_msgSend(v19, "numberWithDouble:");
  v110[23] = v85;
  v109[24] = @"enableOnNonEditableViews";
  v84 = objc_msgSend(NSNumber, "numberWithBool:", -[PKTextInputSettings enableOnNonEditableViews](self, "enableOnNonEditableViews"));
  v110[24] = v84;
  v109[25] = @"enableOnRemoteViews";
  v83 = objc_msgSend(NSNumber, "numberWithBool:", -[PKTextInputSettings enableOnRemoteViews](self, "enableOnRemoteViews"));
  v110[25] = v83;
  v109[26] = @"enableViewControllerSupport";
  v82 = objc_msgSend(NSNumber, "numberWithBool:", -[PKTextInputSettings enableViewControllerSupport](self, "enableViewControllerSupport"));
  v110[26] = v82;
  v109[27] = @"UCBPaletteEnabledNewKey";
  v81 = objc_msgSend(NSNumber, "numberWithBool:", -[PKTextInputSettings UCBPaletteEnabled](self, "UCBPaletteEnabled"));
  v110[27] = v81;
  v109[28] = @"alwaysIncludeReturnKeyAndInputAssistantItems";
  v80 = objc_msgSend(NSNumber, "numberWithBool:", -[PKTextInputSettings alwaysIncludeReturnKeyAndInputAssistantItems](self, "alwaysIncludeReturnKeyAndInputAssistantItems"));
  v110[28] = v80;
  v109[29] = @"hideDefaultReturnKeyWhenSpecialReturnKeyIsPresent2";
  v79 = objc_msgSend(NSNumber, "numberWithBool:", -[PKTextInputSettings hideDefaultReturnKeyWhenSpecialReturnKeyIsPresent](self, "hideDefaultReturnKeyWhenSpecialReturnKeyIsPresent"));
  v110[29] = v79;
  v109[30] = @"enableReserveSpace";
  v78 = objc_msgSend(NSNumber, "numberWithBool:", -[PKTextInputSettings enableReserveSpace](self, "enableReserveSpace"));
  v110[30] = v78;
  v109[31] = @"enableReserveSpaceTapForNewlines";
  v77 = objc_msgSend(NSNumber, "numberWithBool:", -[PKTextInputSettings enableReserveSpaceTapForNewlines](self, "enableReserveSpaceTapForNewlines"));
  v110[31] = v77;
  v109[32] = @"asyncElementRequestTimeout";
  v20 = NSNumber;
  [(PKTextInputSettings *)self asyncElementRequestTimeout];
  v76 = objc_msgSend(v20, "numberWithDouble:");
  v110[32] = v76;
  v109[33] = @"drawingGestureMinimumPanDistanceThreshold";
  v21 = NSNumber;
  [(PKTextInputSettings *)self drawingGestureMinimumPanDistanceThreshold];
  v75 = objc_msgSend(v21, "numberWithDouble:");
  v110[33] = v75;
  v109[34] = @"drawingGestureMinimumScrollDistanceThreshold";
  v22 = NSNumber;
  [(PKTextInputSettings *)self drawingGestureMinimumScrollDistanceThreshold];
  v74 = objc_msgSend(v22, "numberWithDouble:");
  v110[34] = v74;
  v109[35] = @"drawingGestureTapDetectionTimeInterval2";
  v23 = NSNumber;
  [(PKTextInputSettings *)self drawingGestureTapDetectionTimeInterval];
  v73 = objc_msgSend(v23, "numberWithDouble:");
  v110[35] = v73;
  v109[36] = @"drawingGestureTapDetectionDistanceThreshold3";
  v24 = NSNumber;
  [(PKTextInputSettings *)self drawingGestureTapDetectionDistanceThreshold];
  v72 = objc_msgSend(v24, "numberWithDouble:");
  v110[36] = v72;
  v109[37] = @"drawingGestureDetectTapAwayFromCurrentStrokesHorizontalDistance";
  v25 = NSNumber;
  [(PKTextInputSettings *)self drawingGestureDetectTapAwayFromCurrentStrokesHorizontalDistance];
  v71 = objc_msgSend(v25, "numberWithDouble:");
  v110[37] = v71;
  v109[38] = @"drawingGestureDetectTapAwayFromCurrentStrokesVerticalDistance";
  v26 = NSNumber;
  [(PKTextInputSettings *)self drawingGestureDetectTapAwayFromCurrentStrokesVerticalDistance];
  v70 = objc_msgSend(v26, "numberWithDouble:");
  v110[38] = v70;
  v109[39] = @"drawingGestureLongPressMaxDistance";
  v27 = NSNumber;
  [(PKTextInputSettings *)self drawingGestureLongPressMaxDistance];
  v69 = objc_msgSend(v27, "numberWithDouble:");
  v110[39] = v69;
  v109[40] = @"drawingGestureLongPressDetectionTimeInterval";
  v28 = NSNumber;
  [(PKTextInputSettings *)self drawingGestureLongPressDetectionTimeInterval];
  v68 = objc_msgSend(v28, "numberWithDouble:");
  v110[40] = v68;
  v109[41] = @"inkWeight";
  v29 = NSNumber;
  [(PKTextInputSettings *)self inkWeight];
  v67 = objc_msgSend(v29, "numberWithDouble:");
  v110[41] = v67;
  v109[42] = @"lineBreakOnTapEnabled";
  v66 = objc_msgSend(NSNumber, "numberWithBool:", -[PKTextInputSettings lineBreakOnTapEnabled](self, "lineBreakOnTapEnabled"));
  v110[42] = v66;
  v109[43] = @"inkWeightForIncreasedContrast";
  v30 = NSNumber;
  [(PKTextInputSettings *)self inkWeightForIncreasedContrast];
  v65 = objc_msgSend(v30, "numberWithDouble:");
  v110[43] = v65;
  v109[44] = @"lineBreakVerticalBarGestureEnabled";
  v64 = objc_msgSend(NSNumber, "numberWithBool:", -[PKTextInputSettings lineBreakVerticalBarGestureEnabled](self, "lineBreakVerticalBarGestureEnabled"));
  v110[44] = v64;
  v109[45] = @"lineBreakVerticalBarUpToDelete";
  v63 = objc_msgSend(NSNumber, "numberWithBool:", -[PKTextInputSettings lineBreakVerticalBarUpToDelete](self, "lineBreakVerticalBarUpToDelete"));
  v110[45] = v63;
  v109[46] = @"autoLineBreakEnabled2";
  v62 = objc_msgSend(NSNumber, "numberWithBool:", -[PKTextInputSettings autoLineBreakEnabled](self, "autoLineBreakEnabled"));
  v110[46] = v62;
  v109[47] = @"autoLineBreakRequireWeakCursor2";
  v61 = objc_msgSend(NSNumber, "numberWithBool:", -[PKTextInputSettings autoLineBreakRequireWeakCursor](self, "autoLineBreakRequireWeakCursor"));
  v110[47] = v61;
  v109[48] = @"autoLineBreakVerticalDistance2";
  v31 = NSNumber;
  [(PKTextInputSettings *)self autoLineBreakVerticalDistance];
  v60 = objc_msgSend(v31, "numberWithDouble:");
  v110[48] = v60;
  v109[49] = @"autoLineBreakDualVerticalDistance2";
  v32 = NSNumber;
  [(PKTextInputSettings *)self autoLineBreakDualVerticalDistance];
  v59 = objc_msgSend(v32, "numberWithDouble:");
  v110[49] = v59;
  v109[50] = @"autoLineBreakAreaWidthFactor3";
  v33 = NSNumber;
  [(PKTextInputSettings *)self autoLineBreakAreaWidthFactor];
  v58 = objc_msgSend(v33, "numberWithDouble:");
  v110[50] = v58;
  v109[51] = @"tapToLineBreakVerticalDistance2";
  v34 = NSNumber;
  [(PKTextInputSettings *)self tapToLineBreakVerticalDistance];
  v57 = objc_msgSend(v34, "numberWithDouble:");
  v110[51] = v57;
  v109[52] = @"enableWeakCursor";
  v56 = objc_msgSend(NSNumber, "numberWithBool:", -[PKTextInputSettings enableWeakCursor](self, "enableWeakCursor"));
  v110[52] = v56;
  v109[53] = @"weakCursorVisibilityTimeout";
  v35 = NSNumber;
  [(PKTextInputSettings *)self weakCursorVisibilityTimeout];
  v55 = objc_msgSend(v35, "numberWithDouble:");
  v110[53] = v55;
  v109[54] = @"strongCursorRestoreDelay";
  v36 = NSNumber;
  [(PKTextInputSettings *)self strongCursorRestoreDelay];
  v54 = objc_msgSend(v36, "numberWithDouble:");
  v110[54] = v54;
  v109[55] = @"scratchOutMakesTheCursorStrong";
  v53 = objc_msgSend(NSNumber, "numberWithBool:", -[PKTextInputSettings scratchOutMakesTheCursorStrong](self, "scratchOutMakesTheCursorStrong"));
  v110[55] = v53;
  v109[56] = @"enableTargetedAppWorkarounds";
  v52 = objc_msgSend(NSNumber, "numberWithBool:", -[PKTextInputSettings enableTargetedAppWorkarounds](self, "enableTargetedAppWorkarounds"));
  v110[56] = v52;
  v109[57] = @"useSlidingCanvas";
  v37 = objc_msgSend(NSNumber, "numberWithBool:", -[PKTextInputSettings useSlidingCanvas](self, "useSlidingCanvas"));
  v110[57] = v37;
  v109[58] = @"slidingCanvasDebugBorder";
  v38 = objc_msgSend(NSNumber, "numberWithBool:", -[PKTextInputSettings slidingCanvasDebugBorder](self, "slidingCanvasDebugBorder"));
  v110[58] = v38;
  v109[59] = @"slidingCanvasWidth2";
  v39 = NSNumber;
  [(PKTextInputSettings *)self slidingCanvasWidth];
  v40 = objc_msgSend(v39, "numberWithDouble:");
  v110[59] = v40;
  v109[60] = @"slidingCanvasHeight2";
  v41 = NSNumber;
  [(PKTextInputSettings *)self slidingCanvasHeight];
  v42 = objc_msgSend(v41, "numberWithDouble:");
  v110[60] = v42;
  v109[61] = @"useSingleComponentCanvas";
  v43 = objc_msgSend(NSNumber, "numberWithBool:", -[PKTextInputSettings useSingleComponentCanvas](self, "useSingleComponentCanvas"));
  v110[61] = v43;
  v109[62] = @"useLargeHitTestArea";
  v44 = objc_msgSend(NSNumber, "numberWithBool:", -[PKTextInputSettings useLargeHitTestArea](self, "useLargeHitTestArea"));
  v110[62] = v44;
  v109[63] = @"strongCursorMaximumYDistance";
  v45 = NSNumber;
  [(PKTextInputSettings *)self strongCursorMaximumYDistance];
  v46 = objc_msgSend(v45, "numberWithDouble:");
  v110[63] = v46;
  v109[64] = @"useTransformStrokesAnimation2";
  v47 = objc_msgSend(NSNumber, "numberWithBool:", -[PKTextInputSettings useTransformStrokesAnimation](self, "useTransformStrokesAnimation"));
  v110[64] = v47;
  v109[65] = @"emojiConversionDelay";
  v48 = NSNumber;
  [(PKTextInputSettings *)self emojiConversionDelay];
  v49 = objc_msgSend(v48, "numberWithDouble:");
  v110[65] = v49;
  v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v110 forKeys:v109 count:66];

  return v50;
}

- (void)loadSettingsFromDictionary:(id)a3
{
  id v137 = a3;
  if (v137)
  {
    BOOL v4 = [v137 objectForKeyedSubscript:@"textInputViewHitTestSlackHorizontal"];

    if (v4)
    {
      BOOL v5 = [v137 objectForKeyedSubscript:@"textInputViewHitTestSlackHorizontal"];
      [v5 doubleValue];
      -[PKTextInputSettings setTextInputViewHitTestSlackHorizontal:](self, "setTextInputViewHitTestSlackHorizontal:");
    }
    uint64_t v6 = [v137 objectForKeyedSubscript:@"textInputViewHitTestSlackVertical"];

    if (v6)
    {
      uint64_t v7 = [v137 objectForKeyedSubscript:@"textInputViewHitTestSlackVertical"];
      [v7 doubleValue];
      -[PKTextInputSettings setTextInputViewHitTestSlackVertical:](self, "setTextInputViewHitTestSlackVertical:");
    }
    int v8 = [v137 objectForKeyedSubscript:@"firstResponderAttractionHorizontal"];

    if (v8)
    {
      uint64_t v9 = [v137 objectForKeyedSubscript:@"firstResponderAttractionHorizontal"];
      [v9 doubleValue];
      -[PKTextInputSettings setFirstResponderAttractionHorizontal:](self, "setFirstResponderAttractionHorizontal:");
    }
    uint64_t v10 = [v137 objectForKeyedSubscript:@"firstResponderAttractionVertical"];

    if (v10)
    {
      v11 = [v137 objectForKeyedSubscript:@"firstResponderAttractionVertical"];
      [v11 doubleValue];
      -[PKTextInputSettings setFirstResponderAttractionVertical:](self, "setFirstResponderAttractionVertical:");
    }
    v12 = [v137 objectForKeyedSubscript:@"minimumWritingSpaceWidth"];

    if (v12)
    {
      v13 = [v137 objectForKeyedSubscript:@"minimumWritingSpaceWidth"];
      [v13 doubleValue];
      -[PKTextInputSettings setMinimumWritingSpaceWidth:](self, "setMinimumWritingSpaceWidth:");
    }
    v14 = [v137 objectForKeyedSubscript:@"subwordGestureEndingSpeedRange"];

    if (v14)
    {
      v15 = [v137 objectForKeyedSubscript:@"subwordGestureEndingSpeedRange"];
      [v15 doubleValue];
      -[PKTextInputSettings setSubwordGestureEndingSpeedRange:](self, "setSubwordGestureEndingSpeedRange:");
    }
    v16 = [v137 objectForKeyedSubscript:@"subwordGestureSpeedThreshold"];

    if (v16)
    {
      v17 = [v137 objectForKeyedSubscript:@"subwordGestureSpeedThreshold"];
      [v17 doubleValue];
      -[PKTextInputSettings setSubwordGestureSpeedThreshold:](self, "setSubwordGestureSpeedThreshold:");
    }
    v18 = [v137 objectForKeyedSubscript:@"preventLeftoverCharsInSubwordGestures"];

    if (v18)
    {
      v19 = [v137 objectForKeyedSubscript:@"preventLeftoverCharsInSubwordGestures"];
      -[PKTextInputSettings setPreventLeftoverCharsInSubwordGestures:](self, "setPreventLeftoverCharsInSubwordGestures:", [v19 BOOLValue]);
    }
    v20 = [v137 objectForKeyedSubscript:@"interactionDisablingDelay"];

    if (v20)
    {
      v21 = [v137 objectForKeyedSubscript:@"interactionDisablingDelay"];
      [v21 doubleValue];
      -[PKTextInputSettings setInteractionDisablingDelay:](self, "setInteractionDisablingDelay:");
    }
    v22 = [v137 objectForKeyedSubscript:@"textInputStrokeFadeOutDelay"];

    if (v22)
    {
      v23 = [v137 objectForKeyedSubscript:@"textInputStrokeFadeOutDelay"];
      [v23 doubleValue];
      -[PKTextInputSettings setTextInputStrokeFadeOutDelay:](self, "setTextInputStrokeFadeOutDelay:");
    }
    v24 = [v137 objectForKeyedSubscript:@"textInputStrokeFadeOutDuration"];

    if (v24)
    {
      v25 = [v137 objectForKeyedSubscript:@"textInputStrokeFadeOutDuration"];
      [v25 doubleValue];
      -[PKTextInputSettings setTextInputStrokeFadeOutDuration:](self, "setTextInputStrokeFadeOutDuration:");
    }
    v26 = [v137 objectForKeyedSubscript:@"continuousRecognitionWritingInterval"];

    if (v26)
    {
      v27 = [v137 objectForKeyedSubscript:@"continuousRecognitionWritingInterval"];
      [v27 doubleValue];
      -[PKTextInputSettings setContinuousRecognitionWritingInterval:](self, "setContinuousRecognitionWritingInterval:");
    }
    v28 = [v137 objectForKeyedSubscript:@"continuousRecognition"];

    if (v28)
    {
      v29 = [v137 objectForKeyedSubscript:@"continuousRecognition"];
      -[PKTextInputSettings setContinuousRecognition:](self, "setContinuousRecognition:", [v29 BOOLValue]);
    }
    v30 = [v137 objectForKeyedSubscript:@"recognitionCoalescingDelay"];

    if (v30)
    {
      v31 = [v137 objectForKeyedSubscript:@"recognitionCoalescingDelay"];
      [v31 doubleValue];
      -[PKTextInputSettings setRecognitionCoalescingDelay:](self, "setRecognitionCoalescingDelay:");
    }
    v32 = [v137 objectForKeyedSubscript:@"outOfProcessRecognition"];

    if (v32)
    {
      v33 = [v137 objectForKeyedSubscript:@"outOfProcessRecognition"];
      -[PKTextInputSettings setOutOfProcessRecognition:](self, "setOutOfProcessRecognition:", [v33 BOOLValue]);
    }
    v34 = [v137 objectForKeyedSubscript:@"activePreviewEnabled"];

    if (v34)
    {
      v35 = [v137 objectForKeyedSubscript:@"activePreviewEnabled"];
      -[PKTextInputSettings setActivePreviewEnabled:](self, "setActivePreviewEnabled:", [v35 BOOLValue]);
    }
    v36 = [v137 objectForKeyedSubscript:@"styledActivePreview"];

    if (v36)
    {
      v37 = [v137 objectForKeyedSubscript:@"styledActivePreview"];
      -[PKTextInputSettings setStyledActivePreview:](self, "setStyledActivePreview:", [v37 BOOLValue]);
    }
    v38 = [v137 objectForKeyedSubscript:@"floatingBackgroundEnabled"];

    if (v38)
    {
      v39 = [v137 objectForKeyedSubscript:@"floatingBackgroundEnabled"];
      -[PKTextInputSettings setFloatingBackgroundEnabled:](self, "setFloatingBackgroundEnabled:", [v39 BOOLValue]);
    }
    v40 = [v137 objectForKeyedSubscript:@"textInputStandardCommitDelay"];

    if (v40)
    {
      v41 = [v137 objectForKeyedSubscript:@"textInputStandardCommitDelay"];
      [v41 doubleValue];
      -[PKTextInputSettings setTextInputStandardCommitDelay:](self, "setTextInputStandardCommitDelay:");
    }
    v42 = [v137 objectForKeyedSubscript:@"singleCharacterCommitDelay"];

    if (v42)
    {
      v43 = [v137 objectForKeyedSubscript:@"singleCharacterCommitDelay"];
      [v43 doubleValue];
      -[PKTextInputSettings setSingleCharacterCommitDelay:](self, "setSingleCharacterCommitDelay:");
    }
    v44 = [v137 objectForKeyedSubscript:@"incrementalCommitWordsBack"];

    if (v44)
    {
      v45 = [v137 objectForKeyedSubscript:@"incrementalCommitWordsBack"];
      [v45 doubleValue];
      [(PKTextInputSettings *)self setIncrementalCommitWordsBack:(uint64_t)v46];
    }
    v47 = [v137 objectForKeyedSubscript:@"debugRecognitionRequestArtificialDelay"];

    if (v47)
    {
      v48 = [v137 objectForKeyedSubscript:@"debugRecognitionRequestArtificialDelay"];
      [v48 doubleValue];
      -[PKTextInputSettings setDebugRecognitionRequestArtificialDelay:](self, "setDebugRecognitionRequestArtificialDelay:");
    }
    v49 = [v137 objectForKeyedSubscript:@"debugElementFinderArtificialDelay"];

    if (v49)
    {
      v50 = [v137 objectForKeyedSubscript:@"debugElementFinderArtificialDelay"];
      [v50 doubleValue];
      -[PKTextInputSettings setDebugElementFinderArtificialDelay:](self, "setDebugElementFinderArtificialDelay:");
    }
    v51 = [v137 objectForKeyedSubscript:@"debugFirstResponderArtificialDelay"];

    if (v51)
    {
      v52 = [v137 objectForKeyedSubscript:@"debugFirstResponderArtificialDelay"];
      [v52 doubleValue];
      -[PKTextInputSettings setDebugFirstResponderArtificialDelay:](self, "setDebugFirstResponderArtificialDelay:");
    }
    v53 = [v137 objectForKeyedSubscript:@"enableOnNonEditableViews"];

    if (v53)
    {
      v54 = [v137 objectForKeyedSubscript:@"enableOnNonEditableViews"];
      -[PKTextInputSettings setEnableOnNonEditableViews:](self, "setEnableOnNonEditableViews:", [v54 BOOLValue]);
    }
    v55 = [v137 objectForKeyedSubscript:@"enableOnRemoteViews"];

    if (v55)
    {
      v56 = [v137 objectForKeyedSubscript:@"enableOnRemoteViews"];
      -[PKTextInputSettings setEnableOnRemoteViews:](self, "setEnableOnRemoteViews:", [v56 BOOLValue]);
    }
    v57 = [v137 objectForKeyedSubscript:@"enableViewControllerSupport"];

    if (v57)
    {
      v58 = [v137 objectForKeyedSubscript:@"enableViewControllerSupport"];
      -[PKTextInputSettings setEnableViewControllerSupport:](self, "setEnableViewControllerSupport:", [v58 BOOLValue]);
    }
    v59 = [v137 objectForKeyedSubscript:@"UCBPaletteEnabledNewKey"];

    if (v59)
    {
      v60 = [v137 objectForKeyedSubscript:@"UCBPaletteEnabledNewKey"];
      -[PKTextInputSettings setUCBPaletteEnabled:](self, "setUCBPaletteEnabled:", [v60 BOOLValue]);
    }
    v61 = [v137 objectForKeyedSubscript:@"alwaysIncludeReturnKeyAndInputAssistantItems"];

    if (v61)
    {
      v62 = [v137 objectForKeyedSubscript:@"alwaysIncludeReturnKeyAndInputAssistantItems"];
      -[PKTextInputSettings setAlwaysIncludeReturnKeyAndInputAssistantItems:](self, "setAlwaysIncludeReturnKeyAndInputAssistantItems:", [v62 BOOLValue]);
    }
    v63 = [v137 objectForKeyedSubscript:@"hideDefaultReturnKeyWhenSpecialReturnKeyIsPresent2"];

    if (v63)
    {
      v64 = [v137 objectForKeyedSubscript:@"hideDefaultReturnKeyWhenSpecialReturnKeyIsPresent2"];
      -[PKTextInputSettings setHideDefaultReturnKeyWhenSpecialReturnKeyIsPresent:](self, "setHideDefaultReturnKeyWhenSpecialReturnKeyIsPresent:", [v64 BOOLValue]);
    }
    v65 = [v137 objectForKeyedSubscript:@"enableReserveSpace"];

    if (v65)
    {
      v66 = [v137 objectForKeyedSubscript:@"enableReserveSpace"];
      -[PKTextInputSettings setEnableReserveSpace:](self, "setEnableReserveSpace:", [v66 BOOLValue]);
    }
    v67 = [v137 objectForKeyedSubscript:@"enableReserveSpaceTapForNewlines"];

    if (v67)
    {
      v68 = [v137 objectForKeyedSubscript:@"enableReserveSpaceTapForNewlines"];
      -[PKTextInputSettings setEnableReserveSpaceTapForNewlines:](self, "setEnableReserveSpaceTapForNewlines:", [v68 BOOLValue]);
    }
    v69 = [v137 objectForKeyedSubscript:@"asyncElementRequestTimeout"];

    if (v69)
    {
      v70 = [v137 objectForKeyedSubscript:@"asyncElementRequestTimeout"];
      [v70 doubleValue];
      [(PKTextInputSettings *)self setAsyncElementRequestTimeout:"setAsyncElementRequestTimeout:"];
    }
    v71 = [v137 objectForKeyedSubscript:@"drawingGestureMinimumPanDistanceThreshold"];

    if (v71)
    {
      v72 = [v137 objectForKeyedSubscript:@"drawingGestureMinimumPanDistanceThreshold"];
      [v72 doubleValue];
      -[PKTextInputSettings setDrawingGestureMinimumPanDistanceThreshold:](self, "setDrawingGestureMinimumPanDistanceThreshold:");
    }
    v73 = [v137 objectForKeyedSubscript:@"drawingGestureMinimumScrollDistanceThreshold"];

    if (v73)
    {
      v74 = [v137 objectForKeyedSubscript:@"drawingGestureMinimumScrollDistanceThreshold"];
      [v74 doubleValue];
      -[PKTextInputSettings setDrawingGestureMinimumScrollDistanceThreshold:](self, "setDrawingGestureMinimumScrollDistanceThreshold:");
    }
    v75 = [v137 objectForKeyedSubscript:@"drawingGestureTapDetectionTimeInterval2"];

    if (v75)
    {
      v76 = [v137 objectForKeyedSubscript:@"drawingGestureTapDetectionTimeInterval2"];
      [v76 doubleValue];
      -[PKTextInputSettings setDrawingGestureTapDetectionTimeInterval:](self, "setDrawingGestureTapDetectionTimeInterval:");
    }
    v77 = [v137 objectForKeyedSubscript:@"drawingGestureTapDetectionDistanceThreshold3"];

    if (v77)
    {
      v78 = [v137 objectForKeyedSubscript:@"drawingGestureTapDetectionDistanceThreshold3"];
      [v78 doubleValue];
      -[PKTextInputSettings setDrawingGestureTapDetectionDistanceThreshold:](self, "setDrawingGestureTapDetectionDistanceThreshold:");
    }
    v79 = [v137 objectForKeyedSubscript:@"drawingGestureDetectTapAwayFromCurrentStrokesHorizontalDistance"];

    if (v79)
    {
      v80 = [v137 objectForKeyedSubscript:@"drawingGestureDetectTapAwayFromCurrentStrokesHorizontalDistance"];
      [v80 doubleValue];
      -[PKTextInputSettings setDrawingGestureDetectTapAwayFromCurrentStrokesHorizontalDistance:](self, "setDrawingGestureDetectTapAwayFromCurrentStrokesHorizontalDistance:");
    }
    v81 = [v137 objectForKeyedSubscript:@"drawingGestureDetectTapAwayFromCurrentStrokesVerticalDistance"];

    if (v81)
    {
      v82 = [v137 objectForKeyedSubscript:@"drawingGestureDetectTapAwayFromCurrentStrokesVerticalDistance"];
      [v82 doubleValue];
      -[PKTextInputSettings setDrawingGestureDetectTapAwayFromCurrentStrokesVerticalDistance:](self, "setDrawingGestureDetectTapAwayFromCurrentStrokesVerticalDistance:");
    }
    v83 = [v137 objectForKeyedSubscript:@"drawingGestureLongPressMaxDistance"];

    if (v83)
    {
      v84 = [v137 objectForKeyedSubscript:@"drawingGestureLongPressMaxDistance"];
      [v84 doubleValue];
      -[PKTextInputSettings setDrawingGestureLongPressMaxDistance:](self, "setDrawingGestureLongPressMaxDistance:");
    }
    v85 = [v137 objectForKeyedSubscript:@"drawingGestureLongPressDetectionTimeInterval"];

    if (v85)
    {
      v86 = [v137 objectForKeyedSubscript:@"drawingGestureLongPressDetectionTimeInterval"];
      [v86 doubleValue];
      -[PKTextInputSettings setDrawingGestureLongPressDetectionTimeInterval:](self, "setDrawingGestureLongPressDetectionTimeInterval:");
    }
    v87 = [v137 objectForKeyedSubscript:@"inkWeight"];

    if (v87)
    {
      v88 = [v137 objectForKeyedSubscript:@"inkWeight"];
      [v88 doubleValue];
      -[PKTextInputSettings setInkWeight:](self, "setInkWeight:");
    }
    v89 = [v137 objectForKeyedSubscript:@"inkWeightForIncreasedContrast"];

    if (v89)
    {
      v90 = [v137 objectForKeyedSubscript:@"inkWeightForIncreasedContrast"];
      [v90 doubleValue];
      -[PKTextInputSettings setInkWeightForIncreasedContrast:](self, "setInkWeightForIncreasedContrast:");
    }
    v91 = [v137 objectForKeyedSubscript:@"lineBreakOnTapEnabled"];

    if (v91)
    {
      v92 = [v137 objectForKeyedSubscript:@"lineBreakOnTapEnabled"];
      -[PKTextInputSettings setLineBreakOnTapEnabled:](self, "setLineBreakOnTapEnabled:", [v92 BOOLValue]);
    }
    v93 = [v137 objectForKeyedSubscript:@"lineBreakVerticalBarGestureEnabled"];

    if (v93)
    {
      v94 = [v137 objectForKeyedSubscript:@"lineBreakVerticalBarGestureEnabled"];
      -[PKTextInputSettings setLineBreakVerticalBarGestureEnabled:](self, "setLineBreakVerticalBarGestureEnabled:", [v94 BOOLValue]);
    }
    v95 = [v137 objectForKeyedSubscript:@"lineBreakVerticalBarUpToDelete"];

    if (v95)
    {
      v96 = [v137 objectForKeyedSubscript:@"lineBreakVerticalBarUpToDelete"];
      -[PKTextInputSettings setLineBreakVerticalBarUpToDelete:](self, "setLineBreakVerticalBarUpToDelete:", [v96 BOOLValue]);
    }
    v97 = [v137 objectForKeyedSubscript:@"autoLineBreakEnabled2"];

    if (v97)
    {
      v98 = [v137 objectForKeyedSubscript:@"autoLineBreakEnabled2"];
      -[PKTextInputSettings setAutoLineBreakEnabled:](self, "setAutoLineBreakEnabled:", [v98 BOOLValue]);
    }
    v99 = [v137 objectForKeyedSubscript:@"autoLineBreakRequireWeakCursor2"];

    if (v99)
    {
      v100 = [v137 objectForKeyedSubscript:@"autoLineBreakRequireWeakCursor2"];
      -[PKTextInputSettings setAutoLineBreakRequireWeakCursor:](self, "setAutoLineBreakRequireWeakCursor:", [v100 BOOLValue]);
    }
    v101 = [v137 objectForKeyedSubscript:@"autoLineBreakVerticalDistance2"];

    if (v101)
    {
      v102 = [v137 objectForKeyedSubscript:@"autoLineBreakVerticalDistance2"];
      [v102 doubleValue];
      -[PKTextInputSettings setAutoLineBreakVerticalDistance:](self, "setAutoLineBreakVerticalDistance:");
    }
    v103 = [v137 objectForKeyedSubscript:@"autoLineBreakDualVerticalDistance2"];

    if (v103)
    {
      v104 = [v137 objectForKeyedSubscript:@"autoLineBreakDualVerticalDistance2"];
      [v104 doubleValue];
      -[PKTextInputSettings setAutoLineBreakDualVerticalDistance:](self, "setAutoLineBreakDualVerticalDistance:");
    }
    v105 = [v137 objectForKeyedSubscript:@"autoLineBreakAreaWidthFactor3"];

    if (v105)
    {
      v106 = [v137 objectForKeyedSubscript:@"autoLineBreakAreaWidthFactor3"];
      [v106 doubleValue];
      -[PKTextInputSettings setAutoLineBreakAreaWidthFactor:](self, "setAutoLineBreakAreaWidthFactor:");
    }
    v107 = [v137 objectForKeyedSubscript:@"tapToLineBreakVerticalDistance2"];

    if (v107)
    {
      v108 = [v137 objectForKeyedSubscript:@"tapToLineBreakVerticalDistance2"];
      [v108 doubleValue];
      -[PKTextInputSettings setTapToLineBreakVerticalDistance:](self, "setTapToLineBreakVerticalDistance:");
    }
    v109 = [v137 objectForKeyedSubscript:@"enableWeakCursor"];

    if (v109)
    {
      v110 = [v137 objectForKeyedSubscript:@"enableWeakCursor"];
      -[PKTextInputSettings setEnableWeakCursor:](self, "setEnableWeakCursor:", [v110 BOOLValue]);
    }
    v111 = [v137 objectForKeyedSubscript:@"weakCursorVisibilityTimeout"];

    if (v111)
    {
      v112 = [v137 objectForKeyedSubscript:@"weakCursorVisibilityTimeout"];
      [v112 doubleValue];
      [(PKTextInputSettings *)self setWeakCursorVisibilityTimeout:"setWeakCursorVisibilityTimeout:"];
    }
    v113 = [v137 objectForKeyedSubscript:@"strongCursorRestoreDelay"];

    if (v113)
    {
      v114 = [v137 objectForKeyedSubscript:@"strongCursorRestoreDelay"];
      [v114 doubleValue];
      -[PKTextInputSettings setStrongCursorRestoreDelay:](self, "setStrongCursorRestoreDelay:");
    }
    v115 = [v137 objectForKeyedSubscript:@"scratchOutMakesTheCursorStrong"];

    if (v115)
    {
      v116 = [v137 objectForKeyedSubscript:@"scratchOutMakesTheCursorStrong"];
      -[PKTextInputSettings setScratchOutMakesTheCursorStrong:](self, "setScratchOutMakesTheCursorStrong:", [v116 BOOLValue]);
    }
    v117 = [v137 objectForKeyedSubscript:@"enableTargetedAppWorkarounds"];

    if (v117)
    {
      v118 = [v137 objectForKeyedSubscript:@"enableTargetedAppWorkarounds"];
      -[PKTextInputSettings setEnableTargetedAppWorkarounds:](self, "setEnableTargetedAppWorkarounds:", [v118 BOOLValue]);
    }
    v119 = [v137 objectForKeyedSubscript:@"useSlidingCanvas"];

    if (v119)
    {
      v120 = [v137 objectForKeyedSubscript:@"useSlidingCanvas"];
      -[PKTextInputSettings setUseSlidingCanvas:](self, "setUseSlidingCanvas:", [v120 BOOLValue]);
    }
    v121 = [v137 objectForKeyedSubscript:@"slidingCanvasDebugBorder"];

    if (v121)
    {
      v122 = [v137 objectForKeyedSubscript:@"slidingCanvasDebugBorder"];
      -[PKTextInputSettings setSlidingCanvasDebugBorder:](self, "setSlidingCanvasDebugBorder:", [v122 BOOLValue]);
    }
    v123 = [v137 objectForKeyedSubscript:@"slidingCanvasWidth2"];

    if (v123)
    {
      v124 = [v137 objectForKeyedSubscript:@"slidingCanvasWidth2"];
      [v124 doubleValue];
      -[PKTextInputSettings setSlidingCanvasWidth:](self, "setSlidingCanvasWidth:");
    }
    v125 = [v137 objectForKeyedSubscript:@"slidingCanvasHeight2"];

    if (v125)
    {
      v126 = [v137 objectForKeyedSubscript:@"slidingCanvasHeight2"];
      [v126 doubleValue];
      -[PKTextInputSettings setSlidingCanvasHeight:](self, "setSlidingCanvasHeight:");
    }
    v127 = [v137 objectForKeyedSubscript:@"useSingleComponentCanvas"];

    if (v127)
    {
      v128 = [v137 objectForKeyedSubscript:@"useSingleComponentCanvas"];
      -[PKTextInputSettings setUseSingleComponentCanvas:](self, "setUseSingleComponentCanvas:", [v128 BOOLValue]);
    }
    v129 = [v137 objectForKeyedSubscript:@"useLargeHitTestArea"];

    if (v129)
    {
      v130 = [v137 objectForKeyedSubscript:@"useLargeHitTestArea"];
      -[PKTextInputSettings setUseLargeHitTestArea:](self, "setUseLargeHitTestArea:", [v130 BOOLValue]);
    }
    v131 = [v137 objectForKeyedSubscript:@"strongCursorMaximumYDistance"];

    if (v131)
    {
      v132 = [v137 objectForKeyedSubscript:@"strongCursorMaximumYDistance"];
      [v132 doubleValue];
      -[PKTextInputSettings setStrongCursorMaximumYDistance:](self, "setStrongCursorMaximumYDistance:");
    }
    v133 = [v137 objectForKeyedSubscript:@"useTransformStrokesAnimation2"];

    if (v133)
    {
      v134 = [v137 objectForKeyedSubscript:@"useTransformStrokesAnimation2"];
      -[PKTextInputSettings setUseTransformStrokesAnimation:](self, "setUseTransformStrokesAnimation:", [v134 BOOLValue]);
    }
    v135 = [v137 objectForKeyedSubscript:@"emojiConversionDelay"];

    if (v135)
    {
      v136 = [v137 objectForKeyedSubscript:@"emojiConversionDelay"];
      [v136 doubleValue];
      -[PKTextInputSettings setEmojiConversionDelay:](self, "setEmojiConversionDelay:");
    }
  }
}

- (void)loadSettingsFromUserDefaults
{
  v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v4 = [v3 dictionaryForKey:@"com.apple.PencilKit.TextInputDefaults"];

  [(PKTextInputSettings *)self loadSettingsFromDictionary:v4];
}

- (void)saveSettingsToUserDefaults
{
  if ([(PKTextInputSettings *)self _shouldSaveSettings])
  {
    id v4 = [(PKTextInputSettings *)self settingsDictionaryRepresentation];
    v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v3 setObject:v4 forKey:@"com.apple.PencilKit.TextInputDefaults" inDomain:*MEMORY[0x1E4F283E0]];
  }
}

- (void)resetToDefaultValues
{
  [(PKTextInputSettings *)self _loadDefaultValues];
  if ([(PKTextInputSettings *)self _shouldSaveSettings])
  {
    id v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v3 setObject:0 forKey:@"com.apple.PencilKit.TextInputDefaults" inDomain:*MEMORY[0x1E4F283E0]];
  }
}

- (id)availableRecognitionLocaleIdentifiers
{
  return +[PKTextInputLanguageSelectionController supportedAndEnabledLocaleIdentifiers];
}

- (BOOL)supportedKeyboardLocaleExists
{
  return +[PKTextInputLanguageSelectionController hasSomeSupportedAndEnabledLocale];
}

- (NSString)recognitionLocaleIdentifier
{
  id v2 = [(PKTextInputSettings *)self recognitionLocaleIdentifiers];
  id v3 = [v2 firstObject];

  return (NSString *)v3;
}

- (NSArray)recognitionLocaleIdentifiers
{
  if ([(PKTextInputSettings *)self _isFeatureAvailableAndEnabled])
  {
    id v2 = +[PKTextInputLanguageSelectionController sharedInstance];
    id v3 = [v2 currentLanguageIdentifiers];
  }
  else
  {
    id v3 = 0;
  }

  return (NSArray *)v3;
}

- (void)_loadDefaultValues
{
  [(PKTextInputSettings *)self setTextInputViewHitTestSlackHorizontal:10.0];
  [(PKTextInputSettings *)self setTextInputViewHitTestSlackVertical:30.0];
  [(PKTextInputSettings *)self setFirstResponderAttractionHorizontal:30.0];
  [(PKTextInputSettings *)self setFirstResponderAttractionVertical:60.0];
  [(PKTextInputSettings *)self setMinimumWritingSpaceWidth:60.0];
  [(PKTextInputSettings *)self setSubwordGestureEndingSpeedRange:0.8];
  [(PKTextInputSettings *)self setSubwordGestureSpeedThreshold:50.0];
  [(PKTextInputSettings *)self setPreventLeftoverCharsInSubwordGestures:0];
  [(PKTextInputSettings *)self setInteractionDisablingDelay:15.0];
  [(PKTextInputSettings *)self setOutOfProcessRecognition:1];
  [(PKTextInputSettings *)self setTextInputStrokeFadeOutDuration:0.3];
  [(PKTextInputSettings *)self setTextInputStrokeFadeOutDelay:0.0];
  [(PKTextInputSettings *)self setContinuousRecognition:1];
  [(PKTextInputSettings *)self setContinuousRecognitionWritingInterval:1.0];
  [(PKTextInputSettings *)self setRecognitionCoalescingDelay:0.3];
  [(PKTextInputSettings *)self setActivePreviewEnabled:0];
  [(PKTextInputSettings *)self setStyledActivePreview:0];
  [(PKTextInputSettings *)self setFloatingBackgroundEnabled:0];
  [(PKTextInputSettings *)self setTextInputStandardCommitDelay:0.7];
  [(PKTextInputSettings *)self setSingleCharacterCommitDelay:0.5];
  [(PKTextInputSettings *)self setIncrementalCommitWordsBack:1];
  [(PKTextInputSettings *)self setDebugRecognitionRequestArtificialDelay:0.0];
  [(PKTextInputSettings *)self setDebugElementFinderArtificialDelay:0.0];
  [(PKTextInputSettings *)self setDebugFirstResponderArtificialDelay:0.0];
  [(PKTextInputSettings *)self setEnableOnNonEditableViews:0];
  [(PKTextInputSettings *)self setEnableOnRemoteViews:1];
  [(PKTextInputSettings *)self setEnableViewControllerSupport:0];
  [(PKTextInputSettings *)self setEnableReserveSpace:1];
  [(PKTextInputSettings *)self setEnableReserveSpaceTapForNewlines:0];
  [(PKTextInputSettings *)self setUCBPaletteEnabled:1];
  [(PKTextInputSettings *)self setAlwaysIncludeReturnKeyAndInputAssistantItems:0];
  [(PKTextInputSettings *)self setHideDefaultReturnKeyWhenSpecialReturnKeyIsPresent:1];
  [(PKTextInputSettings *)self setAsyncElementRequestTimeout:0.5];
  [(PKTextInputSettings *)self setDrawingGestureMinimumPanDistanceThreshold:16.0];
  [(PKTextInputSettings *)self setDrawingGestureMinimumScrollDistanceThreshold:80.0];
  [(PKTextInputSettings *)self setDrawingGestureTapDetectionTimeInterval:0.15];
  [(PKTextInputSettings *)self setDrawingGestureTapDetectionDistanceThreshold:5.25];
  [(PKTextInputSettings *)self setDrawingGestureDetectTapAwayFromCurrentStrokesHorizontalDistance:60.0];
  [(PKTextInputSettings *)self setDrawingGestureDetectTapAwayFromCurrentStrokesVerticalDistance:20.0];
  [(PKTextInputSettings *)self setDrawingGestureLongPressMaxDistance:4.0];
  [(PKTextInputSettings *)self setDrawingGestureLongPressDetectionTimeInterval:0.5];
  [(PKTextInputSettings *)self setInkWeight:-0.6];
  [(PKTextInputSettings *)self setInkWeightForIncreasedContrast:-0.4];
  [(PKTextInputSettings *)self setLineBreakOnTapEnabled:1];
  [(PKTextInputSettings *)self setLineBreakVerticalBarGestureEnabled:0];
  [(PKTextInputSettings *)self setLineBreakVerticalBarUpToDelete:1];
  [(PKTextInputSettings *)self setAutoLineBreakEnabled:1];
  [(PKTextInputSettings *)self setAutoLineBreakRequireWeakCursor:0];
  [(PKTextInputSettings *)self setAutoLineBreakVerticalDistance:120.0];
  [(PKTextInputSettings *)self setAutoLineBreakDualVerticalDistance:120.0];
  [(PKTextInputSettings *)self setAutoLineBreakAreaWidthFactor:0.1];
  [(PKTextInputSettings *)self setTapToLineBreakVerticalDistance:2.0];
  [(PKTextInputSettings *)self setEnableWeakCursor:1];
  [(PKTextInputSettings *)self setWeakCursorVisibilityTimeout:1.0];
  [(PKTextInputSettings *)self setStrongCursorRestoreDelay:1.0];
  [(PKTextInputSettings *)self setScratchOutMakesTheCursorStrong:1];
  [(PKTextInputSettings *)self setEnableTargetedAppWorkarounds:1];
  [(PKTextInputSettings *)self setUseSlidingCanvas:1];
  [(PKTextInputSettings *)self setSlidingCanvasDebugBorder:0];
  [(PKTextInputSettings *)self setSlidingCanvasWidth:640.0];
  [(PKTextInputSettings *)self setSlidingCanvasHeight:400.0];
  [(PKTextInputSettings *)self setUseSingleComponentCanvas:1];
  [(PKTextInputSettings *)self setUseLargeHitTestArea:0];
  [(PKTextInputSettings *)self setStrongCursorMaximumYDistance:120.0];
  [(PKTextInputSettings *)self setUseTransformStrokesAnimation:1];

  [(PKTextInputSettings *)self setEmojiConversionDelay:1.0];
}

- (void)_scheduleSavingSettingsSoon
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__scheduledSaveSettingsTriggered object:0];

  [(PKTextInputSettings *)self performSelector:sel__scheduledSaveSettingsTriggered withObject:0 afterDelay:0.1];
}

- (double)textInputViewHitTestSlackHorizontal
{
  return self->_textInputViewHitTestSlackHorizontal;
}

- (void)setTextInputViewHitTestSlackHorizontal:(double)a3
{
  self->_textInputViewHitTestSlackHorizontal = a3;
}

- (double)textInputViewHitTestSlackVertical
{
  return self->_textInputViewHitTestSlackVertical;
}

- (void)setTextInputViewHitTestSlackVertical:(double)a3
{
  self->_textInputViewHitTestSlackVertical = a3;
}

- (double)firstResponderAttractionHorizontal
{
  return self->_firstResponderAttractionHorizontal;
}

- (void)setFirstResponderAttractionHorizontal:(double)a3
{
  self->_firstResponderAttractionHorizontal = a3;
}

- (double)firstResponderAttractionVertical
{
  return self->_firstResponderAttractionVertical;
}

- (void)setFirstResponderAttractionVertical:(double)a3
{
  self->_firstResponderAttractionVertical = a3;
}

- (double)subwordGestureEndingSpeedRange
{
  return self->_subwordGestureEndingSpeedRange;
}

- (void)setSubwordGestureEndingSpeedRange:(double)a3
{
  self->_subwordGestureEndingSpeedRange = a3;
}

- (double)subwordGestureSpeedThreshold
{
  return self->_subwordGestureSpeedThreshold;
}

- (void)setSubwordGestureSpeedThreshold:(double)a3
{
  self->_subwordGestureSpeedThreshold = a3;
}

- (BOOL)preventLeftoverCharsInSubwordGestures
{
  return self->_preventLeftoverCharsInSubwordGestures;
}

- (void)setPreventLeftoverCharsInSubwordGestures:(BOOL)a3
{
  self->_preventLeftoverCharsInSubwordGestures = a3;
}

- (double)minimumWritingSpaceWidth
{
  return self->_minimumWritingSpaceWidth;
}

- (void)setMinimumWritingSpaceWidth:(double)a3
{
  self->_minimumWritingSpaceWidth = a3;
}

- (double)interactionDisablingDelay
{
  return self->_interactionDisablingDelay;
}

- (void)setInteractionDisablingDelay:(double)a3
{
  self->_interactionDisablingDelay = a3;
}

- (double)textInputStrokeFadeOutDelay
{
  return self->_textInputStrokeFadeOutDelay;
}

- (void)setTextInputStrokeFadeOutDelay:(double)a3
{
  self->_textInputStrokeFadeOutDelay = a3;
}

- (double)textInputStrokeFadeOutDuration
{
  return self->_textInputStrokeFadeOutDuration;
}

- (void)setTextInputStrokeFadeOutDuration:(double)a3
{
  self->_textInputStrokeFadeOutDuration = a3;
}

- (BOOL)activePreviewEnabled
{
  return self->_activePreviewEnabled;
}

- (void)setActivePreviewEnabled:(BOOL)a3
{
  self->_activePreviewEnabled = a3;
}

- (BOOL)styledActivePreview
{
  return self->_styledActivePreview;
}

- (void)setStyledActivePreview:(BOOL)a3
{
  self->_styledActivePreview = a3;
}

- (BOOL)floatingBackgroundEnabled
{
  return self->_floatingBackgroundEnabled;
}

- (void)setFloatingBackgroundEnabled:(BOOL)a3
{
  self->_floatingBackgroundEnabled = a3;
}

- (double)textInputStandardCommitDelay
{
  return self->_textInputStandardCommitDelay;
}

- (void)setTextInputStandardCommitDelay:(double)a3
{
  self->_textInputStandardCommitDelay = a3;
}

- (double)singleCharacterCommitDelay
{
  return self->_singleCharacterCommitDelay;
}

- (void)setSingleCharacterCommitDelay:(double)a3
{
  self->_singleCharacterCommitDelay = a3;
}

- (int64_t)incrementalCommitWordsBack
{
  return self->_incrementalCommitWordsBack;
}

- (void)setIncrementalCommitWordsBack:(int64_t)a3
{
  self->_incrementalCommitWordsBack = a3;
}

- (BOOL)continuousRecognition
{
  return self->_continuousRecognition;
}

- (void)setContinuousRecognition:(BOOL)a3
{
  self->_continuousRecognition = a3;
}

- (double)continuousRecognitionWritingInterval
{
  return self->_continuousRecognitionWritingInterval;
}

- (void)setContinuousRecognitionWritingInterval:(double)a3
{
  self->_continuousRecognitionWritingInterval = a3;
}

- (double)recognitionCoalescingDelay
{
  return self->_recognitionCoalescingDelay;
}

- (void)setRecognitionCoalescingDelay:(double)a3
{
  self->_recognitionCoalescingDelay = a3;
}

- (BOOL)outOfProcessRecognition
{
  return self->_outOfProcessRecognition;
}

- (void)setOutOfProcessRecognition:(BOOL)a3
{
  self->_outOfProcessRecognition = a3;
}

- (double)debugRecognitionRequestArtificialDelay
{
  return self->_debugRecognitionRequestArtificialDelay;
}

- (void)setDebugRecognitionRequestArtificialDelay:(double)a3
{
  self->_debugRecognitionRequestArtificialDelay = a3;
}

- (double)debugElementFinderArtificialDelay
{
  return self->_debugElementFinderArtificialDelay;
}

- (void)setDebugElementFinderArtificialDelay:(double)a3
{
  self->_debugElementFinderArtificialDelay = a3;
}

- (double)debugFirstResponderArtificialDelay
{
  return self->_debugFirstResponderArtificialDelay;
}

- (void)setDebugFirstResponderArtificialDelay:(double)a3
{
  self->_debugFirstResponderArtificialDelay = a3;
}

- (BOOL)enableOnNonEditableViews
{
  return self->_enableOnNonEditableViews;
}

- (void)setEnableOnNonEditableViews:(BOOL)a3
{
  self->_enableOnNonEditableViews = a3;
}

- (BOOL)enableOnRemoteViews
{
  return self->_enableOnRemoteViews;
}

- (void)setEnableOnRemoteViews:(BOOL)a3
{
  self->_enableOnRemoteViews = a3;
}

- (BOOL)enableViewControllerSupport
{
  return self->_enableViewControllerSupport;
}

- (void)setEnableViewControllerSupport:(BOOL)a3
{
  self->_enableViewControllerSupport = a3;
}

- (BOOL)enableReserveSpace
{
  return self->_enableReserveSpace;
}

- (void)setEnableReserveSpace:(BOOL)a3
{
  self->_enableReserveSpace = a3;
}

- (BOOL)enableReserveSpaceTapForNewlines
{
  return self->_enableReserveSpaceTapForNewlines;
}

- (void)setEnableReserveSpaceTapForNewlines:(BOOL)a3
{
  self->_enableReserveSpaceTapForNewlines = a3;
}

- (BOOL)UCBPaletteEnabled
{
  return self->_UCBPaletteEnabled;
}

- (void)setUCBPaletteEnabled:(BOOL)a3
{
  self->_UCBPaletteEnabled = a3;
}

- (BOOL)alwaysIncludeReturnKeyAndInputAssistantItems
{
  return self->_alwaysIncludeReturnKeyAndInputAssistantItems;
}

- (void)setAlwaysIncludeReturnKeyAndInputAssistantItems:(BOOL)a3
{
  self->_alwaysIncludeReturnKeyAndInputAssistantItems = a3;
}

- (BOOL)hideDefaultReturnKeyWhenSpecialReturnKeyIsPresent
{
  return self->_hideDefaultReturnKeyWhenSpecialReturnKeyIsPresent;
}

- (void)setHideDefaultReturnKeyWhenSpecialReturnKeyIsPresent:(BOOL)a3
{
  self->_hideDefaultReturnKeyWhenSpecialReturnKeyIsPresent = a3;
}

- (double)drawingGestureMinimumPanDistanceThreshold
{
  return self->_drawingGestureMinimumPanDistanceThreshold;
}

- (void)setDrawingGestureMinimumPanDistanceThreshold:(double)a3
{
  self->_drawingGestureMinimumPanDistanceThreshold = a3;
}

- (double)drawingGestureMinimumScrollDistanceThreshold
{
  return self->_drawingGestureMinimumScrollDistanceThreshold;
}

- (void)setDrawingGestureMinimumScrollDistanceThreshold:(double)a3
{
  self->_drawingGestureMinimumScrollDistanceThreshold = a3;
}

- (double)drawingGestureTapDetectionDistanceThreshold
{
  return self->_drawingGestureTapDetectionDistanceThreshold;
}

- (void)setDrawingGestureTapDetectionDistanceThreshold:(double)a3
{
  self->_drawingGestureTapDetectionDistanceThreshold = a3;
}

- (double)drawingGestureTapDetectionTimeInterval
{
  return self->_drawingGestureTapDetectionTimeInterval;
}

- (void)setDrawingGestureTapDetectionTimeInterval:(double)a3
{
  self->_drawingGestureTapDetectionTimeInterval = a3;
}

- (double)drawingGestureDetectTapAwayFromCurrentStrokesHorizontalDistance
{
  return self->_drawingGestureDetectTapAwayFromCurrentStrokesHorizontalDistance;
}

- (void)setDrawingGestureDetectTapAwayFromCurrentStrokesHorizontalDistance:(double)a3
{
  self->_drawingGestureDetectTapAwayFromCurrentStrokesHorizontalDistance = a3;
}

- (double)drawingGestureDetectTapAwayFromCurrentStrokesVerticalDistance
{
  return self->_drawingGestureDetectTapAwayFromCurrentStrokesVerticalDistance;
}

- (void)setDrawingGestureDetectTapAwayFromCurrentStrokesVerticalDistance:(double)a3
{
  self->_drawingGestureDetectTapAwayFromCurrentStrokesVerticalDistance = a3;
}

- (double)drawingGestureLongPressMaxDistance
{
  return self->_drawingGestureLongPressMaxDistance;
}

- (void)setDrawingGestureLongPressMaxDistance:(double)a3
{
  self->_drawingGestureLongPressMaxDistance = a3;
}

- (double)drawingGestureLongPressDetectionTimeInterval
{
  return self->_drawingGestureLongPressDetectionTimeInterval;
}

- (void)setDrawingGestureLongPressDetectionTimeInterval:(double)a3
{
  self->_drawingGestureLongPressDetectionTimeInterval = a3;
}

- (double)asyncElementRequestTimeout
{
  return self->_asyncElementRequestTimeout;
}

- (void)setAsyncElementRequestTimeout:(double)a3
{
  self->_asyncElementRequestTimeout = a3;
}

- (double)inkWeight
{
  return self->_inkWeight;
}

- (void)setInkWeight:(double)a3
{
  self->_inkWeight = a3;
}

- (double)inkWeightForIncreasedContrast
{
  return self->_inkWeightForIncreasedContrast;
}

- (void)setInkWeightForIncreasedContrast:(double)a3
{
  self->_inkWeightForIncreasedContrast = a3;
}

- (BOOL)lineBreakVerticalBarGestureEnabled
{
  return self->_lineBreakVerticalBarGestureEnabled;
}

- (void)setLineBreakVerticalBarGestureEnabled:(BOOL)a3
{
  self->_lineBreakVerticalBarGestureEnabled = a3;
}

- (BOOL)lineBreakVerticalBarUpToDelete
{
  return self->_lineBreakVerticalBarUpToDelete;
}

- (void)setLineBreakVerticalBarUpToDelete:(BOOL)a3
{
  self->_lineBreakVerticalBarUpToDelete = a3;
}

- (BOOL)autoLineBreakEnabled
{
  return self->_autoLineBreakEnabled;
}

- (void)setAutoLineBreakEnabled:(BOOL)a3
{
  self->_autoLineBreakEnabled = a3;
}

- (BOOL)autoLineBreakRequireWeakCursor
{
  return self->_autoLineBreakRequireWeakCursor;
}

- (void)setAutoLineBreakRequireWeakCursor:(BOOL)a3
{
  self->_autoLineBreakRequireWeakCursor = a3;
}

- (BOOL)lineBreakOnTapEnabled
{
  return self->_lineBreakOnTapEnabled;
}

- (void)setLineBreakOnTapEnabled:(BOOL)a3
{
  self->_lineBreakOnTapEnabled = a3;
}

- (double)autoLineBreakVerticalDistance
{
  return self->_autoLineBreakVerticalDistance;
}

- (void)setAutoLineBreakVerticalDistance:(double)a3
{
  self->_autoLineBreakVerticalDistance = a3;
}

- (double)autoLineBreakDualVerticalDistance
{
  return self->_autoLineBreakDualVerticalDistance;
}

- (void)setAutoLineBreakDualVerticalDistance:(double)a3
{
  self->_autoLineBreakDualVerticalDistance = a3;
}

- (double)autoLineBreakAreaWidthFactor
{
  return self->_autoLineBreakAreaWidthFactor;
}

- (void)setAutoLineBreakAreaWidthFactor:(double)a3
{
  self->_autoLineBreakAreaWidthFactor = a3;
}

- (double)tapToLineBreakVerticalDistance
{
  return self->_tapToLineBreakVerticalDistance;
}

- (void)setTapToLineBreakVerticalDistance:(double)a3
{
  self->_tapToLineBreakVerticalDistance = a3;
}

- (BOOL)enableWeakCursor
{
  return self->_enableWeakCursor;
}

- (void)setEnableWeakCursor:(BOOL)a3
{
  self->_enableWeakCursor = a3;
}

- (double)weakCursorVisibilityTimeout
{
  return self->_weakCursorVisibilityTimeout;
}

- (void)setWeakCursorVisibilityTimeout:(double)a3
{
  self->_weakCursorVisibilityTimeout = a3;
}

- (double)strongCursorRestoreDelay
{
  return self->_strongCursorRestoreDelay;
}

- (void)setStrongCursorRestoreDelay:(double)a3
{
  self->_strongCursorRestoreDelay = a3;
}

- (BOOL)scratchOutMakesTheCursorStrong
{
  return self->_scratchOutMakesTheCursorStrong;
}

- (void)setScratchOutMakesTheCursorStrong:(BOOL)a3
{
  self->_scratchOutMakesTheCursorStrong = a3;
}

- (BOOL)enableTargetedAppWorkarounds
{
  return self->_enableTargetedAppWorkarounds;
}

- (void)setEnableTargetedAppWorkarounds:(BOOL)a3
{
  self->_enableTargetedAppWorkarounds = a3;
}

- (BOOL)useLargeHitTestArea
{
  return self->_useLargeHitTestArea;
}

- (void)setUseLargeHitTestArea:(BOOL)a3
{
  self->_useLargeHitTestArea = a3;
}

- (double)strongCursorMaximumYDistance
{
  return self->_strongCursorMaximumYDistance;
}

- (void)setStrongCursorMaximumYDistance:(double)a3
{
  self->_strongCursorMaximumYDistance = a3;
}

- (BOOL)useSlidingCanvas
{
  return self->_useSlidingCanvas;
}

- (void)setUseSlidingCanvas:(BOOL)a3
{
  self->_useSlidingCanvas = a3;
}

- (BOOL)slidingCanvasDebugBorder
{
  return self->_slidingCanvasDebugBorder;
}

- (void)setSlidingCanvasDebugBorder:(BOOL)a3
{
  self->_slidingCanvasDebugBorder = a3;
}

- (double)slidingCanvasWidth
{
  return self->_slidingCanvasWidth;
}

- (void)setSlidingCanvasWidth:(double)a3
{
  self->_slidingCanvasWidth = a3;
}

- (double)slidingCanvasHeight
{
  return self->_slidingCanvasHeight;
}

- (void)setSlidingCanvasHeight:(double)a3
{
  self->_slidingCanvasHeight = a3;
}

- (BOOL)useSingleComponentCanvas
{
  return self->_useSingleComponentCanvas;
}

- (void)setUseSingleComponentCanvas:(BOOL)a3
{
  self->_useSingleComponentCanvas = a3;
}

- (BOOL)useTransformStrokesAnimation
{
  return self->_useTransformStrokesAnimation;
}

- (void)setUseTransformStrokesAnimation:(BOOL)a3
{
  self->_useTransformStrokesAnimation = a3;
}

- (BOOL)forceUserTextInputSettingEnabled
{
  return self->_forceUserTextInputSettingEnabled;
}

- (void)setForceUserTextInputSettingEnabled:(BOOL)a3
{
  self->_forceUserTextInputSettingEnabled = a3;
}

- (double)emojiConversionDelay
{
  return self->_emojiConversionDelay;
}

- (void)setEmojiConversionDelay:(double)a3
{
  self->_emojiConversionDelay = a3;
}

@end