@interface AXQuickSpeak
+ (BOOL)isQuickSpeakSelector:(SEL)a3;
+ (BOOL)quickSpeakClassIsDenied:(id)a3;
+ (id)sharedInstance;
+ (void)initialize;
- (AXDispatchTimer)highlightViewDispatcher;
- (AXLanguageTaggedContent)selectedContent;
- (AXOrator)orator;
- (AXQuickSpeak)init;
- (BOOL)cachedIdleTimerPref;
- (BOOL)hasTextBalloonView;
- (BOOL)isPaused;
- (BOOL)isSpeaking;
- (BOOL)selectedContentIsSpeakable;
- (BOOL)selectedContentRequiresUserChoice;
- (BOOL)spellOutContent;
- (NSArray)hiddenTextSelectionViewDelegates;
- (NSArray)hiddenTextSelectionViews;
- (NSString)content;
- (QSSelectionHighlightView)highlightView;
- (QSSelectionHighlightView)sentenceHighlightView;
- (UITextRange)speakingSentenceRange;
- (_NSRange)_updatedRangeForComposedCharacters:(_NSRange)a3 string:(id)a4 lastKnownWholeCharacterLocation:(unint64_t)a5 lastKnownUnicharLocation:(unint64_t)a6;
- (_NSRange)modifiedRange:(_NSRange)a3 withString:(id)a4;
- (id)_quickSpeakInputInitiator;
- (id)_rectsByUnionSamelineRects:(id)a3;
- (id)_sentenceHighlightOverlapHeightArray;
- (id)_sentenceRects:(id)a3 speakingRange:(id)a4;
- (id)_sliceRects:(id)a3 withSentenceRects:(id)a4 wordRects:(id)a5;
- (id)_textSelectionViews;
- (id)_viewsWithBlock:(id)a3;
- (id)contentOwner;
- (id)quickSpeakInitiator;
- (void)_cleanupTextSelectionViews;
- (void)_handleAppDidEnterBackground:(id)a3;
- (void)_handleAppWillResignActive:(id)a3;
- (void)_handlePauseCallback;
- (void)_handleQuickSpeakHighlight:(id)a3 sentenceRects:(id)a4 textRect:(CGRect)a5 initiator:(id)a6;
- (void)_installWebKitLegacySafeCategories;
- (void)_installWebKitLegacySafeCategoriesIfNeeded;
- (void)_manipulateOtherTextViews:(BOOL)a3;
- (void)_quickSpeakTextRects:(id)a3 withRange:(_NSRange)a4 string:(id)a5 highlightRects:(id)a6 sentenceRects:(id)a7 singleTextRect:(CGRect *)a8;
- (void)_quickSpeakUITextInputTextRects:(id)a3 withRange:(_NSRange)a4 string:(id)a5 highlightRects:(id)a6 sentenceRects:(id)a7 singleTextRect:(CGRect *)a8;
- (void)_scrollToTextRect:(CGRect)a3 withScrollView:(id)a4;
- (void)_stopSpeakingQuickSpeak:(id)a3;
- (void)_willSpeakRange:(_NSRange)a3 string:(id)a4;
- (void)dealloc;
- (void)orator:(id)a3 willSpeakRange:(_NSRange)a4 ofContent:(id)a5;
- (void)oratorDidFinishSpeaking:(id)a3;
- (void)oratorDidResumeSpeaking:(id)a3;
- (void)pauseAction:(id)a3;
- (void)resetQuickSpeakForUnitTests;
- (void)resumeAction:(id)a3;
- (void)setCachedIdleTimerPref:(BOOL)a3;
- (void)setContent:(id)a3;
- (void)setContentOwner:(id)a3;
- (void)setHasTextBalloonView:(BOOL)a3;
- (void)setHiddenTextSelectionViewDelegates:(id)a3;
- (void)setHiddenTextSelectionViews:(id)a3;
- (void)setHighlightView:(id)a3;
- (void)setHighlightViewDispatcher:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setQuickSpeakInitiator:(id)a3;
- (void)setSentenceHighlightView:(id)a3;
- (void)setSpeakingSentenceRange:(id)a3;
- (void)setSpellOutContent:(BOOL)a3;
- (void)speakAction:(id)a3 withPreferredLanguage:(id)a4;
- (void)speakStatusWithLanguage:(id)a3 rate:(id)a4;
- (void)stopAction:(id)a3;
@end

@implementation AXQuickSpeak

- (AXOrator)orator
{
  orator = self->_orator;
  if (!orator)
  {
    v4 = (AXOrator *)objc_alloc_init(MEMORY[0x263F22908]);
    v5 = self->_orator;
    self->_orator = v4;

    [(AXOrator *)self->_orator setDelegate:self];
    orator = self->_orator;
  }

  return orator;
}

- (NSString)content
{
  v2 = [(AXQuickSpeak *)self orator];
  v3 = [v2 content];

  return (NSString *)v3;
}

- (void)setContent:(id)a3
{
  id v4 = a3;
  [(AXQuickSpeak *)self setPaused:0];
  id v5 = [(AXQuickSpeak *)self orator];
  [v5 setContent:v4];
}

- (AXLanguageTaggedContent)selectedContent
{
  v2 = [(AXQuickSpeak *)self orator];
  v3 = [v2 selectedContent];

  return (AXLanguageTaggedContent *)v3;
}

- (void)setSpellOutContent:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AXQuickSpeak *)self orator];
  [v4 setSpellOutContent:v3];
}

- (BOOL)spellOutContent
{
  v2 = [(AXQuickSpeak *)self orator];
  char v3 = [v2 spellOutContent];

  return v3;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance__shared;

  return v2;
}

uint64_t __30__AXQuickSpeak_sharedInstance__block_invoke()
{
  sharedInstance__shared = objc_alloc_init(AXQuickSpeak);

  return MEMORY[0x270F9A758]();
}

+ (BOOL)quickSpeakClassIsDenied:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = (void *)quickSpeakClassIsDenied__Denylist;
  if (!quickSpeakClassIsDenied__Denylist)
  {
    uint64_t v5 = [MEMORY[0x263EFF9C0] setWithCapacity:5];
    v6 = (void *)quickSpeakClassIsDenied__Denylist;
    quickSpeakClassIsDenied__Denylist = v5;

    v7 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"PLStackView", @"WAllPhotosAlbumViewController", @"WInteractiveNavigationControllerView", @"WInteractiveNavigationController", @"PKTextAttachmentDrawingView", @"Files.DOCItemCollectionViewController", @"com_apple_DocumentManager_Service.DOCItemCollectionViewController", 0);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v7);
          }
          Class v11 = NSClassFromString(*(NSString **)(*((void *)&v22 + 1) + 8 * i));
          if (v11) {
            [(id)quickSpeakClassIsDenied__Denylist addObject:v11];
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v8);
    }

    id v4 = (void *)quickSpeakClassIsDenied__Denylist;
  }
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __40__AXQuickSpeak_quickSpeakClassIsDenied___block_invoke;
  v15[3] = &unk_2650A9E48;
  id v12 = v3;
  id v16 = v12;
  v17 = &v18;
  [v4 enumerateObjectsUsingBlock:v15];
  BOOL v13 = *((unsigned char *)v19 + 24) != 0;

  _Block_object_dispose(&v18, 8);
  return v13;
}

uint64_t __40__AXQuickSpeak_quickSpeakClassIsDenied___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

+ (BOOL)isQuickSpeakSelector:(SEL)a3
{
  if (isQuickSpeakSelector__onceToken != -1) {
    dispatch_once(&isQuickSpeakSelector__onceToken, &__block_literal_global_295);
  }
  return (SEL)isQuickSpeakSelector___axQSSpeakSentence == a3
      || isQuickSpeakSelector___axQSSpeakSpellOut == (void)a3
      || isQuickSpeakSelector___axQSPauseMethod == (void)a3
      || isQuickSpeakSelector___axQSSpeakMethod == (void)a3
      || isQuickSpeakSelector___axQSSpeakLangsMethod == (void)a3
      || isQuickSpeakSelector___axQSSpeakLangs2Method == (void)a3;
}

void __37__AXQuickSpeak_isQuickSpeakSelector___block_invoke()
{
  isQuickSpeakSelector___axQSPauseMethod = (uint64_t)sel__accessibilityPauseSpeaking_;
  isQuickSpeakSelector___axQSSpeakMethod = (uint64_t)sel__accessibilitySpeak_;
  isQuickSpeakSelector___axQSSpeakLangsMethod = (uint64_t)sel__accessibilitySpeakLanguageSelection_;
  isQuickSpeakSelector___axQSSpeakLangs2Method = (uint64_t)sel__accessibilitySpeakWithLanguage_;
  isQuickSpeakSelector___axQSSpeakSentence = (uint64_t)sel__accessibilitySpeakSentence_;
  isQuickSpeakSelector___axQSSpeakSpellOut = (uint64_t)sel__accessibilitySpeakSpellOut_;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && (MEMORY[0x2455E4C70]() & 1) == 0) {
    id v2 = +[AXQuickSpeak sharedInstance];
  }
}

