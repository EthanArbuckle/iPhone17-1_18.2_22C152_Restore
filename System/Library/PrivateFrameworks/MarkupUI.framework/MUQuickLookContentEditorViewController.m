@interface MUQuickLookContentEditorViewController
+ (CGSize)_suggestedContentSizeForImageSource:(CGImageSource *)a3;
+ (CGSize)_suggestedContentSizeForPDF:(id)a3;
+ (CGSize)suggestedContentSizeForData:(id)a3;
+ (CGSize)suggestedContentSizeForURL:(id)a3;
- (BOOL)_canShowWhileLocked;
- (BOOL)_hasImageContent;
- (BOOL)_hasPDFContent;
- (BOOL)_imageAnalysisOverlayAcceptSingleTouch:(id)a3;
- (BOOL)_presentationModeAllowsEditing;
- (BOOL)_presentationModeAllowsMarkupOverlays;
- (BOOL)_shouldShowMarkupOverlays;
- (BOOL)acceptSingleTouch:(id)a3;
- (BOOL)allowsEditing;
- (BOOL)canEditContent;
- (BOOL)canEditPDF;
- (BOOL)canEncryptDocument;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)delegateRespondsToDetectedFormInContent;
- (BOOL)didAppearOnce;
- (BOOL)documentIsLocked;
- (BOOL)formDetectedInDocument;
- (BOOL)hasResultsForVisualSearch;
- (BOOL)isInteractionActive;
- (BOOL)isVisualSearchEnabled;
- (BOOL)shouldEnterVisualSearchAfterNextAnalysis;
- (BOOL)shouldHighlightTextAndDDAfterNextAnalysis;
- (BOOL)shouldUpliftSubjectAfterNextAnalysis;
- (MUImageAnalysisManager)imageAnalysisManager;
- (MUQuickLookContentEditorViewController)init;
- (NSDictionary)clientPreviewOptions;
- (NSMutableSet)actionsNotEnablingMarkup;
- (NSString)filledInfoButtonGlyphName;
- (NSString)infoButtonGlyphName;
- (PDFViewDelegatePrivate)pdfViewDelegateProxy;
- (UIFindInteraction)findInteraction;
- (UIImage)imageForAnalysis;
- (UIImage)latestImageForAnalysis;
- (UIView)transitioningView;
- (id)_editedImageAnalysisQueue;
- (id)getMenuElementsForPage:(id)a3;
- (id)importHandler;
- (id)pdfPageOptionsForImageRef:(CGImage *)a3 withPreviousPage:(id)a4;
- (id)scanImageToPDFConversionHandler;
- (id)scanPDFHandler;
- (id)sharedSerialPagesEditionQueue;
- (id)supportedUTTypes;
- (unint64_t)_insertPagesFromProvidedPDFDocument:(id)a3 toPDFDocument:(id)a4 atPageIndex:(unint64_t)a5;
- (unint64_t)presentationMode;
- (void)PDFView:(id)a3 allowsFormFillingMode:(BOOL)a4 forPage:(id)a5;
- (void)_adjustImageInteractionForScrollEvent:(id)a3;
- (void)_convertToPDFAndWrite:(id)a3 completionHandler:(id)a4;
- (void)_deletePage:(id)a3;
- (void)_deletePages:(id)a3 inDocument:(id)a4;
- (void)_detectedEditEnablingMarkup:(BOOL)a3;
- (void)_flattenImageForAnalysis;
- (void)_handleLoadingWithCompletion:(id)a3;
- (void)_insertBlankPage:(id)a3 atIndex:(unint64_t)a4;
- (void)_insertBlankPageAfterPage:(id)a3;
- (void)_insertDeletedPage:(id)a3 atIndex:(unint64_t)a4;
- (void)_insertFileAtURL:(id)a3 type:(id)a4 afterPage:(id)a5 completionHandler:(id)a6;
- (void)_insertImageWithURL:(id)a3 afterPage:(id)a4 completionHandler:(id)a5;
- (void)_insertPDFDocumentWithURL:(id)a3 afterPage:(id)a4 completionHandler:(id)a5;
- (void)_insertPage:(id)a3 atIndex:(unint64_t)a4;
- (void)_insertPageFromFileAfterPage:(id)a3;
- (void)_insertPagesFromFileURLs:(id)a3 afterPage:(id)a4;
- (void)_loadSourceContentWithCompletion:(id)a3;
- (void)_presentDocumentPicker:(id)a3;
- (void)_presentDocumentScannerAfterPage:(id)a3;
- (void)_registerActionNotEnablingMarkup:(id)a3;
- (void)_resetOriginalDelegate;
- (void)_rotatePage:(id)a3 clockwise:(BOOL)a4;
- (void)_setAsPDFViewDelegatePrivateIfNecessary;
- (void)_setPresentationModeForImageContent:(unint64_t)a3;
- (void)_setPresentationModeForPDFContent:(unint64_t)a3;
- (void)_setupAndStartImageAnalysisIfNeeded;
- (void)_updateAnalysisButtonsContainerConstraints;
- (void)_updatePeekSize;
- (void)_updateThumbnailViewWithTraitCollection:(id)a3;
- (void)annotationController:(id)a3 detectedEditOfType:(unint64_t)a4;
- (void)contentControllerDidUnlockDocument:(id)a3;
- (void)convertToPDFAndWrite:(id)a3 completionHandler:(id)a4;
- (void)documentCameraViewController:(id)a3 didFailWithError:(id)a4;
- (void)documentCameraViewController:(id)a3 didFinishWithScan:(id)a4;
- (void)documentCameraViewControllerDidCancel:(id)a3;
- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4;
- (void)documentPickerWasCancelled:(id)a3;
- (void)editDetectedForAnnotationController:(id)a3;
- (void)find:(id)a3;
- (void)findNext:(id)a3;
- (void)findPrevious:(id)a3;
- (void)flattenImageForAnalysis;
- (void)imageAnalysisInteractionDidDismissVisualSearchController;
- (void)imageAnalysisInteractionWillPresentVisualSearchController;
- (void)imageAnalyzerWantsUpdateInfoButtonWithAnimation:(BOOL)a3;
- (void)infoButtonTapped;
- (void)insertPages:(id)a3 atIndexes:(id)a4 inDocument:(id)a5;
- (void)loadWithData:(id)a3 archivedModelData:(id)a4 placeholderImage:(id)a5 completionHandler:(id)a6;
- (void)loadWithURL:(id)a3 archivedModelData:(id)a4 placeholderImage:(id)a5 completionHandler:(id)a6;
- (void)setActionsNotEnablingMarkup:(id)a3;
- (void)setAnnotationEditingEnabled:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateRespondsToDetectedFormInContent:(BOOL)a3;
- (void)setDidAppearOnce:(BOOL)a3;
- (void)setFormDetectedInDocument:(BOOL)a3;
- (void)setImageAnalysisManager:(id)a3;
- (void)setImportHandler:(id)a3;
- (void)setLatestImageForAnalysis:(id)a3;
- (void)setPdfViewDelegateProxy:(id)a3;
- (void)setPresentationMode:(unint64_t)a3;
- (void)setScanImageToPDFConversionHandler:(id)a3;
- (void)setScanPDFHandler:(id)a3;
- (void)setShouldEnterVisualSearchAfterNextAnalysis:(BOOL)a3;
- (void)setShouldHighlightTextAndDDAfterNextAnalysis:(BOOL)a3;
- (void)setShouldUpliftSubjectAfterNextAnalysis:(BOOL)a3;
- (void)setupAndStartImageAnalysisIfNeeded;
- (void)shouldHideMarkupOverlays:(BOOL)a3 animated:(BOOL)a4;
- (void)stopImageAnalysis;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateForFullScreen:(BOOL)a3 animated:(BOOL)a4;
- (void)updateThumbnailView;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation MUQuickLookContentEditorViewController

- (MUQuickLookContentEditorViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)MUQuickLookContentEditorViewController;
  v2 = [(MUQuickLookContentEditorViewController *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F1C550] clearColor];
    [(MarkupViewController *)v2 setBackgroundColor:v3];
  }
  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MUQuickLookContentEditorViewController;
  -[MarkupViewController viewWillAppear:](&v6, sel_viewWillAppear_);
  if ([(MUQuickLookContentEditorViewController *)self _hasPDFContent]
    && [(MarkupViewController *)self thumbnailViewStyle] == 1)
  {
    if (v3)
    {
      v5[0] = MEMORY[0x263EF8330];
      v5[1] = 3221225472;
      v5[2] = __57__MUQuickLookContentEditorViewController_viewWillAppear___block_invoke;
      v5[3] = &unk_2649C2828;
      v5[4] = self;
      [MEMORY[0x263F1CB60] animateWithDuration:v5 animations:0.2];
    }
    else
    {
      [(MUQuickLookContentEditorViewController *)self updateThumbnailView];
    }
  }
}

uint64_t __57__MUQuickLookContentEditorViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateThumbnailView];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MUQuickLookContentEditorViewController;
  [(MarkupViewController *)&v3 viewDidLayoutSubviews];
  if ([(MUQuickLookContentEditorViewController *)self _hasPDFContent]) {
    [(MUQuickLookContentEditorViewController *)self _updatePeekSize];
  }
}

- (void)_updatePeekSize
{
  objc_super v3 = [(MUQuickLookContentEditorViewController *)self view];
  id v19 = [v3 superview];

  v4 = v19;
  if (v19)
  {
    [v19 frame];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    unint64_t v13 = [(MUQuickLookContentEditorViewController *)self presentationMode];
    double v14 = v6 + -5.0;
    double v15 = v8 + -5.0;
    if (v13 == 1)
    {
      double v12 = v12 + 10.0;
      double v10 = v10 + 10.0;
      double v8 = v8 + -5.0;
      double v6 = v6 + -5.0;
    }
    v16 = [(MUQuickLookContentEditorViewController *)self view];
    [v16 frame];
    v22.origin.x = v6;
    v22.origin.y = v8;
    v22.size.width = v10;
    v22.size.height = v12;
    BOOL v17 = CGRectEqualToRect(v21, v22);

    v4 = v19;
    if (!v17)
    {
      v18 = [(MUQuickLookContentEditorViewController *)self view];
      objc_msgSend(v18, "setFrame:", v6, v8, v10, v12);

      v4 = v19;
    }
  }
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (sel_find_ == a3 || sel_findPrevious_ == a3 || sel_findNext_ == a3)
  {
    id v8 = a4;
    double v9 = [(MarkupViewController *)self contentViewController];
    unsigned __int8 v11 = [v9 canPerformAction:a3 withSender:v8];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)MUQuickLookContentEditorViewController;
    id v10 = a4;
    unsigned __int8 v11 = [(MarkupViewController *)&v13 canPerformAction:a3 withSender:v10];
  }
  return v11;
}

