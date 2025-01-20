@interface _SFReaderController
- (BOOL)_readerWebViewIsReady;
- (BOOL)_webView:(id)a3 performDataInteractionOperationWithItemProviders:(id)a4;
- (BOOL)_webView:(id)a3 shouldIncludeAppLinkActionsForElement:(id)a4;
- (BOOL)canDecreaseReaderTextSize;
- (BOOL)canIncreaseReaderTextSize;
- (BOOL)contentIsReady;
- (BOOL)doesPageUseSearchEngineOptimizationMetadata;
- (BOOL)isLoadingNextPage;
- (BOOL)isReaderAvailable;
- (BOOL)shouldCreateArticleFinder;
- (NSString)readerLanguageTag;
- (NSString)readerTextForSummarization;
- (NSString)unfilteredArticleText;
- (NSString)webpageIdentifier;
- (NSURL)readerURL;
- (WBSReaderConfigurationManager)configurationManager;
- (WBSReaderFontManager)fontManager;
- (WKUIDelegatePrivate)webViewUIDelegate;
- (WKWebView)readerWebView;
- (WKWebView)webView;
- (_SFReaderController)initWithWebView:(id)a3;
- (_SFReaderControllerDelegate)delegate;
- (id)_webView:(id)a3 actionsForElement:(id)a4 defaultActions:(id)a5;
- (id)readerControllerProxy;
- (id)scrollPositionInformation;
- (int64_t)currentAppearance;
- (unint64_t)_webView:(id)a3 willUpdateDataInteractionOperationToOperation:(unint64_t)a4 forSession:(id)a5;
- (void)_collectReaderContentForMailWithCompletion:(id)a3;
- (void)_performActionsDelayedUntilReaderWebViewIsReady;
- (void)_saveConfigurationAndSendToWebProcess;
- (void)_sendReaderAvailabilityNotificationForState:(id)a3 reason:(int64_t)a4;
- (void)_setUpReaderActivityListener;
- (void)_updateJavaScriptEnabled;
- (void)_webView:(id)a3 contextMenuConfigurationForElement:(id)a4 completionHandler:(id)a5;
- (void)_webView:(id)a3 contextMenuDidEndForElement:(id)a4;
- (void)_webView:(id)a3 contextMenuForElement:(id)a4 willCommitWithAnimator:(id)a5;
- (void)_webView:(id)a3 contextMenuWillPresentForElement:(id)a4;
- (void)_webView:(id)a3 dataInteraction:(id)a4 session:(id)a5 didEndWithOperation:(unint64_t)a6;
- (void)_webView:(id)a3 dataInteraction:(id)a4 sessionWillBegin:(id)a5;
- (void)_webView:(id)a3 dataInteractionOperationWasHandled:(BOOL)a4 forSession:(id)a5 itemProviders:(id)a6;
- (void)_webView:(id)a3 getAlternateURLFromImage:(id)a4 completionHandler:(id)a5;
- (void)activateFont:(id)a3;
- (void)checkReaderAvailability;
- (void)collectArticleContent;
- (void)collectReaderContentForMailWithCompletion:(id)a3;
- (void)collectReadingListInfoWithBookmarkID:(int)a3 completionHandler:(id)a4;
- (void)contentDidBecomeReadyWithArticleText:(id)a3;
- (void)createArticleFinder;
- (void)deactivateReaderNow:(unint64_t)a3;
- (void)dealloc;
- (void)decreaseReaderTextSize;
- (void)didCollectArticleContent:(id)a3;
- (void)didCollectReaderContentForMail:(id)a3;
- (void)didCollectReadingListItemInfo:(id)a3 bookmarkID:(id)a4;
- (void)didCreateReaderWebView:(id)a3;
- (void)didDetermineAdditionalTextSamples:(id)a3;
- (void)didDetermineReaderAvailability:(id)a3;
- (void)didDetermineReaderAvailabilityForDynamicCheck:(id)a3;
- (void)didEncounterErrorForSummarization:(id)a3;
- (void)didFinishPresentationUpdateAfterTransitioningToReader;
- (void)didFinishSummarization:(id)a3;
- (void)didPrepareReaderContentForPrinting:(id)a3;
- (void)didRequestOnDeviceSummary;
- (void)didSetReaderConfiguration:(id)a3;
- (void)didSetSummary;
- (void)getReaderArticleTitleWithCompletion:(id)a3;
- (void)increaseReaderTextSize;
- (void)invalidate;
- (void)loadNewArticle;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)owningWebViewDidCommitNavigation;
- (void)prepareReaderPrintingIFrameWithCompletion:(id)a3;
- (void)readerTextWasExtracted:(id)a3 withMetadata:(id)a4 wasDeterminingAvailabilility:(BOOL)a5;
- (void)reportReaderEvent:(int64_t)a3 dataToReport:(id)a4;
- (void)resetReaderTextSize;
- (void)sendConfigurationToWebProcess;
- (void)setArticleSummary:(id)a3 withSummaryHeader:(id)a4 tableOfContentsHeader:(id)a5 readerURLString:(id)a6 titles:(id)a7 paths:(id)a8 trailingText:(id)a9;
- (void)setContentIsReady:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDoesPageUseSearchEngineOptimizationMetadata:(BOOL)a3;
- (void)setOnDeviceSummaryButtonWithTitle:(id)a3;
- (void)setReaderAvailable:(BOOL)a3;
- (void)setReaderFont:(id)a3;
- (void)setReaderInitialTopScrollOffset:(int64_t)a3 configuration:(id)a4 isViewingArchive:(BOOL)a5;
- (void)setReaderInitialTopScrollOffset:(int64_t)a3 configuration:(id)a4 isViewingArchive:(BOOL)a5 scrollOffsetDictionary:(id)a6;
- (void)setReaderIsActive:(BOOL)a3;
- (void)setReaderLanguageTag:(id)a3;
- (void)setReaderTextForSummarization:(id)a3;
- (void)setReaderTheme:(int64_t)a3 forAppearance:(int64_t)a4;
- (void)setUpReaderWebViewIfNeededAndPerformBlock:(id)a3;
- (void)setWebViewUIDelegate:(id)a3;
- (void)setWebpageIdentifier:(id)a3;
- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
@end

