@interface HFAppleMusicAccountArbitrator
- (ACAccount)account;
- (BOOL)forceLogout;
- (HFAppleMusicAccountArbitrator)init;
- (HFAppleMusicAccountArbitrator)initWithAccessories:(id)a3 account:(id)a4 contextGenerator:(id)a5;
- (NAFuture)activeArbitrationFuture;
- (NSSet)accessories;
- (id)contextGenerator;
- (id)pendingArbitrationExecutionFuture;
- (int64_t)_resolvedLoginType:(id *)a3;
- (int64_t)loginType;
- (void)setActiveArbitrationFuture:(id)a3;
- (void)setForceLogout:(BOOL)a3;
- (void)setLoginType:(int64_t)a3;
@end

@implementation HFAppleMusicAccountArbitrator

- (HFAppleMusicAccountArbitrator)initWithAccessories:(id)a3 account:(id)a4 contextGenerator:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (![v9 count])
  {
    v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"HFAppleMusicAccountArbitrator.m", 354, @"Invalid parameter not satisfying: %@", @"accessories.count > 0" object file lineNumber description];
  }
  v19.receiver = self;
  v19.super_class = (Class)HFAppleMusicAccountArbitrator;
  v12 = [(HFAppleMusicAccountArbitrator *)&v19 init];
  if (v12)
  {
    uint64_t v13 = [v9 copy];
    accessories = v12->_accessories;
    v12->_accessories = (NSSet *)v13;

    objc_storeStrong((id *)&v12->_account, a4);
    uint64_t v15 = [v11 copy];
    id contextGenerator = v12->_contextGenerator;
    v12->_id contextGenerator = (id)v15;

    v12->_loginType = 0;
  }

  return v12;
}

- (HFAppleMusicAccountArbitrator)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithAccessories_account_contextGenerator_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFAppleMusicAccountArbitrator.m", 369, @"%s is unavailable; use %@ instead",
    "-[HFAppleMusicAccountArbitrator init]",
    v5);

  return 0;
}

- (id)pendingArbitrationExecutionFuture
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  v4 = [(HFAppleMusicAccountArbitrator *)self activeArbitrationFuture];

  if (v4)
  {
    v5 = [(HFAppleMusicAccountArbitrator *)self activeArbitrationFuture];
    goto LABEL_27;
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v6 = [(HFAppleMusicAccountArbitrator *)self accessories];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v45 objects:v63 count:16];
  if (!v7) {
    goto LABEL_12;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v46;
  while (2)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v46 != v9) {
        objc_enumerationMutation(v6);
      }
      id v11 = *(void **)(*((void *)&v45 + 1) + 8 * i);
      v12 = [v11 remoteLoginHandler];
      uint64_t v13 = v12;
      if (!v12)
      {
        v20 = (void *)MEMORY[0x263F58190];
        v21 = (void *)MEMORY[0x263F087E8];
        v61[0] = @"accessory";
        v61[1] = @"accessories";
        v62[0] = v11;
        v22 = [(HFAppleMusicAccountArbitrator *)self accessories];
        v62[1] = v22;
        v23 = [NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:2];
        v24 = v21;
        uint64_t v25 = 11;
LABEL_16:
        v27 = objc_msgSend(v24, "hf_errorWithCode:operation:options:", v25, @"AppleMusicAccountArbitratorLogin", v23);
        v5 = [v20 futureWithError:v27];

        goto LABEL_26;
      }
      if (([v12 isControllable] & 1) == 0)
      {
        v20 = (void *)MEMORY[0x263F58190];
        v26 = (void *)MEMORY[0x263F087E8];
        v59[0] = @"accessory";
        v59[1] = @"accessories";
        v60[0] = v11;
        v22 = [(HFAppleMusicAccountArbitrator *)self accessories];
        v60[1] = v22;
        v23 = [NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:2];
        v24 = v26;
        uint64_t v25 = 12;
        goto LABEL_16;
      }
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v45 objects:v63 count:16];
    if (v8) {
      continue;
    }
    break;
  }
