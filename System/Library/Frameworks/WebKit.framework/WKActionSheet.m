@interface WKActionSheet
- (BOOL)presentSheet:(int64_t)a3;
- (BOOL)presentSheetFromRect:(CGRect)a3;
- (CGRect)_presentationRectForStyle:(int64_t)a3;
- (WKActionSheet)init;
- (WKActionSheetDelegate)sheetDelegate;
- (id).cxx_construct;
- (unint64_t)arrowDirections;
- (void)_cleanup;
- (void)_didRotateAndLayout;
- (void)dealloc;
- (void)didRotate;
- (void)doneWithSheet:(BOOL)a3;
- (void)setArrowDirections:(unint64_t)a3;
- (void)setSheetDelegate:(id)a3;
- (void)updateSheetPosition;
- (void)willRotate;
@end

@implementation WKActionSheet

- (WKActionSheet)init
{
  v6.receiver = self;
  v6.super_class = (Class)WKActionSheet;
  v2 = [(WKActionSheet *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_arrowDirections = 15;
    [MEMORY[0x1E4F42948] currentDevice];
    if (objc_opt_respondsToSelector())
    {
      if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42948], "currentDevice"), "userInterfaceIdiom"))
      {
        v4 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
        [v4 addObserver:v3 selector:sel_willRotate name:*MEMORY[0x1E4F43F40] object:0];
        [v4 addObserver:v3 selector:sel_didRotate name:*MEMORY[0x1E4F43F10] object:0];
      }
    }
  }
  return v3;
}

- (void)dealloc
{
  [(WKActionSheet *)self _cleanup];
  v3.receiver = self;
  v3.super_class = (Class)WKActionSheet;
  [(WKActionSheet *)&v3 dealloc];
}

- (void)_cleanup
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self);
  objc_super v3 = (void *)MEMORY[0x1E4FBA8A8];

  [v3 cancelPreviousPerformRequestsWithTarget:self];
}

- (BOOL)presentSheet:(int64_t)a3
{
  double x = *MEMORY[0x1E4F1DB28];
  double y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  [MEMORY[0x1E4F42948] currentDevice];
  if (objc_opt_respondsToSelector())
  {
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42948], "currentDevice"), "userInterfaceIdiom"))
    {
      [(WKActionSheet *)self _presentationRectForStyle:a3];
      double x = v11.origin.x;
      double y = v11.origin.y;
      double width = v11.size.width;
      double height = v11.size.height;
      if (CGRectIsEmpty(v11)) {
        return 0;
      }
    }
  }
  self->_currentPresentationStyle = a3;

  return -[WKActionSheet presentSheetFromRect:](self, "presentSheetFromRect:", x, y, width, height);
}

- (CGRect)_presentationRectForStyle:(int64_t)a3
{
  if (a3 == 2)
  {
    [(WKActionSheetDelegate *)self->_sheetDelegate presentationRectForElementUsingClosestIndicatedRect];
  }
  else if (a3 == 1)
  {
    [(WKActionSheetDelegate *)self->_sheetDelegate presentationRectForIndicatedElement];
  }
  else
  {
    [(WKActionSheetDelegate *)self->_sheetDelegate initialPresentationRectInHostViewForSheet];
  }
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (BOOL)presentSheetFromRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (void *)[(WKActionSheetDelegate *)self->_sheetDelegate hostViewForSheet];
  if (v8)
  {
    if (self->_presentedViewControllerWhileRotating.m_ptr) {
      m_ptr = self->_presentedViewControllerWhileRotating.m_ptr;
    }
    else {
      m_ptr = self;
    }
    [m_ptr setModalPresentationStyle:7];
    v10 = (void *)[m_ptr popoverPresentationController];
    [v10 setSourceView:v8];
    objc_msgSend(v10, "setSourceRect:", x, y, width, height);
    [v10 setPermittedArrowDirections:self->_arrowDirections];
    if (self->_popoverPresentationControllerDelegateWhileRotating.m_ptr) {
      objc_msgSend(v10, "setDelegate:");
    }
    CGRect v11 = objc_msgSend(v8, "_wk_viewControllerForFullScreenPresentation");
    v12 = v11;
    if (v11) {
      CFRetain(v11);
    }
    v13 = self->_currentPresentingViewController.m_ptr;
    self->_currentPresentingViewController.m_ptr = v12;
    if (v13)
    {
      CFRelease(v13);
      v12 = self->_currentPresentingViewController.m_ptr;
    }
    [v12 presentViewController:m_ptr animated:1 completion:0];
  }
  return v8 != 0;
}

- (void)doneWithSheet:(BOOL)a3
{
  if (a3)
  {
    double v4 = (WKActionSheet *)[self->_currentPresentingViewController.m_ptr presentedViewController];
    if (v4 == self || self->_presentedViewControllerWhileRotating.m_ptr == v4) {
      [(WKActionSheet *)v4 dismissViewControllerAnimated:1 completion:0];
    }
  }
  m_ptr = self->_currentPresentingViewController.m_ptr;
  self->_currentPresentingViewController.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  double v6 = self->_presentedViewControllerWhileRotating.m_ptr;
  self->_presentedViewControllerWhileRotating.m_ptr = 0;
  if (v6) {
    CFRelease(v6);
  }
  v7 = self->_popoverPresentationControllerDelegateWhileRotating.m_ptr;
  self->_popoverPresentationControllerDelegateWhileRotating.m_ptr = 0;
  if (v7) {
    CFRelease(v7);
  }
  self->_currentPresentationStyle = 0;

  [(WKActionSheet *)self _cleanup];
}

