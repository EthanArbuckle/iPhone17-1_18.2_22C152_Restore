@interface WKModelView
- (ASVInlinePreview)preview;
- (BOOL)createFileForModel:(void *)a3;
- (WKModelView)initWithCoder:(id)a3;
- (WKModelView)initWithFrame:(CGRect)a3;
- (WKModelView)initWithModel:(void *)a3 layerID:()ProcessQualified<WTF:()WTF:(unsigned long)long :(WTF:(void *)a5 :SupportsObjectIdentifierNullState::No>>)a4 ObjectIdentifierMainThreadAccessTraits<uint64_t> :ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType page:;
- (id).cxx_construct;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)createPreview;
- (void)layoutSubviews;
- (void)updateBounds;
@end

@implementation WKModelView

- (ASVInlinePreview)preview
{
  return (ASVInlinePreview *)self->_preview.m_ptr;
}

- (WKModelView)initWithFrame:(CGRect)a3
{
  return 0;
}

- (WKModelView)initWithCoder:(id)a3
{
  return 0;
}

- (WKModelView)initWithModel:(void *)a3 layerID:()ProcessQualified<WTF:()WTF:(unsigned long)long :(WTF:(void *)a5 :SupportsObjectIdentifierNullState::No>>)a4 ObjectIdentifierMainThreadAccessTraits<uint64_t> :ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType page:
{
  unint64_t m_identifier = a4.m_processIdentifier.m_identifier;
  unint64_t v7 = a4.m_object.m_identifier;
  CGSize v9 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  self->_lastBounds.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  self->_lastBounds.size = v9;
  v9.double width = self->_lastBounds.origin.x;
  double y = self->_lastBounds.origin.y;
  double width = self->_lastBounds.size.width;
  double height = self->_lastBounds.size.height;
  v19.receiver = self;
  v19.super_class = (Class)WKModelView;
  v13 = -[WKModelView initWithFrame:](&v19, sel_initWithFrame_, v9.width, y, width, height);
  v14 = v13;
  if (v13)
  {
    v13->_layerID.m_value.m_object.unint64_t m_identifier = v7;
    v13->_layerID.m_value.m_processIdentifier.unint64_t m_identifier = m_identifier;
    WTF::WeakPtrFactory<IPC::MessageReceiver,WTF::DefaultWeakPtrImpl>::initializeIfNeeded((unsigned int *)a5 + 6, (uint64_t)a5 + 16);
    v16 = (atomic_uint *)*((void *)a5 + 3);
    if (v16) {
      atomic_fetch_add(v16, 1u);
    }
    m_ptr = (unsigned int *)v14->_page.m_impl.m_ptr;
    v14->_page.m_impl.m_ptr = (DefaultWeakPtrImpl *)v16;
    if (m_ptr && atomic_fetch_add((atomic_uint *volatile)m_ptr, 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, m_ptr);
      WTF::fastFree((WTF *)m_ptr, v15);
    }
    [(WKModelView *)v14 createFileForModel:a3];
    [(WKModelView *)v14 updateBounds];
  }
  return v14;
}

