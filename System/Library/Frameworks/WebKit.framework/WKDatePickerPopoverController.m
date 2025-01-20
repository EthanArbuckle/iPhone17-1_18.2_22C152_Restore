@interface WKDatePickerPopoverController
- (WKDatePickerPopoverController)initWithCalendarView:(id)a3 selectionWeekOfYear:(id)a4 delegate:(id)a5;
- (WKDatePickerPopoverController)initWithDatePicker:(id)a3 delegate:(id)a4;
- (id).cxx_construct;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (void)_dispatchPopoverControllerDidDismissIfNeeded;
- (void)_scaleDownToFitHeightIfNeeded;
- (void)assertAccessoryViewCanBeHitTestedForTesting;
- (void)dismissDatePicker;
- (void)dismissDatePickerAnimated:(BOOL)a3;
- (void)presentInView:(id)a3 sourceRect:(CGRect)a4 completion:(id)a5;
- (void)resetDatePicker;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation WKDatePickerPopoverController

- (WKDatePickerPopoverController)initWithDatePicker:(id)a3 delegate:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)WKDatePickerPopoverController;
  v6 = [(WKDatePickerPopoverController *)&v10 init];
  if (v6)
  {
    v7 = [[WKDatePickerPopoverView alloc] initWithDatePicker:a3];
    m_ptr = v6->_contentView.m_ptr;
    v6->_contentView.m_ptr = v7;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    objc_storeWeak((id *)&v6->_delegate, a4);
    [(WKDatePickerPopoverController *)v6 setModalPresentationStyle:7];
    objc_msgSend((id)-[WKDatePickerPopoverController popoverPresentationController](v6, "popoverPresentationController"), "setDelegate:", v6);
  }
  return v6;
}

- (WKDatePickerPopoverController)initWithCalendarView:(id)a3 selectionWeekOfYear:(id)a4 delegate:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)WKDatePickerPopoverController;
  v8 = [(WKDatePickerPopoverController *)&v12 init];
  if (v8)
  {
    v9 = [[WKDatePickerPopoverView alloc] initWithCalendarView:a3 selectionWeekOfYear:a4];
    m_ptr = v8->_contentView.m_ptr;
    v8->_contentView.m_ptr = v9;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    objc_storeWeak((id *)&v8->_delegate, a5);
    [(WKDatePickerPopoverController *)v8 setModalPresentationStyle:7];
    objc_msgSend((id)-[WKDatePickerPopoverController popoverPresentationController](v8, "popoverPresentationController"), "setDelegate:", v8);
  }
  return v8;
}

- (void)resetDatePicker
{
  id Weak = objc_loadWeak((id *)&self->_delegate);

  [Weak datePickerPopoverControllerDidReset:self];
}

- (void)assertAccessoryViewCanBeHitTestedForTesting
{
  v3 = (void *)[self->_contentView.m_ptr accessoryView];
  uint64_t v4 = [(WKDatePickerPopoverController *)self viewIfLoaded];
  if (!v3)
  {
    __break(0xC471u);
    JUMPOUT(0x198DC7F48);
  }
  v5 = (void *)v4;
  if (!v4) {
    goto LABEL_9;
  }
  [v3 bounds];
  objc_msgSend(v5, "convertRect:fromView:", v3);
  CGFloat x = v12.origin.x;
  CGFloat y = v12.origin.y;
  CGFloat width = v12.size.width;
  CGFloat height = v12.size.height;
  double MidX = CGRectGetMidX(v12);
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  v11 = objc_msgSend(v5, "hitTest:withEvent:", 0, MidX, CGRectGetMidY(v13));
  if (!v11)
  {
LABEL_9:
    __break(0xC471u);
    JUMPOUT(0x198DC7F10);
  }
  while (v11 != v3)
  {
    v11 = (void *)[v11 superview];
    if (!v11) {
      goto LABEL_9;
    }
  }
}

