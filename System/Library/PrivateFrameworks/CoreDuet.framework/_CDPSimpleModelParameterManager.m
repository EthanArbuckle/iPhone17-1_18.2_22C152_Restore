@interface _CDPSimpleModelParameterManager
- (_CDPModelTuningState)lastTuningState;
- (_CDPSimpleModelParameterManager)initWithSettings:(id)a3;
- (id)accountIdentifierForSettings:(id)a3;
- (void)getLambda:(float *)a3 w0:(float *)a4 threshold:(float *)a5;
- (void)loadAccountState;
- (void)modelTuner:(id)a3 heartBeatWithlambda:(float)a4 w0:(float)a5 threshold:(float)a6 score:(float)a7 progress:(float)a8;
- (void)saveAccountState;
@end

@implementation _CDPSimpleModelParameterManager

- (_CDPSimpleModelParameterManager)initWithSettings:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_CDPSimpleModelParameterManager;
  id v3 = a3;
  v4 = [(_CDPSimpleModelParameterManager *)&v10 init];
  v5 = objc_msgSend(v3, "constrainAccounts", v10.receiver, v10.super_class);

  v6 = [v5 allObjects];
  uint64_t v7 = [v6 componentsJoinedByString:@","];
  accountStateKey = v4->_accountStateKey;
  v4->_accountStateKey = (NSString *)v7;

  [(_CDPSimpleModelParameterManager *)v4 loadAccountState];
  return v4;
}

- (id)accountIdentifierForSettings:(id)a3
{
  id v3 = [a3 constrainAccounts];
  v4 = [v3 allObjects];
  v5 = [v4 componentsJoinedByString:@","];

  return v5;
}

- (void)modelTuner:(id)a3 heartBeatWithlambda:(float)a4 w0:(float)a5 threshold:(float)a6 score:(float)a7 progress:(float)a8
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  v15 = [_CDPSimpleModelParameterManagerTuningValue alloc];
  *(float *)&double v16 = a4;
  *(float *)&double v17 = a5;
  *(float *)&double v18 = a6;
  *(float *)&double v19 = a7;
  v20 = [(_CDPSimpleModelParameterManagerTuningValue *)v15 initWithLambda:v16 w0:v17 threshold:v18 score:v19];
  v21 = [(_CDPSimpleModelParameterManagerAccountState *)self->_accountState tuningValues];
  [v21 addObject:v20];

  [(_CDPSimpleModelParameterManagerTuningValue *)v20 score];
  float v23 = v22;
  v24 = [(_CDPSimpleModelParameterManagerAccountState *)self->_accountState previousBestTuningValue];
  [v24 score];
  float v26 = v25;

  if (v23 > v26) {
    [(_CDPSimpleModelParameterManagerAccountState *)self->_accountState setPreviousBestTuningValue:v20];
  }
  v27 = [v14 currentState];
  v28 = (void *)[v27 copy];
  [(_CDPSimpleModelParameterManagerAccountState *)self->_accountState setLastTuningState:v28];

  if (a8 == 1.0)
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v29 = [(_CDPSimpleModelParameterManagerAccountState *)self->_accountState tuningValues];
    uint64_t v30 = [v29 countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      v32 = 0;
      uint64_t v33 = *(void *)v42;
      float v34 = -1.0;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v42 != v33) {
            objc_enumerationMutation(v29);
          }
          v36 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          [v36 score];
          if (v37 > v34)
          {
            [v36 score];
            float v34 = v38;
            id v39 = v36;

            v32 = v39;
          }
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v41 objects:v45 count:16];
      }
      while (v31);
    }
    else
    {
      v32 = 0;
    }

    v40 = [MEMORY[0x1E4F1CA48] array];
    [(_CDPSimpleModelParameterManagerAccountState *)self->_accountState setTuningValues:v40];

    [(_CDPSimpleModelParameterManagerAccountState *)self->_accountState setPreviousBestTuningValue:v32];
    [(_CDPSimpleModelParameterManagerAccountState *)self->_accountState setLastTuningState:0];
  }
}

- (void)getLambda:(float *)a3 w0:(float *)a4 threshold:(float *)a5
{
  v9 = [(_CDPSimpleModelParameterManagerAccountState *)self->_accountState previousBestTuningValue];
  [v9 lambda];
  *(_DWORD *)a3 = v10;

  v11 = [(_CDPSimpleModelParameterManagerAccountState *)self->_accountState previousBestTuningValue];
  [v11 w0];
  *(_DWORD *)a4 = v12;

  id v14 = [(_CDPSimpleModelParameterManagerAccountState *)self->_accountState previousBestTuningValue];
  [v14 threshold];
  *(_DWORD *)a5 = v13;
}

- (void)loadAccountState
{
  id v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  if (self->_accountStateKey && (objc_msgSend(v8, "objectForKey:"), (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = (_CDPSimpleModelParameterManagerAccountState *)v3;
    v5 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:0];
    accountState = self->_accountState;
    self->_accountState = v5;
  }
  else
  {
    uint64_t v7 = objc_alloc_init(_CDPSimpleModelParameterManagerAccountState);
    v4 = self->_accountState;
    self->_accountState = v7;
  }
}

- (void)saveAccountState
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_18ECEB000, log, OS_LOG_TYPE_DEBUG, "Account state did synchronize.", v1, 2u);
}

- (_CDPModelTuningState)lastTuningState
{
  return [(_CDPSimpleModelParameterManagerAccountState *)self->_accountState lastTuningState];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStateKey, 0);
  objc_storeStrong((id *)&self->_accountState, 0);
}

@end