+ (CGSize)suggestedContentSizeForURL:(id)a3
{
  CFURLRef v4 = (const __CFURL *)a3;
  double v5 = *MEMORY[0x263F001B0];
  double v6 = *(double *)(MEMORY[0x263F001B0] + 8);
  if (v4)
  {
    double v7 = +[MUImageDownsamplingUtilities _sourceContentType:v4];
    if (v7)
    {
      id v8 = [MEMORY[0x263F1D920] typeWithIdentifier:v7];
    }
    else
    {
      id v8 = 0;
    }
    if ([v8 conformsToType:*MEMORY[0x263F1DBF0]])
    {
      double v9 = (void *)[objc_alloc(MEMORY[0x263F14738]) initWithURL:v4];
      [a1 _suggestedContentSizeForPDF:v9];
      double v5 = v10;
      double v6 = v11;
    }
    else if ([v8 conformsToType:*MEMORY[0x263F1DB18]])
    {
      CGImageSourceRef v12 = CGImageSourceCreateWithURL(v4, 0);
      if (v12)
      {
        CGImageSourceRef v13 = v12;
        [a1 _suggestedContentSizeForImageSource:v12];
        double v5 = v14;
        double v6 = v15;
        CFRelease(v13);
      }
    }
  }
  double v16 = v5;
  double v17 = v6;
  result.height = v17;
  result.width = v16;
  return result;
}

+ (CGSize)suggestedContentSizeForData:(id)a3
{
  CFDataRef v4 = (const __CFData *)a3;
  double v5 = *MEMORY[0x263F001B0];
  double v6 = *(double *)(MEMORY[0x263F001B0] + 8);
  if (v4)
  {
    double v7 = +[MUImageDownsamplingUtilities _sourceContentType:v4];
    if (v7)
    {
      id v8 = [MEMORY[0x263F1D920] typeWithIdentifier:v7];
    }
    else
    {
      id v8 = 0;
    }
    if ([v8 conformsToType:*MEMORY[0x263F1DBF0]])
    {
      double v9 = (void *)[objc_alloc(MEMORY[0x263F14738]) initWithData:v4];
      [a1 _suggestedContentSizeForPDF:v9];
      double v5 = v10;
      double v6 = v11;
    }
    else if ([v8 conformsToType:*MEMORY[0x263F1DB18]])
    {
      CGImageSourceRef v12 = CGImageSourceCreateWithData(v4, 0);
      if (v12)
      {
        CGImageSourceRef v13 = v12;
        [a1 _suggestedContentSizeForImageSource:v12];
        double v5 = v14;
        double v6 = v15;
        CFRelease(v13);
      }
    }
  }
  double v16 = v5;
  double v17 = v6;
  result.height = v17;
  result.width = v16;
  return result;
}

+ (CGSize)_suggestedContentSizeForImageSource:(CGImageSource *)a3
{
  CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(a3, 0, 0);
  if (ImageAtIndex)
  {
    CGImageRef v4 = ImageAtIndex;
    CGImageGetSizeAfterOrientation();
    double v6 = v5;
    double v8 = v7;
    CFRelease(v4);
  }
  else
  {
    double v6 = *MEMORY[0x263F001B0];
    double v8 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

+ (CGSize)_suggestedContentSizeForPDF:(id)a3
{
  id v3 = a3;
  CGImageRef v4 = v3;
  CGFloat width = *MEMORY[0x263F001B0];
  CGFloat height = *(double *)(MEMORY[0x263F001B0] + 8);
  if (v3 && [v3 pageCount])
  {
    double v7 = [v4 pageAtIndex:0];
    CGRect BoxRect = CGPDFPageGetBoxRect((CGPDFPageRef)[v7 pageRef], kCGPDFMediaBox);
    CGFloat width = BoxRect.size.width;
    CGFloat height = BoxRect.size.height;
  }
  double v8 = width;
  double v9 = height;
  result.CGFloat height = v9;
  result.CGFloat width = v8;
  return result;
}

- (void)loadWithData:(id)a3 archivedModelData:(id)a4 placeholderImage:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  [(MarkupViewController *)self setData:a3 withArchivedModelData:a4 placeholderImage:a5];
  [(MUQuickLookContentEditorViewController *)self _handleLoadingWithCompletion:v10];
}

- (void)loadWithURL:(id)a3 archivedModelData:(id)a4 placeholderImage:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  [(MarkupViewController *)self setFileURL:a3 withArchivedModelData:a4 placeholderImage:a5];
  [(MUQuickLookContentEditorViewController *)self _handleLoadingWithCompletion:v10];
}

- (void)_handleLoadingWithCompletion:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  CGImageRef v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    if ([(MUQuickLookContentEditorViewController *)self _hasPDFContent]
      && ([(MarkupViewController *)self _pdfView], (double v5 = objc_claimAutoreleasedReturnValue()) != 0))
    {
    }
    else if (![(MUQuickLookContentEditorViewController *)self _hasImageContent])
    {
      double v7 = (void *)MEMORY[0x263F087E8];
      uint64_t v9 = *MEMORY[0x263F07F80];
      v10[0] = @"MUQuickLookContentEditorViewController failed to load content";
      double v8 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
      double v6 = [v7 errorWithDomain:@"com.apple.MarkupUI.MUQuickLookContentEditorViewController" code:1 userInfo:v8];

      goto LABEL_8;
    }
    double v6 = 0;
LABEL_8:
    v4[2](v4, v6);
  }
}

- (BOOL)_canShowWhileLocked
{
  id v3 = [(MarkupViewController *)self delegate];
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0) {
    char v4 = [v3 editorCanShowWhileLocked:self];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MUQuickLookContentEditorViewController;
  [(MarkupViewController *)&v13 traitCollectionDidChange:v4];
  if ([(MUQuickLookContentEditorViewController *)self _hasImageContent])
  {
    double v5 = [(MUQuickLookContentEditorViewController *)self traitCollection];
    uint64_t v6 = [v5 horizontalSizeClass];
    if (v6 == [v4 horizontalSizeClass])
    {
      double v7 = [(MUQuickLookContentEditorViewController *)self traitCollection];
      uint64_t v8 = [v7 userInterfaceIdiom];
      uint64_t v9 = [v4 userInterfaceIdiom];

      if (v8 == v9) {
        goto LABEL_12;
      }
    }
    else
    {
    }
    [(MUQuickLookContentEditorViewController *)self _updateAnalysisButtonsContainerConstraints];
  }
  else if ([(MUQuickLookContentEditorViewController *)self _hasPDFContent])
  {
    uint64_t v10 = [v4 horizontalSizeClass];
    double v11 = [(MUQuickLookContentEditorViewController *)self traitCollection];
    uint64_t v12 = [v11 horizontalSizeClass];

    if (v10 != v12
      && [(MarkupViewController *)self thumbnailViewStyle] == 1
      && ![v4 horizontalSizeClass])
    {
      [(MUQuickLookContentEditorViewController *)self updateThumbnailView];
    }
  }
LABEL_12:
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(MUQuickLookContentEditorViewController *)self _hasPDFContent]
    && [(MarkupViewController *)self thumbnailViewStyle] == 1)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __100__MUQuickLookContentEditorViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke;
    v9[3] = &unk_2649C2850;
    v9[4] = self;
    id v10 = v6;
    [v7 animateAlongsideTransition:v9 completion:0];
  }
  v8.receiver = self;
  v8.super_class = (Class)MUQuickLookContentEditorViewController;
  [(MUQuickLookContentEditorViewController *)&v8 willTransitionToTraitCollection:v6 withTransitionCoordinator:v7];
}

uint64_t __100__MUQuickLookContentEditorViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateThumbnailViewWithTraitCollection:*(void *)(a1 + 40)];
}

- (void)PDFView:(id)a3 allowsFormFillingMode:(BOOL)a4 forPage:(id)a5
{
  BOOL v5 = a4;
  if ([(MUQuickLookContentEditorViewController *)self delegateRespondsToDetectedFormInContent]&& v5&& ![(MUQuickLookContentEditorViewController *)self formDetectedInDocument])
  {
    [(MUQuickLookContentEditorViewController *)self setFormDetectedInDocument:1];
    id v7 = [(MarkupViewController *)self delegate];
    [v7 editor:self detectedFormInContent:1];
  }
}

- (void)annotationController:(id)a3 detectedEditOfType:(unint64_t)a4
{
  id v13 = [(MarkupViewController *)self undoManager];
  id v6 = [(MUQuickLookContentEditorViewController *)self actionsNotEnablingMarkup];
  id v7 = [v13 undoActionName];
  int v8 = [v6 containsObject:v7];

  uint64_t v9 = [(MUQuickLookContentEditorViewController *)self actionsNotEnablingMarkup];
  id v10 = [v13 redoActionName];
  int v11 = [v9 containsObject:v10];

  if (a4) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = (v8 | v11) ^ 1u;
  }
  [(MUQuickLookContentEditorViewController *)self _detectedEditEnablingMarkup:v12];
}

- (void)editDetectedForAnnotationController:(id)a3
{
}

- (void)contentControllerDidUnlockDocument:(id)a3
{
  uint64_t v4 = [(MarkupViewController *)self delegate];
  if (v4)
  {
    BOOL v5 = (void *)v4;
    if (objc_opt_respondsToSelector()) {
      [v5 editorDidUnlockDocument:self];
    }
  }
  MEMORY[0x270F9A790]();
}

- (void)setAnnotationEditingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MUQuickLookContentEditorViewController;
  -[MarkupViewController setAnnotationEditingEnabled:](&v6, sel_setAnnotationEditingEnabled_);
  if ([(MUQuickLookContentEditorViewController *)self _hasImageContent])
  {
    if (v3) {
      [(MUQuickLookContentEditorViewController *)self flattenImageForAnalysis];
    }
    BOOL v5 = [(MUQuickLookContentEditorViewController *)self imageAnalysisManager];
    [v5 enableMarkupMode:v3];
  }
}

- (UIView)transitioningView
{
  if ([(MUQuickLookContentEditorViewController *)self _hasPDFContent]) {
    [(MarkupViewController *)self _pdfView];
  }
  else {
  BOOL v3 = [(MUQuickLookContentEditorViewController *)self view];
  }
  return (UIView *)v3;
}