@implementation _SFReaderController

- (WBSReaderConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setWebViewUIDelegate:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (_SFReaderController)initWithWebView:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)_SFReaderController;
  id v3 = a3;
  v4 = [(_SFReaderController *)&v13 init];
  objc_storeWeak((id *)&v4->_webView, v3);

  [(_SFReaderController *)v4 _setUpReaderActivityListener];
  v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  bookmarkIdentifierToReadingListItemInfoCompletionMap = v4->_bookmarkIdentifierToReadingListItemInfoCompletionMap;
  v4->_bookmarkIdentifierToReadingListItemInfoCompletionMap = v5;

  id v7 = objc_alloc_init(MEMORY[0x1E4F98D70]);
  v8 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  [v8 addObserver:v4 forKeyPath:*MEMORY[0x1E4F78940] options:3 context:kvoContext_0];
  v9 = [v8 dictionaryForKey:*MEMORY[0x1E4F789A8]];
  uint64_t v10 = [objc_alloc(MEMORY[0x1E4F98D60]) initWithPersistedSettingsAsDictionaryRepresentation:v9 fontManager:v7 prefersLargerDefaultFontSize:_SFDeviceIsPad()];
  configurationManager = v4->_configurationManager;
  v4->_configurationManager = (WBSReaderConfigurationManager *)v10;

  objc_storeWeak((id *)&v4->_fontManager, v7);
  [(WBSReaderConfigurationManager *)v4->_configurationManager setIsOLEDDisplay:MGGetBoolAnswer()];
  [(_SFReaderController *)v4 _updateJavaScriptEnabled];

  return v4;
}

- (void)_updateJavaScriptEnabled
{
  objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSReaderConfigurationManager setJavaScriptEnabled:](self->_configurationManager, "setJavaScriptEnabled:", objc_msgSend(v3, "safari_isJavaScriptEnabled"));
}

- (void)_setUpReaderActivityListener
{
  id v3 = [MEMORY[0x1E4F46788] remoteObjectInterfaceWithProtocol:&unk_1EFC2C300];
  eventsListenerInterface = self->_eventsListenerInterface;
  self->_eventsListenerInterface = v3;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  id v6 = [WeakRetained _remoteObjectRegistry];

  [v6 registerExportedObject:self interface:self->_eventsListenerInterface];
}

- (void)dealloc
{
  id v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  [v3 removeObserver:self forKeyPath:*MEMORY[0x1E4F78940] context:kvoContext_0];

  [(_SFReaderController *)self invalidate];
  v4.receiver = self;
  v4.super_class = (Class)_SFReaderController;
  [(_SFReaderController *)&v4 dealloc];
}

- (void)invalidate
{
  if (self->_eventsListenerInterface)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
    objc_super v4 = [WeakRetained _remoteObjectRegistry];

    [v4 unregisterExportedObject:self interface:self->_eventsListenerInterface];
    eventsListenerInterface = self->_eventsListenerInterface;
    self->_eventsListenerInterface = 0;
  }

  objc_storeWeak((id *)&self->_readerControllerProxy, 0);
}

- (id)readerControllerProxy
{
  p_readerControllerProxy = &self->_readerControllerProxy;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_readerControllerProxy);
  if (!WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_webView);
    id v6 = [v5 _remoteObjectRegistry];

    id v7 = [MEMORY[0x1E4F46788] remoteObjectInterfaceWithProtocol:&unk_1EFC56440];
    id WeakRetained = [v6 remoteObjectProxyWithInterface:v7];
  }
  objc_storeWeak((id *)p_readerControllerProxy, WeakRetained);

  return WeakRetained;
}

