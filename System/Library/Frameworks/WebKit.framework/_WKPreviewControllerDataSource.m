@interface _WKPreviewControllerDataSource
- (NSString)mimeType;
- (_WKPreviewControllerDataSource)initWithSystemPreviewController:(void *)a3 MIMEType:(id)a4 originatingPageURL:(URL *)a5;
- (id).cxx_construct;
- (id)completionHandler;
- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4;
- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3;
- (void)dealloc;
- (void)failWithError:(id)a3;
- (void)finish:(URL *)a3;
- (void)previewItem:(id)a3 didReceiveMessage:(id)a4;
- (void)setCompletionHandler:(id)a3;
- (void)setMimeType:(id)a3;
- (void)setProgress:(float)a3;
@end

@implementation _WKPreviewControllerDataSource

- (_WKPreviewControllerDataSource)initWithSystemPreviewController:(void *)a3 MIMEType:(id)a4 originatingPageURL:(URL *)a5
{
  v12.receiver = self;
  v12.super_class = (Class)_WKPreviewControllerDataSource;
  id v8 = [(_WKPreviewControllerDataSource *)&v12 init];
  v9 = (_WKPreviewControllerDataSource *)v8;
  if (v8)
  {
    *((void *)v8 + 13) = a3;
    WTF::String::operator=((uint64_t *)v8 + 3, (WTF::StringImpl **)a5);
    long long v10 = *(_OWORD *)&a5->m_hostEnd;
    *(_OWORD *)((char *)&v9->_originatingPageURL + 8) = *(_OWORD *)((char *)a5 + 8);
    *(_OWORD *)&v9->_originatingPageURL.m_hostEnd = v10;
    v9->_mimeType = (NSString *)[a4 copy];
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_WKPreviewControllerDataSource;
  [(_WKPreviewControllerDataSource *)&v3 dealloc];
}

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  return 1;
}

- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  m_ptr = self->_item.m_ptr;
  if (!m_ptr)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F28D78]);
    v7 = self->_itemProvider.m_ptr;
    self->_itemProvider.m_ptr = v6;
    if (v7) {
      CFRelease(v7);
    }
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    v23 = (WTF::StringImpl *)location;
    WebCore::UTIFromMIMEType((uint64_t *)&to, (WebCore *)&v23, v8);
    if (to)
    {
      long long v10 = (__CFString *)WTF::StringImpl::operator NSString *();
      v11 = (WTF::StringImpl *)to;
      id to = 0;
      if (v11)
      {
        if (*(_DWORD *)v11 == 2) {
          WTF::StringImpl::destroy(v11, v9);
        }
        else {
          *(_DWORD *)v11 -= 2;
        }
      }
    }
    else
    {
      id to = 0;
      long long v10 = &stru_1EEA10550;
    }
    objc_super v12 = v23;
    v23 = 0;
    if (v12)
    {
      if (*(_DWORD *)v12 == 2) {
        objc_super v12 = (WTF::StringImpl *)WTF::StringImpl::destroy(v12, v9);
      }
      else {
        *(_DWORD *)v12 -= 2;
      }
    }
    id v13 = objc_alloc((Class)WebKit::getARQuickLookPreviewItemClass[0](v12));
    v14 = (void *)[v13 initWithFileAtURL:WTF::URL::operator NSURL *()];
    [v14 setCanonicalWebPageURL:WTF::URL::operator NSURL *()];
    v15 = (void *)[objc_alloc((Class)getARQuickLookWebKitItemClass()) initWithPreviewItemProvider:self->_itemProvider.m_ptr contentType:v10 previewTitle:@"Preview" fileSize:&unk_1EEA52E28 previewItem:v14];
    v16 = self->_item.m_ptr;
    self->_item.m_ptr = v15;
    if (v16)
    {
      CFRelease(v16);
      v15 = self->_item.m_ptr;
    }
    [v15 setDelegate:self];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v17 = WTF::URL::operator NSURL *();
      v18 = self->_item.m_ptr;
      v26 = @"ARQLWebsiteURLParameterKey";
      v27[0] = v17;
      objc_msgSend(v18, "setAdditionalParameters:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1));
    }
    [self->_item.m_ptr setUseLoadingTimeout:0];
    id location = 0;
    objc_initWeak(&location, self);
    v19 = self->_itemProvider.m_ptr;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3321888768;
    v21[2] = __71___WKPreviewControllerDataSource_previewController_previewItemAtIndex___block_invoke;
    v21[3] = &__block_descriptor_40_e8_32c85_ZTSKZ71___WKPreviewControllerDataSource_previewController_previewItemAtIndex__E4__12_e63_v32__0___v_____NSSecureCoding____NSError__8_16__NSDictionary_24l;
    id to = 0;
    objc_moveWeak(&to, &location);
    id v22 = 0;
    objc_copyWeak(&v22, &to);
    [v19 registerItemForTypeIdentifier:v10 loadHandler:v21];
    objc_destroyWeak(&to);
    m_ptr = self->_item.m_ptr;
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
    if (v14) {
      CFRelease(v14);
    }
  }
  return m_ptr;
}