- (BOOL)documentIsLocked
{
  BOOL v3 = [(MUQuickLookContentEditorViewController *)self _hasPDFContent];
  if (v3)
  {
    uint64_t v4 = [(MarkupViewController *)self _pdfDocument];
    char v5 = [v4 isLocked];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)canEncryptDocument
{
  if ([(MUQuickLookContentEditorViewController *)self _hasPDFContent])
  {
    BOOL v3 = [(MarkupViewController *)self _pdfDocument];
    uint64_t v4 = v3;
    if (v3) {
      int v5 = [v3 isEncrypted] ^ 1;
    }
    else {
      LOBYTE(v5) = 0;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (void)setPresentationMode:(unint64_t)a3
{
  if (![(MUQuickLookContentEditorViewController *)self didAppearOnce]
    && !a3
    && self->_presentationMode == 1)
  {
    [(MUQuickLookContentEditorViewController *)self setDidAppearOnce:1];
  }
  self->_presentationMode = a3;
  if ([(MUQuickLookContentEditorViewController *)self _hasPDFContent])
  {
    [(MUQuickLookContentEditorViewController *)self _setPresentationModeForPDFContent:a3];
  }
  else if ([(MUQuickLookContentEditorViewController *)self _hasImageContent])
  {
    [(MUQuickLookContentEditorViewController *)self _setPresentationModeForImageContent:a3];
  }
}

- (unint64_t)presentationMode
{
  return self->_presentationMode;
}

- (void)flattenImageForAnalysis
{
  objc_initWeak(&location, self);
  BOOL v3 = [(MUQuickLookContentEditorViewController *)self _editedImageAnalysisQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __65__MUQuickLookContentEditorViewController_flattenImageForAnalysis__block_invoke;
  v4[3] = &unk_2649C2878;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __65__MUQuickLookContentEditorViewController_flattenImageForAnalysis__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _flattenImageForAnalysis];
}

- (void)updateForFullScreen:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(MUQuickLookContentEditorViewController *)self _hasImageContent])
  {
    id v7 = [(MUQuickLookContentEditorViewController *)self imageAnalysisManager];
    [v7 updateForFullScreen:v5 animated:v4];

    [(MUQuickLookContentEditorViewController *)self _updateAnalysisButtonsContainerConstraints];
  }
  else if ([(MUQuickLookContentEditorViewController *)self _hasPDFContent])
  {
    if (v4)
    {
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __71__MUQuickLookContentEditorViewController_updateForFullScreen_animated___block_invoke;
      v8[3] = &unk_2649C2828;
      v8[4] = self;
      [MEMORY[0x263F1CB60] animateWithDuration:v8 animations:0.2];
    }
    else
    {
      [(MUQuickLookContentEditorViewController *)self updateThumbnailView];
    }
  }
}

uint64_t __71__MUQuickLookContentEditorViewController_updateForFullScreen_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateThumbnailView];
}

- (void)shouldHideMarkupOverlays:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(MUQuickLookContentEditorViewController *)self _hasImageContent])
  {
    id v7 = [(MUQuickLookContentEditorViewController *)self imageAnalysisManager];
    [v7 shouldHideInteraction:v5 animated:v4];
  }
}

- (UIFindInteraction)findInteraction
{
  if ([(MUQuickLookContentEditorViewController *)self _hasPDFContent])
  {
    BOOL v3 = [(MarkupViewController *)self _pdfView];
    BOOL v4 = [v3 findInteraction];
  }
  else
  {
    BOOL v4 = 0;
  }
  return (UIFindInteraction *)v4;
}

- (BOOL)acceptSingleTouch:(id)a3
{
  id v4 = a3;
  if ([(MUQuickLookContentEditorViewController *)self _hasImageContent])
  {
    char v5 = [(MUQuickLookContentEditorViewController *)self _imageAnalysisOverlayAcceptSingleTouch:v4];
  }
  else
  {
    objc_super v6 = [(MarkupViewController *)self contentViewController];
    char v5 = [v6 acceptSingleTouch:v4];
  }
  return v5;
}

- (void)updateThumbnailView
{
  id v3 = [(MUQuickLookContentEditorViewController *)self traitCollection];
  [(MUQuickLookContentEditorViewController *)self _updateThumbnailViewWithTraitCollection:v3];
}

- (BOOL)isInteractionActive
{
  v2 = [(MUQuickLookContentEditorViewController *)self imageAnalysisManager];
  char v3 = [v2 isInteractionActive];

  return v3;
}

- (BOOL)hasResultsForVisualSearch
{
  v2 = [(MUQuickLookContentEditorViewController *)self imageAnalysisManager];
  char v3 = [v2 hasResultsForVisualSearch];

  return v3;
}

- (void)infoButtonTapped
{
  id v2 = [(MUQuickLookContentEditorViewController *)self imageAnalysisManager];
  [v2 infoButtonTapped];
}

- (BOOL)_presentationModeAllowsEditing
{
  return [(MUQuickLookContentEditorViewController *)self presentationMode] == 0;
}

- (BOOL)canEditPDF
{
  BOOL v3 = [(MUQuickLookContentEditorViewController *)self _hasPDFContent];
  if (v3)
  {
    LOBYTE(v3) = [(MUQuickLookContentEditorViewController *)self canEditContent];
  }
  return v3;
}

- (BOOL)canEditContent
{
  if (![(MUQuickLookContentEditorViewController *)self _presentationModeAllowsEditing]) {
    return 0;
  }
  BOOL v3 = [(MarkupViewController *)self contentViewController];
  if ([v3 canEditContent]) {
    BOOL v4 = [(MUQuickLookContentEditorViewController *)self allowsEditing];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)allowsEditing
{
  BOOL v3 = [(MarkupViewController *)self delegate];
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0) {
    char v4 = [v3 editorShouldAllowEditingContents:self];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (id)getMenuElementsForPage:(id)a3
{
  id v4 = a3;
  if ([(MUQuickLookContentEditorViewController *)self canEditPDF])
  {
    objc_initWeak(location, self);
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    objc_super v6 = (void *)MEMORY[0x263F1C3C0];
    id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    int v8 = [v7 localizedStringForKey:@"Rotate Left" value:&stru_26E1811C8 table:@"MUQuickLookContentEditorViewController"];
    uint64_t v9 = [MEMORY[0x263F1C6B0] systemImageNamed:@"rotate.left"];
    v62[0] = MEMORY[0x263EF8330];
    v62[1] = 3221225472;
    v62[2] = __65__MUQuickLookContentEditorViewController_getMenuElementsForPage___block_invoke;
    v62[3] = &unk_2649C28A0;
    objc_copyWeak(&v64, location);
    id v10 = v4;
    id v63 = v10;
    uint64_t v11 = [v6 actionWithTitle:v8 image:v9 identifier:@"rotate_left" handler:v62];

    [v5 addObject:v11];
    v46 = (void *)v11;
    uint64_t v12 = (void *)MEMORY[0x263F1C3C0];
    id v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    double v14 = [v13 localizedStringForKey:@"Rotate Right" value:&stru_26E1811C8 table:@"MUQuickLookContentEditorViewController"];
    double v15 = [MEMORY[0x263F1C6B0] systemImageNamed:@"rotate.right"];
    v59[0] = MEMORY[0x263EF8330];
    v59[1] = 3221225472;
    v59[2] = __65__MUQuickLookContentEditorViewController_getMenuElementsForPage___block_invoke_2;
    v59[3] = &unk_2649C28A0;
    objc_copyWeak(&v61, location);
    id v16 = v10;
    id v60 = v16;
    uint64_t v17 = [v12 actionWithTitle:v14 image:v15 identifier:@"rotate_right" handler:v59];

    v45 = (void *)v17;
    [v5 addObject:v17];
    v18 = (void *)MEMORY[0x263F1C3C0];
    id v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v20 = [v19 localizedStringForKey:@"Insert Blank Page" value:&stru_26E1811C8 table:@"MUQuickLookContentEditorViewController"];
    CGRect v21 = [MEMORY[0x263F1C6B0] systemImageNamed:@"doc.badge.plus"];
    v56[0] = MEMORY[0x263EF8330];
    v56[1] = 3221225472;
    v56[2] = __65__MUQuickLookContentEditorViewController_getMenuElementsForPage___block_invoke_3;
    v56[3] = &unk_2649C28A0;
    objc_copyWeak(&v58, location);
    id v22 = v16;
    id v57 = v22;
    uint64_t v23 = [v18 actionWithTitle:v20 image:v21 identifier:@"insert_blank_page" handler:v56];

    [v5 addObject:v23];
    v43 = (void *)v23;
    id v44 = v4;
    v24 = (void *)MEMORY[0x263F1C3C0];
    v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v26 = [v25 localizedStringForKey:@"Insert from File" value:&stru_26E1811C8 table:@"MUQuickLookContentEditorViewController"];
    v27 = [MEMORY[0x263F1C6B0] systemImageNamed:@"folder"];
    v53[0] = MEMORY[0x263EF8330];
    v53[1] = 3221225472;
    v53[2] = __65__MUQuickLookContentEditorViewController_getMenuElementsForPage___block_invoke_4;
    v53[3] = &unk_2649C28A0;
    objc_copyWeak(&v55, location);
    id v28 = v22;
    id v54 = v28;
    v29 = [v24 actionWithTitle:v26 image:v27 identifier:@"insert_page_from_file" handler:v53];

    [v5 addObject:v29];
    if ([MEMORY[0x263F1F330] isSupported])
    {
      v30 = (void *)MEMORY[0x263F1C3C0];
      v31 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v32 = [v31 localizedStringForKey:@"Scan Pages" value:&stru_26E1811C8 table:@"MUQuickLookContentEditorViewController"];
      v33 = [MEMORY[0x263F1C6B0] systemImageNamed:@"doc.text.viewfinder"];
      v50[0] = MEMORY[0x263EF8330];
      v50[1] = 3221225472;
      v50[2] = __65__MUQuickLookContentEditorViewController_getMenuElementsForPage___block_invoke_5;
      v50[3] = &unk_2649C28A0;
      objc_copyWeak(&v52, location);
      id v51 = v28;
      v34 = [v30 actionWithTitle:v32 image:v33 identifier:@"insert_pages_from_scanner" handler:v50];

      [v5 addObject:v34];
      objc_destroyWeak(&v52);
    }
    v35 = [(MarkupViewController *)self _pdfDocument];
    unint64_t v36 = [v35 pageCount];

    if (v36 >= 2)
    {
      v37 = (void *)MEMORY[0x263F1C3C0];
      v38 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v39 = [v38 localizedStringForKey:@"Delete" value:&stru_26E1811C8 table:@"MUQuickLookContentEditorViewController"];
      v40 = [MEMORY[0x263F1C6B0] systemImageNamed:@"trash"];
      v47[0] = MEMORY[0x263EF8330];
      v47[1] = 3221225472;
      v47[2] = __65__MUQuickLookContentEditorViewController_getMenuElementsForPage___block_invoke_6;
      v47[3] = &unk_2649C28A0;
      objc_copyWeak(&v49, location);
      id v48 = v28;
      v41 = [v37 actionWithTitle:v39 image:v40 identifier:@"delete_page" handler:v47];

      [v41 setAttributes:2];
      [v5 addObject:v41];

      objc_destroyWeak(&v49);
    }

    objc_destroyWeak(&v55);
    objc_destroyWeak(&v58);

    objc_destroyWeak(&v61);
    objc_destroyWeak(&v64);
    objc_destroyWeak(location);
    id v4 = v44;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void __65__MUQuickLookContentEditorViewController_getMenuElementsForPage___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _rotatePage:*(void *)(a1 + 32) clockwise:0];
}

void __65__MUQuickLookContentEditorViewController_getMenuElementsForPage___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _rotatePage:*(void *)(a1 + 32) clockwise:1];
}

