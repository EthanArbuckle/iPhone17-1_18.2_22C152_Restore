@interface WKPDFView
+ (BOOL)platformSupportsPDFView;
+ (BOOL)web_requiresCustomSnapshotting;
- (BOOL)_computeFocusedSearchResultIndexWithOptions:(unint64_t)a3 didWrapAround:(BOOL *)a4;
- (BOOL)_wk_printFormatterRequiresMainThread;
- (BOOL)actionSheetAssistant:(id)a3 shouldIncludeAppLinkActionsForElement:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)supportsTextReplacement;
- (BOOL)web_handleKeyEvent:(id)a3;
- (CGPDFDocument)_ensureDocumentForPrinting;
- (CGPoint)_offsetForPageNumberIndicator;
- (NSData)web_dataRepresentation;
- (NSString)web_suggestedFilename;
- (RetainPtr<NSArray>)actionSheetAssistant:(id)a3 decideActionsForElement:(id)a4 defaultActions:(RetainPtr<NSArray>)a5;
- (UITextRange)selectedTextRange;
- (id).cxx_construct;
- (id)_URLWithPageIndex:(int64_t)a3;
- (id)_contentView;
- (id)dataDetectionContextForActionSheetAssistant:(id)a3 positionInformation:(const void *)a4;
- (id)web_initWithFrame:(CGRect)a3 webView:(id)a4 mimeType:(id)a5;
- (int64_t)compareFoundRange:(id)a3 toRange:(id)a4 inDocument:(id)a5;
- (optional<WebKit::InteractionInformationAtPosition>)positionInformationForActionSheetAssistant:(optional<WebKit::InteractionInformationAtPosition> *__return_ptr)retstr;
- (uint64_t)pdfHostViewControllerExtensionProcessDidCrash:(id *)a1;
- (uint64_t)pdfHostViewControllerExtensionProcessDidCrash:(uint64_t)a1;
- (unint64_t)_wk_pageCountForPrintFormatter:(id)a3;
- (void)_findString:(id)a3 withOptions:(unint64_t)a4 maxCount:(unint64_t)a5 completion:(id)a6;
- (void)_focusOnSearchResultWithOptions:(unint64_t)a3;
- (void)_goToURL:(id)a3 atLocation:(CGPoint)a4;
- (void)_movePageNumberIndicatorToPoint:(CGPoint)a3 animated:(BOOL)a4;
- (void)_resetFind;
- (void)_scrollToURLFragment:(id)a3;
- (void)_showActionSheetForURL:(id)a3 atLocation:(CGPoint)a4 withAnnotationRect:(CGRect)a5;
- (void)_updateLayoutAnimated:(BOOL)a3;
- (void)_wk_requestDocumentForPrintFormatter:(id)a3;
- (void)actionSheetAssistant:(id)a3 openElementAtLocation:(CGPoint)a4;
- (void)actionSheetAssistant:(id)a3 performAction:(unsigned __int8)a4;
- (void)actionSheetAssistant:(id)a3 shareElementWithURL:(id)a4 rect:(CGRect)a5;
- (void)clearAllDecoratedFoundText;
- (void)dealloc;
- (void)decorateFoundTextRange:(id)a3 inDocument:(id)a4 usingStyle:(int64_t)a5;
- (void)pdfHostViewController:(id)a3 didLongPressPageIndex:(int64_t)a4 atLocation:(CGPoint)a5 withAnnotationRect:(CGRect)a6;
- (void)pdfHostViewController:(id)a3 didLongPressURL:(id)a4 atLocation:(CGPoint)a5 withAnnotationRect:(CGRect)a6;
- (void)pdfHostViewController:(id)a3 documentDidUnlockWithPassword:(id)a4;
- (void)pdfHostViewController:(id)a3 findStringUpdate:(unint64_t)a4 done:(BOOL)a5;
- (void)pdfHostViewController:(id)a3 goToPageIndex:(int64_t)a4 withViewFrustum:(CGRect)a5;
- (void)pdfHostViewController:(id)a3 goToURL:(id)a4;
- (void)pdfHostViewController:(id)a3 updatePageCount:(int64_t)a4;
- (void)pdfHostViewControllerDocumentDidRequestPassword:(id)a3;
- (void)pdfHostViewControllerExtensionProcessDidCrash:(id)a3;
- (void)pdfHostViewControllerExtensionProcessDidCrash:(uint64_t)a1;
- (void)performTextSearchWithQueryString:(id)a3 usingOptions:(id)a4 resultAggregator:(id)a5;
- (void)shareSheetDidDismiss:(id)a3;
- (void)updateBackgroundColor;
- (void)web_beginAnimatedResizeWithUpdates:(id)a3;
- (void)web_computedContentInsetDidChange;
- (void)web_countStringMatches:(id)a3 options:(unint64_t)a4 maxCount:(unint64_t)a5;
- (void)web_didSameDocumentNavigation:(unsigned int)a3;
- (void)web_findString:(id)a3 options:(unint64_t)a4 maxCount:(unint64_t)a5;
- (void)web_scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5;
- (void)web_scrollViewDidScroll:(id)a3;
- (void)web_scrollViewDidZoom:(id)a3;
- (void)web_scrollViewWillBeginZooming:(id)a3 withView:(id)a4;
- (void)web_setContentProviderData:(id)a3 suggestedFilename:(id)a4;
- (void)web_setFixedOverlayView:(id)a3;
- (void)web_setMinimumSize:(CGSize)a3;
- (void)web_setOverlaidAccessoryViewsInset:(CGSize)a3;
- (void)web_snapshotRectInContentViewCoordinates:(CGRect)a3 snapshotWidth:(double)a4 completionHandler:(id)a5;
@end

@implementation WKPDFView

+ (BOOL)platformSupportsPDFView
{
  return 1;
}

- (void)dealloc
{
  m_ptr = self->_shareSheet.m_ptr;
  if (m_ptr)
  {
    [m_ptr dismissIfNeededWithReason:2];
    v4 = self->_shareSheet.m_ptr;
    self->_shareSheet.m_ptr = 0;
    if (v4) {
      CFRelease(v4);
    }
  }
  [self->_actionSheetAssistant.m_ptr cleanupSheet];
  objc_msgSend((id)objc_msgSend(self->_hostViewController.m_ptr, "view"), "removeFromSuperview");
  [self->_pageNumberIndicator.m_ptr removeFromSuperview];
  [self->_keyboardScrollingAnimator.m_ptr invalidate];
  v5 = (void *)WTF::CString::mutableData((WTF::CString *)&self->_passwordForPrinting);
  v6 = self->_passwordForPrinting.m_buffer.m_ptr;
  if (v6) {
    size_t v7 = *((void *)v6 + 1);
  }
  else {
    size_t v7 = 0;
  }
  bzero(v5, v7);
  v8 = self->_searchAggregator.m_ptr;
  self->_searchAggregator.m_ptr = 0;
  if (v8) {
    CFRelease(v8);
  }
  v9 = self->_searchString.m_ptr;
  self->_searchString.m_ptr = 0;
  if (v9) {
    CFRelease(v9);
  }
  v10.receiver = self;
  v10.super_class = (Class)WKPDFView;
  [(WKPDFView *)&v10 dealloc];
}

