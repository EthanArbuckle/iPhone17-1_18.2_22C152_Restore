@interface _DKHistogram(CoreData)
@end

@implementation _DKHistogram(CoreData)

- (void)initWithManagedObject:()CoreData .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_ERROR, "Encountered HistogramMO without a value: %@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithManagedObject:()CoreData .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_ERROR, "Encountered HistogramMO without count: %@", (uint8_t *)&v2, 0xCu);
}

@end