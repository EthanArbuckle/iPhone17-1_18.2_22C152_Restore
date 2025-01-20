@interface HMMTRSoftwareUpdateProviderApplyUpdateResponseParams
- (HMMTRSoftwareUpdateProviderApplyUpdateResponseParams)initWithAction:(id)a3 delayedActionTime:(id)a4;
- (NSNumber)action;
- (NSNumber)delayedActionTime;
@end

@implementation HMMTRSoftwareUpdateProviderApplyUpdateResponseParams

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayedActionTime, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

- (NSNumber)delayedActionTime
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)action
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (HMMTRSoftwareUpdateProviderApplyUpdateResponseParams)initWithAction:(id)a3 delayedActionTime:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMMTRSoftwareUpdateProviderApplyUpdateResponseParams;
  v9 = [(HMMTRSoftwareUpdateProviderApplyUpdateResponseParams *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_action, a3);
    objc_storeStrong((id *)&v10->_delayedActionTime, a4);
  }

  return v10;
}

@end