- (void)setReaderInitialTopScrollOffset:(int64_t)a3 configuration:(id)a4 isViewingArchive:(BOOL)a5
{
}

- (void)setReaderInitialTopScrollOffset:(int64_t)a3 configuration:(id)a4 isViewingArchive:(BOOL)a5 scrollOffsetDictionary:(id)a6
{
  BOOL v6 = a5;
  id v13 = a6;
  id v10 = a4;
  v11 = [(_SFReaderController *)self readerControllerProxy];
  [v11 setReaderInitialTopScrollOffset:a3 configuration:v10 isViewingArchive:v6];

  if (v13)
  {
    v12 = [(_SFReaderController *)self readerControllerProxy];
    [v12 setInitalArticleScrollPositionAsDictionary:v13];
  }
}

- (void)collectReadingListInfoWithBookmarkID:(int)a3 completionHandler:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  BOOL v6 = NSNumber;
  id v7 = a4;
  id v11 = [v6 numberWithInt:v4];
  bookmarkIdentifierToReadingListItemInfoCompletionMap = self->_bookmarkIdentifierToReadingListItemInfoCompletionMap;
  v9 = (void *)[v7 copy];

  [(NSMutableDictionary *)bookmarkIdentifierToReadingListItemInfoCompletionMap setObject:v9 forKey:v11];
  id v10 = [(_SFReaderController *)self readerControllerProxy];
  [v10 collectReadingListItemInfoWithBookmarkID:v11];
}

- (void)prepareReaderPrintingIFrameWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = (void *)[v4 copy];
  id readerPrintContentCompletionHandler = self->_readerPrintContentCompletionHandler;
  self->_id readerPrintContentCompletionHandler = v5;

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65___SFReaderController_prepareReaderPrintingIFrameWithCompletion___block_invoke;
  v8[3] = &unk_1E5C73B20;
  objc_copyWeak(&v10, &location);
  id v7 = v4;
  id v9 = v7;
  [(_SFReaderController *)self setUpReaderWebViewIfNeededAndPerformBlock:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (BOOL)_readerWebViewIsReady
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = objc_opt_respondsToSelector();

  id v5 = objc_loadWeakRetained((id *)&self->_readerWebView);
  BOOL contentIsReady = v5 != 0;
  if (v5 && (v4 & 1) != 0) {
    BOOL contentIsReady = self->_contentIsReady;
  }

  return contentIsReady;
}

- (void)_performActionsDelayedUntilReaderWebViewIsReady
{
  [(NSTimer *)self->_actionsDelayedUntilReaderWebViewIsReadyTimer invalidate];
  actionsDelayedUntilReaderWebViewIsReadyTimer = self->_actionsDelayedUntilReaderWebViewIsReadyTimer;
  self->_actionsDelayedUntilReaderWebViewIsReadyTimer = 0;

  actionsDelayedUntilReaderWebViewIsReady = (void (**)(id, BOOL))self->_actionsDelayedUntilReaderWebViewIsReady;
  if (actionsDelayedUntilReaderWebViewIsReady)
  {
    actionsDelayedUntilReaderWebViewIsReady[2](actionsDelayedUntilReaderWebViewIsReady, [(_SFReaderController *)self _readerWebViewIsReady]);
    id v5 = self->_actionsDelayedUntilReaderWebViewIsReady;
  }
  else
  {
    id v5 = 0;
  }
  self->_actionsDelayedUntilReaderWebViewIsReady = 0;
}

- (void)setUpReaderWebViewIfNeededAndPerformBlock:(id)a3
{
  char v4 = (void (**)(id, BOOL))a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  BOOL v6 = [(_SFReaderController *)self _readerWebViewIsReady];
  if (v6 || (objc_opt_respondsToSelector() & 1) == 0)
  {
    if (v4) {
      v4[2](v4, v6);
    }
  }
  else if (self->_actionsDelayedUntilReaderWebViewIsReady)
  {
    id v7 = (void *)MEMORY[0x1AD0C36A0]();
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __65___SFReaderController_setUpReaderWebViewIfNeededAndPerformBlock___block_invoke;
    v16[3] = &unk_1E5C73B48;
    id v17 = v7;
    v18 = v4;
    id v8 = v7;
    id v9 = (void *)MEMORY[0x1AD0C36A0](v16);
    id actionsDelayedUntilReaderWebViewIsReady = self->_actionsDelayedUntilReaderWebViewIsReady;
    self->_id actionsDelayedUntilReaderWebViewIsReady = v9;
  }
  else
  {
    id v11 = (void *)MEMORY[0x1AD0C36A0](v4);
    id v12 = self->_actionsDelayedUntilReaderWebViewIsReady;
    self->_id actionsDelayedUntilReaderWebViewIsReady = v11;

    id v13 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__performActionsDelayedUntilReaderWebViewIsReadyDidTimeout_ selector:0 userInfo:0 repeats:1.0];
    actionsDelayedUntilReaderWebViewIsReadyTimer = self->_actionsDelayedUntilReaderWebViewIsReadyTimer;
    self->_actionsDelayedUntilReaderWebViewIsReadyTimer = v13;

    id v15 = objc_loadWeakRetained((id *)&self->_readerWebView);
    if (!v15) {
      [WeakRetained createReaderWebViewForReaderController:self];
    }
  }
}

