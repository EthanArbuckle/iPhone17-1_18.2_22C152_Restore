@interface ODRBackgroundMaintenance
- (ODRBackgroundMaintenance)init;
@end

@implementation ODRBackgroundMaintenance

- (ODRBackgroundMaintenance)init
{
  v7.receiver = self;
  v7.super_class = (Class)ODRBackgroundMaintenance;
  v2 = [(ODRBackgroundMaintenance *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    maintenanceQueue = v2->_maintenanceQueue;
    v2->_maintenanceQueue = (TaskQueue *)v3;

    v5 = v2->_maintenanceQueue;
    if (v5) {
      [(NSOperationQueue *)v5->_operationQueue setName:@"OnDemandResourcesDaemon Maintenance Queue"];
    }
  }
  return v2;
}

- (void).cxx_destruct
{
}

@end