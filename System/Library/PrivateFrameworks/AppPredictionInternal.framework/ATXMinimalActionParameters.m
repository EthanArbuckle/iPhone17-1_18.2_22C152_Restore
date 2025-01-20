@interface ATXMinimalActionParameters
- (ATXMinimalActionParameters)initWithMinimalSlotResolutionParameters:(id)a3 actionTime:(id)a4 bundleId:(id)a5 actionType:(id)a6;
- (ATXMinimalSlotResolutionParameters)minimalSlotResolutionParams;
- (BOOL)isEqual:(id)a3;
- (NSDate)actionTime;
- (NSString)actionType;
- (NSString)bundleId;
- (id)getContainerWithScore:(float)a3;
- (unint64_t)hash;
- (void)setActionTime:(id)a3;
@end

@implementation ATXMinimalActionParameters

- (ATXMinimalActionParameters)initWithMinimalSlotResolutionParameters:(id)a3 actionTime:(id)a4 bundleId:(id)a5 actionType:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ATXMinimalActionParameters;
  v15 = [(ATXMinimalActionParameters *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_minimalSlotResolutionParams, a3);
    objc_storeStrong((id *)&v16->_actionTime, a4);
    objc_storeStrong((id *)&v16->_bundleId, a5);
    objc_storeStrong((id *)&v16->_actionType, a6);
  }

  return v16;
}

- (id)getContainerWithScore:(float)a3
{
  v5 = [(ATXMinimalSlotResolutionParameters *)self->_minimalSlotResolutionParams actionAndSlotSet];
  v6 = [v5 first];
  v7 = [v5 second];
  v8 = [v7 parameters];
  v9 = (void *)[v6 copyWithParameterWhitelist:v8];

  if (v9 && [v9 hasActionTitle])
  {
    v10 = [MEMORY[0x1E4F4AE38] getActionKeyForBundleId:self->_bundleId actionType:self->_actionType];
    id v11 = objc_alloc(MEMORY[0x1E4F4B2B0]);
    *(float *)&double v12 = a3;
    id v13 = (void *)[v11 initWithPredictedItem:v9 score:v12];
    id v14 = [[ATXActionPredictionContainer alloc] initWithScoredAction:v13 slotSet:v7 actionKey:v10];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  return [(ATXMinimalSlotResolutionParameters *)self->_minimalSlotResolutionParams hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATXMinimalActionParameters *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      minimalSlotResolutionParams = self->_minimalSlotResolutionParams;
      v6 = [(ATXMinimalActionParameters *)v4 minimalSlotResolutionParams];
      char v7 = [(ATXMinimalSlotResolutionParameters *)minimalSlotResolutionParams isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (ATXMinimalSlotResolutionParameters)minimalSlotResolutionParams
{
  return self->_minimalSlotResolutionParams;
}

- (NSDate)actionTime
{
  return self->_actionTime;
}

- (void)setActionTime:(id)a3
{
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSString)actionType
{
  return self->_actionType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionType, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_actionTime, 0);
  objc_storeStrong((id *)&self->_minimalSlotResolutionParams, 0);
}

@end