- (BOOL)web_handleKeyEvent:(id)a3
{
  v4 = [[WKWebEvent alloc] initWithEvent:a3];
  char v5 = [self->_keyboardScrollingAnimator.m_ptr beginWithEvent:v4];
  if ((v5 & 1) == 0) {
    [self->_keyboardScrollingAnimator.m_ptr handleKeyEvent:v4];
  }
  if (v4) {
    CFRelease(v4);
  }
  return v5;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return [self->_hostViewController.m_ptr gestureRecognizerShouldBegin:a3];
}

- (id)_contentView
{
  if (*((void *)self + 64)) {
    return (id)[*((id *)self + 64) view];
  }
  return self;
}

- (id)web_initWithFrame:(CGRect)a3 webView:(id)a4 mimeType:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)WKPDFView;
  v6 = -[WKApplicationStateTrackingView initWithFrame:webView:](&v10, sel_initWithFrame_webView_, a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v6)
  {
    size_t v7 = -[WKKeyboardScrollViewAnimator initWithScrollView:]([WKKeyboardScrollViewAnimator alloc], "initWithScrollView:", [a4 _scrollViewInternal]);
    m_ptr = v6->_keyboardScrollingAnimator.m_ptr;
    v6->_keyboardScrollingAnimator.m_ptr = v7;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    objc_storeWeak(&v6->_webView.m_weakReference, a4);
    [(WKPDFView *)v6 updateBackgroundColor];
  }
  return v6;
}

- (void)updateBackgroundColor
{
  uint64_t v3 = [MEMORY[0x1E4F38DA8] backgroundColor];
  [(WKPDFView *)self setBackgroundColor:v3];
  v4 = (void *)[objc_loadWeak(&self->_webView.m_weakReference) _wkScrollView];

  [v4 _setBackgroundColorInternal:v3];
}

- (void)web_setContentProviderData:(id)a3 suggestedFilename:(id)a4
{
  v6 = (void *)[a3 copy];
  m_ptr = self->_data.m_ptr;
  self->_data.m_ptr = v6;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  v8 = (void *)[a4 copy];
  v9 = self->_suggestedFilename.m_ptr;
  self->_suggestedFilename.m_ptr = v8;
  if (v9) {
    CFRelease(v9);
  }
  [MEMORY[0x1E4F38DA8] setUseIOSurfaceForTiles:0];
  objc_super v10 = (void *)MEMORY[0x1E4F38DA8];
  id v11 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3321888768;
  v12[2] = __58__WKPDFView_web_setContentProviderData_suggestedFilename___block_invoke;
  v12[3] = &__block_descriptor_48_e8_32c71_ZTSKZ58__WKPDFView_web_setContentProviderData_suggestedFilename__E3__6_e31_v16__0__PDFHostViewController_8l;
  objc_initWeak(&v11, self);
  v12[4] = self;
  id v13 = 0;
  objc_copyWeak(&v13, &v11);
  [v10 createHostView:v12 forExtensionIdentifier:0];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
}

id __58__WKPDFView_web_setContentProviderData_suggestedFilename___block_invoke(uint64_t a1, void *a2)
{
  id result = objc_loadWeak((id *)(a1 + 40));
  if (result)
  {
    id result = objc_loadWeak((id *)(*(void *)(a1 + 32) + 1208));
    if (a2)
    {
      char v5 = result;
      if (result)
      {
        uint64_t v6 = *(void *)(a1 + 32);
        CFRetain(a2);
        size_t v7 = *(const void **)(v6 + 512);
        *(void *)(v6 + 512) = a2;
        if (v7) {
          CFRelease(v7);
        }
        v8 = (void *)[a2 view];
        [v5 bounds];
        objc_msgSend(v8, "setFrame:");
        v9 = (void *)[v5 scrollView];
        [*(id *)(a1 + 32) removeFromSuperview];
        [v9 addSubview:v8];
        objc_super v10 = [[WKActionSheetAssistant alloc] initWithView:v8];
        uint64_t v11 = *(void *)(a1 + 32);
        v12 = *(const void **)(v11 + 424);
        *(void *)(v11 + 424) = v10;
        if (v12)
        {
          CFRelease(v12);
          objc_super v10 = *(WKActionSheetAssistant **)(*(void *)(a1 + 32) + 424);
        }
        -[WKActionSheetAssistant setDelegate:](v10, "setDelegate:");
        id v13 = (const void *)[a2 pageNumberIndicator];
        v14 = v13;
        uint64_t v15 = *(void *)(a1 + 32);
        if (v13) {
          CFRetain(v13);
        }
        v16 = *(const void **)(v15 + 536);
        *(void *)(v15 + 536) = v14;
        if (v16) {
          CFRelease(v16);
        }
        [*(id *)(*(void *)(a1 + 32) + 480) addSubview:*(void *)(*(void *)(a1 + 32) + 536)];
        [a2 setDelegate:*(void *)(a1 + 32)];
        uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 432);
        return (id)[a2 setDocumentData:v17 withScrollView:v9];
      }
    }
  }
  return result;
}

- (CGPoint)_offsetForPageNumberIndicator
{
  id Weak = objc_loadWeak(&self->_webView.m_weakReference);
  if (Weak)
  {
    v4 = Weak;
    [Weak _computedUnobscuredSafeAreaInset];
    [v4 _computedObscuredInset];
    UIEdgeInsetsAdd();
    double v6 = v5;
    double v8 = v7;
    double v9 = v6 + self->_overlaidAccessoryViewsInset.height;
  }
  else
  {
    double v8 = *MEMORY[0x1E4F1DAD8];
    double v9 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  result.y = v9;
  result.x = v8;
  return result;
}

- (void)_movePageNumberIndicatorToPoint:(CGPoint)a3 animated:(BOOL)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__WKPDFView__movePageNumberIndicatorToPoint_animated___block_invoke;
  v6[3] = &unk_1E58135F8;
  CGPoint v8 = a3;
  double v7 = self;
  if (a4)
  {
    [MEMORY[0x1E4F42FF0] animateWithDuration:v6 animations:0.3];
  }
  else
  {
    CGFloat v4 = a3.x + 20.0;
    CGFloat v5 = a3.y + 20.0;
    [self->_pageNumberIndicator.m_ptr frame];
    objc_msgSend(v7->_pageNumberIndicator.m_ptr, "setFrame:", v4, v5);
  }
}

uint64_t __54__WKPDFView__movePageNumberIndicatorToPoint_animated___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40) + 20.0;
  double v3 = *(double *)(a1 + 48) + 20.0;
  [*(id *)(*(void *)(a1 + 32) + 536) frame];
  CGFloat v4 = *(void **)(*(void *)(a1 + 32) + 536);

  return objc_msgSend(v4, "setFrame:", v2, v3);
}

- (void)_updateLayoutAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [self->_hostViewController.m_ptr updatePDFViewLayout];
  [(WKPDFView *)self _offsetForPageNumberIndicator];

  -[WKPDFView _movePageNumberIndicatorToPoint:animated:](self, "_movePageNumberIndicatorToPoint:animated:", v3);
}

- (void)web_setMinimumSize:(CGSize)a3
{
  [(WKPDFView *)self frame];
  -[WKPDFView setFrame:](self, "setFrame:");

  [(WKPDFView *)self _updateLayoutAnimated:0];
}