- (AXQuickSpeak)init
{
  v12.receiver = self;
  v12.super_class = (Class)AXQuickSpeak;
  id v2 = [(AXQuickSpeak *)&v12 init];
  if (v2)
  {
    id v3 = [MEMORY[0x263F21400] sharedInstance];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __20__AXQuickSpeak_init__block_invoke_3;
    v10[3] = &unk_2650A9E90;
    id v4 = v2;
    Class v11 = v4;
    [v3 performValidations:&__block_literal_global_316 withPreValidationHandler:&__block_literal_global_382 postValidationHandler:0 safeCategoryInstallationHandler:v10];

    uint64_t v5 = [MEMORY[0x263F21388] sharedInstance];
    [v5 addHandler:&__block_literal_global_425 forFramework:@"PDFKit"];

    v6 = [MEMORY[0x263F21388] sharedInstance];
    [v6 addHandler:&__block_literal_global_442 forFramework:@"WebKit"];

    QSInstallSharedSafeCategoriesIfNeeded();
    v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:v4 selector:sel__handleAppDidEnterBackground_ name:*MEMORY[0x263F1D050] object:0];
    [v7 addObserver:v4 selector:sel__handleAppWillResignActive_ name:*MEMORY[0x263F1D0D8] object:0];
    [v7 addObserver:v4 selector:sel__stopSpeakingQuickSpeak_ name:*MEMORY[0x263F8B0E0] object:0];
    uint64_t v8 = v4;
  }
  return v2;
}

uint64_t __20__AXQuickSpeak_init__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"UIColor", @"selectionHighlightColor", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UICalloutBar", @"buttonPressed:", "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UICalloutBar", @"delegate", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UICalloutBar", @"fade", "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UICalloutBar", @"hide", "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UICalloutBar", @"_targetForAction:", "@", ":", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UICalloutBar", @"updateAvailableButtons", "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UICalloutBarButton", @"setPage:", "v", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UITextSelectionView", @"setVisible:", "v", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UITextSelectionView", @"showSelectionCommands", "v", 0);
  [v2 validateClass:@"UICalloutBar" hasInstanceVariable:@"m_extraItems" withType:"NSArray"];
  [v2 validateClass:@"UICalloutBar" hasInstanceVariable:@"m_currentSystemButtons" withType:"NSMutableArray"];
  [v2 validateClass:@"UITextInteraction"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UITextInteraction", @"_textInput", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UITextInteraction", @"_updatedAccessibilityTextMenuWithMenuElements:", "@", "@", 0);

  return 1;
}

uint64_t __20__AXQuickSpeak_init__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"QuickSpeak"];
  [v2 setOverrideProcessName:@"QuickSpeak"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F09468]();
}

void __20__AXQuickSpeak_init__block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  [v5 installSafeCategory:@"NSObject_QSExtras" canInteractWithTargetClass:1];
  [v5 installSafeCategory:@"UIResponder_QSExtras" canInteractWithTargetClass:1];
  [v5 installSafeCategory:@"UITextField_QSExtrasAccessibility" canInteractWithTargetClass:1];
  if (NSClassFromString(&cfstr_Cktextballoonv.isa))
  {
    [v5 installSafeCategory:@"CKBalloonTextView_QSExtras" canInteractWithTargetClass:1];
    [v5 installSafeCategory:@"CKFullScreenBalloonViewController_QSExtras" canInteractWithTargetClass:1];
    [v5 installSafeCategory:@"CKFullScreenBalloonViewControllerPhone_QSExtras" canInteractWithTargetClass:1];
    [v5 installSafeCategory:@"CKChatController_ClickyOrb_QSExtras" canInteractWithTargetClass:1];
  }
  if (NSClassFromString(&cfstr_Ekdayoccurrenc.isa)) {
    [v5 installSafeCategory:@"EKDayOccurrenceView_QSExtras" canInteractWithTargetClass:1];
  }
  Class v3 = NSClassFromString(&cfstr_Puoneupviewcon.isa);
  id v4 = v5;
  if (v3)
  {
    [v5 installSafeCategory:@"PUOneUpViewController_QSExtras" canInteractWithTargetClass:1];
    id v4 = v5;
  }
  [v4 installSafeCategory:@"UITextInteraction_QSExtras" canInteractWithTargetClass:1];
  [*(id *)(a1 + 32) _installWebKitLegacySafeCategoriesIfNeeded];
}

void __20__AXQuickSpeak_init__block_invoke_4()
{
  id v0 = [MEMORY[0x263F21400] sharedInstance];
  [v0 performValidations:&__block_literal_global_427 withPreValidationHandler:&__block_literal_global_429 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_434];
}

uint64_t __20__AXQuickSpeak_init__block_invoke_5()
{
  return 1;
}

uint64_t __20__AXQuickSpeak_init__block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"QuickSpeak PDF"];
  [v2 setOverrideProcessName:@"QuickSpeak PDF"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F09468]();
}

uint64_t __20__AXQuickSpeak_init__block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 installSafeCategory:@"PDFView_QSExtras" canInteractWithTargetClass:1];
}

void __20__AXQuickSpeak_init__block_invoke_8()
{
  id v0 = [MEMORY[0x263F21400] sharedInstance];
  [v0 performValidations:&__block_literal_global_444 withPreValidationHandler:&__block_literal_global_446 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_451];
}

uint64_t __20__AXQuickSpeak_init__block_invoke_9()
{
  return 1;
}

uint64_t __20__AXQuickSpeak_init__block_invoke_10(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"QuickSpeak WebKit2"];
  [v2 setOverrideProcessName:@"QuickSpeak WebKit2"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F09468]();
}

void __20__AXQuickSpeak_init__block_invoke_11(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"WKContentView_QSExtras" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"WKWebViewAccessibility_QSExtras" canInteractWithTargetClass:1];
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self];

  id v5 = [(AXQuickSpeak *)self sentenceHighlightView];
  [v5 removeFromSuperview];

  v6 = [(AXQuickSpeak *)self highlightView];
  [v6 removeFromSuperview];

  v7 = (void *)CachedSentenceRects;
  CachedSentenceRects = 0;

  uint64_t v8 = (void *)CachedSentenceHighlightOverlapHeights;
  CachedSentenceHighlightOverlapHeights = 0;

  v9.receiver = self;
  v9.super_class = (Class)AXQuickSpeak;
  [(AXQuickSpeak *)&v9 dealloc];
}

- (void)resetQuickSpeakForUnitTests
{
  self->_lastWholeCharacterLocation = 0;
  self->_lastUnicharLocation = 0;
}

- (void)_installWebKitLegacySafeCategories
{
  if (_installWebKitLegacySafeCategories_onceToken != -1) {
    dispatch_once(&_installWebKitLegacySafeCategories_onceToken, &__block_literal_global_471);
  }
}

void __50__AXQuickSpeak__installWebKitLegacySafeCategories__block_invoke()
{
}

void __50__AXQuickSpeak__installWebKitLegacySafeCategories__block_invoke_2()
{
  id v0 = AXLogSpeakSelection();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl(&dword_240270000, v0, OS_LOG_TYPE_INFO, "Will load QS safe categories for WebKit legacy now", v2, 2u);
  }

  v1 = [MEMORY[0x263F21400] sharedInstance];
  [v1 performValidations:&__block_literal_global_476 withPreValidationHandler:&__block_literal_global_493 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_498];
}

uint64_t __50__AXQuickSpeak__installWebKitLegacySafeCategories__block_invoke_474(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"UIWebView" hasInstanceVariable:@"_internal" withType:"UIWebViewInternal"];
  [v2 validateClass:@"UIWebViewInternal" hasInstanceVariable:@"browserView" withType:"UIWebBrowserView"];

  return 1;
}

uint64_t __50__AXQuickSpeak__installWebKitLegacySafeCategories__block_invoke_2_491(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"QuickSpeak WebKit Legacy"];
  [v2 setOverrideProcessName:@"QuickSpeak WebKit Legacy"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F09468]();
}

void __50__AXQuickSpeak__installWebKitLegacySafeCategories__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"UIWebView_QSExtras" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UIWebBrowserView_QSExtras" canInteractWithTargetClass:1];
}

- (void)_installWebKitLegacySafeCategoriesIfNeeded
{
  if (_UIApplicationIsWebKitLoaded())
  {
    [(AXQuickSpeak *)self _installWebKitLegacySafeCategories];
  }
  else
  {
    Class v3 = AXLogSpeakSelection();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_240270000, v3, OS_LOG_TYPE_INFO, "WebKit legacy not loaded. Will load QS safe categories on demand", v5, 2u);
    }

    id v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:self selector:sel__handleWebkitLegacyWasLoaded_ name:@"UIApplicationLoadedWebKit" object:0];
  }
}