- (int64_t)currentAppearance
{
  return [(WBSReaderConfigurationManager *)self->_configurationManager darkModeEnabled];
}

- (BOOL)isLoadingNextPage
{
  return 0;
}

- (BOOL)shouldCreateArticleFinder
{
  return 1;
}

- (void)deactivateReaderNow:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained readerController:self didDeactivateReaderWithMode:a3];
  }
}

- (id)scrollPositionInformation
{
  return 0;
}

- (void)createArticleFinder
{
  id v2 = [(_SFReaderController *)self readerControllerProxy];
  [v2 prepareToTransitionToReader];
}

- (void)didFinishPresentationUpdateAfterTransitioningToReader
{
  id v2 = [(_SFReaderController *)self readerControllerProxy];
  [v2 didFinishPresentationUpdateAfterTransitioningToReader];
}

- (void)didCreateReaderWebView:(id)a3
{
  self->_BOOL contentIsReady = 0;
  p_readerWebView = &self->_readerWebView;
  id v5 = a3;
  objc_storeWeak((id *)p_readerWebView, v5);
  BOOL v6 = [v5 configuration];
  id v7 = [v6 preferences];
  [v7 _setShouldAllowUserInstalledFonts:1];

  id v9 = [v5 _handle];

  [(_SFReaderController *)self createArticleFinder];
  id v8 = [(_SFReaderController *)self readerControllerProxy];
  [v8 didCreateReaderPageContextHandle:v9];
}

- (void)loadNewArticle
{
  id v2 = [(_SFReaderController *)self readerControllerProxy];
  [v2 loadNewReaderArticle];
}

- (NSURL)readerURL
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([WeakRetained readerURLForReaderController:self],
        (char v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v5 = objc_loadWeakRetained((id *)&self->_webView);
    BOOL v6 = [v5 _committedURL];
    char v4 = objc_msgSend(v6, "safari_URLByReplacingSchemeWithString:", @"safari-reader");
  }

  return (NSURL *)v4;
}

- (void)collectReaderContentForMailWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65___SFReaderController_collectReaderContentForMailWithCompletion___block_invoke;
  v6[3] = &unk_1E5C73B20;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(_SFReaderController *)self setUpReaderWebViewIfNeededAndPerformBlock:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_collectReaderContentForMailWithCompletion:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerMailContentCompletionHandlers = &self->_readerMailContentCompletionHandlers;
  readerMailContentCompletionHandlers = self->_readerMailContentCompletionHandlers;
  id v7 = (void *)MEMORY[0x1AD0C36A0]();
  id v8 = [(NSArray *)readerMailContentCompletionHandlers arrayByAddingObject:v7];
  if (v8)
  {
    objc_storeStrong((id *)&self->_readerMailContentCompletionHandlers, v8);
  }
  else
  {
    id v9 = (void *)MEMORY[0x1AD0C36A0](v4);
    v13[0] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    id v11 = *p_readerMailContentCompletionHandlers;
    *p_readerMailContentCompletionHandlers = (NSArray *)v10;
  }
  id v12 = [(_SFReaderController *)self readerControllerProxy];
  [v12 collectReaderContentForMail];
}

- (void)setReaderLanguageTag:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fontManager);
  [WeakRetained updateLanguageTag:v4];

  BOOL v6 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44___SFReaderController_setReaderLanguageTag___block_invoke;
  block[3] = &unk_1E5C73B98;
  block[4] = self;
  objc_copyWeak(&v8, &location);
  dispatch_async(v6, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (NSString)readerLanguageTag
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fontManager);
  id v3 = [WeakRetained languageTag];

  return (NSString *)v3;
}

- (void)setReaderFont:(id)a3
{
  configurationManager = self->_configurationManager;
  p_fontManager = &self->_fontManager;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_fontManager);
  id v8 = [WeakRetained languageTag];
  [(WBSReaderConfigurationManager *)configurationManager setFont:v6 forLanguageTag:v8];

  [(_SFReaderController *)self _saveConfigurationAndSendToWebProcess];
}

- (void)setReaderTheme:(int64_t)a3 forAppearance:(int64_t)a4
{
  [(WBSReaderConfigurationManager *)self->_configurationManager setTheme:a3 forAppearance:a4];

  [(_SFReaderController *)self _saveConfigurationAndSendToWebProcess];
}

- (BOOL)canDecreaseReaderTextSize
{
  return [(WBSReaderConfigurationManager *)self->_configurationManager canMakeTextSmaller];
}