- (BOOL)createFileForModel:(void *)a3
{
  WebKit::WebsiteDataStore::defaultModelElementCacheDirectory(MEMORY[0x1E4F30978], (const WTF::String *)a2);
  if (!v17) {
    return 0;
  }
  if (!*((_DWORD *)v17 + 1)) {
    goto LABEL_14;
  }
  if (!WTF::FileSystemImpl::fileExists((WTF::FileSystemImpl *)&v17, v5))
  {
    if (WTF::FileSystemImpl::makeAllDirectories((WTF::FileSystemImpl *)&v17, v6)) {
      goto LABEL_8;
    }
LABEL_14:
    BOOL v8 = 0;
    goto LABEL_21;
  }
  uint64_t v7 = WTF::FileSystemImpl::fileTypeFollowingSymlinks((WTF::FileSystemImpl *)&v17, v6);
  BOOL v8 = 0;
  if ((v7 & 0xFF00000000) == 0 || v7 != 1)
  {
LABEL_21:
    v15 = v17;
    v17 = 0;
    if (v15)
    {
      if (*(_DWORD *)v15 == 2) {
        WTF::StringImpl::destroy(v15, v5);
      }
      else {
        *(_DWORD *)v15 -= 2;
      }
    }
    return v8;
  }
LABEL_8:
  WTF::UUID::UUID((WTF::UUID *)&v19);
  v18[0] = (uint64_t)".usdz";
  v18[1] = 6;
  BOOL result = WTF::tryMakeString<WTF::UUID,WTF::ASCIILiteral>(&v19, v18, &v16);
  if (v16)
  {
    WTF::FileSystemImpl::pathByAppendingComponent();
    LODWORD(v18[0]) = WTF::FileSystemImpl::openFile();
    BOOL v8 = SLODWORD(v18[0]) > 0;
    if (SLODWORD(v18[0]) > 0)
    {
      v10 = (atomic_uint *)*((void *)a3 + 1);
      atomic_fetch_add(v10, 1u);
      WebCore::SharedBuffer::data((WebCore::SharedBuffer *)v10);
      WTF::FileSystemImpl::writeToFile();
      WTF::ThreadSafeRefCounted<WebCore::FragmentedSharedBuffer,(WTF::DestructionThread)0>::deref((unsigned int *)v10, v11);
      WTF::FileSystemImpl::closeFile((WTF::FileSystemImpl *)v18, v12);
      WTF::String::operator=((uint64_t *)&self->_filePath, &v19);
    }
    v13 = v19;
    objc_super v19 = 0;
    if (v13)
    {
      if (*(_DWORD *)v13 == 2) {
        WTF::StringImpl::destroy(v13, v5);
      }
      else {
        *(_DWORD *)v13 -= 2;
      }
    }
    v14 = v16;
    v16 = 0;
    if (v14)
    {
      if (*(_DWORD *)v14 == 2) {
        WTF::StringImpl::destroy(v14, v5);
      }
      else {
        *(_DWORD *)v14 -= 2;
      }
    }
    goto LABEL_21;
  }
  __break(0xC471u);
  return result;
}

- (void)createPreview
{
  if (self->_filePath.m_impl.m_ptr)
  {
    [(WKModelView *)self bounds];
    uint64_t v7 = objc_msgSend(objc_alloc((Class)getASVInlinePreviewClass()), "initWithFrame:", v3, v4, v5, v6);
    m_ptr = self->_preview.m_ptr;
    self->_preview.m_ptr = v7;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    objc_msgSend((id)-[WKModelView layer](self, "layer"), "addSublayer:", objc_msgSend(self->_preview.m_ptr, "layer"));
    id v9 = objc_alloc(MEMORY[0x1E4F1CB10]);
    if (self->_filePath.m_impl.m_ptr) {
      v10 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      v10 = &stru_1EEA10550;
    }
    v11 = (const void *)[v9 initFileURLWithPath:v10];
    v12 = v11;
    v13 = self->_preview.m_ptr;
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3321888768;
    objc_super v19 = __28__WKModelView_createPreview__block_invoke;
    v20 = &unk_1EE9D40F0;
    v21 = self;
    CFTypeRef cf = v11;
    if (v11) {
      CFRetain(v11);
    }
    [v13 setupRemoteConnectionWithCompletionHandler:&v17];
    v14 = objc_alloc_init(WKModelInteractionGestureRecognizer);
    v15 = self->_modelInteractionGestureRecognizer.m_ptr;
    self->_modelInteractionGestureRecognizer.m_ptr = v14;
    if (v15)
    {
      CFRelease(v15);
      v14 = (WKModelInteractionGestureRecognizer *)self->_modelInteractionGestureRecognizer.m_ptr;
    }
    -[WKModelView addGestureRecognizer:](self, "addGestureRecognizer:", v14, v17, v18, v19, v20, v21);
    CFTypeRef v16 = cf;
    CFTypeRef cf = 0;
    if (v16) {
      CFRelease(v16);
    }
    if (v12) {
      CFRelease(v12);
    }
  }
}