- (void)_handleAppDidEnterBackground:(id)a3
{
  id v4 = [(AXQuickSpeak *)self orator];
  [v4 clearSelectedContent];

  [(AXQuickSpeak *)self stopAction:0];
}

- (void)_stopSpeakingQuickSpeak:(id)a3
{
}

- (void)_handleAppWillResignActive:(id)a3
{
}

- (void)speakAction:(id)a3 withPreferredLanguage:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (id)[MEMORY[0x263F228D0] sharedInstance];
  if (![(AXQuickSpeak *)self isPaused])
  {
    int v9 = _AXSAutomationEnabled();
    v10 = (id *)MEMORY[0x263F1D020];
    if (v9)
    {
      Class v11 = (void *)*MEMORY[0x263F1D020];
      objc_super v12 = [(AXQuickSpeak *)self orator];
      BOOL v13 = [v12 content];
      [v11 _accessibilitySetRetainedValue:v13 forKey:@"AXSpeakSelectionLastSpokenString"];
    }
    v14 = [(AXQuickSpeak *)self orator];
    [v14 setSpeakingContext:2];

    v15 = [(AXQuickSpeak *)self orator];
    id v27 = 0;
    int v16 = [v15 startSpeakingWithPreferredLanguage:v7 error:&v27];
    id v17 = v27;

    if (v16)
    {
      self->_lastWholeCharacterLocation = 0;
      self->_lastUnicharLocation = 0;
      [(AXQuickSpeak *)self setQuickSpeakInitiator:v6];
      uint64_t v18 = [(AXQuickSpeak *)self quickSpeakInitiator];
      objc_setAssociatedObject(v18, &QSSelectedTextRangeKey, 0, (void *)1);

      v19 = [(AXQuickSpeak *)self quickSpeakInitiator];
      uint64_t v20 = [v19 _accessibilitySpeakSelectionTextInputResponder];

      if (objc_opt_respondsToSelector()) {
        [v20 _accessibilityStoreSelection];
      }
      -[AXQuickSpeak setCachedIdleTimerPref:](self, "setCachedIdleTimerPref:", [*v10 isIdleTimerDisabled]);
      [*v10 setIdleTimerDisabled:1];
    }
    else
    {
      char v21 = [MEMORY[0x263F213D8] sharedInstance];
      char v22 = [v21 ignoreLogging];

      if (v22)
      {
LABEL_15:

        goto LABEL_16;
      }
      long long v23 = [MEMORY[0x263F213D8] identifier];
      uint64_t v20 = AXLoggerForFacility();

      os_log_type_t v24 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v20, v24))
      {
        long long v25 = AXColorizeFormatLog();
        v26 = _AXStringForArgs();
        if (os_log_type_enabled(v20, v24))
        {
          *(_DWORD *)buf = 138543362;
          v29 = v26;
          _os_log_impl(&dword_240270000, v20, v24, "%{public}@", buf, 0xCu);
        }
      }
    }

    goto LABEL_15;
  }
  [(AXQuickSpeak *)self resumeAction:0];
LABEL_16:
}

- (void)pauseAction:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  [(AXQuickSpeak *)self setPaused:1];
  id v4 = [(AXQuickSpeak *)self orator];
  id v14 = 0;
  char v5 = [v4 pauseSpeaking:&v14];
  id v6 = v14;

  if ((v5 & 1) == 0)
  {
    id v7 = [MEMORY[0x263F213D8] sharedInstance];
    char v8 = [v7 ignoreLogging];

    if ((v8 & 1) == 0)
    {
      int v9 = [MEMORY[0x263F213D8] identifier];
      v10 = AXLoggerForFacility();

      os_log_type_t v11 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v10, v11))
      {
        objc_super v12 = AXColorizeFormatLog();
        BOOL v13 = _AXStringForArgs();
        if (os_log_type_enabled(v10, v11))
        {
          *(_DWORD *)buf = 138543362;
          int v16 = v13;
          _os_log_impl(&dword_240270000, v10, v11, "%{public}@", buf, 0xCu);
        }
      }
    }
  }
}

- (void)resumeAction:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  [(AXQuickSpeak *)self setPaused:0];
  id v4 = [(AXQuickSpeak *)self orator];
  id v14 = 0;
  char v5 = [v4 resumeSpeaking:&v14];
  id v6 = v14;

  if ((v5 & 1) == 0)
  {
    id v7 = [MEMORY[0x263F213D8] sharedInstance];
    char v8 = [v7 ignoreLogging];

    if ((v8 & 1) == 0)
    {
      int v9 = [MEMORY[0x263F213D8] identifier];
      v10 = AXLoggerForFacility();

      os_log_type_t v11 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v10, v11))
      {
        objc_super v12 = AXColorizeFormatLog();
        BOOL v13 = _AXStringForArgs();
        if (os_log_type_enabled(v10, v11))
        {
          *(_DWORD *)buf = 138543362;
          int v16 = v13;
          _os_log_impl(&dword_240270000, v10, v11, "%{public}@", buf, 0xCu);
        }
      }
    }
  }
}

- (void)stopAction:(id)a3
{
  id v4 = [(AXQuickSpeak *)self orator];
  [v4 stopSpeaking:0];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __27__AXQuickSpeak_stopAction___block_invoke;
  v6[3] = &unk_2650A9ED8;
  v6[4] = self;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __27__AXQuickSpeak_stopAction___block_invoke_2;
  v5[3] = &unk_2650A9F00;
  v5[4] = self;
  [MEMORY[0x263F1CB60] animateWithDuration:v6 animations:v5 completion:0.2];
}

uint64_t __27__AXQuickSpeak_stopAction___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) highlightView];
  [v2 setAlpha:0.0];

  Class v3 = [*(id *)(a1 + 32) sentenceHighlightView];
  [v3 setAlpha:0.0];

  uint64_t v4 = *(void *)(a1 + 32);
  char v5 = *(void **)(v4 + 48);
  *(void *)(v4 + 48) = 0;

  id v6 = *(void **)(a1 + 32);

  return [v6 _manipulateOtherTextViews:1];
}

void __27__AXQuickSpeak_stopAction___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) quickSpeakInitiator];
  objc_setAssociatedObject(v2, &QSSelectedTextRangeKey, 0, (void *)1);

  Class v3 = [*(id *)(a1 + 32) quickSpeakInitiator];
  id v9 = [v3 _accessibilitySpeakSelectionTextInputResponder];

  if (objc_opt_respondsToSelector()) {
    [v9 _accessibilityClearSelection];
  }
  [*(id *)(a1 + 32) setContentOwner:0];
  [*(id *)(a1 + 32) setQuickSpeakInitiator:0];
  uint64_t v4 = [*(id *)(a1 + 32) speakingSentenceRange];

  if (v4) {
    [*(id *)(a1 + 32) setContent:0];
  }
  [*(id *)(a1 + 32) setSpeakingSentenceRange:0];
  char v5 = [*(id *)(a1 + 32) highlightView];
  [v5 removeFromSuperview];

  id v6 = [*(id *)(a1 + 32) sentenceHighlightView];
  [v6 removeFromSuperview];

  [*(id *)(a1 + 32) setHighlightView:0];
  [*(id *)(a1 + 32) setSentenceHighlightView:0];
  [*(id *)(a1 + 32) setSpellOutContent:0];
  uint64_t v7 = *(void *)(a1 + 32);
  char v8 = *(void **)(v7 + 48);
  *(void *)(v7 + 48) = 0;
}

- (void)_manipulateOtherTextViews:(BOOL)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __42__AXQuickSpeak__manipulateOtherTextViews___block_invoke;
  v23[3] = &__block_descriptor_33_e16_v16__0__UIView_8l;
  BOOL v24 = a3;
  char v5 = (void *)MEMORY[0x2455E5100](v23, a2);
  if (!a3)
  {
    id v6 = [(AXQuickSpeak *)self _textSelectionViews];
    [(AXQuickSpeak *)self setHiddenTextSelectionViews:v6];

    uint64_t v7 = [MEMORY[0x263EFF980] array];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    char v8 = [(AXQuickSpeak *)self hiddenTextSelectionViews];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          BOOL v13 = *(void **)(*((void *)&v19 + 1) + 8 * v12);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v14 = [v13 delegate];
            if (v14) {
              [v7 addObject:v14];
            }
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
      }
      while (v10);
    }

    [(AXQuickSpeak *)self setHiddenTextSelectionViewDelegates:v7];
  }
  v15 = [(AXQuickSpeak *)self hiddenTextSelectionViews];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __42__AXQuickSpeak__manipulateOtherTextViews___block_invoke_3;
  v17[3] = &unk_2650A9F70;
  id v18 = v5;
  id v16 = v5;
  [v15 enumerateObjectsUsingBlock:v17];
}

