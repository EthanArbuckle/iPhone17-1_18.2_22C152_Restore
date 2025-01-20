@interface WKContentView(_WKWebViewPrintFormatter)
- (WebCore::ShareableBitmap)_createImage:()_WKWebViewPrintFormatter printFormatter:;
- (uint64_t)_attributesForPrintFormatter:()_WKWebViewPrintFormatter;
- (uint64_t)_createImage:()_WKWebViewPrintFormatter printFormatter:;
- (uint64_t)_createPDF:()_WKWebViewPrintFormatter printFormatter:;
- (void)_createImage:()_WKWebViewPrintFormatter printFormatter:;
- (void)_createPDF:()_WKWebViewPrintFormatter printFormatter:;
@end

@implementation WKContentView(_WKWebViewPrintFormatter)

- (uint64_t)_attributesForPrintFormatter:()_WKWebViewPrintFormatter
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(unsigned int *)(a2 + 12);
  **(void **)(a1 + 8) = v3;
  v4 = qword_1EB3582D0;
  if (os_log_type_enabled((os_log_t)qword_1EB3582D0, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    uint64_t v7 = v3;
    _os_log_impl(&dword_1985F2000, v4, OS_LOG_TYPE_DEFAULT, "Computed pages for printing on background thread. Page count = %zu", (uint8_t *)&v6, 0xCu);
  }
  return WTF::BinarySemaphore::signal(*(WTF::BinarySemaphore **)(a1 + 16));
}

- (void)_createImage:()_WKWebViewPrintFormatter printFormatter:
{
  *a1 = &unk_1EEA0DEA0;
  v2 = (const void *)a1[3];
  a1[3] = 0;
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = (const void *)a1[2];
  a1[2] = 0;
  if (v3) {
    CFRelease(v3);
  }
  return a1;
}

- (uint64_t)_createImage:()_WKWebViewPrintFormatter printFormatter:
{
  *(void *)this = &unk_1EEA0DEA0;
  uint64_t v3 = (const void *)*((void *)this + 3);
  *((void *)this + 3) = 0;
  if (v3) {
    CFRelease(v3);
  }
  v4 = (const void *)*((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v4) {
    CFRelease(v4);
  }

  return WTF::fastFree(this, a2);
}

- (WebCore::ShareableBitmap)_createImage:()_WKWebViewPrintFormatter printFormatter:
{
  uint64_t v4 = *(void *)(a1 + 24);
  if (*(unsigned char *)(a1 + 8))
  {
    char v5 = 0;
    int v6 = (atomic_uchar *)(v4 + 4264);
    atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)(v4 + 4264), (unsigned __int8 *)&v5, 1u, memory_order_acquire, memory_order_acquire);
    if (v5) {
      MEMORY[0x19972E8D0](v6);
    }
    [*(id *)(*(void *)(a1 + 24) + 4272) removeObject:*(void *)(a1 + 16)];
    int v7 = 1;
    atomic_compare_exchange_strong_explicit(v6, (unsigned __int8 *)&v7, 0, memory_order_release, memory_order_relaxed);
    if (v7 != 1) {
      WTF::Lock::unlockSlow((WTF::Lock *)v6);
    }
  }
  else
  {
    *(void *)(v4 + 4280) = 0;
  }
  if (*(unsigned char *)(a2 + 64))
  {
    WebCore::ShareableBitmap::create();
    if (v13)
    {
      WebCore::ShareableBitmap::makeCGImageCopy((uint64_t *)&cf, v13);
      [*(id *)(a1 + 16) _setPrintPreviewImage:cf];
      CFTypeRef v9 = cf;
      CFTypeRef cf = 0;
      if (v9) {
        CFRelease(v9);
      }
    }
    else
    {
      [*(id *)(a1 + 16) _setPrintPreviewImage:0];
    }
    result = v13;
    v13 = 0;
    if (result) {
      return (WebCore::ShareableBitmap *)WTF::ThreadSafeRefCounted<WebCore::ShareableBitmap,(WTF::DestructionThread)0>::deref((uint64_t)result, v8);
    }
  }
  else
  {
    v10 = *(void **)(a1 + 16);
    return (WebCore::ShareableBitmap *)[v10 _setPrintPreviewImage:0];
  }
  return result;
}

- (void)_createPDF:()_WKWebViewPrintFormatter printFormatter:
{
  uint64_t v4 = *(void *)(a1 + 24);
  if (*(unsigned char *)(a1 + 8))
  {
    char v5 = 0;
    int v6 = (atomic_uchar *)(v4 + 4264);
    atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)(v4 + 4264), (unsigned __int8 *)&v5, 1u, memory_order_acquire, memory_order_acquire);
    if (v5) {
      MEMORY[0x19972E8D0](v6);
    }
    [*(id *)(*(void *)(a1 + 24) + 4272) removeObject:*(void *)(a1 + 16)];
    int v7 = 1;
    atomic_compare_exchange_strong_explicit(v6, (unsigned __int8 *)&v7, 0, memory_order_release, memory_order_relaxed);
    if (v7 != 1) {
      WTF::Lock::unlockSlow((WTF::Lock *)v6);
    }
  }
  else
  {
    *(void *)(v4 + 4280) = 0;
  }
  uint64_t v8 = *a2;
  if (*a2 && *((void *)v8 + 6))
  {
    WebCore::SharedBuffer::createCFData((uint64_t *)&data, v8);
    CFTypeRef v9 = CGDataProviderCreateWithCFData(data);
    v10 = *(void **)(a1 + 16);
    CGPDFDocumentRef v11 = CGPDFDocumentCreateWithProvider(v9);
    [v10 _setPrintedDocument:v11];
    if (v11) {
      CFRelease(v11);
    }
    if (v9) {
      CFRelease(v9);
    }
    CFDataRef v12 = data;
    CFDataRef data = 0;
    if (v12) {
      CFRelease(v12);
    }
  }
  else
  {
    v13 = *(void **)(a1 + 16);
    [v13 _setPrintedDocument:0];
  }
}

- (uint64_t)_createPDF:()_WKWebViewPrintFormatter printFormatter:
{
  *(void *)this = &unk_1EEA0DEF0;
  uint64_t v3 = (const void *)*((void *)this + 3);
  *((void *)this + 3) = 0;
  if (v3) {
    CFRelease(v3);
  }
  uint64_t v4 = (const void *)*((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v4) {
    CFRelease(v4);
  }

  return WTF::fastFree(this, a2);
}

@end