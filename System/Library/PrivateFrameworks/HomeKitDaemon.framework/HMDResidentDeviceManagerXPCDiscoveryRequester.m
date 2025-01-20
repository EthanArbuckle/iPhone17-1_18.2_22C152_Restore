@interface HMDResidentDeviceManagerXPCDiscoveryRequester
- (id)block;
- (void)residentDeviceManager:(id)a3 didCompleteDiscoveryWithPrimaryResidentDevice:(id)a4 error:(id)a5;
- (void)setBlock:(id)a3;
@end

@implementation HMDResidentDeviceManagerXPCDiscoveryRequester

- (void).cxx_destruct
{
}

- (void)setBlock:(id)a3
{
}

- (id)block
{
  return self->_block;
}

- (void)residentDeviceManager:(id)a3 didCompleteDiscoveryWithPrimaryResidentDevice:(id)a4 error:(id)a5
{
  id v10 = a4;
  id v7 = a5;
  uint64_t v8 = [(HMDResidentDeviceManagerXPCDiscoveryRequester *)self block];
  v9 = (void *)v8;
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v10, v7);
  }
}

@end