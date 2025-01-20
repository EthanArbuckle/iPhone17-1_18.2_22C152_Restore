@interface WKUSDPreviewView
+ (BOOL)web_requiresCustomSnapshotting;
- (id).cxx_construct;
- (id)provideDataForItem:(id)a3;
- (id)web_initWithFrame:(CGRect)a3 webView:(id)a4 mimeType:(id)a5;
- (void)_layoutThumbnailView;
- (void)thumbnailView:(id)a3 wantsToPresentPreviewController:(id)a4 forItem:(id)a5;
- (void)web_countStringMatches:(id)a3 options:(unint64_t)a4 maxCount:(unint64_t)a5;
- (void)web_findString:(id)a3 options:(unint64_t)a4 maxCount:(unint64_t)a5;
- (void)web_setContentProviderData:(id)a3 suggestedFilename:(id)a4;
@end

@implementation WKUSDPreviewView

- (id)web_initWithFrame:(CGRect)a3 webView:(id)a4 mimeType:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)WKUSDPreviewView;
  v7 = -[WKApplicationStateTrackingView initWithFrame:webView:](&v12, sel_initWithFrame_webView_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F428B8] colorWithRed:0.149019608 green:0.149019608 blue:0.149019608 alpha:1.0];
    [(WKUSDPreviewView *)v7 setBackgroundColor:v8];
    v7->_webView = (WKWebView *)a4;
    if (a5) {
      CFRetain(a5);
    }
    m_ptr = v7->_mimeType.m_ptr;
    v7->_mimeType.m_ptr = a5;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    v10 = (void *)[a4 scrollView];
    [v10 setMinimumZoomScale:1.0];
    [v10 setMaximumZoomScale:1.0];
    [v10 setBackgroundColor:v8];
  }
  return v7;
}

- (void)web_setContentProviderData:(id)a3 suggestedFilename:(id)a4
{
  v6 = (void *)[a4 copy];
  m_ptr = self->_suggestedFilename.m_ptr;
  self->_suggestedFilename.m_ptr = v6;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  uint64_t v8 = (void *)[a3 copy];
  v9 = self->_data.m_ptr;
  self->_data.m_ptr = v8;
  if (v9) {
    CFRelease(v9);
  }
  MEMORY[0x19972EAD0](&v23, self->_mimeType.m_ptr);
  if (WebCore::MIMETypeRegistry::isUSDMIMEType((WebCore::MIMETypeRegistry *)&v23, v10))
  {
    WebCore::UTIFromMIMEType((uint64_t *)&v24, (WebCore *)&v23, v11);
    if (v24)
    {
      objc_super v12 = (__CFString *)WTF::StringImpl::operator NSString *();
      v13 = v24;
      v24 = 0;
      if (v13)
      {
        if (*(_DWORD *)v13 == 2) {
          WTF::StringImpl::destroy(v13, v11);
        }
        else {
          *(_DWORD *)v13 -= 2;
        }
      }
    }
    else
    {
      objc_super v12 = &stru_1EEA10550;
    }
  }
  else
  {
    objc_super v12 = 0;
  }
  v14 = v23;
  v23 = 0;
  if (v14)
  {
    if (*(_DWORD *)v14 == 2) {
      v14 = (WTF::StringImpl *)WTF::StringImpl::destroy(v14, v11);
    }
    else {
      *(_DWORD *)v14 -= 2;
    }
  }
  id v15 = objc_alloc((Class)((uint64_t (*)(WTF::StringImpl *))*MEMORY[0x1E4FB6250])(v14));
  v16 = objc_msgSend(v15, "initWithDataProvider:contentType:previewTitle:", self, v12, self->_suggestedFilename.m_ptr, v23);
  v17 = self->_item.m_ptr;
  self->_item.m_ptr = v16;
  if (v17)
  {
    CFRelease(v17);
    v16 = self->_item.m_ptr;
  }
  [v16 setUseLoadingTimeout:0];
  v18 = (void *)[objc_alloc((Class)getASVThumbnailViewClass()) init];
  v19 = self->_thumbnailView.m_ptr;
  self->_thumbnailView.m_ptr = v18;
  if (v19)
  {
    CFRelease(v19);
    v18 = self->_thumbnailView.m_ptr;
  }
  [v18 setDelegate:self];
  [(WKUSDPreviewView *)self setAutoresizingMask:18];
  [(WKUSDPreviewView *)self setAutoresizesSubviews:1];
  [(WKUSDPreviewView *)self setClipsToBounds:1];
  [(WKUSDPreviewView *)self addSubview:self->_thumbnailView.m_ptr];
  [(WKUSDPreviewView *)self _layoutThumbnailView];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42D90], "mainScreen"), "bounds");
  if (v20 >= v21) {
    double v22 = v21;
  }
  else {
    double v22 = v20;
  }
  objc_msgSend(self->_thumbnailView.m_ptr, "setMaxThumbnailSize:", v22, v22);
  [self->_thumbnailView.m_ptr setThumbnailItem:self->_item.m_ptr];
}

