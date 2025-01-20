@interface _SFReaderWebProcessPlugInPageController
+ (id)readerPageControllerForContextHandle:(id)a3;
- (OpaqueJSValue)originalArticleFinder;
- (_SFReaderWebProcessPlugInPageController)initWithPlugIn:(id)a3 contextController:(id)a4;
- (_SFWebProcessPlugInReaderEnabledPageController)originalPageController;
- (id).cxx_construct;
- (id)collectReaderContentFromPrintAndMailingFrame;
- (id)isolatedWorldForNextPageDetection;
- (id)printingMailingFrame;
- (void)_initializeReaderJSControllerForFrame:(id)a3;
- (void)loadNewArticle;
- (void)reloadArticle;
- (void)setArticleLocale:(id)a3;
- (void)setArticleSummary:(id)a3 withSummaryHeader:(id)a4 tableOfContentsHeader:(id)a5 readerURLString:(id)a6 titles:(id)a7 paths:(id)a8 trailingText:(id)a9;
- (void)setConfiguration:(id)a3;
- (void)setOnDeviceSummaryButtonWithTitle:(id)a3;
- (void)setOriginalPageController:(id)a3;
- (void)setReaderIsActive:(BOOL)a3;
- (void)webProcessPlugInBrowserContextController:(id)a3 globalObjectIsAvailableForFrame:(id)a4 inScriptWorld:(id)a5;
- (void)willDestroyBrowserContextController:(id)a3;
@end

@implementation _SFReaderWebProcessPlugInPageController

- (_SFReaderWebProcessPlugInPageController)initWithPlugIn:(id)a3 contextController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_SFReaderWebProcessPlugInPageController;
  v8 = [(WBSWebProcessPlugInPageController *)&v15 initWithPlugIn:v6 contextController:v7];
  if (v8)
  {
    v9 = (void *)contextHandleToReaderPageController;
    if (!contextHandleToReaderPageController)
    {
      uint64_t v10 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
      v11 = (void *)contextHandleToReaderPageController;
      contextHandleToReaderPageController = v10;

      v9 = (void *)contextHandleToReaderPageController;
    }
    v12 = [v7 handle];
    [v9 setObject:v8 forKey:v12];

    v13 = v8;
  }

  return v8;
}

- (void)willDestroyBrowserContextController:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_originalPageController);
  [WeakRetained setReaderPageController:0];

  [(WKWebProcessPlugInScriptWorld *)self->_isolatedWorldForNextPageDetection clearWrappers];
  value = self->_readerJSController.__ptr_.__value_;
  self->_readerJSController.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(WebProcessPlugInReaderJSController *))(*(void *)value + 8))(value);
  }
  v7.receiver = self;
  v7.super_class = (Class)_SFReaderWebProcessPlugInPageController;
  [(WBSWebProcessPlugInPageController *)&v7 willDestroyBrowserContextController:v4];
}

+ (id)readerPageControllerForContextHandle:(id)a3
{
  v3 = [(id)contextHandleToReaderPageController objectForKey:a3];

  return v3;
}

- (OpaqueJSValue)originalArticleFinder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_originalPageController);
  v3 = (OpaqueJSValue *)[WeakRetained originalArticleFinder];

  return v3;
}

- (void)_initializeReaderJSControllerForFrame:(id)a3
{
  id v4 = a3;
  if (!self->_readerJSController.__ptr_.__value_) {
    operator new();
  }
}

- (void)loadNewArticle
{
  value = self->_readerJSController.__ptr_.__value_;
  if (value) {
    MEMORY[0x1F414A4C8](value, a2);
  }
}

- (void)reloadArticle
{
  value = self->_readerJSController.__ptr_.__value_;
  if (value) {
    MEMORY[0x1F414A5A0](value, a2);
  }
}

- (void)setConfiguration:(id)a3
{
  v5 = (NSDictionary *)a3;
  value = self->_readerJSController.__ptr_.__value_;
  if (value) {
    SafariShared::ReaderJSController::setConfiguration((SafariShared::ReaderJSController *)value, v5);
  }
}

