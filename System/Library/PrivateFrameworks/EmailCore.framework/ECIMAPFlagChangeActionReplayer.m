@interface ECIMAPFlagChangeActionReplayer
- (ECIMAPLocalActionReplayerDelegate)delegate;
- (ECIMAPServerInterface)serverInterface;
- (id)replayAction;
- (void)setDelegate:(id)a3;
- (void)setServerInterface:(id)a3;
@end

@implementation ECIMAPFlagChangeActionReplayer

- (id)replayAction
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  v4 = [(ECLocalActionReplayer *)self action];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"ECIMAPFlagChangeActionReplayer.m", 20, @"Invalid parameter not satisfying: %@", @"[self.action isKindOfClass:[ECFlagChangeMessageAction class]]" object file lineNumber description];
  }
  v6 = [(ECLocalActionReplayer *)self action];
  v33 = [v6 remoteIDs];
  v32 = [v6 messages];
  v7 = objc_opt_new();
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v8 = v33;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v38 objects:v49 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v39 != v10) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(v7, "addIndex:", objc_msgSend(*(id *)(*((void *)&v38 + 1) + 8 * i), "integerValue"));
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v38 objects:v49 count:16];
    }
    while (v9);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v12 = v32;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v48 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v35 != v14) {
          objc_enumerationMutation(v12);
        }
        v16 = [*(id *)(*((void *)&v34 + 1) + 8 * j) remoteID];
        unsigned int v17 = [v16 integerValue];

        if (v17) {
          [v7 addIndex:v17];
        }
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v48 count:16];
    }
    while (v13);
  }

  if ([v7 count])
  {
    v18 = [v6 flagChange];
    v19 = [(ECIMAPFlagChangeActionReplayer *)self serverInterface];
    int v20 = [v19 storeFlagChange:v18 forUIDs:v7];
  }
  else
  {
    int v20 = 1;
  }
  v21 = +[ECLocalActionReplayer log];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = [(ECLocalActionReplayer *)self action];
    uint64_t v23 = [v7 count];
    v24 = @"didn't work";
    *(_DWORD *)buf = 138543874;
    v43 = v22;
    if (v20) {
      v24 = @"worked";
    }
    __int16 v44 = 2048;
    uint64_t v45 = v23;
    __int16 v46 = 2112;
    v47 = v24;
    _os_log_impl(&dword_1BF11D000, v21, OS_LOG_TYPE_DEFAULT, "Replaying flag action %{public}@ for %lu uids %@", buf, 0x20u);
  }
  if (v20)
  {
    v25 = [[ECLocalMessageActionResults alloc] initWithError:0];
  }
  else
  {
    v26 = [(ECIMAPFlagChangeActionReplayer *)self serverInterface];
    int v27 = [v26 hasValidConnection];

    if (v27)
    {
      v28 = [ECLocalMessageActionResults alloc];
      v29 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ECLocalActionReplayErrorDomain" code:1 userInfo:0];
      v25 = [(ECLocalMessageActionResults *)v28 initWithError:v29];
    }
    else
    {
      v25 = 0;
    }
  }

  return v25;
}

- (ECIMAPServerInterface)serverInterface
{
  return self->serverInterface;
}

- (void)setServerInterface:(id)a3
{
}

- (ECIMAPLocalActionReplayerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (ECIMAPLocalActionReplayerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->serverInterface, 0);
}

@end