uint64_t __28__WKModelView_createPreview__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    uint64_t v3 = v2[60];
    if (v3)
    {
      uint64_t v4 = *(void *)(v3 + 8);
      if (v4) {
        uint64_t v5 = v4 - 16;
      }
      else {
        uint64_t v5 = 0;
      }
    }
    else
    {
      uint64_t v5 = 0;
    }
    uint64_t v9 = v2[58];
    if (v9)
    {
      uint64_t v10 = v2[59];
      MEMORY[0x199731570](&v16);
      v21[0] = v9;
      v21[1] = v10;
      v20[0] = v21;
      v20[1] = &v16;
      WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::ModelInlinePreviewDidFailToLoad>(*(void *)(v5 + 256), (uint64_t)v20, *(void *)(*(void *)(v5 + 32) + 1928), 0);
      CFTypeRef v12 = cf;
      CFTypeRef cf = 0;
      if (v12) {
        CFRelease(v12);
      }
      v13 = v18;
      uint64_t v18 = 0;
      if (v13)
      {
        if (*(_DWORD *)v13 == 2) {
          WTF::StringImpl::destroy(v13, v11);
        }
        else {
          *(_DWORD *)v13 -= 2;
        }
      }
      v14 = v17;
      uint64_t v17 = 0;
      if (v14)
      {
        if (*(_DWORD *)v14 == 2) {
          WTF::StringImpl::destroy(v14, v11);
        }
        else {
          *(_DWORD *)v14 -= 2;
        }
      }
      uint64_t result = (uint64_t)v16;
      CFTypeRef v16 = 0;
      if (result)
      {
        if (*(_DWORD *)result == 2) {
          return WTF::StringImpl::destroy((WTF::StringImpl *)result, v11);
        }
        else {
          *(_DWORD *)result -= 2;
        }
      }
    }
    else
    {
      uint64_t result = 146;
      __break(0xC471u);
    }
  }
  else
  {
    double v6 = (void *)v2[51];
    uint64_t v7 = *(void *)(a1 + 40);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __28__WKModelView_createPreview__block_invoke_2;
    v15[3] = &unk_1E5813538;
    v15[4] = v2;
    return [v6 preparePreviewOfFileAtURL:v7 completionHandler:v15];
  }
  return result;
}

WTF::StringImpl *__28__WKModelView_createPreview__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 480);
  if (!a2)
  {
    if (v3)
    {
      uint64_t v6 = v3[1];
      if (v6) {
        uint64_t v3 = (void *)(v6 - 16);
      }
      else {
        uint64_t v3 = 0;
      }
    }
    uint64_t v7 = (WTF::StringImpl **)(v2 + 464);
    BOOL v8 = *v7;
    if (*v7)
    {
      uint64_t v9 = v7[1];
      uint64_t v18 = v8;
      objc_super v19 = v9;
      v23[0] = (uint64_t *)&v18;
      return (WTF::StringImpl *)WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::ModelInlinePreviewDidLoad>(v3[32], v23, *(void *)(v3[4] + 1928), 0);
    }
LABEL_29:
    __break(0xC471u);
    JUMPOUT(0x198DA0530);
  }
  if (v3)
  {
    uint64_t v4 = v3[1];
    if (v4) {
      uint64_t v5 = v4 - 16;
    }
    else {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  v11 = (uint64_t **)(v2 + 464);
  CFTypeRef v12 = *v11;
  if (!*v11) {
    goto LABEL_29;
  }
  v13 = v11[1];
  MEMORY[0x199731570](&v18);
  v23[0] = v12;
  v23[1] = v13;
  v22[0] = v23;
  v22[1] = &v18;
  WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::ModelInlinePreviewDidFailToLoad>(*(void *)(v5 + 256), (uint64_t)v22, *(void *)(*(void *)(v5 + 32) + 1928), 0);
  CFTypeRef v15 = cf;
  CFTypeRef cf = 0;
  if (v15) {
    CFRelease(v15);
  }
  CFTypeRef v16 = v20;
  v20 = 0;
  if (v16)
  {
    if (*(_DWORD *)v16 == 2) {
      WTF::StringImpl::destroy(v16, v14);
    }
    else {
      *(_DWORD *)v16 -= 2;
    }
  }
  uint64_t v17 = v19;
  objc_super v19 = 0;
  if (v17)
  {
    if (*(_DWORD *)v17 == 2) {
      WTF::StringImpl::destroy(v17, v14);
    }
    else {
      *(_DWORD *)v17 -= 2;
    }
  }
  uint64_t result = v18;
  uint64_t v18 = 0;
  if (result)
  {
    if (*(_DWORD *)result == 2) {
      return (WTF::StringImpl *)WTF::StringImpl::destroy(result, v14);
    }
    else {
      *(_DWORD *)result -= 2;
    }
  }
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)WKModelView;
  [(WKModelView *)&v3 layoutSubviews];
  [(WKModelView *)self updateBounds];
}

