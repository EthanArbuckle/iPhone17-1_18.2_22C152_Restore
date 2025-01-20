@interface _WKWebViewPrintFormatter
- (BOOL)_shouldDrawUsingBitmap;
- (BOOL)requiresMainThread;
- (BOOL)snapshotFirstPage;
- (CGImage)_printPreviewImage;
- (CGPDFDocument)_printedDocument;
- (CGRect)rectForPageAtIndex:(int64_t)a3;
- (_WKFrameHandle)frameToPrint;
- (id).cxx_construct;
- (int64_t)_recalcPageCount;
- (void)_drawInRectUsingBitmap:(CGRect)a3 forPageAtIndex:(int64_t)a4;
- (void)_drawInRectUsingPDF:(CGRect)a3 forPageAtIndex:(int64_t)a4;
- (void)_invalidatePrintRenderingState;
- (void)_setNeedsRecalc;
- (void)_setPrintPreviewImage:(CGImage *)a3;
- (void)_setPrintedDocument:(CGPDFDocument *)a3;
- (void)_setSnapshotPaperRect:(CGRect)a3;
- (void)_waitForPrintedDocumentOrImage;
- (void)drawInRect:(CGRect)a3 forPageAtIndex:(int64_t)a4;
- (void)setFrameToPrint:(id)a3;
- (void)setSnapshotFirstPage:(BOOL)a3;
@end

@implementation _WKWebViewPrintFormatter

- (BOOL)requiresMainThread
{
  v2 = objc_msgSend(-[_WKWebViewPrintFormatter _webView](self, "_webView"), "_printProvider");

  return objc_msgSend(v2, "_wk_printFormatterRequiresMainThread");
}

- (_WKFrameHandle)frameToPrint
{
  return (_WKFrameHandle *)self->_frameToPrint.m_ptr;
}

- (void)setFrameToPrint:(id)a3
{
  if (a3) {
    CFRetain(a3);
  }
  m_ptr = self->_frameToPrint.m_ptr;
  self->_frameToPrint.m_ptr = a3;
  if (m_ptr)
  {
    CFRelease(m_ptr);
  }
}

- (BOOL)_shouldDrawUsingBitmap
{
  BOOL result = ![(_WKWebViewPrintFormatter *)self snapshotFirstPage]
        && (objc_msgSend(-[_WKWebViewPrintFormatter _webView](self, "_webView"), "_printProvider"),
            (objc_opt_respondsToSelector() & 1) != 0)
        && [(UIPrintPageRenderer *)[(UIPrintFormatter *)self printPageRenderer] requestedRenderingQuality] != 0;
  return result;
}

- (CGPDFDocument)_printedDocument
{
  if ([(_WKWebViewPrintFormatter *)self requiresMainThread]) {
    return (CGPDFDocument *)self->_printedDocument.m_ptr;
  }
  char v4 = 0;
  p_printLock = &self->_printLock;
  int v6 = 1;
  atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)&self->_printLock, (unsigned __int8 *)&v4, 1u, memory_order_acquire, memory_order_acquire);
  if (v4) {
    MEMORY[0x19972E8D0](&self->_printLock);
  }
  m_ptr = (CGPDFDocument *)self->_printedDocument.m_ptr;
  atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)p_printLock, (unsigned __int8 *)&v6, 0, memory_order_release, memory_order_relaxed);
  if (v6 != 1) {
    WTF::Lock::unlockSlow((WTF::Lock *)p_printLock);
  }
  return m_ptr;
}

- (void)_setPrintedDocument:(CGPDFDocument *)a3
{
  if ([(_WKWebViewPrintFormatter *)self requiresMainThread])
  {
    if (a3) {
      CFRetain(a3);
    }
    m_ptr = self->_printedDocument.m_ptr;
    self->_printedDocument.m_ptr = a3;
    if (m_ptr)
    {
      CFRelease(m_ptr);
    }
  }
  else
  {
    char v6 = 0;
    atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)&self->_printLock, (unsigned __int8 *)&v6, 1u, memory_order_acquire, memory_order_acquire);
    if (v6) {
      MEMORY[0x19972E8D0](&self->_printLock);
    }
    if (a3) {
      CFRetain(a3);
    }
    v7 = self->_printedDocument.m_ptr;
    self->_printedDocument.m_ptr = a3;
    if (v7) {
      CFRelease(v7);
    }
    WTF::Condition::notifyOne((WTF::Condition *)&self->_printCompletionCondition);
    int v8 = 1;
    atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)&self->_printLock, (unsigned __int8 *)&v8, 0, memory_order_release, memory_order_relaxed);
    if (v8 != 1)
    {
      WTF::Lock::unlockSlow((WTF::Lock *)&self->_printLock);
    }
  }
}

