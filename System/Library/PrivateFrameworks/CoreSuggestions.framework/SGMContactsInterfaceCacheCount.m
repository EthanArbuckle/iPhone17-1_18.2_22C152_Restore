@interface SGMContactsInterfaceCacheCount
- (PETDistributionEventTracker)tracker;
- (SGMContactsInterfaceCacheCount)init;
- (void)trackEventWithScalar:(double)a3;
@end

@implementation SGMContactsInterfaceCacheCount

- (void).cxx_destruct
{
}

- (PETDistributionEventTracker)tracker
{
  return self->_tracker;
}

- (void)trackEventWithScalar:(double)a3
{
}

- (SGMContactsInterfaceCacheCount)init
{
  v7.receiver = self;
  v7.super_class = (Class)SGMContactsInterfaceCacheCount;
  v2 = [(SGMContactsInterfaceCacheCount *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F93718]);
    uint64_t v4 = [v3 initWithFeatureId:@"Found" event:@"ContactsInterfaceCacheCount" registerProperties:MEMORY[0x1E4F1CBF0] propertySubsets:MEMORY[0x1E4F1CBF0]];
    tracker = v2->_tracker;
    v2->_tracker = (PETDistributionEventTracker *)v4;
  }
  return v2;
}

@end