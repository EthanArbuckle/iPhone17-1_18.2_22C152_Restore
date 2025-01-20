@interface HMDBackingStoreResidentUpdateResult
- (HMDBackingStoreResidentUpdateResult)initWithAddedResidentDevices:(id)a3 deletedResidentDevices:(id)a4 reachabilityUpdates:(id)a5;
- (NSSet)addedResidentDevices;
- (NSSet)deletedResidentDevices;
- (NSSet)reachabilityUpdates;
- (void)setAddedResidentDevices:(id)a3;
- (void)setDeletedResidentDevices:(id)a3;
- (void)setReachabilityUpdates:(id)a3;
@end

@implementation HMDBackingStoreResidentUpdateResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reachabilityUpdates, 0);
  objc_storeStrong((id *)&self->_deletedResidentDevices, 0);
  objc_storeStrong((id *)&self->_addedResidentDevices, 0);
}

- (void)setReachabilityUpdates:(id)a3
{
}

- (NSSet)reachabilityUpdates
{
  return self->_reachabilityUpdates;
}

- (void)setDeletedResidentDevices:(id)a3
{
}

- (NSSet)deletedResidentDevices
{
  return self->_deletedResidentDevices;
}

- (void)setAddedResidentDevices:(id)a3
{
}

- (NSSet)addedResidentDevices
{
  return self->_addedResidentDevices;
}

- (HMDBackingStoreResidentUpdateResult)initWithAddedResidentDevices:(id)a3 deletedResidentDevices:(id)a4 reachabilityUpdates:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HMDBackingStoreResidentUpdateResult;
  v11 = [(HMDBackingStoreResidentUpdateResult *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(HMDBackingStoreResidentUpdateResult *)v11 setAddedResidentDevices:v8];
    [(HMDBackingStoreResidentUpdateResult *)v12 setDeletedResidentDevices:v9];
    [(HMDBackingStoreResidentUpdateResult *)v12 setReachabilityUpdates:v10];
  }

  return v12;
}

@end