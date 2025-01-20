@interface FSIOKitNotificationHandler
- (FSBlockDeviceResource)resource;
- (void)setResource:(id)a3;
@end

@implementation FSIOKitNotificationHandler

- (FSBlockDeviceResource)resource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_resource);
  return (FSBlockDeviceResource *)WeakRetained;
}

- (void)setResource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end