- (void)setReaderIsActive:(BOOL)a3
{
  if (self->_readerJSController.__ptr_.__value_) {
    MEMORY[0x1F414A4E8]();
  }
}

- (void)setArticleLocale:(id)a3
{
  v5 = (NSString *)a3;
  value = self->_readerJSController.__ptr_.__value_;
  if (value) {
    SafariShared::ReaderJSController::setArticleLocale((SafariShared::ReaderJSController *)value, v5);
  }
}

- (void)setArticleSummary:(id)a3 withSummaryHeader:(id)a4 tableOfContentsHeader:(id)a5 readerURLString:(id)a6 titles:(id)a7 paths:(id)a8 trailingText:(id)a9
{
  id v21 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  if (self->_readerJSController.__ptr_.__value_) {
    SafariShared::ReaderJSController::setArticleSummary();
  }
}

- (void)setOnDeviceSummaryButtonWithTitle:(id)a3
{
  v5 = (NSString *)a3;
  value = self->_readerJSController.__ptr_.__value_;
  if (value) {
    SafariShared::ReaderJSController::setOnDeviceSummaryButtonWithTitle((SafariShared::ReaderJSController *)value, v5);
  }
}

- (id)isolatedWorldForNextPageDetection
{
  isolatedWorldForNextPageDetection = self->_isolatedWorldForNextPageDetection;
  if (!isolatedWorldForNextPageDetection)
  {
    id v4 = [MEMORY[0x1E4F466E8] world];
    v5 = self->_isolatedWorldForNextPageDetection;
    self->_isolatedWorldForNextPageDetection = v4;

    [(WKWebProcessPlugInScriptWorld *)self->_isolatedWorldForNextPageDetection makeAllShadowRootsOpen];
    [(WKWebProcessPlugInScriptWorld *)self->_isolatedWorldForNextPageDetection disableOverrideBuiltinsBehavior];
    isolatedWorldForNextPageDetection = self->_isolatedWorldForNextPageDetection;
  }

  return isolatedWorldForNextPageDetection;
}

- (id)collectReaderContentFromPrintAndMailingFrame
{
  value = (SafariServices::WebProcessPlugInReaderJSController *)self->_readerJSController.__ptr_.__value_;
  if (value)
  {
    SafariServices::WebProcessPlugInReaderJSController::contentInPrintingMailingFrame(value);
    value = (SafariServices::WebProcessPlugInReaderJSController *)objc_claimAutoreleasedReturnValue();
  }

  return value;
}

- (id)printingMailingFrame
{
  value = (SafariShared::JSUtilities **)self->_readerJSController.__ptr_.__value_;
  if (value)
  {
    SafariServices::WebProcessPlugInReaderJSController::printingMailingFrame(value);
    value = (SafariShared::JSUtilities **)objc_claimAutoreleasedReturnValue();
  }

  return value;
}

- (void)webProcessPlugInBrowserContextController:(id)a3 globalObjectIsAvailableForFrame:(id)a4 inScriptWorld:(id)a5
{
  id v7 = a4;
  id v6 = [(WBSWebProcessPlugInPageController *)self mainFrame];

  if (v6 == v7) {
    [(_SFReaderWebProcessPlugInPageController *)self _initializeReaderJSControllerForFrame:v7];
  }
}

- (_SFWebProcessPlugInReaderEnabledPageController)originalPageController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_originalPageController);

  return (_SFWebProcessPlugInReaderEnabledPageController *)WeakRetained;
}

- (void)setOriginalPageController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_originalPageController);
  objc_storeStrong((id *)&self->_isolatedWorldForNextPageDetection, 0);
  value = self->_readerJSController.__ptr_.__value_;
  self->_readerJSController.__ptr_.__value_ = 0;
  if (value)
  {
    id v4 = *(void (**)(void))(*(void *)value + 8);
    v4();
  }
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  return self;
}

@end