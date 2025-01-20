@interface HMMutableUserListeningHistoryUpdateControl
- (HMMutableUserListeningHistoryUpdateControl)initWithAccessories:(id)a3;
- (NSArray)accessories;
- (id)copyWithZone:(_NSZone *)a3;
- (void)addAccessory:(id)a3;
- (void)removeAccessory:(id)a3;
- (void)setAccessories:(id)a3;
@end

@implementation HMMutableUserListeningHistoryUpdateControl

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [HMUserListeningHistoryUpdateControl alloc];
  v5 = [(HMMutableUserListeningHistoryUpdateControl *)self accessories];
  v6 = (void *)[v5 copy];
  v7 = [(HMUserListeningHistoryUpdateControl *)v4 initWithAccessories:v6];

  return v7;
}

- (void)removeAccessory:(id)a3
{
}

- (void)addAccessory:(id)a3
{
}

- (void)setAccessories:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA80];
  id v7 = (id)[a3 copy];
  v5 = [v4 setWithArray:v7];
  internalAccessories = self->super._internalAccessories;
  self->super._internalAccessories = v5;
}

- (NSArray)accessories
{
  return (NSArray *)[(NSMutableSet *)self->super._internalAccessories allObjects];
}

- (HMMutableUserListeningHistoryUpdateControl)initWithAccessories:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HMMutableUserListeningHistoryUpdateControl;
  return [(HMUserListeningHistoryUpdateControl *)&v4 initWithAccessories:a3];
}

@end