- (void)willRotate
{
  double v3 = (void *)[(WKActionSheetDelegate *)self->_sheetDelegate hostViewForSheet];
  if (v3)
  {
    double v4 = objc_msgSend(v3, "_wk_viewControllerForFullScreenPresentation");
    double v5 = (void *)[v4 presentedViewController];
    if (objc_msgSend((id)objc_msgSend(v5, "presentationController"), "presentationStyle") == 7 && !self->_isRotating)
    {
      self->_isRotating = 1;
      self->_readyToPresentAfterRotation = 0;
      double v6 = v5;
      if ([(WKActionSheet *)self presentingViewController]) {
        double v6 = (void *)[(WKActionSheet *)self presentedViewController];
      }
      if (v6) {
        CFRetain(v6);
      }
      m_ptr = self->_presentedViewControllerWhileRotating.m_ptr;
      self->_presentedViewControllerWhileRotating.m_ptr = v6;
      if (m_ptr) {
        CFRelease(m_ptr);
      }
      v8 = objc_msgSend((id)objc_msgSend(v5, "popoverPresentationController"), "delegate");
      v9 = v8;
      if (v8) {
        CFRetain(v8);
      }
      v10 = self->_popoverPresentationControllerDelegateWhileRotating.m_ptr;
      self->_popoverPresentationControllerDelegateWhileRotating.m_ptr = v9;
      if (v10) {
        CFRelease(v10);
      }
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __27__WKActionSheet_willRotate__block_invoke;
      v11[3] = &unk_1E5812158;
      v11[4] = self;
      [v4 dismissViewControllerAnimated:0 completion:v11];
    }
  }
}

uint64_t __27__WKActionSheet_willRotate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateSheetPosition];
}

- (void)updateSheetPosition
{
  v2 = self;
  if (self->_presentedViewControllerWhileRotating.m_ptr) {
    self = (WKActionSheet *)self->_presentedViewControllerWhileRotating.m_ptr;
  }
  if (!v2->_isRotating
    && v2->_readyToPresentAfterRotation
    && ![(WKActionSheet *)self presentingViewController]
    && ![(WKActionSheet *)v2 presentingViewController])
  {
    [(WKActionSheet *)v2 _presentationRectForStyle:v2->_currentPresentationStyle];
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    int v11 = [v2->_presentedViewControllerWhileRotating.m_ptr isModalInPresentation];
    v20.origin.double x = v4;
    v20.origin.double y = v6;
    v20.size.double width = v8;
    v20.size.double height = v10;
    if (!CGRectIsEmpty(v20) || v11 != 0)
    {
      objc_msgSend((id)-[WKActionSheetDelegate hostViewForSheet](v2->_sheetDelegate, "hostViewForSheet"), "bounds");
      v23.origin.double x = v4;
      v23.origin.double y = v6;
      v23.size.double width = v8;
      v23.size.double height = v10;
      CGRect v22 = CGRectIntersection(v21, v23);
      double x = v22.origin.x;
      double y = v22.origin.y;
      double width = v22.size.width;
      double height = v22.size.height;
      if (CGRectIsEmpty(v22))
      {
        if (v11) {
          [(WKActionSheet *)v2 presentSheet:v2->_currentPresentationStyle];
        }
      }
      else
      {
        -[WKActionSheet presentSheetFromRect:](v2, "presentSheetFromRect:", x, y, width, height);
      }
      m_ptr = v2->_presentedViewControllerWhileRotating.m_ptr;
      v2->_presentedViewControllerWhileRotating.m_ptr = 0;
      if (m_ptr) {
        CFRelease(m_ptr);
      }
      v18 = v2->_popoverPresentationControllerDelegateWhileRotating.m_ptr;
      v2->_popoverPresentationControllerDelegateWhileRotating.m_ptr = 0;
      if (v18)
      {
        CFRelease(v18);
      }
    }
  }
}

- (void)_didRotateAndLayout
{
  self->_isRotating = 0;
  self->_readyToPresentAfterRotation = 1;
  [(WKActionSheetDelegate *)self->_sheetDelegate updatePositionInformation];

  [(WKActionSheet *)self updateSheetPosition];
}

- (void)didRotate
{
}

- (WKActionSheetDelegate)sheetDelegate
{
  return self->_sheetDelegate;
}

- (void)setSheetDelegate:(id)a3
{
  self->_sheetDelegate = (WKActionSheetDelegate *)a3;
}

- (unint64_t)arrowDirections
{
  return self->_arrowDirections;
}

- (void)setArrowDirections:(unint64_t)a3
{
  self->_arrowDirections = a3;
}

- (void).cxx_destruct
{
  m_ptr = self->_popoverPresentationControllerDelegateWhileRotating.m_ptr;
  self->_popoverPresentationControllerDelegateWhileRotating.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  CGFloat v4 = self->_presentedViewControllerWhileRotating.m_ptr;
  self->_presentedViewControllerWhileRotating.m_ptr = 0;
  if (v4) {
    CFRelease(v4);
  }
  double v5 = self->_currentPresentingViewController.m_ptr;
  self->_currentPresentingViewController.m_ptr = 0;
  if (v5)
  {
    CFRelease(v5);
  }
}

- (id).cxx_construct
{
  *((void *)self + 168) = 0;
  *((void *)self + 169) = 0;
  *((void *)self + 170) = 0;
  return self;
}

@end