- (void)updateBounds
{
  [(WKModelView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v14.origin.x = v3;
  v14.origin.double y = v5;
  v14.size.double width = v7;
  v14.size.double height = v9;
  if (!CGRectEqualToRect(self->_lastBounds, v14))
  {
    self->_lastBounds.origin.x = v4;
    self->_lastBounds.origin.double y = v6;
    self->_lastBounds.size.double width = v8;
    self->_lastBounds.size.double height = v10;
    m_ptr = self->_preview.m_ptr;
    if (m_ptr)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __27__WKModelView_updateBounds__block_invoke;
      v12[3] = &unk_1E5813588;
      v12[4] = self;
      *(double *)&v12[5] = v4;
      *(double *)&v12[6] = v6;
      *(double *)&v12[7] = v8;
      *(double *)&v12[8] = v10;
      objc_msgSend(m_ptr, "updateFrame:completionHandler:", v12, v4, v6, v8, v10);
    }
    else
    {
      [(WKModelView *)self createPreview];
    }
  }
}

void __27__WKModelView_updateBounds__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    [a2 invalidate];
  }
  else
  {
    uint64_t v9 = v3;
    uint64_t v10 = v4;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __27__WKModelView_updateBounds__block_invoke_2;
    v6[3] = &unk_1E5813560;
    v6[4] = *(void *)(a1 + 32);
    v6[5] = a2;
    long long v5 = *(_OWORD *)(a1 + 56);
    long long v7 = *(_OWORD *)(a1 + 40);
    long long v8 = v5;
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

uint64_t __27__WKModelView_updateBounds__block_invoke_2(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "layer"), "context"), "addFence:", *(void *)(a1 + 40));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 408), "setFrameWithinFencedTransaction:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  uint64_t v2 = *(void **)(a1 + 40);

  return [v2 invalidate];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  if (-[WKModelView pointInside:withEvent:](self, "pointInside:withEvent:", a4, a3.x, a3.y)) {
    return self;
  }
  else {
    return 0;
  }
}

- (void).cxx_destruct
{
  m_ptr = (unsigned int *)self->_page.m_impl.m_ptr;
  self->_page.m_impl.m_ptr = 0;
  if (m_ptr && atomic_fetch_add((atomic_uint *volatile)m_ptr, 0xFFFFFFFF) == 1)
  {
    atomic_store(1u, m_ptr);
    WTF::fastFree((WTF *)m_ptr, (void *)a2);
  }
  uint64_t v4 = self->_filePath.m_impl.m_ptr;
  self->_filePath.m_impl.m_ptr = 0;
  if (v4)
  {
    if (*(_DWORD *)v4 == 2) {
      WTF::StringImpl::destroy((WTF::StringImpl *)v4, (WTF::StringImpl *)a2);
    }
    else {
      *(_DWORD *)v4 -= 2;
    }
  }
  long long v5 = self->_modelInteractionGestureRecognizer.m_ptr;
  self->_modelInteractionGestureRecognizer.m_ptr = 0;
  if (v5) {
    CFRelease(v5);
  }
  double v6 = self->_preview.m_ptr;
  self->_preview.m_ptr = 0;
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
  *((void *)self + 58) = 0;
  *((void *)self + 59) = 0;
  *((void *)self + 60) = 0;
  return self;
}

@end