void __65__MUQuickLookContentEditorViewController_getMenuElementsForPage___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _insertBlankPageAfterPage:*(void *)(a1 + 32)];
}

void __65__MUQuickLookContentEditorViewController_getMenuElementsForPage___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _insertPageFromFileAfterPage:*(void *)(a1 + 32)];
}

void __65__MUQuickLookContentEditorViewController_getMenuElementsForPage___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _insertPagesFromScannerAfterPage:*(void *)(a1 + 32)];
}

void __65__MUQuickLookContentEditorViewController_getMenuElementsForPage___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _deletePage:*(void *)(a1 + 32)];
}

- (void)convertToPDFAndWrite:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  int v8 = [(MUQuickLookContentEditorViewController *)self sharedSerialPagesEditionQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __81__MUQuickLookContentEditorViewController_convertToPDFAndWrite_completionHandler___block_invoke;
  v11[3] = &unk_2649C28C8;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __81__MUQuickLookContentEditorViewController_convertToPDFAndWrite_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _convertToPDFAndWrite:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 40)];
}

- (void)documentCameraViewControllerDidCancel:(id)a3
{
  id v6 = a3;
  id v4 = [(MUQuickLookContentEditorViewController *)self scanPDFHandler];
  if (v4)
  {
    id v5 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.MarkupUI.MUQuickLookContentEditorViewController" code:3 userInfo:0];
    ((void (**)(void, void, void *))v4)[2](v4, 0, v5);
    [(MUQuickLookContentEditorViewController *)self setScanPDFHandler:0];
  }
  [v6 dismissViewControllerAnimated:1 completion:0];
}

- (void)documentCameraViewController:(id)a3 didFinishWithScan:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __89__MUQuickLookContentEditorViewController_documentCameraViewController_didFinishWithScan___block_invoke;
  v9[3] = &unk_2649C2940;
  objc_copyWeak(&v12, &location);
  id v8 = v6;
  id v10 = v8;
  uint64_t v11 = self;
  [(MUQuickLookContentEditorViewController *)self convertToPDFAndWrite:v7 completionHandler:v9];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __89__MUQuickLookContentEditorViewController_documentCameraViewController_didFinishWithScan___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));

  if (WeakRetained)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __89__MUQuickLookContentEditorViewController_documentCameraViewController_didFinishWithScan___block_invoke_2;
    v5[3] = &unk_2649C2918;
    id v6 = *(id *)(a1 + 32);
    objc_copyWeak(&v9, (id *)(a1 + 48));
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = v3;
    dispatch_async(MEMORY[0x263EF83A0], v5);

    objc_destroyWeak(&v9);
  }
}

void __89__MUQuickLookContentEditorViewController_documentCameraViewController_didFinishWithScan___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __89__MUQuickLookContentEditorViewController_documentCameraViewController_didFinishWithScan___block_invoke_3;
  v4[3] = &unk_2649C28F0;
  objc_copyWeak(&v6, (id *)(a1 + 56));
  id v3 = *(void **)(a1 + 48);
  void v4[4] = *(void *)(a1 + 40);
  id v5 = v3;
  [v2 dismissViewControllerAnimated:1 completion:v4];

  objc_destroyWeak(&v6);
}

void __89__MUQuickLookContentEditorViewController_documentCameraViewController_didFinishWithScan___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    uint64_t v3 = [*(id *)(a1 + 32) scanPDFHandler];
    id v4 = (void *)v3;
    if (v3)
    {
      (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, *(void *)(a1 + 40), 0);
      [v5 setScanPDFHandler:0];
    }

    id WeakRetained = v5;
  }
}

- (void)documentCameraViewController:(id)a3 didFailWithError:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  NSLog(&cfstr_InsertingPdfPa.isa, self, v6);
  uint64_t v7 = [(MUQuickLookContentEditorViewController *)self scanPDFHandler];
  id v8 = (void *)v7;
  if (v7)
  {
    (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0, v6);
    [(MUQuickLookContentEditorViewController *)self setScanPDFHandler:0];
  }
  [v9 dismissViewControllerAnimated:1 completion:0];
}

- (id)sharedSerialPagesEditionQueue
{
  if (sharedSerialPagesEditionQueue_onceToken != -1) {
    dispatch_once(&sharedSerialPagesEditionQueue_onceToken, &__block_literal_global);
  }
  id v2 = (void *)sharedSerialPagesEditionQueue__sharedSerialPagesEditionQueue;
  return v2;
}

void __71__MUQuickLookContentEditorViewController_sharedSerialPagesEditionQueue__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);

  dispatch_queue_t v1 = dispatch_queue_create("com.apple.markup.pdf-pages-edition.serial-queue", attr);
  id v2 = (void *)sharedSerialPagesEditionQueue__sharedSerialPagesEditionQueue;
  sharedSerialPagesEditionQueue__sharedSerialPagesEditionQueue = (uint64_t)v1;
}

- (id)pdfPageOptionsForImageRef:(CGImage *)a3 withPreviousPage:(id)a4
{
  v13[2] = *MEMORY[0x263EF8340];
  [a4 boundsForBox:0];
  double v5 = v4;
  CGImageGetSizeAfterOrientation();
  id v8 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", 0.0, 0.0, v5, v5 * v6 / v7);
  uint64_t v9 = *MEMORY[0x263F14898];
  v12[0] = *MEMORY[0x263F14888];
  v12[1] = v9;
  v13[0] = v8;
  v13[1] = MEMORY[0x263EFFA88];
  id v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v10;
}

- (void)insertPages:(id)a3 atIndexes:(id)a4 inDocument:(id)a5
{
  id v25 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v25 count];
  if (v10 == [v8 count])
  {
    uint64_t v11 = [v8 count];
    id v12 = v25;
    if (v11)
    {
      for (unint64_t i = 0; i < v16; ++i)
      {
        id v14 = [v12 objectAtIndexedSubscript:i];
        double v15 = [v8 objectAtIndexedSubscript:i];
        objc_msgSend(v9, "insertPage:atIndex:", v14, objc_msgSend(v15, "unsignedIntegerValue"));

        unint64_t v16 = [v8 count];
        id v12 = v25;
      }
    }
    unint64_t v17 = [v12 count];
    v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v19 = v18;
    if (v17 >= 2) {
      v20 = @"Insert pages";
    }
    else {
      v20 = @"Insert page";
    }
    CGRect v21 = [v18 localizedStringForKey:v20 value:&stru_26E1811C8 table:@"MUQuickLookContentEditorViewController"];

    [(MUQuickLookContentEditorViewController *)self _registerActionNotEnablingMarkup:v21];
    id v22 = [(MarkupViewController *)self undoManager];
    uint64_t v23 = [v22 prepareWithInvocationTarget:self];
    [v23 _deletePages:v25 inDocument:v9];

    v24 = [(MarkupViewController *)self undoManager];
    [v24 setActionName:v21];
  }
  else
  {
    NSLog(&cfstr_NumberOfPagesT.isa);
  }
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  id v8 = a4;
  double v5 = [v8 description];
  NSLog(&cfstr_Importing.isa, v5);

  uint64_t v6 = [(MUQuickLookContentEditorViewController *)self importHandler];
  double v7 = (void *)v6;
  if (v6)
  {
    (*(void (**)(uint64_t, id, void))(v6 + 16))(v6, v8, 0);
    [(MUQuickLookContentEditorViewController *)self setImportHandler:0];
  }
}

- (void)documentPickerWasCancelled:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  NSLog(&cfstr_DocumentPickin.isa, a2, a3);
  double v4 = [(MUQuickLookContentEditorViewController *)self importHandler];
  if (v4)
  {
    double v5 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = *MEMORY[0x263F07F80];
    v9[0] = @"Document picker was cancelled.";
    uint64_t v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
    double v7 = [v5 errorWithDomain:@"com.apple.MarkupUI.MUQuickLookContentEditorViewController" code:2 userInfo:v6];

    ((void (**)(void, void, void *))v4)[2](v4, 0, v7);
    [(MUQuickLookContentEditorViewController *)self setImportHandler:0];
  }
}

- (void)find:(id)a3
{
  id v7 = a3;
  double v4 = [(MarkupViewController *)self contentViewController];
  int v5 = [v4 canPerformAction:sel_find_ withSender:v7];

  if (v5)
  {
    uint64_t v6 = [(MarkupViewController *)self contentViewController];
    [v6 find:v7];
  }
}

- (void)findPrevious:(id)a3
{
  id v7 = a3;
  double v4 = [(MarkupViewController *)self contentViewController];
  int v5 = [v4 canPerformAction:sel_findPrevious_ withSender:v7];

  if (v5)
  {
    uint64_t v6 = [(MarkupViewController *)self contentViewController];
    [v6 findPrevious:v7];
  }
}

- (void)findNext:(id)a3
{
  id v7 = a3;
  double v4 = [(MarkupViewController *)self contentViewController];
  int v5 = [v4 canPerformAction:sel_findNext_ withSender:v7];

  if (v5)
  {
    uint64_t v6 = [(MarkupViewController *)self contentViewController];
    [v6 findNext:v7];
  }
}

- (BOOL)isVisualSearchEnabled
{
  id v2 = [(MUQuickLookContentEditorViewController *)self imageAnalysisManager];
  char v3 = [v2 isVisualSearchEnabled];

  return v3;
}

- (NSString)filledInfoButtonGlyphName
{
  id v2 = [(MUQuickLookContentEditorViewController *)self imageAnalysisManager];
  char v3 = [v2 filledInfoButtonGlyphName];

  return (NSString *)v3;
}

- (NSString)infoButtonGlyphName
{
  id v2 = [(MUQuickLookContentEditorViewController *)self imageAnalysisManager];
  char v3 = [v2 infoButtonGlyphName];

  return (NSString *)v3;
}

- (void)setupAndStartImageAnalysisIfNeeded
{
  if (_os_feature_enabled_impl()
    && +[MUImageAnalysisManager shouldStartImageAnalysisForPresentationMode:[(MUQuickLookContentEditorViewController *)self presentationMode]])
  {
    [(MUQuickLookContentEditorViewController *)self _setupAndStartImageAnalysisIfNeeded];
  }
}

- (void)stopImageAnalysis
{
  id v2 = [(MUQuickLookContentEditorViewController *)self imageAnalysisManager];
  [v2 stopImageAnalysis];
}

- (BOOL)shouldHighlightTextAndDDAfterNextAnalysis
{
  id v2 = [(MUQuickLookContentEditorViewController *)self imageAnalysisManager];
  char v3 = [v2 shouldHighlightTextAndDDAfterNextAnalysis];

  return v3;
}

