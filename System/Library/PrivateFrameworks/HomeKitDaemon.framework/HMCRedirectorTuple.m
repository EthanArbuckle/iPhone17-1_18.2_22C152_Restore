@interface HMCRedirectorTuple
- (HMCRedirectorStrongTuple)strongify;
- (id)attributeDescriptions;
- (id)description;
- (id)target;
- (void)cancel;
@end

@implementation HMCRedirectorTuple

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_destroyWeak((id *)&self->_owner);
}

- (id)description
{
  v3 = -[HMCRedirectorTuple target]((id *)&self->super.super.isa);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);

  if (self) {
    selector = self->_selector;
  }
  else {
    selector = 0;
  }
  v7 = NSStringFromSelector(selector);
  v8 = [NSString stringWithFormat:@"<HMCRedirectorTuple -[%@ %@]>", v5, v7];

  return v8;
}

- (id)target
{
  if (WeakRetained)
  {
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 2);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (id)attributeDescriptions
{
  v12[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = -[HMCRedirectorTuple target]((id *)&self->super.super.isa);
  v5 = (void *)[v3 initWithName:@"Target" value:v4];
  v12[0] = v5;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  if (self) {
    selector = self->_selector;
  }
  else {
    selector = 0;
  }
  v8 = NSStringFromSelector(selector);
  v9 = (void *)[v6 initWithName:@"Selector" value:v8];
  v12[1] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];

  return v10;
}

- (void)cancel
{
  if (self && (WeakRetained = objc_loadWeakRetained((id *)&self->_owner), id v3 = self, WeakRetained))
  {
    v4 = [MEMORY[0x263EFF9C0] set];
    v5 = [MEMORY[0x263EFF9C0] set];
    os_unfair_lock_lock_with_options();
    id v6 = *((id *)WeakRetained + 3);
    v7 = [v6 dictionaryRepresentation];
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __29__HMCRedirector_removeTuple___block_invoke;
    v38[3] = &unk_264A2D558;
    v8 = v3;
    v39 = v8;
    id v9 = v4;
    id v40 = v9;
    [v7 enumerateKeysAndObjectsUsingBlock:v38];

    id v10 = *((id *)WeakRetained + 4);
    v11 = [v10 dictionaryRepresentation];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __29__HMCRedirector_removeTuple___block_invoke_2;
    v35[3] = &unk_264A2D558;
    v12 = v8;
    v36 = v12;
    id v13 = v9;
    id v37 = v13;
    [v11 enumerateKeysAndObjectsUsingBlock:v35];

    id v14 = *((id *)WeakRetained + 6);
    v15 = [v14 dictionaryRepresentation];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __29__HMCRedirector_removeTuple___block_invoke_3;
    v32[3] = &unk_264A2D558;
    v16 = v12;
    v33 = v16;
    id v17 = v13;
    id v34 = v17;
    [v15 enumerateKeysAndObjectsUsingBlock:v32];

    id v18 = *((id *)WeakRetained + 5);
    v19 = [v18 dictionaryRepresentation];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __29__HMCRedirector_removeTuple___block_invoke_4;
    v29[3] = &unk_264A2D580;
    v20 = v16;
    v30 = v20;
    id v21 = v5;
    id v31 = v21;
    [v19 enumerateKeysAndObjectsUsingBlock:v29];

    id v22 = *((id *)WeakRetained + 7);
    v23 = [v22 dictionaryRepresentation];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __29__HMCRedirector_removeTuple___block_invoke_5;
    v26[3] = &unk_264A2D580;
    v27 = v20;
    id v24 = v21;
    id v28 = v24;
    [v23 enumerateKeysAndObjectsUsingBlock:v26];

    __removeRegistrations(WeakRetained, v17, v24);
    os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 2);
  }
  else
  {
    id WeakRetained = 0;
  }
}

- (HMCRedirectorStrongTuple)strongify
{
  uint64_t v1 = a1;
  if (a1)
  {
    v2 = [HMCRedirectorStrongTuple alloc];
    id v3 = v1;
    if (v2)
    {
      v8.receiver = v2;
      v8.super_class = (Class)HMCRedirectorStrongTuple;
      v4 = [(HMCRedirectorStrongTuple *)&v8 init];
      v2 = (HMCRedirectorStrongTuple *)v4;
      if (!v4)
      {
LABEL_6:
        v2 = v2;
        uint64_t v1 = v2;
LABEL_8:

        goto LABEL_9;
      }
      objc_storeStrong(v4 + 1, v1);
      uint64_t v5 = -[HMCRedirectorTuple target]((id *)&v3->super.super.isa);
      id target = v2->_target;
      v2->_id target = (id)v5;

      if (v2->_target)
      {
        v2->_selector = v3->_selector;
        goto LABEL_6;
      }
    }
    uint64_t v1 = 0;
    goto LABEL_8;
  }
LABEL_9:
  return v1;
}

@end