void __42__AXQuickSpeak__manipulateOtherTextViews___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  NSClassFromString(&cfstr_Uitextselectio.isa);
  if (objc_opt_isKindOfClass())
  {
    id v5 = v3;
    AXPerformSafeBlock();
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      LOBYTE(v4) = *(unsigned char *)(a1 + 32);
      [v3 setAlpha:(double)v4];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v3 setHidden:*(unsigned char *)(a1 + 32) == 0];
      }
    }
  }
}

uint64_t __42__AXQuickSpeak__manipulateOtherTextViews___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setVisible:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __42__AXQuickSpeak__manipulateOtherTextViews___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_viewsWithBlock:(id)a3
{
  unint64_t v4 = (unsigned int (**)(id, void *))a3;
  id v5 = [(AXQuickSpeak *)self highlightView];

  if (!v5) {
    _AXAssert();
  }
  id v6 = [(AXQuickSpeak *)self highlightView];
  uint64_t v7 = [v6 window];

  id v8 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v9 = [v7 subviews];
  uint64_t v10 = (void *)[v8 initWithArray:v9];

  uint64_t v11 = (void *)MEMORY[0x263F1CA90];
  uint64_t v12 = [v7 windowScene];
  BOOL v13 = [v11 activeTextEffectsWindowForWindowScene:v12];

  if (v13)
  {
    id v14 = [v13 subviews];
    [v10 addObjectsFromArray:v14];
  }
  v15 = [MEMORY[0x263EFF980] array];
  while ([v10 count])
  {
    id v16 = [v10 lastObject];
    [v10 removeLastObject];
    if (v4[2](v4, v16)) {
      [v15 addObject:v16];
    }
    uint64_t v17 = [v16 subviews];
    [v10 addObjectsFromArray:v17];
  }

  return v15;
}

- (id)_textSelectionViews
{
  id v3 = [(AXQuickSpeak *)self highlightView];
  unint64_t v4 = [v3 superview];

  if (objc_opt_respondsToSelector())
  {
    id v5 = [v4 safeValueForKey:@"interactionAssistant"];
    id v6 = [v5 safeValueForKey:@"selectionView"];
  }
  else
  {
    id v6 = 0;
  }
  uint64_t v7 = [MEMORY[0x263EFF980] array];
  id v8 = [(AXQuickSpeak *)self _viewsWithBlock:&__block_literal_global_550];
  if (v8) {
    [v7 addObjectsFromArray:v8];
  }
  uint64_t v9 = [v6 superview];

  if (v9) {
    [v7 addObject:v6];
  }
  uint64_t v10 = [(AXQuickSpeak *)self _viewsWithBlock:&__block_literal_global_555];
  if ([v10 count])
  {
    if (!v10) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  uint64_t v12 = [(AXQuickSpeak *)self _quickSpeakInputInitiator];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v13 = [v12 safeValueForKey:@"_accessibilitySpeakTextSelectionViews"];

    uint64_t v10 = (void *)v13;
  }

  if (v10) {
LABEL_10:
  }
    [v7 addObjectsFromArray:v10];
LABEL_11:

  return v7;
}

uint64_t __35__AXQuickSpeak__textSelectionViews__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Uiselectiongra.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __35__AXQuickSpeak__textSelectionViews__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Uitextselectio.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_cleanupTextSelectionViews
{
  self->_lastQuickSpeakOffset = (CGPoint)*MEMORY[0x263F00148];
}

uint64_t __42__AXQuickSpeak__cleanupTextSelectionViews__block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __42__AXQuickSpeak__cleanupTextSelectionViews__block_invoke_2;
  v3[3] = &unk_2650A9ED8;
  uint64_t v4 = *(void *)(a1 + 32);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __42__AXQuickSpeak__cleanupTextSelectionViews__block_invoke_3;
  v2[3] = &unk_2650A9F00;
  v2[4] = v4;
  return [MEMORY[0x263F1CB60] animateWithDuration:v3 animations:v2 completion:0.25];
}

uint64_t __42__AXQuickSpeak__cleanupTextSelectionViews__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) highlightView];
  [v2 setAlpha:0.0];

  id v3 = [*(id *)(a1 + 32) sentenceHighlightView];
  [v3 setAlpha:0.0];

  uint64_t v4 = *(void **)(a1 + 32);

  return [v4 _manipulateOtherTextViews:1];
}

uint64_t __42__AXQuickSpeak__cleanupTextSelectionViews__block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) highlightView];
  [v2 removeFromSuperview];

  [*(id *)(a1 + 32) setHighlightView:0];
  id v3 = [*(id *)(a1 + 32) sentenceHighlightView];
  [v3 removeFromSuperview];

  [*(id *)(a1 + 32) setSentenceHighlightView:0];
  [*(id *)(a1 + 32) setHiddenTextSelectionViews:0];
  uint64_t v4 = *(void **)(a1 + 32);

  return [v4 setHiddenTextSelectionViewDelegates:0];
}

- (void)_handlePauseCallback
{
  objc_msgSend((id)*MEMORY[0x263F1D020], "setIdleTimerDisabled:", -[AXQuickSpeak cachedIdleTimerPref](self, "cachedIdleTimerPref"));

  [(AXQuickSpeak *)self _cleanupTextSelectionViews];
}

- (void)_scrollToTextRect:(CGRect)a3 withScrollView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  rect_8 = (UIView *)a4;
  if (![(UIView *)rect_8 isHidden])
  {
    uint64_t v9 = [(UIView *)rect_8 window];
    if (v9)
    {
      uint64_t v10 = (void *)v9;
      int v11 = [(UIView *)rect_8 isScrollEnabled];

      if (v11)
      {
        [(UIView *)rect_8 contentOffset];
        double v13 = self->_lastQuickSpeakOffset.x;
        if (vabdd_f64(v13, v14) >= 5.0)
        {
          BOOL v16 = 0;
          double v15 = self->_lastQuickSpeakOffset.y;
        }
        else
        {
          double v15 = self->_lastQuickSpeakOffset.y;
          BOOL v16 = vabdd_f64(v15, v12) < 5.0;
        }
        BOOL v17 = v15 == *(double *)(MEMORY[0x263F00148] + 8) && v13 == *MEMORY[0x263F00148];
        if (v17 || v16)
        {
          v58.origin.double x = x;
          v58.origin.double y = y;
          v58.size.double width = width;
          v58.size.double height = height;
          UIAccessibilityZoomFocusChanged((UIAccessibilityZoomType)4, v58, rect_8);
          [(UIView *)rect_8 bounds];
          CGFloat rect = v19;
          CGFloat v21 = v20;
          CGFloat v23 = v22;
          CGFloat v25 = v24;
          [(UIView *)rect_8 adjustedContentInset];
          double v30 = -v29;
          BOOL v31 = v29 < -0.0;
          double v32 = 0.0;
          if (v31) {
            double v30 = 0.0;
          }
          if (v26 >= -0.0) {
            double v33 = -v26;
          }
          else {
            double v33 = 0.0;
          }
          if (v27 >= -0.0) {
            double v34 = -v27;
          }
          else {
            double v34 = 0.0;
          }
          if (v28 >= -0.0) {
            double v32 = -v28;
          }
          double v35 = x + v33;
          double v36 = y + v30;
          double v37 = width - (v33 + v32);
          double v38 = height - (v30 + v34);
          v59.origin.double x = rect;
          v59.origin.double y = v21;
          v59.size.double width = v23;
          v59.size.double height = v25;
          CGRect v60 = CGRectInset(v59, 0.0, 20.0);
          double v39 = v60.origin.x;
          double v40 = v60.origin.y;
          double v41 = v60.size.width;
          double v42 = v60.size.height;
          v61.origin.double x = v35;
          v61.origin.double y = v36;
          v61.size.double width = v37;
          v61.size.double height = v38;
          if (!CGRectContainsRect(v60, v61) && v42 >= v38)
          {
            [(UIView *)rect_8 contentOffset];
            double v45 = v35 + v37;
            if (v35 < v39) {
              double v43 = v35;
            }
            if (v45 >= v39 + v41) {
              double v46 = v45 - v41;
            }
            else {
              double v46 = v43;
            }
            double v47 = v36 + v38;
            if (v36 + v38 >= v40 + v42)
            {
              double v47 = -25.0;
              double v48 = v36 + -25.0;
            }
            else if (v36 < v40)
            {
              double v48 = v36;
            }
            else
            {
              double v48 = v44;
            }
            [(UIView *)rect_8 bounds];
            double v50 = v49;
            [(UIView *)rect_8 contentSize];
            double v52 = v48 + v50 - v51;
            if (v52 <= 0.0)
            {
              v54 = rect_8;
            }
            else
            {
              double v53 = v48 - v52;
              v54 = rect_8;
              if (v53 > 0.0) {
                double v48 = v53;
              }
            }
            -[UIView setContentOffset:animated:](v54, "setContentOffset:animated:", 1, v46, v48);
            self->_lastQuickSpeakOffset.double x = v46;
            self->_lastQuickSpeakOffset.double y = v48;
          }
        }
      }
    }
  }

  MEMORY[0x270F9A758]();
}

