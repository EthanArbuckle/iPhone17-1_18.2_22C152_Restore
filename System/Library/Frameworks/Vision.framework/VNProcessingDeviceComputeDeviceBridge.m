@interface VNProcessingDeviceComputeDeviceBridge
- (MLComputeDeviceProtocol)computeDevice;
- (NSString)description;
- (VNProcessingDevice)processingDevice;
- (VNProcessingDeviceComputeDeviceBridge)initWithProcessingDevice:(id)a3;
- (id)forwardingTargetForSelector:(SEL)a3;
@end

@implementation VNProcessingDeviceComputeDeviceBridge

- (VNProcessingDeviceComputeDeviceBridge)initWithProcessingDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VNProcessingDeviceComputeDeviceBridge;
  v6 = [(VNProcessingDeviceComputeDeviceBridge *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_processingDevice, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
}

- (MLComputeDeviceProtocol)computeDevice
{
  return (MLComputeDeviceProtocol *)[(VNProcessingDevice *)self->_processingDevice computeDevice];
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  id v5 = [(VNProcessingDevice *)self->_processingDevice computeDevice];
  if (objc_opt_respondsToSelector())
  {
    id v6 = v5;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)VNProcessingDeviceComputeDeviceBridge;
    id v6 = [(VNProcessingDeviceComputeDeviceBridge *)&v9 forwardingTargetForSelector:a3];
  }
  v7 = v6;

  return v7;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(VNProcessingDeviceComputeDeviceBridge *)self processingDevice];
  v7 = [(VNProcessingDeviceComputeDeviceBridge *)self computeDevice];
  v8 = (void *)[v3 initWithFormat:@"%@ [ %@ --> %@ ]", v5, v6, v7];

  return (NSString *)v8;
}

- (VNProcessingDevice)processingDevice
{
  return self->_processingDevice;
}

@end