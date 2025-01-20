@interface NSAttributedString
@end

@implementation NSAttributedString

void __90__NSAttributedString_WKPrivate___loadFromHTMLWithOptions_contentLoader_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x2020000000;
  char v68 = 0;
  +[_WKAttributedStringWebViewCache invalidateGlobalConfigurationIfNeeded:*(void *)(a1 + 32)];
  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x3812000000;
  v61 = __Block_byref_object_copy__5;
  v62 = __Block_byref_object_dispose__5;
  v63 = &unk_19964AFC1;
  +[_WKAttributedStringWebViewCache retrieveOrCreateWebView];
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x3812000000;
  v54 = __Block_byref_object_copy__205;
  v55 = __Block_byref_object_dispose__206;
  v56 = &unk_19964AFC1;
  v57 = objc_alloc_init(_WKAttributedStringNavigationDelegate);
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3812000000;
  v47 = __Block_byref_object_copy__209;
  v48 = __Block_byref_object_dispose__210;
  v49 = &unk_19964AFC1;
  CFTypeRef cf = 0;
  [(id)v59[6] setNavigationDelegate:v52[6]];
  v2 = (void *)[*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F425A0]];
  objc_opt_class();
  unsigned __int8 isKindOfClass = objc_opt_isKindOfClass();
  double v4 = 1.0;
  if ((isKindOfClass & (v2 != 0)) == 1) {
    objc_msgSend(v2, "doubleValue", 1.0);
  }
  [(id)v59[6] _setTextZoomFactor:v4];
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x3812000000;
  v40 = __Block_byref_object_copy__212;
  v41 = __Block_byref_object_dispose__213;
  v42 = &unk_19964AFC1;
  uint64_t v43 = 0;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __90__NSAttributedString_WKPrivate___loadFromHTMLWithOptions_contentLoader_completionHandler___block_invoke_215;
  v30[3] = &unk_1E5811F50;
  v32 = &v65;
  v33 = &v37;
  v34 = &v58;
  v35 = &v51;
  v36 = &v44;
  long long v31 = *(_OWORD *)(a1 + 40);
  v28[4] = &v44;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __90__NSAttributedString_WKPrivate___loadFromHTMLWithOptions_contentLoader_completionHandler___block_invoke_2;
  v29[3] = &unk_1E5811F78;
  v29[4] = v30;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __90__NSAttributedString_WKPrivate___loadFromHTMLWithOptions_contentLoader_completionHandler___block_invoke_3;
  v28[3] = &unk_1E5811FA0;
  [(id)v52[6] setDecidePolicyForNavigationAction:v28];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __90__NSAttributedString_WKPrivate___loadFromHTMLWithOptions_contentLoader_completionHandler___block_invoke_4;
  v27[3] = &unk_1E5811FC8;
  v27[4] = v29;
  [(id)v52[6] setWebContentProcessDidTerminate:v27];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __90__NSAttributedString_WKPrivate___loadFromHTMLWithOptions_contentLoader_completionHandler___block_invoke_5;
  v26[3] = &unk_1E5811FF0;
  v26[4] = v29;
  [(id)v52[6] setDidFailProvisionalNavigation:v26];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __90__NSAttributedString_WKPrivate___loadFromHTMLWithOptions_contentLoader_completionHandler___block_invoke_6;
  v25[3] = &unk_1E5811FF0;
  v25[4] = v29;
  [(id)v52[6] setDidFailNavigation:v25];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __90__NSAttributedString_WKPrivate___loadFromHTMLWithOptions_contentLoader_completionHandler___block_invoke_7;
  v24[3] = &unk_1E5812040;
  v24[6] = &v65;
  v24[7] = &v51;
  v24[8] = &v58;
  v24[4] = v29;
  v24[5] = v30;
  [(id)v52[6] setDidFinishNavigation:v24];
  v5 = (void *)[*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F425B0]];
  objc_opt_class();
  int64_t v6 = 60000000000;
  if ((objc_opt_isKindOfClass() & (v5 != 0)) == 1)
  {
    [v5 doubleValue];
    if (v7 >= 0.0)
    {
      [v5 doubleValue];
      int64_t v6 = (uint64_t)(v8 * 1000000000.0);
    }
  }
  dispatch_time_t v9 = dispatch_time(0, v6);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__NSAttributedString_WKPrivate___loadFromHTMLWithOptions_contentLoader_completionHandler___block_invoke_9;
  block[3] = &unk_1E5812068;
  block[4] = v29;
  block[5] = &v65;
  dispatch_after(v9, MEMORY[0x1E4F14428], block);
  v10 = (const void *)(*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
  uint64_t v11 = (uint64_t)v10;
  v12 = v45;
  if (v10) {
    CFRetain(v10);
  }
  v13 = (const void *)v12[6];
  v12[6] = v11;
  if (v13) {
    CFRelease(v13);
  }
  if (!*((unsigned char *)v66 + 24))
  {
    [(id)v59[6] _page];
    uint64_t v14 = *(void *)(v22 + 256);
    atomic_fetch_add((atomic_uint *volatile)(v14 + 16), 1u);
    uint64_t v15 = WTF::fastMalloc((WTF *)0x28);
    WebKit::ProcessThrottlerActivity::ProcessThrottlerActivity(v15, v14 + 200, "NSAttributedString serialization", 33, 1, 0);
    uint64_t v16 = WTF::fastMalloc((WTF *)0x10);
    *(_DWORD *)uint64_t v16 = 1;
    *(void *)(v16 + 8) = v15;
    uint64_t v17 = v38[6];
    v38[6] = v16;
    if (v17) {
      WTF::ThreadSafeRefCounted<WTF::Box<WTF::UniqueRef<WebKit::ProcessThrottlerActivity>>::Data,(WTF::DestructionThread)0>::deref(v17);
    }
    if (v14) {
      WTF::ThreadSafeRefCounted<WebKit::AuxiliaryProcessProxy,(WTF::DestructionThread)2>::deref((unsigned int *)(v14 + 16));
    }
  }
  _Block_object_dispose(&v37, 8);
  uint64_t v18 = v43;
  uint64_t v43 = 0;
  if (v18) {
    WTF::ThreadSafeRefCounted<WTF::Box<WTF::UniqueRef<WebKit::ProcessThrottlerActivity>>::Data,(WTF::DestructionThread)0>::deref(v18);
  }
  _Block_object_dispose(&v44, 8);
  CFTypeRef v19 = cf;
  CFTypeRef cf = 0;
  if (v19) {
    CFRelease(v19);
  }
  _Block_object_dispose(&v51, 8);
  v20 = v57;
  v57 = 0;
  if (v20) {
    CFRelease(v20);
  }
  _Block_object_dispose(&v58, 8);
  v21 = v64;
  v64 = 0;
  if (v21) {
    CFRelease(v21);
  }
  _Block_object_dispose(&v65, 8);
}