- (_NSRange)_updatedRangeForComposedCharacters:(_NSRange)a3 string:(id)a4 lastKnownWholeCharacterLocation:(unint64_t)a5 lastKnownUnicharLocation:(unint64_t)a6
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  for (id i = a4; a6 < location; a6 += v11)
  {
    ++a5;
    [i rangeOfComposedCharacterSequenceAtIndex:a6];
  }
  unint64_t v12 = location + length;
  if (a5 >= location + length)
  {
    NSUInteger v13 = 0;
  }
  else
  {
    NSUInteger v13 = 0;
    unint64_t v14 = a5;
    do
    {
      [i rangeOfComposedCharacterSequenceAtIndex:v14];
      ++v13;
      v14 += v15;
    }
    while (v14 < v12);
  }

  NSUInteger v16 = a5;
  NSUInteger v17 = v13;
  result.NSUInteger length = v17;
  result.NSUInteger location = v16;
  return result;
}

- (id)_quickSpeakInputInitiator
{
  id v3 = [(AXQuickSpeak *)self quickSpeakInitiator];
  if ([v3 conformsToProtocol:&unk_26F444270])
  {
    if (v3) {
      goto LABEL_7;
    }
    goto LABEL_3;
  }
  uint64_t v4 = [(AXQuickSpeak *)self quickSpeakInitiator];
  uint64_t v5 = [v4 _accessibilitySpeakSelectionTextInputResponder];

  id v3 = (void *)v5;
  if (!v5)
  {
    id v6 = [(AXQuickSpeak *)self contentOwner];
    id v3 = [v6 _accessibilitySpeakSelectionTextInputResponder];

    if (!v3)
    {
      id v3 = [(AXQuickSpeak *)self quickSpeakInitiator];
      if (!v3) {
LABEL_3:
      }
        AXPerformBlockOnMainThreadAfterDelay();
    }
  }
LABEL_7:

  return v3;
}

uint64_t __41__AXQuickSpeak__quickSpeakInputInitiator__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) orator];
  [v2 clearSelectedContent];

  id v3 = *(void **)(a1 + 32);

  return [v3 stopAction:0];
}

- (id)_rectsByUnionSamelineRects:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "CGRectValue", (void)v11);
          QSUnionRectsWithRect();
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)_sentenceRects:(id)a3 speakingRange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x263EFF980] array];
  uint64_t v9 = [v6 safeValueForKey:@"_accessibilityQuickSpeakTokenizer"];
  uint64_t v10 = AXUISentenceTextRangeForInput();
  currentSentenceRange = self->_currentSentenceRange;
  p_currentSentenceRange = &self->_currentSentenceRange;
  if (([v10 isEqual:currentSentenceRange] & 1) == 0)
  {
    objc_storeStrong((id *)p_currentSentenceRange, v10);
    long long v13 = [v6 _accessibilitySentenceRectsForRange:v7];
    uint64_t v14 = [v13 mutableCopy];

    uint64_t v8 = (void *)v14;
  }

  return v8;
}

- (id)_sentenceHighlightOverlapHeightArray
{
  id v2 = [MEMORY[0x263EFF980] array];
  if (CachedSentenceRects && [(id)CachedSentenceRects count])
  {
    id v3 = [(id)CachedSentenceRects objectAtIndex:0];
    [v3 rectValue];
    double v5 = v4;

    id v6 = [(id)CachedSentenceRects objectAtIndex:0];
    [v6 rectValue];
    double v8 = v7;

    if ((unint64_t)[(id)CachedSentenceRects count] >= 2)
    {
      unint64_t v9 = 1;
      do
      {
        uint64_t v10 = [(id)CachedSentenceRects objectAtIndex:v9];
        [v10 rectValue];
        double v12 = v11;

        double v13 = v8 + v5 - v12;
        uint64_t v14 = [(id)CachedSentenceRects objectAtIndex:v9];
        [v14 rectValue];
        double v5 = v15;

        *(float *)&double v16 = v13;
        NSUInteger v17 = [NSNumber numberWithFloat:v16];
        [v2 addObject:v17];

        ++v9;
        double v8 = v12;
      }
      while ([(id)CachedSentenceRects count] > v9);
    }
    id v18 = [NSNumber numberWithFloat:0.0];
    [v2 addObject:v18];
  }

  return v2;
}

- (void)_willSpeakRange:(_NSRange)a3 string:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v7 = a4;
  double v8 = [(AXQuickSpeak *)self _quickSpeakInputInitiator];
  unint64_t v9 = [MEMORY[0x263EFF980] array];
  uint64_t v10 = [MEMORY[0x263EFF980] array];
  double v11 = (CGRect *)MEMORY[0x263F001A8];
  CGSize v12 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
  v28.origin = (CGPoint)*MEMORY[0x263F001A8];
  v28.size = v12;
  if (objc_opt_respondsToSelector())
  {
    -[AXQuickSpeak _quickSpeakTextRects:withRange:string:highlightRects:sentenceRects:singleTextRect:](self, "_quickSpeakTextRects:withRange:string:highlightRects:sentenceRects:singleTextRect:", v8, location, length, v7, v9, v10, &v28);
  }
  else if ([v8 conformsToProtocol:&unk_26F444270])
  {
    -[AXQuickSpeak _quickSpeakUITextInputTextRects:withRange:string:highlightRects:sentenceRects:singleTextRect:](self, "_quickSpeakUITextInputTextRects:withRange:string:highlightRects:sentenceRects:singleTextRect:", v8, location, length, v7, v9, v10, &v28);
  }
  else
  {
    double v13 = [MEMORY[0x263F213D8] sharedInstance];
    char v14 = [v13 ignoreLogging];

    if ((v14 & 1) == 0)
    {
      double v15 = [MEMORY[0x263F213D8] identifier];
      double v16 = AXLoggerForFacility();

      os_log_type_t v17 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v16, v17))
      {
        AXColorizeFormatLog();
        v26 = CGFloat v25 = v8;
        double v27 = _AXStringForArgs();
        if (os_log_type_enabled(v16, v17))
        {
          *(_DWORD *)buf = 138543362;
          double v30 = v27;
          _os_log_impl(&dword_240270000, v16, v17, "%{public}@", buf, 0xCu);
        }
      }
    }
    objc_msgSend(v8, "_accessibilityQuickSpeakTextRectsWithRange:string:highlightRects:sentenceRects:singleTextRect:", location, length, v7, v9, v10, &v28, v25);
  }
  if ([v9 count] || !CGRectEqualToRect(*v11, v28))
  {
    -[AXQuickSpeak _handleQuickSpeakHighlight:sentenceRects:textRect:initiator:](self, "_handleQuickSpeakHighlight:sentenceRects:textRect:initiator:", v9, v10, v8, *(_OWORD *)&v28.origin, *(_OWORD *)&v28.size);
  }
  else
  {
    id v18 = [MEMORY[0x263F213D8] sharedInstance];
    char v19 = [v18 ignoreLogging];

    if ((v19 & 1) == 0)
    {
      double v20 = [MEMORY[0x263F213D8] identifier];
      CGFloat v21 = AXLoggerForFacility();

      os_log_type_t v22 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v21, v22))
      {
        CGFloat v23 = AXColorizeFormatLog();
        double v24 = _AXStringForArgs();
        if (os_log_type_enabled(v21, v22))
        {
          *(_DWORD *)buf = 138543362;
          double v30 = v24;
          _os_log_impl(&dword_240270000, v21, v22, "%{public}@", buf, 0xCu);
        }
      }
    }
  }
}

- (_NSRange)modifiedRange:(_NSRange)a3 withString:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  NSUInteger v7 = -[AXQuickSpeak _updatedRangeForComposedCharacters:string:lastKnownWholeCharacterLocation:lastKnownUnicharLocation:](self, "_updatedRangeForComposedCharacters:string:lastKnownWholeCharacterLocation:lastKnownUnicharLocation:", a3.location, a3.length, a4, self->_lastWholeCharacterLocation, self->_lastUnicharLocation);
  self->_lastWholeCharacterLocation = v7 + v8;
  self->_lastUnicharLocation = location + length;
  result.NSUInteger length = v8;
  result.NSUInteger location = v7;
  return result;
}

