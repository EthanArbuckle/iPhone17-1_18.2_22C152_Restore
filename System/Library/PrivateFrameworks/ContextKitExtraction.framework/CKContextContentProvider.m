@interface CKContextContentProvider
+ (id)handlePDFView:(id)a3 withExecutor:(id)a4;
+ (unsigned)controlCodeForExecutor:(id)a3;
+ (void)extractContentFromWebViewPDFData:(id)a3 withCompletionHandler:(id)a4;
- (double)timeout;
- (void)extractUsingExecutor:(id)a3;
@end

@implementation CKContextContentProvider

- (void)extractUsingExecutor:(id)a3
{
}

- (double)timeout
{
  return 0.0;
}

+ (unsigned)controlCodeForExecutor:(id)a3
{
  v3 = [a3 context];
  unsigned __int8 v4 = +[CKContextContentProviderManager controlCodeForNonce:](CKContextContentProviderManager, "controlCodeForNonce:", [v3 nonce]);

  return v4;
}

+ (id)handlePDFView:(id)a3 withExecutor:(id)a4
{
  id v4 = a3;
  v5 = [v4 currentSelection];
  v6 = [v5 string];

  if (![v6 length])
  {
    v7 = [v4 currentPage];
    uint64_t v8 = [v7 string];

    v6 = (void *)v8;
  }

  return v6;
}

+ (void)extractContentFromWebViewPDFData:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5)
  {
    uint64_t v8 = dispatch_queue_create("CKContextContentProviderUIScene WebView PDF Queue", 0);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __83__CKContextContentProvider_extractContentFromWebViewPDFData_withCompletionHandler___block_invoke;
    v9[3] = &unk_1E6111028;
    id v10 = v5;
    id v11 = v7;
    dispatch_async(v8, v9);
  }
  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

void __83__CKContextContentProvider_extractContentFromWebViewPDFData_withCompletionHandler___block_invoke(uint64_t a1)
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    LOWORD(v14[0]) = 0;
    _os_log_impl(&dword_1B56AD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "The web view is displaying an encrypted PDF.", (uint8_t *)v14, 2u);
  }
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2050000000;
  v2 = (void *)getPDFDocumentClass_softClass;
  uint64_t v18 = getPDFDocumentClass_softClass;
  if (!getPDFDocumentClass_softClass)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __getPDFDocumentClass_block_invoke;
    v14[3] = &unk_1E6110F98;
    v14[4] = &v15;
    __getPDFDocumentClass_block_invoke((uint64_t)v14);
    v2 = (void *)v16[3];
  }
  v3 = v2;
  _Block_object_dispose(&v15, 8);
  id v4 = (void *)[[v3 alloc] initWithData:*(void *)(a1 + 32)];
  unint64_t v5 = [v4 pageCount];
  if (v5 >= 2) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = v5;
  }
  if (v6)
  {
    uint64_t v7 = 0;
    uint64_t v8 = &stru_1F0E5E050;
    do
    {
      v9 = [v4 pageAtIndex:v7];
      uint64_t v10 = [v9 string];
      id v11 = (void *)v10;
      if (v10) {
        v12 = (__CFString *)v10;
      }
      else {
        v12 = &stru_1F0E5E050;
      }
      v13 = [(__CFString *)v8 stringByAppendingString:v12];

      uint64_t v8 = [v13 stringByAppendingString:@"\n\n"];

      ++v7;
    }
    while (v6 != v7);
  }
  else
  {
    uint64_t v8 = &stru_1F0E5E050;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end