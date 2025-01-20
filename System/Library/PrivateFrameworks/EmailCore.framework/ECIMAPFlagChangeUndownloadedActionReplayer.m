@interface ECIMAPFlagChangeUndownloadedActionReplayer
- (ECIMAPLocalActionReplayerDelegate)delegate;
- (ECIMAPServerInterface)serverInterface;
- (id)replayAction;
- (void)setDelegate:(id)a3;
- (void)setServerInterface:(id)a3;
@end

@implementation ECIMAPFlagChangeUndownloadedActionReplayer

- (id)replayAction
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v4 = [(ECLocalActionReplayer *)self action];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"ECIMAPFlagChangeUndownloadedActionReplayer.m", 19, @"Invalid parameter not satisfying: %@", @"[self.action isKindOfClass:[ECFlagChangeUndownloadedMessageAction class]]" object file lineNumber description];
  }
  v6 = [(ECLocalActionReplayer *)self action];
  v7 = [v6 flagChange];
  v8 = [v6 oldestPersistedRemoteID];
  uint64_t v9 = [v8 integerValue] - 1;

  v10 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 1, v9);
  v11 = [(ECIMAPFlagChangeUndownloadedActionReplayer *)self serverInterface];
  int v12 = [v11 storeFlagChange:v7 forUIDs:v10];

  v13 = +[ECLocalActionReplayer log];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = [(ECLocalActionReplayer *)self action];
    uint64_t v15 = [v10 count];
    v16 = @"didn't work";
    *(_DWORD *)buf = 138543874;
    v25 = v14;
    if (v12) {
      v16 = @"worked";
    }
    __int16 v26 = 2048;
    uint64_t v27 = v15;
    __int16 v28 = 2112;
    v29 = v16;
    _os_log_impl(&dword_1BF11D000, v13, OS_LOG_TYPE_DEFAULT, "Replaying flag action %{public}@ for %lu uids %@", buf, 0x20u);
  }
  if (v12)
  {
    v17 = [[ECLocalMessageActionResults alloc] initWithError:0];
  }
  else
  {
    v18 = [(ECIMAPFlagChangeUndownloadedActionReplayer *)self serverInterface];
    int v19 = [v18 hasValidConnection];

    if (v19)
    {
      v20 = [ECLocalMessageActionResults alloc];
      v21 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ECLocalActionReplayErrorDomain" code:1 userInfo:0];
      v17 = [(ECLocalMessageActionResults *)v20 initWithError:v21];
    }
    else
    {
      v17 = 0;
    }
  }

  return v17;
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