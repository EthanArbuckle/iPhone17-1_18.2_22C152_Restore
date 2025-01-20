@interface HKBadge(KeyValueEntitySupport)
@end

@implementation HKBadge(KeyValueEntitySupport)

+ (void)badgeFromKeyValueRepresentation:()KeyValueEntitySupport .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C023000, a2, OS_LOG_TYPE_ERROR, "Invalid stored badge representation %zd", (uint8_t *)&v2, 0xCu);
}

@end