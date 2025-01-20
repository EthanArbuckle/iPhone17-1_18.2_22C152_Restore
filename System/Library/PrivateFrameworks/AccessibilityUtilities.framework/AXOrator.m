@interface AXOrator
- (AVSpeechSynthesizer)speechSynthesizer;
- (AVSpeechUtterance)lastUtterance;
- (AXLanguageTag)lastUtteranceLanguageTag;
- (AXLanguageTaggedContent)selectedContent;
- (AXLanguageTaggedContent)speakingContent;
- (AXOrator)init;
- (AXOratorDelegate)delegate;
- (BOOL)_canSpeakTaggedContent:(id)a3;
- (BOOL)_changeSpeakingSpeed:(double)a3;
- (BOOL)_skipByUnit:(BOOL)a3 boundary:(unint64_t)a4;
- (BOOL)_successWithCode:(int64_t)a3 error:(id *)a4;
- (BOOL)canResumeWithContent:(id)a3;
- (BOOL)contentIsSpeakable;
- (BOOL)fastForwardWithBoundary:(unint64_t)a3;
- (BOOL)isFetchingAdditionalContent;
- (BOOL)isPaused;
- (BOOL)isProcessingContentForSpeech;
- (BOOL)isSpeaking;
- (BOOL)pauseSpeaking:(id *)a3;
- (BOOL)preferredLanguageWasSpecified;
- (BOOL)resumeSpeaking:(id *)a3;
- (BOOL)resumeSpeakingAfterDelay:(double)a3 error:(id *)a4;
- (BOOL)rewindWithBoundary:(unint64_t)a3;
- (BOOL)shouldSpeakNextItemOnResume;
- (BOOL)speakFaster;
- (BOOL)speakSlower;
- (BOOL)spellOutContent;
- (BOOL)startSpeakingWithPreferredLanguage:(id)a3 delayBeforeStart:(double)a4 error:(id *)a5;
- (BOOL)startSpeakingWithPreferredLanguage:(id)a3 error:(id *)a4;
- (BOOL)stopSpeaking:(id *)a3;
- (NSArray)speakingContentTokenRanges;
- (NSMutableArray)additionalContentToProcess;
- (NSMutableArray)speechSequenceItems;
- (NSString)content;
- (NSString)currentLanguageCode;
- (NSString)currentVoiceIdentifier;
- (NSString)lastUtteranceLanguageCode;
- (_NSRange)lastSpokenSubstringRange;
- (_NSRange)lastUtteranceSubstringRange;
- (double)audioSessionInactiveTimeout;
- (double)currentSpeechRateForAdjustment;
- (float)speechRate;
- (id)_getLangCodeForItem:(id)a3;
- (id)_speechSequenceItemsStartingAtContentLocation:(unint64_t)a3;
- (id)currentVoiceSelection;
- (int64_t)_currentTokenIndex:(BOOL)a3;
- (int64_t)speakingContext;
- (unint64_t)numberOfTokensToSkip;
- (void)_clearAllContentState;
- (void)_processAdditionalContentInPreparationForSpeech;
- (void)_respeakUtteranceIfNeeded;
- (void)_speakNextItemInSequence;
- (void)_speakNextTokenFromCurrentTokenIndex:(int64_t)a3 forward:(BOOL)a4 boundary:(unint64_t)a5;
- (void)_startSpeakingSequence;
- (void)_tokenizeContentIfNeeded;
- (void)_updateAudioSessionCategory;
- (void)_updateSequenceForSpellOutBehavior;
- (void)addAdditionalContentToSpeechQueue:(id)a3;
- (void)clearSelectedContent;
- (void)setAdditionalContentToProcess:(id)a3;
- (void)setAudioSessionInactiveTimeout:(double)a3;
- (void)setContent:(id)a3;
- (void)setCurrentLanguageCode:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsFetchingAdditionalContent:(BOOL)a3;
- (void)setIsProcessingContentForSpeech:(BOOL)a3;
- (void)setLastSpokenSubstringRange:(_NSRange)a3;
- (void)setLastUtterance:(id)a3;
- (void)setLastUtteranceLanguageCode:(id)a3;
- (void)setLastUtteranceLanguageTag:(id)a3;
- (void)setLastUtteranceSubstringRange:(_NSRange)a3;
- (void)setNumberOfTokensToSkip:(unint64_t)a3;
- (void)setPreferredLanguageWasSpecified:(BOOL)a3;
- (void)setSelectedContent:(id)a3;
- (void)setShouldSpeakNextItemOnResume:(BOOL)a3;
- (void)setSpeakingContent:(id)a3;
- (void)setSpeakingContentTokenRanges:(id)a3;
- (void)setSpeakingContext:(int64_t)a3;
- (void)setSpeechSequenceItems:(id)a3;
- (void)setSpeechSynthesizer:(id)a3;
- (void)setSpellOutContent:(BOOL)a3;
- (void)speakStatusWithLanguage:(id)a3 rate:(id)a4;
- (void)speechSynthesizer:(id)a3 didCancelSpeechUtterance:(id)a4;
- (void)speechSynthesizer:(id)a3 didContinueSpeechUtterance:(id)a4;
- (void)speechSynthesizer:(id)a3 didFinishSpeechUtterance:(id)a4;
- (void)speechSynthesizer:(id)a3 didPauseSpeechUtterance:(id)a4;
- (void)speechSynthesizer:(id)a3 didStartSpeechUtterance:(id)a4;
- (void)speechSynthesizer:(id)a3 willSpeakRangeOfSpeechString:(_NSRange)a4 utterance:(id)a5;
@end

@implementation AXOrator

- (AXOrator)init
{
  v12.receiver = self;
  v12.super_class = (Class)AXOrator;
  v2 = [(AXOrator *)&v12 init];
  v3 = v2;
  if (v2)
  {
    -[AXOrator setLastUtteranceSubstringRange:](v2, "setLastUtteranceSubstringRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
    -[AXOrator setLastSpokenSubstringRange:](v3, "setLastSpokenSubstringRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
    [(AXOrator *)v3 setSpeakingContext:0];
    v4 = [MEMORY[0x1E4F1CA48] array];
    [(AXOrator *)v3 setAdditionalContentToProcess:v4];

    objc_initWeak(&location, v3);
    v5 = +[AXSettings sharedInstance];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __16__AXOrator_init__block_invoke;
    v9[3] = &unk_1E5586A10;
    objc_copyWeak(&v10, &location);
    [v5 registerUpdateBlock:v9 forRetrieveSelector:sel_quickSpeakSpeakingRate withListener:v3];

    objc_destroyWeak(&v10);
    id v6 = objc_alloc_init(MEMORY[0x1E4F28E08]);
    v7 = (void *)ModifySpeechJobsLock;
    ModifySpeechJobsLock = (uint64_t)v6;

    objc_destroyWeak(&location);
  }
  return v3;
}

void __16__AXOrator_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _respeakUtteranceIfNeeded];
}

- (NSString)content
{
  v2 = [(AXOrator *)self selectedContent];
  v3 = [v2 content];

  return (NSString *)v3;
}

- (void)setContent:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = v4;
    id v6 = +[AXLanguageManager stringByReplacingFatWidthCharactersWithBasicCharacters:v4];

    v7 = [[AXLanguageTaggedContent alloc] initWithContent:v6];
    [(AXOrator *)self setSelectedContent:v7];
    v8 = AXLogSpokenContentTextProcessing();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_18D308000, v8, OS_LOG_TYPE_INFO, "Orator did set content. Will tag content now", v11, 2u);
    }

    v9 = [(AXOrator *)self selectedContent];
    [v9 tagContent];

    id v10 = [(AXOrator *)self selectedContent];
    self->_contentIsSpeakable = [(AXOrator *)self _canSpeakTaggedContent:v10];

    self->_isProcessingContentForSpeech = 1;
  }
  else
  {
    [(AXOrator *)self setSelectedContent:0];
    self->_contentIsSpeakable = 0;
    self->_isProcessingContentForSpeech = 0;
  }
}

