@interface HUPrimaryUserItem
- (HFMediaProfileContainer)mediaProfileContainer;
- (HUPrimaryUserItem)initWithHome:(id)a3 mediaProfileContainer:(id)a4 user:(id)a5;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation HUPrimaryUserItem

- (HUPrimaryUserItem)initWithHome:(id)a3 mediaProfileContainer:(id)a4 user:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_8:
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"HUPrimaryUserItem.m", 18, @"Invalid parameter not satisfying: %@", @"mediaProfileContainer" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"HUPrimaryUserItem.m", 17, @"Invalid parameter not satisfying: %@", @"home" object file lineNumber description];

  if (!v10) {
    goto LABEL_8;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_9:
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"HUPrimaryUserItem.m", 19, @"Invalid parameter not satisfying: %@", @"user" object file lineNumber description];

LABEL_4:
  id v12 = objc_alloc(MEMORY[0x1E4F1CB18]);
  v13 = (void *)[v12 initWithSuiteName:*MEMORY[0x1E4F685B0]];
  v19.receiver = self;
  v19.super_class = (Class)HUPrimaryUserItem;
  v14 = [(HFUserItem *)&v19 initWithHome:v9 user:v11 nameStyle:2 userDefaults:v13];

  if (v14) {
    objc_storeStrong((id *)&v14->_mediaProfileContainer, a4);
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(HFUserItem *)self home];
  v6 = [(HUPrimaryUserItem *)self mediaProfileContainer];
  v7 = [(HFUserItem *)self user];
  v8 = (void *)[v4 initWithHome:v5 mediaProfileContainer:v6 user:v7];

  [v8 copyLatestResultsFromItem:self];
  return v8;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v10.receiver = self;
  v10.super_class = (Class)HUPrimaryUserItem;
  v5 = [(HFUserItem *)&v10 _subclass_updateWithOptions:v4];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__HUPrimaryUserItem__subclass_updateWithOptions___block_invoke;
  v8[3] = &unk_1E6385350;
  objc_copyWeak(&v9, &location);
  v6 = [v5 flatMap:v8];
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);

  return v6;
}

id __49__HUPrimaryUserItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = (void *)[v3 mutableCopy];

  v6 = [WeakRetained mediaProfileContainer];
  v7 = objc_msgSend(v6, "hf_preferredMediaUser");

  v8 = [WeakRetained user];
  id v9 = [v8 uniqueIdentifier];
  objc_super v10 = [v7 uniqueIdentifier];
  unsigned int v11 = objc_msgSend(v9, "hmf_isEqualToUUID:", v10);

  id v12 = [WeakRetained mediaProfileContainer];
  uint64_t v13 = objc_msgSend(v12, "hf_preferredUserSelectionType");

  v14 = HFLogForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v26[0] = 67109376;
    v26[1] = v11;
    __int16 v27 = 1024;
    BOOL v28 = v13 == 1;
    _os_log_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEFAULT, "Is this the primary user?: %{BOOL}d isSelectionTypeHomeUser?: %{BOOL}d", (uint8_t *)v26, 0xEu);
  }

  if (v13 == 1) {
    uint64_t v15 = v11;
  }
  else {
    uint64_t v15 = 0;
  }
  v16 = [NSNumber numberWithInt:v15];
  [v5 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F68B40]];

  uint64_t v17 = *MEMORY[0x1E4F68908];
  v18 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F68908]];
  objc_super v19 = v18;
  if (v18)
  {
    v20 = (void *)[v18 mutableCopy];
  }
  else
  {
    v21 = [MEMORY[0x1E4F1CAD0] set];
    v20 = (void *)[v21 mutableCopy];
  }
  v22 = [WeakRetained mediaProfileContainer];
  v23 = objc_msgSend(v22, "hf_dependentHomeKitObjectsForDownstreamItems");
  [v20 unionSet:v23];

  [v5 setObject:v20 forKeyedSubscript:v17];
  v24 = [MEMORY[0x1E4F7A0D8] futureWithResult:v5];

  return v24;
}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return self->_mediaProfileContainer;
}

- (void).cxx_destruct
{
}

@end