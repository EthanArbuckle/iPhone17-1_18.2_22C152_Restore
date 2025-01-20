@interface _SFWebProcessPlugInReaderEnabledPageController
- (BOOL)isViewingReadingListArchive;
- (BOOL)readerHasBeenActivatedRecently;
- (NSDictionary)initalArticleScrollPositionAsDictionary;
- (NSDictionary)initialReaderConfiguration;
- (OpaqueJSValue)originalArticleFinder;
- (_SFReaderWebProcessPlugInPageController)readerPageController;
- (_SFWebProcessPlugInReaderEnabledPageController)initWithPlugIn:(id)a3 contextController:(id)a4;
- (id).cxx_construct;
- (id)_appBannerMetaElementInHeaderElement:(id)a3;
- (id)_appBannerMetaTagObserverProxy;
- (id)_searchForSmartAppBannerMetaContent;
- (int64_t)cachedReaderTopScrollOffset;
- (void)_clearReaderControllerInterface;
- (void)_detectAvailabilityAfterDelay:(double)a3 loadEvent:(int)a4;
- (void)_detectReaderAvailabilityAfterSameDocumentNavigation;
- (void)_setUpReaderActivityListenerProxy;
- (void)_setUpReaderControllerInterface;
- (void)activateFont:(id)a3;
- (void)articleContentDidChange;
- (void)checkReaderAvailability;
- (void)collectArticleContent;
- (void)collectReaderContentForMail;
- (void)collectReadingListItemInfoWithBookmarkID:(id)a3;
- (void)didCreateReaderPageContextHandle:(id)a3;
- (void)didDetermineAdditionalTextSamples:(id)a3;
- (void)didDetermineReaderAvailability:(id)a3;
- (void)didRequestOnDeviceSummary;
- (void)didSetReaderConfiguration:(id)a3;
- (void)didSetSummary;
- (void)getReaderArticleTitleWithReply:(id)a3;
- (void)loadNewReaderArticle;
- (void)prepareReaderContentForPrinting;
- (void)prepareToTransitionToReader;
- (void)readerContentDidBecomeReadyWithArticleText:(id)a3;
- (void)readerTextWasExtracted:(id)a3 withMetadata:(id)a4 wasDeterminingAvailability:(BOOL)a5;
- (void)reportReaderEvent:(int64_t)a3 dataToReport:(id)a4;
- (void)setArticleLocale:(id)a3;
- (void)setArticleSummary:(id)a3 withSummaryHeader:(id)a4 tableOfContentsHeader:(id)a5 readerURLString:(id)a6 titles:(id)a7 paths:(id)a8 trailingText:(id)a9;
- (void)setCachedReaderTopScrollOffset:(int64_t)a3;
- (void)setConfiguration:(id)a3;
- (void)setInitalArticleScrollPositionAsDictionary:(id)a3;
- (void)setOnDeviceSummaryButtonWithTitle:(id)a3;
- (void)setReaderInitialTopScrollOffset:(int64_t)a3 configuration:(id)a4 isViewingArchive:(BOOL)a5;
- (void)setReaderIsActive:(BOOL)a3;
- (void)setReaderPageController:(id)a3;
- (void)webProcessPlugInBrowserContextController:(id)a3 didCommitLoadForFrame:(id)a4;
- (void)webProcessPlugInBrowserContextController:(id)a3 didFinishDocumentLoadForFrame:(id)a4;
- (void)webProcessPlugInBrowserContextController:(id)a3 didFinishLoadForFrame:(id)a4;
- (void)webProcessPlugInBrowserContextController:(id)a3 didSameDocumentNavigation:(int64_t)a4 forFrame:(id)a5;
- (void)webProcessPlugInBrowserContextController:(id)a3 didStartProvisionalLoadForFrame:(id)a4;
- (void)webProcessPlugInBrowserContextController:(id)a3 globalObjectIsAvailableForFrame:(id)a4 inScriptWorld:(id)a5;
- (void)webProcessPlugInBrowserContextController:(id)a3 renderingProgressDidChange:(unint64_t)a4;
- (void)willDestroyBrowserContextController:(id)a3;
@end