- (void)setProgress:(float)a3
{
  m_ptr = self->_item.m_ptr;
  if (m_ptr)
  {
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithFloat:");
    [m_ptr setPreviewItemProviderProgress:v4];
  }
}

- (void)finish:(URL *)a3
{
  WTF::String::operator=((uint64_t *)&self->_downloadedURL, (WTF::StringImpl **)a3);
  long long v5 = *(_OWORD *)&a3->m_hostEnd;
  *(_OWORD *)((char *)&self->_downloadedURL + 8) = *(_OWORD *)((char *)a3 + 8);
  *(_OWORD *)&self->_downloadedURL.m_hostEnd = v5;
  if ([(_WKPreviewControllerDataSource *)self completionHandler])
  {
    id v6 = [(_WKPreviewControllerDataSource *)self completionHandler];
    uint64_t v7 = WTF::URL::operator NSURL *();
    id v8 = (void (*)(void *, uint64_t, void))v6[2];
    v8(v6, v7, 0);
  }
}

- (void)failWithError:(id)a3
{
  if ([(_WKPreviewControllerDataSource *)self completionHandler])
  {
    uint64_t v4 = *(void (**)(void))([(_WKPreviewControllerDataSource *)self completionHandler] + 16);
    v4();
  }
}

- (void)previewItem:(id)a3 didReceiveMessage:(id)a4
{
  if (self->_previewController
    && objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"callToAction"), "stringValue"), "isEqualToString:", @"buttonTapped"))
  {
    previewController = (WebKit::SystemPreviewController *)self->_previewController;
    WebKit::SystemPreviewController::triggerSystemPreviewAction(previewController);
  }
}

- (id)completionHandler
{
  return objc_getProperty(self, a2, 112, 1);
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSString)mimeType
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setMimeType:(id)a3
{
}

- (void).cxx_destruct
{
  m_ptr = self->_downloadedURL.m_string.m_impl.m_ptr;
  self->_downloadedURL.m_string.m_impl.m_ptr = 0;
  if (m_ptr)
  {
    if (*(_DWORD *)m_ptr == 2) {
      WTF::StringImpl::destroy((WTF::StringImpl *)m_ptr, (WTF::StringImpl *)a2);
    }
    else {
      *(_DWORD *)m_ptr -= 2;
    }
  }
  uint64_t v4 = self->_originatingPageURL.m_string.m_impl.m_ptr;
  self->_originatingPageURL.m_string.m_impl.m_ptr = 0;
  if (v4)
  {
    if (*(_DWORD *)v4 == 2) {
      WTF::StringImpl::destroy((WTF::StringImpl *)v4, (WTF::StringImpl *)a2);
    }
    else {
      *(_DWORD *)v4 -= 2;
    }
  }
  long long v5 = self->_item.m_ptr;
  self->_item.m_ptr = 0;
  if (v5) {
    CFRelease(v5);
  }
  id v6 = self->_itemProvider.m_ptr;
  self->_itemProvider.m_ptr = 0;
  if (v6)
  {
    CFRelease(v6);
  }
}

- (id).cxx_construct
{
  self->_itemProvider.m_ptr = 0;
  self->_item.m_ptr = 0;
  WTF::URL::URL((WTF::URL *)&self->_originatingPageURL);
  WTF::URL::URL((WTF::URL *)&self->_downloadedURL);
  return self;
}

@end