void __90__NSAttributedString_WKPrivate___loadFromHTMLWithOptions_contentLoader_completionHandler___block_invoke_215(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v9 = *(void *)(v8 + 48);
    *(void *)(v8 + 48) = 0;
    if (v9) {
      WTF::ThreadSafeRefCounted<WTF::Box<WTF::UniqueRef<WebKit::ProcessThrottlerActivity>>::Data,(WTF::DestructionThread)0>::deref(v9);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 48) setNavigationDelegate:0];
    uint64_t v10 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v11 = *(const void **)(v10 + 48);
    *(void *)(v10 + 48) = 0;
    if (v11) {
      CFRelease(v11);
    }
    uint64_t v12 = *(void *)(*(void *)(a1 + 80) + 8);
    v13 = *(const void **)(v12 + 48);
    *(void *)(v12 + 48) = 0;
    if (v13) {
      CFRelease(v13);
    }
    if (!a4) {
      +[_WKAttributedStringWebViewCache cacheWebView:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 48)];
    }
    uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v15 = *(const void **)(v14 + 48);
    *(void *)(v14 + 48) = 0;
    if (v15) {
      CFRelease(v15);
    }
    if (!a2 || (uint64_t v16 = *(void *)(a1 + 32), v16 == objc_opt_class())) {
      uint64_t v17 = 0;
    }
    else {
      uint64_t v17 = (const void *)[objc_alloc(*(Class *)(a1 + 32)) initWithAttributedString:a2];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v18 = (const void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:a3];
    }
    else {
      uint64_t v18 = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    if (v18) {
      CFRelease(v18);
    }
    if (v17)
    {
      CFRelease(v17);
    }
  }
}