- (void)addAdditionalContentToSpeechQueue:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(AXOrator *)self isProcessingContentForSpeech];
  if (v4 && v5)
  {
    uint64_t v6 = +[AXLanguageManager stringByReplacingFatWidthCharactersWithBasicCharacters:v4];

    v7 = [[AXLanguageTaggedContent alloc] initWithContent:v6];
    v8 = AXLogSpokenContentTextProcessing();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18D308000, v8, OS_LOG_TYPE_INFO, "Orator added additional content to queue. Will tag content now", buf, 2u);
    }

    [(AXLanguageTaggedContent *)v7 tagContent];
    [(id)ModifySpeechJobsLock lock];
    if ([(AXOrator *)self isProcessingContentForSpeech])
    {
      v9 = [(AXLanguageTaggedContent *)v7 tags];

      if (v9)
      {
        id v10 = [(AXOrator *)self additionalContentToProcess];
        v11 = [(AXLanguageTaggedContent *)v7 tags];
        [v10 addObjectsFromArray:v11];

        objc_super v12 = [(AXOrator *)self selectedContent];
        [v12 appendLanguageTaggedContent:v7];
      }
    }
    [(id)ModifySpeechJobsLock unlock];

    id v4 = (id)v6;
  }
  [(AXOrator *)self setIsFetchingAdditionalContent:0];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__AXOrator_addAdditionalContentToSpeechQueue___block_invoke;
  block[3] = &unk_1E5585F48;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __46__AXOrator_addAdditionalContentToSpeechQueue___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isSpeaking];
  if (result) {
    return result;
  }
  v3 = [*(id *)(a1 + 32) additionalContentToProcess];
  if ([v3 count]) {
    goto LABEL_5;
  }
  id v4 = [*(id *)(a1 + 32) speechSequenceItems];
  if ([v4 count])
  {

LABEL_5:
LABEL_6:
    BOOL v5 = *(void **)(a1 + 32);
    return [v5 _speakNextItemInSequence];
  }
  char v6 = [*(id *)(a1 + 32) isSpeaking];

  if (v6) {
    goto LABEL_6;
  }
  v7 = [*(id *)(a1 + 32) delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    v9 = [*(id *)(a1 + 32) delegate];
    [v9 oratorDidFinishSpeaking:*(void *)(a1 + 32)];
  }
  id v10 = *(void **)(a1 + 32);

  return [v10 _clearAllContentState];
}

- (NSString)currentVoiceIdentifier
{
  v3 = [(AXOrator *)self speechSequenceItems];
  if ([v3 count])
  {
    id v4 = [(AXOrator *)self speechSequenceItems];
    BOOL v5 = [v4 objectAtIndex:0];
    [(AXOrator *)self _getLangCodeForItem:v5];
  }
  else
  {
    id v4 = +[AXLanguageManager sharedInstance];
    BOOL v5 = [v4 dialectForSystemLanguage];
    [v5 specificLanguageID];
  char v6 = };

  v7 = [(AXOrator *)self lastUtteranceLanguageCode];

  if (v7)
  {
    uint64_t v8 = [(AXOrator *)self lastUtteranceLanguageCode];

    char v6 = (void *)v8;
  }
  v9 = +[AXSettings sharedInstance];
  id v10 = AXLanguageCanonicalFormToGeneralLanguage(v6);
  v11 = [v9 speechVoiceIdentifierForLanguage:v10 sourceKey:*MEMORY[0x1E4F481E0] exists:0];

  return (NSString *)v11;
}

- (BOOL)startSpeakingWithPreferredLanguage:(id)a3 error:(id *)a4
{
  return [(AXOrator *)self startSpeakingWithPreferredLanguage:a3 delayBeforeStart:a4 error:0.0];
}

- (BOOL)startSpeakingWithPreferredLanguage:(id)a3 delayBeforeStart:(double)a4 error:(id *)a5
{
  id v8 = a3;
  [(AXOrator *)self setCurrentLanguageCode:0];
  [(AXOrator *)self setPreferredLanguageWasSpecified:1];
  BOOL contentIsSpeakable = self->_contentIsSpeakable;
  if (self->_contentIsSpeakable)
  {
    if (!v8)
    {
      [(AXOrator *)self setPreferredLanguageWasSpecified:0];
      id v10 = [(AXOrator *)self selectedContent];
      v11 = [v10 primaryUnambiguousDialect];

      if (!v11)
      {
        objc_super v12 = [(AXOrator *)self selectedContent];
        v11 = [v12 primaryAmbiguousDialect];
      }
      id v8 = [v11 specificLanguageID];
    }
    v13 = [(AXOrator *)self speechSynthesizer];

    if (!v13)
    {
      id v14 = objc_alloc_init(MEMORY[0x1E4F15480]);
      [(AXOrator *)self setSpeechSynthesizer:v14];

      v15 = [(AXOrator *)self speechSynthesizer];
      [v15 setIsInternalSynth:1];

      uint64_t v16 = *MEMORY[0x1E4F481E0];
      v17 = [(AXOrator *)self speechSynthesizer];
      [v17 setSpeechSource:v16];

      v18 = [(AXOrator *)self speechSynthesizer];
      [v18 setDelegate:self];

      v19 = [(AXOrator *)self speechSynthesizer];
      [v19 setUsesApplicationAudioSession:0];

      [(AXOrator *)self _updateAudioSessionCategory];
    }
    int64_t v20 = [(AXOrator *)self speakingContext];
    if (a5 && v20 == 1) {
      self->_BOOL contentIsSpeakable = 0;
    }
    v21 = [(AXOrator *)self selectedContent];
    [v21 setUserPreferredLangID:v8];

    if (a4 == 0.0) {
      [(AXOrator *)self _startSpeakingSequence];
    }
    else {
      AXPerformBlockOnMainThreadAfterDelay();
    }
  }
  else if (a5)
  {
    *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AXOratorErrorDomain" code:1 userInfo:0];
  }

  return contentIsSpeakable;
}

uint64_t __70__AXOrator_startSpeakingWithPreferredLanguage_delayBeforeStart_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startSpeakingSequence];
}

- (BOOL)pauseSpeaking:(id *)a3
{
  BOOL v5 = [(AXOrator *)self speakingContent];

  if (v5)
  {
    if ([(AXOrator *)self isSpeaking])
    {
      char v6 = [(AXOrator *)self speechSynthesizer];
      int v7 = [v6 pauseSpeakingAtBoundary:0];

      if (v7) {
        uint64_t v8 = 0;
      }
      else {
        uint64_t v8 = 5;
      }
    }
    else
    {
      uint64_t v8 = 3;
    }
  }
  else
  {
    uint64_t v8 = 2;
  }

  return [(AXOrator *)self _successWithCode:v8 error:a3];
}

- (BOOL)stopSpeaking:(id *)a3
{
  id v4 = [(AXOrator *)self lastUtterance];
  [(AXOrator *)self _clearAllContentState];
  [(AXOrator *)self setLastUtterance:v4];
  BOOL v5 = [(AXOrator *)self speechSynthesizer];
  char v6 = [v5 stopSpeakingAtBoundary:0];

  return v6;
}

- (BOOL)resumeSpeaking:(id *)a3
{
  return [(AXOrator *)self resumeSpeakingAfterDelay:a3 error:0.0];
}

