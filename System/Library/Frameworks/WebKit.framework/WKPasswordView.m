@interface WKPasswordView
- (NSString)documentName;
- (WKPasswordView)initWithFrame:(CGRect)a3 documentName:(id)a4;
- (id).cxx_construct;
- (id)userDidEnterPassword;
- (void)_keyboardDidShow:(id)a3;
- (void)dealloc;
- (void)didBeginEditingPassword:(id)a3 inView:(id)a4;
- (void)didEndEditingPassword:(id)a3 inView:(id)a4;
- (void)hide;
- (void)layoutSubviews;
- (void)setUserDidEnterPassword:(id)a3;
- (void)showInScrollView:(id)a3;
- (void)showPasswordFailureAlert;
- (void)userDidEnterPassword:(id)a3 forPasswordView:(id)a4;
@end

@implementation WKPasswordView

- (WKPasswordView)initWithFrame:(CGRect)a3 documentName:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)WKPasswordView;
  v5 = -[WKPasswordView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    uint64_t v6 = [a4 copy];
    m_ptr = v5->_documentName.m_ptr;
    v5->_documentName.m_ptr = (void *)v6;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F42988]) initWithDocumentName:v5->_documentName.m_ptr];
    v9 = v5->_passwordView.m_ptr;
    v5->_passwordView.m_ptr = v8;
    if (v9)
    {
      CFRelease(v9);
      v8 = v5->_passwordView.m_ptr;
    }
    [(WKPasswordView *)v5 bounds];
    objc_msgSend(v8, "setFrame:");
    [v5->_passwordView.m_ptr setPasswordDelegate:v5];
    [v5->_passwordView.m_ptr setAutoresizingMask:18];
    [(WKPasswordView *)v5 setAutoresizesSubviews:1];
    [(WKPasswordView *)v5 addSubview:v5->_passwordView.m_ptr];
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)WKPasswordView;
  [(WKPasswordView *)&v3 dealloc];
}

- (NSString)documentName
{
  return (NSString *)self->_documentName.m_ptr;
}

- (void)layoutSubviews
{
  m_ptr = self->_scrollView.m_ptr;
  if (m_ptr)
  {
    [(WKPasswordView *)self frame];
    objc_msgSend(m_ptr, "setContentSize:", v3, v4);
  }
}

- (void)showInScrollView:(id)a3
{
  if (a3) {
    CFRetain(a3);
  }
  m_ptr = self->_scrollView.m_ptr;
  self->_scrollView.m_ptr = a3;
  id v6 = a3;
  if (m_ptr)
  {
    CFRelease(m_ptr);
    id v6 = self->_scrollView.m_ptr;
  }
  [v6 minimumZoomScale];
  self->_savedMinimumZoomScale = v7;
  [self->_scrollView.m_ptr maximumZoomScale];
  self->_savedMaximumZoomScale = v8;
  [self->_scrollView.m_ptr zoomScale];
  self->_savedZoomScale = v9;
  [self->_scrollView.m_ptr contentSize];
  self->_savedContentSize.width = v10;
  self->_savedContentSize.height = v11;
  v12 = (void *)[self->_scrollView.m_ptr backgroundColor];
  v13 = v12;
  if (v12) {
    CFRetain(v12);
  }
  v14 = self->_savedBackgroundColor.m_ptr;
  self->_savedBackgroundColor.m_ptr = v13;
  if (v14) {
    CFRelease(v14);
  }
  [self->_scrollView.m_ptr setMinimumZoomScale:1.0];
  [self->_scrollView.m_ptr setMaximumZoomScale:1.0];
  [self->_scrollView.m_ptr setZoomScale:1.0];
  v15 = self->_scrollView.m_ptr;
  [(WKPasswordView *)self frame];
  objc_msgSend(v15, "setContentSize:", v16, v17);
  objc_msgSend(self->_scrollView.m_ptr, "setBackgroundColor:", objc_msgSend(MEMORY[0x1E4F428B8], "systemGroupedBackgroundColor"));

  [a3 addSubview:self];
}

- (void)hide
{
  [self->_scrollView.m_ptr setMinimumZoomScale:self->_savedMinimumZoomScale];
  [self->_scrollView.m_ptr setMaximumZoomScale:self->_savedMaximumZoomScale];
  [self->_scrollView.m_ptr setZoomScale:self->_savedZoomScale];
  objc_msgSend(self->_scrollView.m_ptr, "setContentSize:", self->_savedContentSize.width, self->_savedContentSize.height);
  [self->_scrollView.m_ptr setBackgroundColor:self->_savedBackgroundColor.m_ptr];
  m_ptr = self->_scrollView.m_ptr;
  self->_scrollView.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  double v4 = self->_savedBackgroundColor.m_ptr;
  self->_savedBackgroundColor.m_ptr = 0;
  if (v4) {
    CFRelease(v4);
  }

  [(WKPasswordView *)self removeFromSuperview];
}