- (void)setShouldHighlightTextAndDDAfterNextAnalysis:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MUQuickLookContentEditorViewController *)self imageAnalysisManager];
  [v4 setShouldHighlightTextAndDDAfterNextAnalysis:v3];
}

- (BOOL)shouldEnterVisualSearchAfterNextAnalysis
{
  id v2 = [(MUQuickLookContentEditorViewController *)self imageAnalysisManager];
  char v3 = [v2 shouldEnterVisualSearchAfterNextAnalysis];

  return v3;
}

- (void)setShouldEnterVisualSearchAfterNextAnalysis:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MUQuickLookContentEditorViewController *)self imageAnalysisManager];
  [v4 setShouldEnterVisualSearchAfterNextAnalysis:v3];
}

- (BOOL)shouldUpliftSubjectAfterNextAnalysis
{
  id v2 = [(MUQuickLookContentEditorViewController *)self imageAnalysisManager];
  char v3 = [v2 shouldUpliftSubjectAfterNextAnalysis];

  return v3;
}

- (void)setShouldUpliftSubjectAfterNextAnalysis:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MUQuickLookContentEditorViewController *)self imageAnalysisManager];
  [v4 setShouldUpliftSubjectAfterNextAnalysis:v3];
}

- (UIImage)imageForAnalysis
{
  if ([(MUQuickLookContentEditorViewController *)self _hasImageContent])
  {
    BOOL v3 = [(MUQuickLookContentEditorViewController *)self latestImageForAnalysis];
    id v4 = v3;
    if (v3)
    {
      id v5 = v3;
    }
    else
    {
      uint64_t v6 = [(MarkupViewController *)self contentViewController];
      id v5 = [v6 imageForAnalysis];
    }
  }
  else
  {
    id v5 = 0;
  }
  return (UIImage *)v5;
}

- (NSDictionary)clientPreviewOptions
{
  id v2 = [(MarkupViewController *)self delegate];
  BOOL v3 = [v2 clientPreviewOptions];

  return (NSDictionary *)v3;
}

- (void)imageAnalyzerWantsUpdateInfoButtonWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(MarkupViewController *)self delegate];
  [v5 editor:self needsToUpdateChromeWithAnimation:v3];
}

- (void)imageAnalysisInteractionWillPresentVisualSearchController
{
  id v3 = [(MarkupViewController *)self delegate];
  [v3 editor:self willPresentViewControllerWithAnimation:0];
}

- (void)imageAnalysisInteractionDidDismissVisualSearchController
{
  id v3 = [(MarkupViewController *)self delegate];
  [v3 editor:self didDismissViewControllerWithAnimation:0];
}

- (id)_editedImageAnalysisQueue
{
  if (_editedImageAnalysisQueue_onceToken != -1) {
    dispatch_once(&_editedImageAnalysisQueue_onceToken, &__block_literal_global_197);
  }
  id v2 = (void *)_editedImageAnalysisQueue_queue;
  return v2;
}

void __67__MUQuickLookContentEditorViewController__editedImageAnalysisQueue__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);

  dispatch_queue_t v1 = dispatch_queue_create("com.apple.markup.edited-image-analysis.serial-queue", attr);
  id v2 = (void *)_editedImageAnalysisQueue_queue;
  _editedImageAnalysisQueue_queue = (uint64_t)v1;
}

- (void)_adjustImageInteractionForScrollEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(MUQuickLookContentEditorViewController *)self imageAnalysisManager];
  [v5 adjustImageInteractionForScrollView:v4];

  [(MUQuickLookContentEditorViewController *)self _updateAnalysisButtonsContainerConstraints];
}

- (void)_setupAndStartImageAnalysisIfNeeded
{
  id v3 = [(MUQuickLookContentEditorViewController *)self imageAnalysisManager];
  id v10 = v3;
  if (v3)
  {
    if ([v3 hasAnalysis])
    {
      [v10 addInteractionIfNeeded];
      [v10 setupAnalysisButtonsContainer];
      [(MUQuickLookContentEditorViewController *)self _updateAnalysisButtonsContainerConstraints];
LABEL_5:
      id v4 = v10;
      goto LABEL_10;
    }
    if ([v10 isAnalysisOngoing]) {
      goto LABEL_5;
    }
    [v10 stopImageAnalysis];
  }
  id v5 = [MUImageAnalysisManager alloc];
  uint64_t v6 = [(MUQuickLookContentEditorViewController *)self view];
  uint64_t v7 = [(MUImageAnalysisManager *)v5 initWithDelegate:self presentingView:v6];

  [(MUQuickLookContentEditorViewController *)self setImageAnalysisManager:v7];
  uint64_t v8 = [(MarkupViewController *)self contentViewController];
  id v9 = v8;
  if (v8) {
    [v8 setScrollViewDelegate:self];
  }
  [(MUQuickLookContentEditorViewController *)self _updateAnalysisButtonsContainerConstraints];

  id v4 = (void *)v7;
LABEL_10:
}

- (BOOL)_imageAnalysisOverlayAcceptSingleTouch:(id)a3
{
  id v4 = a3;
  id v5 = [(MUQuickLookContentEditorViewController *)self imageAnalysisManager];
  uint64_t v6 = [(MUQuickLookContentEditorViewController *)self imageAnalysisView];
  LOBYTE(v7) = 0;
  if (v6 && v5)
  {
    [v4 locationInView:v6];
    double v9 = v8;
    double v11 = v10;
    if ([v4 _isPointerTouch]
      && [v5 isTextSelectionEnabled]
      && (objc_msgSend(v5, "textExistsAtPoint:", v9, v11) & 1) != 0
      || (objc_msgSend(v5, "dataDetectorExistsAtPoint:", v9, v11) & 1) != 0)
    {
      int v12 = 1;
    }
    else
    {
      int v12 = objc_msgSend(v5, "visualSearchExistsAtPoint:", v9, v11);
    }
    int v7 = v12 | [v5 hasActiveTextSelection];
  }

  return v7;
}

- (unint64_t)_insertPagesFromProvidedPDFDocument:(id)a3 toPDFDocument:(id)a4 atPageIndex:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v26 = self;
  v27 = [(MarkupViewController *)self _pdfView];
  uint64_t v10 = [v27 displayBox];
  uint64_t v11 = [v8 pageCount];
  int v12 = [MEMORY[0x263EFF980] arrayWithCapacity:v11];
  if (v11)
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      id v14 = (void *)MEMORY[0x230F8EA40]();
      double v15 = [v8 pageAtIndex:i];
      unint64_t v16 = (void *)[v15 copy];

      [v16 boundsForBox:1];
      objc_msgSend(v16, "setBounds:forBox:", v10);
      [v9 insertPage:v16 atIndex:a5 + i];
      [v12 addObject:v16];
    }
  }
  unint64_t v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v18 = [v17 localizedStringForKey:@"Insert from File" value:&stru_26E1811C8 table:@"MUQuickLookContentEditorViewController"];
  [(MUQuickLookContentEditorViewController *)v26 _registerActionNotEnablingMarkup:v18];

  id v19 = [(MarkupViewController *)v26 undoManager];
  v20 = [v19 prepareWithInvocationTarget:v26];
  [v20 _deletePages:v12 inDocument:v9];

  CGRect v21 = [(MarkupViewController *)v26 undoManager];
  id v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v23 = [v22 localizedStringForKey:@"Insert from File" value:&stru_26E1811C8 table:@"MUQuickLookContentEditorViewController"];
  [v21 setActionName:v23];

  unint64_t v24 = [v12 count];
  return v24;
}

- (void)_insertPagesFromFileURLs:(id)a3 afterPage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 document];
  uint64_t v15 = 0;
  unint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  uint64_t v18 = [v8 indexForPage:v7];
  if (v16[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    NSLog(&cfstr_CouldNotFindIn.isa);
  }
  else
  {
    id v9 = [(MUQuickLookContentEditorViewController *)self sharedSerialPagesEditionQueue];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    void v10[2] = __77__MUQuickLookContentEditorViewController__insertPagesFromFileURLs_afterPage___block_invoke;
    v10[3] = &unk_2649C29B0;
    id v11 = v6;
    id v13 = self;
    id v14 = &v15;
    id v12 = v8;
    dispatch_async(v9, v10);
  }
  _Block_object_dispose(&v15, 8);
}

void __77__MUQuickLookContentEditorViewController__insertPagesFromFileURLs_afterPage___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
    uint64_t v6 = *MEMORY[0x263EFF608];
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v16 = 0;
        id v17 = 0;
        char v9 = [v8 getResourceValue:&v17 forKey:v6 error:&v16];
        id v10 = v17;
        id v11 = v16;
        id v12 = v11;
        if (v9)
        {
          id v13 = [*(id *)(a1 + 40) pageAtIndex:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
          if (v13)
          {
            v15[0] = MEMORY[0x263EF8330];
            v15[1] = 3221225472;
            v15[2] = __77__MUQuickLookContentEditorViewController__insertPagesFromFileURLs_afterPage___block_invoke_2;
            v15[3] = &unk_2649C2988;
            id v14 = *(void **)(a1 + 48);
            v15[4] = *(void *)(a1 + 56);
            [v14 _insertFileAtURL:v8 type:v10 afterPage:v13 completionHandler:v15];
          }
          else
          {
            NSLog(&cfstr_OriginalPageTo.isa);
          }
        }
        else
        {
          NSLog(&cfstr_TheContentType.isa, v11);
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v4);
  }
}

uint64_t __77__MUQuickLookContentEditorViewController__insertPagesFromFileURLs_afterPage___block_invoke_2(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) += a2;
  return result;
}

- (void)_insertFileAtURL:(id)a3 type:(id)a4 afterPage:(id)a5 completionHandler:(id)a6
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void))a6;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v14 = [(MUQuickLookContentEditorViewController *)self supportedUTTypes];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        if ([v11 conformsToType:v19])
        {
          long long v21 = [v11 description];
          NSLog(&cfstr_InsertingEleme.isa, v21);

          if (v19 == *MEMORY[0x263F1DBF0])
          {
            [(MUQuickLookContentEditorViewController *)self _insertPDFDocumentWithURL:v10 afterPage:v12 completionHandler:v13];
          }
          else if (v19 == *MEMORY[0x263F1DB18])
          {
            [(MUQuickLookContentEditorViewController *)self _insertImageWithURL:v10 afterPage:v12 completionHandler:v13];
          }
          else
          {
            v13[2](v13, 0);
          }

          goto LABEL_16;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

  long long v20 = [v11 description];
  NSLog(&cfstr_CouldNotInsert.isa, v20);

  v13[2](v13, 0);
LABEL_16:
}