- (BOOL)resumeSpeakingAfterDelay:(double)a3 error:(id *)a4
{
  int v7 = [(AXOrator *)self speakingContent];

  if (v7)
  {
    if ([(AXOrator *)self isSpeaking])
    {
      uint64_t v8 = 4;
    }
    else
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __43__AXOrator_resumeSpeakingAfterDelay_error___block_invoke;
      aBlock[3] = &unk_1E5585F48;
      aBlock[4] = self;
      v9 = _Block_copy(aBlock);
      id v10 = v9;
      if (a3 == 0.0) {
        (*((void (**)(void *))v9 + 2))(v9);
      }
      else {
        AXPerformBlockOnMainThreadAfterDelay();
      }

      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 2;
  }
  return [(AXOrator *)self _successWithCode:v8 error:a4];
}

void __43__AXOrator_resumeSpeakingAfterDelay_error___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) shouldSpeakNextItemOnResume];
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    [v3 setShouldSpeakNextItemOnResume:0];
    [*(id *)(a1 + 32) _speakNextItemInSequence];
    id v4 = [*(id *)(a1 + 32) delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v9 = [*(id *)(a1 + 32) delegate];
      [v9 oratorDidResumeSpeaking:*(void *)(a1 + 32)];
    }
  }
  else
  {
    char v6 = [v3 speechSynthesizer];
    char v7 = [v6 continueSpeaking];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = AXLogOrator();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __43__AXOrator_resumeSpeakingAfterDelay_error___block_invoke_cold_1();
      }
    }
  }
}

- (float)speechRate
{
  int v2 = +[AXSettings sharedInstance];
  [v2 quickSpeakSpeakingRate];
  float v4 = v3;

  return v4;
}

- (BOOL)isPaused
{
  int v2 = [(AXOrator *)self speechSynthesizer];
  char v3 = [v2 isPaused];

  return v3;
}

- (BOOL)isSpeaking
{
  char v3 = [(AXOrator *)self speechSynthesizer];
  if ([v3 isSpeaking])
  {
    float v4 = [(AXOrator *)self speechSynthesizer];
    int v5 = [v4 isPaused] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (id)currentVoiceSelection
{
  char v3 = +[AXSettings sharedInstance];
  float v4 = [(AXOrator *)self lastUtteranceLanguageCode];
  int v5 = [v3 spokenContentVoiceSelectionForLanguage:v4];

  return v5;
}

- (double)currentSpeechRateForAdjustment
{
  int v2 = [(AXOrator *)self currentVoiceSelection];
  char v3 = [v2 rate];
  float v4 = v3;
  if (!v3) {
    char v3 = &unk_1EDC63598;
  }
  [v3 floatValue];
  double v6 = v5;

  return v6;
}

- (BOOL)speakFaster
{
  [(AXOrator *)self currentSpeechRateForAdjustment];
  double v4 = v3 + (float)(*MEMORY[0x1E4F152A0] - *MEMORY[0x1E4F152B0]) * 0.05;

  return [(AXOrator *)self _changeSpeakingSpeed:v4];
}

- (BOOL)speakSlower
{
  [(AXOrator *)self currentSpeechRateForAdjustment];
  double v4 = v3 + (float)(*MEMORY[0x1E4F152A0] - *MEMORY[0x1E4F152B0]) * -0.05;

  return [(AXOrator *)self _changeSpeakingSpeed:v4];
}

- (BOOL)fastForwardWithBoundary:(unint64_t)a3
{
  return [(AXOrator *)self _skipByUnit:1 boundary:a3];
}

- (BOOL)rewindWithBoundary:(unint64_t)a3
{
  return [(AXOrator *)self _skipByUnit:0 boundary:a3];
}

- (void)speakStatusWithLanguage:(id)a3 rate:(id)a4
{
  uint64_t v5 = speakStatusWithLanguage_rate__onceToken;
  id v6 = a3;
  if (v5 != -1) {
    dispatch_once(&speakStatusWithLanguage_rate__onceToken, &__block_literal_global_26);
  }
  [(id)speakStatusWithLanguage_rate__QuickManager setDelegate:self];
  [(id)speakStatusWithLanguage_rate__QuickManager setIsInternalSynth:1];
  [(id)speakStatusWithLanguage_rate__QuickManager setUsesApplicationAudioSession:0];
  char v7 = (void *)MEMORY[0x1E4F28B50];
  uint64_t v8 = AXAccessibilityBundlesDirectory();
  id v9 = [v8 stringByAppendingPathComponent:@"QuickSpeak.bundle"];
  id v16 = [v7 bundleWithPath:v9];

  id v10 = AXNSLocalizedStringForLocale();
  v11 = [MEMORY[0x1E4F15490] speechUtteranceWithString:v10];
  statusUtterance = self->_statusUtterance;
  self->_statusUtterance = v11;

  v13 = +[AXSettings sharedInstance];
  id v14 = [v13 spokenContentVoiceSelectionForLanguage:v6];

  [(AVSpeechUtterance *)self->_statusUtterance setVoiceSelection:v14];
  v15 = [(id)speakStatusWithLanguage_rate__QuickManager audioSession];
  [v15 setCategory:*MEMORY[0x1E4F14FC8] withOptions:2 error:0];

  [(id)speakStatusWithLanguage_rate__QuickManager stopSpeakingAtBoundary:0];
  [(id)speakStatusWithLanguage_rate__QuickManager speakUtterance:self->_statusUtterance];
}

uint64_t __41__AXOrator_speakStatusWithLanguage_rate___block_invoke()
{
  speakStatusWithLanguage_rate__QuickManager = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

- (BOOL)contentIsSpeakable
{
  return self->_contentIsSpeakable;
}

- (BOOL)canResumeWithContent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AXOrator *)self speechSynthesizer];
  if ([v5 isSpeaking])
  {
    id v6 = [(AXOrator *)self speechSynthesizer];
    if ([v6 isPaused])
    {
      char v7 = [(AXOrator *)self speakingContent];
      uint64_t v8 = [v7 content];
      char v9 = [v8 isEqualToString:v4];
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)clearSelectedContent
{
}

- (void)_startSpeakingSequence
{
  double v3 = [(AXOrator *)self selectedContent];
  [(AXOrator *)self setSpeakingContent:v3];

  [(AXOrator *)self setSpeakingContentTokenRanges:0];
  id v4 = [(AXOrator *)self speakingContent];
  uint64_t v5 = [v4 tags];
  id v6 = (void *)[v5 mutableCopy];
  [(AXOrator *)self setSpeechSequenceItems:v6];

  [(AXOrator *)self _updateSequenceForSpellOutBehavior];
  [(AXOrator *)self setShouldSpeakNextItemOnResume:0];

  [(AXOrator *)self _speakNextItemInSequence];
}

- (void)_updateSequenceForSpellOutBehavior
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([(AXOrator *)self spellOutContent])
  {
    double v3 = [MEMORY[0x1E4F1CA48] array];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    v18 = self;
    id v4 = [(AXOrator *)self speechSequenceItems];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v20 != v7) {
            objc_enumerationMutation(v4);
          }
          char v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          for (unint64_t j = [v9 range]; ; j += v16)
          {
            uint64_t v11 = [v9 range];
            if (j >= v11 + v12) {
              break;
            }
            v13 = [v9 content];
            uint64_t v14 = [v13 rangeOfComposedCharacterSequenceAtIndex:j];
            uint64_t v16 = v15;

            v17 = (void *)[v9 copy];
            objc_msgSend(v17, "setRange:", v14, v16);
            [v3 addObject:v17];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v6);
    }

    [(AXOrator *)v18 setSpeechSequenceItems:v3];
  }
}

