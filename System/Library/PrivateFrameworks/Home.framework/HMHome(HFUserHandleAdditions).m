@interface HMHome(HFUserHandleAdditions)
- (HFUserHandle)hf_handleForUser:()HFUserHandleAdditions;
- (id)hf_userForHandle:()HFUserHandleAdditions;
@end

@implementation HMHome(HFUserHandleAdditions)

- (HFUserHandle)hf_handleForUser:()HFUserHandleAdditions
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [a1 currentUser];
  int v6 = [v5 isEqual:v4];

  v7 = [v4 userID];

  if (v7 || (v6 & 1) != 0)
  {
    v10 = [HFUserHandle alloc];
    v11 = [v4 userID];
    v9 = [(HFUserHandle *)v10 initWithType:v6 ^ 1u userID:v11];
  }
  else
  {
    v8 = HFLogForCategory(0x46uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      id v14 = v4;
      _os_log_error_impl(&dword_20B986000, v8, OS_LOG_TYPE_ERROR, "Can't create HFUserHandle from HMUser because HMUser.userID is nil: %@", (uint8_t *)&v13, 0xCu);
    }

    v9 = 0;
  }

  return v9;
}

- (id)hf_userForHandle:()HFUserHandleAdditions
{
  id v5 = a3;
  uint64_t v6 = [v5 type];
  if (v6 == 1)
  {
    v8 = [a1 users];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __50__HMHome_HFUserHandleAdditions__hf_userForHandle___block_invoke;
    v11[3] = &unk_26408F748;
    id v12 = v5;
    v7 = objc_msgSend(v8, "na_firstObjectPassingTest:", v11);
  }
  else if (v6)
  {
    v9 = [MEMORY[0x263F08690] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"HFUserHandle.m", 83, @"Unknown user handle %@", v5 object file lineNumber description];

    v7 = 0;
  }
  else
  {
    v7 = [a1 currentUser];
  }

  return v7;
}

@end