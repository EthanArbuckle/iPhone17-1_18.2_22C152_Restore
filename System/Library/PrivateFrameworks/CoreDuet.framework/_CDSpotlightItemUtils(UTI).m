@interface _CDSpotlightItemUtils(UTI)
@end

@implementation _CDSpotlightItemUtils(UTI)

+ (void)getInteractionMechanismForContentUTI:()UTI typeTree:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18ECEB000, log, OS_LOG_TYPE_ERROR, "Missing contentUTI type for interaction", v1, 2u);
}

+ (void)getInteractionMechanismForContentUTI:()UTI typeTree:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_ERROR, "Couldn't find matching content UTI: current: %@", (uint8_t *)&v2, 0xCu);
}

@end