@interface AMSEngagementObserverInfo
- (AMSEngagementObserverInfo)initWithQueue:(id)a3;
- (NSMutableSet)underlyingPlacements;
- (NSMutableSet)underlyingServiceTypes;
- (NSSet)placements;
- (NSSet)serviceTypes;
- (OS_dispatch_queue)dispatchQueue;
- (void)addPlacements:(id)a3;
- (void)addServiceType:(id)a3;
- (void)removePlacement:(id)a3;
- (void)removeServiceType:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setUnderlyingPlacements:(id)a3;
- (void)setUnderlyingServiceTypes:(id)a3;
@end

@implementation AMSEngagementObserverInfo

- (void)addServiceType:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSEngagementObserverInfo *)self underlyingServiceTypes];
  [v5 addObject:v4];
}

- (NSMutableSet)underlyingServiceTypes
{
  return self->_underlyingServiceTypes;
}

- (void)addPlacements:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSEngagementObserverInfo *)self underlyingPlacements];
  [v5 unionSet:v4];
}

- (NSMutableSet)underlyingPlacements
{
  return self->_underlyingPlacements;
}

- (void)setDispatchQueue:(id)a3
{
}

- (AMSEngagementObserverInfo)initWithQueue:(id)a3
{
  id v5 = a3;
  v6 = [(AMSEngagementObserverInfo *)self init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dispatchQueue, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
    underlyingPlacements = v7->_underlyingPlacements;
    v7->_underlyingPlacements = (NSMutableSet *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
    underlyingServiceTypes = v7->_underlyingServiceTypes;
    v7->_underlyingServiceTypes = (NSMutableSet *)v10;
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingServiceTypes, 0);
  objc_storeStrong((id *)&self->_underlyingPlacements, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

- (NSSet)placements
{
  v3 = [(AMSEngagementObserverInfo *)self underlyingPlacements];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = [(AMSEngagementObserverInfo *)self underlyingPlacements];
  }
  else
  {
    id v5 = 0;
  }
  return (NSSet *)v5;
}

- (NSSet)serviceTypes
{
  v3 = [(AMSEngagementObserverInfo *)self underlyingServiceTypes];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = [(AMSEngagementObserverInfo *)self underlyingServiceTypes];
  }
  else
  {
    id v5 = 0;
  }
  return (NSSet *)v5;
}

- (void)removePlacement:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSEngagementObserverInfo *)self underlyingPlacements];
  [v5 removeObject:v4];
}

- (void)removeServiceType:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSEngagementObserverInfo *)self underlyingPlacements];
  [v5 removeObject:v4];
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setUnderlyingPlacements:(id)a3
{
}

- (void)setUnderlyingServiceTypes:(id)a3
{
}

@end