- (void)web_setOverlaidAccessoryViewsInset:(CGSize)a3
{
  self->_overlaidAccessoryViewsInset = a3;
  [(WKPDFView *)self _updateLayoutAnimated:1];
}

- (void)web_computedContentInsetDidChange
{
}

- (void)web_setFixedOverlayView:(id)a3
{
  if (a3) {
    CFRetain(a3);
  }
  m_ptr = self->_fixedOverlayView.m_ptr;
  self->_fixedOverlayView.m_ptr = a3;
  if (m_ptr)
  {
    CFRelease(m_ptr);
  }
}

- (void)_scrollToURLFragment:(id)a3
{
  if ([a3 hasPrefix:@"page"])
  {
    uint64_t v5 = objc_msgSend((id)objc_msgSend(a3, "substringFromIndex:", 4), "integerValue");
    uint64_t v6 = v5 - 1;
    if (v5 < 1) {
      return;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  if (v6 < [self->_hostViewController.m_ptr pageCount]
    && v6 != [self->_hostViewController.m_ptr currentPageIndex])
  {
    m_ptr = self->_hostViewController.m_ptr;
    [m_ptr goToPageIndex:v6];
  }
}

- (void)web_didSameDocumentNavigation:(unsigned int)a3
{
  if (a3 == 3)
  {
    uint64_t v5 = objc_msgSend((id)objc_msgSend(objc_loadWeak(&self->_webView.m_weakReference), "URL"), "fragment");
    [(WKPDFView *)self _scrollToURLFragment:v5];
  }
}

- (void)_resetFind
{
  if (self->_findCompletion.m_block) {
    [self->_hostViewController.m_ptr cancelFindString];
  }
  uint64_t v3 = _Block_copy(0);
  _Block_release(self->_findCompletion.m_block);
  self->_findCompletion.m_block = v3;
  _Block_release(0);
  m_ptr = self->_findString.m_ptr;
  self->_findString.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  self->_findStringCount = 0;
  self->_findStringMaxCount = 0;
  if (self->_focusedSearchResultIndex.__engaged_) {
    self->_focusedSearchResultIndex.__engaged_ = 0;
  }
  self->_focusedSearchResultPendingOffset = 0;
}

- (void)_findString:(id)a3 withOptions:(unint64_t)a4 maxCount:(unint64_t)a5 completion:(id)a6
{
  [(WKPDFView *)self _resetFind];
  uint64_t v11 = _Block_copy(a6);
  _Block_release(self->_findCompletion.m_block);
  self->_findCompletion.m_block = v11;
  _Block_release(0);
  v12 = (void *)[a3 copy];
  m_ptr = self->_findString.m_ptr;
  self->_findString.m_ptr = v12;
  if (m_ptr)
  {
    CFRelease(m_ptr);
    v12 = self->_findString.m_ptr;
  }
  self->_findStringMaxCount = a5;
  v14 = self->_hostViewController.m_ptr;

  [v14 findString:v12 withOptions:a4 & 1 | (4 * ((a4 >> 3) & 1))];
}

- (void)web_countStringMatches:(id)a3 options:(unint64_t)a4 maxCount:(unint64_t)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__WKPDFView_web_countStringMatches_options_maxCount___block_invoke;
  v5[3] = &unk_1E5812158;
  v5[4] = self;
  [(WKPDFView *)self _findString:a3 withOptions:a4 maxCount:a5 completion:v5];
}

_DWORD *__53__WKPDFView_web_countStringMatches_options_maxCount___block_invoke(uint64_t a1)
{
  CGPoint result = objc_loadWeak((id *)(*(void *)(a1 + 32) + 1208));
  if (result)
  {
    CGPoint result = (_DWORD *)[result _page];
    uint64_t v3 = v7;
    if (v7)
    {
      uint64_t v4 = *(void *)(v7 + 112);
      MEMORY[0x19972EAD0](&v6, *(void *)(*(void *)(a1 + 32) + 456));
      (*(void (**)(uint64_t, uint64_t, WTF::StringImpl **, void))(*(void *)v4 + 16))(v4, v3, &v6, *(unsigned int *)(*(void *)(a1 + 32) + 464));
      CGPoint result = v6;
      uint64_t v6 = 0;
      if (result)
      {
        if (*result == 2) {
          return (_DWORD *)WTF::StringImpl::destroy((WTF::StringImpl *)result, v5);
        }
        else {
          *result -= 2;
        }
      }
    }
  }
  return result;
}

- (BOOL)_computeFocusedSearchResultIndexWithOptions:(unint64_t)a3 didWrapAround:(BOOL *)a4
{
  if ((a3 & 8) != 0) {
    uint64_t v4 = -1;
  }
  else {
    uint64_t v4 = 1;
  }
  if (self->_findCompletion.m_block)
  {
    BOOL v5 = 0;
    self->_focusedSearchResultPendingOffset += v4;
    return v5;
  }
  unint64_t findStringCount = self->_findStringCount;
  if (!findStringCount) {
    return 0;
  }
  p_focusedSearchResultIndex = &self->_focusedSearchResultIndex;
  BOOL engaged = self->_focusedSearchResultIndex.__engaged_;
  if (self->_focusedSearchResultIndex.__engaged_)
  {
    int64_t v9 = p_focusedSearchResultIndex->var0.__val_ + v4;
    if (v9 < 0) {
      goto LABEL_12;
    }
LABEL_11:
    if (v9 < self->_findStringCount) {
      goto LABEL_21;
    }
    goto LABEL_12;
  }
  int64_t focusedSearchResultPendingOffset = self->_focusedSearchResultPendingOffset;
  self->_int64_t focusedSearchResultPendingOffset = 0;
  int64_t v9 = focusedSearchResultPendingOffset + ((findStringCount - 1) & ((uint64_t)(a3 << 60) >> 63));
  if ((v9 & 0x8000000000000000) == 0) {
    goto LABEL_11;
  }
LABEL_12:
  if ((a3 & 0x10) == 0) {
    return 0;
  }
  if (v9 >= 0) {
    unint64_t v11 = v9;
  }
  else {
    unint64_t v11 = -v9;
  }
  unint64_t v12 = self->_findStringCount;
  unint64_t v13 = v11 % v12;
  int64_t v14 = v12 - v13;
  if (v9 >= 0) {
    int64_t v9 = v13;
  }
  else {
    int64_t v9 = v14;
  }
  *a4 = 1;
  BOOL engaged = self->_focusedSearchResultIndex.__engaged_;
LABEL_21:
  if (!engaged) {
    self->_focusedSearchResultIndex.__engaged_ = 1;
  }
  p_focusedSearchResultIndex->var0.__val_ = v9;
  return 1;
}

- (void)_focusOnSearchResultWithOptions:(unint64_t)a3
{
  id Weak = objc_loadWeak(&self->_webView.m_weakReference);
  if (!Weak) {
    return;
  }
  [Weak _page];
  if (!v19) {
    return;
  }
  unsigned __int8 v18 = 0;
  if (![(WKPDFView *)self _computeFocusedSearchResultIndexWithOptions:a3 didWrapAround:&v18])
  {
    if (self->_findCompletion.m_block) {
      return;
    }
    uint64_t v13 = v19;
    uint64_t v14 = *(void *)(v19 + 112);
    MEMORY[0x19972EAD0](&v15, self->_findString.m_ptr);
    (*(void (**)(uint64_t, uint64_t, WTF::StringImpl **))(*(void *)v14 + 32))(v14, v13, &v15);
    unint64_t v12 = v15;
    uint64_t v15 = 0;
    if (!v12) {
      return;
    }
LABEL_11:
    if (*(_DWORD *)v12 == 2) {
      WTF::StringImpl::destroy(v12, v10);
    }
    else {
      *(_DWORD *)v12 -= 2;
    }
    return;
  }
  if (!self->_focusedSearchResultIndex.__engaged_)
  {
    __break(1u);
    return;
  }
  unint64_t val = self->_focusedSearchResultIndex.var0.__val_;
  [self->_hostViewController.m_ptr focusOnSearchResultAtIndex:val];
  uint64_t v7 = v19;
  uint64_t v8 = *(void *)(v19 + 112);
  MEMORY[0x19972EAD0](&v17, self->_findString.m_ptr);
  uint64_t findStringCount_low = LODWORD(self->_findStringCount);
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  (*(void (**)(uint64_t, uint64_t, WTF::StringImpl **, WTF::StringImpl **, uint64_t, unint64_t, void))(*(void *)v8 + 24))(v8, v7, &v17, &v15, findStringCount_low, val, v18);
  unint64_t v11 = v15;
  if (v15)
  {
    uint64_t v15 = 0;
    LODWORD(v16) = 0;
    WTF::fastFree(v11, v10);
  }
  unint64_t v12 = v17;
  uint64_t v17 = 0;
  if (v12) {
    goto LABEL_11;
  }
}

- (void)web_findString:(id)a3 options:(unint64_t)a4 maxCount:(unint64_t)a5
{
  if (objc_msgSend(self->_findString.m_ptr, "isEqualToString:"))
  {
    [(WKPDFView *)self _focusOnSearchResultWithOptions:a4];
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __45__WKPDFView_web_findString_options_maxCount___block_invoke;
    v9[3] = &unk_1E5813620;
    v9[4] = self;
    v9[5] = a4;
    [(WKPDFView *)self _findString:a3 withOptions:a4 maxCount:a5 completion:v9];
  }
}

uint64_t __45__WKPDFView_web_findString_options_maxCount___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _focusOnSearchResultWithOptions:*(void *)(a1 + 40)];
}

