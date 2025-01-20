@interface _AMUIPosterUpdate
- (BOOL)fireCompletionBlocksWithUpdatedPosterConfiguration:(id)a3 error:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)userInfo;
- (PRSPosterConfiguration)posterConfiguration;
- (PRSPosterUpdate)update;
- (_AMUIPosterUpdate)initWithPosterConfiguration:(id)a3 update:(id)a4 userInfo:(id)a5;
- (unint64_t)hash;
- (void)adoptCompletionsFromStaleUpdate:(id)a3;
- (void)appendCompletion:(id)a3;
- (void)cancel;
@end

@implementation _AMUIPosterUpdate

- (_AMUIPosterUpdate)initWithPosterConfiguration:(id)a3 update:(id)a4 userInfo:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)_AMUIPosterUpdate;
  v12 = [(_AMUIPosterUpdate *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_posterConfiguration, a3);
    objc_storeStrong((id *)&v13->_update, a4);
    if (v11) {
      v14 = v11;
    }
    else {
      v14 = (void *)MEMORY[0x263EFFA78];
    }
    uint64_t v15 = [v14 copy];
    userInfo = v13->_userInfo;
    v13->_userInfo = (NSDictionary *)v15;
  }
  return v13;
}

- (unint64_t)hash
{
  v3 = [(PRSPosterConfiguration *)self->_posterConfiguration serverUUID];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(NSDictionary *)self->_userInfo hash];
  unint64_t v6 = v5 ^ [(PRSPosterUpdate *)self->_update hash] ^ v4;

  return v6;
}

- (void)appendCompletion:(id)a3
{
  id v9 = (void (**)(id, PRSPosterConfiguration *, NSError *))a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  if (v4->_isFinished)
  {
    v9[2](v9, v4->_firedConfiguration, v4->_firedError);
  }
  else
  {
    completions = v4->_completions;
    if (!completions)
    {
      unint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      v7 = v4->_completions;
      v4->_completions = v6;

      completions = v4->_completions;
    }
    v8 = (void *)[v9 copy];
    [(NSMutableArray *)completions addObject:v8];
  }
  objc_sync_exit(v4);
}

- (void)adoptCompletionsFromStaleUpdate:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v4 = (id *)a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4[2];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void (***)(void, void, void))(*((void *)&v15 + 1) + 8 * i);
        if (v5->_isFinished)
        {
          ((void (**)(void, PRSPosterConfiguration *, NSError *))v10)[2](*(void *)(*((void *)&v15 + 1) + 8 * i), v5->_firedConfiguration, v5->_firedError);
        }
        else
        {
          completions = v5->_completions;
          if (!completions)
          {
            v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
            v13 = v5->_completions;
            v5->_completions = v12;

            completions = v5->_completions;
          }
          v14 = objc_msgSend(v10, "copy", (void)v15);
          [(NSMutableArray *)completions addObject:v14];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (BOOL)fireCompletionBlocksWithUpdatedPosterConfiguration:(id)a3 error:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = self;
  objc_sync_enter(v9);
  if (v9->_isFinished)
  {
    BOOL isFinished = 0;
  }
  else
  {
    v9->_BOOL isFinished = 1;
    objc_storeStrong((id *)&v9->_firedConfiguration, a3);
    objc_storeStrong((id *)&v9->_firedError, a4);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v11 = v9->_completions;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v11);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v17 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v17 + 1) + 8 * i));
        }
        uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }

    [(NSMutableArray *)v9->_completions removeAllObjects];
    completions = v9->_completions;
    v9->_completions = 0;

    BOOL isFinished = v9->_isFinished;
  }
  objc_sync_exit(v9);

  return isFinished;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (_AMUIPosterUpdate *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    id v6 = v4;
    if (v5)
    {
      if (objc_opt_isKindOfClass()) {
        id v7 = v6;
      }
      else {
        id v7 = 0;
      }
    }
    else
    {
      id v7 = 0;
    }
    id v9 = v7;

    if (v9)
    {
      id v10 = [(PRSPosterConfiguration *)self->_posterConfiguration serverUUID];
      id v11 = [(_AMUIPosterUpdate *)v9 posterConfiguration];
      uint64_t v12 = [v11 serverUUID];
      char v13 = [v10 isEqual:v12];

      userInfo = self->_userInfo;
      long long v15 = [(_AMUIPosterUpdate *)v9 userInfo];
      LOBYTE(userInfo) = [(NSDictionary *)userInfo isEqualToDictionary:v15];

      char v8 = v13 & userInfo;
    }
    else
    {
      char v8 = 0;
    }
  }
  return v8;
}

- (void)cancel
{
  v2 = self;
  objc_sync_enter(v2);
  v2->_BOOL isFinished = 1;
  objc_sync_exit(v2);

  completions = v2->_completions;

  [(NSMutableArray *)completions removeAllObjects];
}

- (PRSPosterConfiguration)posterConfiguration
{
  return self->_posterConfiguration;
}

- (PRSPosterUpdate)update
{
  return self->_update;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_update, 0);
  objc_storeStrong((id *)&self->_posterConfiguration, 0);
  objc_storeStrong((id *)&self->_firedConfiguration, 0);
  objc_storeStrong((id *)&self->_firedError, 0);

  objc_storeStrong((id *)&self->_completions, 0);
}

@end