- (void)dismissDatePickerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (void *)[(WKDatePickerPopoverController *)self presentingViewController];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3321888768;
  v7[2] = __59__WKDatePickerPopoverController_dismissDatePickerAnimated___block_invoke;
  v7[3] = &__block_descriptor_40_e8_32c72_ZTSKZ59__WKDatePickerPopoverController_dismissDatePickerAnimated__E3__0_e5_v8__0l;
  if (self)
  {
    CFRetain(self);
    CFTypeRef cf = self;
    CFRetain(self);
  }
  else
  {
    CFTypeRef cf = 0;
  }
  [v5 dismissViewControllerAnimated:v3 completion:v7];
  if (self) {
    CFRelease(self);
  }
  CFTypeRef v6 = cf;
  CFTypeRef cf = 0;
  if (v6) {
    CFRelease(v6);
  }
}

uint64_t __59__WKDatePickerPopoverController_dismissDatePickerAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dispatchPopoverControllerDidDismissIfNeeded];
}

- (void)dismissDatePicker
{
}

- (void)viewDidLoad
{
  v18[3] = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)WKDatePickerPopoverController;
  [(WKDatePickerPopoverController *)&v16 viewDidLoad];
  [self->_contentView.m_ptr setTranslatesAutoresizingMaskIntoConstraints:0];
  id v3 = objc_alloc(MEMORY[0x1E4F427C0]);
  WebCore::localizedString((uint64_t *)&v15, (WebCore *)@"Reset Button Date/Time Context Menu", v4);
  if (v15) {
    v5 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v5 = &stru_1EEA10550;
  }
  v7 = (const void *)[v3 initWithTitle:v5 style:0 target:self action:sel_resetDatePicker];
  v8 = v15;
  v15 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2) {
      WTF::StringImpl::destroy(v8, v6);
    }
    else {
      *(_DWORD *)v8 -= 2;
    }
  }
  id v9 = objc_alloc(MEMORY[0x1E4F427C0]);
  objc_super v10 = (const void *)objc_msgSend(v9, "initWithBarButtonSystemItem:target:action:", 0, self, sel_dismissDatePicker, v15);
  v18[0] = v7;
  v18[1] = [MEMORY[0x1E4F427C0] flexibleSpaceItem];
  v18[2] = v10;
  objc_msgSend((id)objc_msgSend(self->_contentView.m_ptr, "accessoryView"), "setItems:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v18, 3));
  objc_msgSend((id)-[WKDatePickerPopoverController view](self, "view"), "addSubview:", self->_contentView.m_ptr);
  v11 = objc_msgSend((id)objc_msgSend(self->_contentView.m_ptr, "widthAnchor"), "constraintEqualToAnchor:", objc_msgSend((id)-[WKDatePickerPopoverController view](self, "view"), "widthAnchor"));
  CGRect v12 = v11;
  if (v11) {
    CFRetain(v11);
  }
  m_ptr = self->_untransformedContentWidthConstraint.m_ptr;
  self->_untransformedContentWidthConstraint.m_ptr = v12;
  if (m_ptr)
  {
    CFRelease(m_ptr);
    CGRect v12 = self->_untransformedContentWidthConstraint.m_ptr;
  }
  v14 = (void *)MEMORY[0x1E4F28DC8];
  v17[0] = v12;
  v17[1] = objc_msgSend((id)objc_msgSend(self->_contentView.m_ptr, "leadingAnchor"), "constraintEqualToAnchor:", objc_msgSend((id)-[WKDatePickerPopoverController view](self, "view"), "leadingAnchor"));
  v17[2] = objc_msgSend((id)objc_msgSend(self->_contentView.m_ptr, "trailingAnchor"), "constraintEqualToAnchor:", objc_msgSend((id)-[WKDatePickerPopoverController view](self, "view"), "trailingAnchor"));
  v17[3] = objc_msgSend((id)objc_msgSend(self->_contentView.m_ptr, "topAnchor"), "constraintEqualToAnchor:", objc_msgSend((id)-[WKDatePickerPopoverController view](self, "view"), "topAnchor"));
  v17[4] = objc_msgSend((id)objc_msgSend(self->_contentView.m_ptr, "bottomAnchor"), "constraintGreaterThanOrEqualToAnchor:", objc_msgSend((id)objc_msgSend((id)-[WKDatePickerPopoverController view](self, "view"), "layoutMarginsGuide"), "bottomAnchor"));
  objc_msgSend(v14, "activateConstraints:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v17, 5));
  objc_msgSend(self->_contentView.m_ptr, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4F43B90], *(double *)(MEMORY[0x1E4F43B90] + 8));
  -[WKDatePickerPopoverController setPreferredContentSize:](self, "setPreferredContentSize:");
  if (v10) {
    CFRelease(v10);
  }
  if (v7) {
    CFRelease(v7);
  }
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)WKDatePickerPopoverController;
  [(WKDatePickerPopoverController *)&v3 viewWillLayoutSubviews];
  if (([(WKDatePickerPopoverController *)self isBeingDismissed] & 1) == 0) {
    [(WKDatePickerPopoverController *)self _scaleDownToFitHeightIfNeeded];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)WKDatePickerPopoverController;
  -[WKDatePickerPopoverController viewWillTransitionToSize:withTransitionCoordinator:](&v5, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  if (([(WKDatePickerPopoverController *)self isBeingPresented] & 1) == 0
    && ([(WKDatePickerPopoverController *)self isBeingDismissed] & 1) == 0)
  {
    [(WKDatePickerPopoverController *)self dismissDatePickerAnimated:0];
  }
}

