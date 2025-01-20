@interface BKEventDeliveryChain
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)resolutionPath;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
@end

@implementation BKEventDeliveryChain

void __38__BKEventDeliveryChain_resolutionPath__block_invoke(void *a1, void *a2)
{
  v3 = *(void **)(a1[4] + 16);
  id v4 = a2;
  objc_msgSend(v4, "setPid:", objc_msgSend(v3, "pid"));
  [v4 setEnvironment:a1[5]];
  [v4 setDisplay:a1[6]];
  [v4 setDispatchingTarget:*(void *)(a1[4] + 16)];
}

void __38__BKEventDeliveryChain_resolutionPath__block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v5 = a2;
  objc_msgSend(v5, "setPid:", objc_msgSend(v3, "pid"));
  id v4 = [*(id *)(a1 + 32) token];
  [v5 setToken:v4];

  [v5 setEnvironment:*(void *)(a1 + 40)];
  [v5 setDisplay:*(void *)(a1 + 48)];
  [v5 setDispatchingTarget:*(void *)(*(void *)(a1 + 56) + 16)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferringPath, 0);
  objc_storeStrong((id *)&self->_senderDescriptor, 0);
  objc_storeStrong((id *)&self->_dispatchTarget, 0);

  objc_storeStrong((id *)&self->_identity, 0);
}

- (id)resolutionPath
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v3 = [*(id *)(a1 + 8) display];
    id v4 = [*(id *)(a1 + 8) environment];
    id v5 = (void *)MEMORY[0x1E4F4F288];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __38__BKEventDeliveryChain_resolutionPath__block_invoke;
    v34[3] = &unk_1E68711F0;
    v34[4] = a1;
    id v23 = v4;
    id v35 = v23;
    id v22 = v3;
    id v36 = v22;
    v6 = [v5 build:v34];
    id v24 = v2;
    [v2 addObject:v6];

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v7 = a1;
    id v8 = *(id *)(a1 + 32);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v37 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v31 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          if (v13) {
            v13 = (void *)v13[2];
          }
          v14 = v13;
          v15 = [v14 predicate];
          v16 = [v15 display];

          if (!v16)
          {
            v16 = [MEMORY[0x1E4F4F2D0] nullDisplay];
          }
          v17 = [v14 target];
          v18 = v17;
          if (v17)
          {
            v19 = (void *)MEMORY[0x1E4F4F288];
            v25[0] = MEMORY[0x1E4F143A8];
            v25[1] = 3221225472;
            v25[2] = __38__BKEventDeliveryChain_resolutionPath__block_invoke_2;
            v25[3] = &unk_1E6871218;
            id v26 = v17;
            id v27 = v23;
            id v28 = v16;
            uint64_t v29 = v7;
            v20 = [v19 build:v25];
            [v2 addObject:v20];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v37 count:16];
      }
      while (v10);
    }
  }
  else
  {
    id v24 = 0;
  }

  return v24;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BKEventDeliveryChain *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    v6 = v4;
    if (v5)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v7 = v6;
      }
      else {
        uint64_t v7 = 0;
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
    uint64_t v9 = v7;

    BOOL v8 = v9
      && BSEqualObjects()
      && BSEqualObjects()
      && BSEqualObjects()
      && (!-[NSArray count](self->_deferringPath, "count") && ![v9[4] count]
       || BSEqualObjects());
  }
  return v8;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v8 = a3;
  id v4 = (id)[v8 appendObject:self->_identity withName:@"identity"];
  id v5 = (id)[v8 appendObject:self->_senderDescriptor withName:@"sender"];
  id v6 = (id)[v8 appendObject:self->_dispatchTarget withName:@"target"];
  id v7 = (id)[v8 appendObject:self->_deferringPath withName:@"path"];
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (unint64_t)hash
{
  uint64_t v3 = [(BKSEventDeferringChainIdentity *)self->_identity hash];
  return [(BKSHIDEventSenderDescriptor *)self->_senderDescriptor hash] ^ v3;
}

@end