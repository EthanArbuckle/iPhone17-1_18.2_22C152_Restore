@interface CNAutocompleteResult(Sorting)
@end

@implementation CNAutocompleteResult(Sorting)

- (void)compare:()Sorting .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1BEF57000, a2, OS_LOG_TYPE_DEBUG, "Comparison result: %ld", (uint8_t *)&v2, 0xCu);
}

@end