- (void)_scaleDownToFitHeightIfNeeded
{
  objc_msgSend((id)-[WKDatePickerPopoverController view](self, "view"), "bounds");
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [self->_contentView.m_ptr frame];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  v43.origin.CGFloat x = v4;
  v43.origin.CGFloat y = v6;
  v43.size.CGFloat width = v8;
  v43.size.CGFloat height = v10;
  if (!CGRectIsEmpty(v43))
  {
    v44.origin.CGFloat x = v12;
    v44.origin.CGFloat y = v14;
    v44.size.CGFloat width = v16;
    v44.size.CGFloat height = v18;
    if (!CGRectIsEmpty(v44))
    {
      v45.origin.CGFloat x = v12;
      v45.origin.CGFloat y = v14;
      v45.size.CGFloat width = v16;
      v45.size.CGFloat height = v18;
      rect.origin.CGFloat x = v12;
      double Height = CGRectGetHeight(v45);
      v46.origin.CGFloat x = v4;
      v46.origin.CGFloat y = v6;
      v46.size.CGFloat width = v8;
      v46.size.CGFloat height = v10;
      if (Height > CGRectGetHeight(v46))
      {
        v47.origin.CGFloat x = v4;
        v47.origin.CGFloat y = v6;
        v47.size.CGFloat width = v8;
        v47.size.CGFloat height = v10;
        double Width = CGRectGetWidth(v47);
        v48.origin.CGFloat x = rect.origin.x;
        v48.origin.CGFloat y = v14;
        v48.size.CGFloat width = v16;
        v48.size.CGFloat height = v18;
        double v21 = Width / CGRectGetWidth(v48);
        v49.origin.CGFloat x = v4;
        v49.origin.CGFloat y = v6;
        v49.size.CGFloat width = v8;
        v49.size.CGFloat height = v10;
        double v22 = CGRectGetHeight(v49);
        v50.origin.CGFloat x = rect.origin.x;
        v50.origin.CGFloat y = v14;
        v50.size.CGFloat width = v16;
        v50.size.CGFloat height = v18;
        double v23 = v22 / CGRectGetHeight(v50);
        double v24 = v23 >= v21 ? v21 : v23;
        if (v24 > 2.22044605e-16 && (*(void *)&v24 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
        {
          v51.origin.CGFloat x = rect.origin.x;
          v51.origin.CGFloat y = v14;
          v51.size.CGFloat width = v16;
          v51.size.CGFloat height = v18;
          double v26 = v24 * CGRectGetWidth(v51);
          v52.origin.CGFloat x = rect.origin.x;
          v52.origin.CGFloat y = v14;
          v52.size.CGFloat width = v16;
          v52.size.CGFloat height = v18;
          CGFloat v27 = CGRectGetHeight(v52);
          m_ptr = self->_contentView.m_ptr;
          *(void *)&rect.origin.CGFloat y = MEMORY[0x1E4F143A8];
          *(void *)&rect.size.CGFloat width = 3221225472;
          *(void *)&rect.size.CGFloat height = __62__WKDatePickerPopoverController__scaleDownToFitHeightIfNeeded__block_invoke;
          v34 = &__block_descriptor_88_e30__CGAffineTransform_dddddd_8__0l;
          double v29 = v24 * v27;
          double v35 = v26;
          double v36 = v24 * v27;
          CGFloat x = rect.origin.x;
          CGFloat v38 = v14;
          CGFloat v39 = v16;
          CGFloat v40 = v18;
          double v41 = v24;
          __62__WKDatePickerPopoverController__scaleDownToFitHeightIfNeeded__block_invoke((uint64_t)&rect.origin.y, &v42);
          [m_ptr setTransform:&v42];
          -[WKDatePickerPopoverController setPreferredContentSize:](self, "setPreferredContentSize:", v26, v29);
          [self->_untransformedContentWidthConstraint.m_ptr setActive:0];
          [self->_transformedContentWidthConstraint.m_ptr setActive:0];
          v30 = objc_msgSend((id)objc_msgSend(self->_contentView.m_ptr, "widthAnchor"), "constraintEqualToAnchor:multiplier:", objc_msgSend((id)-[WKDatePickerPopoverController view](self, "view"), "widthAnchor"), 1.0 / v24);
          v31 = v30;
          if (v30) {
            CFRetain(v30);
          }
          v32 = self->_transformedContentWidthConstraint.m_ptr;
          self->_transformedContentWidthConstraint.m_ptr = v31;
          if (v32)
          {
            CFRelease(v32);
            v31 = self->_transformedContentWidthConstraint.m_ptr;
          }
          objc_msgSend(v31, "setActive:", 1, *(void *)&rect.origin.x);
        }
      }
    }
  }
}

CGAffineTransform *__62__WKDatePickerPopoverController__scaleDownToFitHeightIfNeeded__block_invoke@<X0>(uint64_t a1@<X0>, CGAffineTransform *a2@<X8>)
{
  memset(&v10, 0, sizeof(v10));
  double v4 = *(double *)(a1 + 32);
  CGFloat v5 = (v4 - CGRectGetWidth(*(CGRect *)(a1 + 48))) * 0.5;
  double v6 = *(double *)(a1 + 40);
  CGFloat Height = CGRectGetHeight(*(CGRect *)(a1 + 48));
  CGAffineTransformMakeTranslation(&v10, v5, (v6 - Height) * 0.5);
  CGAffineTransform v9 = v10;
  return CGAffineTransformScale(a2, &v9, *(CGFloat *)(a1 + 80), *(CGFloat *)(a1 + 80));
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WKDatePickerPopoverController;
  [(WKDatePickerPopoverController *)&v4 viewDidDisappear:a3];
  [(WKDatePickerPopoverController *)self _dispatchPopoverControllerDidDismissIfNeeded];
}

- (void)presentInView:(id)a3 sourceRect:(CGRect)a4 completion:(id)a5
{
  CGFloat v8 = objc_msgSend(a3, "_wk_viewControllerForFullScreenPresentation");
  CGAffineTransform v9 = v8;
  if (v8) {
    CFRetain(v8);
  }
  while (1)
  {
    double v11 = v9;
    if (![v9 isBeingDismissed]) {
      break;
    }
    CGAffineTransform v10 = (void *)[v9 presentingViewController];
    CGAffineTransform v9 = v10;
    if (v10) {
      CFRetain(v10);
    }
    if (v11) {
      CFRelease(v11);
    }
  }
  if (v9)
  {
    self->_canSendPopoverControllerDidDismiss = 1;
    objc_msgSend(a3, "convertRect:toCoordinateSpace:", objc_msgSend(a3, "window"), a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    objc_msgSend((id)objc_msgSend(a3, "window"), "bounds");
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    v57.origin.CGFloat x = v13;
    v57.origin.CGFloat y = v15;
    v57.size.CGFloat width = v17;
    v57.size.CGFloat height = v19;
    double MinY = CGRectGetMinY(v57);
    v58.origin.CGFloat x = v21;
    v58.origin.CGFloat y = v23;
    v58.size.CGFloat width = v25;
    v58.size.CGFloat height = v27;
    double v53 = CGRectGetMinY(v58);
    v59.origin.CGFloat x = v13;
    v59.origin.CGFloat y = v15;
    v59.size.CGFloat width = v17;
    v59.size.CGFloat height = v19;
    double MinX = CGRectGetMinX(v59);
    v60.origin.CGFloat x = v21;
    v60.origin.CGFloat y = v23;
    v60.size.CGFloat width = v25;
    v60.size.CGFloat height = v27;
    double v51 = CGRectGetMinX(v60);
    v61.origin.CGFloat x = v21;
    v61.origin.CGFloat y = v23;
    v61.size.CGFloat width = v25;
    v61.size.CGFloat height = v27;
    double MaxX = CGRectGetMaxX(v61);
    v62.origin.CGFloat x = v13;
    v62.origin.CGFloat y = v15;
    v62.size.CGFloat width = v17;
    v62.size.CGFloat height = v19;
    CGFloat v28 = CGRectGetMaxX(v62);
    [self->_contentView.m_ptr estimatedMaximumPopoverSize];
    double v30 = v29;
    double v32 = v31;
    double v49 = v28;
    v33 = (void *)[(WKDatePickerPopoverController *)self popoverPresentationController];
    v63.origin.CGFloat x = v21;
    v63.origin.CGFloat y = v23;
    v63.size.CGFloat width = v25;
    v63.size.CGFloat height = v27;
    double Width = CGRectGetWidth(v63);
    v64.origin.CGFloat x = v21;
    v64.origin.CGFloat y = v23;
    v64.size.CGFloat width = v25;
    v64.size.CGFloat height = v27;
    double Height = CGRectGetHeight(v64);
    v65.origin.CGFloat x = v21;
    v65.origin.CGFloat y = v23;
    v65.size.CGFloat width = v25;
    v65.size.CGFloat height = v27;
    double v36 = CGRectGetHeight(v65);
    uint64_t v37 = 2;
    if (v32 >= MinY - v53 || v30 >= Width) {
      uint64_t v37 = 0;
    }
    if (v30 < MinX - v51 && v32 < Height) {
      uint64_t v38 = v37 | 8;
    }
    else {
      uint64_t v38 = v37;
    }
    if (v30 < MaxX - v49 && v32 < v36) {
      uint64_t v39 = v38 | 4;
    }
    else {
      uint64_t v39 = v38;
    }
    [v33 setPermittedArrowDirections:v39];
    [v33 setSourceView:a3];
    if (!v39)
    {
      objc_msgSend((id)objc_msgSend(a3, "window"), "bounds");
      objc_msgSend(a3, "convertRect:fromCoordinateSpace:", objc_msgSend(a3, "window"), v40, v41, v42, v43);
      a4.origin.CGFloat x = v44;
      a4.origin.CGFloat y = v45;
      a4.size.CGFloat width = v46;
      a4.size.CGFloat height = v47;
    }
    objc_msgSend(v33, "setSourceRect:", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
    [v11 presentViewController:self animated:1 completion:a5];
    CFRelease(v11);
  }
  else
  {
    CGRect v48 = (void (*)(id))*((void *)a5 + 2);
    v48(a5);
  }
}

- (void)_dispatchPopoverControllerDidDismissIfNeeded
{
  BOOL canSendPopoverControllerDidDismiss = self->_canSendPopoverControllerDidDismiss;
  self->_BOOL canSendPopoverControllerDidDismiss = 0;
  if (canSendPopoverControllerDidDismiss)
  {
    id Weak = objc_loadWeak((id *)&self->_delegate);
    [Weak datePickerPopoverControllerDidDismiss:self];
  }
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  m_ptr = self->_transformedContentWidthConstraint.m_ptr;
  self->_transformedContentWidthConstraint.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  objc_super v4 = self->_untransformedContentWidthConstraint.m_ptr;
  self->_untransformedContentWidthConstraint.m_ptr = 0;
  if (v4) {
    CFRelease(v4);
  }
  CGFloat v5 = self->_contentView.m_ptr;
  self->_contentView.m_ptr = 0;
  if (v5)
  {
    CFRelease(v5);
  }
}

- (id).cxx_construct
{
  *((void *)self + 122) = 0;
  *((void *)self + 123) = 0;
  *((void *)self + 124) = 0;
  return self;
}

@end