- (BOOL)canIncreaseReaderTextSize
{
  return [(WBSReaderConfigurationManager *)self->_configurationManager canMakeTextBigger];
}

- (void)increaseReaderTextSize
{
  [(WBSReaderConfigurationManager *)self->_configurationManager makeTextBigger];

  [(_SFReaderController *)self _saveConfigurationAndSendToWebProcess];
}

- (void)decreaseReaderTextSize
{
  [(WBSReaderConfigurationManager *)self->_configurationManager makeTextSmaller];

  [(_SFReaderController *)self _saveConfigurationAndSendToWebProcess];
}

- (void)resetReaderTextSize
{
  [(WBSReaderConfigurationManager *)self->_configurationManager resetTextSize];

  [(_SFReaderController *)self _saveConfigurationAndSendToWebProcess];
}

- (void)_saveConfigurationAndSendToWebProcess
{
  id v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  id v4 = [(WBSReaderConfigurationManager *)self->_configurationManager configurationToSave];
  [v3 setObject:v4 forKey:*MEMORY[0x1E4F789A8]];

  [(_SFReaderController *)self sendConfigurationToWebProcess];
}

- (void)sendConfigurationToWebProcess
{
  id v4 = [(_SFReaderController *)self readerControllerProxy];
  id v3 = [(WBSReaderConfigurationManager *)self->_configurationManager configurationToSendToWebPage];
  [v4 setConfiguration:v3];
}

- (void)activateFont:(id)a3
{
  id v4 = a3;
  id v5 = [(_SFReaderController *)self readerControllerProxy];
  [v5 activateFont:v4];
}

- (void)setReaderIsActive:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_SFReaderController *)self readerControllerProxy];
  [v4 setReaderIsActive:v3];
}

- (WBSReaderFontManager)fontManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fontManager);

  return (WBSReaderFontManager *)WeakRetained;
}

- (void)didDetermineReaderAvailability:(id)a3
{
  id v6 = a3;
  self->_readerAvailable = [v6 isReaderAvailable];
  self->_doesPageUseSearchEngineOptimizationMetadata = [v6 doesPageUseSearchEngineOptimizationMetadata];
  if (!self->_readerAvailable)
  {
    unfilteredArticleText = self->_unfilteredArticleText;
    self->_unfilteredArticleText = 0;

    readerTextForSummarization = self->_readerTextForSummarization;
    self->_readerTextForSummarization = 0;
  }
  -[_SFReaderController _sendReaderAvailabilityNotificationForState:reason:](self, "_sendReaderAvailabilityNotificationForState:reason:", v6, [v6 isSameDocumentNavigation]);
}

- (void)_sendReaderAvailabilityNotificationForState:(id)a3 reason:(int64_t)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained readerController:self didDetermineReaderAvailability:v6 dueTo:a4];
  }
  uint64_t v8 = [v6 isReaderAvailable];
  id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v12 = @"isAvailable";
  uint64_t v10 = [NSNumber numberWithBool:v8];
  v13[0] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  [v9 postNotificationName:@"readerAvailabilityDidChange" object:self userInfo:v11];
}

- (void)didSetReaderConfiguration:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained readerController:self didSetReaderConfiguration:v5];
  }
}

- (void)didCollectReadingListItemInfo:(id)a3 bookmarkID:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained readerController:self didCollectReadingListItemInfo:v9 bookmarkID:v6];
  }
  uint64_t v8 = [(NSMutableDictionary *)self->_bookmarkIdentifierToReadingListItemInfoCompletionMap objectForKey:v6];
  if (v8)
  {
    [(NSMutableDictionary *)self->_bookmarkIdentifierToReadingListItemInfoCompletionMap removeObjectForKey:v6];
    ((void (**)(void, id, uint64_t))v8)[2](v8, v9, [v6 unsignedIntValue]);
  }
}

- (void)didCollectReaderContentForMail:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained readerController:self didCollectReaderContentForMail:v4];
  }
  id v6 = self->_readerMailContentCompletionHandlers;
  readerMailContentCompletionHandlers = self->_readerMailContentCompletionHandlers;
  self->_readerMailContentCompletionHandlers = 0;

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v8 = v6;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * v12) + 16))(*(void *)(*((void *)&v13 + 1) + 8 * v12));
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)collectArticleContent
{
  id v2 = [(_SFReaderController *)self readerControllerProxy];
  [v2 collectArticleContent];
}

- (void)didCollectArticleContent:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained readerController:self didCollectArticleContent:v5];
  }
}

- (void)didDetermineAdditionalTextSamples:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(WeakRetained, "readerController:didDetermineAdditionalTextSamples:dueTo:", self, v5, objc_msgSend(v5, "isSameDocumentNavigation"));
  }
}

- (void)didPrepareReaderContentForPrinting:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained readerController:self didPrepareReaderContentForPrinting:v7];
  }
  id v5 = (void (**)(void, void))MEMORY[0x1AD0C36A0](self->_readerPrintContentCompletionHandler);
  if (v5)
  {
    id readerPrintContentCompletionHandler = self->_readerPrintContentCompletionHandler;
    self->_id readerPrintContentCompletionHandler = 0;

    ((void (**)(void, id))v5)[2](v5, v7);
  }
}

