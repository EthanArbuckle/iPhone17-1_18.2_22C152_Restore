@interface HFAccessoryProfileGroupItem
- (HFAccessoryProfileGroupItem)init;
- (HFAccessoryProfileGroupItem)initWithProfiles:(id)a3 groupIdentifier:(id)a4 valueSource:(id)a5;
- (HFCharacteristicValueSource)valueSource;
- (NSNumber)groupIdentifier;
- (NSSet)profiles;
- (NSSet)services;
- (id)_buildProfileItems;
- (id)accessories;
- (id)copyWithValueSource:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation HFAccessoryProfileGroupItem

- (HFAccessoryProfileGroupItem)initWithProfiles:(id)a3 groupIdentifier:(id)a4 valueSource:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HFAccessoryProfileGroupItem;
  v12 = [(HFItemGroupItem *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_profiles, a3);
    objc_storeStrong((id *)&v13->_groupIdentifier, a4);
    objc_storeStrong((id *)&v13->_valueSource, a5);
    v14 = [(HFAccessoryProfileGroupItem *)v13 _buildProfileItems];
    [(HFItemGroupItem *)v13 setItems:v14];
  }
  return v13;
}

- (HFAccessoryProfileGroupItem)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithProfiles_groupIdentifier_valueSource_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFAccessoryProfileGroupItem.m", 34, @"%s is unavailable; use %@ instead",
    "-[HFAccessoryProfileGroupItem init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [(HFAccessoryProfileGroupItem *)self valueSource];
  id v5 = [(HFAccessoryProfileGroupItem *)self copyWithValueSource:v4];

  return v5;
}

- (id)accessories
{
  v2 = [(HFAccessoryProfileGroupItem *)self profiles];
  v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_130);

  return v3;
}

uint64_t __42__HFAccessoryProfileGroupItem_accessories__block_invoke(uint64_t a1, void *a2)
{
  return [a2 accessory];
}

- (NSSet)services
{
  v2 = [(HFAccessoryProfileGroupItem *)self profiles];
  v3 = objc_msgSend(v2, "na_flatMap:", &__block_literal_global_9_5);

  return (NSSet *)v3;
}

id __39__HFAccessoryProfileGroupItem_services__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = [a2 services];
  v4 = [v2 setWithArray:v3];

  return v4;
}

- (id)_buildProfileItems
{
  v3 = [(HFAccessoryProfileGroupItem *)self profiles];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__HFAccessoryProfileGroupItem__buildProfileItems__block_invoke;
  v6[3] = &unk_264096EF8;
  v6[4] = self;
  v4 = objc_msgSend(v3, "na_map:", v6);

  return v4;
}

HFAccessoryProfileItem *__49__HFAccessoryProfileGroupItem__buildProfileItems__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [HFAccessoryProfileItem alloc];
  id v5 = [*(id *)(a1 + 32) valueSource];
  v6 = [(HFAccessoryProfileItem *)v4 initWithProfile:v3 valueSource:v5];

  return v6;
}

- (id)copyWithValueSource:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  v6 = [(HFAccessoryProfileGroupItem *)self profiles];
  v7 = [(HFAccessoryProfileGroupItem *)self groupIdentifier];
  v8 = (void *)[v5 initWithProfiles:v6 groupIdentifier:v7 valueSource:v4];

  [v8 copyLatestResultsFromItem:self];
  return v8;
}

- (NSSet)profiles
{
  return self->_profiles;
}

- (NSNumber)groupIdentifier
{
  return self->_groupIdentifier;
}

- (HFCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueSource, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_profiles, 0);
}

@end