- (void)_quickSpeakTextRects:(id)a3 withRange:(_NSRange)a4 string:(id)a5 highlightRects:(id)a6 sentenceRects:(id)a7 singleTextRect:(CGRect *)a8
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v33 = a3;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  uint64_t v17 = -[AXQuickSpeak modifiedRange:withString:](self, "modifiedRange:withString:", location, length, v16);
  char v19 = objc_msgSend(v16, "substringWithRange:", v17, v18);

  double v20 = [v33 _accessibilityRetrieveRectsForGuanularity:1 atSelectionOffset:v17 wordText:v19];
  CGFloat v21 = [(AXQuickSpeak *)self _rectsByUnionSamelineRects:v20];
  [v15 axSafelyAddObjectsFromArray:v21];

  if ([v20 count])
  {
    os_log_type_t v22 = [v20 firstObject];
    [v22 CGRectValue];
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    CGFloat v30 = v29;
  }
  else
  {
    CGFloat v24 = *MEMORY[0x263F001A8];
    CGFloat v26 = *(double *)(MEMORY[0x263F001A8] + 8);
    CGFloat v28 = *(double *)(MEMORY[0x263F001A8] + 16);
    CGFloat v30 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  uint64_t v31 = [v33 _accessibilityRetrieveRectsForGuanularity:2 atSelectionOffset:v17 wordText:v19];
  double v32 = [(AXQuickSpeak *)self _rectsByUnionSamelineRects:v31];
  [v14 axSafelyAddObjectsFromArray:v32];

  a8->origin.double x = v24;
  a8->origin.double y = v26;
  a8->size.double width = v28;
  a8->size.double height = v30;
}

- (void)_quickSpeakUITextInputTextRects:(id)a3 withRange:(_NSRange)a4 string:(id)a5 highlightRects:(id)a6 sentenceRects:(id)a7 singleTextRect:(CGRect *)a8
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a5;
  id v45 = a6;
  id v44 = a7;
  uint64_t v16 = -[AXQuickSpeak modifiedRange:withString:](self, "modifiedRange:withString:", location, length, v15);
  uint64_t v18 = v17;
  char v19 = [(AXQuickSpeak *)self quickSpeakInitiator];
  double v20 = objc_getAssociatedObject(v19, &QSSelectedTextRangeKey);

  if (!v20)
  {
    CGFloat v21 = [(AXQuickSpeak *)self speakingSentenceRange];

    if (v21) {
      [(AXQuickSpeak *)self speakingSentenceRange];
    }
    else {
    double v20 = [v14 selectedTextRange];
    }
    os_log_type_t v22 = [(AXQuickSpeak *)self quickSpeakInitiator];
    objc_setAssociatedObject(v22, &QSSelectedTextRangeKey, v20, (void *)1);
  }
  double v23 = [v20 start];
  CGFloat v24 = [v14 positionFromPosition:v23 offset:v16];

  uint64_t v25 = [v14 positionFromPosition:v24 offset:v18];
  CGFloat v26 = (void *)v25;
  if (v24 && v25)
  {
    double v27 = [v14 textRangeFromPosition:v24 toPosition:v25];
    CGSize v28 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
    *(_OWORD *)buf = *MEMORY[0x263F001A8];
    CGSize v47 = v28;
    if (objc_opt_respondsToSelector())
    {
      double v29 = objc_msgSend(v15, "substringWithRange:", v16, v18);
      CGFloat v30 = [v14 _accessibilityTextRectsForRange:v27 singleTextRect:buf selectedRange:v20 string:v29];
    }
    else
    {
      CGFloat v30 = [v14 _accessibilityTextRectsForRange:v27 singleTextRect:buf];
    }
    [v45 axSafelyAddObjectsFromArray:v30];
    double v39 = [(AXQuickSpeak *)self _sentenceRects:v14 speakingRange:v27];
    [v44 axSafelyAddObjectsFromArray:v39];
    CGSize v40 = v47;
    a8->origin = *(CGPoint *)buf;
    a8->size = v40;

LABEL_17:
    goto LABEL_18;
  }
  uint64_t v31 = [MEMORY[0x263F213D8] sharedInstance];
  char v32 = [v31 ignoreLogging];

  if ((v32 & 1) == 0)
  {
    id v33 = [MEMORY[0x263F213D8] identifier];
    double v27 = AXLoggerForFacility();

    os_log_type_t v34 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v27, v34))
    {
      uint64_t v35 = AXColorizeFormatLog();
      [v20 start];
      double v36 = type = v34;
      double v37 = [NSNumber numberWithUnsignedInteger:v16];
      double v41 = [NSNumber numberWithUnsignedInteger:v18];
      double v43 = (void *)v35;
      double v38 = _AXStringForArgs();

      if (os_log_type_enabled(v27, type))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v38;
        _os_log_impl(&dword_240270000, v27, type, "%{public}@", buf, 0xCu);
      }
    }
    goto LABEL_17;
  }
LABEL_18:
}

- (id)_sliceRects:(id)a3 withSentenceRects:(id)a4 wordRects:(id)a5
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v48 = a3;
  id v7 = a4;
  id v8 = a5;
  unint64_t v9 = v8;
  if (v7)
  {
    id v45 = [MEMORY[0x263EFF980] array];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v44 = v7;
    obuint64_t j = v7;
    uint64_t v10 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
    if (!v10) {
      goto LABEL_30;
    }
    uint64_t v11 = v10;
    uint64_t v47 = *(void *)v54;
    while (1)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v54 != v47) {
          objc_enumerationMutation(obj);
        }
        double v13 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        [v13 rectValue];
        double v15 = v14;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        id v16 = v9;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v49 objects:v57 count:16];
        if (!v17)
        {

LABEL_27:
          [v48 addObject:v13];
          continue;
        }
        uint64_t v18 = v17;
        char v19 = v9;
        char v20 = 0;
        float v21 = v15;
        uint64_t v22 = *(void *)v50;
        double v23 = v21;
        double v24 = 1.17549435e-38;
        double v25 = 3.40282347e38;
        do
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if (*(void *)v50 != v22) {
              objc_enumerationMutation(v16);
            }
            double v27 = *(void **)(*((void *)&v49 + 1) + 8 * j);
            [v27 rectValue];
            if (vabdd_f64(v23, v28) <= 1.0)
            {
              if ((v20 & 1) == 0) {
                char v20 = 1;
              }
              [v27 rectValue];
              if (v25 >= v29) {
                double v25 = v29;
              }
              [v27 rectValue];
              double Width = CGRectGetWidth(v61);
              if (v24 < Width) {
                double v24 = Width;
              }
            }
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v49 objects:v57 count:16];
        }
        while (v18);

        unint64_t v9 = v19;
        if ((v20 & 1) == 0) {
          goto LABEL_27;
        }
        [v13 rectValue];
        float Height = CGRectGetHeight(v62);
        [v13 rectValue];
        float v33 = v32;
        double v34 = v33;
        if (v25 >= v33) {
          double v35 = v25;
        }
        else {
          double v35 = v33;
        }
        CGFloat v36 = vabdd_f64(v34, v35);
        CGFloat v37 = Height;
        [v13 rectValue];
        double v38 = CGRectGetWidth(v63);
        v64.origin.double x = v34;
        v64.origin.double y = v23;
        v64.size.double width = v36;
        v64.size.double height = v37;
        double v39 = vabdd_f64(v38 - CGRectGetWidth(v64), v24);
        CGSize v40 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", v34, v23, v36, v37);
        [v48 addObject:v40];

        double v41 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", v24 + v35, v23, v39, v37);
        [v48 addObject:v41];

        double v42 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:", v35, v23, v24, v37);
        [v45 addObject:v42];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
      if (!v11)
      {
LABEL_30:

        id v7 = v44;
        goto LABEL_32;
      }
    }
  }
  id v45 = v8;
LABEL_32:

  return v45;
}