@implementation _SFWebProcessPlugInReaderEnabledPageController

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  return self;
}

- (_SFWebProcessPlugInReaderEnabledPageController)initWithPlugIn:(id)a3 contextController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)_SFWebProcessPlugInReaderEnabledPageController;
  v8 = [(_SFWebProcessPlugInAutoFillPageController *)&v18 initWithPlugIn:v6 contextController:v7];
  v9 = v8;
  if (v8)
  {
    [(_SFWebProcessPlugInReaderEnabledPageController *)v8 _setUpReaderControllerInterface];
    v10 = [[SFWebProcessPlugInPageExtensionController alloc] initWithBrowserContextController:v7];
    extensionController = v9->_extensionController;
    v9->_extensionController = v10;

    v12 = [[SFWebProcessPlugInCertificateWarningController alloc] initWithPageController:v9];
    certificateWarningController = v9->_certificateWarningController;
    v9->_certificateWarningController = v12;

    v14 = [[_SFWebProcessSharingLinkExtractor alloc] initWithPageController:v9];
    sharingLinkExtractor = v9->_sharingLinkExtractor;
    v9->_sharingLinkExtractor = v14;

    v16 = v9;
  }

  return v9;
}

- (void)_setUpReaderControllerInterface
{
  v3 = [MEMORY[0x1E4F46788] remoteObjectInterfaceWithProtocol:&unk_1EFC56440];
  availabilityControllerInterface = self->_availabilityControllerInterface;
  self->_availabilityControllerInterface = v3;

  id v6 = [(WBSWebProcessPlugInPageController *)self browserContextController];
  v5 = [v6 _remoteObjectRegistry];
  [v5 registerExportedObject:self interface:self->_availabilityControllerInterface];
}

- (void)willDestroyBrowserContextController:(id)a3
{
  id v4 = a3;
  [(_SFWebProcessPlugInReaderEnabledPageController *)self _clearReaderControllerInterface];
  value = self->_readerAvailabilityController.__ptr_.__value_;
  self->_readerAvailabilityController.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(ReaderAvailabilityController *))(*(void *)value + 8))(value);
  }
  [(_SFWebProcessPlugInReaderEnabledPageController *)self setReaderPageController:0];
  extensionController = self->_extensionController;
  self->_extensionController = 0;

  v7.receiver = self;
  v7.super_class = (Class)_SFWebProcessPlugInReaderEnabledPageController;
  [(_SFWebProcessPlugInAutoFillPageController *)&v7 willDestroyBrowserContextController:v4];
}

- (void)articleContentDidChange
{
}

- (void)didDetermineReaderAvailability:(id)a3
{
  id v5 = a3;
  readerActivityListenerProxy = self->_readerActivityListenerProxy;
  if (!readerActivityListenerProxy)
  {
    [(_SFWebProcessPlugInReaderEnabledPageController *)self _setUpReaderActivityListenerProxy];
    readerActivityListenerProxy = self->_readerActivityListenerProxy;
  }
  [(SFReaderEventsListener *)readerActivityListenerProxy didDetermineReaderAvailability:v5];
}

- (void)didDetermineAdditionalTextSamples:(id)a3
{
  id v5 = a3;
  readerActivityListenerProxy = self->_readerActivityListenerProxy;
  if (!readerActivityListenerProxy)
  {
    [(_SFWebProcessPlugInReaderEnabledPageController *)self _setUpReaderActivityListenerProxy];
    readerActivityListenerProxy = self->_readerActivityListenerProxy;
  }
  [(SFReaderEventsListener *)readerActivityListenerProxy didDetermineAdditionalTextSamples:v5];
}

