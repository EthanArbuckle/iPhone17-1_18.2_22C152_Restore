@interface WKWebExtensionWebNavigationURLFilter
@end

@implementation WKWebExtensionWebNavigationURLFilter

void __76___WKWebExtensionWebNavigationURLFilter_initWithDictionary_outErrorMessage___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  v9 = [_WKWebExtensionWebNavigationURLPredicate alloc];
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v10 + 40);
  v11 = [(_WKWebExtensionWebNavigationURLPredicate *)v9 initWithTypeString:v7 value:v8 outErrorMessage:&obj];
  objc_storeStrong((id *)(v10 + 40), obj);
  if (v11) {
    [*(id *)(a1 + 32) addObject:v11];
  }
  else {
    *a4 = 1;
  }
}

@end