- (id)_getLangCodeForItem:(id)a3
{
  id v4 = a3;
  if ([(AXOrator *)self preferredLanguageWasSpecified]
    && ([(AXOrator *)self speakingContent],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        [v5 userPreferredLangID],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v4 canBeSpokenByLanguage:v6],
        v6,
        v5,
        v7))
  {
    uint64_t v8 = [(AXOrator *)self speakingContent];
    uint64_t v9 = [v8 userPreferredLangID];
  }
  else
  {
    id v10 = [v4 dialect];
    uint64_t v11 = [v10 specificLanguageID];

    if ([v4 wasPredicted]) {
      goto LABEL_10;
    }
    uint64_t v12 = [(AXOrator *)self speakingContent];
    v13 = [v12 userPreferredLangID];
    if ([v4 canBeSpokenByLanguage:v13])
    {
    }
    else
    {
      char v14 = [v4 canBeSpokenByLanguage:v11];

      if (v14) {
        goto LABEL_10;
      }
    }
    uint64_t v8 = [(AXOrator *)self speakingContent];
    uint64_t v9 = [v8 userPreferredLangID];
  }
  uint64_t v11 = (void *)v9;
LABEL_10:

  return v11;
}

- (void)_processAdditionalContentInPreparationForSpeech
{
  [(id)ModifySpeechJobsLock lock];
  double v3 = [(AXOrator *)self additionalContentToProcess];
  if ([v3 count])
  {
    id v4 = [(AXOrator *)self speechSequenceItems];

    if (!v4) {
      goto LABEL_5;
    }
    uint64_t v5 = [(AXOrator *)self speechSequenceItems];
    uint64_t v6 = [(AXOrator *)self additionalContentToProcess];
    [v5 addObjectsFromArray:v6];

    double v3 = [(AXOrator *)self additionalContentToProcess];
    [v3 removeAllObjects];
  }

LABEL_5:
  int v7 = (void *)ModifySpeechJobsLock;

  [v7 unlock];
}

- (void)_speakNextItemInSequence
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  [(AXOrator *)self _processAdditionalContentInPreparationForSpeech];
  if (self->_contentIsSpeakable)
  {
    double v3 = [(AXOrator *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      id v4 = [(AXOrator *)self speechSequenceItems];
      unint64_t v5 = [v4 count];

      if (v5 > 4) {
        goto LABEL_6;
      }
      [(AXOrator *)self setIsFetchingAdditionalContent:1];
      double v3 = [(AXOrator *)self delegate];
      [v3 oratorShouldFetchNextElements:self shouldScrollOpaqueProviderIfNecessary:0];
    }
  }
LABEL_6:
  uint64_t v6 = [(AXOrator *)self speechSequenceItems];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    uint64_t v8 = [(AXOrator *)self speechSequenceItems];
    uint64_t v9 = [v8 objectAtIndex:0];

    id v10 = [(AXOrator *)self speechSequenceItems];
    [v10 removeObjectAtIndex:0];

    uint64_t v11 = [(AXOrator *)self _getLangCodeForItem:v9];
    uint64_t v12 = [v9 range];
    uint64_t v14 = v13;
    uint64_t v15 = [(AXOrator *)self currentLanguageCode];

    if (!v15) {
      [(AXOrator *)self setCurrentLanguageCode:v11];
    }
    id v61 = v9;
    if ([v9 createdFromNewline])
    {
      [(AXOrator *)self setCurrentLanguageCode:0];
    }
    else
    {
      long long v19 = [(AXOrator *)self currentLanguageCode];
      if ([v19 isEqualToString:v11])
      {
        BOOL v20 = [(AXOrator *)self spellOutContent];

        if (!v20)
        {
          v60 = v11;
          do
          {
            long long v21 = [(AXOrator *)self speechSequenceItems];
            uint64_t v22 = [v21 count];

            if (!v22) {
              break;
            }
            v23 = [(AXOrator *)self speechSequenceItems];
            long long v19 = [v23 objectAtIndex:0];

            uint64_t v24 = [(AXOrator *)self currentLanguageCode];
            int v25 = [v19 canBeSpokenByLanguage:v24];

            if (v25)
            {
              v26 = [(AXOrator *)self speechSequenceItems];
              [v26 removeObjectAtIndex:0];

              [v19 range];
              v14 += v27;
            }
            v28 = [v19 contentSubstring];
            if ([v28 length])
            {
              [MEMORY[0x1E4F28B88] newlineCharacterSet];
              uint64_t v29 = v14;
              v31 = uint64_t v30 = v12;
              v32 = [v19 contentSubstring];
              v33 = [v19 contentSubstring];
              int v34 = objc_msgSend(v31, "characterIsMember:", objc_msgSend(v32, "characterAtIndex:", objc_msgSend(v33, "length") - 1));

              uint64_t v12 = v30;
              uint64_t v14 = v29;
              uint64_t v11 = v60;

              if (v34)
              {
                [(AXOrator *)self setCurrentLanguageCode:0];
                goto LABEL_27;
              }
            }
            else
            {
            }
          }
          while ((v25 & 1) != 0);
        }
      }
      else
      {
LABEL_27:
      }
    }
    v35 = +[AXSettings sharedInstance];
    v36 = AXLanguageCanonicalFormToGeneralLanguage(v11);
    [v35 quickSpeakSpeakingRateForLanguage:v36];
    float v38 = v37;

    v39 = [(AXOrator *)self speakingContent];
    v40 = [v39 content];
    unint64_t v41 = [v40 length];

    if (v14 + v12 > v41)
    {
      v42 = AXLogOrator();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        v43 = [(AXOrator *)self speakingContent];
        *(_DWORD *)buf = 134218498;
        uint64_t v64 = v12;
        __int16 v65 = 2048;
        uint64_t v66 = v14;
        __int16 v67 = 2112;
        v68 = v43;
        _os_log_impl(&dword_18D308000, v42, OS_LOG_TYPE_INFO, "Our substring range was greater than speaking content! (%lu,%lu) %@", buf, 0x20u);
      }
      goto LABEL_38;
    }
    v44 = [(AXOrator *)self speakingContent];
    v45 = [v44 content];
    uint64_t v46 = objc_msgSend(v45, "substringWithRange:", v12, v14);

    v59 = (void *)v46;
    [MEMORY[0x1E4F15490] speechUtteranceWithString:v46];
    v48 = uint64_t v47 = v12;
    uint64_t v49 = AXLanguageCanonicalFormToGeneralLanguage(v11);

    v50 = +[AXSettings sharedInstance];
    v51 = [v50 spokenContentVoiceSelectionForLanguage:v49];
    [v48 setVoiceSelection:v51];

    [v48 setProcessEmoticons:1];
    v52 = [(AXOrator *)self speechSynthesizer];
    [v52 stopSpeakingAtBoundary:0];

    [(AXOrator *)self _updateAudioSessionCategory];
    v53 = [(AXOrator *)self speechSynthesizer];
    [v53 speakUtterance:v48];

    [(AXOrator *)self setLastUtteranceLanguageCode:v49];
    -[AXOrator setLastUtteranceSubstringRange:](self, "setLastUtteranceSubstringRange:", v47, v14);
    [(AXOrator *)self setLastUtteranceLanguageTag:v61];
    v54 = [(AXOrator *)self lastUtterance];
    [v54 rate];
    if (v55 == v38)
    {
      v58 = v59;
    }
    else
    {
      v56 = [(AXOrator *)self delegate];
      char v57 = objc_opt_respondsToSelector();

      v58 = v59;
      if ((v57 & 1) == 0)
      {
LABEL_37:
        [(AXOrator *)self setLastUtterance:v48];

        uint64_t v11 = (void *)v49;
LABEL_38:

        return;
      }
      v54 = [(AXOrator *)self delegate];
      [v54 oratorDidChangeSpeakingRate:self];
    }

    goto LABEL_37;
  }
  uint64_t v16 = [(AXOrator *)self speechSynthesizer];
  [v16 stopSpeakingAtBoundary:0];

  v17 = [(AXOrator *)self delegate];
  uint64_t v18 = objc_opt_respondsToSelector();

  if (v18)
  {
    id v62 = [(AXOrator *)self delegate];
    [v62 oratorDidFinishSpeaking:self];
  }
}

