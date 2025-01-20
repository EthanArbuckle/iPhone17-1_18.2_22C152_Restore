@interface NSDictionary
@end

@implementation NSDictionary

void __58__NSDictionary_CDMRecursiveSearch___cdm_hasKey_withValue___block_invoke(void *a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = objc_msgSend(v6, "_cdm_hasKey:withValue:", a1[4], a1[5]);
  }
  *a4 = *(unsigned char *)(*(void *)(a1[6] + 8) + 24);
}

@end