- (CGImage)_printPreviewImage
{
  if ([(_WKWebViewPrintFormatter *)self requiresMainThread]) {
    return (CGImage *)self->_printPreviewImage.m_ptr;
  }
  char v4 = 0;
  p_printLock = &self->_printLock;
  int v6 = 1;
  atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)&self->_printLock, (unsigned __int8 *)&v4, 1u, memory_order_acquire, memory_order_acquire);
  if (v4) {
    MEMORY[0x19972E8D0](&self->_printLock);
  }
  m_ptr = (CGImage *)self->_printPreviewImage.m_ptr;
  atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)p_printLock, (unsigned __int8 *)&v6, 0, memory_order_release, memory_order_relaxed);
  if (v6 != 1) {
    WTF::Lock::unlockSlow((WTF::Lock *)p_printLock);
  }
  return m_ptr;
}

- (void)_setPrintPreviewImage:(CGImage *)a3
{
  if ([(_WKWebViewPrintFormatter *)self requiresMainThread])
  {
    if (a3) {
      CFRetain(a3);
    }
    m_ptr = self->_printPreviewImage.m_ptr;
    self->_printPreviewImage.m_ptr = a3;
    if (m_ptr)
    {
      CFRelease(m_ptr);
    }
  }
  else
  {
    char v6 = 0;
    atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)&self->_printLock, (unsigned __int8 *)&v6, 1u, memory_order_acquire, memory_order_acquire);
    if (v6) {
      MEMORY[0x19972E8D0](&self->_printLock);
    }
    if (a3) {
      CFRetain(a3);
    }
    v7 = self->_printPreviewImage.m_ptr;
    self->_printPreviewImage.m_ptr = a3;
    if (v7) {
      CFRelease(v7);
    }
    WTF::Condition::notifyOne((WTF::Condition *)&self->_printCompletionCondition);
    int v8 = 1;
    atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)&self->_printLock, (unsigned __int8 *)&v8, 0, memory_order_release, memory_order_relaxed);
    if (v8 != 1)
    {
      WTF::Lock::unlockSlow((WTF::Lock *)&self->_printLock);
    }
  }
}

- (void)_waitForPrintedDocumentOrImage
{
  char v3 = 0;
  p_printLock = &self->_printLock;
  atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)&self->_printLock, (unsigned __int8 *)&v3, 1u, memory_order_acquire, memory_order_acquire);
  if (v3) {
    MEMORY[0x19972E8D0](&self->_printLock, a2);
  }
  uint64_t v6 = 0x7FF0000000000000;
  int v7 = 0;
  WTF::Condition::waitUntilUnchecked<WTF::Lock>((uint64_t)&self->_printCompletionCondition, (atomic_uchar *)p_printLock, (WTF::TimeWithDynamicClockType *)&v6);
  int v5 = 1;
  atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)p_printLock, (unsigned __int8 *)&v5, 0, memory_order_release, memory_order_relaxed);
  if (v5 != 1) {
    WTF::Lock::unlockSlow((WTF::Lock *)p_printLock);
  }
}

- (void)_setSnapshotPaperRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  BOOL suppressPageCountRecalc = self->_suppressPageCountRecalc;
  self->_BOOL suppressPageCountRecalc = 1;
  v9 = [(UIPrintFormatter *)self printPageRenderer];
  -[UIPrintPageRenderer setPaperRect:](v9, "setPaperRect:", x, y, width, height);
  -[UIPrintPageRenderer setPrintableRect:](v9, "setPrintableRect:", x, y, width, height);
  self->_BOOL suppressPageCountRecalc = suppressPageCountRecalc;
}

- (void)_invalidatePrintRenderingState
{
  [(_WKWebViewPrintFormatter *)self _setPrintPreviewImage:0];

  [(_WKWebViewPrintFormatter *)self _setPrintedDocument:0];
}

