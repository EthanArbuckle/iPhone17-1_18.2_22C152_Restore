@interface HFBlindsServiceItem
+ (id)supportedServiceTypes;
- (id)createControlItemsWithOptions:(id)a3;
- (int64_t)_doorServicePriority;
@end

@implementation HFBlindsServiceItem

+ (id)supportedServiceTypes
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F0D8B8]];
}

- (id)createControlItemsWithOptions:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)HFBlindsServiceItem;
  v4 = [(HFDoorServiceItem *)&v12 createControlItemsWithOptions:a3];
  v5 = [(HFServiceItem *)self controlItemValueSourceForPrimaryService];
  v6 = [HFSimpleIncrementalControlItem alloc];
  v7 = [(HFSimpleIncrementalControlItem *)v6 initWithValueSource:v5 characteristicType:*MEMORY[0x263F0C4E8] displayResults:0];
  v8 = [HFSimpleIncrementalControlItem alloc];
  v9 = [(HFSimpleIncrementalControlItem *)v8 initWithValueSource:v5 characteristicType:*MEMORY[0x263F0C568] displayResults:0];
  v10 = (void *)[v4 mutableCopy];
  [v10 addObject:v7];
  [v10 addObject:v9];

  return v10;
}

- (int64_t)_doorServicePriority
{
  return 0;
}

@end