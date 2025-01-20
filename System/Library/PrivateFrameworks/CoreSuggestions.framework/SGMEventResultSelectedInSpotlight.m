@interface SGMEventResultSelectedInSpotlight
- (PETScalarEventTracker)tracker;
- (SGMEventResultSelectedInSpotlight)init;
- (void)trackEventWithScalar:(unint64_t)a3;
@end

@implementation SGMEventResultSelectedInSpotlight

- (void).cxx_destruct
{
}

- (PETScalarEventTracker)tracker
{
  return self->_tracker;
}

- (void)trackEventWithScalar:(unint64_t)a3
{
}

- (SGMEventResultSelectedInSpotlight)init
{
  v7.receiver = self;
  v7.super_class = (Class)SGMEventResultSelectedInSpotlight;
  v2 = [(SGMEventResultSelectedInSpotlight *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F93738]);
    uint64_t v4 = [v3 initWithFeatureId:@"Found" event:@"EventResultSelectedInSpotlight" registerProperties:MEMORY[0x1E4F1CBF0] propertySubsets:MEMORY[0x1E4F1CBF0]];
    tracker = v2->_tracker;
    v2->_tracker = (PETScalarEventTracker *)v4;
  }
  return v2;
}

@end