- (void)_insertPDFDocumentWithURL:(id)a3 afterPage:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (objc_class *)MEMORY[0x263F14738];
  id v11 = a3;
  id v12 = (void *)[[v10 alloc] initWithURL:v11];

  if (v12)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __96__MUQuickLookContentEditorViewController__insertPDFDocumentWithURL_afterPage_completionHandler___block_invoke;
    void v13[3] = &unk_2649C29D8;
    id v14 = v8;
    id v17 = v9;
    uint64_t v15 = self;
    id v16 = v12;
    dispatch_sync(MEMORY[0x263EF83A0], v13);
  }
  else
  {
    (*((void (**)(id, void))v9 + 2))(v9, 0);
  }
}

void __96__MUQuickLookContentEditorViewController__insertPDFDocumentWithURL_afterPage_completionHandler___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) document];
  uint64_t v2 = [v3 indexForPage:*(void *)(a1 + 32)];
  if (v2 == 0x7FFFFFFFFFFFFFFFLL) {
    NSLog(&cfstr_CouldNotFindIn_0.isa);
  }
  else {
    [*(id *)(a1 + 40) _insertPagesFromProvidedPDFDocument:*(void *)(a1 + 48) toPDFDocument:v3 atPageIndex:v2 + 1];
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)_insertImageWithURL:(id)a3 afterPage:(id)a4 completionHandler:(id)a5
{
  CFURLRef v8 = (const __CFURL *)a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = [v10 document];
  uint64_t v12 = [v11 indexForPage:v10];

  id v13 = CGImageSourceCreateWithURL(v8, 0);
  if (v13)
  {
    id v14 = v13;
    CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v13, 0, 0);
    CFRelease(v14);
    if (ImageAtIndex)
    {
      unint64_t v16 = v12 + 1;
      if ([v11 pageCount] && v16 <= objc_msgSend(v11, "pageCount"))
      {
        if (v12 == -1) {
          uint64_t v18 = 0;
        }
        else {
          uint64_t v18 = v12;
        }
        uint64_t v19 = [v11 pageAtIndex:v18];
        id v17 = [(MUQuickLookContentEditorViewController *)self pdfPageOptionsForImageRef:ImageAtIndex withPreviousPage:v19];
      }
      else
      {
        id v17 = (void *)MEMORY[0x263EFFA78];
      }
      id v20 = objc_alloc(MEMORY[0x263F14748]);
      long long v21 = [MEMORY[0x263F1C6B0] imageWithCGImage:ImageAtIndex];
      long long v22 = (void *)[v20 initWithImage:v21 options:v17];

      CGImageRelease(ImageAtIndex);
      if (v22)
      {
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __90__MUQuickLookContentEditorViewController__insertImageWithURL_afterPage_completionHandler___block_invoke;
        block[3] = &unk_2649C2A00;
        block[4] = self;
        id v24 = v22;
        unint64_t v27 = v16;
        id v25 = v11;
        id v26 = v9;
        dispatch_sync(MEMORY[0x263EF83A0], block);
      }
      else
      {
        NSLog(&cfstr_PdfDocumentCou.isa, v8);
        (*((void (**)(id, void))v9 + 2))(v9, 0);
      }
    }
    else
    {
      NSLog(&cfstr_ImageToInsertC.isa);
      (*((void (**)(id, void))v9 + 2))(v9, 0);
    }
  }
  else
  {
    NSLog(&cfstr_CannotCreateIm.isa);
  }
}

uint64_t __90__MUQuickLookContentEditorViewController__insertImageWithURL_afterPage_completionHandler___block_invoke(void *a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)a1[4];
  v8[0] = a1[5];
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  uint64_t v4 = [NSNumber numberWithUnsignedInteger:a1[8]];
  id v7 = v4;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v7 count:1];
  [v2 insertPages:v3 atIndexes:v5 inDocument:a1[6]];

  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

- (void)_convertToPDFAndWrite:(id)a3 completionHandler:(id)a4
{
  v42[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = objc_alloc_init(MEMORY[0x263F14738]);
  id v9 = (void *)MEMORY[0x230F8EA40]();
  if ([v6 pageCount])
  {
    v37 = v9;
    v38 = v7;
    id v10 = 0;
    id v11 = 0;
    unint64_t v12 = 0;
    do
    {
      id v13 = v11;
      id v14 = v10;
      id v11 = [v6 imageOfPageAtIndex:v12];

      uint64_t v15 = [(MUQuickLookContentEditorViewController *)self scanImageToPDFConversionHandler];
      id v10 = ((void (**)(void, void *))v15)[2](v15, v11);

      if (v10)
      {
        objc_msgSend(v8, "insertPage:atIndex:", v10, objc_msgSend(v8, "pageCount"));
      }
      else
      {
        uint64_t v16 = [v6 pageCount];
        id v17 = [v11 debugDescription];
        NSLog(&cfstr_FailedToCreate.isa, v12, v16, v17);
      }
      ++v12;
    }
    while (v12 < [v6 pageCount]);

    id v9 = v37;
    id v7 = v38;
  }
  uint64_t v18 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v19 = [v18 temporaryDirectory];
  id v20 = [MEMORY[0x263F08C38] UUID];
  uint64_t v21 = [v20 UUIDString];
  long long v22 = [v19 URLByAppendingPathComponent:v21];

  long long v23 = [v22 path];
  LOBYTE(v21) = [v18 fileExistsAtPath:v23];

  if (v21)
  {
    id v24 = [v22 path];
    id v40 = 0;
    [v18 removeItemAtPath:v24 error:&v40];
    id v25 = v40;

    if (v25)
    {
      id v26 = [v22 path];
      NSLog(&cfstr_FailedToRemove.isa, v26, v25);

LABEL_13:
      v7[2](v7, 0);
      goto LABEL_18;
    }
  }
  unint64_t v27 = [v22 path];
  id v39 = 0;
  [v18 createDirectoryAtPath:v27 withIntermediateDirectories:1 attributes:0 error:&v39];
  id v25 = v39;

  if (v25)
  {
    NSLog(&cfstr_FailedToCreate_0.isa, v25);
    goto LABEL_13;
  }
  id v28 = NSString;
  v29 = [MEMORY[0x263F086E0] mainBundle];
  [v29 localizedStringForKey:@"Scanned Document" value:&stru_26E1811C8 table:0];
  v31 = v30 = v7;
  uint64_t v32 = [v28 stringWithFormat:@"%@.pdf", v31];

  id v7 = v30;
  v33 = (void *)v32;
  v34 = [v22 URLByAppendingPathComponent:v32];
  uint64_t v41 = *MEMORY[0x263F00460];
  v42[0] = MEMORY[0x263EFFA88];
  v35 = [NSDictionary dictionaryWithObjects:v42 forKeys:&v41 count:1];
  if ([v8 writeToURL:v34 withOptions:v35]) {
    unint64_t v36 = v34;
  }
  else {
    unint64_t v36 = 0;
  }
  ((void (**)(id, void *))v7)[2](v7, v36);

LABEL_18:
}

- (void)_detectedEditEnablingMarkup:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(MarkupViewController *)self formFillingEnabled];
  uint64_t v6 = [(MarkupViewController *)self delegate];
  if (v6)
  {
    id v7 = (void *)v6;
    if (objc_opt_respondsToSelector()) {
      [v7 editorDidChangeContent:self enablingMarkup:v3 && !v5];
    }
  }
  MEMORY[0x270F9A790]();
}

- (void)_loadSourceContentWithCompletion:(id)a3
{
  id v4 = a3;
  [(MUQuickLookContentEditorViewController *)self setFormDetectedInDocument:0];
  [(MUQuickLookContentEditorViewController *)self _resetOriginalDelegate];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __75__MUQuickLookContentEditorViewController__loadSourceContentWithCompletion___block_invoke;
  v7[3] = &unk_2649C2A28;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)MUQuickLookContentEditorViewController;
  id v5 = v4;
  [(MarkupViewController *)&v6 _loadSourceContentWithCompletion:v7];
}

uint64_t __75__MUQuickLookContentEditorViewController__loadSourceContentWithCompletion___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _hasPDFContent])
  {
    uint64_t v2 = [*(id *)(a1 + 32) contentViewController];
    [v2 setThumbnailViewStyle:1];
  }
  [*(id *)(a1 + 32) _setAsPDFViewDelegatePrivateIfNecessary];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MUQuickLookContentEditorViewController;
  [(MarkupViewController *)&v6 setDelegate:v4];
  if (v4) {
    char v5 = objc_opt_respondsToSelector();
  }
  else {
    char v5 = 0;
  }
  [(MUQuickLookContentEditorViewController *)self setDelegateRespondsToDetectedFormInContent:v5 & 1];
  [(MUQuickLookContentEditorViewController *)self _setAsPDFViewDelegatePrivateIfNecessary];
}

- (void)_setAsPDFViewDelegatePrivateIfNecessary
{
  if ([(MUQuickLookContentEditorViewController *)self _hasPDFContent]
    && [(MUQuickLookContentEditorViewController *)self delegateRespondsToDetectedFormInContent])
  {
    if (!self->_pdfViewDelegateProxy)
    {
      BOOL v3 = [MUDelegateProxy alloc];
      pdfViewDelegateProxy = self->_pdfViewDelegateProxy;
      self->_pdfViewDelegateProxy = (PDFViewDelegatePrivate *)v3;

      [(PDFViewDelegatePrivate *)self->_pdfViewDelegateProxy setFirstDelegate:self];
    }
    char v5 = [(MarkupViewController *)self _pdfView];
    objc_super v6 = [v5 delegate];
    [(PDFViewDelegatePrivate *)self->_pdfViewDelegateProxy setSecondDelegate:v6];

    id v7 = self->_pdfViewDelegateProxy;
    id v8 = [(MarkupViewController *)self _pdfView];
    [v8 setDelegate:v7];
  }
  else
  {
    [(MUQuickLookContentEditorViewController *)self _resetOriginalDelegate];
  }
}

- (void)_resetOriginalDelegate
{
  pdfViewDelegateProxy = self->_pdfViewDelegateProxy;
  if (pdfViewDelegateProxy)
  {
    id v5 = [(PDFViewDelegatePrivate *)pdfViewDelegateProxy secondDelegate];
    id v4 = [(MarkupViewController *)self _pdfView];
    [v4 setDelegate:v5];
  }
}

- (void)_updateAnalysisButtonsContainerConstraints
{
  BOOL v3 = [(MarkupViewController *)self imageViewCombinedContentView];
  id v4 = [v3 subviews];
  id v7 = [v4 firstObject];

  id v5 = [(MUQuickLookContentEditorViewController *)self imageAnalysisManager];
  objc_super v6 = [(MUQuickLookContentEditorViewController *)self view];
  [v5 updateBottomRightContainerPositionForImageView:v7 view:v6];
}