- (BOOL)_changeSpeakingSpeed:(double)a3
{
  unint64_t v5 = AXLogOrator();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[AXOrator _changeSpeakingSpeed:](v5, a3, v6, v7);
  }

  uint64_t v8 = +[AXSettings sharedInstance];
  if (*MEMORY[0x1E4F152A0] >= a3 && *MEMORY[0x1E4F152B0] <= a3)
  {
    uint64_t v11 = [(AXOrator *)self lastUtteranceLanguageCode];
    float v10 = a3;
    *(float *)&double v12 = v10;
    [v8 setQuickSpeakSpeakingRate:v11 forLanguage:v12];

    [(AXOrator *)self _respeakUtteranceIfNeeded];
    uint64_t v13 = [(AXOrator *)self delegate];
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      uint64_t v15 = [(AXOrator *)self delegate];
      [v15 oratorDidChangeSpeakingRate:self];
    }
    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)_speechSequenceItemsStartingAtContentLocation:(unint64_t)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v6 = [(AXOrator *)self speakingContent];
  uint64_t v7 = [v6 tags];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        unint64_t v13 = [v12 range];
        if (a3 < v13 || a3 - v13 >= v14)
        {
          if ([v12 range] > a3) {
            [v5 addObject:v12];
          }
        }
        else
        {
          uint64_t v16 = (void *)[v12 copy];
          uint64_t v17 = [v16 range];
          objc_msgSend(v16, "setRange:", a3, v18 - a3 + v17);
          [v5 addObject:v16];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  return v5;
}

- (void)_respeakUtteranceIfNeeded
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18D308000, v0, v1, "Did not need to respeak utterance.", v2, v3, v4, v5, v6);
}

- (int64_t)_currentTokenIndex:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = 0;
  long long v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v5 = [(AXOrator *)self speechSynthesizer];
  char v6 = [v5 isSpeaking];

  if (v6)
  {
    if ([(AXOrator *)self lastSpokenSubstringRange] == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v7 = AXLogOrator();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18D308000, v7, OS_LOG_TYPE_DEFAULT, "We tried to skip a unit in the currently spoken text, but hadn't tried to speak a substring yet.  This is possible but probably requires extremely fast timing.  If not, something may be wrong", buf, 2u);
      }

      -[AXOrator setLastSpokenSubstringRange:](self, "setLastSpokenSubstringRange:", 0, 0);
    }
    uint64_t v8 = AXLogOrator();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v26.id location = [(AXOrator *)self lastSpokenSubstringRange];
      uint64_t v9 = NSStringFromRange(v26);
      [(AXOrator *)v9 _currentTokenIndex:v8];
    }

    uint64_t v10 = [(AXOrator *)self speakingContentTokenRanges];
    uint64_t v11 = v10;
    if (v3) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = 2;
    }
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __31__AXOrator__currentTokenIndex___block_invoke;
    v18[3] = &unk_1E55877B8;
    BOOL v19 = v3;
    v18[4] = self;
    v18[5] = &v20;
    [v10 enumerateObjectsWithOptions:v12 usingBlock:v18];
  }
  else
  {
    if (v3)
    {
      unint64_t v13 = [(AXOrator *)self speakingContentTokenRanges];
      uint64_t v14 = [v13 count];
      v21[3] = v14;
    }
    else
    {
      v21[3] = 0;
    }
    uint64_t v15 = AXLogOrator();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[AXOrator _currentTokenIndex:]();
    }
  }
  int64_t v16 = v21[3];
  _Block_object_dispose(&v20, 8);
  return v16;
}

unint64_t __31__AXOrator__currentTokenIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  unint64_t v8 = [a2 rangeValue];
  if (!*(unsigned char *)(a1 + 48)) {
    goto LABEL_4;
  }
  uint64_t v9 = v7;
  unint64_t result = [*(id *)(a1 + 32) lastSpokenSubstringRange];
  if (result >= v8 + v9)
  {
    if (*(unsigned char *)(a1 + 48)) {
      return result;
    }
LABEL_4:
    unint64_t result = [*(id *)(a1 + 32) lastSpokenSubstringRange];
    if (result < v8) {
      return result;
    }
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  *a4 = 1;
  return result;
}

- (void)_speakNextTokenFromCurrentTokenIndex:(int64_t)a3 forward:(BOOL)a4 boundary:(unint64_t)a5
{
  BOOL v6 = a4;
  unint64_t v9 = [(AXOrator *)self numberOfTokensToSkip];
  if (v6) {
    unint64_t v10 = v9;
  }
  else {
    unint64_t v10 = -(uint64_t)v9;
  }
  uint64_t v11 = v10 + a3;
  uint64_t v12 = [(AXOrator *)self speakingContentTokenRanges];
  uint64_t v13 = [v12 count];

  if (v11 < v13)
  {
    if (v11 <= 0)
    {
      uint64_t v24 = [(AXOrator *)self delegate];
      char v25 = objc_opt_respondsToSelector();

      if (v25)
      {
        [(AXOrator *)self setIsFetchingAdditionalContent:1];
        NSRange v26 = [(AXOrator *)self delegate];
        [v26 oratorShouldFetchNextElements:self shouldScrollOpaqueProviderIfNecessary:1];
      }
      if (a5 == 0x7FFFFFFFFFFFFFFFLL)
      {
        [(id)ModifySpeechJobsLock lock];
        uint64_t v27 = [(AXOrator *)self speakingContent];
        v28 = [v27 tags];
        uint64_t v29 = (void *)[v28 mutableCopy];

        [(AXOrator *)self setSpeechSequenceItems:v29];
        uint64_t v30 = [(AXOrator *)self additionalContentToProcess];
        [v30 removeAllObjects];

        [(id)ModifySpeechJobsLock unlock];
        goto LABEL_21;
      }
    }
    else
    {
      uint64_t v14 = [(AXOrator *)self speakingContentTokenRanges];
      uint64_t v15 = [v14 objectAtIndex:v11];
      unint64_t v16 = [v15 rangeValue];

      BOOL v17 = v16 <= a5;
      if (!v6) {
        BOOL v17 = v16 >= a5;
      }
      if (v17)
      {
        [(id)ModifySpeechJobsLock lock];
        uint64_t v18 = self;
        unint64_t v19 = v16;
LABEL_20:
        v32 = [(AXOrator *)v18 _speechSequenceItemsStartingAtContentLocation:v19];
        [(AXOrator *)self setSpeechSequenceItems:v32];

        v33 = [(AXOrator *)self additionalContentToProcess];
        [v33 removeAllObjects];

        [(id)ModifySpeechJobsLock unlock];
        goto LABEL_21;
      }
    }
LABEL_17:
    v31 = AXLogOrator();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
      -[AXOrator _speakNextTokenFromCurrentTokenIndex:forward:boundary:]();
    }

    [(id)ModifySpeechJobsLock lock];
    uint64_t v18 = self;
    unint64_t v19 = a5;
    goto LABEL_20;
  }
  if (a5 != 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_17;
  }
  uint64_t v20 = [MEMORY[0x1E4F1CA48] array];
  [(AXOrator *)self setSpeechSequenceItems:v20];

  long long v21 = [(AXOrator *)self delegate];
  char v22 = objc_opt_respondsToSelector();

  if (v22)
  {
    [(AXOrator *)self setIsFetchingAdditionalContent:1];
    uint64_t v23 = [(AXOrator *)self delegate];
    [v23 oratorShouldFetchNextElements:self shouldScrollOpaqueProviderIfNecessary:1];
  }
