@interface MTRGenericBaseCluster
- (MTRBaseDevice)device;
- (MTRGenericBaseCluster)initWithDevice:(id)a3 endpointID:(id)a4 queue:(id)a5;
@end

@implementation MTRGenericBaseCluster

- (MTRGenericBaseCluster)initWithDevice:(id)a3 endpointID:(id)a4 queue:(id)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MTRGenericBaseCluster;
  v10 = [(MTRCluster *)&v13 initWithEndpointID:a4 queue:a5];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_device, a3);
  }

  return v11;
}

- (MTRBaseDevice)device
{
  return self->_device;
}

- (void).cxx_destruct
{
}

@end