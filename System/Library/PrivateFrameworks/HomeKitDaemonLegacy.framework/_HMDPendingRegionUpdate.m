@interface _HMDPendingRegionUpdate
+ (id)logCategory;
- (id)attributeDescriptions;
- (int64_t)state;
- (void)setState:(int64_t)a3;
@end

@implementation _HMDPendingRegionUpdate

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (id)attributeDescriptions
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(_HMDPendingRegionUpdate *)self state];
  v4 = HMDRegionStateString();
  v5 = (void *)[v3 initWithName:@"State" value:v4];
  v8[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t104 != -1) {
    dispatch_once(&logCategory__hmf_once_t104, &__block_literal_global_394);
  }
  v2 = (void *)logCategory__hmf_once_v105;
  return v2;
}

@end