@interface ECGmailLabelChangeReplayer
- (ECIMAPServerInterface)serverInterface;
- (id)replayAction;
- (void)setServerInterface:(id)a3;
@end

@implementation ECGmailLabelChangeReplayer

- (id)replayAction
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v4 = [(ECLocalActionReplayer *)self action];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"ECGmailLabelChangeReplayer.m", 19, @"Invalid parameter not satisfying: %@", @"[labelChangeAction isKindOfClass:[ECLabelChangeMessageAction class]]" object file lineNumber description];
  }
  v34 = [v4 remoteIDs];
  v33 = [v4 messages];
  v5 = objc_opt_new();
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v6 = v34;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v40 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(v5, "addIndex:", objc_msgSend(*(id *)(*((void *)&v39 + 1) + 8 * i), "integerValue"));
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v7);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v10 = v33;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v36 != v12) {
          objc_enumerationMutation(v10);
        }
        v14 = [*(id *)(*((void *)&v35 + 1) + 8 * j) remoteID];
        unsigned int v15 = [v14 integerValue];

        if (v15) {
          [v5 addIndex:v15];
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v11);
  }

  v32 = [v4 labelsToAdd];
  v16 = [v32 valueForKey:@"labelName"];
  v17 = [v16 allObjects];

  v18 = [v4 labelsToRemove];
  v19 = [v18 valueForKey:@"labelName"];
  v20 = [v19 allObjects];

  if ([v17 count])
  {
    v21 = [(ECGmailLabelChangeReplayer *)self serverInterface];
    int v22 = [v21 storeGmailLabels:v17 state:1 forUIDs:v5];

    if (!v22) {
      goto LABEL_24;
    }
  }
  if ([v20 count]
    && ([(ECGmailLabelChangeReplayer *)self serverInterface],
        v23 = objc_claimAutoreleasedReturnValue(),
        int v24 = [v23 storeGmailLabels:v20 state:0 forUIDs:v5],
        v23,
        !v24))
  {
LABEL_24:
    v26 = [(ECGmailLabelChangeReplayer *)self serverInterface];
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
  else
  {
    v25 = [[ECLocalMessageActionResults alloc] initWithError:0];
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

- (void).cxx_destruct
{
}

@end