- (void)_handleQuickSpeakHighlight:(id)a3 sentenceRects:(id)a4 textRect:(CGRect)a5 initiator:(id)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  uint64_t v125 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = [v15 textInputView];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v17 = [(AXQuickSpeak *)self quickSpeakInitiator];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v16 = v17;
    }
    else
    {
      id v16 = v15;

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        id v16 = 0;
      }
    }
  }
  uint64_t v18 = [v16 _accessibilitySpeakSelectionAssociatedScrollView];
  if (v18)
  {
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v19 = [v18 superview];

      uint64_t v18 = (void *)v19;
    }
    while (v19);
  }
  v110 = v13;
  id v20 = v18;
  v113 = v16;
  objc_msgSend(v16, "convertRect:toView:", v20, x, y, width, height);
  v107 = v20;
  -[AXQuickSpeak _scrollToTextRect:withScrollView:](self, "_scrollToTextRect:withScrollView:", v20);
  if (v14 && [v14 count])
  {
    objc_storeStrong((id *)&CachedSentenceRects, a4);
    uint64_t v21 = [(AXQuickSpeak *)self _sentenceHighlightOverlapHeightArray];
    uint64_t v22 = (void *)CachedSentenceHighlightOverlapHeights;
    CachedSentenceHighlightOverlapHeights = v21;
  }
  v112 = self;
  v109 = v14;
  v114 = [MEMORY[0x263EFF980] array];
  long long v120 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  id v23 = (id)CachedSentenceRects;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v120 objects:v124 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v121;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v121 != v26) {
          objc_enumerationMutation(v23);
        }
        double v28 = *(void **)(*((void *)&v120 + 1) + 8 * i);
        [v28 rectValue];
        double v30 = v29;
        double v32 = v31;
        double v34 = v33;
        double v36 = v35;
        CGFloat v37 = [MEMORY[0x263F22938] sharedInstance];
        uint64_t v38 = [v37 quickSpeakSentenceHighlightOption];

        if (v38 == 2 && [(id)CachedSentenceRects indexOfObject:v28] != 0x7FFFFFFFFFFFFFFFLL)
        {
          unint64_t v39 = [(id)CachedSentenceRects indexOfObject:v28];
          if (CachedSentenceHighlightOverlapHeights)
          {
            if ([(id)CachedSentenceHighlightOverlapHeights count] > v39)
            {
              CGSize v40 = [(id)CachedSentenceHighlightOverlapHeights objectAtIndex:v39];
              [v40 floatValue];
              double v36 = v36 - v41;
            }
          }
        }
        double v42 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:", v30, v32, v34, v36);
        [v114 addObject:v42];
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v120 objects:v124 count:16];
    }
    while (v25);
  }

  double v43 = [MEMORY[0x263EFF980] array];
  id v44 = [MEMORY[0x263F22938] sharedInstance];
  if ([v44 quickSpeakHighlightOption] == 3)
  {
    id v45 = [MEMORY[0x263F22938] sharedInstance];
    uint64_t v46 = [v45 quickSpeakSentenceHighlightOption];

    BOOL v47 = v46 == 2;
    long long v49 = v110;
    id v48 = v112;
    long long v50 = v113;
    if (v47)
    {
      uint64_t v51 = [(AXQuickSpeak *)v112 _sliceRects:v43 withSentenceRects:v114 wordRects:v110];

      long long v49 = (void *)v51;
      goto LABEL_30;
    }
  }
  else
  {

    long long v49 = v13;
    id v48 = v112;
    long long v50 = v113;
  }
  [v43 addObjectsFromArray:v114];
LABEL_30:
  if (!_AXSQuickSpeakHighlightTextEnabled()) {
    goto LABEL_85;
  }
  long long v52 = [(AXQuickSpeak *)v48 highlightView];

  if (!v52)
  {
    id v53 = objc_alloc(MEMORY[0x263F222C0]);
    double v54 = *MEMORY[0x263F001A8];
    double v55 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v56 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v57 = *(double *)(MEMORY[0x263F001A8] + 24);
    CGRect v58 = objc_msgSend(v53, "initWithFrame:", *MEMORY[0x263F001A8], v55, v56, v57);
    [v58 setAlpha:0.0];
    uint64_t v59 = [MEMORY[0x263F22938] sharedInstance];
    uint64_t v60 = [v59 quickSpeakWordHighlightColor];

    v111 = v58;
    if (!v60)
    {
      unint64_t v67 = 0x263F1C000uLL;
      if (objc_opt_respondsToSelector()) {
        [v15 selectionHighlightColor];
      }
      else {
      v74 = [MEMORY[0x263F1C550] safeValueForKey:@"selectionHighlightColor"];
      }
      double v118 = 0.0;
      double v119 = 0.0;
      uint64_t v116 = 0;
      double v117 = 0.0;
      [v74 getRed:&v119 green:&v118 blue:&v117 alpha:&v116];
      double v75 = v119 * 0.9;
      if (v119 * 0.9 < 0.0) {
        double v75 = 0.0;
      }
      double v76 = v118 * 0.9;
      if (v118 * 0.9 < 0.0) {
        double v76 = 0.0;
      }
      double v77 = v117 * 0.9;
      if (v117 * 0.9 < 0.0) {
        double v77 = 0.0;
      }
      uint64_t v70 = [MEMORY[0x263F1C550] colorWithRed:v75 green:v76 blue:v77 alpha:0.5];
      goto LABEL_49;
    }
    CGRect v61 = [MEMORY[0x263F22938] sharedInstance];
    [v61 quickSpeakWordHighlightColor];
    uint64_t v62 = AXSpeakHighlightColor();

    CGRect v63 = [MEMORY[0x263F1C550] colorWithCGColor:v62];
    CGRect v64 = [MEMORY[0x263F22938] sharedInstance];
    uint64_t v65 = [v64 quickSpeakSentenceHighlightColor];
    v66 = [MEMORY[0x263F22938] sharedInstance];
    unint64_t v67 = 0x263F1C000;
    if (v65 == [v66 quickSpeakWordHighlightColor])
    {
      v68 = [MEMORY[0x263F22938] sharedInstance];
      uint64_t v69 = [v68 quickSpeakHighlightOption];

      if (v69 != 3)
      {
LABEL_40:
        uint64_t v70 = [v63 colorWithAlphaComponent:0.5];

        v71 = [MEMORY[0x263F22938] sharedInstance];
        [v71 quickSpeakSentenceHighlightColor];
        uint64_t v72 = AXSpeakHighlightColor();

        v73 = [MEMORY[0x263F1C550] colorWithCGColor:v72];
        v74 = [v73 colorWithAlphaComponent:0.5];

        CGRect v58 = v111;
LABEL_49:
        v106 = (void *)v70;
        [v58 setSelectionColor:v70];
        v108 = v74;
        if ([v43 count])
        {
          v78 = objc_msgSend(objc_alloc(MEMORY[0x263F222C0]), "initWithFrame:", v54, v55, v56, v57);
          [v78 setSentenceHighlight:1];
          [v78 setAlpha:0.0];
          [v78 setSelectionColor:v74];
        }
        else
        {
          v78 = 0;
        }
        v79 = [MEMORY[0x263F086E0] mainBundle];
        v80 = [v79 bundleIdentifier];
        int v81 = [v80 isEqualToString:*MEMORY[0x263F21370]];

        v82 = [MEMORY[0x263F22938] sharedInstance];
        uint64_t v83 = [v82 quickSpeakSentenceHighlightColor];

        if (v83)
        {
          v84 = [MEMORY[0x263F22938] sharedInstance];
          [v84 quickSpeakSentenceHighlightColor];
          uint64_t v85 = AXSpeakHighlightColor();

          v86 = [MEMORY[0x263F1C550] colorWithCGColor:v85];
        }
        else
        {
          v86 = [MEMORY[0x263F1C550] labelColor];
          if (v81)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v87 = [v113 backgroundColor];
              if (v87)
              {
                uint64_t v88 = AXInvertColorForColor();

                v86 = (void *)v88;
              }
            }
          }
        }
        [v78 setUnderlineColor:v86];

        uint64_t v89 = objc_opt_class();
        if (v89)
        {
          v90 = (objc_class *)v89;
          unint64_t v91 = v67;
          while (1)
          {
            v92 = NSStringFromClass(v90);
            if (([v92 isEqualToString:@"WKContentView"] & 1) != 0
              || [v92 isEqualToString:@"UIWebBrowserView"])
            {
              break;
            }
            v90 = (objc_class *)[(objc_class *)v90 superclass];

            if (!v90)
            {
              int v93 = 0;
              goto LABEL_67;
            }
          }

          int v93 = 1;
        }
        else
        {
          unint64_t v91 = v67;
          int v93 = 0;
        }
LABEL_67:
        NSClassFromString(&cfstr_Sxcanvasview.isa);
        long long v50 = v113;
        int isKindOfClass = objc_opt_isKindOfClass();
        NSClassFromString(&cfstr_Tsdcanvasview.isa);
        int v95 = (v93 | objc_opt_isKindOfClass()) & v81;
        id v48 = v112;
        if (v95 == 1)
        {
          v96 = [v113 superview];

          if (v96)
          {
            if (v78)
            {
              v97 = [v113 superview];
              [v97 addSubview:v78];
            }
            v98 = [v113 superview];
            [v98 addSubview:v111];
          }
        }
        else if ((v93 | isKindOfClass))
        {
          if (v78) {
            [v113 addSubview:v78];
          }
          [v113 addSubview:v111];
        }
        else
        {
          [v113 insertSubview:v111 atIndex:0];
          if (v78) {
            [v113 insertSubview:v78 atIndex:0];
          }
        }
        [v113 bounds];
        objc_msgSend(v111, "setFrame:");
        [v113 bounds];
        objc_msgSend(v78, "setFrame:");
        [(AXQuickSpeak *)v112 setHighlightView:v111];
        v99 = [(AXQuickSpeak *)v112 highlightView];
        v100 = [v99 superview];
        [v100 setAutoresizesSubviews:1];

        if (v78 && ![(AXQuickSpeak *)v112 spellOutContent])
        {
          [(AXQuickSpeak *)v112 setSentenceHighlightView:v78];
          v101 = [(AXQuickSpeak *)v112 sentenceHighlightView];
          v102 = [v101 superview];
          [v102 setAutoresizesSubviews:1];
        }
        v103 = *(void **)(v91 + 2912);
        v115[0] = MEMORY[0x263EF8330];
        v115[1] = 3221225472;
        v115[2] = __76__AXQuickSpeak__handleQuickSpeakHighlight_sentenceRects_textRect_initiator___block_invoke;
        v115[3] = &unk_2650A9ED8;
        v115[4] = v112;
        [v103 animateWithDuration:v115 animations:0.25];

        goto LABEL_82;
      }
      AXSlightlyDarkerColorForColor();
      CGRect v63 = v64 = v63;
    }
    else
    {
    }
    goto LABEL_40;
  }
