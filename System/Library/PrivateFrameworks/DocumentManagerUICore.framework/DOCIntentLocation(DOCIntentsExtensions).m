@interface DOCIntentLocation(DOCIntentsExtensions)
@end

@implementation DOCIntentLocation(DOCIntentsExtensions)

+ (void)imageForType:()DOCIntentsExtensions .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  v3 = "+[DOCIntentLocation(DOCIntentsExtensions) imageForType:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_fault_impl(&dword_222E2D000, a2, OS_LOG_TYPE_FAULT, "%s encountered enexpected location type: %@", (uint8_t *)&v2, 0x16u);
}

@end