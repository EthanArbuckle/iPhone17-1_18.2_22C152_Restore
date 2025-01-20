@interface ATXInspectionServerPredictionScoreLogger
@end

@implementation ATXInspectionServerPredictionScoreLogger

void __63___ATXInspectionServerPredictionScoreLogger_inputsAndSubscores__block_invoke(uint64_t a1)
{
}

uint64_t __56___ATXInspectionServerPredictionScoreLogger_stageScores__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

void __77___ATXInspectionServerPredictionScoreLogger_logInputs_subscores_forBundleId___block_invoke(void *a1)
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v5[0] = @"inputs";
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:a1[6]];
  v5[1] = @"subscores";
  v6[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:a1[7]];
  v6[1] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  [*(id *)(a1[4] + 16) setObject:v4 forKeyedSubscript:a1[5]];
}

void *__73___ATXInspectionServerPredictionScoreLogger_logStageScores_forStageType___block_invoke(void *result)
{
  unint64_t v1 = result[6];
  if (v1 <= 2) {
    return (void *)[*(id *)(result[4] + 24) setObject:result[5] forKey:off_1E68B4348[v1]];
  }
  return result;
}

@end