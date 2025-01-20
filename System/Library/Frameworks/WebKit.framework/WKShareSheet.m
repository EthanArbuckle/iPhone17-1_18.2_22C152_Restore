@interface WKShareSheet
+ (id)createRandomSharingDirectoryForFile:(id)a3;
+ (id)createTemporarySharingDirectory;
+ (id)writeFileToShareableURL:(id)a3 data:(id)a4 temporaryDirectory:(id)a5;
- (BOOL)dismissIfNeededWithReason:(unsigned __int8)a3;
- (WKShareSheet)initWithView:(id)a3;
- (WKShareSheetDelegate)delegate;
- (id).cxx_construct;
- (uint64_t)presentWithParameters:(WTF *)this inRect:(void *)a2 completionHandler:;
- (uint64_t)presentWithParameters:(uint64_t)a1 inRect:(uint64_t *)a2 completionHandler:;
- (void)dismiss;
- (void)presentWithParameters:(const void *)a3 inRect:(optional<WebCore:(void *)a5 :FloatRect> *)a4 completionHandler:;
- (void)presentWithParameters:(void *)a1 inRect:completionHandler:;
- (void)presentWithShareDataArray:(id)a3 inRect:(optional<WebCore::FloatRect> *)a4;
- (void)setDelegate:(id)a3;
@end

@implementation WKShareSheet

- (WKShareSheetDelegate)delegate
{
  WeakRetained = (WKShareSheetDelegate *)objc_loadWeakRetained(&self->_delegate.m_weakReference);
  v3 = WeakRetained;
  if (WeakRetained) {
    CFRelease(WeakRetained);
  }
  return v3;
}

- (void)setDelegate:(id)a3
{
}

- (WKShareSheet)initWithView:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WKShareSheet;
  v4 = [(WKShareSheet *)&v7 init];
  v5 = v4;
  if (v4) {
    objc_storeWeak(&v4->_webView.m_weakReference, a3);
  }
  return v5;
}

