@interface UIKit
@end

@implementation UIKit

uint64_t __43__UIKit_PKSubsystem_beginUsing_withBundle___block_invoke(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(result + 32) + 8))
  {
    uint64_t v1 = result;
    objc_msgSend(*(id *)(result + 32), "setInfoDictionary:", objc_msgSend(*(id *)(result + 40), "bundleInfoDictionary"));
    id v2 = (id)objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(v1 + 32) + 16), "objectForKey:", @"NSExtension"), "mutableCopy");
    uint64_t v3 = [v2 objectForKey:@"NSExtensionMainStoryboard"];
    if (!v3) {
      uint64_t v3 = [v2 objectForKey:@"NSExtensionMainStoryboard~ipad"];
    }
    id v4 = (id)[v2 objectForKey:@"NSExtensionPrincipalClass"];
    if (v4)
    {
      if (v3) {
        goto LABEL_10;
      }
    }
    else
    {
      id v4 = [(NSDictionary *)[+[NSBundle mainBundle] infoDictionary] objectForKey:@"NSExtensionPrincipalClass"];
      if (v3) {
        goto LABEL_10;
      }
    }
    Class Class = objc_getClass((const char *)[v4 UTF8String]);
    if ((objc_opt_respondsToSelector() & 1) == 0
      || ![(objc_class *)Class _initializedByViewServices])
    {
      uint64_t v6 = 1;
      goto LABEL_12;
    }
LABEL_10:
    [(objc_class *)objc_getClass("_UIViewServiceSessionManager") startViewServiceSessionManagerAsPlugin:1];
    uint64_t v6 = 0;
LABEL_12:
    result = +[_NSExtensionContextVendor _startListening:v6];
    *(unsigned char *)(*(void *)(v1 + 32) + 8) = 1;
  }
  return result;
}

id __35__UIKit_PKSubsystem_sharedInstance__block_invoke(uint64_t a1)
{
  id result = objc_alloc_init(*(Class *)(a1 + 32));
  _MergedGlobals_154 = (uint64_t)result;
  return result;
}

@end