LABEL_21:
  int v34 = AXLogOrator();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
    -[AXOrator _speakNextTokenFromCurrentTokenIndex:forward:boundary:](self);
  }

  v35 = [(AXOrator *)self speechSynthesizer];
  int v36 = [v35 isPaused];

  if (v36) {
    [(AXOrator *)self setShouldSpeakNextItemOnResume:1];
  }
  else {
    [(AXOrator *)self _speakNextItemInSequence];
  }
}

- (BOOL)_skipByUnit:(BOOL)a3 boundary:(unint64_t)a4
{
  BOOL v5 = a3;
  uint64_t v7 = AXLogOrator();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[AXOrator _skipByUnit:boundary:].cold.5();
  }

  unint64_t v8 = [(AXOrator *)self speakingContent];

  if (!v8) {
    goto LABEL_13;
  }
  [(AXOrator *)self setCurrentLanguageCode:0];
  [(AXOrator *)self _tokenizeContentIfNeeded];
  unint64_t v9 = AXLogOrator();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[AXOrator _skipByUnit:boundary:].cold.4(self);
  }

  unint64_t v10 = [(AXOrator *)self speakingContentTokenRanges];
  uint64_t v11 = [v10 count];

  if (!v11) {
    _AXAssert();
  }
  uint64_t v12 = [(AXOrator *)self speakingContentTokenRanges];
  uint64_t v13 = [v12 count];

  if (!v13) {
    goto LABEL_13;
  }
  int64_t v14 = [(AXOrator *)self _currentTokenIndex:v5];
  uint64_t v15 = AXLogOrator();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[AXOrator _skipByUnit:boundary:]();
  }

  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v21.id location = [(AXOrator *)self lastSpokenSubstringRange];
    unint64_t v16 = NSStringFromRange(v21);
    uint64_t v20 = [(AXOrator *)self speakingContentTokenRanges];
    _AXAssert();

LABEL_13:
    BOOL v17 = AXLogOrator();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[AXOrator _skipByUnit:boundary:]();
    }
    BOOL v18 = 0;
    goto LABEL_16;
  }
  [(AXOrator *)self _speakNextTokenFromCurrentTokenIndex:v14 forward:v5 boundary:a4];
  BOOL v17 = AXLogOrator();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[AXOrator _skipByUnit:boundary:]();
  }
  BOOL v18 = 1;
LABEL_16:

  return v18;
}

- (void)_tokenizeContentIfNeeded
{
  [(id)ModifySpeechJobsLock lock];
  BOOL v3 = [(AXOrator *)self speakingContentTokenRanges];

  if (v3)
  {
    uint64_t v4 = [(AXOrator *)self speakingContentTokenRanges];
    BOOL v5 = [v4 lastObject];
    uint64_t v6 = [v5 rangeValue];
    uint64_t v8 = v7;

    unint64_t v9 = v6 + v8;
    unint64_t v10 = [(AXOrator *)self speakingContent];
    uint64_t v11 = [v10 content];
    unint64_t v12 = [v11 length];

    if (v9 > v12) {
      goto LABEL_10;
    }
    uint64_t v13 = [(AXOrator *)self content];
    uint64_t v14 = [v13 length] - v9;
  }
  else
  {
    uint64_t v13 = [(AXOrator *)self speakingContent];
    uint64_t v15 = [v13 content];
    uint64_t v14 = [v15 length];

    unint64_t v9 = 0;
  }

  unint64_t v16 = [MEMORY[0x1E4F1CA48] array];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __36__AXOrator__tokenizeContentIfNeeded__block_invoke;
  aBlock[3] = &unk_1E55877E0;
  id v17 = v16;
  id v28 = v17;
  BOOL v18 = _Block_copy(aBlock);
  unint64_t v19 = [(AXOrator *)self speakingContent];
  uint64_t v20 = [v19 content];
  NSRange v21 = [(AXOrator *)self speakingContent];
  char v22 = [v21 content];
  unint64_t v23 = 1;
  objc_msgSend(v20, "enumerateSubstringsInRange:options:usingBlock:", 0, objc_msgSend(v22, "length"), 1, v18);

  if ((unint64_t)[v17 count] <= 4)
  {
    [v17 removeAllObjects];
    uint64_t v24 = [(AXOrator *)self speakingContent];
    char v25 = [v24 content];
    objc_msgSend(v25, "enumerateSubstringsInRange:options:usingBlock:", v9, v14, 1028, v18);

    unint64_t v26 = [v17 count];
    if (v26 / 5 <= 1) {
      unint64_t v23 = 1;
    }
    else {
      unint64_t v23 = v26 / 5;
    }
  }
  [(AXOrator *)self setSpeakingContentTokenRanges:v17];
  [(AXOrator *)self setNumberOfTokensToSkip:v23];

LABEL_10:
  [(id)ModifySpeechJobsLock unlock];
}

void __36__AXOrator__tokenizeContentIfNeeded__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  unint64_t v9 = (void *)MEMORY[0x1E4F28B88];
  id v10 = a2;
  uint64_t v11 = [v9 whitespaceAndNewlineCharacterSet];
  unint64_t v12 = [v10 stringByTrimmingCharactersInSet:v11];

  uint64_t v13 = [v12 length];
  if (v13)
  {
    uint64_t v14 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", a5, a6);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    [v14 addObject:v15];
  }
}

- (void)setAudioSessionInactiveTimeout:(double)a3
{
  id v4 = [(AXOrator *)self speechSynthesizer];
  [v4 setAudioSessionInactiveTimeout:a3];
}

- (void)_clearAllContentState
{
  [(AXOrator *)self setSpeakingContent:0];
  [(AXOrator *)self setSpeakingContentTokenRanges:0];
  [(AXOrator *)self setSpeechSequenceItems:0];
  [(AXOrator *)self setLastUtteranceLanguageCode:0];
  -[AXOrator setLastUtteranceSubstringRange:](self, "setLastUtteranceSubstringRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
  -[AXOrator setLastSpokenSubstringRange:](self, "setLastSpokenSubstringRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
  [(AXOrator *)self setLastUtteranceLanguageTag:0];
  [(AXOrator *)self setLastUtterance:0];
  [(AXOrator *)self setShouldSpeakNextItemOnResume:0];
  [(id)ModifySpeechJobsLock lock];
  [(AXOrator *)self setIsProcessingContentForSpeech:0];
  BOOL v3 = [(AXOrator *)self additionalContentToProcess];
  [v3 removeAllObjects];

  id v4 = (void *)ModifySpeechJobsLock;

  [v4 unlock];
}

- (void)_updateAudioSessionCategory
{
  uint64_t v3 = *MEMORY[0x1E4F14F98];
  uint64_t v4 = 2 * (([(AXOrator *)self speakingContext] & 0xFFFFFFFFFFFFFFFELL) == 2);
  BOOL v5 = [(AXOrator *)self speechSynthesizer];
  [v5 setSetActiveOptions:1];

  uint64_t v6 = [(AXOrator *)self speechSynthesizer];
  [v6 setAudioSessionCategory:v3];

  id v7 = [(AXOrator *)self speechSynthesizer];
  [v7 setAudioSessionCategoryOptions:v4];
}

- (BOOL)_canSpeakTaggedContent:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 content];
  BOOL v5 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  uint64_t v6 = [v4 stringByTrimmingCharactersInSet:v5];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    uint64_t v8 = [v3 ambiguousLangMaps];
    if ([v8 count])
    {
      BOOL v9 = 1;
    }
    else
    {
      id v10 = [v3 unambiguousLangMaps];
      BOOL v9 = [v10 count] != 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)_successWithCode:(int64_t)a3 error:(id *)a4
{
  if (a4)
  {
    if (a3)
    {
      uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"AXOratorErrorDomain" code:a3 userInfo:0];
    }
    else
    {
      uint64_t v6 = 0;
    }
    id v7 = v6;
    *a4 = v7;
  }
  return a3 == 0;
}

