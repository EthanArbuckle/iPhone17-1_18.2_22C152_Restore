@interface ATXInspectionServerActionPredictionScoreLogger
@end

@implementation ATXInspectionServerActionPredictionScoreLogger

uint64_t __70___ATXInspectionServerActionPredictionScoreLogger_actionMetaDataItems__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

uint64_t __106___ATXInspectionServerActionPredictionScoreLogger_storeMetaDataFromActionContainerForKey_actionContainer___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 32) setObject:a1[6] forKeyedSubscript:a1[5]];
}

@end