- (void)contentDidBecomeReadyWithArticleText:(id)a3
{
  self->_BOOL contentIsReady = 1;
  id v4 = a3;
  [(_SFReaderController *)self _performActionsDelayedUntilReaderWebViewIsReady];
  objc_msgSend(v4, "safari_bestKnownLanguageTag");
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  [(_SFReaderController *)self setReaderLanguageTag:v7];
  id v5 = [(_SFReaderController *)self readerControllerProxy];
  [v5 setArticleLocale:v7];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained readerController:self contentDidBecomeReadyWithDetectedLanguage:v7];
  }
  if (objc_opt_respondsToSelector()) {
    [WeakRetained filteredArticleTextDidBecomeReadyForReaderController:self];
  }
}

- (void)readerTextWasExtracted:(id)a3 withMetadata:(id)a4 wasDeterminingAvailabilility:(BOOL)a5
{
  BOOL v5 = a5;
  id v12 = a3;
  id v8 = a4;
  if (v12 || v8 || !v5)
  {
    uint64_t v9 = (NSString *)[v12 copy];
    unfilteredArticleText = self->_unfilteredArticleText;
    self->_unfilteredArticleText = v9;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained readerController:self didExtractArticleText:v12 withMetadata:v8];
    }
  }
}

- (void)didRequestOnDeviceSummary
{
  if ([MEMORY[0x1E4F782F8] isRestricted])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained didFindSummarizationRestrictionsForReaderController:self];
  }
  else
  {
    if (!self->_summarizer)
    {
      BOOL v3 = (SFOnDeviceSummarization *)objc_alloc_init(MEMORY[0x1E4F782F8]);
      summarizer = self->_summarizer;
      self->_summarizer = v3;

      [(SFOnDeviceSummarization *)self->_summarizer setDelegate:self];
    }
    BOOL v5 = WBS_LOG_CHANNEL_PREFIXBrowsingAssistant();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A690B000, v5, OS_LOG_TYPE_INFO, "Safari did begin summarization animation", buf, 2u);
    }
    [(SFOnDeviceSummarization *)self->_summarizer summarizeArticleText:self->_readerTextForSummarization];
  }
}

- (void)didSetSummary
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_readerWebView);
  if (objc_opt_respondsToSelector()) {
    id v2 = (id)[WeakRetained _enableFinalTextAnimationForElementWithID:@"summary-collapsible-text-id-1"];
  }
}

- (void)reportReaderEvent:(int64_t)a3 dataToReport:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F989B0];
  id v7 = a4;
  id v8 = [v6 sharedManager];
  [v8 donateBrowsingAssistantReaderEventWithWebPageID:self->_webpageIdentifier eventType:a3 dataToReport:v7];
}

- (void)owningWebViewDidCommitNavigation
{
  unfilteredArticleText = self->_unfilteredArticleText;
  self->_unfilteredArticleText = 0;

  readerTextForSummarization = self->_readerTextForSummarization;
  self->_readerTextForSummarization = 0;
}

- (void)checkReaderAvailability
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  id v4 = [WeakRetained _unreachableURL];

  if (!v4)
  {
    id v5 = [(_SFReaderController *)self readerControllerProxy];
    [v5 checkReaderAvailability];
  }
}

- (void)setArticleSummary:(id)a3 withSummaryHeader:(id)a4 tableOfContentsHeader:(id)a5 readerURLString:(id)a6 titles:(id)a7 paths:(id)a8 trailingText:(id)a9
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  id v23 = [(_SFReaderController *)self readerControllerProxy];
  [v23 setArticleSummary:v22 withSummaryHeader:v21 tableOfContentsHeader:v20 readerURLString:v19 titles:v18 paths:v17 trailingText:v16];
}

- (void)setOnDeviceSummaryButtonWithTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(_SFReaderController *)self readerControllerProxy];
  [v5 setOnDeviceSummaryButtonWithTitle:v4];
}

- (void)getReaderArticleTitleWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(_SFReaderController *)self readerControllerProxy];
  [v5 getReaderArticleTitleWithReply:v4];
}

- (void)didFinishSummarization:(id)a3
{
  id v4 = (SFOnDeviceSummarization *)a3;
  if (self->_summarizer == v4)
  {
    id v8 = v4;
    id v5 = [(SFOnDeviceSummarization *)v4 summary];
    uint64_t v6 = [v5 length];

    id v4 = v8;
    if (v6)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (objc_opt_respondsToSelector()) {
        [WeakRetained readerController:self didFinishOnDemandSummarization:v8];
      }

      id v4 = v8;
    }
  }
}