- (void)_updateThumbnailViewWithTraitCollection:(id)a3
{
  id v11 = a3;
  if ([(MUQuickLookContentEditorViewController *)self _hasPDFContent]
    && [(MarkupViewController *)self thumbnailViewStyle] == 1)
  {
    BOOL v4 = [(MUQuickLookContentEditorViewController *)self _shouldShowMarkupOverlays];
    BOOL v5 = [(MarkupViewController *)self fixedThumbnailView];
    BOOL v6 = v4 && [v11 horizontalSizeClass] == 2;
    [(MarkupViewController *)self setFixedThumbnailView:v6];
    if (v5 && ![(MarkupViewController *)self fixedThumbnailView])
    {
      id v7 = [(MarkupViewController *)self contentViewController];
      [v7 setShouldShowThumbnailView:0];
    }
    if (v4)
    {
      id v8 = [(MarkupViewController *)self contentViewController];
      BOOL v9 = ([v8 shouldShowThumbnailView] & 1) != 0
        || [(MarkupViewController *)self fixedThumbnailView];
    }
    else
    {
      BOOL v9 = 0;
    }
    [(MarkupViewController *)self setShowThumbnailViewForMultipage:v9];
    id v10 = [(MarkupViewController *)self delegate];
    if (v10 && (objc_opt_respondsToSelector() & 1) == 0) {
      objc_msgSend(v10, "editor:needsScreenEdgePanGestureRecognition:", self, -[MarkupViewController showThumbnailViewForMultipage](self, "showThumbnailViewForMultipage"));
    }
  }
}

- (void)_flattenImageForAnalysis
{
  id v8 = 0;
  BOOL v3 = [(MarkupViewController *)self dataRepresentationWithError:&v8];
  id v4 = v8;
  BOOL v5 = v4;
  if (v4)
  {
    NSLog(&cfstr_GettingDataRep.isa, v4, self);
    [(MUQuickLookContentEditorViewController *)self setLatestImageForAnalysis:0];
  }
  else
  {
    BOOL v6 = [MEMORY[0x263F1C6B0] imageWithData:v3];
    [(MUQuickLookContentEditorViewController *)self setLatestImageForAnalysis:v6];
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__MUQuickLookContentEditorViewController__flattenImageForAnalysis__block_invoke;
  block[3] = &unk_2649C2828;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __66__MUQuickLookContentEditorViewController__flattenImageForAnalysis__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) imageAnalysisManager];
  [v1 startImageAnalysis];
}

- (void)_setPresentationModeForImageContent:(unint64_t)a3
{
  if ([(MUQuickLookContentEditorViewController *)self _hasImageContent]
    && _os_feature_enabled_impl())
  {
    if (+[MUImageAnalysisManager shouldStartImageAnalysisForPresentationMode:](MUImageAnalysisManager, "shouldStartImageAnalysisForPresentationMode:", a3)&& (-[MUQuickLookContentEditorViewController didAppearOnce](self, "didAppearOnce")|| (-[MUQuickLookContentEditorViewController imageAnalysisManager](self, "imageAnalysisManager"), BOOL v5 = objc_claimAutoreleasedReturnValue(), v6 = [v5 hasAnalysis], v5, v6)))
    {
      [(MUQuickLookContentEditorViewController *)self _setupAndStartImageAnalysisIfNeeded];
    }
    else
    {
      [(MUQuickLookContentEditorViewController *)self _updateAnalysisButtonsContainerConstraints];
    }
  }
}

- (void)_setPresentationModeForPDFContent:(unint64_t)a3
{
  if ([(MUQuickLookContentEditorViewController *)self _hasPDFContent])
  {
    id v10 = [(MarkupViewController *)self _pdfView];
    BOOL v5 = [v10 layer];
    [v5 setAllowsGroupOpacity:0];

    if (a3 == 1)
    {
      [v10 setFindInteractionEnabled:0];
      [v10 usePageViewController:1 withViewOptions:0];
      [v10 setDisplayDirection:0];
      BOOL v9 = [MEMORY[0x263F1C550] clearColor];
      [v10 setBackgroundColor:v9];
    }
    else if (!a3)
    {
      int v6 = [v10 documentScrollView];
      [v6 setKeyboardDismissMode:1];

      [(MarkupViewController *)self setForcesPDFViewTopAlignment:1];
      id v7 = [(MarkupViewController *)self contentViewScrollView];
      [v7 setContentInsetAdjustmentBehavior:2];

      id v8 = [(MarkupViewController *)self contentViewScrollView];
      [v8 _setIndicatorInsetAdjustmentBehavior:1];

      [v10 setFindInteractionEnabled:1];
    }
    [(MarkupViewController *)self setAllowsThumbnailViewPageReordering:[(MUQuickLookContentEditorViewController *)self canEditPDF]];
  }
}

- (BOOL)_shouldShowMarkupOverlays
{
  char v3 = [(MUQuickLookContentEditorViewController *)self documentIsLocked];
  return [(MUQuickLookContentEditorViewController *)self _presentationModeAllowsMarkupOverlays] & ~v3;
}

- (BOOL)_presentationModeAllowsMarkupOverlays
{
  return [(MUQuickLookContentEditorViewController *)self presentationMode] == 0;
}

- (void)_registerActionNotEnablingMarkup:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MUQuickLookContentEditorViewController *)self actionsNotEnablingMarkup];

  if (!v5)
  {
    int v6 = objc_opt_new();
    [(MUQuickLookContentEditorViewController *)self setActionsNotEnablingMarkup:v6];
  }
  id v7 = [(MUQuickLookContentEditorViewController *)self actionsNotEnablingMarkup];
  [v7 addObject:v4];
}

- (void)_rotatePage:(id)a3 clockwise:(BOOL)a4
{
  BOOL v4 = a4;
  id v15 = a3;
  uint64_t v6 = [v15 rotation];
  uint64_t v7 = 90;
  if (v4)
  {
    id v8 = @"Rotate Left";
  }
  else
  {
    uint64_t v7 = -90;
    id v8 = @"Rotate Right";
  }
  [v15 setRotation:v6 + v7];
  BOOL v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:v8 value:&stru_26E1811C8 table:@"MUQuickLookContentEditorViewController"];

  [(MUQuickLookContentEditorViewController *)self _registerActionNotEnablingMarkup:v10];
  id v11 = [(MarkupViewController *)self undoManager];
  unint64_t v12 = [v11 prepareWithInvocationTarget:self];
  [v12 _rotatePage:v15 clockwise:!v4];

  id v13 = [(MarkupViewController *)self undoManager];
  [v13 setActionName:v10];

  id v14 = [(MarkupViewController *)self _pdfView];
  objc_msgSend(v14, "setAutoScales:", objc_msgSend(v14, "autoScales"));
}

- (void)_insertBlankPageAfterPage:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 document];
  uint64_t v6 = [v5 indexForPage:v4] + 1;
  id v7 = objc_alloc_init(MEMORY[0x263F14748]);
  [v4 boundsForBox:1];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  objc_msgSend(v7, "setBounds:forBox:", 0, v9, v11, v13, v15);
  [(MUQuickLookContentEditorViewController *)self _insertBlankPage:v7 atIndex:v6];
  objc_initWeak(&location, self);
  dispatch_time_t v16 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__MUQuickLookContentEditorViewController__insertBlankPageAfterPage___block_invoke;
  block[3] = &unk_2649C2A50;
  objc_copyWeak(&v20, &location);
  id v19 = v7;
  id v17 = v7;
  dispatch_after(v16, MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __68__MUQuickLookContentEditorViewController__insertBlankPageAfterPage___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained _pdfView];
  [v2 goToPage:*(void *)(a1 + 32)];
}

- (void)_insertPageFromFileAfterPage:(id)a3
{
  id v4 = a3;
  [(MUQuickLookContentEditorViewController *)self setAnnotationEditingEnabled:0];
  BOOL v5 = [(MarkupViewController *)self delegate];
  [v5 editor:self willPresentViewControllerWithAnimation:1];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__MUQuickLookContentEditorViewController__insertPageFromFileAfterPage___block_invoke;
  v7[3] = &unk_2649C2A78;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(MUQuickLookContentEditorViewController *)self _presentDocumentPicker:v7];
}

void __71__MUQuickLookContentEditorViewController__insertPageFromFileAfterPage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 domain];
    if ([v7 isEqualToString:@"com.apple.MarkupUI.MUQuickLookContentEditorViewController"])
    {
      uint64_t v8 = [v6 code];

      if (v8 == 2)
      {
        NSLog(&cfstr_DocumentPicker_0.isa);
        goto LABEL_10;
      }
    }
    else
    {
    }
    NSLog(&cfstr_PresentingDocu.isa, *(void *)(a1 + 32));
  }
  else if ([v10 count])
  {
    [*(id *)(a1 + 32) _insertPagesFromFileURLs:v10 afterPage:*(void *)(a1 + 40)];
    double v9 = [*(id *)(a1 + 32) delegate];
    [v9 editor:*(void *)(a1 + 32) didDismissViewControllerWithAnimation:1];
  }
  else
  {
    NSLog(&cfstr_PresentingDocu_0.isa);
  }
LABEL_10:
}

- (void)_insertPage:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(MarkupViewController *)self _pdfDocument];
  [v7 insertPage:v6 atIndex:a4];
}

- (void)_insertBlankPage:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  [(MUQuickLookContentEditorViewController *)self _insertPage:v6 atIndex:a4];
  id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v8 = [v7 localizedStringForKey:@"Insert Blank Page" value:&stru_26E1811C8 table:@"MUQuickLookContentEditorViewController"];
  [(MUQuickLookContentEditorViewController *)self _registerActionNotEnablingMarkup:v8];

  double v9 = [(MarkupViewController *)self undoManager];
  id v10 = [v9 prepareWithInvocationTarget:self];
  [v10 _deletePage:v6];

  id v13 = [(MarkupViewController *)self undoManager];
  double v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  double v12 = [v11 localizedStringForKey:@"Insert Blank Page" value:&stru_26E1811C8 table:@"MUQuickLookContentEditorViewController"];
  [v13 setActionName:v12];
}

- (void)_insertDeletedPage:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  [(MUQuickLookContentEditorViewController *)self _insertPage:v6 atIndex:a4];
  id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v8 = [v7 localizedStringForKey:@"Insert Deleted Page" value:&stru_26E1811C8 table:@"MUQuickLookContentEditorViewController"];
  [(MUQuickLookContentEditorViewController *)self _registerActionNotEnablingMarkup:v8];

  double v9 = [(MarkupViewController *)self undoManager];
  id v10 = [v9 prepareWithInvocationTarget:self];
  [v10 _deletePage:v6];

  id v13 = [(MarkupViewController *)self undoManager];
  double v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  double v12 = [v11 localizedStringForKey:@"Insert Deleted Page" value:&stru_26E1811C8 table:@"MUQuickLookContentEditorViewController"];
  [v13 setActionName:v12];
}

