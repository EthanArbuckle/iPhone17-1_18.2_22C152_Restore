@interface NSData(IconServicesAdditions)
+ (id)__is__bookmarkDataWithContentsOfURL:()IconServicesAdditions;
+ (id)__is__dataWithContentsOfURL:()IconServicesAdditions;
- (id)__is__bookmarkResourcePropertyForKey:()IconServicesAdditions;
@end

@implementation NSData(IconServicesAdditions)

+ (id)__is__bookmarkDataWithContentsOfURL:()IconServicesAdditions
{
  id v3 = a3;
  uint64_t v7 = 0;
  v4 = (void *)MEMORY[0x1B3E70830](0, v3, &v7);
  if (!v4)
  {
    v5 = _ISDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      +[NSData(IconServicesAdditions) __is__bookmarkDataWithContentsOfURL:v5];
    }
  }
  return v4;
}

- (id)__is__bookmarkResourcePropertyForKey:()IconServicesAdditions
{
  id v3 = (void *)MEMORY[0x1B3E70840](0, a3, a1);
  return v3;
}

+ (id)__is__dataWithContentsOfURL:()IconServicesAdditions
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    unsigned int v5 = objc_msgSend(v3, "_IF_isOnBootVolume");
    v6 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v4 options:v5 error:0];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (void)__is__bookmarkDataWithContentsOfURL:()IconServicesAdditions .cold.1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a2;
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_1AE771000, log, OS_LOG_TYPE_DEBUG, "Failed to read bookmarkm data from URL %@ with error: %@", (uint8_t *)&v4, 0x16u);
}

@end