LABEL_82:
  v104 = [(AXQuickSpeak *)v48 highlightView];
  [v104 setHighlightSelectionRects:v49];

  if ([v43 count] && !-[AXQuickSpeak spellOutContent](v48, "spellOutContent"))
  {
    v105 = [(AXQuickSpeak *)v48 sentenceHighlightView];
    [v105 setHighlightSelectionRects:v43];
  }
LABEL_85:
}

void __76__AXQuickSpeak__handleQuickSpeakHighlight_sentenceRects_textRect_initiator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _manipulateOtherTextViews:0];
  id v2 = [*(id *)(a1 + 32) highlightView];
  [v2 setAlpha:1.0];

  id v3 = [*(id *)(a1 + 32) sentenceHighlightView];
  [v3 setAlpha:1.0];
}

- (BOOL)isSpeaking
{
  id v2 = [(AXQuickSpeak *)self orator];
  char v3 = [v2 isSpeaking];

  return v3;
}

- (void)speakStatusWithLanguage:(id)a3 rate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AXQuickSpeak *)self orator];
  [v8 speakStatusWithLanguage:v7 rate:v6];
}

- (BOOL)selectedContentIsSpeakable
{
  id v2 = [(AXQuickSpeak *)self orator];
  char v3 = [v2 contentIsSpeakable];

  return v3;
}

- (BOOL)selectedContentRequiresUserChoice
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v2 = [(AXQuickSpeak *)self selectedContent];
  char v3 = [MEMORY[0x263F228D0] sharedInstance];
  double v4 = [v3 systemLanguageID];

  double v5 = [v2 predictedSecondaryLangMaps];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    BOOL v7 = 1;
  }
  else
  {
    id v8 = [v2 unpredictedAmbiguousLangMaps];
    unint64_t v9 = [v8 count];

    if (v9 >= 2)
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      uint64_t v10 = [v2 ambiguousLangMaps];
      id v11 = (id)[v10 countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v32;
        while (2)
        {
          for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v32 != v12) {
              objc_enumerationMutation(v10);
            }
            id v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            id v15 = [v14 generalLanguageID];
            int v16 = [v15 isEqualToString:v4];

            if (v16)
            {
              id v11 = v14;
              goto LABEL_15;
            }
          }
          id v11 = (id)[v10 countByEnumeratingWithState:&v31 objects:v36 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }
LABEL_15:

      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      uint64_t v17 = objc_msgSend(v2, "ambiguousLangMaps", 0);
      uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v28;
        while (2)
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v28 != v20) {
              objc_enumerationMutation(v17);
            }
            id v22 = *(id *)(*((void *)&v27 + 1) + 8 * j);
            if (v11 != v22)
            {
              id v23 = [v11 associatedAmbiguousLanguages];
              uint64_t v24 = [v22 generalLanguageID];
              int v25 = [v23 containsObject:v24];

              if (!v25)
              {
                BOOL v7 = 1;
                goto LABEL_26;
              }
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
          if (v19) {
            continue;
          }
          break;
        }
      }

      uint64_t v17 = [v2 unpredictedAmbiguousLangMaps];
      BOOL v7 = (unint64_t)[v17 count] > 1;
LABEL_26:
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (void)oratorDidFinishSpeaking:(id)a3
{
  objc_msgSend((id)*MEMORY[0x263F1D020], "setIdleTimerDisabled:", -[AXQuickSpeak cachedIdleTimerPref](self, "cachedIdleTimerPref", a3));
  [(AXQuickSpeak *)self stopAction:0];
  double v4 = [(AXQuickSpeak *)self orator];
  [v4 clearSelectedContent];

  double v5 = [(AXQuickSpeak *)self quickSpeakInitiator];
  [v5 _accessibilityHandleFinishSpeaking];

  [(AXQuickSpeak *)self _cleanupTextSelectionViews];
}

- (void)oratorDidResumeSpeaking:(id)a3
{
  char v3 = (void **)MEMORY[0x263F1D020];
  -[AXQuickSpeak setCachedIdleTimerPref:](self, "setCachedIdleTimerPref:", objc_msgSend((id)*MEMORY[0x263F1D020], "isIdleTimerDisabled", a3));
  double v4 = *v3;

  [v4 setIdleTimerDisabled:1];
}

- (void)orator:(id)a3 willSpeakRange:(_NSRange)a4 ofContent:(id)a5
{
  id v6 = a5;
  BOOL v7 = [(AXQuickSpeak *)self highlightViewDispatcher];

  if (!v7)
  {
    id v8 = objc_alloc(MEMORY[0x263F21398]);
    unint64_t v9 = (void *)[v8 initWithTargetSerialQueue:MEMORY[0x263EF83A0]];
    [(AXQuickSpeak *)self setHighlightViewDispatcher:v9];
  }
  uint64_t v11 = MEMORY[0x263EF8330];
  id v10 = v6;
  AXPerformSafeBlock();
  objc_msgSend((id)*MEMORY[0x263F1D020], "setIdleTimerDisabled:", 1, v11, 3221225472, __48__AXQuickSpeak_orator_willSpeakRange_ofContent___block_invoke, &unk_2650A9FB8, self);
}

uint64_t __48__AXQuickSpeak_orator_willSpeakRange_ofContent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_willSpeakRange:string:", *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 40));
}

- (UITextRange)speakingSentenceRange
{
  return self->speakingSentenceRange;
}

- (void)setSpeakingSentenceRange:(id)a3
{
}

- (BOOL)cachedIdleTimerPref
{
  return self->_cachedIdleTimerPref;
}

- (void)setCachedIdleTimerPref:(BOOL)a3
{
  self->_cachedIdleTimerPref = a3;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (id)quickSpeakInitiator
{
  return self->_quickSpeakInitiator;
}

- (void)setQuickSpeakInitiator:(id)a3
{
}

- (QSSelectionHighlightView)highlightView
{
  return self->_highlightView;
}

- (void)setHighlightView:(id)a3
{
}

- (NSArray)hiddenTextSelectionViews
{
  return self->_hiddenTextSelectionViews;
}

- (void)setHiddenTextSelectionViews:(id)a3
{
}

- (QSSelectionHighlightView)sentenceHighlightView
{
  return self->_sentenceHighlightView;
}

- (void)setSentenceHighlightView:(id)a3
{
}

- (NSArray)hiddenTextSelectionViewDelegates
{
  return self->_hiddenTextSelectionDelegates;
}

- (void)setHiddenTextSelectionViewDelegates:(id)a3
{
}

- (AXDispatchTimer)highlightViewDispatcher
{
  return self->_highlightViewDispatcher;
}

- (void)setHighlightViewDispatcher:(id)a3
{
}

- (id)contentOwner
{
  return self->_contentOwner;
}

- (void)setContentOwner:(id)a3
{
}

- (BOOL)hasTextBalloonView
{
  return self->_hasTextBalloonView;
}

- (void)setHasTextBalloonView:(BOOL)a3
{
  self->_hasTextBalloonView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_contentOwner, 0);
  objc_storeStrong((id *)&self->_highlightViewDispatcher, 0);
  objc_storeStrong((id *)&self->_hiddenTextSelectionDelegates, 0);
  objc_storeStrong((id *)&self->_sentenceHighlightView, 0);
  objc_storeStrong((id *)&self->_hiddenTextSelectionViews, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong(&self->_quickSpeakInitiator, 0);
  objc_storeStrong((id *)&self->speakingSentenceRange, 0);
  objc_storeStrong((id *)&self->_currentSentenceRange, 0);

  objc_storeStrong((id *)&self->_orator, 0);
}

@end