void __90__NSAttributedString_WKPrivate___loadFromHTMLWithOptions_contentLoader_completionHandler___block_invoke_2(uint64_t a1, WKErrorCode a2, const __CFString *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  createNSError(a2, a3, &cf);
  (*(void (**)(uint64_t, void, void, CFTypeRef))(v3 + 16))(v3, 0, 0, cf);
  CFTypeRef v4 = cf;
  CFTypeRef cf = 0;
  if (v4) {
    CFRelease(v4);
  }
}

uint64_t __90__NSAttributedString_WKPrivate___loadFromHTMLWithOptions_contentLoader_completionHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  unsigned int v4 = objc_msgSend((id)objc_msgSend(a2, "_mainFrameNavigation"), "isEqual:", *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 48));
  v5 = *(uint64_t (**)(uint64_t, void))(a3 + 16);

  return v5(a3, v4);
}

uint64_t __90__NSAttributedString_WKPrivate___loadFromHTMLWithOptions_contentLoader_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __90__NSAttributedString_WKPrivate___loadFromHTMLWithOptions_contentLoader_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __90__NSAttributedString_WKPrivate___loadFromHTMLWithOptions_contentLoader_completionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __90__NSAttributedString_WKPrivate___loadFromHTMLWithOptions_contentLoader_completionHandler___block_invoke_7(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24))
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void *)(*(void *)(result + 56) + 8);
    uint64_t v3 = *(const void **)(v2 + 48);
    *(void *)(v2 + 48) = 0;
    if (v3) {
      CFRelease(v3);
    }
    unsigned int v4 = *(void **)(*(void *)(*(void *)(v1 + 64) + 8) + 48);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __90__NSAttributedString_WKPrivate___loadFromHTMLWithOptions_contentLoader_completionHandler___block_invoke_8;
    v5[3] = &unk_1E5812018;
    long long v6 = *(_OWORD *)(v1 + 32);
    return [v4 _getContentsAsAttributedStringWithCompletionHandler:v5];
  }
  return result;
}

uint64_t __90__NSAttributedString_WKPrivate___loadFromHTMLWithOptions_contentLoader_completionHandler___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __90__NSAttributedString_WKPrivate___loadFromHTMLWithOptions_contentLoader_completionHandler___block_invoke_9(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

uint64_t __107__NSAttributedString_NSAttributedStringWebKitAdditions__loadFromHTMLWithRequest_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 loadRequest:*(void *)(a1 + 32)];
}

uint64_t __107__NSAttributedString_NSAttributedStringWebKitAdditions__loadFromHTMLWithFileURL_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"ReadAccessURL"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(void *)(a1 + 40);

  return [a2 loadFileURL:v6 allowingReadAccessToURL:v5];
}

uint64_t __106__NSAttributedString_NSAttributedStringWebKitAdditions__loadFromHTMLWithString_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F424D0]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(void *)(a1 + 40);

  return [a2 loadHTMLString:v6 baseURL:v5];
}

uint64_t __104__NSAttributedString_NSAttributedStringWebKitAdditions__loadFromHTMLWithData_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  CFStringRef v4 = (CFStringRef)[*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F42590]];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    CFStringRef v4 = 0;
  }
  uint64_t v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F424E8]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = (void *)v5;
  }
  else {
    uint64_t v6 = 0;
  }
  unint64_t v7 = [v6 unsignedIntegerValue];
  uint64_t v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F424D0]];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (v7) {
    BOOL v10 = v4 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10)
  {
    CFStringEncoding v11 = CFStringConvertNSStringEncodingToEncoding(v7);
    if (v11 == -1) {
      CFStringRef v4 = 0;
    }
    else {
      CFStringRef v4 = CFStringConvertEncodingToIANACharSetName(v11);
    }
  }
  if (isKindOfClass) {
    uint64_t v12 = v8;
  }
  else {
    uint64_t v12 = 0;
  }
  uint64_t v13 = *(void *)(a1 + 40);

  return [a2 loadData:v13 MIMEType:@"text/html" characterEncodingName:v4 baseURL:v12];
}

@end