- (void)didEncounterErrorForSummarization:(id)a3
{
  id v4 = (SFOnDeviceSummarization *)a3;
  if (self->_summarizer == v4)
  {
    uint64_t v6 = v4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained readerController:self didEncounterErrorForSummarization:v6];
    }

    id v4 = v6;
  }
}

- (void)didDetermineReaderAvailabilityForDynamicCheck:(id)a3
{
  if (!self->_readerAvailable)
  {
    id v4 = a3;
    self->_readerAvailable = [v4 isReaderAvailable];
    [(_SFReaderController *)self _sendReaderAvailabilityNotificationForState:v4 reason:2];
  }
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id v32 = a3;
  id v8 = a4;
  uint64_t v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v11 = [v8 request];
  if ([v8 _syntheticClickType] == 2 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v12 = [[_SFSyntheticClickContext alloc] initWithWebView:v32 navigationAction:v8];
    [WeakRetained readerController:self didTwoFingerTapLinkInReaderWithContext:v12];
    goto LABEL_4;
  }
  long long v13 = [v8 targetFrame];

  if (!v13 && ![v8 navigationType])
  {
    if (objc_opt_respondsToSelector()) {
      [WeakRetained readerController:self didClickLinkRequestingNewWindowInReaderWithRequest:v11];
    }
    id v19 = (void (*)(void *, uint64_t))v9[2];
LABEL_19:
    id v20 = v9;
    uint64_t v21 = 0;
    goto LABEL_20;
  }
  long long v14 = [v8 targetFrame];
  char v15 = [v14 isMainFrame];

  if (v15)
  {
    id v12 = [v11 URL];
    if ([(_SFSyntheticClickContext *)v12 isFileURL])
    {
      ((void (*)(void *, uint64_t))v9[2])(v9, 1);
      goto LABEL_10;
    }
    if ([(_SFSyntheticClickContext *)v12 safari_hasScheme:@"safari-reader"])
    {
      id v22 = objc_loadWeakRetained((id *)&self->_webView);
      id v23 = [v22 _committedURL];

      uint64_t v24 = [v23 host];
      if (v24)
      {
        v25 = (void *)v24;
        v26 = [(_SFSyntheticClickContext *)v12 host];
        v27 = [v23 host];
        unsigned int v28 = [v26 isEqualToString:v27];

        uint64_t v29 = v28;
      }
      else
      {
        uint64_t v29 = 1;
      }
      ((void (*)(void *, uint64_t))v9[2])(v9, v29);

      goto LABEL_10;
    }
    if (([(_SFSyntheticClickContext *)v12 safari_isDataURL] & 1) == 0)
    {
      v30 = [(_SFSyntheticClickContext *)v12 absoluteString];
      int v31 = objc_msgSend(v30, "safari_isJavaScriptURLString");

      if (!v31 && ![v8 navigationType] && (objc_opt_respondsToSelector() & 1) != 0) {
        [WeakRetained readerController:self didClickLinkInReaderWithRequest:v11];
      }
    }
LABEL_4:
    ((void (*)(void *, void))v9[2])(v9, 0);
LABEL_10:

    goto LABEL_21;
  }
  id v16 = (void *)MEMORY[0x1E4F98D78];
  id v17 = [v32 URL];
  id v18 = [v11 URL];
  LODWORD(v16) = [v16 readerPageWithURL:v17 canLoadFrameWithURL:v18];

  id v19 = (void (*)(void *, uint64_t))v9[2];
  if (!v16) {
    goto LABEL_19;
  }
  id v20 = v9;
  uint64_t v21 = 1;
LABEL_20:
  v19(v20, v21);
LABEL_21:
}

- (void)_webView:(id)a3 getAlternateURLFromImage:(id)a4 completionHandler:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webViewUIDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained _webView:v11 getAlternateURLFromImage:v8 completionHandler:v9];
  }
}

- (id)_webView:(id)a3 actionsForElement:(id)a4 defaultActions:(id)a5
{
  p_webViewUIDelegate = &self->_webViewUIDelegate;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_webViewUIDelegate);
  id v12 = [WeakRetained _webView:v10 actionsForElement:v9 defaultActions:v8];

  return v12;
}

- (BOOL)_webView:(id)a3 shouldIncludeAppLinkActionsForElement:(id)a4
{
  return 0;
}

- (void)_webView:(id)a3 contextMenuConfigurationForElement:(id)a4 completionHandler:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webViewUIDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained _webView:v11 contextMenuConfigurationForElement:v8 completionHandler:v9];
  }
}

- (void)_webView:(id)a3 contextMenuWillPresentForElement:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webViewUIDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained _webView:v8 contextMenuWillPresentForElement:v6];
  }
}

- (void)_webView:(id)a3 contextMenuForElement:(id)a4 willCommitWithAnimator:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webViewUIDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained _webView:v11 contextMenuForElement:v8 willCommitWithAnimator:v9];
  }
}

- (void)_webView:(id)a3 contextMenuDidEndForElement:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webViewUIDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained _webView:v8 contextMenuDidEndForElement:v6];
  }
}

