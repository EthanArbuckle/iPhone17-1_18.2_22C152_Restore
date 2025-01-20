@interface WKWebExtensionLocalization
@end

@implementation WKWebExtensionLocalization

id __55___WKWebExtensionLocalization__localizedArrayForArray___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [*(id *)(a1 + 32) localizedStringForString:v4];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [*(id *)(a1 + 32) _localizedArrayForArray:v4];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_8;
      }
      uint64_t v5 = [*(id *)(a1 + 32) localizedDictionaryForDictionary:v4];
    }
  }
  v6 = (void *)v5;

  id v4 = v6;
LABEL_8:

  return v4;
}

@end