- (int64_t)_recalcPageCount
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [(_WKWebViewPrintFormatter *)self _invalidatePrintRenderingState];
  unint64_t v3 = objc_msgSend((id)objc_msgSend(-[_WKWebViewPrintFormatter _webView](self, "_webView"), "_printProvider"), "_wk_pageCountForPrintFormatter:", self);
  char v4 = qword_1EB3582D0;
  if (os_log_type_enabled((os_log_t)qword_1EB3582D0, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    unint64_t v7 = v3;
    _os_log_impl(&dword_1985F2000, v4, OS_LOG_TYPE_DEFAULT, "Recalculated page count. Page count = %zu", (uint8_t *)&v6, 0xCu);
  }
  if (v3 >= 0x7FFFFFFFFFFFFFFFLL) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return v3;
  }
}

- (void)_setNeedsRecalc
{
  if (!self->_suppressPageCountRecalc)
  {
    v2.receiver = self;
    v2.super_class = (Class)_WKWebViewPrintFormatter;
    [(UIPrintFormatter *)&v2 _setNeedsRecalc];
  }
}

- (CGRect)rectForPageAtIndex:(int64_t)a3
{
  if ([(_WKWebViewPrintFormatter *)self snapshotFirstPage]) {
    [(UIPrintPageRenderer *)[(UIPrintFormatter *)self printPageRenderer] paperRect];
  }
  else {
    [(UIPrintFormatter *)self _pageContentRect:[(UIPrintFormatter *)self startPage] == a3];
  }
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.double y = v6;
  result.origin.double x = v5;
  return result;
}

- (void)drawInRect:(CGRect)a3 forPageAtIndex:(int64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(_WKWebViewPrintFormatter *)self _shouldDrawUsingBitmap])
  {
    -[_WKWebViewPrintFormatter _drawInRectUsingBitmap:forPageAtIndex:](self, "_drawInRectUsingBitmap:forPageAtIndex:", a4, x, y, width, height);
  }
  else
  {
    -[_WKWebViewPrintFormatter _drawInRectUsingPDF:forPageAtIndex:](self, "_drawInRectUsingPDF:forPageAtIndex:", a4, x, y, width, height);
  }
}

- (void)_drawInRectUsingBitmap:(CGRect)a3 forPageAtIndex:(int64_t)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v10 = [(_WKWebViewPrintFormatter *)self _printPreviewImage];
  if (v10
    || (objc_msgSend((id)objc_msgSend(-[_WKWebViewPrintFormatter _webView](self, "_webView"), "_printProvider"), "_wk_requestImageForPrintFormatter:", self), (v10 = -[_WKWebViewPrintFormatter _printPreviewImage](self, "_printPreviewImage")) != 0))
  {
    CFRetain(v10);
    if ([(UIPrintFormatter *)self pageCount])
    {
      CurrentContext = UIGraphicsGetCurrentContext();
      CGContextSaveGState(CurrentContext);
      m_ptr = (CGImage *)self->_printPreviewImage.m_ptr;
      size_t v13 = CGImageGetWidth(m_ptr);
      size_t v14 = CGImageGetHeight(m_ptr);
      unint64_t v15 = [(UIPrintFormatter *)self pageCount];
      if (v13 && v15 <= v14)
      {
        CGFloat v16 = (double)(v14 / v15);
        v23.origin.CGFloat y = (double)a4 * v16;
        v23.origin.CGFloat x = 0.0;
        v23.size.CGFloat width = (double)v13;
        v23.size.CGFloat height = v16;
        v17 = CGImageCreateWithImageInRect(m_ptr, v23);
        v24.origin.CGFloat x = x;
        v24.origin.CGFloat y = y;
        v24.size.CGFloat width = width;
        v24.size.CGFloat height = height;
        CGFloat MinX = CGRectGetMinX(v24);
        v25.origin.CGFloat x = x;
        v25.origin.CGFloat y = y;
        v25.size.CGFloat width = width;
        v25.size.CGFloat height = height;
        CGFloat MaxY = CGRectGetMaxY(v25);
        CGContextTranslateCTM(CurrentContext, MinX, MaxY);
        CGContextScaleCTM(CurrentContext, 1.0, -1.0);
        v26.origin.CGFloat x = x;
        v26.origin.CGFloat y = y;
        v26.size.CGFloat width = width;
        v26.size.CGFloat height = height;
        double v20 = CGRectGetWidth(v26);
        v27.origin.CGFloat x = x;
        v27.origin.CGFloat y = y;
        v27.size.CGFloat width = width;
        v27.size.CGFloat height = height;
        CGFloat v21 = CGRectGetHeight(v27);
        CGContextScaleCTM(CurrentContext, v20 / (double)v13, v21 / v16);
        v28.origin.CGFloat x = 0.0;
        v28.origin.CGFloat y = 0.0;
        v28.size.CGFloat width = (double)v13;
        v28.size.CGFloat height = v16;
        CGContextDrawImage(CurrentContext, v28, v17);
        CGContextRestoreGState(CurrentContext);
        if (v17) {
          CFRelease(v17);
        }
      }
      else
      {
        CGContextRestoreGState(CurrentContext);
      }
    }
    CFRelease(v10);
  }
}

