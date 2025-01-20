@interface SGMBundleIdsUsingOldEntitlement
- (PETScalarEventTracker)tracker;
- (SGMBundleIdsUsingOldEntitlement)init;
- (void)trackEventWithScalar:(unint64_t)a3 bundleId:(id)a4;
@end

@implementation SGMBundleIdsUsingOldEntitlement

- (void).cxx_destruct
{
}

- (PETScalarEventTracker)tracker
{
  return self->_tracker;
}

- (void)trackEventWithScalar:(unint64_t)a3 bundleId:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  tracker = self->_tracker;
  id v9 = a4;
  v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  v8 = [v6 arrayWithObjects:&v9 count:1];
  -[PETScalarEventTracker trackEventWithPropertyValues:value:](tracker, "trackEventWithPropertyValues:value:", v8, a3, v9, v10);
}

- (SGMBundleIdsUsingOldEntitlement)init
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)SGMBundleIdsUsingOldEntitlement;
  v2 = [(SGMBundleIdsUsingOldEntitlement *)&v9 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"BundleId"];
    id v4 = objc_alloc(MEMORY[0x1E4F93738]);
    v10[0] = v3;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    uint64_t v6 = [v4 initWithFeatureId:@"Found" event:@"BundleIdsUsingOldEntitlement" registerProperties:v5 propertySubsets:MEMORY[0x1E4F1CBF0]];
    tracker = v2->_tracker;
    v2->_tracker = (PETScalarEventTracker *)v6;
  }
  return v2;
}

@end