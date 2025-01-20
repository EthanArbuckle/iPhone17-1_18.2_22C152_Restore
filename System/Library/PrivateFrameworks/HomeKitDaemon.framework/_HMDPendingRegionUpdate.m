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
  v8[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  [(_HMDPendingRegionUpdate *)self state];
  v4 = HMDRegionStateString();
  v5 = (void *)[v3 initWithName:@"State" value:v4];
  v8[0] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];

  return v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t112 != -1) {
    dispatch_once(&logCategory__hmf_once_t112, &__block_literal_global_406);
  }
  v2 = (void *)logCategory__hmf_once_v113;
  return v2;
}

@end