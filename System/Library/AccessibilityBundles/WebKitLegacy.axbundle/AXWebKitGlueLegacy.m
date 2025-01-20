@interface AXWebKitGlueLegacy
+ (void)__webKitInitialized;
+ (void)_webKitInitialized;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXWebKitGlueLegacy

+ (void)accessibilityInitializeBundle
{
  if (_UIApplicationIsWebKitLoaded())
  {
    [a1 _webKitInitialized];
  }
  else
  {
    id v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:a1 selector:sel__webKitInitialized name:@"UIApplicationLoadedWebKit" object:0];
  }
}

+ (void)_webKitInitialized
{
}

uint64_t __40__AXWebKitGlueLegacy__webKitInitialized__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__webKitInitialized");
}

+ (void)__webKitInitialized
{
  if (__webKitInitialized_onceToken != -1) {
    dispatch_once(&__webKitInitialized_onceToken, &__block_literal_global_0);
  }
  id v2 = [MEMORY[0x263F21388] sharedInstance];
  [v2 addHandler:&__block_literal_global_357 forFramework:@"DataDetectors"];
}

void __41__AXWebKitGlueLegacy___webKitInitialized__block_invoke()
{
  id v0 = [MEMORY[0x263F21400] sharedInstance];
  [v0 performValidations:&__block_literal_global_272 withPreValidationHandler:&__block_literal_global_324 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_333];
}

uint64_t __41__AXWebKitGlueLegacy___webKitInitialized__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"WebPDFView", @"doc", "^{CGPDFDocument=}", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"WebView", @"_UIKitDelegate", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"WAKScrollView", @"contentView", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"WebHTMLView", @"_accessibilityParentForSubview:", "@", "@", 0);
  [v2 validateClass:@"UIWebBrowserView" hasInstanceVariable:@"_overflowScrollViews" withType:"NSMutableSet"];
  [v2 validateClass:@"UIWebOverflowScrollView"];
  [v2 validateClass:@"UIWebOverflowScrollView" hasInstanceVariable:@"_overflowContentView" withType:"UIWebOverflowContentView"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UIWebView", @"webView: didFinishLoadForFrame:", "v", "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UIWebBrowserView", @"assistFormNode:", "v", "@", 0);

  return 1;
}

uint64_t __41__AXWebKitGlueLegacy___webKitInitialized__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"WebKitLegacy AX Bundle"];
  [v2 setOverrideProcessName:@"WebKitLegacy"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F09468]();
}

void __41__AXWebKitGlueLegacy___webKitInitialized__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"UIWebViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UIWebDocumentViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"DOMNodeAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UIWebBrowserViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"WebHTMLViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"WebViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"WebPDFViewAccessibility" canInteractWithTargetClass:1];
}

void __41__AXWebKitGlueLegacy___webKitInitialized__block_invoke_5()
{
  id v0 = [MEMORY[0x263F21400] sharedInstance];
  [v0 performValidations:&__block_literal_global_359 withPreValidationHandler:&__block_literal_global_371 postValidationHandler:0 safeCategoryInstallationHandler:0];
}

uint64_t __41__AXWebKitGlueLegacy___webKitInitialized__block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"DDDetectionController", @"sharedController", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"DDDetectionController", @"_resultForURL: forContainer: context:", "^{__DDResult=}", "@", "@", "@", 0);

  return 1;
}

uint64_t __41__AXWebKitGlueLegacy___webKitInitialized__block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"DataDetectorsWebKit AX Bundle"];
  [v2 setOverrideProcessName:@"DataDetectorsWebKit"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F09468]();
}

@end