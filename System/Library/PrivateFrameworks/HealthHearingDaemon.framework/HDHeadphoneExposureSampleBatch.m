@interface HDHeadphoneExposureSampleBatch
+ (id)batchWithAddedSamples:(id)a3 anchor:(id)a4;
+ (id)batchWithJournaledSamples:(id)a3;
- (BOOL)canTriggerUserNotification;
- (BOOL)isJournaled;
- (NSArray)samples;
- (NSNumber)anchor;
- (id)_initWithSamples:(id)a3 journaled:(BOOL)a4 anchor:(id)a5;
- (void)setAnchor:(id)a3;
- (void)setCanTriggerUserNotification:(BOOL)a3;
- (void)setJournaled:(BOOL)a3;
- (void)setSamples:(id)a3;
@end

@implementation HDHeadphoneExposureSampleBatch

+ (id)batchWithJournaledSamples:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithSamples:v3 journaled:1 anchor:0];

  return v4;
}

+ (id)batchWithAddedSamples:(id)a3 anchor:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithSamples:v6 journaled:0 anchor:v5];

  return v7;
}

- (id)_initWithSamples:(id)a3 journaled:(BOOL)a4 anchor:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = a5;
  v11 = v10;
  if (v6)
  {
    if (!v10) {
      goto LABEL_5;
    }
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HDHeadphoneExposureSampleBatch.m", 40, @"Invalid parameter not satisfying: %@", @"anchor == nil" object file lineNumber description];
  }
  else
  {
    if (v10) {
      goto LABEL_5;
    }
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HDHeadphoneExposureSampleBatch.m", 42, @"Invalid parameter not satisfying: %@", @"anchor != nil" object file lineNumber description];
  }

LABEL_5:
  v18.receiver = self;
  v18.super_class = (Class)HDHeadphoneExposureSampleBatch;
  v13 = [(HDHeadphoneExposureSampleBatch *)&v18 init];
  if (v13)
  {
    uint64_t v14 = [v9 copy];
    samples = v13->_samples;
    v13->_samples = (NSArray *)v14;

    v13->_journaled = v6;
    objc_storeStrong((id *)&v13->_anchor, a5);
    v13->_canTriggerUserNotification = objc_msgSend(v9, "hk_containsObjectPassingTest:", &__block_literal_global_0);
    v16 = v13;
  }

  return v13;
}

uint64_t __68__HDHeadphoneExposureSampleBatch__initWithSamples_journaled_anchor___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hk_canTriggerHeadphoneExposureNotification");
}

- (NSArray)samples
{
  return self->_samples;
}

- (void)setSamples:(id)a3
{
}

- (BOOL)isJournaled
{
  return self->_journaled;
}

- (void)setJournaled:(BOOL)a3
{
  self->_journaled = a3;
}

- (NSNumber)anchor
{
  return self->_anchor;
}

- (void)setAnchor:(id)a3
{
}

- (BOOL)canTriggerUserNotification
{
  return self->_canTriggerUserNotification;
}

- (void)setCanTriggerUserNotification:(BOOL)a3
{
  self->_canTriggerUserNotification = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchor, 0);
  objc_storeStrong((id *)&self->_samples, 0);
}

@end