- (void)readerTextWasExtracted:(id)a3 withMetadata:(id)a4 wasDeterminingAvailability:(BOOL)a5
{
  BOOL v5 = a5;
  id v10 = a3;
  id v8 = a4;
  readerActivityListenerProxy = self->_readerActivityListenerProxy;
  if (!readerActivityListenerProxy)
  {
    [(_SFWebProcessPlugInReaderEnabledPageController *)self _setUpReaderActivityListenerProxy];
    readerActivityListenerProxy = self->_readerActivityListenerProxy;
  }
  [(SFReaderEventsListener *)readerActivityListenerProxy readerTextWasExtracted:v10 withMetadata:v8 wasDeterminingAvailabilility:v5];
}

- (void)_setUpReaderActivityListenerProxy
{
  v3 = [(WBSWebProcessPlugInPageController *)self browserContextController];
  id v7 = [v3 _remoteObjectRegistry];

  id v4 = [MEMORY[0x1E4F46788] remoteObjectInterfaceWithProtocol:&unk_1EFC2C300];
  BOOL v5 = [v7 remoteObjectProxyWithInterface:v4];
  readerActivityListenerProxy = self->_readerActivityListenerProxy;
  self->_readerActivityListenerProxy = v5;
}

- (void)_clearReaderControllerInterface
{
  if (self->_readerAvailabilityController.__ptr_.__value_)
  {
    v3 = [(WBSWebProcessPlugInPageController *)self browserContextController];
    id v5 = [v3 _remoteObjectRegistry];

    [v5 unregisterExportedObject:self interface:self->_availabilityControllerInterface];
    availabilityControllerInterface = self->_availabilityControllerInterface;
    self->_availabilityControllerInterface = 0;
  }
}

- (void)_detectAvailabilityAfterDelay:(double)a3 loadEvent:(int)a4
{
  value = self->_readerAvailabilityController.__ptr_.__value_;
  if (!*((unsigned char *)value + 104))
  {
    uint64_t v6 = *(void *)&a4;
    SafariShared::ReaderAvailabilityController::setCanRunAvailabilityDetection((SafariShared::ReaderAvailabilityController *)value);
    id v8 = self->_readerAvailabilityController.__ptr_.__value_;
    v9.n128_f64[0] = a3;
    MEMORY[0x1F414A560](v8, v6, v9);
  }
}

- (void)_detectReaderAvailabilityAfterSameDocumentNavigation
{
  value = self->_readerAvailabilityController.__ptr_.__value_;
  if (!*((unsigned char *)value + 104))
  {
    SafariShared::ReaderAvailabilityController::setCanRunAvailabilityDetection((SafariShared::ReaderAvailabilityController *)value);
    id v4 = self->_readerAvailabilityController.__ptr_.__value_;
    MEMORY[0x1F414A580](v4);
  }
}

- (OpaqueJSValue)originalArticleFinder
{
  result = (OpaqueJSValue *)self->_readerAvailabilityController.__ptr_.__value_;
  if (result) {
    return (OpaqueJSValue *)MEMORY[0x1F414A550](result, a2);
  }
  return result;
}

- (void)setReaderInitialTopScrollOffset:(int64_t)a3 configuration:(id)a4 isViewingArchive:(BOOL)a5
{
  self->_cachedReaderTopScrollOffset = a3;
  objc_storeStrong((id *)&self->_initialReaderConfiguration, a4);
  self->_viewingReadingListArchive = a5;
}

- (void)setConfiguration:(id)a3
{
  id v5 = a3;
  readerPageController = self->_readerPageController;
  if (readerPageController) {
    [(_SFReaderWebProcessPlugInPageController *)readerPageController setConfiguration:v5];
  }
}

- (void)activateFont:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x1E4F24510];
  v7[0] = *MEMORY[0x1E4F24538];
  v7[1] = v4;
  v8[0] = v3;
  v8[1] = MEMORY[0x1E4F1CC38];
  v7[2] = *MEMORY[0x1E4F24518];
  v8[2] = MEMORY[0x1E4F1CC38];
  CTFontDescriptorRef v5 = CTFontDescriptorCreateWithAttributes((CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3]);
  v9[0] = v5;
  CFArrayRef v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

  CTFontDescriptorMatchFontDescriptorsWithProgressHandler(v6, 0, &__block_literal_global_36);
}