+ (BOOL)web_requiresCustomSnapshotting
{
  if (byte_1EB359BCA == 1)
  {
    int HasEntitlement = byte_1EB359BC9;
  }
  else
  {
    int HasEntitlement = WTF::processHasEntitlement();
    byte_1EB359BC9 = HasEntitlement;
    byte_1EB359BCA = 1;
  }
  return HasEntitlement == 0;
}

- (void)web_scrollViewDidScroll:(id)a3
{
}

- (void)web_scrollViewWillBeginZooming:(id)a3 withView:(id)a4
{
}

- (void)web_scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5
{
}

- (void)web_scrollViewDidZoom:(id)a3
{
}

- (void)web_beginAnimatedResizeWithUpdates:(id)a3
{
  [self->_hostViewController.m_ptr beginPDFViewRotation];
  (*((void (**)(id))a3 + 2))(a3);
  m_ptr = self->_hostViewController.m_ptr;

  [m_ptr endPDFViewRotation];
}

- (void)web_snapshotRectInContentViewCoordinates:(CGRect)a3 snapshotWidth:(double)a4 completionHandler:(id)a5
{
  objc_msgSend(-[WKPDFView _contentView](self, "_contentView"), "convertRect:toView:", objc_msgSend(self->_hostViewController.m_ptr, "view"), a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  m_ptr = self->_hostViewController.m_ptr;
  uint64_t v17 = [NSNumber numberWithDouble:a4];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __86__WKPDFView_web_snapshotRectInContentViewCoordinates_snapshotWidth_completionHandler___block_invoke;
  v18[3] = &unk_1E5813648;
  v18[4] = a5;
  objc_msgSend(m_ptr, "snapshotViewRect:snapshotWidth:afterScreenUpdates:withResult:", v17, 0, v18, v9, v11, v13, v15);
}

uint64_t __86__WKPDFView_web_snapshotRectInContentViewCoordinates_snapshotWidth_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 CGImage];
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);

  return v4(v2, v3);
}

- (NSData)web_dataRepresentation
{
  return (NSData *)self->_data.m_ptr;
}

- (NSString)web_suggestedFilename
{
  return (NSString *)self->_suggestedFilename.m_ptr;
}

- (void)pdfHostViewController:(id)a3 updatePageCount:(int64_t)a4
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend(objc_loadWeak(&self->_webView.m_weakReference), "URL"), "fragment");

  [(WKPDFView *)self _scrollToURLFragment:v5];
}

- (void)pdfHostViewControllerDocumentDidRequestPassword:(id)a3
{
  [objc_loadWeak(&self->_webView.m_weakReference) _didRequestPasswordForDocument];
  self->_isShowingPasswordView = 1;

  [(WKPDFView *)self updateBackgroundColor];
}

