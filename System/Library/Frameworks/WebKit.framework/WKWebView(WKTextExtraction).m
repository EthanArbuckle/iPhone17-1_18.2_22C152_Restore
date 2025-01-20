@interface WKWebView(WKTextExtraction)
- (uint64_t)_requestTextExtraction:()WKTextExtraction completionHandler:;
- (uint64_t)_requestTextExtractionForSwift:;
- (void)_requestTextExtractionForSwift:;
@end

@implementation WKWebView(WKTextExtraction)

- (void)_requestTextExtractionForSwift:
{
  v2 = *(const void **)(a1 + 32);
  *(void *)(a1 + 32) = 0;
  if (v2) {
    CFRelease(v2);
  }
}

- (uint64_t)_requestTextExtractionForSwift:
{
  return [*(id *)(a1 + 32) fulfill:a2];
}

- (uint64_t)_requestTextExtraction:()WKTextExtraction completionHandler:
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
  v5 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v5 = &unk_1EE9C5BD8;
  v5[1] = WeakRetained;
  v9 = v5;
  if (*(_DWORD *)(a2 + 80) || *(unsigned char *)a2)
  {
    v6 = 0;
  }
  else
  {
    WebKit::createItemRecursive((unsigned __int8 *)a2, &v9, (uint64_t *)&v10);
    v6 = v10;
  }
  (*(void (**)(void))(*(void *)(a1 + 8) + 16))(*(void *)(a1 + 8));
  if (v6) {
    CFRelease(v6);
  }
  v7 = *(uint64_t (**)(void *))(*v5 + 8);

  return v7(v5);
}

@end