- (void)setReaderIsActive:(BOOL)a3
{
  readerPageController = self->_readerPageController;
  if (readerPageController) {
    [(_SFReaderWebProcessPlugInPageController *)readerPageController setReaderIsActive:a3];
  }
}

- (void)setArticleLocale:(id)a3
{
  id v5 = a3;
  readerPageController = self->_readerPageController;
  if (readerPageController) {
    [(_SFReaderWebProcessPlugInPageController *)readerPageController setArticleLocale:v5];
  }
}

- (void)setArticleSummary:(id)a3 withSummaryHeader:(id)a4 tableOfContentsHeader:(id)a5 readerURLString:(id)a6 titles:(id)a7 paths:(id)a8 trailingText:(id)a9
{
  id v22 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  readerPageController = self->_readerPageController;
  if (readerPageController) {
    [(_SFReaderWebProcessPlugInPageController *)readerPageController setArticleSummary:v22 withSummaryHeader:v15 tableOfContentsHeader:v16 readerURLString:v17 titles:v18 paths:v19 trailingText:v20];
  }
}

- (void)setOnDeviceSummaryButtonWithTitle:(id)a3
{
  id v5 = a3;
  readerPageController = self->_readerPageController;
  if (readerPageController) {
    [(_SFReaderWebProcessPlugInPageController *)readerPageController setOnDeviceSummaryButtonWithTitle:v5];
  }
}

- (void)getReaderArticleTitleWithReply:(id)a3
{
  uint64_t v4 = (void (**)(id, void *))a3;
  value = self->_readerAvailabilityController.__ptr_.__value_;
  id v7 = v4;
  if (value)
  {
    CFArrayRef v6 = (*(void (**)(ReaderAvailabilityController *))(*(void *)value + 16))(value);
    v7[2](v7, v6);
  }
  else
  {
    v4[2](v4, 0);
  }
}

- (void)checkReaderAvailability
{
  value = self->_readerAvailabilityController.__ptr_.__value_;
  if (value)
  {
    uint64_t v4 = (*(uint64_t (**)(ReaderAvailabilityController *, SEL))(*(void *)value + 128))(value, a2);
    id v5 = objc_alloc_init(MEMORY[0x1E4F98D58]);
    [v5 setReaderAvailable:v4];
    [(SFReaderEventsListener *)self->_readerActivityListenerProxy didDetermineReaderAvailabilityForDynamicCheck:v5];
  }
}

- (void)prepareToTransitionToReader
{
  value = self->_readerAvailabilityController.__ptr_.__value_;
  if (value) {
    MEMORY[0x1F414A558](value, a2);
  }
}

- (void)didCreateReaderPageContextHandle:(id)a3
{
  id v4 = +[_SFReaderWebProcessPlugInPageController readerPageControllerForContextHandle:a3];
  if (v4)
  {
    [(_SFReaderWebProcessPlugInPageController *)self->_readerPageController setOriginalPageController:0];
    [v4 setOriginalPageController:self];
    [(_SFWebProcessPlugInReaderEnabledPageController *)self setReaderPageController:v4];
  }
}

- (void)loadNewReaderArticle
{
  if (self->_readerPageController)
  {
    [(_SFWebProcessPlugInReaderEnabledPageController *)self prepareToTransitionToReader];
    readerPageController = self->_readerPageController;
    [(_SFReaderWebProcessPlugInPageController *)readerPageController loadNewArticle];
  }
}

- (void)collectReadingListItemInfoWithBookmarkID:(id)a3
{
  id v5 = a3;
  id v4 = SafariServices::ReaderAvailabilityController::collectReadingListItemInformation((SafariServices::ReaderAvailabilityController *)self->_readerAvailabilityController.__ptr_.__value_);
  if (v4) {
    [(SFReaderEventsListener *)self->_readerActivityListenerProxy didCollectReadingListItemInfo:v4 bookmarkID:v5];
  }
}