- (void)pdfHostViewController:(id)a3 documentDidUnlockWithPassword:(id)a4
{
  WTF::CString::CString((WTF::CString *)&v10, (const char *)objc_msgSend(a4, "UTF8String", a3));
  uint64_t v6 = (CStringBuffer *)v10;
  double v10 = 0;
  m_ptr = (WTF *)self->_passwordForPrinting.m_buffer.m_ptr;
  self->_passwordForPrinting.m_buffer.m_ptr = v6;
  if (m_ptr)
  {
    int v8 = *(_DWORD *)m_ptr - 1;
    if (*(_DWORD *)m_ptr != 1)
    {
LABEL_5:
      *(_DWORD *)m_ptr = v8;
      goto LABEL_6;
    }
    WTF::fastFree(m_ptr, v5);
    m_ptr = v10;
    double v10 = 0;
    if (m_ptr)
    {
      int v8 = *(_DWORD *)m_ptr - 1;
      if (*(_DWORD *)m_ptr == 1)
      {
        WTF::fastFree(m_ptr, v9);
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
LABEL_6:
  [objc_loadWeak(&self->_webView.m_weakReference) _didStopRequestingPasswordForDocument];
  self->_isShowingPasswordView = 0;
  [(WKPDFView *)self updateBackgroundColor];
}

- (void)pdfHostViewController:(id)a3 findStringUpdate:(unint64_t)a4 done:(BOOL)a5
{
  m_ptr = self->_searchAggregator.m_ptr;
  if (m_ptr)
  {
    if (a5)
    {
      if (a4)
      {
        for (uint64_t i = 0; i != a4; ++i)
          objc_msgSend(self->_searchAggregator.m_ptr, "foundRange:forSearchString:inDocument:", +[WKPDFFoundTextRange foundTextRangeWithIndex:](WKPDFFoundTextRange, "foundTextRangeWithIndex:", i), self->_searchString.m_ptr, 0);
        m_ptr = self->_searchAggregator.m_ptr;
      }
      objc_msgSend(m_ptr, "finishedSearching", a3);
      double v9 = self->_searchAggregator.m_ptr;
      self->_searchAggregator.m_ptr = 0;
      if (v9) {
        CFRelease(v9);
      }
      double v10 = self->_searchString.m_ptr;
      self->_searchString.m_ptr = 0;
      if (v10)
      {
        CFRelease(v10);
      }
    }
  }
  else
  {
    if (self->_findStringMaxCount >= a4 || a5)
    {
      if (!a5) {
        return;
      }
    }
    else
    {
      [a3 cancelFindStringWithHighlightsCleared:0];
    }
    m_block = (void (**)(void))self->_findCompletion.m_block;
    self->_findCompletion.m_block = 0;
    double v12 = _Block_copy(0);
    _Block_release(self->_findCompletion.m_block);
    self->_findCompletion.m_block = v12;
    _Block_release(0);
    if (m_block)
    {
      self->_unint64_t findStringCount = a4;
      m_block[2](m_block);
    }
    _Block_release(m_block);
  }
}

- (id)_URLWithPageIndex:(int64_t)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"#page%ld", a3 + 1);
  uint64_t v6 = [objc_loadWeak(&self->_webView.m_weakReference) URL];

  return (id)[v4 URLWithString:v5 relativeToURL:v6];
}

- (void)_goToURL:(id)a3 atLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  CGPoint v30 = a4;
  id Weak = objc_loadWeak(&self->_webView.m_weakReference);
  if (Weak)
  {
    [Weak _page];
    if (v29)
    {
      double v9 = (void *)[self->_hostViewController.m_ptr view];
      double v10 = (void *)[v9 window];
      objc_msgSend(v9, "convertPoint:toView:", 0, x, y);
      objc_msgSend(v10, "convertPoint:toWindow:", 0);
      v28.double x = v11;
      v28.double y = v12;
      uint64_t v13 = v29;
      MEMORY[0x19972EAD0](&v27, [a3 absoluteString]);
      WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v26, &v30);
      float v14 = roundf(v26[0]);
      uint64_t v15 = 0x80000000;
      if (v14 > -2147500000.0) {
        uint64_t v15 = (int)v14;
      }
      if (v14 < 2147500000.0) {
        uint64_t v16 = v15;
      }
      else {
        uint64_t v16 = 0x7FFFFFFFLL;
      }
      float v17 = roundf(v26[1]);
      if (v17 >= 2147500000.0)
      {
        unint64_t v18 = 0x7FFFFFFF00000000;
      }
      else if (v17 <= -2147500000.0)
      {
        unint64_t v18 = 0x8000000000000000;
      }
      else
      {
        unint64_t v18 = (unint64_t)(int)v17 << 32;
      }
      WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v25, &v28);
      float v19 = roundf(v25[0]);
      if (v19 >= 2147500000.0)
      {
        uint64_t v20 = 0x7FFFFFFFLL;
      }
      else
      {
        uint64_t v20 = 0x80000000;
        if (v19 > -2147500000.0) {
          uint64_t v20 = (int)v19;
        }
      }
      float v21 = roundf(v25[1]);
      if (v21 >= 2147500000.0)
      {
        unint64_t v22 = 0x7FFFFFFF00000000;
      }
      else if (v21 <= -2147500000.0)
      {
        unint64_t v22 = 0x8000000000000000;
      }
      else
      {
        unint64_t v22 = (unint64_t)(int)v21 << 32;
      }
      WebKit::WebPageProxy::navigateToPDFLinkWithSimulatedClick(v13, &v27, v18 | v16, v22 | v20);
      v24 = v27;
      v27 = 0;
      if (v24)
      {
        if (*(_DWORD *)v24 == 2) {
          WTF::StringImpl::destroy(v24, v23);
        }
        else {
          *(_DWORD *)v24 -= 2;
        }
      }
    }
  }
}

- (void)pdfHostViewController:(id)a3 goToURL:(id)a4
{
}

- (void)pdfHostViewController:(id)a3 goToPageIndex:(int64_t)a4 withViewFrustum:(CGRect)a5
{
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v8 = -[WKPDFView _URLWithPageIndex:](self, "_URLWithPageIndex:", a4, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);

  -[WKPDFView _goToURL:atLocation:](self, "_goToURL:atLocation:", v8, x, y);
}

- (void)_showActionSheetForURL:(id)a3 atLocation:(CGPoint)a4 withAnnotationRect:(CGRect)a5
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  CGPoint v21 = a4;
  CGRect v20 = a5;
  if (objc_loadWeak(&self->_webView.m_weakReference))
  {
    memset(v22, 0, sizeof(v22));
    int v23 = 1;
    char v24 = 1;
    int v25 = 0;
    __int16 v26 = 0;
    char v27 = 1;
    v31[2] = 0;
    uint64_t v28 = 0;
    char v29 = 0;
    uint64_t v30 = 0;
    v31[0] = 0;
    *(void *)((char *)v31 + 6) = 0;
    WTF::URL::URL((WTF::URL *)v32);
    WTF::URL::URL((WTF::URL *)v33);
    char v39 = 0;
    char v40 = 0;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    *(_OWORD *)&v33[40] = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    int v38 = 0;
    int v45 = 1065353216;
    __int16 v49 = 0;
    long long v46 = 0u;
    long long v47 = 0u;
    char v48 = 0;
    char v52 = 0;
    char v53 = 0;
    char v54 = 0;
    char v55 = 0;
    long long v56 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v19, &v20);
    *((void *)&v34 + 1) = WebCore::roundedIntRect((WebCore *)v19, v7);
    *(void *)&long long v35 = v8;
    WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v19, &v21);
    float v9 = roundf(*(float *)v19);
    if (v9 >= 2147500000.0)
    {
      uint64_t v10 = 0x7FFFFFFFLL;
    }
    else if (v9 <= -2147500000.0)
    {
      uint64_t v10 = 0x80000000;
    }
    else
    {
      uint64_t v10 = (int)v9;
    }
    float v11 = roundf(*((float *)v19 + 1));
    if (v11 >= 2147500000.0)
    {
      unint64_t v12 = 0x7FFFFFFF00000000;
    }
    else if (v11 <= -2147500000.0)
    {
      unint64_t v12 = 0x8000000000000000;
    }
    else
    {
      unint64_t v12 = (unint64_t)(int)v11 << 32;
    }
    *(void *)unint64_t v22 = v12 | v10;
    MEMORY[0x19972E8A0](v19, a3);
    WTF::URL::operator=((uint64_t)v32, (uint64_t)v19);
    float v14 = v19[0];
    v19[0] = 0;
    if (v14)
    {
      if (*(_DWORD *)v14 == 2) {
        WTF::StringImpl::destroy(v14, v13);
      }
      else {
        *(_DWORD *)v14 -= 2;
      }
    }
    WebKit::InteractionInformationAtPosition::operator=((uint64_t)&self->_positionInformation, (uint64_t)v22);
    int canBePresentedByDataDetectors = WebCore::DataDetection::canBePresentedByDataDetectors((WebCore::DataDetection *)&self->_positionInformation.url, v15);
    m_ptr = self->_actionSheetAssistant.m_ptr;
    if (canBePresentedByDataDetectors) {
      [m_ptr showDataDetectorsUIForPositionInformation:v22];
    }
    else {
      [m_ptr showLinkSheet];
    }
    WebKit::InteractionInformationAtPosition::~InteractionInformationAtPosition((WebKit::InteractionInformationAtPosition *)v22, v18);
  }
}

