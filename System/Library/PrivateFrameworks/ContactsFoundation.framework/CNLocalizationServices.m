@interface CNLocalizationServices
+ (CNLocalizationServices)defaultServices;
- (id)localizedStringForKey:(id)a3 value:(id)a4 table:(id)a5 bundleForClass:(Class)a6 comment:(id)a7;
@end

@implementation CNLocalizationServices

+ (CNLocalizationServices)defaultServices
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__CNLocalizationServices_defaultServices__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultServices_cn_once_token_1 != -1) {
    dispatch_once(&defaultServices_cn_once_token_1, block);
  }
  v2 = (void *)defaultServices_cn_once_object_1;

  return (CNLocalizationServices *)v2;
}

uint64_t __41__CNLocalizationServices_defaultServices__block_invoke(uint64_t a1)
{
  defaultServices_cn_once_object_1 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

- (id)localizedStringForKey:(id)a3 value:(id)a4 table:(id)a5 bundleForClass:(Class)a6 comment:(id)a7
{
  v10 = (void *)MEMORY[0x1E4F28B50];
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [v10 bundleForClass:a6];
  v15 = [v14 localizedStringForKey:v13 value:v12 table:v11];

  return v15;
}

@end