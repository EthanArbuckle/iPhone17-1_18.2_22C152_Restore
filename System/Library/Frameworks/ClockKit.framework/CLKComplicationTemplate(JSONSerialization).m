@interface CLKComplicationTemplate(JSONSerialization)
@end

@implementation CLKComplicationTemplate(JSONSerialization)

+ (void)createJSONRepresentationFromDictionary:()JSONSerialization bundlePath:purpose:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21C599000, v2, v3, "Cannot encode class: %@ since it does not respond to JSONObjectRepresentation or JSONObjectRepresentationWritingResourcesToBundlePath, or is not a NSJSONSerialization compatible class", v4, v5, v6, v7, v8);
}

+ (void)objectFromJSON:()JSONSerialization bundle:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_21C599000, v0, OS_LOG_TYPE_ERROR, "embeddedSuperclass is nil so the value cannot be encoded, embeddedClass is: %@", v1, 0xCu);
}

+ (void)objectFromJSON:()JSONSerialization bundle:.cold.2(void *a1, uint64_t a2)
{
  uint64_t v2 = [a1 objectForKeyedSubscript:a2];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21C599000, v3, v4, "Cannot encode class: %@ since it is not a supported CLK type", v5, v6, v7, v8, v9);
}

+ (void)objectFromJSON:()JSONSerialization bundle:.cold.3(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = 0;
  _os_log_error_impl(&dword_21C599000, log, OS_LOG_TYPE_ERROR, "embeddedClass is nil so the value cannot be encoded, embeddedClass is: %@", (uint8_t *)&v1, 0xCu);
}

+ (void)_jsonObjectRepresentationFromObject:()JSONSerialization bundlePath:purpose:.cold.1()
{
  os_log_t v0 = (objc_class *)objc_opt_class();
  int v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21C599000, v2, v3, "Class %@ is not compatible with JSONSerialization.", v4, v5, v6, v7, v8);
}

@end