- (void)presentWithParameters:(const void *)a3 inRect:(optional<WebCore:(void *)a5 :FloatRect> *)a4 completionHandler:
{
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v10 = *((void *)a3 + 1);
  if (v10 && *(_DWORD *)(v10 + 4)) {
    [v9 addObject:WTF::StringImpl::operator NSString *()];
  }
  if (*((unsigned char *)a3 + 80))
  {
    v11 = (void *)WTF::URL::operator NSURL *();
    if (*(void *)a3 && *(_DWORD *)(*(void *)a3 + 4)) {
      uint64_t v12 = WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v12 = 0;
    }
    if (*((unsigned char *)a3 + 104))
    {
      objc_msgSend(v11, "_web_setTitle:", v12);
      [v9 addObject:v11];
    }
    else
    {
      v13 = [[WKShareSheetURLItemProvider alloc] initWithURL:v11 title:v12];
      if (v13)
      {
        [v9 addObject:v13];
        CFRelease(v13);
      }
    }
  }
  if (*(void *)a3 && *(_DWORD *)(*(void *)a3 + 4) && ![v9 count])
  {
    if (*(void *)a3) {
      v14 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      v14 = &stru_1EEA10550;
    }
    [v9 addObject:v14];
  }
  v15 = *(void **)a5;
  *(void *)a5 = 0;
  value = self->_completionHandler.m_function.m_callableWrapper.__ptr_.__value_;
  self->_completionHandler.m_function.m_callableWrapper.__ptr_.__value_ = v15;
  if (value) {
    (*(void (**)(void *))(*(void *)value + 8))(value);
  }
  unsigned __int16 v17 = [objc_loadWeak(&self->_webView.m_weakReference) _resolutionForShareSheetImmediateCompletionForTesting];
  if (v17 >= 0x100u)
  {
    self->_didShareSuccessfully = v17;
    [(WKShareSheet *)self dismiss];
    goto LABEL_48;
  }
  if (!*((_DWORD *)a3 + 25))
  {
    $E2D53856B32FA0E62EFBBE3F1668E26F var0 = a4->var0;
    int v43 = *(_DWORD *)&a4->var1;
    [(WKShareSheet *)self presentWithShareDataArray:v9 inRect:&var0];
LABEL_48:
    if (v9) {
      CFRelease(v9);
    }
    return;
  }
  char v18 = *((unsigned char *)a3 + 104);
  id v19 = +[WKShareSheet createTemporarySharingDirectory];
  v20 = v19;
  if (v19) {
    CFRetain(v19);
  }
  m_ptr = self->_temporaryFileShareDirectory.m_ptr;
  self->_temporaryFileShareDirectory.m_ptr = v20;
  if (m_ptr)
  {
    CFRelease(m_ptr);
    v20 = self->_temporaryFileShareDirectory.m_ptr;
  }
  CFRetain(self);
  $E2D53856B32FA0E62EFBBE3F1668E26F v44 = a4->var0;
  LOBYTE(v45) = a4->var1;
  uint64_t v22 = WTF::fastMalloc((WTF *)0x28);
  *(void *)uint64_t v22 = &unk_1EEA0F730;
  *(void *)(v22 + 8) = self;
  *($E2D53856B32FA0E62EFBBE3F1668E26F *)(v22 + 16) = v44;
  *(_DWORD *)(v22 + 32) = v45;
  uint64_t v54 = 0;
  uint64_t v55 = 0;
  uint64_t v23 = *((unsigned int *)a3 + 25);
  if (v23)
  {
    if (v23 >> 28)
    {
      __break(0xC471u);
      return;
    }
    uint64_t v24 = WTF::fastMalloc((WTF *)(16 * v23));
    LODWORD(v55) = v23;
    uint64_t v54 = v24;
    if (*((_DWORD *)a3 + 25))
    {
      char v41 = v18;
      uint64_t v25 = 0;
      unint64_t v26 = 0;
      do
      {
        uint64_t v27 = *((void *)a3 + 11) + v25;
        WTF::String::isolatedCopy();
        WebCore::SharedBuffer::createNSData((uint64_t *)&v47, *(WebCore::SharedBuffer **)(v27 + 8));
        ++v26;
        v28 = (CFTypeRef *)(v24 + v25);
        CFTypeRef *v28 = v46;
        v28[1] = v47;
        v25 += 16;
      }
      while (v26 < *((unsigned int *)a3 + 25));
      HIDWORD(v55) = v26;
      char v18 = v41;
    }
  }
  WTF::WorkQueue::create();
  uint64_t v29 = v53;
  CFTypeRef v46 = v9;
  v47 = (const void *)v54;
  uint64_t v30 = v55;
  uint64_t v54 = 0;
  uint64_t v55 = 0;
  uint64_t v48 = v30;
  CFTypeRef cf = v20;
  if (v20) {
    CFRetain(v20);
  }
  char v50 = v18 ^ 1;
  uint64_t v51 = v22;
  uint64_t v31 = WTF::fastMalloc((WTF *)0x38);
  *(void *)uint64_t v31 = &unk_1EEA0F6E0;
  *(void *)(v31 + 8) = v46;
  uint64_t v32 = (uint64_t)v47;
  CFTypeRef v46 = 0;
  v47 = 0;
  *(void *)(v31 + 16) = v32;
  *(void *)(v31 + 24) = v48;
  *(void *)(v31 + 32) = cf;
  *(unsigned char *)(v31 + 40) = v50;
  uint64_t v33 = v51;
  uint64_t v48 = 0;
  CFTypeRef cf = 0;
  uint64_t v51 = 0;
  *(void *)(v31 + 48) = v33;
  uint64_t v52 = v31;
  (*(void (**)(uint64_t, uint64_t *))(*(void *)v29 + 32))(v29, &v52);
  uint64_t v35 = v52;
  uint64_t v52 = 0;
  if (v35) {
    (*(void (**)(uint64_t))(*(void *)v35 + 8))(v35);
  }
  uint64_t v36 = v51;
  uint64_t v51 = 0;
  if (v36) {
    (*(void (**)(uint64_t))(*(void *)v36 + 8))(v36);
  }
  CFTypeRef v37 = cf;
  CFTypeRef cf = 0;
  if (v37) {
    CFRelease(v37);
  }
  WTF::Vector<appendFilesAsShareableURLs(WTF::RetainPtr<NSMutableArray> &&,WTF::Vector<WebCore::RawFile,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc> const&,NSURL *,BOOL,WTF::CompletionHandler<void ()(WTF::RetainPtr<NSMutableArray> &)> &&)::FileWriteTask,0ul,WebCore::RawFile,16ul,WTF::CrashOnOverflow>::~Vector((unsigned int *)&v47, v34);
  CFTypeRef v39 = v46;
  CFTypeRef v46 = 0;
  if (v39) {
    CFRelease(v39);
  }
  uint64_t v40 = v53;
  uint64_t v53 = 0;
  if (v40) {
    (*(void (**)(uint64_t))(*(void *)v40 + 56))(v40);
  }
  WTF::Vector<appendFilesAsShareableURLs(WTF::RetainPtr<NSMutableArray> &&,WTF::Vector<WebCore::RawFile,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc> const&,NSURL *,BOOL,WTF::CompletionHandler<void ()(WTF::RetainPtr<NSMutableArray> &)> &&)::FileWriteTask,0ul,WebCore::RawFile,16ul,WTF::CrashOnOverflow>::~Vector((unsigned int *)&v54, v38);
}