- (void)pdfHostViewController:(id)a3 didLongPressURL:(id)a4 atLocation:(CGPoint)a5 withAnnotationRect:(CGRect)a6
{
}

- (void)pdfHostViewController:(id)a3 didLongPressPageIndex:(int64_t)a4 atLocation:(CGPoint)a5 withAnnotationRect:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  double v10 = a5.y;
  double v11 = a5.x;
  id v13 = [(WKPDFView *)self _URLWithPageIndex:a4];

  -[WKPDFView _showActionSheetForURL:atLocation:withAnnotationRect:](self, "_showActionSheetForURL:atLocation:withAnnotationRect:", v13, v11, v10, x, y, width, height);
}

- (void)pdfHostViewControllerExtensionProcessDidCrash:(id)a3
{
  WTF::RunLoop::main((WTF::RunLoop *)self);
  id v6 = 0;
  objc_copyWeak(&v6, &self->_webView.m_weakReference);
  uint64_t v4 = WTF::fastMalloc((WTF *)0x10);
  *(void *)uint64_t v4 = &unk_1EE9D4360;
  *(void *)(v4 + 8) = 0;
  objc_moveWeak((id *)(v4 + 8), &v6);
  uint64_t v7 = v4;
  WTF::RunLoop::dispatch();
  uint64_t v5 = v7;
  uint64_t v7 = 0;
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
  }
  objc_destroyWeak(&v6);
}

- (optional<WebKit::InteractionInformationAtPosition>)positionInformationForActionSheetAssistant:(optional<WebKit::InteractionInformationAtPosition> *__return_ptr)retstr
{
  CGPoint result = (optional<WebKit::InteractionInformationAtPosition> *)WebKit::InteractionInformationAtPosition::InteractionInformationAtPosition((WebKit::InteractionInformationAtPosition *)retstr, (const WebKit::InteractionInformationAtPosition *)(v1 + 560));
  *(&retstr[1].var0.__engaged_ + 144) = 1;
  return result;
}

- (void)actionSheetAssistant:(id)a3 performAction:(unsigned __int8)a4
{
  v11[2] = *MEMORY[0x1E4F143B8];
  if (!a4)
  {
    v10[0] = *MEMORY[0x1E4F22708];
    if (self->_positionInformation.url.m_string.m_impl.m_ptr) {
      uint64_t v5 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v5 = &stru_1EEA10550;
    }
    v11[0] = v5;
    v10[1] = *MEMORY[0x1E4F226F8];
    v11[1] = WTF::URL::operator NSURL *();
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
    uint64_t v7 = (void *)MEMORY[0x1E4F42C50];
    uint64_t v8 = objc_msgSend(objc_loadWeak(&self->_webView.m_weakReference), "_effectiveDataOwner:", -[WKPDFView _dataOwnerForCopy](self, "_dataOwnerForCopy"));
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __48__WKPDFView_actionSheetAssistant_performAction___block_invoke;
    v9[3] = &unk_1E5812158;
    v9[4] = v6;
    [v7 _performAsDataOwner:v8 block:v9];
  }
}

uint64_t __48__WKPDFView_actionSheetAssistant_performAction___block_invoke(uint64_t a1)
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = *(void *)(a1 + 32);
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42C50], "generalPasteboard"), "setItems:", v1);
}

- (void)actionSheetAssistant:(id)a3 openElementAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v7 = WTF::URL::operator NSURL *();

  -[WKPDFView _goToURL:atLocation:](self, "_goToURL:atLocation:", v7, x, y);
}

- (void)actionSheetAssistant:(id)a3 shareElementWithURL:(id)a4 rect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id Weak = objc_loadWeak(&self->_webView.m_weakReference);
  if (Weak)
  {
    id v12 = Weak;
    char v37 = 0;
    v38[0] = 0;
    v38[1] = 0;
    *(_OWORD *)long long v35 = 0u;
    memset(v36, 0, 25);
    MEMORY[0x19972E8A0](&v33, a4);
    char v34 = 1;
    std::__optional_storage_base<WTF::URL,false>::__assign_from[abi:sn180100]<std::__optional_move_assign_base<WTF::URL,false>>((WTF::StringImpl *)&v36[3], (unsigned __int8 *)&v33);
    if (v34)
    {
      CGFloat v14 = v33.origin.x;
      v33.origin.double x = 0.0;
      if (v14 != 0.0)
      {
        if (**(_DWORD **)&v14 == 2) {
          WTF::StringImpl::destroy(*(WTF::StringImpl **)&v14, v13);
        }
        else {
          **(_DWORD **)&v14 -= 2;
        }
      }
    }
    char v39 = 1;
    [self->_shareSheet.m_ptr dismissIfNeededWithReason:0];
    uint64_t v15 = [[WKShareSheet alloc] initWithView:v12];
    m_ptr = self->_shareSheet.m_ptr;
    self->_shareSheet.m_ptr = v15;
    if (m_ptr)
    {
      CFRelease(m_ptr);
      uint64_t v15 = (WKShareSheet *)self->_shareSheet.m_ptr;
    }
    [(WKShareSheet *)v15 setDelegate:self];
    float v17 = self->_shareSheet.m_ptr;
    objc_msgSend((id)objc_msgSend(self->_hostViewController.m_ptr, "view"), "convertRect:toView:", v12, x, y, width, height);
    v33.origin.double x = v18;
    v33.origin.double y = v19;
    v33.size.double width = v20;
    v33.size.double height = v21;
    WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v32, &v33);
    v32[16] = 1;
    unint64_t v22 = (void *)WTF::fastMalloc((WTF *)0x10);
    *unint64_t v22 = &unk_1EE9D4388;
    v31 = v22;
    [v17 presentWithParameters:v35 inRect:v32 completionHandler:&v31];
    char v24 = v31;
    v31 = 0;
    if (v24) {
      (*(void (**)(void *))(*v24 + 8))(v24);
    }
    WTF::Vector<WebCore::RawFile,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v38, v23);
    if (v37)
    {
      __int16 v26 = v36[3];
      v36[3] = 0;
      if (v26)
      {
        if (*(_DWORD *)v26 == 2) {
          WTF::StringImpl::destroy(v26, v25);
        }
        else {
          *(_DWORD *)v26 -= 2;
        }
      }
    }
    WTF::Vector<WTF::Ref<WebCore::File,WTF::RawPtrTraits<WebCore::File>,WTF::DefaultRefDerefTraits<WebCore::File>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v36[1], v25);
    uint64_t v28 = v36[0];
    v36[0] = 0;
    if (v28)
    {
      if (*(_DWORD *)v28 == 2) {
        WTF::StringImpl::destroy(v28, v27);
      }
      else {
        *(_DWORD *)v28 -= 2;
      }
    }
    char v29 = v35[1];
    v35[1] = 0;
    if (v29)
    {
      if (*(_DWORD *)v29 == 2) {
        WTF::StringImpl::destroy(v29, v27);
      }
      else {
        *(_DWORD *)v29 -= 2;
      }
    }
    uint64_t v30 = v35[0];
    v35[0] = 0;
    if (v30)
    {
      if (*(_DWORD *)v30 == 2) {
        WTF::StringImpl::destroy(v30, v27);
      }
      else {
        *(_DWORD *)v30 -= 2;
      }
    }
  }
}

