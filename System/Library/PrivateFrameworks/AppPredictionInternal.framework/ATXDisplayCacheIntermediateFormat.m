@interface ATXDisplayCacheIntermediateFormat
+ (id)fromActions:(id)a3;
- (NSArray)actions;
- (NSArray)predictionChunks;
- (NSIndexSet)lockscreenPredictionIndices;
@end

@implementation ATXDisplayCacheIntermediateFormat

+ (id)fromActions:(id)a3
{
  id v3 = a3;
  v4 = objc_msgSend(v3, "atx_actionsFromActionResults");
  uint64_t v5 = +[ATXDisplayCacheLockscreenFilter indicesOfLockScreenActionsForActionPredictions:v4];
  v6 = +[ATXActionCacheBuilder serializedChunksFromActionPredictionResults:v3 lockscreenPredictionIndices:v5];
  v7 = objc_opt_new();
  v8 = (void *)v7[1];
  v7[1] = v4;
  id v9 = v4;

  v10 = (void *)v7[2];
  v7[2] = v6;
  id v11 = v6;

  v12 = (void *)v7[3];
  v7[3] = v5;

  return v7;
}

- (NSArray)actions
{
  return self->_actions;
}

- (NSArray)predictionChunks
{
  return self->_predictionChunks;
}

- (NSIndexSet)lockscreenPredictionIndices
{
  return self->_lockscreenPredictionIndices;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockscreenPredictionIndices, 0);
  objc_storeStrong((id *)&self->_predictionChunks, 0);
  objc_storeStrong((id *)&self->_actions, 0);
}

@end