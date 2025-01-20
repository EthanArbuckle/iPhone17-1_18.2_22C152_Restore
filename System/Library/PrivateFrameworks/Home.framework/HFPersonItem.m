@interface HFPersonItem
- (HFPersonItem)initWithPerson:(id)a3 fromPersonManager:(id)a4 home:(id)a5;
- (HMHome)home;
- (HMPersonManager)personManager;
- (NSString)description;
- (id)_homeKitObjectFetch;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation HFPersonItem

- (HFPersonItem)initWithPerson:(id)a3 fromPersonManager:(id)a4 home:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HFPersonItem;
  v11 = [(HFFetchedHomeKitObjectItem *)&v14 initWithHomeKitObject:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_personManager, a4);
    objc_storeStrong((id *)&v12->_home, a5);
  }

  return v12;
}

- (NSString)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)HFPersonItem;
  v4 = [(HFItem *)&v9 description];
  v5 = [(HFPersonItem *)self person];
  v6 = [(HFPersonItem *)self personManager];
  v7 = [v3 stringWithFormat:@"%@ person: %@ manager: %@", v4, v5, v6];

  return (NSString *)v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(HFPersonItem *)self person];
  v6 = [(HFPersonItem *)self personManager];
  v7 = [(HFPersonItem *)self home];
  v8 = (void *)[v4 initWithPerson:v5 fromPersonManager:v6 home:v7];

  [v8 copyLatestResultsFromItem:self];
  return v8;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFPersonItem;
  v5 = [(HFFetchedHomeKitObjectItem *)&v11 _subclass_updateWithOptions:v4];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __44__HFPersonItem__subclass_updateWithOptions___block_invoke;
  v9[3] = &unk_26408D148;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  v7 = [v5 flatMap:v9];

  return v7;
}

id __44__HFPersonItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)[a2 mutableCopy];
  id v4 = [HFPersonItemUpdateRequest alloc];
  v5 = [*(id *)(a1 + 32) person];
  id v6 = [*(id *)(a1 + 32) personManager];
  v7 = [*(id *)(a1 + 32) home];
  v8 = [(HFPersonItemUpdateRequest *)v4 initWithPerson:v5 personManager:v6 home:v7];

  objc_super v9 = [(HFPersonItemUpdateRequest *)v8 updateWithOptions:*(void *)(a1 + 40)];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __44__HFPersonItem__subclass_updateWithOptions___block_invoke_2;
  v13[3] = &unk_26408E470;
  id v14 = v3;
  id v10 = v3;
  objc_super v11 = [v9 flatMap:v13];

  return v11;
}

uint64_t __44__HFPersonItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) addResultsFromOutcome:a2];
  v3 = (void *)MEMORY[0x263F58190];
  uint64_t v4 = *(void *)(a1 + 32);
  return [v3 futureWithResult:v4];
}

- (id)_homeKitObjectFetch
{
  v3 = [(HFPersonItem *)self personManager];
  uint64_t v4 = [(HFPersonItem *)self person];
  v5 = [v4 UUID];
  id v6 = objc_msgSend(v3, "hf_personWithIdentifier:", v5);

  return v6;
}

- (HMPersonManager)personManager
{
  return self->_personManager;
}

- (HMHome)home
{
  return self->_home;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_personManager, 0);
}

@end