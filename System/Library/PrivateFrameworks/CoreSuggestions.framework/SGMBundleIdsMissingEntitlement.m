@interface SGMBundleIdsMissingEntitlement
- (PETScalarEventTracker)tracker;
- (SGMBundleIdsMissingEntitlement)init;
- (void)trackEventWithScalar:(unint64_t)a3 bundleId:(id)a4 entitlement:(id)a5;
@end

@implementation SGMBundleIdsMissingEntitlement

- (void).cxx_destruct
{
}

- (PETScalarEventTracker)tracker
{
  return self->_tracker;
}

- (void)trackEventWithScalar:(unint64_t)a3 bundleId:(id)a4 entitlement:(id)a5
{
  v12[2] = *MEMORY[0x1E4F143B8];
  tracker = self->_tracker;
  v12[0] = a4;
  v12[1] = a5;
  v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a5;
  id v10 = a4;
  v11 = [v8 arrayWithObjects:v12 count:2];
  [(PETScalarEventTracker *)tracker trackEventWithPropertyValues:v11 value:a3];
}

- (SGMBundleIdsMissingEntitlement)init
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)SGMBundleIdsMissingEntitlement;
  v2 = [(SGMBundleIdsMissingEntitlement *)&v10 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"BundleId"];
    v4 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"Entitlement"];
    id v5 = objc_alloc(MEMORY[0x1E4F93738]);
    v11[0] = v3;
    v11[1] = v4;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
    uint64_t v7 = [v5 initWithFeatureId:@"Found" event:@"BundleIdsMissingEntitlement" registerProperties:v6 propertySubsets:MEMORY[0x1E4F1CBF0]];
    tracker = v2->_tracker;
    v2->_tracker = (PETScalarEventTracker *)v7;
  }
  return v2;
}

@end