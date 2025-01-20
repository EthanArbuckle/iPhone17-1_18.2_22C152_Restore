@interface ATXUnifiedActivityStreamConversions
@end

@implementation ATXUnifiedActivityStreamConversions

id __80___ATXUnifiedActivityStreamConversions_transitionPublisherFromSessionPublisher___block_invoke(uint64_t a1, void *a2)
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = [ATXUnifiedInferredActivityTransition alloc];
  [v2 startTime];
  double v5 = v4;
  v6 = [v2 source];
  uint64_t v7 = [v2 inferredActivityType];
  [v2 confidence];
  id v9 = [(ATXUnifiedInferredActivityTransition *)v3 initFromTransitionTime:1 isEntryEvent:v6 source:v7 activityType:v5 confidence:v8];
  v21[0] = v9;
  v10 = [ATXUnifiedInferredActivityTransition alloc];
  [v2 endTime];
  double v12 = v11;
  v13 = [v2 source];
  uint64_t v14 = [v2 inferredActivityType];
  [v2 confidence];
  double v16 = v15;

  id v17 = [(ATXUnifiedInferredActivityTransition *)v10 initFromTransitionTime:0 isEntryEvent:v13 source:v14 activityType:v12 confidence:v16];
  v21[1] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];

  v19 = [v18 bpsPublisher];

  return v19;
}

id __80___ATXUnifiedActivityStreamConversions_sessionPublisherFromTransitionPublisher___block_invoke(uint64_t a1, void *a2, void *a3)
{
  double v4 = (void *)MEMORY[0x1E4F93BB8];
  id v5 = a3;
  v6 = [a2 second];
  uint64_t v7 = [v4 tupleWithFirst:v6 second:v5];

  return v7;
}

uint64_t __80___ATXUnifiedActivityStreamConversions_sessionPublisherFromTransitionPublisher___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 first];
  if (v3)
  {
    double v4 = [v2 second];
    if (v4)
    {
      id v5 = [v2 first];
      int v6 = [v5 isEntryEvent];
      uint64_t v7 = [v2 second];
      uint64_t v8 = v6 ^ [v7 isEntryEvent];
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

id __80___ATXUnifiedActivityStreamConversions_sessionPublisherFromTransitionPublisher___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 first];
  int v4 = [v3 isEntryEvent];

  id v5 = [ATXUnifiedInferredActivitySession alloc];
  int v6 = [v2 first];
  [v6 transitionTime];
  double v8 = v7;
  id v9 = [v2 second];
  [v9 transitionTime];
  double v11 = v10;
  double v12 = [v2 first];
  v13 = [v12 source];
  uint64_t v14 = [v2 first];
  double v15 = v14;
  if (v4)
  {
    uint64_t v16 = [v14 inferredActivityType];
    id v17 = [v2 first];

    [v17 confidence];
    id v19 = [(ATXUnifiedInferredActivitySession *)v5 initFromStartTime:v13 endTime:v16 source:v8 activityType:v11 confidence:v18];
  }
  else
  {

    [v15 confidence];
    id v19 = [(ATXUnifiedInferredActivitySession *)v5 initFromStartTime:v13 endTime:14 source:v8 activityType:v11 confidence:v20];
  }

  return v19;
}

BOOL __80___ATXUnifiedActivityStreamConversions_sessionPublisherFromTransitionPublisher___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 endTime];
  double v4 = v3;
  [v2 startTime];
  double v6 = v5;

  return v4 - v6 > 1.0;
}

@end