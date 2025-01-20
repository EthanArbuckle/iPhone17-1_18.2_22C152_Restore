@interface NSDictionary
@end

@implementation NSDictionary

void __60__NSDictionary_AVTSecureDecoding__avt_mutableContainersCopy__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = objc_msgSend(v5, "avt_mutableContainersCopy");

    id v5 = (id)v6;
  }
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v7];
}

@end