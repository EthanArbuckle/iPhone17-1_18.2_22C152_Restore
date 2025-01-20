@interface BKSInsecureDrawingAction
- (BKSInsecureDrawingAction)initWithInfo:(id)a3 responder:(id)a4;
- (BKSInsecureDrawingAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6;
- (BKSInsecureDrawingAction)initWithPidToContextIdsDictionary:(id)a3;
- (BKSInsecureDrawingAction)initWithSecureModeViolations:(id)a3;
- (NSArray)processIds;
- (NSArray)secureModeViolations;
- (NSDictionary)pidToContextInfoDictionary;
- (id)_initWithPidToContextInfoDictionary:(id)a3;
- (id)keyDescriptionForSetting:(unint64_t)a3;
@end

@implementation BKSInsecureDrawingAction

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 1)
  {
    v5 = @"pidToContextInfoDictionary";
  }
  else
  {
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    v7.receiver = self;
    v7.super_class = (Class)BKSInsecureDrawingAction;
    -[BKSInsecureDrawingAction keyDescriptionForSetting:](&v7, sel_keyDescriptionForSetting_);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (NSArray)processIds
{
  v2 = [(BKSInsecureDrawingAction *)self pidToContextInfoDictionary];
  uint64_t v3 = [v2 allKeys];

  return (NSArray *)v3;
}

- (NSDictionary)pidToContextInfoDictionary
{
  v2 = [(BKSInsecureDrawingAction *)self info];
  uint64_t v3 = [v2 objectForSetting:1];

  return (NSDictionary *)v3;
}

- (NSArray)secureModeViolations
{
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = [(BKSInsecureDrawingAction *)self pidToContextInfoDictionary];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__BKSInsecureDrawingAction_secureModeViolations__block_invoke;
  v7[3] = &unk_1E5441568;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];

  return (NSArray *)v5;
}

void __48__BKSInsecureDrawingAction_secureModeViolations__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_super v7 = [BKSSecureModeViolation alloc];
  id v8 = [v6 allKeys];
  uint64_t v9 = [(BKSSecureModeViolation *)v7 initWithProcessId:v5 contextIds:v8];

  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__BKSInsecureDrawingAction_secureModeViolations__block_invoke_2;
  v10[3] = &unk_1E5441540;
  v10[4] = &v11;
  [v6 enumerateKeysAndObjectsUsingBlock:v10];
  if (*((unsigned char *)v12 + 24)) {
    [(BKSSecureModeViolation *)v9 setLayerNamesByContext:v6];
  }
  [*(id *)(a1 + 32) addObject:v9];
  _Block_object_dispose(&v11, 8);
}

uint64_t __48__BKSInsecureDrawingAction_secureModeViolations__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t result = [a3 count];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (BKSInsecureDrawingAction)initWithInfo:(id)a3 responder:(id)a4
{
  return 0;
}

- (BKSInsecureDrawingAction)initWithInfo:(id)a3 timeout:(double)a4 forResponseOnQueue:(id)a5 withHandler:(id)a6
{
  return 0;
}

- (id)_initWithPidToContextInfoDictionary:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"BKSInsecureDrawingAction.m", 59, @"Invalid parameter not satisfying: %@", @"pidToContextInfoDictionary" object file lineNumber description];
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  [v6 setObject:v5 forSetting:1];
  v10.receiver = self;
  v10.super_class = (Class)BKSInsecureDrawingAction;
  objc_super v7 = [(BKSInsecureDrawingAction *)&v10 initWithInfo:v6 responder:0];

  return v7;
}

- (BKSInsecureDrawingAction)initWithSecureModeViolations:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"BKSInsecureDrawingAction.m", 43, @"Invalid parameter not satisfying: %@", @"secureModeViolations" object file lineNumber description];
  }
  v21 = self;
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v5;
  uint64_t v25 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v25)
  {
    uint64_t v23 = *(void *)v33;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v33 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = v6;
        objc_super v7 = *(void **)(*((void *)&v32 + 1) + 8 * v6);
        v26 = [v7 processId];
        id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v9 = [v7 layerNamesByContext];
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        objc_super v10 = [v7 contextIds];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v29;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v29 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v28 + 1) + 8 * i);
              v16 = [v9 objectForKeyedSubscript:v15];
              if (v16)
              {
                [v8 setObject:v16 forKeyedSubscript:v15];
              }
              else
              {
                id v17 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
                [v8 setObject:v17 forKeyedSubscript:v15];
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v36 count:16];
          }
          while (v12);
        }

        [v24 setObject:v8 forKeyedSubscript:v26];
        uint64_t v6 = v27 + 1;
      }
      while (v27 + 1 != v25);
      uint64_t v25 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v25);
  }

  v18 = [(BKSInsecureDrawingAction *)v21 _initWithPidToContextInfoDictionary:v24];
  return v18;
}

- (BKSInsecureDrawingAction)initWithPidToContextIdsDictionary:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"BKSInsecureDrawingAction.m", 29, @"Invalid parameter not satisfying: %@", @"pidToContextIdsDictionary" object file lineNumber description];
  }
  v21 = self;
  uint64_t v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v5, "count"));
  uint64_t v6 = [MEMORY[0x1E4F1CAD0] set];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v22 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v29 != v22) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        uint64_t v13 = [v7 objectForKeyedSubscript:v11];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v25;
          do
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v25 != v16) {
                objc_enumerationMutation(v13);
              }
              [v12 setObject:v6 forKeyedSubscript:*(void *)(*((void *)&v24 + 1) + 8 * j)];
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v15);
        }

        [v23 setObject:v12 forKeyedSubscript:v11];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v9);
  }

  v18 = [(BKSInsecureDrawingAction *)v21 _initWithPidToContextInfoDictionary:v23];
  return v18;
}

@end