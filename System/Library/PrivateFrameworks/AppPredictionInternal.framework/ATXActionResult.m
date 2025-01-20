@interface ATXActionResult
- (ATXActionResult)initWithScoredAction:(id)a3 predictionItem:(const ATXPredictionItem *)a4 actionKey:(id)a5;
- (ATXScoredPrediction)scoredAction;
- (BOOL)isSampledResultForLoggingOnly;
- (NSString)actionKey;
- (const)predictionItem;
- (id).cxx_construct;
- (id)description;
- (id)initForLoggingWithPredictionItem:(const ATXPredictionItem *)a3;
- (void)setPredictionItem:(const ATXPredictionItem *)a3;
@end

@implementation ATXActionResult

- (BOOL)isSampledResultForLoggingOnly
{
  return !self->_scoredAction
      && [(NSString *)self->_actionKey isEqualToString:@"predictionItem"];
}

- (ATXActionResult)initWithScoredAction:(id)a3 predictionItem:(const ATXPredictionItem *)a4 actionKey:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)ATXActionResult;
  v11 = [(ATXActionResult *)&v24 init];
  v12 = v11;
  v13 = v11;
  if (v11)
  {
    if (a4)
    {
      v11->_hasPredictionItem = 1;
      objc_storeStrong((id *)&v11->_predictionItem.key, a4->key);
      p_actionHash = &v12->_predictionItem.actionHash;
      v15 = &a4->actionHash;
    }
    else
    {
      v11->_hasPredictionItem = 0;
      v22[819] = -31337.0;
      __int16 v23 = 0;
      for (uint64_t i = 16; i != 3284; i += 4)
        *(float *)&v21[i] = -31337.0;
      key = v11->_predictionItem.key;
      v11->_predictionItem.key = 0;

      p_actionHash = &v12->_predictionItem.actionHash;
      v15 = (unint64_t *)v22;
    }
    memcpy(p_actionHash, v15, 0xCD2uLL);
    uint64_t v18 = [v10 copy];
    actionKey = v13->_actionKey;
    v13->_actionKey = (NSString *)v18;

    objc_storeStrong((id *)&v12->_scoredAction, a3);
  }

  return v13;
}

- (id)initForLoggingWithPredictionItem:(const ATXPredictionItem *)a3
{
  return [(ATXActionResult *)self initWithScoredAction:0 predictionItem:a3 actionKey:@"predictionItem"];
}

- (void)setPredictionItem:(const ATXPredictionItem *)a3
{
  if (a3)
  {
    self->_hasPredictionItem = 1;
    p_actionHash = &a3->actionHash;
    objc_storeStrong((id *)&self->_predictionItem.key, a3->key);
    memcpy(&self->_predictionItem.actionHash, p_actionHash, 0xCD2uLL);
  }
  else
  {
    self->_hasPredictionItem = 0;
    v8[819] = -31337.0;
    LOWORD(v8[820]) = 0;
    for (uint64_t i = 16; i != 3284; i += 4)
      *(float *)&v7[i] = -31337.0;
    key = self->_predictionItem.key;
    self->_predictionItem.key = 0;

    memcpy(&self->_predictionItem.actionHash, v8, 0xCD2uLL);
  }
}

- (const)predictionItem
{
  if (self->_hasPredictionItem) {
    return &self->_predictionItem;
  }
  else {
    return 0;
  }
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<Key: %@ Scored Action: %@>", self->_actionKey, self->_scoredAction];
  return v2;
}

- (ATXScoredPrediction)scoredAction
{
  return self->_scoredAction;
}

- (NSString)actionKey
{
  return self->_actionKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionKey, 0);
  objc_storeStrong((id *)&self->_scoredAction, 0);
  key = self->_predictionItem.key;
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((float *)self + 823) = -31337.0;
  *((_WORD *)self + 1648) = 0;
  for (uint64_t i = 24; i != 3292; i += 4)
    *(float *)((char *)self + i) = -31337.0;
  return self;
}

@end