- (void)_drawInRectUsingPDF:(CGRect)a3 forPageAtIndex:(int64_t)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v10 = [(_WKWebViewPrintFormatter *)self _printedDocument];
  if (v10
    || (objc_msgSend((id)objc_msgSend(-[_WKWebViewPrintFormatter _webView](self, "_webView"), "_printProvider"), "_wk_requestDocumentForPrintFormatter:", self), (v10 = -[_WKWebViewPrintFormatter _printedDocument](self, "_printedDocument")) != 0))
  {
    CFRetain(v10);
    int64_t v11 = a4 - [(UIPrintFormatter *)self startPage];
    if (v11 >= 0)
    {
      Page = CGPDFDocumentGetPage(v10, v11 + 1);
      if (Page)
      {
        CurrentContext = UIGraphicsGetCurrentContext();
        CGContextSaveGState(CurrentContext);
        v18.origin.CGFloat x = x;
        v18.origin.CGFloat y = y;
        v18.size.CGFloat width = width;
        v18.size.CGFloat height = height;
        CGFloat MinX = CGRectGetMinX(v18);
        v19.origin.CGFloat x = x;
        v19.origin.CGFloat y = y;
        v19.size.CGFloat width = width;
        v19.size.CGFloat height = height;
        CGFloat MaxY = CGRectGetMaxY(v19);
        CGContextTranslateCTM(CurrentContext, MinX, MaxY);
        CGContextScaleCTM(CurrentContext, 1.0, -1.0);
        v20.origin.CGFloat x = x;
        v20.origin.CGFloat y = y;
        v20.size.CGFloat width = width;
        v20.size.CGFloat height = height;
        CGFloat v16 = CGRectGetWidth(v20);
        v21.origin.CGFloat x = x;
        v21.origin.CGFloat y = y;
        v21.size.CGFloat width = width;
        v21.size.CGFloat height = height;
        v22.size.CGFloat height = CGRectGetHeight(v21);
        v22.origin.CGFloat x = 0.0;
        v22.origin.CGFloat y = 0.0;
        v22.size.CGFloat width = v16;
        CGPDFPageGetDrawingTransform(&v17, Page, kCGPDFCropBox, v22, 0, 1);
        CGContextConcatCTM(CurrentContext, &v17);
        CGRect BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFCropBox);
        CGContextClipToRect(CurrentContext, BoxRect);
        CGContextDrawPDFPage(CurrentContext, Page);
        CGContextRestoreGState(CurrentContext);
      }
    }
    CFRelease(v10);
  }
}

- (BOOL)snapshotFirstPage
{
  return self->_snapshotFirstPage;
}

- (void)setSnapshotFirstPage:(BOOL)a3
{
  self->_snapshotFirstPage = a3;
}

- (void).cxx_destruct
{
  m_ptr = self->_printPreviewImage.m_ptr;
  self->_printPreviewImage.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  char v4 = self->_printedDocument.m_ptr;
  self->_printedDocument.m_ptr = 0;
  if (v4) {
    CFRelease(v4);
  }
  double v5 = self->_frameToPrint.m_ptr;
  self->_frameToPrint.m_ptr = 0;
  if (v5)
  {
    CFRelease(v5);
  }
}

- (id).cxx_construct
{
  *((void *)self + 16) = 0;
  *((unsigned char *)self + 137) = 0;
  *((unsigned char *)self + 138) = 0;
  *((void *)self + 18) = 0;
  *((void *)self + 19) = 0;
  return self;
}

@end