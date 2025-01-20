@interface _DKObject(MOConversion)
@end

@implementation _DKObject(MOConversion)

- (void)copyToManagedObject:()MOConversion .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v6 = [a1 creationDate];
  OUTLINED_FUNCTION_1();
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  __int16 v10 = 2112;
  v11 = a1;
  _os_log_fault_impl(&dword_18ECEB000, a3, OS_LOG_TYPE_FAULT, "rdar://77234991 encountered event with non-matching dates (creationDate %@, now %@): %@", v7, 0x20u);
}

@end