- (void)presentWithShareDataArray:(id)a3 inRect:(optional<WebCore::FloatRect> *)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id Weak = objc_loadWeak(&self->_webView.m_weakReference);
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F42718]) initWithActivityItems:a3 applicationActivities:0];
  m_ptr = self->_shareSheetViewController.m_ptr;
  self->_shareSheetViewController.m_ptr = v8;
  if (m_ptr)
  {
    CFRelease(m_ptr);
    v8 = self->_shareSheetViewController.m_ptr;
  }
  v23[0] = *MEMORY[0x1E4F43620];
  objc_msgSend(v8, "setExcludedActivityTypes:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v23, 1));
  uint64_t v10 = self->_shareSheetViewController.m_ptr;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __49__WKShareSheet_presentWithShareDataArray_inRect___block_invoke;
  v21[3] = &unk_1E58141B8;
  v21[4] = self;
  [v10 setCompletionWithItemsHandler:v21];
  v11 = (void *)[self->_shareSheetViewController.m_ptr popoverPresentationController];
  [v11 setSourceView:Weak];
  [Weak bounds];
  v20.origin.x = v12;
  v20.origin.y = v13;
  v20.size.width = v14;
  v20.size.height = v15;
  if (a4->var1) {
    $E2D53856B32FA0E62EFBBE3F1668E26F var0 = a4->var0;
  }
  else {
    WebCore::FloatRect::FloatRect((WebCore::FloatRect *)&var0, &v20);
  }
  $E2D53856B32FA0E62EFBBE3F1668E26F v19 = var0;
  WebCore::FloatRect::operator CGRect();
  [v11 setSourceRect:*(_OWORD *)&v19];
  if (!a4->var1) {
    [v11 setPermittedArrowDirections:0];
  }
  objc_loadWeak(&self->_delegate.m_weakReference);
  if (objc_opt_respondsToSelector()) {
    [objc_loadWeak(&self->_delegate.m_weakReference) shareSheet:self willShowActivityItems:a3];
  }
  v16 = objc_msgSend(Weak, "_wk_viewControllerForFullScreenPresentation");
  unsigned __int16 v17 = v16;
  if (v16) {
    CFRetain(v16);
  }
  char v18 = self->_presentationViewController.m_ptr;
  self->_presentationViewController.m_ptr = v17;
  if (v18)
  {
    CFRelease(v18);
    unsigned __int16 v17 = self->_presentationViewController.m_ptr;
  }
  [v17 presentViewController:self->_shareSheetViewController.m_ptr animated:1 completion:0];
}

uint64_t __49__WKShareSheet_presentWithShareDataArray_inRect___block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 56) |= a3;
  if (![*(id *)(*(void *)(a1 + 32) + 40) presentingViewController]
    || (uint64_t result = [*(id *)(*(void *)(a1 + 32) + 40) isBeingDismissed], result))
  {
    v5 = *(void **)(a1 + 32);
    return [v5 dismiss];
  }
  return result;
}

- (void)dismiss
{
  value = self->_completionHandler.m_function.m_callableWrapper.__ptr_.__value_;
  self->_completionHandler.m_function.m_callableWrapper.__ptr_.__value_ = 0;
  uint64_t v13 = (uint64_t)value;
  if (value) {
    WTF::CompletionHandler<void ()(BOOL)>::operator()(&v13);
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "removeItemAtURL:error:", self->_temporaryFileShareDirectory.m_ptr, 0);
  m_ptr = self->_temporaryFileShareDirectory.m_ptr;
  self->_temporaryFileShareDirectory.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  uint64_t v10 = __23__WKShareSheet_dismiss__block_invoke;
  v11 = &unk_1E5812158;
  CGFloat v12 = self;
  v5 = self->_presentationViewController.m_ptr;
  if (v5)
  {
    v6 = (void *)[v5 presentedViewController];
    if (self->_shareSheetViewController.m_ptr == v6)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __23__WKShareSheet_dismiss__block_invoke_2;
      v8[3] = &unk_1E58141E0;
      v8[4] = self;
      v8[5] = v9;
      [v6 dismissViewControllerAnimated:1 completion:v8];
    }
    else
    {
      v10((uint64_t)v9);
    }
  }
  uint64_t v7 = v13;
  uint64_t v13 = 0;
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
  }
}

uint64_t __23__WKShareSheet_dismiss__block_invoke(uint64_t a1)
{
  objc_loadWeak((id *)(*(void *)(a1 + 32) + 24));
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id Weak = objc_loadWeak((id *)(*(void *)(a1 + 32) + 24));
    uint64_t v4 = *(void *)(a1 + 32);
    return [Weak shareSheetDidDismiss:v4];
  }
  return result;
}

