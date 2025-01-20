@interface SGMOtherResultSelectedInSpotlight
- (PETScalarEventTracker)tracker;
- (SGMOtherResultSelectedInSpotlight)init;
- (void)trackEventWithScalar:(unint64_t)a3;
@end

@implementation SGMOtherResultSelectedInSpotlight

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

- (SGMOtherResultSelectedInSpotlight)init
{
  v7.receiver = self;
  v7.super_class = (Class)SGMOtherResultSelectedInSpotlight;
  v2 = [(SGMOtherResultSelectedInSpotlight *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F93738]);
    uint64_t v4 = [v3 initWithFeatureId:@"Found" event:@"OtherResultSelectedInSpotlight" registerProperties:MEMORY[0x1E4F1CBF0] propertySubsets:MEMORY[0x1E4F1CBF0]];
    tracker = v2->_tracker;
    v2->_tracker = (PETScalarEventTracker *)v4;
  }
  return v2;
}

@end