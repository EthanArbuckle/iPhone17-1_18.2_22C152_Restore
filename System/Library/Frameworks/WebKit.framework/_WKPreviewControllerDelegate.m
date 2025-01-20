@interface _WKPreviewControllerDelegate
- (CGRect)previewController:(id)a3 frameForPreviewItem:(id)a4 inSourceView:(id *)a5;
- (_WKPreviewControllerDelegate)initWithSystemPreviewController:(void *)a3;
- (id).cxx_construct;
- (id)presentingViewController;
- (id)previewController:(id)a3 transitionImageForPreviewItem:(id)a4 contentRect:(CGRect *)a5;
- (void)previewControllerDidDismiss:(id)a3;
@end

@implementation _WKPreviewControllerDelegate

- (_WKPreviewControllerDelegate)initWithSystemPreviewController:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_WKPreviewControllerDelegate;
  result = [(_WKPreviewControllerDelegate *)&v5 init];
  if (result) {
    result->_previewController = a3;
  }
  return result;
}

- (void)previewControllerDidDismiss:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  previewController = self->_previewController;
  if (previewController)
  {
    v4 = qword_1EB358640;
    if (os_log_type_enabled((os_log_t)qword_1EB358640, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = previewController[12];
      int v10 = 134217984;
      uint64_t v11 = v5;
      _os_log_impl(&dword_1985F2000, v4, OS_LOG_TYPE_DEFAULT, "SystemPreview ended on %lld", (uint8_t *)&v10, 0xCu);
    }
    v6 = (const void *)previewController[30];
    previewController[30] = 0;
    if (v6) {
      CFRelease(v6);
    }
    v7 = (const void *)previewController[31];
    previewController[31] = 0;
    if (v7) {
      CFRelease(v7);
    }
    v8 = (const void *)previewController[29];
    previewController[29] = 0;
    if (v8) {
      CFRelease(v8);
    }
    v9 = (const void *)previewController[32];
    previewController[32] = 0;
    if (v9) {
      CFRelease(v9);
    }
    *((unsigned char *)previewController + 8) = 0;
  }
}

- (id)presentingViewController
{
  previewController = self->_previewController;
  if (previewController) {
    return (id)(*(uint64_t (**)(void))(**(void **)(previewController[2] + 104) + 488))();
  }
  else {
    return 0;
  }
}

- (CGRect)previewController:(id)a3 frameForPreviewItem:(id)a4 inSourceView:(id *)a5
{
  id v7 = [(_WKPreviewControllerDelegate *)self presentingViewController];
  if (v7)
  {
    v8 = (void *)[v7 view];
    *a5 = v8;
    previewController = self->_previewController;
    if (*((int *)previewController + 30) < 1 || *((int *)previewController + 31) < 1)
    {
      [v8 frame];
      double v14 = v17 * 0.5;
      [*a5 frame];
      double v16 = v18 * 0.5;
      [*a5 frame];
      double v12 = (v19 - v14) * 0.5;
      [*a5 frame];
      double v10 = (v20 - v16) * 0.5;
    }
    else
    {
      WebKit::WebPageProxy::syncRootViewToScreen(*((WebKit::WebPageProxy **)previewController + 2), (const IntRect *)previewController + 7);
      WebCore::IntRect::operator CGRect();
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;
    }
  }
  else
  {
    double v12 = *MEMORY[0x1E4F1DB28];
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  double v21 = v12;
  double v22 = v14;
  double v23 = v16;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v10;
  result.origin.x = v21;
  return result;
}

- (id)previewController:(id)a3 transitionImageForPreviewItem:(id)a4 contentRect:(CGRect *)a5
{
  CGSize v7 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  a5->origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  a5->size = v7;
  id v8 = [(_WKPreviewControllerDelegate *)self presentingViewController];
  if (v8)
  {
    v9 = v8;
    if (self->_linkRect.m_size.m_width < 1 || self->_linkRect.m_size.m_height <= 0)
    {
      objc_msgSend((id)objc_msgSend(v8, "view", *MEMORY[0x1E4F1DAD8], *(void *)(MEMORY[0x1E4F1DAD8] + 8)), "frame");
      CGFloat v14 = v13 * 0.5;
      objc_msgSend((id)objc_msgSend(v9, "view"), "frame");
      double v12 = v15 * 0.5;
      a5->origin = v19;
      a5->size.width = v14;
    }
    else
    {
      WebKit::WebPageProxy::syncRootViewToScreen(*((WebKit::WebPageProxy **)self->_previewController + 2), &self->_linkRect);
      double v12 = (double)v11;
      a5->origin = (CGPoint)*MEMORY[0x1E4F1DAD8];
      a5->size.width = (double)v10;
    }
    a5->size.height = v12;
  }
  double v16 = (const void *)objc_opt_new();
  double v17 = (void *)CFMakeCollectable(v16);

  return v17;
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end