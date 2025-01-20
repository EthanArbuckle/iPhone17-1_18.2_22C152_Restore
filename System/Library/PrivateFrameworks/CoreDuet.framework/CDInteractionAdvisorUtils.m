@interface CDInteractionAdvisorUtils
@end

@implementation CDInteractionAdvisorUtils

BOOL __157___CDInteractionAdvisorUtils_adviceBasedOnInteractions_forContacts_andRanker_ignoringContacts_withLimit_aggregateByIdentifier_requireOneOutgoingInteraction___block_invoke(uint64_t a1, void *a2)
{
  return [a2 similarOutgoingInteractionsCount] > 0;
}

uint64_t __73___CDInteractionAdvisorUtils_rankContacts_basedOnInteractions_andRanker___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  v7 = [a2 identifier];
  v8 = [v5 objectForKeyedSubscript:v7];
  [v8 doubleValue];
  double v10 = v9;

  v11 = *(void **)(a1 + 32);
  v12 = [v6 identifier];

  v13 = [v11 objectForKeyedSubscript:v12];
  [v13 doubleValue];
  double v15 = v14;

  if (v10 <= v15) {
    uint64_t v16 = 0;
  }
  else {
    uint64_t v16 = -1;
  }
  if (v10 < v15) {
    return 1;
  }
  else {
    return v16;
  }
}

@end