- (void)didSetReaderConfiguration:(id)a3
{
}

- (void)readerContentDidBecomeReadyWithArticleText:(id)a3
{
}

- (void)didRequestOnDeviceSummary
{
}

- (void)didSetSummary
{
}

- (void)reportReaderEvent:(int64_t)a3 dataToReport:(id)a4
{
}

- (void)collectReaderContentForMail
{
  id v3 = [(_SFReaderWebProcessPlugInPageController *)self->_readerPageController collectReaderContentFromPrintAndMailingFrame];
  -[SFReaderEventsListener didCollectReaderContentForMail:](self->_readerActivityListenerProxy, "didCollectReaderContentForMail:");
}

- (void)prepareReaderContentForPrinting
{
  id v3 = [(_SFReaderWebProcessPlugInPageController *)self->_readerPageController printingMailingFrame];
  readerActivityListenerProxy = self->_readerActivityListenerProxy;
  id v6 = v3;
  id v5 = [v3 handle];
  [(SFReaderEventsListener *)readerActivityListenerProxy didPrepareReaderContentForPrinting:v5];
}

- (void)collectArticleContent
{
  SafariServices::ReaderAvailabilityController::articleContent((SafariServices::ReaderAvailabilityController *)self->_readerAvailabilityController.__ptr_.__value_);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  readerActivityListenerProxy = self->_readerActivityListenerProxy;
  if (!readerActivityListenerProxy)
  {
    [(_SFWebProcessPlugInReaderEnabledPageController *)self _setUpReaderActivityListenerProxy];
    readerActivityListenerProxy = self->_readerActivityListenerProxy;
  }
  [(SFReaderEventsListener *)readerActivityListenerProxy didCollectArticleContent:v4];
}

- (void)webProcessPlugInBrowserContextController:(id)a3 didStartProvisionalLoadForFrame:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)_SFWebProcessPlugInReaderEnabledPageController;
  [(_SFWebProcessPlugInAutoFillPageController *)&v10 webProcessPlugInBrowserContextController:v6 didStartProvisionalLoadForFrame:v7];
  id v8 = [v6 mainFrame];

  if (v8 == v7)
  {
    value = self->_readerAvailabilityController.__ptr_.__value_;
    if (!value) {
      operator new();
    }
    SafariShared::ReaderAvailabilityController::setCanRunAvailabilityDetection((SafariShared::ReaderAvailabilityController *)value);
  }
}

- (void)webProcessPlugInBrowserContextController:(id)a3 globalObjectIsAvailableForFrame:(id)a4 inScriptWorld:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v11 mainFrame];

  if (v10 == v8) {
    [(SFWebProcessPlugInCertificateWarningController *)self->_certificateWarningController injectCertificateWarningBindingsForFrame:v8 inScriptWorld:v9];
  }
}

- (void)webProcessPlugInBrowserContextController:(id)a3 didCommitLoadForFrame:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)_SFWebProcessPlugInReaderEnabledPageController;
  [(_SFWebProcessPlugInAutoFillPageController *)&v10 webProcessPlugInBrowserContextController:v6 didCommitLoadForFrame:v7];
  id v8 = [v6 mainFrame];

  if (v8 == v7)
  {
    value = self->_readerAvailabilityController.__ptr_.__value_;
    if (value) {
      SafariServices::ReaderAvailabilityController::clearAvailability((SafariServices::ReaderAvailabilityController *)value);
    }
    [(SFWebProcessPlugInPageExtensionController *)self->_extensionController clearExtensionScriptWorlds];
  }
}

