@interface NSAttributedString(WKPrivate)
+ (void)_loadFromHTMLWithOptions:()WKPrivate contentLoader:completionHandler:;
@end

@implementation NSAttributedString(WKPrivate)

+ (void)_loadFromHTMLWithOptions:()WKPrivate contentLoader:completionHandler:
{
  uint64_t v9 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F425D0]];
  v10 = (void *)MEMORY[0x1E4F1C3C8];
  if (v9) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"NSWebPreferencesDocumentOption option is not supported"];
  }
  if ([a3 objectForKeyedSubscript:*MEMORY[0x1E4F425D8]]) {
    [MEMORY[0x1E4F1CA00] raise:*v10 format:@"NSWebResourceLoadDelegateDocumentOption option is not supported"];
  }
  if ([a3 objectForKeyedSubscript:@"WebPolicyDelegate"]) {
    [MEMORY[0x1E4F1CA00] raise:*v10 format:@"WebPolicyDelegate option is not supported"];
  }
  v12 = __90__NSAttributedString_WKPrivate___loadFromHTMLWithOptions_contentLoader_completionHandler___block_invoke;
  v13 = &unk_1E5812090;
  v14 = a3;
  uint64_t v15 = a1;
  uint64_t v16 = a5;
  uint64_t v17 = a4;
  if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", MEMORY[0x1E4F143A8], 3221225472)) {
    v12((uint64_t)&v11);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], &v11);
  }
}

@end