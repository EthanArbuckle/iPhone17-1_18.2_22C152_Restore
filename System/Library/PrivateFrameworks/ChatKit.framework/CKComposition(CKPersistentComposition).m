@interface CKComposition(CKPersistentComposition)
@end

@implementation CKComposition(CKPersistentComposition)

- (void)_persistTextToComposition:()CKPersistentComposition directoryURL:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_persistTextToComposition:()CKPersistentComposition directoryURL:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18EF18000, a2, OS_LOG_TYPE_ERROR, "-> Error: could not archive persistentText. Found error: %@", (uint8_t *)&v2, 0xCu);
}

@end