- (void)webProcessPlugInBrowserContextController:(id)a3 didSameDocumentNavigation:(int64_t)a4 forFrame:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12.receiver = self;
  v12.super_class = (Class)_SFWebProcessPlugInReaderEnabledPageController;
  [(_SFWebProcessPlugInAutoFillPageController *)&v12 webProcessPlugInBrowserContextController:v8 didSameDocumentNavigation:a4 forFrame:v9];
  id v10 = [v8 mainFrame];

  if (v10 == v9)
  {
    value = self->_readerAvailabilityController.__ptr_.__value_;
    if (value)
    {
      SafariServices::ReaderAvailabilityController::clearAvailability((SafariServices::ReaderAvailabilityController *)value);
      [(_SFWebProcessPlugInReaderEnabledPageController *)self _detectReaderAvailabilityAfterSameDocumentNavigation];
    }
  }
}

- (void)webProcessPlugInBrowserContextController:(id)a3 didFinishDocumentLoadForFrame:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [v8 mainFrame];

  if (v7 == v6 && self->_readerAvailabilityController.__ptr_.__value_)
  {
    if ([(_SFWebProcessPlugInReaderEnabledPageController *)self readerHasBeenActivatedRecently])
    {
      [(_SFWebProcessPlugInReaderEnabledPageController *)self _detectAvailabilityAfterDelay:1 loadEvent:0.1];
    }
    SafariShared::ReaderAvailabilityController::didFinishDocumentLoad((SafariShared::ReaderAvailabilityController *)self->_readerAvailabilityController.__ptr_.__value_);
  }
}

- (void)webProcessPlugInBrowserContextController:(id)a3 didFinishLoadForFrame:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [v10 mainFrame];

  if (v7 == v6)
  {
    if (self->_readerAvailabilityController.__ptr_.__value_)
    {
      [(_SFWebProcessPlugInReaderEnabledPageController *)self _detectAvailabilityAfterDelay:2 loadEvent:0.1];
      SafariShared::ReaderAvailabilityController::didFinishLoad((SafariShared::ReaderAvailabilityController *)self->_readerAvailabilityController.__ptr_.__value_);
    }
    id v8 = [(_SFWebProcessPlugInReaderEnabledPageController *)self _searchForSmartAppBannerMetaContent];
    if (v8)
    {
      id v9 = [(_SFWebProcessPlugInReaderEnabledPageController *)self _appBannerMetaTagObserverProxy];
      [v9 didFindAppBannerWithContent:v8];
    }
  }
}

- (BOOL)readerHasBeenActivatedRecently
{
  if (!self->_readerAvailabilityController.__ptr_.__value_) {
    return 0;
  }
  v2 = [(WBSWebProcessPlugInPageController *)self webProcessPlugIn];
  id v3 = [v2 plugInController];
  id v4 = [v3 parameters];
  id v5 = [v4 valueForKey:*MEMORY[0x1E4F99408]];

  char HasBeenActivatedRecently = SafariShared::ReaderAvailabilityController::readerHasBeenActivatedRecently(v5, v6);
  return HasBeenActivatedRecently;
}

- (void)webProcessPlugInBrowserContextController:(id)a3 renderingProgressDidChange:(unint64_t)a4
{
  __int16 v4 = a4;
  id v6 = a3;
  if ((v4 & 0x100) != 0
    && self->_readerAvailabilityController.__ptr_.__value_
    && [(_SFWebProcessPlugInReaderEnabledPageController *)self readerHasBeenActivatedRecently])
  {
    [(_SFWebProcessPlugInReaderEnabledPageController *)self _detectAvailabilityAfterDelay:0 loadEvent:1.0];
  }
}

- (id)_appBannerMetaTagObserverProxy
{
  appBannerObserverProxy = self->_appBannerObserverProxy;
  if (!appBannerObserverProxy)
  {
    __int16 v4 = [(WBSWebProcessPlugInPageController *)self browserContextController];
    id v5 = [v4 _remoteObjectRegistry];

    id v6 = [MEMORY[0x1E4F46788] remoteObjectInterfaceWithProtocol:&unk_1EFC66720];
    id v7 = [v5 remoteObjectProxyWithInterface:v6];
    id v8 = self->_appBannerObserverProxy;
    self->_appBannerObserverProxy = v7;

    appBannerObserverProxy = self->_appBannerObserverProxy;
  }

  return appBannerObserverProxy;
}