- (void)shareSheetDidDismiss:(id)a3
{
  [self->_shareSheet.m_ptr setDelegate:0];
  m_ptr = self->_shareSheet.m_ptr;
  self->_shareSheet.m_ptr = 0;
  if (m_ptr)
  {
    CFRelease(m_ptr);
  }
}

- (BOOL)actionSheetAssistant:(id)a3 shouldIncludeAppLinkActionsForElement:(id)a4
{
  id Weak = objc_loadWeak(&self->_webView.m_weakReference);
  if (Weak)
  {
    [Weak _page];
    if (v7) {
      LOBYTE(Weak) = (*(uint64_t (**)(void, id))(**(void **)(v7 + 104) + 448))(*(void *)(v7 + 104), a4);
    }
    else {
      LOBYTE(Weak) = 0;
    }
  }
  return (char)Weak;
}

- (RetainPtr<NSArray>)actionSheetAssistant:(id)a3 decideActionsForElement:(id)a4 defaultActions:(RetainPtr<NSArray>)a5
{
  uint64_t v8 = v5;
  id Weak = objc_loadWeak(&self->_webView.m_weakReference);
  if (Weak && (id Weak = (void *)[Weak _page], v13))
  {
    uint64_t v10 = *(void *)(v13 + 104);
    double v11 = *(const void **)a5.m_ptr;
    *(void *)a5.m_ptr = 0;
    CFTypeRef cf = v11;
    (*(void (**)(uint64_t, id, CFTypeRef *))(*(void *)v10 + 456))(v10, a4, &cf);
    id Weak = (void *)cf;
    CFTypeRef cf = 0;
    if (Weak) {
      CFRelease(Weak);
    }
  }
  else
  {
    void *v8 = 0;
  }
  return (RetainPtr<NSArray>)Weak;
}

- (id)dataDetectionContextForActionSheetAssistant:(id)a3 positionInformation:(const void *)a4
{
  id Weak = objc_loadWeak(&self->_webView.m_weakReference);
  if (!Weak) {
    return 0;
  }
  id v5 = Weak;
  uint64_t v6 = (void *)[Weak UIDelegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }

  return (id)[v6 _dataDetectionContextForWebView:v5];
}

- (UITextRange)selectedTextRange
{
  return 0;
}

- (BOOL)supportsTextReplacement
{
  return 0;
}

- (int64_t)compareFoundRange:(id)a3 toRange:(id)a4 inDocument:(id)a5
{
  uint64_t v6 = (void *)[a3 start];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  int64_t result = 0;
  if (isKindOfClass)
  {
    if (v6)
    {
      float v9 = (void *)[a4 start];
      objc_opt_class();
      char v10 = objc_opt_isKindOfClass();
      int64_t result = 0;
      if (v10)
      {
        if (v9)
        {
          unint64_t v11 = [v6 index];
          if (v11 >= [v9 index])
          {
            unint64_t v12 = [v6 index];
            return v12 > [v9 index];
          }
          else
          {
            return -1;
          }
        }
      }
    }
  }
  return result;
}

- (void)performTextSearchWithQueryString:(id)a3 usingOptions:(id)a4 resultAggregator:(id)a5
{
  [self->_hostViewController.m_ptr cancelFindString];
  if (a5) {
    CFRetain(a5);
  }
  m_ptr = self->_searchAggregator.m_ptr;
  self->_searchAggregator.m_ptr = a5;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  if (a3) {
    CFRetain(a3);
  }
  char v10 = self->_searchString.m_ptr;
  self->_searchString.m_ptr = a3;
  if (v10) {
    CFRelease(v10);
  }
  unint64_t v11 = self->_hostViewController.m_ptr;
  uint64_t v12 = [a4 stringCompareOptions];

  [v11 findString:a3 withOptions:v12];
}

- (void)decorateFoundTextRange:(id)a3 inDocument:(id)a4 usingStyle:(int64_t)a5
{
  if (a5 == 2)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (a3)
    {
      if (isKindOfClass)
      {
        m_ptr = self->_hostViewController.m_ptr;
        uint64_t v9 = [a3 index];
        [m_ptr focusOnSearchResultAtIndex:v9];
      }
    }
  }
}

- (void)clearAllDecoratedFoundText
{
  [self->_hostViewController.m_ptr cancelFindString];
  m_ptr = self->_searchAggregator.m_ptr;
  self->_searchAggregator.m_ptr = 0;
  if (m_ptr)
  {
    CFRelease(m_ptr);
  }
}

- (void).cxx_destruct
{
  m_ptr = self->_searchString.m_ptr;
  self->_searchString.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  uint64_t v4 = self->_searchAggregator.m_ptr;
  self->_searchAggregator.m_ptr = 0;
  if (v4) {
    CFRelease(v4);
  }
  id v5 = self->_shareSheet.m_ptr;
  self->_shareSheet.m_ptr = 0;
  if (v5) {
    CFRelease(v5);
  }
  uint64_t v6 = self->_keyboardScrollingAnimator.m_ptr;
  self->_keyboardScrollingAnimator.m_ptr = 0;
  if (v6) {
    CFRelease(v6);
  }
  objc_destroyWeak(&self->_webView.m_weakReference);
  uint64_t v8 = self->_suggestedFilename.m_ptr;
  self->_suggestedFilename.m_ptr = 0;
  if (v8) {
    CFRelease(v8);
  }
  WebKit::InteractionInformationAtPosition::~InteractionInformationAtPosition((WebKit::InteractionInformationAtPosition *)&self->_positionInformation, v7);
  char v10 = self->_passwordForPrinting.m_buffer.m_ptr;
  self->_passwordForPrinting.m_buffer.m_ptr = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 1) {
      WTF::fastFree((WTF *)v10, v9);
    }
    else {
      --*(_DWORD *)v10;
    }
  }
  unint64_t v11 = self->_pageNumberIndicator.m_ptr;
  self->_pageNumberIndicator.m_ptr = 0;
  if (v11) {
    CFRelease(v11);
  }
  uint64_t v12 = self->_hostViewController.m_ptr;
  self->_hostViewController.m_ptr = 0;
  if (v12) {
    CFRelease(v12);
  }
  uint64_t v13 = self->_fixedOverlayView.m_ptr;
  self->_fixedOverlayView.m_ptr = 0;
  if (v13) {
    CFRelease(v13);
  }
  CGFloat v14 = self->_findString.m_ptr;
  self->_findString.m_ptr = 0;
  if (v14) {
    CFRelease(v14);
  }
  _Block_release(self->_findCompletion.m_block);
  uint64_t v15 = self->_documentForPrinting.m_ptr;
  self->_documentForPrinting.m_ptr = 0;
  if (v15) {
    CFRelease(v15);
  }
  uint64_t v16 = self->_data.m_ptr;
  self->_data.m_ptr = 0;
  if (v16) {
    CFRelease(v16);
  }
  float v17 = self->_actionSheetAssistant.m_ptr;
  self->_actionSheetAssistant.m_ptr = 0;
  if (v17)
  {
    CFRelease(v17);
  }
}

