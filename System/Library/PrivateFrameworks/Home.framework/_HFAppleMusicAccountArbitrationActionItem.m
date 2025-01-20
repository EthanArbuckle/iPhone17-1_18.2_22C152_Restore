@interface _HFAppleMusicAccountArbitrationActionItem
+ (id)loginActionItemForAccessories:(id)a3 account:(id)a4 contextGenerator:(id)a5;
+ (id)logoutActionItemForAccessories:(id)a3 desiredAccount:(id)a4;
- (NAFuture)future;
- (NSDictionary)userInfo;
- (NSSet)accessories;
- (NSString)actionItemDescription;
- (id)description;
- (void)setAccessories:(id)a3;
- (void)setActionItemDescription:(id)a3;
- (void)setFuture:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation _HFAppleMusicAccountArbitrationActionItem

+ (id)logoutActionItemForAccessories:(id)a3 desiredAccount:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  if (![v8 count])
  {
    v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"HFAppleMusicAccountArbitrator.m", 187, @"Invalid parameter not satisfying: %@", @"accessories.count > 0" object file lineNumber description];
  }
  v9 = objc_opt_new();
  v10 = objc_msgSend(v8, "na_filter:", &__block_literal_global_214);

  if (v7)
  {
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __91___HFAppleMusicAccountArbitrationActionItem_logoutActionItemForAccessories_desiredAccount___block_invoke_2;
    v22[3] = &unk_26408D968;
    id v23 = v7;
    uint64_t v11 = objc_msgSend(v10, "na_filter:", v22);

    v10 = (void *)v11;
  }
  v12 = objc_msgSend(v10, "na_filter:", &__block_literal_global_58_3);

  [v9 setAccessories:v12];
  uint64_t v13 = [v12 count];
  v14 = (void *)MEMORY[0x263F58190];
  if (v13)
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __91___HFAppleMusicAccountArbitrationActionItem_logoutActionItemForAccessories_desiredAccount___block_invoke_5;
    v20[3] = &unk_26408E4E0;
    id v21 = v12;
    v15 = [v14 lazyFutureWithBlock:v20];
    [v9 setFuture:v15];

    v16 = v21;
  }
  else
  {
    v16 = [MEMORY[0x263F58190] lazyFutureWithBlock:&__block_literal_global_60_1];
    [v9 setFuture:v16];
  }

  if (v7)
  {
    v17 = [NSString stringWithFormat:@"Accessory Logout for accessories which are not '%@'", v7];
    [v9 setActionItemDescription:v17];
  }
  else
  {
    [v9 setActionItemDescription:@"Accessory Logout"];
  }

  return v9;
}

+ (id)loginActionItemForAccessories:(id)a3 account:(id)a4 contextGenerator:(id)a5
{
  v57[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (![v9 count])
  {
    v37 = [MEMORY[0x263F08690] currentHandler];
    [v37 handleFailureInMethod:a2, a1, @"HFAppleMusicAccountArbitrator.m", 225, @"Invalid parameter not satisfying: %@", @"accessories.count > 0" object file lineNumber description];
  }
  if (v11) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  uint64_t v13 = @"Proxy ('Manual') Login Plan";
  if (!v12) {
    uint64_t v13 = @"Companion ('Magic') ->Proxy ('Manual') Login Plan";
  }
  if (v10) {
    v14 = @"Companion ('Magic') Login Plan";
  }
  else {
    v14 = 0;
  }
  if (v11) {
    v15 = v13;
  }
  else {
    v15 = v14;
  }
  v16 = objc_opt_new();
  [v16 setAccessories:v9];
  v17 = objc_opt_new();
  v18 = objc_opt_new();
  v56 = @"accessoryUUIDToAuthKitContext";
  v57[0] = v18;
  v19 = [NSDictionary dictionaryWithObjects:v57 forKeys:&v56 count:1];
  [v16 setUserInfo:v19];

  if (v11)
  {
    v38 = v15;
    v39 = v16;
    v20 = v11;
    id v40 = v9;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id obj = [v16 accessories];
    uint64_t v21 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          v25 = v17;
          if (*(void *)v52 != v23) {
            objc_enumerationMutation(obj);
          }
          uint64_t v26 = *(void *)(*((void *)&v51 + 1) + 8 * i);
          v27 = (void *)MEMORY[0x263F58190];
          v47[0] = MEMORY[0x263EF8330];
          v47[1] = 3221225472;
          v47[2] = __100___HFAppleMusicAccountArbitrationActionItem_loginActionItemForAccessories_account_contextGenerator___block_invoke;
          v47[3] = &unk_26409B100;
          id v50 = v20;
          v47[4] = v26;
          id v48 = v10;
          id v49 = v18;
          v28 = [v27 lazyFutureWithBlock:v47];
          v17 = v25;
          [v25 addObject:v28];
        }
        uint64_t v22 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
      }
      while (v22);
    }

    v16 = v39;
    id v9 = v40;
    id v11 = v20;
    v15 = v38;
  }
  v29 = NSString;
  v30 = [v16 accessories];
  v31 = [v29 stringWithFormat:@"%@ Login for Accessories %@", v15, v30];
  [v16 setActionItemDescription:v31];

  uint64_t v32 = [v9 count];
  v33 = (void *)MEMORY[0x263F58190];
  if (v32)
  {
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __100___HFAppleMusicAccountArbitrationActionItem_loginActionItemForAccessories_account_contextGenerator___block_invoke_4;
    v42[3] = &unk_264097100;
    id v43 = v10;
    id v44 = v9;
    id v45 = v17;
    id v46 = v18;
    v34 = [v33 lazyFutureWithBlock:v42];
    [v16 setFuture:v34];

    v35 = v43;
  }
  else
  {
    v35 = [MEMORY[0x263F58190] lazyFutureWithBlock:&__block_literal_global_87];
    [v16 setFuture:v35];
  }

  return v16;
}

- (id)description
{
  v3 = [MEMORY[0x263F58188] builderWithObject:self];
  v4 = [(_HFAppleMusicAccountArbitrationActionItem *)self actionItemDescription];
  [v3 appendString:v4 withName:@"actionItemDescription"];

  v5 = [(_HFAppleMusicAccountArbitrationActionItem *)self accessories];
  id v6 = (id)[v3 appendObject:v5 withName:@"accessories"];

  id v7 = [(_HFAppleMusicAccountArbitrationActionItem *)self future];
  id v8 = (id)[v3 appendObject:v7 withName:@"future"];

  id v9 = [(_HFAppleMusicAccountArbitrationActionItem *)self userInfo];
  [v3 appendDictionarySection:v9 withName:@"userInfo" skipIfEmpty:1];

  id v10 = [v3 build];

  return v10;
}

- (NSString)actionItemDescription
{
  return self->_actionItemDescription;
}

- (void)setActionItemDescription:(id)a3
{
}

- (NSSet)accessories
{
  return self->_accessories;
}

- (void)setAccessories:(id)a3
{
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (NAFuture)future
{
  return self->_future;
}

- (void)setFuture:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_future, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_actionItemDescription, 0);
}

@end