- (void)speechSynthesizer:(id)a3 didFinishSpeechUtterance:(id)a4
{
  id v5 = a4;
  AXAssertMainThreadCallback();
  id v18 = [(AXOrator *)self lastUtterance];
  uint64_t v6 = [(AXOrator *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  id v8 = v18;
  if ((v7 & 1) != 0 && v18 == v5)
  {
    BOOL v9 = [(AXOrator *)self speechSequenceItems];
    if ([v9 count])
    {

LABEL_5:
      id v8 = v18;
      goto LABEL_7;
    }
    id v10 = [(AXOrator *)self additionalContentToProcess];
    uint64_t v11 = [v10 count];

    id v8 = v18;
    if (!v11)
    {
      [(AXOrator *)self setIsFetchingAdditionalContent:1];
      unint64_t v16 = [(AXOrator *)self delegate];
      [v16 oratorShouldFetchNextElements:self shouldScrollOpaqueProviderIfNecessary:1];

      [(AXOrator *)self _processAdditionalContentInPreparationForSpeech];
      goto LABEL_5;
    }
  }
LABEL_7:
  if (v8 == v5)
  {
    uint64_t v14 = [(AXOrator *)self speechSequenceItems];
    if (![v14 count])
    {
      id v15 = [(AXOrator *)self additionalContentToProcess];
      if (![v15 count])
      {
        BOOL v17 = [(AXOrator *)self isFetchingAdditionalContent];

        if (!v17) {
          [(AXOrator *)self _clearAllContentState];
        }
        goto LABEL_15;
      }
    }
LABEL_15:
    [(AXOrator *)self _speakNextItemInSequence];
    goto LABEL_16;
  }
  if (!v8)
  {
    unint64_t v12 = [(AXOrator *)self speechSequenceItems];
    uint64_t v13 = [v12 count];

    if (!v13) {
      goto LABEL_15;
    }
  }
LABEL_16:
  [(AXOrator *)self _updateAudioSessionCategory];
}

- (void)speechSynthesizer:(id)a3 didPauseSpeechUtterance:(id)a4
{
  AXAssertMainThreadCallback();
  id v5 = [(AXOrator *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    char v7 = [(AXOrator *)self delegate];
    [v7 oratorDidPauseSpeaking:self];
  }

  [(AXOrator *)self _updateAudioSessionCategory];
}

- (void)speechSynthesizer:(id)a3 didContinueSpeechUtterance:(id)a4
{
  AXAssertMainThreadCallback();
  id v5 = [(AXOrator *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    char v7 = [(AXOrator *)self delegate];
    [v7 oratorDidResumeSpeaking:self];
  }

  [(AXOrator *)self _updateAudioSessionCategory];
}

- (void)speechSynthesizer:(id)a3 didStartSpeechUtterance:(id)a4
{
  AXAssertMainThreadCallback();
  id v5 = [(AXOrator *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(AXOrator *)self delegate];
    [v7 oratorDidStartSpeaking:self];
  }
}

- (void)speechSynthesizer:(id)a3 didCancelSpeechUtterance:(id)a4
{
  id v5 = a4;
  AXAssertMainThreadCallback();
  [(AXOrator *)self _updateAudioSessionCategory];
  id v10 = [(AXOrator *)self lastUtterance];

  char v6 = v10;
  if (v10 == v5)
  {
    id v7 = [(AXOrator *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      BOOL v9 = [(AXOrator *)self delegate];
      [v9 oratorDidCancelSpeaking:self];
    }
    [(AXOrator *)self _clearAllContentState];
    char v6 = v10;
  }
}

- (void)speechSynthesizer:(id)a3 willSpeakRangeOfSpeechString:(_NSRange)a4 utterance:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a5;
  BOOL v9 = dispatch_get_current_queue();
  id v10 = (void *)MEMORY[0x1E4F14428];

  if (v9 != v10) {
    _AXAssert();
  }
  id v11 = [(AXOrator *)self lastUtterance];

  if (v11 != v8)
  {
    unint64_t v12 = AXLogOrator();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[AXOrator speechSynthesizer:willSpeakRangeOfSpeechString:utterance:]((uint64_t)v8, self, v12);
    }
    goto LABEL_15;
  }
  if ([(AXOrator *)self lastUtteranceSubstringRange] == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v12 = AXLogOrator();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v24.NSUInteger location = location;
      v24.NSUInteger length = length;
      -[AXOrator speechSynthesizer:willSpeakRangeOfSpeechString:utterance:](v24, (uint64_t)v8, v12);
    }
    goto LABEL_15;
  }
  NSUInteger v13 = [(AXOrator *)self lastUtteranceSubstringRange] + location;
  uint64_t v14 = [(AXOrator *)self lastUtteranceSubstringRange];
  if (v13 + length > v14 + v15)
  {
    v25.NSUInteger location = v13;
    v25.NSUInteger length = length;
    unint64_t v16 = NSStringFromRange(v25);
    v26.NSUInteger location = [(AXOrator *)self lastUtteranceSubstringRange];
    NSStringFromRange(v26);
    v23 = char v22 = v16;
    _AXAssert();
  }
  -[AXOrator setLastSpokenSubstringRange:](self, "setLastSpokenSubstringRange:", v13, length, v22, v23);
  BOOL v17 = AXLogOrator();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v27.NSUInteger location = v13;
    v27.NSUInteger length = length;
    -[AXOrator speechSynthesizer:willSpeakRangeOfSpeechString:utterance:](v27);
  }

  id v18 = [(AXOrator *)self delegate];
  char v19 = objc_opt_respondsToSelector();

  if (v19)
  {
    unint64_t v12 = [(AXOrator *)self delegate];
    uint64_t v20 = [(AXOrator *)self speakingContent];
    NSRange v21 = [v20 content];
    -[NSObject orator:willSpeakRange:ofContent:](v12, "orator:willSpeakRange:ofContent:", self, v13, length, v21);

LABEL_15:
  }
}

- (AXOratorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AXOratorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_NSRange)lastSpokenSubstringRange
{
  NSUInteger length = self->_lastSpokenSubstringRange.length;
  NSUInteger location = self->_lastSpokenSubstringRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setLastSpokenSubstringRange:(_NSRange)a3
{
  self->_lastSpokenSubstringRange = a3;
}

- (int64_t)speakingContext
{
  return self->_speakingContext;
}

- (void)setSpeakingContext:(int64_t)a3
{
  self->_speakingContext = a3;
}

- (AXLanguageTaggedContent)selectedContent
{
  return self->_selectedContent;
}

- (void)setSelectedContent:(id)a3
{
}

- (BOOL)spellOutContent
{
  return self->_spellOutContent;
}

- (void)setSpellOutContent:(BOOL)a3
{
  self->_spellOutContent = a3;
}

- (double)audioSessionInactiveTimeout
{
  return self->_audioSessionInactiveTimeout;
}

- (AXLanguageTaggedContent)speakingContent
{
  return self->_speakingContent;
}

- (void)setSpeakingContent:(id)a3
{
}

- (NSArray)speakingContentTokenRanges
{
  return self->_speakingContentTokenRanges;
}

- (void)setSpeakingContentTokenRanges:(id)a3
{
}

- (unint64_t)numberOfTokensToSkip
{
  return self->_numberOfTokensToSkip;
}

- (void)setNumberOfTokensToSkip:(unint64_t)a3
{
  self->_numberOfTokensToSkip = a3;
}

- (AVSpeechSynthesizer)speechSynthesizer
{
  return self->_speechSynthesizer;
}

- (void)setSpeechSynthesizer:(id)a3
{
}

- (NSMutableArray)speechSequenceItems
{
  return self->_speechSequenceItems;
}

- (void)setSpeechSequenceItems:(id)a3
{
}

- (NSString)lastUtteranceLanguageCode
{
  return self->_lastUtteranceLanguageCode;
}

- (void)setLastUtteranceLanguageCode:(id)a3
{
}

- (_NSRange)lastUtteranceSubstringRange
{
  NSUInteger length = self->_lastUtteranceSubstringRange.length;
  NSUInteger location = self->_lastUtteranceSubstringRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setLastUtteranceSubstringRange:(_NSRange)a3
{
  self->_lastUtteranceSubstringRange = a3;
}

- (AVSpeechUtterance)lastUtterance
{
  return self->_lastUtterance;
}

- (void)setLastUtterance:(id)a3
{
}

- (AXLanguageTag)lastUtteranceLanguageTag
{
  return self->_lastUtteranceLanguageTag;
}

- (void)setLastUtteranceLanguageTag:(id)a3
{
}

- (BOOL)shouldSpeakNextItemOnResume
{
  return self->_shouldSpeakNextItemOnResume;
}

- (void)setShouldSpeakNextItemOnResume:(BOOL)a3
{
  self->_shouldSpeakNextItemOnResume = a3;
}

- (NSString)currentLanguageCode
{
  return self->_currentLanguageCode;
}

- (void)setCurrentLanguageCode:(id)a3
{
}

- (BOOL)preferredLanguageWasSpecified
{
  return self->_preferredLanguageWasSpecified;
}

- (void)setPreferredLanguageWasSpecified:(BOOL)a3
{
  self->_preferredLanguageWasSpecified = a3;
}

- (BOOL)isProcessingContentForSpeech
{
  return self->_isProcessingContentForSpeech;
}

- (void)setIsProcessingContentForSpeech:(BOOL)a3
{
  self->_isProcessingContentForSpeech = a3;
}

- (BOOL)isFetchingAdditionalContent
{
  return self->_isFetchingAdditionalContent;
}

- (void)setIsFetchingAdditionalContent:(BOOL)a3
{
  self->_isFetchingAdditionalContent = a3;
}

- (NSMutableArray)additionalContentToProcess
{
  return self->_additionalContentToProcess;
}

- (void)setAdditionalContentToProcess:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalContentToProcess, 0);
  objc_storeStrong((id *)&self->_currentLanguageCode, 0);
  objc_storeStrong((id *)&self->_lastUtteranceLanguageTag, 0);
  objc_storeStrong((id *)&self->_lastUtterance, 0);
  objc_storeStrong((id *)&self->_lastUtteranceLanguageCode, 0);
  objc_storeStrong((id *)&self->_speechSequenceItems, 0);
  objc_storeStrong((id *)&self->_speechSynthesizer, 0);
  objc_storeStrong((id *)&self->_speakingContentTokenRanges, 0);
  objc_storeStrong((id *)&self->_speakingContent, 0);
  objc_storeStrong((id *)&self->_selectedContent, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_audioSessionTimer, 0);

  objc_storeStrong((id *)&self->_statusUtterance, 0);
}

void __43__AXOrator_resumeSpeakingAfterDelay_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_18D308000, v0, OS_LOG_TYPE_ERROR, "Unable to continue speaking from synthesizer.", v1, 2u);
}

