@interface ABDynamicLoaderAccessibility
+ (BOOL)loadFrameworkAtPath:(id)a3 andStoreHandle:(void *)a4 bundle:(id *)a5 logging:(BOOL)a6;
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
@end

@implementation ABDynamicLoaderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ABDynamicLoader";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

+ (BOOL)loadFrameworkAtPath:(id)a3 andStoreHandle:(void *)a4 bundle:(id *)a5 logging:(BOOL)a6
{
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___ABDynamicLoaderAccessibility;
  unsigned int v7 = objc_msgSendSuper2(&v12, sel_loadFrameworkAtPath_andStoreHandle_bundle_logging_, a3, a4, a5, a6);
  BOOL v8 = v7;
  if (a5 && v7 && *a5)
  {
    id v11 = *a5;
    id v9 = v11;
    AXPerformBlockOnMainThreadAfterDelay();
  }
  return v8;
}

uint64_t __82__ABDynamicLoaderAccessibility_loadFrameworkAtPath_andStoreHandle_bundle_logging___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isLoaded] & 1) == 0) {
    [*(id *)(a1 + 32) load];
  }
  v2 = (void *)MEMORY[0x263F811C8];
  uint64_t v3 = *(void *)(a1 + 32);

  return [v2 loadAccessibilityBundleForBundle:v3 didLoadCallback:0 force:1 loadAllAccessibilityInfo:0];
}

@end