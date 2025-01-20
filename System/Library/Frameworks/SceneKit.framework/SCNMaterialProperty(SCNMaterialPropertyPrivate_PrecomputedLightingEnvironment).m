@interface SCNMaterialProperty(SCNMaterialPropertyPrivate_PrecomputedLightingEnvironment)
@end

@implementation SCNMaterialProperty(SCNMaterialPropertyPrivate_PrecomputedLightingEnvironment)

+ (void)precomputedLightingEnvironmentDataForContents:()SCNMaterialPropertyPrivate_PrecomputedLightingEnvironment device:error:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "slot";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Null argument", (uint8_t *)&v1, 0xCu);
}

@end