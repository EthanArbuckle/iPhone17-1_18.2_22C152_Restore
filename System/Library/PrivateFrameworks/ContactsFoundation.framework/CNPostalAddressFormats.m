@interface CNPostalAddressFormats
+ (id)_unitTestableLocalizedStringForPostalAddressString:(id)a3 returningNilIfNotFound:(BOOL)a4;
+ (id)addressFormats;
+ (id)localizedStringForPostalAddressString:(id)a3 returningNilIfNotFound:(BOOL)a4;
+ (id)makeLocalizer;
+ (id)sharedLocalizer;
@end

@implementation CNPostalAddressFormats

+ (id)localizedStringForPostalAddressString:(id)a3 returningNilIfNotFound:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [a1 sharedLocalizer];
  v8 = [v7 localizedStringForPostalAddressString:v6 returningNilIfNotFound:v4];

  return v8;
}

+ (id)sharedLocalizer
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__CNPostalAddressFormats_sharedLocalizer__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedLocalizer_cn_once_token_2 != -1) {
    dispatch_once(&sharedLocalizer_cn_once_token_2, block);
  }
  v2 = (void *)sharedLocalizer_cn_once_object_2;

  return v2;
}

uint64_t __41__CNPostalAddressFormats_sharedLocalizer__block_invoke(uint64_t a1)
{
  sharedLocalizer_cn_once_object_2 = [*(id *)(a1 + 32) makeLocalizer];

  return MEMORY[0x1F41817F8]();
}

+ (id)makeLocalizer
{
  v2 = +[CNEnvironmentBase currentEnvironment];
  [v2 isExtendedGreenTeaDevice];

  v3 = objc_opt_new();

  return v3;
}

+ (id)addressFormats
{
  return &unk_1EE04A780;
}

+ (id)_unitTestableLocalizedStringForPostalAddressString:(id)a3 returningNilIfNotFound:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [a1 makeLocalizer];
  v8 = [v7 localizedStringForPostalAddressString:v6 returningNilIfNotFound:v4];

  return v8;
}

@end