@interface DDS
@end

@implementation DDS

uint64_t __DDS_IS_INTERNAL_INSTALL_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  DDS_IS_INTERNAL_INSTALL_is_internal_install = result;
  return result;
}

void __DDS_BUILD_VERSION_STRING_block_invoke()
{
  uint64_t v0 = MGCopyAnswerWithError();
  v1 = (void *)DDS_BUILD_VERSION_STRING_build;
  DDS_BUILD_VERSION_STRING_build = v0;
}

uint64_t __DDS_STRING_FROM_DATE_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)DDS_STRING_FROM_DATE_formatter;
  DDS_STRING_FROM_DATE_formatter = (uint64_t)v0;

  v2 = [MEMORY[0x1E4F1CA20] systemLocale];
  [(id)DDS_STRING_FROM_DATE_formatter setLocale:v2];

  v3 = (void *)DDS_STRING_FROM_DATE_formatter;
  return [v3 setDateFormat:@"yyyy-MM-dd_HH:mm:ss"];
}

@end