void __23__WKShareSheet_dismiss__block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(const void **)(v2 + 48);
  *(void *)(v2 + 48) = 0;
  if (v3)
  {
    CFRelease(v3);
  }
}

- (BOOL)dismissIfNeededWithReason:(unsigned __int8)a3
{
  if (a3 == 1)
  {
    if (objc_msgSend(self->_shareSheetViewController.m_ptr, "_wk_isInFullscreenPresentation")) {
      return 0;
    }
    goto LABEL_5;
  }
  if ((a3 - 1) <= 1) {
LABEL_5:
  }
    [(WKShareSheet *)self setDelegate:0];
  [(WKShareSheet *)self dismiss];
  return 1;
}

+ (id)createTemporarySharingDirectory
{
  TemporaryDirectory = (void *)WTF::FileSystemImpl::createTemporaryDirectory((WTF::FileSystemImpl *)@"WKFileShare", (NSString *)a2);
  id result = (id)[TemporaryDirectory length];
  if (result)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CB10];
    return (id)[v4 fileURLWithPath:TemporaryDirectory isDirectory:1];
  }
  return result;
}

+ (id)createRandomSharingDirectoryForFile:(id)a3
{
  WTF::createVersion4UUIDString((uint64_t *)&v10, (WTF *)a1);
  if (v10)
  {
    v5 = (__CFString *)WTF::StringImpl::operator NSString *();
    v6 = v10;
    uint64_t v10 = 0;
    if (v6)
    {
      if (*(_DWORD *)v6 == 2) {
        WTF::StringImpl::destroy(v6, v4);
      }
      else {
        *(_DWORD *)v6 -= 2;
      }
    }
  }
  else
  {
    v5 = &stru_1EEA10550;
  }
  uint64_t v7 = [(__CFString *)v5 length];
  id result = 0;
  if (a3 && v7)
  {
    id v9 = (void *)[a3 URLByAppendingPathComponent:v5 isDirectory:1];
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v9, 0, 0, 0))return v9; {
    else
    }
      return 0;
  }
  return result;
}

+ (id)writeFileToShareableURL:(id)a3 data:(id)a4 temporaryDirectory:(id)a5
{
  if (!a5) {
    return 0;
  }
  uint64_t v8 = [a3 length];
  id result = 0;
  if (a4)
  {
    if (v8)
    {
      id result = +[WKShareSheet createRandomSharingDirectoryForFile:a5];
      if (result)
      {
        uint64_t v10 = (void *)[result URLByAppendingPathComponent:a3 isDirectory:0];
        if ([a4 writeToURL:v10 options:1 error:0]) {
          return v10;
        }
        else {
          return 0;
        }
      }
    }
  }
  return result;
}

- (void).cxx_destruct
{
  m_ptr = self->_presentationViewController.m_ptr;
  self->_presentationViewController.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  uint64_t v4 = self->_shareSheetViewController.m_ptr;
  self->_shareSheetViewController.m_ptr = 0;
  if (v4) {
    CFRelease(v4);
  }
  value = self->_completionHandler.m_function.m_callableWrapper.__ptr_.__value_;
  self->_completionHandler.m_function.m_callableWrapper.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(void *, SEL))(*(void *)value + 8))(value, a2);
  }
  objc_destroyWeak(&self->_delegate.m_weakReference);
  objc_destroyWeak(&self->_webView.m_weakReference);
  v6 = self->_temporaryFileShareDirectory.m_ptr;
  self->_temporaryFileShareDirectory.m_ptr = 0;
  if (v6)
  {
    CFRelease(v6);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (void)presentWithParameters:(void *)a1 inRect:completionHandler:
{
  uint64_t v2 = (const void *)a1[1];
  *a1 = &unk_1EEA0F730;
  a1[1] = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

- (uint64_t)presentWithParameters:(WTF *)this inRect:(void *)a2 completionHandler:
{
  v3 = (const void *)*((void *)this + 1);
  *(void *)this = &unk_1EEA0F730;
  *((void *)this + 1) = 0;
  if (v3) {
    CFRelease(v3);
  }

  return WTF::fastFree(this, a2);
}

- (uint64_t)presentWithParameters:(uint64_t)a1 inRect:(uint64_t *)a2 completionHandler:
{
  uint64_t v3 = *a2;
  uint64_t v4 = *(void **)(a1 + 8);
  if (*a2)
  {
    long long v6 = *(_OWORD *)(a1 + 16);
    int v7 = *(_DWORD *)(a1 + 32);
    return [v4 presentWithShareDataArray:v3 inRect:&v6];
  }
  else
  {
    return [v4 dismiss];
  }
}

@end