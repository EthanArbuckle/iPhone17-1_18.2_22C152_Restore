@interface HFPinCodeItemProvider
- (HFPinCodeItemProvider)init;
- (HFPinCodeItemProvider)initWithHome:(id)a3 pinCodeManager:(id)a4 listType:(unint64_t)a5 forAccessory:(id)a6;
- (HFPinCodeManager)pinCodeManager;
- (HMAccessory)accessory;
- (HMHome)home;
- (NSMutableSet)pinCodeItems;
- (id)copyWithZone:(_NSZone *)a3;
- (id)invalidationReasons;
- (id)reloadItems;
- (unint64_t)listType;
- (void)setAccessory:(id)a3;
- (void)setHome:(id)a3;
- (void)setListType:(unint64_t)a3;
- (void)setPinCodeItems:(id)a3;
@end

@implementation HFPinCodeItemProvider

- (HFPinCodeItemProvider)initWithHome:(id)a3 pinCodeManager:(id)a4 listType:(unint64_t)a5 forAccessory:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)HFPinCodeItemProvider;
  v14 = [(HFItemProvider *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_home, a3);
    objc_storeStrong((id *)&v15->_pinCodeManager, a4);
    v15->_listType = a5;
    uint64_t v16 = [MEMORY[0x263EFF9C0] set];
    pinCodeItems = v15->_pinCodeItems;
    v15->_pinCodeItems = (NSMutableSet *)v16;

    objc_storeStrong((id *)&v15->_accessory, a6);
  }

  return v15;
}

- (HFPinCodeItemProvider)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithHome_pinCodeManager_listType_forAccessory_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFPinCodeItemProvider.m", 45, @"%s is unavailable; use %@ instead",
    "-[HFPinCodeItemProvider init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(HFPinCodeItemProvider *)self home];
  v6 = [(HFPinCodeItemProvider *)self pinCodeManager];
  unint64_t v7 = [(HFPinCodeItemProvider *)self listType];
  v8 = [(HFPinCodeItemProvider *)self accessory];
  v9 = (void *)[v4 initWithHome:v5 pinCodeManager:v6 listType:v7 forAccessory:v8];

  return v9;
}

- (id)reloadItems
{
  switch([(HFPinCodeItemProvider *)self listType])
  {
    case 1uLL:
      v3 = [(HFPinCodeItemProvider *)self pinCodeManager];
      uint64_t v4 = [v3 userPinCodes];
      goto LABEL_7;
    case 2uLL:
      v3 = [(HFPinCodeItemProvider *)self pinCodeManager];
      uint64_t v4 = [v3 guestPinCodes];
      goto LABEL_7;
    case 3uLL:
      v3 = [(HFPinCodeItemProvider *)self pinCodeManager];
      uint64_t v4 = [v3 removedUserPINCodes];
      goto LABEL_7;
    case 4uLL:
      v3 = [(HFPinCodeItemProvider *)self pinCodeManager];
      uint64_t v4 = [v3 otherEcosystemGuestPinCodes];
LABEL_7:
      v5 = (void *)v4;

      break;
    default:
      v5 = 0;
      break;
  }
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __36__HFPinCodeItemProvider_reloadItems__block_invoke_3;
  v8[3] = &unk_26409A410;
  v8[4] = self;
  id v9 = &__block_literal_global_194;
  id v10 = &__block_literal_global_11_8;
  objc_copyWeak(&v11, &location);
  v6 = [v5 flatMap:v8];
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
  return v6;
}

uint64_t __36__HFPinCodeItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 hash];
  return [v2 numberWithUnsignedInteger:v3];
}

uint64_t __36__HFPinCodeItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 hash];
  return [v2 numberWithUnsignedInteger:v3];
}

id __36__HFPinCodeItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) listType] == 3)
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __36__HFPinCodeItemProvider_reloadItems__block_invoke_4;
    v14[3] = &unk_264096C60;
    v14[4] = *(void *)(a1 + 32);
    uint64_t v4 = objc_msgSend(v3, "na_filter:", v14);

    id v3 = (id)v4;
  }
  v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __36__HFPinCodeItemProvider_reloadItems__block_invoke_5;
  v13[3] = &unk_26409A3E8;
  v13[4] = v5;
  v8 = [v5 reloadItemsWithObjects:v3 keyAdaptor:v6 itemAdaptor:v7 filter:0 itemMap:v13];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __36__HFPinCodeItemProvider_reloadItems__block_invoke_6;
  v11[3] = &unk_26408D198;
  objc_copyWeak(&v12, (id *)(a1 + 56));
  id v9 = [v8 flatMap:v11];
  objc_destroyWeak(&v12);

  return v9;
}

uint64_t __36__HFPinCodeItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = [a2 accessories];
  uint64_t v4 = [*(id *)(a1 + 32) accessory];
  uint64_t v5 = [v3 containsObject:v4];

  return v5;
}

HFPinCodeItem *__36__HFPinCodeItemProvider_reloadItems__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [HFPinCodeItem alloc];
  uint64_t v5 = [*(id *)(a1 + 32) home];
  uint64_t v6 = [*(id *)(a1 + 32) accessory];
  uint64_t v7 = [(HFPinCodeItem *)v4 initWithPinCode:v3 inHome:v5 onAccessory:v6];

  return v7;
}

id __36__HFPinCodeItemProvider_reloadItems__block_invoke_6(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v5 = [WeakRetained pinCodeItems];
  uint64_t v6 = [v3 removedItems];
  [v5 minusSet:v6];

  uint64_t v7 = [WeakRetained pinCodeItems];
  v8 = [v3 addedItems];
  [v7 unionSet:v8];

  id v9 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v9;
}

- (id)invalidationReasons
{
  v7[3] = *MEMORY[0x263EF8340];
  v6.receiver = self;
  v6.super_class = (Class)HFPinCodeItemProvider;
  v2 = [(HFItemProvider *)&v6 invalidationReasons];
  v7[0] = @"accessory";
  v7[1] = @"service";
  v7[2] = @"user";
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:3];
  uint64_t v4 = [v2 setByAddingObjectsFromArray:v3];

  return v4;
}

- (HFPinCodeManager)pinCodeManager
{
  return self->_pinCodeManager;
}

- (NSMutableSet)pinCodeItems
{
  return self->_pinCodeItems;
}

- (void)setPinCodeItems:(id)a3
{
}

- (unint64_t)listType
{
  return self->_listType;
}

- (void)setListType:(unint64_t)a3
{
  self->_listType = a3;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (void)setAccessory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_pinCodeItems, 0);
  objc_storeStrong((id *)&self->_pinCodeManager, 0);
}

@end