@interface WKImagePreviewViewController
- (WKImagePreviewViewController)initWithCGImage:(RetainPtr<CGImage *>)a3 defaultActions:(RetainPtr<NSArray>)a4 elementInfo:(RetainPtr<_WKActivatedElementInfo>)a5;
- (id).cxx_construct;
- (id)previewActionItems;
- (void)loadView;
- (void)viewDidLayoutSubviews;
@end

@implementation WKImagePreviewViewController

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)WKImagePreviewViewController;
  [(WKImagePreviewViewController *)&v3 loadView];
  objc_msgSend((id)-[WKImagePreviewViewController view](self, "view"), "setBackgroundColor:", objc_msgSend(MEMORY[0x1E4F428B8], "whiteColor"));
  objc_msgSend((id)-[WKImagePreviewViewController view](self, "view"), "addSubview:", self->_imageView.m_ptr);
}

- (WKImagePreviewViewController)initWithCGImage:(RetainPtr<CGImage *>)a3 defaultActions:(RetainPtr<NSArray>)a4 elementInfo:(RetainPtr<_WKActivatedElementInfo>)a5
{
  v32.receiver = self;
  v32.super_class = (Class)WKImagePreviewViewController;
  id v8 = [(WKImagePreviewViewController *)&v32 initWithNibName:0 bundle:0];
  if (v8)
  {
    v9 = *(const void **)a3.m_ptr;
    if (v9) {
      CFRetain(v9);
    }
    v10 = (const void *)*((void *)v8 + 124);
    *((void *)v8 + 124) = v9;
    if (v10) {
      CFRelease(v10);
    }
    id v11 = objc_alloc(MEMORY[0x1E4F42AA0]);
    v12 = objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v13 = (const void *)*((void *)v8 + 125);
    *((void *)v8 + 125) = v12;
    if (v13)
    {
      CFRelease(v13);
      v12 = (void *)*((void *)v8 + 125);
    }
    [v12 setContentMode:2];
    v14 = (const void *)[objc_alloc(MEMORY[0x1E4F42A80]) initWithCGImage:*((void *)v8 + 124)];
    [*((id *)v8 + 125) setImage:v14];
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42D90], "mainScreen"), "bounds");
    double v16 = v15;
    double v18 = v17;
    size_t Width = CGImageGetWidth(*((CGImageRef *)v8 + 124));
    size_t Height = CGImageGetHeight(*((CGImageRef *)v8 + 124));
    double v21 = (double)Width;
    double v22 = (double)Height;
    double v23 = (double)Width / (double)Height;
    if (v23 <= v16 / v18)
    {
      if (v23 < v16 / v18) {
        double v16 = v18 / v22 * v21;
      }
    }
    else
    {
      double v18 = v16 / v21 * v22;
    }
    v24 = (void *)*((void *)v8 + 125);
    [v24 frame];
    double v26 = v25;
    [*((id *)v8 + 125) frame];
    [v24 setFrame:v26];
    objc_msgSend(v8, "setPreferredContentSize:", v16, v18);
    v27 = *(const void **)a4.m_ptr;
    if (v27) {
      CFRetain(v27);
    }
    v28 = (const void *)*((void *)v8 + 122);
    *((void *)v8 + 122) = v27;
    if (v28) {
      CFRelease(v28);
    }
    v29 = *(const void **)a5.m_ptr;
    if (v29) {
      CFRetain(v29);
    }
    v30 = (const void *)*((void *)v8 + 123);
    *((void *)v8 + 123) = v29;
    if (v30) {
      CFRelease(v30);
    }
    if (v14) {
      CFRelease(v14);
    }
  }
  return (WKImagePreviewViewController *)v8;
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)WKImagePreviewViewController;
  [(WKImagePreviewViewController *)&v4 viewDidLayoutSubviews];
  m_ptr = self->_imageView.m_ptr;
  objc_msgSend((id)-[WKImagePreviewViewController view](self, "view"), "bounds");
  objc_msgSend(m_ptr, "setFrame:");
}

- (id)previewActionItems
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = self->_imageActions.m_ptr;
  uint64_t v4 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v9 = (void *)MEMORY[0x1E4F42CD8];
        uint64_t v10 = [v8 title];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __50__WKImagePreviewViewController_previewActionItems__block_invoke;
        v14[3] = &unk_1E5811F08;
        v14[4] = v8;
        v14[5] = self;
        id v11 = (void *)[v9 actionWithTitle:v10 style:0 handler:v14];
        objc_msgSend(v11, "setImage:", +[_WKElementAction imageForElementActionType:](_WKElementAction, "imageForElementActionType:", objc_msgSend(v8, "type")));
        [v3 addObject:v11];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
  return v3;
}

uint64_t __50__WKImagePreviewViewController_previewActionItems__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) runActionWithElementInfo:*(void *)(*(void *)(a1 + 40) + 984)];
}

- (void).cxx_destruct
{
  m_ptr = self->_imageView.m_ptr;
  self->_imageView.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  uint64_t v4 = self->_image.m_ptr;
  self->_image.m_ptr = 0;
  if (v4) {
    CFRelease(v4);
  }
  uint64_t v5 = self->_activatedElementInfo.m_ptr;
  self->_activatedElementInfo.m_ptr = 0;
  if (v5) {
    CFRelease(v5);
  }
  uint64_t v6 = self->_imageActions.m_ptr;
  self->_imageActions.m_ptr = 0;
  if (v6)
  {
    CFRelease(v6);
  }
}

- (id).cxx_construct
{
  *((void *)self + 122) = 0;
  *((void *)self + 123) = 0;
  *((void *)self + 124) = 0;
  *((void *)self + 125) = 0;
  return self;
}

@end