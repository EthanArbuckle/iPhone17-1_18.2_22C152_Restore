@interface HFZoneItem
+ (NAIdentity)na_identity;
- (BOOL)hf_canDeleteItem;
- (BOOL)isEqual:(id)a3;
- (HFZoneItem)init;
- (HFZoneItem)initWithHome:(id)a3 zone:(id)a4;
- (HMHome)home;
- (HMZone)zone;
- (NSString)description;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)hf_deleteItem;
- (unint64_t)hash;
- (void)setHome:(id)a3;
- (void)setZone:(id)a3;
@end

@implementation HFZoneItem

- (HFZoneItem)initWithHome:(id)a3 zone:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFZoneItem;
  v9 = [(HFZoneItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a3);
    objc_storeStrong((id *)&v10->_zone, a4);
  }

  return v10;
}

- (HFZoneItem)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithHome_zone_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFZoneItem.m", 35, @"%s is unavailable; use %@ instead",
    "-[HFZoneItem init]",
    v5);

  return 0;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(HFZoneItem *)self zone];
  id v7 = objc_msgSend(v6, "hf_prettyDescription");
  id v8 = [(HFItem *)self latestResults];
  v9 = [v3 stringWithFormat:@"<%@: %p, %@ %@>", v5, self, v7, v8];

  return (NSString *)v9;
}

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_2_3 != -1) {
    dispatch_once(&_MergedGlobals_2_3, &__block_literal_global_13_7);
  }
  v2 = (void *)qword_26AB2EA38;
  return (NAIdentity *)v2;
}

void __25__HFZoneItem_na_identity__block_invoke_2()
{
  id v4 = [MEMORY[0x263F58198] builder];
  v0 = [v4 appendCharacteristic:&__block_literal_global_17_6];
  v1 = [v0 appendCharacteristic:&__block_literal_global_19_7];
  uint64_t v2 = [v1 build];
  v3 = (void *)qword_26AB2EA38;
  qword_26AB2EA38 = v2;
}

uint64_t __25__HFZoneItem_na_identity__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 home];
}

uint64_t __25__HFZoneItem_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 zone];
}

- (unint64_t)hash
{
  v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

- (BOOL)hf_canDeleteItem
{
  return 1;
}

- (id)hf_deleteItem
{
  v3 = [(HFZoneItem *)self home];
  id v4 = [(HFZoneItem *)self zone];
  v5 = (void *)MEMORY[0x263F58190];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __27__HFZoneItem_hf_deleteItem__block_invoke;
  v10[3] = &unk_26408F0C8;
  id v11 = v4;
  id v12 = v3;
  id v6 = v3;
  id v7 = v4;
  id v8 = [v5 futureWithBlock:v10];

  return v8;
}

void __27__HFZoneItem_hf_deleteItem__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_new();
  v5 = [*(id *)(a1 + 32) rooms];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __27__HFZoneItem_hf_deleteItem__block_invoke_2;
  v16[3] = &unk_2640982E0;
  id v17 = v4;
  id v18 = *(id *)(a1 + 32);
  id v6 = v4;
  objc_msgSend(v5, "na_each:", v16);

  id v7 = (void *)MEMORY[0x263F58190];
  id v8 = [MEMORY[0x263F581B8] mainThreadScheduler];
  v9 = [v7 combineAllFutures:v6 ignoringErrors:1 scheduler:v8];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __27__HFZoneItem_hf_deleteItem__block_invoke_4;
  v12[3] = &unk_264098308;
  id v13 = v3;
  id v14 = *(id *)(a1 + 40);
  id v15 = *(id *)(a1 + 32);
  id v10 = v3;
  id v11 = (id)[v9 addCompletionBlock:v12];
}

void __27__HFZoneItem_hf_deleteItem__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x263F58190];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  id v10 = __27__HFZoneItem_hf_deleteItem__block_invoke_3;
  id v11 = &unk_26408E218;
  v5 = *(void **)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  id v13 = v3;
  id v6 = v3;
  id v7 = [v4 futureWithErrorOnlyHandlerAdapterBlock:&v8];
  objc_msgSend(v5, "addObject:", v7, v8, v9, v10, v11);
}

uint64_t __27__HFZoneItem_hf_deleteItem__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeRoom:*(void *)(a1 + 40) completionHandler:a2];
}

void __27__HFZoneItem_hf_deleteItem__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id v3 = *(void **)(a1 + 32);
    [v3 finishWithResult:a2 error:a3];
  }
  else
  {
    id v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __27__HFZoneItem_hf_deleteItem__block_invoke_5;
    v6[3] = &unk_26408CDF0;
    id v7 = *(id *)(a1 + 32);
    [v4 removeZone:v5 completionHandler:v6];
  }
}

uint64_t __27__HFZoneItem_hf_deleteItem__block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 finishWithError:a2];
  }
  else {
    return [v2 finishWithNoResult];
  }
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  id v4 = objc_alloc_init(MEMORY[0x263F58190]);
  uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
  id v6 = [(HFZoneItem *)self zone];
  id v7 = [v6 name];
  [v5 setObject:v7 forKeyedSubscript:@"title"];

  uint64_t v8 = [(HFZoneItem *)self zone];
  uint64_t v9 = [v8 uniqueIdentifier];
  [v5 setObject:v9 forKeyedSubscript:@"zoneIdentifier"];

  v16[0] = objc_opt_class();
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  [v5 setObject:v10 forKeyedSubscript:@"dependentHomeKitClasses"];

  id v11 = NSNumber;
  id v12 = [(HFZoneItem *)self home];
  id v13 = objc_msgSend(v11, "numberWithBool:", objc_msgSend(v12, "hf_currentUserIsAdministrator"));
  [v5 setObject:v13 forKeyedSubscript:@"administrator"];

  [v5 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"shouldDisableForNonAdminUsers"];
  id v14 = +[HFItemUpdateOutcome outcomeWithResults:v5];
  [v4 finishWithResult:v14];

  return v4;
}

- (HMZone)zone
{
  return self->_zone;
}

- (void)setZone:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_zone, 0);
}

@end