- (void)_webView:(id)a3 dataInteraction:(id)a4 sessionWillBegin:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained _webView:v11 dataInteraction:v8 sessionWillBegin:v9];
  }
}

- (void)_webView:(id)a3 dataInteraction:(id)a4 session:(id)a5 didEndWithOperation:(unint64_t)a6
{
  id v13 = a3;
  id v10 = a4;
  id v11 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained _webView:v13 dataInteraction:v10 session:v11 didEndWithOperation:a6];
  }
}

- (unint64_t)_webView:(id)a3 willUpdateDataInteractionOperationToOperation:(unint64_t)a4 forSession:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    unint64_t v11 = [WeakRetained _webView:v8 willUpdateDataInteractionOperationToOperation:a4 forSession:v9];
  }
  else {
    unint64_t v11 = 0;
  }

  return v11;
}

- (BOOL)_webView:(id)a3 performDataInteractionOperationWithItemProviders:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v9 = [WeakRetained _webView:v6 performDataInteractionOperationWithItemProviders:v7];
  }
  else {
    char v9 = 1;
  }

  return v9;
}

- (void)_webView:(id)a3 dataInteractionOperationWasHandled:(BOOL)a4 forSession:(id)a5 itemProviders:(id)a6
{
  BOOL v8 = a4;
  id v13 = a3;
  id v10 = a5;
  id v11 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained _webView:v13 dataInteractionOperationWasHandled:v8 forSession:v10 itemProviders:v11];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  if ((void *)kvoContext_0 == a6)
  {
    uint64_t v12 = *MEMORY[0x1E4F284E0];
    id v13 = a5;
    uint64_t v11 = [v13 objectForKeyedSubscript:v12];
    uint64_t v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];

    if (v11 | v14 && ([(id)v11 isEqual:v14] & 1) == 0)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __70___SFReaderController_observeValueForKeyPath_ofObject_change_context___block_invoke;
      v15[3] = &unk_1E5C72238;
      id v16 = v10;
      id v17 = self;
      dispatch_async(MEMORY[0x1E4F14428], v15);
    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)_SFReaderController;
    uint64_t v11 = (uint64_t)a5;
    [(_SFReaderController *)&v18 observeValueForKeyPath:v10 ofObject:a4 change:v11 context:a6];
  }
}

- (WKWebView)webView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);

  return (WKWebView *)WeakRetained;
}

- (WKWebView)readerWebView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_readerWebView);

  return (WKWebView *)WeakRetained;
}

- (_SFReaderControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_SFReaderControllerDelegate *)WeakRetained;
}

- (BOOL)isReaderAvailable
{
  return self->_readerAvailable;
}

- (void)setReaderAvailable:(BOOL)a3
{
  self->_readerAvailable = a3;
}

- (BOOL)contentIsReady
{
  return self->_contentIsReady;
}

- (void)setContentIsReady:(BOOL)a3
{
  self->_BOOL contentIsReady = a3;
}

- (WKUIDelegatePrivate)webViewUIDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webViewUIDelegate);

  return (WKUIDelegatePrivate *)WeakRetained;
}

- (NSString)unfilteredArticleText
{
  return self->_unfilteredArticleText;
}

- (NSString)readerTextForSummarization
{
  return self->_readerTextForSummarization;
}

- (void)setReaderTextForSummarization:(id)a3
{
}

- (NSString)webpageIdentifier
{
  return self->_webpageIdentifier;
}

- (void)setWebpageIdentifier:(id)a3
{
}

- (BOOL)doesPageUseSearchEngineOptimizationMetadata
{
  return self->_doesPageUseSearchEngineOptimizationMetadata;
}

- (void)setDoesPageUseSearchEngineOptimizationMetadata:(BOOL)a3
{
  self->_doesPageUseSearchEngineOptimizationMetadata = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webpageIdentifier, 0);
  objc_storeStrong((id *)&self->_readerTextForSummarization, 0);
  objc_storeStrong((id *)&self->_unfilteredArticleText, 0);
  objc_destroyWeak((id *)&self->_webViewUIDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_readerWebView);
  objc_destroyWeak((id *)&self->_webView);
  objc_storeStrong((id *)&self->_summarizer, 0);
  objc_storeStrong((id *)&self->_actionsDelayedUntilReaderWebViewIsReadyTimer, 0);
  objc_storeStrong(&self->_actionsDelayedUntilReaderWebViewIsReady, 0);
  objc_storeStrong((id *)&self->_bookmarkIdentifierToReadingListItemInfoCompletionMap, 0);
  objc_storeStrong(&self->_readerPrintContentCompletionHandler, 0);
  objc_storeStrong((id *)&self->_readerMailContentCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_destroyWeak((id *)&self->_fontManager);
  objc_storeStrong((id *)&self->_eventsListenerInterface, 0);

  objc_destroyWeak((id *)&self->_readerControllerProxy);
}

@end