- (id).cxx_construct
{
  self->_actionSheetAssistant.m_ptr = 0;
  self->_data.m_ptr = 0;
  self->_documentForPrinting.m_ptr = 0;
  self->_findCompletion.m_block = 0;
  self->_findString.m_ptr = 0;
  self->_fixedOverlayView.m_ptr = 0;
  self->_focusedSearchResultIndex.var0.__null_state_ = 0;
  self->_focusedSearchResultIndex.__engaged_ = 0;
  self->_hostViewController.m_ptr = 0;
  self->_pageNumberIndicator.m_ptr = 0;
  self->_passwordForPrinting.m_buffer.m_ptr = 0;
  p_positionInformation = &self->_positionInformation;
  *(int *)((char *)&self->_positionInformation.request.point.m_y + 3) = 0;
  self->_positionInformation.request.point = 0;
  *(_DWORD *)&self->_positionInformation.request.includeHasDoubleClickHandler = 1;
  self->_positionInformation.canBeValid = 1;
  *(_DWORD *)&self->_positionInformation.nodeAtPositionHasDoubleClickHandler.var0.__null_state_ = 0;
  *(_WORD *)&self->_positionInformation.prefersDraggingOverTextSelection = 0;
  self->_positionInformation.touchCalloutEnabled = 1;
  self->_positionInformation.adjustedPointForNodeRespondingToClickEvents = 0;
  *(void *)&self->_positionInformation.isLink = 0;
  self->_positionInformation.isContentEditable = 0;
  *(unint64_t *)((char *)&self->_positionInformation.containerScrollingNodeID.m_value.m_processIdentifier.m_identifier
                      + 6) = 0;
  self->_positionInformation.containerScrollingNodeID.m_value.m_object.m_identifier = 0;
  self->_positionInformation.containerScrollingNodeID.m_value.m_processIdentifier.m_identifier = 0;
  WTF::URL::URL((WTF::URL *)&self->_positionInformation.url);
  WTF::URL::URL((WTF::URL *)&p_positionInformation->imageURL);
  p_positionInformation->cursor.var0.__null_state_ = 0;
  p_positionInformation->cursor.__engaged_ = 0;
  p_positionInformation->linkIndicator.selectionRectInRootViewCoordinates = 0u;
  p_positionInformation->linkIndicator.textBoundingRectInRootViewCoordinates = 0u;
  p_positionInformation->linkIndicator.contentImageWithoutSelectionRectInRootViewCoordinates = 0u;
  p_positionInformation->linkIndicator.textRectsInBoundingRectCoordinates = 0u;
  *(_OWORD *)&p_positionInformation->imageMIMEType.m_impl.m_ptr = 0u;
  *(_OWORD *)&p_positionInformation->idAttribute.m_impl.m_ptr = 0u;
  *(_OWORD *)&p_positionInformation->bounds.m_size.m_double width = 0u;
  *(_OWORD *)&p_positionInformation->textBefore.m_impl.m_ptr = 0u;
  *(_OWORD *)&p_positionInformation->caretLength = 0u;
  p_positionInformation->lineCaretExtent.m_size.m_double height = 0.0;
  p_positionInformation->linkIndicator.contentImageScaleFactor = 1.0;
  p_positionInformation->linkIndicator.options.m_storage = 0;
  *(_OWORD *)&p_positionInformation->linkIndicator.contentImageWithHighlight.m_ptr = 0u;
  *(_OWORD *)&p_positionInformation->linkIndicator.contentImage.m_ptr = 0u;
  p_positionInformation->linkIndicator.presentationTransition = 0;
  *((unsigned char *)&p_positionInformation->elementContext.var0.var2 + 8) = 0;
  p_positionInformation[1].isContentEditable = 0;
  LOBYTE(p_positionInformation[1].containerScrollingNodeID.m_value.m_processIdentifier.m_identifier) = 0;
  LOBYTE(p_positionInformation[1].imageURL.m_userEnd) = 0;
  *(_OWORD *)&p_positionInformation[1].imageURL.m_pathEnd = 0u;
  *(_OWORD *)&p_positionInformation->dataDetectorIdentifier.m_impl.m_ptr = 0u;
  p_positionInformation->dataDetectorBounds = 0u;
  self->_suggestedFilename.m_ptr = 0;
  self->_webView.m_weakReference = 0;
  self->_keyboardScrollingAnimator.m_ptr = 0;
  self->_shareSheet.m_ptr = 0;
  self->_searchAggregator.m_ptr = 0;
  self->_searchString.m_ptr = 0;
  return self;
}

- (CGPDFDocument)_ensureDocumentForPrinting
{
  m_ptr = self->_documentForPrinting.m_ptr;
  if (!m_ptr)
  {
    uint64_t v4 = CGDataProviderCreateWithCFData((CFDataRef)self->_data.m_ptr);
    m_ptr = CGPDFDocumentCreateWithProvider(v4);
    if ((CGPDFDocumentIsUnlocked((CGPDFDocumentRef)m_ptr)
       || ((id v5 = self->_passwordForPrinting.m_buffer.m_ptr) != 0 ? (v6 = (char *)v5 + 16) : (v6 = 0),
           CGPDFDocumentUnlockWithPassword((CGPDFDocumentRef)m_ptr, v6)))
      && CGPDFDocumentAllowsPrinting((CGPDFDocumentRef)m_ptr))
    {
      uint64_t v7 = self->_documentForPrinting.m_ptr;
      self->_documentForPrinting.m_ptr = m_ptr;
      if (v7)
      {
        CFRelease(v7);
        m_ptr = self->_documentForPrinting.m_ptr;
      }
    }
    else if (m_ptr)
    {
      CFRelease(m_ptr);
      m_ptr = 0;
    }
    if (v4) {
      CFRelease(v4);
    }
  }
  return (CGPDFDocument *)m_ptr;
}

- (BOOL)_wk_printFormatterRequiresMainThread
{
  return 1;
}

- (unint64_t)_wk_pageCountForPrintFormatter:(id)a3
{
  unint64_t result = [(WKPDFView *)self _ensureDocumentForPrinting];
  if (result)
  {
    size_t NumberOfPages = CGPDFDocumentGetNumberOfPages((CGPDFDocumentRef)result);
    if ([a3 snapshotFirstPage]) {
      return NumberOfPages != 0;
    }
    else {
      return NumberOfPages;
    }
  }
  return result;
}

- (void)_wk_requestDocumentForPrintFormatter:(id)a3
{
  uint64_t v4 = [(WKPDFView *)self _ensureDocumentForPrinting];

  [a3 _setPrintedDocument:v4];
}

- (uint64_t)pdfHostViewControllerExtensionProcessDidCrash:(uint64_t)a1
{
  *(void *)a1 = &unk_1EE9D4360;
  objc_destroyWeak((id *)(a1 + 8));
  return a1;
}

- (uint64_t)pdfHostViewControllerExtensionProcessDidCrash:(id *)a1
{
  *a1 = &unk_1EE9D4360;
  objc_destroyWeak(a1 + 1);

  return WTF::fastFree((WTF *)a1, v2);
}

- (void)pdfHostViewControllerExtensionProcessDidCrash:(uint64_t)a1
{
  id Weak = objc_loadWeak((id *)(a1 + 8));
  if (Weak)
  {
    [Weak _page];
    if (v2) {
      WebKit::WebPageProxy::dispatchProcessDidTerminate(v2, 5);
    }
  }
}

@end