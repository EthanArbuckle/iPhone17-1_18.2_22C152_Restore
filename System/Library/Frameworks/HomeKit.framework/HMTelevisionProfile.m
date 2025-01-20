@interface HMTelevisionProfile
- (BOOL)mediaSourceDisplayOrderModifiable;
- (BOOL)mergeFromNewObject:(id)a3;
- (HMTelevisionProfile)initWithTelevisionService:(id)a3 linkedServices:(id)a4;
- (HMTelevisionProfileDelegate)delegate;
- (NSArray)mediaSourceDisplayOrder;
- (void)setDelegate:(id)a3;
- (void)televisionProfileDidUpdateSourceDisplayOrder:(id)a3;
- (void)updateMediaSourceDisplayOrder:(id)a3 completionHandler:(id)a4;
@end

@implementation HMTelevisionProfile

uint64_t __67___HMTelevisionProfile__notifyDelegateOfUpdatedSourceDisplayOrder___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) televisionProfileDidUpdateSourceDisplayOrder:*(void *)(a1 + 40)];
}

void __72___HMTelevisionProfile_updateMediaSourceDisplayOrder_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v2 = [*(id *)(a1 + 32) services];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v29;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v29 != v5) {
        objc_enumerationMutation(v2);
      }
      v7 = *(void **)(*((void *)&v28 + 1) + 8 * v6);
      v8 = [v7 serviceType];
      char v9 = [v8 isEqualToString:@"000000D8-0000-1000-8000-0026BB765291"];

      if (v9) {
        break;
      }
      if (v4 == ++v6)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v28 objects:v34 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v10 = v7;

    if (!v10) {
      goto LABEL_12;
    }
    v32[0] = @"kServiceInstanceID";
    v11 = [v10 instanceID];
    v32[1] = @"source-display-order";
    v33[0] = v11;
    v33[1] = *(void *)(a1 + 40);
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];

    v13 = (void *)MEMORY[0x1E4F654B0];
    v14 = [*(id *)(a1 + 32) messageDestination];
    v15 = [v13 messageWithName:@"HMTP.sdoUpdate" destination:v14 payload:v12];

    v16 = [*(id *)(a1 + 32) context];
    v17 = [v16 pendingRequests];

    v18 = [v15 identifier];
    v19 = _Block_copy(*(const void **)(a1 + 56));
    [v17 addCompletionBlock:v19 forIdentifier:v18];

    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __72___HMTelevisionProfile_updateMediaSourceDisplayOrder_completionHandler___block_invoke_2;
    v24[3] = &unk_1E59450E8;
    id v25 = v17;
    id v26 = v18;
    id v27 = *(id *)(a1 + 48);
    id v20 = v18;
    id v21 = v17;
    [v15 setResponseHandler:v24];
    v22 = [*(id *)(a1 + 48) messageDispatcher];
    [v22 sendMessage:v15 completionHandler:0];
  }
  else
  {
LABEL_9:

LABEL_12:
    id v10 = [*(id *)(a1 + 32) context];
    v12 = [v10 delegateCaller];
    uint64_t v23 = *(void *)(a1 + 56);
    v15 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
    [v12 callCompletion:v23 error:v15];
  }
}

void __72___HMTelevisionProfile_updateMediaSourceDisplayOrder_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = a2;
    id v7 = [v3 removeCompletionBlockForIdentifier:v4];
    uint64_t v6 = [*(id *)(a1 + 48) delegateCaller];
    [v6 callCompletion:v7 error:v5];
  }
}

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)a3
{
}

- (HMTelevisionProfileDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HMTelevisionProfileDelegate *)WeakRetained;
}

- (BOOL)mergeFromNewObject:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HMTelevisionProfile;
  BOOL v5 = [(HMAccessoryProfile *)&v16 mergeFromNewObject:v4];
  id v6 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    char v9 = [v8 mediaSourceDisplayOrder];
    id v10 = [(HMAccessoryProfile *)self accessoryProfile];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v11 = v10;
    }
    else {
      v11 = 0;
    }
    id v12 = v11;

    v13 = [(HMTelevisionProfile *)self mediaSourceDisplayOrder];
    char v14 = [v9 isEqualToArray:v13];

    if ((v14 & 1) == 0)
    {
      [v12 setMediaSourceDisplayOrder:v9];
      [(HMTelevisionProfile *)self televisionProfileDidUpdateSourceDisplayOrder:v12];
      BOOL v5 = 1;
    }
  }
  return v5;
}

- (void)televisionProfileDidUpdateSourceDisplayOrder:(id)a3
{
  id v4 = [(HMTelevisionProfile *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(HMTelevisionProfile *)self delegate];
    id v7 = [(HMAccessoryProfile *)self accessoryProfile];
    id v8 = [v7 context];
    char v9 = [v8 delegateCaller];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __68__HMTelevisionProfile_televisionProfileDidUpdateSourceDisplayOrder___block_invoke;
    v11[3] = &unk_1E5945628;
    id v12 = v6;
    v13 = self;
    id v10 = v6;
    [v9 invokeBlock:v11];
  }
}

uint64_t __68__HMTelevisionProfile_televisionProfileDidUpdateSourceDisplayOrder___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) profileDidUpdateMediaSourceDisplayOrder:*(void *)(a1 + 40)];
}

- (void)updateMediaSourceDisplayOrder:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v10 = a3;
  id v7 = [(HMAccessoryProfile *)self accessoryProfile];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  [v9 updateMediaSourceDisplayOrder:v10 completionHandler:v6];
}

- (BOOL)mediaSourceDisplayOrderModifiable
{
  v2 = [(HMAccessoryProfile *)self accessoryProfile];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  char v5 = [v4 mediaSourceDisplayOrderModifiable];
  return v5;
}

- (NSArray)mediaSourceDisplayOrder
{
  v2 = [(HMAccessoryProfile *)self accessoryProfile];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  char v5 = [v4 mediaSourceDisplayOrder];

  return (NSArray *)v5;
}

- (HMTelevisionProfile)initWithTelevisionService:(id)a3 linkedServices:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[_HMTelevisionProfile alloc] initWithTelevisionService:v7 linkedServices:v6];

  v11.receiver = self;
  v11.super_class = (Class)HMTelevisionProfile;
  id v9 = [(HMAccessoryProfile *)&v11 initWithAccessoryProfile:v8];
  if (v9) {
    [(_HMTelevisionProfile *)v8 setDelegate:v9];
  }

  return v9;
}

@end