- (void)_deletePage:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:&v8 count:1];

  id v7 = [(MarkupViewController *)self _pdfDocument];
  [(MUQuickLookContentEditorViewController *)self _deletePages:v6 inDocument:v7];
}

- (void)_deletePages:(id)a3 inDocument:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MarkupViewController *)self _pdfView];
  uint64_t v9 = [v8 currentPage];
  unint64_t v10 = [v7 indexForPage:v9];

  double v11 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  double v12 = [v6 reverseObjectEnumerator];
  id v13 = [v12 allObjects];

  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __66__MUQuickLookContentEditorViewController__deletePages_inDocument___block_invoke;
  v29[3] = &unk_2649C2AA0;
  id v14 = v7;
  id v30 = v14;
  id v15 = v11;
  id v31 = v15;
  id v28 = v13;
  [v13 enumerateObjectsUsingBlock:v29];
  if (v14 && [v14 pageCount] && v10 >= objc_msgSend(v14, "pageCount"))
  {
    dispatch_time_t v16 = objc_msgSend(v14, "pageAtIndex:", objc_msgSend(v14, "pageCount") - 1);
    [v8 goToPage:v16];
  }
  unint64_t v17 = [v6 count];
  uint64_t v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v19 = v18;
  if (v17 >= 2) {
    id v20 = @"Remove pages";
  }
  else {
    id v20 = @"Remove page";
  }
  uint64_t v21 = [v18 localizedStringForKey:v20 value:&stru_26E1811C8 table:@"MUQuickLookContentEditorViewController"];

  [(MUQuickLookContentEditorViewController *)self _registerActionNotEnablingMarkup:v21];
  long long v22 = [(MarkupViewController *)self undoManager];
  long long v23 = [v22 prepareWithInvocationTarget:self];
  id v24 = [v15 reverseObjectEnumerator];
  [v24 allObjects];
  v26 = id v25 = v8;
  [v23 insertPages:v6 atIndexes:v26 inDocument:v14];

  unint64_t v27 = [(MarkupViewController *)self undoManager];
  [v27 setActionName:v21];
}

void __66__MUQuickLookContentEditorViewController__deletePages_inDocument___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) indexForPage:a2];
  [*(id *)(a1 + 32) removePageAtIndex:v3];
  id v4 = *(void **)(a1 + 40);
  id v5 = [NSNumber numberWithUnsignedInteger:v3];
  [v4 addObject:v5];
}

- (id)supportedUTTypes
{
  if (supportedUTTypes_onceToken != -1) {
    dispatch_once(&supportedUTTypes_onceToken, &__block_literal_global_287);
  }
  uint64_t v2 = (void *)supportedUTTypes_supportedTypes;
  return v2;
}

void __58__MUQuickLookContentEditorViewController_supportedUTTypes__block_invoke()
{
  v3[2] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F1DB18];
  v3[0] = *MEMORY[0x263F1DBF0];
  v3[1] = v0;
  uint64_t v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v3 count:2];
  uint64_t v2 = (void *)supportedUTTypes_supportedTypes;
  supportedUTTypes_supportedTypes = v1;
}

- (void)_presentDocumentPicker:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __65__MUQuickLookContentEditorViewController__presentDocumentPicker___block_invoke;
  v6[3] = &unk_2649C2A28;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __65__MUQuickLookContentEditorViewController__presentDocumentPicker___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 40) copy];
  [*(id *)(a1 + 32) setImportHandler:v2];

  uint64_t v3 = [MUDocumentPickerViewController alloc];
  id v4 = [*(id *)(a1 + 32) supportedUTTypes];
  id v6 = [(UIDocumentPickerViewController *)v3 initForOpeningContentTypes:v4 asCopy:1];

  [v6 setAllowsMultipleSelection:1];
  [v6 setDelegate:*(void *)(a1 + 32)];
  [v6 setModalPresentationStyle:2];
  id v5 = [v6 presentationController];
  [v5 setDelegate:v6];

  [*(id *)(a1 + 32) presentViewController:v6 animated:1 completion:0];
}

- (void)_presentDocumentScannerAfterPage:(id)a3
{
  id v4 = a3;
  id v5 = [(MUQuickLookContentEditorViewController *)self scanPDFHandler];

  if (v5)
  {
    NSLog(&cfstr_TryingToScanNe.isa, self);
  }
  else
  {
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    void v12[2] = __75__MUQuickLookContentEditorViewController__presentDocumentScannerAfterPage___block_invoke;
    v12[3] = &unk_2649C2AC8;
    objc_copyWeak(&v14, &location);
    id v6 = v4;
    id v13 = v6;
    [(MUQuickLookContentEditorViewController *)self setScanPDFHandler:v12];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    void v9[2] = __75__MUQuickLookContentEditorViewController__presentDocumentScannerAfterPage___block_invoke_2;
    v9[3] = &unk_2649C2AF0;
    objc_copyWeak(&v11, &location);
    id v10 = v6;
    [(MUQuickLookContentEditorViewController *)self setScanImageToPDFConversionHandler:v9];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __75__MUQuickLookContentEditorViewController__presentDocumentScannerAfterPage___block_invoke_3;
    block[3] = &unk_2649C2878;
    objc_copyWeak(&v8, &location);
    dispatch_async(MEMORY[0x263EF83A0], block);
    objc_destroyWeak(&v8);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __75__MUQuickLookContentEditorViewController__presentDocumentScannerAfterPage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v28 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = [WeakRetained delegate];
    [v8 editor:v7 willPresentViewControllerWithAnimation:1];

    if (v28)
    {
      uint64_t v9 = [v7 _pdfView];
      uint64_t v10 = [v7 _pdfDocument];
      id v11 = (void *)v10;
      if (v9 && v10)
      {
        id v27 = v5;
        uint64_t v12 = [v9 displayBox];
        id v13 = (void *)[objc_alloc(MEMORY[0x263F14738]) initWithURL:v28];
        id v26 = v11;
        uint64_t v14 = [v11 indexForPage:*(void *)(a1 + 32)];
        if ([v13 pageCount])
        {
          unint64_t v15 = 0;
          v29 = v13;
          uint64_t v30 = v14 + 1;
          do
          {
            context = (void *)MEMORY[0x230F8EA40]();
            dispatch_time_t v16 = [v13 pageAtIndex:v15];
            unint64_t v17 = (void *)[v16 copy];

            [v17 boundsForBox:1];
            objc_msgSend(v17, "setBounds:forBox:", v12);
            [v7 _insertPage:v17 atIndex:v30 + v15];
            uint64_t v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            id v19 = [v18 localizedStringForKey:@"Scan Pages" value:&stru_26E1811C8 table:@"MUQuickLookContentEditorViewController"];
            [v7 _registerActionNotEnablingMarkup:v19];

            id v20 = [v7 undoManager];
            uint64_t v21 = [v20 prepareWithInvocationTarget:v7];
            [v21 _deletePage:v17];

            long long v22 = [v7 undoManager];
            long long v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            [v23 localizedStringForKey:@"Scan Pages" value:&stru_26E1811C8 table:@"MUQuickLookContentEditorViewController"];
            id v25 = v24 = v12;
            [v22 setActionName:v25];

            uint64_t v12 = v24;
            id v13 = v29;

            ++v15;
          }
          while (v15 < [v29 pageCount]);
        }

        id v5 = v27;
        id v11 = v26;
      }
    }
  }
}

id __75__MUQuickLookContentEditorViewController__presentDocumentScannerAfterPage___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = v3;
    id v6 = objc_msgSend(WeakRetained, "pdfPageOptionsForImageRef:withPreviousPage:", objc_msgSend(v5, "CGImage"), *(void *)(a1 + 32));
    id v7 = (void *)[objc_alloc(MEMORY[0x263F14748]) initWithImage:v5 options:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __75__MUQuickLookContentEditorViewController__presentDocumentScannerAfterPage___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if ([WeakRetained annotationEditingEnabled]) {
      [WeakRetained setAnnotationEditingEnabled:0];
    }
    uint64_t v1 = [WeakRetained delegate];
    [v1 editor:WeakRetained willPresentViewControllerWithAnimation:1];

    id v2 = objc_alloc_init(MEMORY[0x263F1F330]);
    [v2 setDelegate:WeakRetained];
    id v3 = [WeakRetained view];
    id v4 = [v3 tintColor];
    id v5 = [v2 view];
    [v5 setTintColor:v4];

    [v2 setModalPresentationStyle:5];
    [WeakRetained presentViewController:v2 animated:1 completion:0];
  }
}

- (BOOL)_hasPDFContent
{
  id v2 = [(MarkupViewController *)self contentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_hasImageContent
{
  id v2 = [(MarkupViewController *)self contentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)importHandler
{
  return self->_importHandler;
}

- (void)setImportHandler:(id)a3
{
}

- (id)scanPDFHandler
{
  return self->_scanPDFHandler;
}

- (void)setScanPDFHandler:(id)a3
{
}

- (id)scanImageToPDFConversionHandler
{
  return self->_scanImageToPDFConversionHandler;
}

- (void)setScanImageToPDFConversionHandler:(id)a3
{
}

- (NSMutableSet)actionsNotEnablingMarkup
{
  return self->_actionsNotEnablingMarkup;
}

- (void)setActionsNotEnablingMarkup:(id)a3
{
}

- (MUImageAnalysisManager)imageAnalysisManager
{
  return self->_imageAnalysisManager;
}

- (void)setImageAnalysisManager:(id)a3
{
}

- (UIImage)latestImageForAnalysis
{
  return self->_latestImageForAnalysis;
}

- (void)setLatestImageForAnalysis:(id)a3
{
}

- (BOOL)didAppearOnce
{
  return self->_didAppearOnce;
}

- (void)setDidAppearOnce:(BOOL)a3
{
  self->_didAppearOnce = a3;
}

- (BOOL)delegateRespondsToDetectedFormInContent
{
  return self->_delegateRespondsToDetectedFormInContent;
}

- (void)setDelegateRespondsToDetectedFormInContent:(BOOL)a3
{
  self->_delegateRespondsToDetectedFormInContent = a3;
}

- (BOOL)formDetectedInDocument
{
  return self->_formDetectedInDocument;
}

- (void)setFormDetectedInDocument:(BOOL)a3
{
  self->_formDetectedInDocument = a3;
}

- (PDFViewDelegatePrivate)pdfViewDelegateProxy
{
  return self->_pdfViewDelegateProxy;
}

- (void)setPdfViewDelegateProxy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pdfViewDelegateProxy, 0);
  objc_storeStrong((id *)&self->_latestImageForAnalysis, 0);
  objc_storeStrong((id *)&self->_imageAnalysisManager, 0);
  objc_storeStrong((id *)&self->_actionsNotEnablingMarkup, 0);
  objc_storeStrong(&self->_scanImageToPDFConversionHandler, 0);
  objc_storeStrong(&self->_scanPDFHandler, 0);
  objc_storeStrong(&self->_importHandler, 0);
}

@end