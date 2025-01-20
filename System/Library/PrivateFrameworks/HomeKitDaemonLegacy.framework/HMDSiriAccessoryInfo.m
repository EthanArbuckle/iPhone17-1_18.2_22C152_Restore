@interface HMDSiriAccessoryInfo
+ (id)infoWithTargetableAccessory:(id)a3;
- (BOOL)isActiveAndSupportsDragonSiri;
- (BOOL)supportsDragonSiri;
- (id)targetsAccessory;
- (void)setSupportsDragonSiri:(BOOL)a3;
- (void)setTargetsAccessory:(id)a3;
@end

@implementation HMDSiriAccessoryInfo

- (void).cxx_destruct
{
}

- (void)setSupportsDragonSiri:(BOOL)a3
{
  self->_supportsDragonSiri = a3;
}

- (BOOL)supportsDragonSiri
{
  return self->_supportsDragonSiri;
}

- (void)setTargetsAccessory:(id)a3
{
}

- (id)targetsAccessory
{
  id WeakRetained = objc_loadWeakRetained(&self->_targetsAccessory);
  return WeakRetained;
}

- (BOOL)isActiveAndSupportsDragonSiri
{
  v3 = [(HMDSiriAccessoryInfo *)self targetsAccessory];
  if (v3) {
    BOOL v4 = [(HMDSiriAccessoryInfo *)self supportsDragonSiri];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

+ (id)infoWithTargetableAccessory:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_alloc_init(HMDSiriAccessoryInfo);
  v5 = v4;
  if (v4) {
    [(HMDSiriAccessoryInfo *)v4 setTargetsAccessory:v3];
  }

  return v5;
}

@end