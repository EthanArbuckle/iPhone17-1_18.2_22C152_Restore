@interface HFMutableAggregatedCharacteristicReadPolicy
- (id)copyWithZone:(_NSZone *)a3;
- (id)popPolicy;
- (void)pushPolicy:(id)a3;
- (void)setPolicies:(id)a3;
@end

@implementation HFMutableAggregatedCharacteristicReadPolicy

- (id)popPolicy
{
  v3 = [(HFAggregatedCharacteristicReadPolicy *)self policies];
  v4 = [v3 lastObject];

  v5 = [(HFAggregatedCharacteristicReadPolicy *)self policies];
  v6 = (void *)[v5 mutableCopy];

  [v6 removeLastObject];
  v7 = (void *)[v6 copy];
  [(HFMutableAggregatedCharacteristicReadPolicy *)self setPolicies:v7];

  return v4;
}

- (void)pushPolicy:(id)a3
{
  id v4 = a3;
  id v6 = [(HFAggregatedCharacteristicReadPolicy *)self policies];
  v5 = [v6 arrayByAddingObject:v4];

  [(HFMutableAggregatedCharacteristicReadPolicy *)self setPolicies:v5];
}

- (void)setPolicies:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [HFAggregatedCharacteristicReadPolicy alloc];
  v5 = [(HFAggregatedCharacteristicReadPolicy *)self policies];
  id v6 = [(HFAggregatedCharacteristicReadPolicy *)v4 initWithPolicies:v5];

  return v6;
}

@end