- (void)showPasswordFailureAlert
{
  double v3 = (WebKit *)&stru_1EEA10550;
  objc_msgSend((id)objc_msgSend(self->_passwordView.m_ptr, "passwordField"), "setText:", &stru_1EEA10550);
  WebCore::localizedString((uint64_t *)&v15, (WebCore *)@"The document could not be opened with that password.", v4);
  if (v15) {
    double v3 = (WebKit *)WTF::StringImpl::operator NSString *();
  }
  WebKit::createUIAlertController(v3, &stru_1EEA10550.isa, &v16);
  id v6 = v15;
  v15 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v5);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
  double v7 = (void *)MEMORY[0x1E4F42720];
  WebCore::localizedString((uint64_t *)&v15, (WebCore *)@"OK (password failure alert)", (const __CFString *)v5);
  if (v15) {
    double v8 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    double v8 = &stru_1EEA10550;
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3321888768;
  v14[2] = __42__WKPasswordView_showPasswordFailureAlert__block_invoke;
  v14[3] = &__block_descriptor_33_e8_32c55_ZTSKZ42__WKPasswordView_showPasswordFailureAlert_E3__9_e23_v16__0__UIAlertAction_8l;
  uint64_t v10 = [v7 actionWithTitle:v8 style:0 handler:v14];
  CGFloat v11 = v15;
  v15 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2) {
      WTF::StringImpl::destroy(v11, v9);
    }
    else {
      *(_DWORD *)v11 -= 2;
    }
  }
  [v16 addAction:v10];
  v12 = objc_msgSend((id)-[WKPasswordView window](self, "window"), "rootViewController");
  [v12 presentViewController:v16 animated:1 completion:0];
  id v13 = v16;
  id v16 = 0;
  if (v13) {
    CFRelease(v13);
  }
}

- (void)_keyboardDidShow:(id)a3
{
  CFStringRef v4 = objc_msgSend(self->_passwordView.m_ptr, "passwordField", a3);
  if ([v4 isEditing])
  {
    [MEMORY[0x1E4F42C68] visiblePeripheralFrame];
    double x = v32.origin.x;
    double y = v32.origin.y;
    double width = v32.size.width;
    double height = v32.size.height;
    if (!CGRectIsEmpty(v32))
    {
      double v9 = (void *)[self->_scrollView.m_ptr window];
      objc_msgSend(v9, "convertRect:fromWindow:", 0, x, y, width, height);
      objc_msgSend(self->_scrollView.m_ptr, "convertRect:fromView:", v9);
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      CGFloat v17 = v16;
      [v4 bounds];
      objc_msgSend(v4, "convertRect:toView:", self->_scrollView.m_ptr);
      CGFloat v29 = v19;
      CGFloat v30 = v18;
      CGFloat v21 = v20;
      CGFloat v23 = v22;
      [self->_passwordView.m_ptr bounds];
      double v25 = v24;
      double v27 = v26;
      v33.origin.double x = v11;
      v33.origin.double y = v13;
      v33.size.double width = v15;
      v33.size.double height = v17;
      objc_msgSend(self->_scrollView.m_ptr, "setContentSize:", v25, CGRectGetHeight(v33) + v27);
      v34.origin.double x = v30;
      v34.origin.double y = v21;
      v34.size.double width = v29;
      v34.size.double height = v23;
      v37.origin.double x = v11;
      v37.origin.double y = v13;
      v37.size.double width = v15;
      v37.size.double height = v17;
      if (CGRectIntersectsRect(v34, v37))
      {
        v35.origin.double x = v30;
        v35.origin.double y = v21;
        v35.size.double width = v29;
        v35.size.double height = v23;
        CGRectGetMaxY(v35);
        v36.origin.double x = v11;
        v36.origin.double y = v13;
        v36.size.double width = v15;
        v36.size.double height = v17;
        CGRectGetMinY(v36);
        [self->_scrollView.m_ptr contentOffset];
        m_ptr = self->_scrollView.m_ptr;
        objc_msgSend(m_ptr, "setContentOffset:animated:", 1);
      }
    }
  }
}

- (void)userDidEnterPassword:(id)a3 forPasswordView:(id)a4
{
  if (self) {
    CFRetain(self);
  }
  userDidEnterPassword = (void (**)(id, id, id, id))self->_userDidEnterPassword;
  if (userDidEnterPassword) {
    userDidEnterPassword[2](userDidEnterPassword, a3, a3, a4);
  }

  CFRelease(self);
}

- (void)didBeginEditingPassword:(id)a3 inView:(id)a4
{
  v5 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3, a4);
  uint64_t v6 = *MEMORY[0x1E4F43AC8];

  [v5 addObserver:self selector:sel__keyboardDidShow_ name:v6 object:0];
}

- (void)didEndEditingPassword:(id)a3 inView:(id)a4
{
  m_ptr = self->_scrollView.m_ptr;
  objc_msgSend(self->_passwordView.m_ptr, "frame", a3, a4);
  objc_msgSend(m_ptr, "setContentSize:", v6, v7);
  [self->_scrollView.m_ptr contentInset];
  objc_msgSend(self->_scrollView.m_ptr, "setContentOffset:animated:", 1, -v8, -v9);
  double v10 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v11 = *MEMORY[0x1E4F43AC8];

  [v10 removeObserver:self name:v11 object:0];
}

- (id)userDidEnterPassword
{
  return self->_userDidEnterPassword;
}

- (void)setUserDidEnterPassword:(id)a3
{
}

- (void).cxx_destruct
{
  m_ptr = self->_savedBackgroundColor.m_ptr;
  self->_savedBackgroundColor.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  CFStringRef v4 = self->_passwordView.m_ptr;
  self->_passwordView.m_ptr = 0;
  if (v4) {
    CFRelease(v4);
  }
  v5 = self->_scrollView.m_ptr;
  self->_scrollView.m_ptr = 0;
  if (v5) {
    CFRelease(v5);
  }
  double v6 = self->_documentName.m_ptr;
  self->_documentName.m_ptr = 0;
  if (v6)
  {
    CFRelease(v6);
  }
}

- (id).cxx_construct
{
  *((void *)self + 51) = 0;
  *((void *)self + 52) = 0;
  *((void *)self + 53) = 0;
  *((void *)self + 59) = 0;
  return self;
}

@end