LABEL_12:

  v14 = objc_opt_new();
  uint64_t v15 = [(HFAppleMusicAccountArbitrator *)self accessories];
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __66__HFAppleMusicAccountArbitrator_pendingArbitrationExecutionFuture__block_invoke;
  v42[3] = &unk_26409B128;
  v42[4] = self;
  SEL v44 = a2;
  id v6 = v14;
  id v43 = v6;
  objc_msgSend(v15, "na_each:", v42);

  v16 = [(HFAppleMusicAccountArbitrator *)self account];
  v17 = [(HFAppleMusicAccountArbitrator *)self contextGenerator];
  id v41 = 0;
  int64_t v18 = [(HFAppleMusicAccountArbitrator *)self _resolvedLoginType:&v41];
  id v19 = v41;
  if (!v19)
  {
    if (v18 == 1)
    {
      v28 = v17;
      v17 = 0;
    }
    else
    {
      if (v18 != 2)
      {
LABEL_22:
        v29 = [(HFAppleMusicAccountArbitrator *)self accessories];
        v30 = +[_HFAppleMusicAccountArbitrationActionItem loginActionItemForAccessories:v29 account:v16 contextGenerator:v17];

        [v6 addObject:v30];
        v31 = HFLogForCategory(0);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          v32 = NSStringFromSelector(a2);
          v33 = [NSNumber numberWithInteger:v18];
          *(_DWORD *)buf = 138413314;
          v50 = self;
          __int16 v51 = 2112;
          v52 = v32;
          __int16 v53 = 2112;
          v54 = v30;
          __int16 v55 = 2112;
          v56 = v16;
          __int16 v57 = 2112;
          v58 = v33;
          _os_log_impl(&dword_20B986000, v31, OS_LOG_TYPE_DEFAULT, "%@:%@ Added Login plan = [%@] account = [%@] loginType = [%@]", buf, 0x34u);
        }
        v34 = objc_msgSend(v6, "na_map:", &__block_literal_global_158_2);
        v35 = (void *)MEMORY[0x263F58190];
        v39[0] = MEMORY[0x263EF8330];
        v39[1] = 3221225472;
        v39[2] = __66__HFAppleMusicAccountArbitrator_pendingArbitrationExecutionFuture__block_invoke_2;
        v39[3] = &unk_26408E4E0;
        id v40 = v34;
        id v36 = v34;
        v37 = [v35 lazyFutureWithBlock:v39];
        [(HFAppleMusicAccountArbitrator *)self setActiveArbitrationFuture:v37];

        v5 = [(HFAppleMusicAccountArbitrator *)self activeArbitrationFuture];

        goto LABEL_25;
      }
      v28 = v16;
      v16 = 0;
    }

    goto LABEL_22;
  }
  v5 = [MEMORY[0x263F58190] futureWithError:v19];
LABEL_25:

LABEL_26:
LABEL_27:
  return v5;
}

void __66__HFAppleMusicAccountArbitrator_pendingArbitrationExecutionFuture__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (([v3 supportsMultiUser] & 1) == 0)
  {
    if ([*(id *)(a1 + 32) forceLogout])
    {
      v4 = 0;
    }
    else
    {
      v4 = [*(id *)(a1 + 32) account];
    }
    v5 = [MEMORY[0x263EFFA08] setWithObject:v3];
    id v6 = +[_HFAppleMusicAccountArbitrationActionItem logoutActionItemForAccessories:v5 desiredAccount:v4];

    uint64_t v7 = HFLogForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v10 = 138412802;
      uint64_t v11 = v8;
      __int16 v12 = 2112;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = v4;
      _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ Added Logout plan for account = [%@]", (uint8_t *)&v10, 0x20u);
    }
    [*(id *)(a1 + 40) addObject:v6];
  }
}

uint64_t __66__HFAppleMusicAccountArbitrator_pendingArbitrationExecutionFuture__block_invoke_155(uint64_t a1, void *a2)
{
  return [a2 future];
}

void __66__HFAppleMusicAccountArbitrator_pendingArbitrationExecutionFuture__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F58190];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  id v7 = [v2 chainFutures:v3];
  v5 = [v4 completionHandlerAdapter];

  id v6 = (id)[v7 addCompletionBlock:v5];
}

- (int64_t)_resolvedLoginType:(id *)a3
{
  int64_t v5 = [(HFAppleMusicAccountArbitrator *)self loginType];
  int64_t v6 = v5;
  if (!v5)
  {
    uint64_t v9 = [(HFAppleMusicAccountArbitrator *)self contextGenerator];
    if (!v9
      || (int v10 = (void *)v9,
          [(HFAppleMusicAccountArbitrator *)self account],
          uint64_t v11 = objc_claimAutoreleasedReturnValue(),
          v11,
          v10,
          !v11))
    {
      __int16 v12 = [(HFAppleMusicAccountArbitrator *)self contextGenerator];

      if (v12) {
        return 2;
      }
      uint64_t v13 = [(HFAppleMusicAccountArbitrator *)self account];

      if (v13) {
        return 1;
      }
      if (a3) {
        goto LABEL_5;
      }
    }
    return 0;
  }
  if (v5 != 1) {
    return v6;
  }
  id v7 = [(HFAppleMusicAccountArbitrator *)self account];

  int64_t result = 1;
  if (a3 && !v7)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:operation:options:", 9, @"Failed verification of login type", 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    return v6;
  }
  return result;
}

- (ACAccount)account
{
  return self->_account;
}

- (NSSet)accessories
{
  return self->_accessories;
}

- (id)contextGenerator
{
  return self->_contextGenerator;
}

- (int64_t)loginType
{
  return self->_loginType;
}

- (void)setLoginType:(int64_t)a3
{
  self->_loginType = a3;
}

- (BOOL)forceLogout
{
  return self->_forceLogout;
}

- (void)setForceLogout:(BOOL)a3
{
  self->_forceLogout = a3;
}

- (NAFuture)activeArbitrationFuture
{
  return self->_activeArbitrationFuture;
}

- (void)setActiveArbitrationFuture:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeArbitrationFuture, 0);
  objc_storeStrong(&self->_contextGenerator, 0);
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end