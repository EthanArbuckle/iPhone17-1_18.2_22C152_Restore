@interface WKWebView(AuthKit)
+ (id)ak_idpWebViewWithFrame:()AuthKit idpHandler:;
@end

@implementation WKWebView(AuthKit)

+ (id)ak_idpWebViewWithFrame:()AuthKit idpHandler:
{
  v11 = (objc_class *)MEMORY[0x1E4F466F8];
  id v12 = a7;
  id v13 = objc_alloc_init(v11);
  v14 = [MEMORY[0x1E4F46710] nonPersistentDataStore];
  [v13 setWebsiteDataStore:v14];

  [v13 setSuppressesIncrementalRendering:1];
  [v13 setMediaTypesRequiringUserActionForPlayback:-1];
  [v13 _setCanShowWhileLocked:1];
  v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F466F0]), "initWithFrame:configuration:", v13, a1, a2, a3, a4);
  [v15 setNavigationDelegate:v12];

  return v15;
}

@end