- (void)_changeSpeakingSpeed:(uint64_t)a3 .cold.1(NSObject *a1, double a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v4 = 134217984;
  double v5 = a2;
  OUTLINED_FUNCTION_1_3(&dword_18D308000, a1, a4, "Changing speaking rate to %f...", (uint8_t *)&v4);
}

- (void)_currentTokenIndex:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138477827;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_1_3(&dword_18D308000, a3, (uint64_t)a3, "Last spoken substring range was %{private}@.", (uint8_t *)a2);
}

- (void)_currentTokenIndex:.cold.2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_3(&dword_18D308000, v0, v1, "Finished all content, so picking the last token. %ld", v2);
}

- (void)_speakNextTokenFromCurrentTokenIndex:(void *)a1 forward:boundary:.cold.1(void *a1)
{
  uint64_t v1 = [a1 speechSequenceItems];
  uint64_t v2 = [v1 firstObject];
  uint64_t v3 = [v2 content];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_18D308000, v4, v5, "Next speech sequence item was %{private}@.", v6, v7, v8, v9, v10);
}

- (void)_speakNextTokenFromCurrentTokenIndex:forward:boundary:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_18D308000, v0, v1, "Skipped to boundary.", v2, v3, v4, v5, v6);
}

- (void)_skipByUnit:boundary:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_3(&dword_18D308000, v0, v1, "Failed to %{public}@.", v2);
}

- (void)_skipByUnit:boundary:.cold.2()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_3(&dword_18D308000, v0, v1, "Succeeded at %{public}@.", v2);
}

- (void)_skipByUnit:boundary:.cold.3()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_3(&dword_18D308000, v0, v1, "Current token index was %ld.", v2);
}

- (void)_skipByUnit:(void *)a1 boundary:.cold.4(void *a1)
{
  uint64_t v1 = [a1 speakingContentTokenRanges];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_18D308000, v2, v3, "Speaking content ranges were %{private}@.", v4, v5, v6, v7, v8);
}

- (void)_skipByUnit:boundary:.cold.5()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_3(&dword_18D308000, v0, v1, "%{public}@...", v2);
}

- (void)speechSynthesizer:(NSRange)a1 willSpeakRangeOfSpeechString:(uint64_t)a2 utterance:(NSObject *)a3 .cold.1(NSRange a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSStringFromRange(a1);
  OUTLINED_FUNCTION_1_1();
  __int16 v7 = 2113;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_18D308000, a3, OS_LOG_TYPE_ERROR, "Synthesizer will speak range %{private}@ of %{private}@, but we did not track the last utterance range.  It could be that we tried to stop speaking before getting this callback.", v6, 0x16u);
}

- (void)speechSynthesizer:(NSRange)a1 willSpeakRangeOfSpeechString:utterance:.cold.2(NSRange a1)
{
  uint64_t v1 = NSStringFromRange(a1);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_18D308000, v2, v3, "Spoke range %{private}@.", v4, v5, v6, v7, v8);
}

- (void)speechSynthesizer:(uint64_t)a1 willSpeakRangeOfSpeechString:(void *)a2 utterance:(NSObject *)a3 .cold.3(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a2 lastUtterance];
  int v6 = 138478083;
  uint64_t v7 = a1;
  __int16 v8 = 2113;
  uint64_t v9 = v5;
  _os_log_debug_impl(&dword_18D308000, a3, OS_LOG_TYPE_DEBUG, "Finished speaking for utterance %{private}@, but last utterance was %{private}@", (uint8_t *)&v6, 0x16u);
}

@end