- (void)_layoutThumbnailView
{
  if (self->_thumbnailView.m_ptr)
  {
    [(WKWebView *)self->_webView _computedUnobscuredSafeAreaInset];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    [(WKWebView *)self->_webView _computedObscuredInset];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    [(WKUSDPreviewView *)self frame];
    objc_msgSend(self->_thumbnailView.m_ptr, "setFrame:", v6 + v19, v4 + v20, v21 - (v6 + v10) - (v14 + v18), v22 - (v4 + v8) - (v12 + v16));
    m_ptr = self->_thumbnailView.m_ptr;
    [m_ptr setAutoresizingMask:18];
  }
}

- (void)thumbnailView:(id)a3 wantsToPresentPreviewController:(id)a4 forItem:(id)a5
{
  m_ptr = self->_webView->_page.m_ptr;
  if (m_ptr) {
    CFRetain(*((CFTypeRef *)m_ptr + 1));
  }
  objc_msgSend((id)(*(uint64_t (**)(void, SEL, id, id, id))(**((void **)m_ptr + 13) + 488))(*((void *)m_ptr + 13), a2, a3, a4, a5), "presentViewController:animated:completion:", a4, 1, 0);
  double v7 = (const void *)*((void *)m_ptr + 1);

  CFRelease(v7);
}

+ (BOOL)web_requiresCustomSnapshotting
{
  return 0;
}

- (void)web_countStringMatches:(id)a3 options:(unint64_t)a4 maxCount:(unint64_t)a5
{
  m_ptr = self->_webView->_page.m_ptr;
  if (m_ptr) {
    CFRetain(*((CFTypeRef *)m_ptr + 1));
  }
  uint64_t v7 = *((void *)m_ptr + 14);
  MEMORY[0x19972EAD0](&v10, a3, a3, a4, a5);
  (*(void (**)(uint64_t, WebPageProxy *, WTF::StringImpl **, void))(*(void *)v7 + 16))(v7, m_ptr, &v10, 0);
  double v9 = v10;
  double v10 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2) {
      WTF::StringImpl::destroy(v9, v8);
    }
    else {
      *(_DWORD *)v9 -= 2;
    }
  }
  CFRelease(*((CFTypeRef *)m_ptr + 1));
}

- (void)web_findString:(id)a3 options:(unint64_t)a4 maxCount:(unint64_t)a5
{
  m_ptr = self->_webView->_page.m_ptr;
  if (m_ptr) {
    CFRetain(*((CFTypeRef *)m_ptr + 1));
  }
  uint64_t v7 = *((void *)m_ptr + 14);
  MEMORY[0x19972EAD0](&v10, a3, a3, a4, a5);
  (*(void (**)(uint64_t, WebPageProxy *, WTF::StringImpl **))(*(void *)v7 + 32))(v7, m_ptr, &v10);
  double v9 = v10;
  double v10 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2) {
      WTF::StringImpl::destroy(v9, v8);
    }
    else {
      *(_DWORD *)v9 -= 2;
    }
  }
  CFRelease(*((CFTypeRef *)m_ptr + 1));
}

- (id)provideDataForItem:(id)a3
{
  return self->_data.m_ptr;
}

- (void).cxx_destruct
{
  m_ptr = self->_thumbnailView.m_ptr;
  self->_thumbnailView.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  double v4 = self->_item.m_ptr;
  self->_item.m_ptr = 0;
  if (v4) {
    CFRelease(v4);
  }
  double v5 = self->_mimeType.m_ptr;
  self->_mimeType.m_ptr = 0;
  if (v5) {
    CFRelease(v5);
  }
  double v6 = self->_suggestedFilename.m_ptr;
  self->_suggestedFilename.m_ptr = 0;
  if (v6) {
    CFRelease(v6);
  }
  uint64_t v7 = self->_data.m_ptr;
  self->_data.m_ptr = 0;
  if (v7) {
    CFRelease(v7);
  }
  double v8 = self->_itemProvider.m_ptr;
  self->_itemProvider.m_ptr = 0;
  if (v8)
  {
    CFRelease(v8);
  }
}

- (id).cxx_construct
{
  *((void *)self + 53) = 0;
  *((void *)self + 54) = 0;
  *((void *)self + 55) = 0;
  *((void *)self + 56) = 0;
  *((void *)self + 57) = 0;
  *((void *)self + 58) = 0;
  return self;
}

@end