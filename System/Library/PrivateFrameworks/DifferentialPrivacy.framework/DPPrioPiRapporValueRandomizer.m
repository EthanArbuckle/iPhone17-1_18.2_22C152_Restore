@interface DPPrioPiRapporValueRandomizer
@end

@implementation DPPrioPiRapporValueRandomizer

uint64_t __72___DPPrioPiRapporValueRandomizer_encodeClassIndices_withDimensionality___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (!*(void *)(a1 + 48)) {
    return 1;
  }
  uint64_t v6 = 0;
  while (1)
  {
    uint64_t v7 = *(unsigned int *)(*(void *)(a1 + 56) + 4 * v6);
    unint64_t v8 = v7 + v6 * [*(id *)(a1 + 32) prime];
    if (v8 >= a3) {
      break;
    }
    uint64_t result = 1;
    *(_DWORD *)(a2 + 4 * v8) = 1;
    if ((unint64_t)++v6 >= *(void *)(a1 + 48)) {
      return result;
    }
  }
  v10 = +[_DPLog framework];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    __72___DPPrioPiRapporValueRandomizer_encodeClassIndices_withDimensionality___block_invoke_cold_1(a1, v6, v10);
  }

  return 0;
}

void __72___DPPrioPiRapporValueRandomizer_encodeClassIndices_withDimensionality___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v4 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a2];
  [v4 unsignedIntegerValue];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1DC55E000, a3, OS_LOG_TYPE_ERROR, "Prio algorithm cannot encode the Pi-Rappor results generated for class index %lu.", v5, 0xCu);
}

@end