- (id)_appBannerMetaElementInHeaderElement:(id)a3
{
  uint64_t v3 = [a3 firstChild];
  if (!v3)
  {
    id v5 = 0;
    goto LABEL_11;
  }
  __int16 v4 = (void *)v3;
  while (1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      break;
    }
LABEL_7:
    id v5 = [v4 nextSibling];

    __int16 v4 = v5;
    if (!v5) {
      goto LABEL_11;
    }
  }
  id v5 = v4;
  id v6 = [v5 tagName];
  uint64_t v7 = [v6 caseInsensitiveCompare:@"META"];

  if (v7
    || ([v5 getAttribute:@"name"],
        id v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 caseInsensitiveCompare:@"apple-itunes-app"],
        v8,
        v9))
  {

    goto LABEL_7;
  }

LABEL_11:

  return v5;
}

- (id)_searchForSmartAppBannerMetaContent
{
  uint64_t v3 = [(WBSWebProcessPlugInPageController *)self browserContextController];
  __int16 v4 = [v3 mainFrameDocument];

  id v5 = [v4 body];
  id v6 = [v5 parentNode];
  uint64_t v7 = [v6 firstChild];

  if (!v7)
  {
LABEL_6:
    objc_super v12 = 0;
    goto LABEL_8;
  }
  while (1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      break;
    }
LABEL_5:
    uint64_t v11 = [v7 nextSibling];

    uint64_t v7 = (void *)v11;
    if (!v11) {
      goto LABEL_6;
    }
  }
  id v8 = v7;
  uint64_t v9 = [v8 tagName];
  uint64_t v10 = [v9 caseInsensitiveCompare:@"HEAD"];

  if (v10)
  {

    goto LABEL_5;
  }
  v13 = [(_SFWebProcessPlugInReaderEnabledPageController *)self _appBannerMetaElementInHeaderElement:v8];
  objc_super v12 = [v13 getAttribute:@"content"];

LABEL_8:

  return v12;
}

- (_SFReaderWebProcessPlugInPageController)readerPageController
{
  return self->_readerPageController;
}

- (void)setReaderPageController:(id)a3
{
}

- (NSDictionary)initalArticleScrollPositionAsDictionary
{
  return self->_initalArticleScrollPositionAsDictionary;
}

- (void)setInitalArticleScrollPositionAsDictionary:(id)a3
{
}

- (int64_t)cachedReaderTopScrollOffset
{
  return self->_cachedReaderTopScrollOffset;
}

- (void)setCachedReaderTopScrollOffset:(int64_t)a3
{
  self->_cachedReaderTopScrollOffset = a3;
}

- (NSDictionary)initialReaderConfiguration
{
  return self->_initialReaderConfiguration;
}

- (BOOL)isViewingReadingListArchive
{
  return self->_viewingReadingListArchive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialReaderConfiguration, 0);
  objc_storeStrong((id *)&self->_initalArticleScrollPositionAsDictionary, 0);
  objc_storeStrong((id *)&self->_appBannerObserverProxy, 0);
  objc_storeStrong((id *)&self->_certificateWarningController, 0);
  objc_storeStrong((id *)&self->_sharingLinkExtractor, 0);
  objc_storeStrong((id *)&self->_extensionController, 0);
  objc_storeStrong((id *)&self->_initialScrollPositionAsDictionary, 0);
  objc_storeStrong((id *)&self->_readerPageController, 0);
  objc_storeStrong((id *)&self->_readerActivityListenerProxy, 0);
  objc_storeStrong((id *)&self->_availabilityControllerInterface, 0);
  value = self->_readerAvailabilityController.__ptr_.__value_;
  self->_readerAvailabilityController.__ptr_.__value_ = 0;
  if (value)
  {
    __int16 v4 = *(void (**)(void))(*(void *)value + 8);
    v4();
  }
}

@end