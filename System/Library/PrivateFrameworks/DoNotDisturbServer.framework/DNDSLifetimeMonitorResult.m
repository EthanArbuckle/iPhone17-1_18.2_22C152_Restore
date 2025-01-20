@interface DNDSLifetimeMonitorResult
- (DNDSLifetimeMonitorResult)initWithActiveUUIDs:(id)a3 expiredUUIDs:(id)a4;
- (NSArray)activeUUIDs;
- (NSArray)expiredUUIDs;
@end

@implementation DNDSLifetimeMonitorResult

- (DNDSLifetimeMonitorResult)initWithActiveUUIDs:(id)a3 expiredUUIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DNDSLifetimeMonitorResult;
  v8 = [(DNDSLifetimeMonitorResult *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    activeUUIDs = v8->_activeUUIDs;
    v8->_activeUUIDs = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    expiredUUIDs = v8->_expiredUUIDs;
    v8->_expiredUUIDs = (NSArray *)v11;
  }
  return v8;
}

- (NSArray)activeUUIDs
{
  return self->_activeUUIDs;
}

- (NSArray)expiredUUIDs
{
  return self->_expiredUUIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiredUUIDs, 0);
  objc_storeStrong((id *)&self->_activeUUIDs, 0);
}

@end