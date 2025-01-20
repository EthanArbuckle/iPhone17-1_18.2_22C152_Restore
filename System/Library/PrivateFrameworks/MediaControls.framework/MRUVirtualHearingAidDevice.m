@interface MRUVirtualHearingAidDevice
- (MRAVOutputDeviceDescription)deviceDescription;
- (MRUVirtualHearingAidDevice)initWithDeviceDescription:(id)a3;
- (id)name;
- (id)uid;
- (unsigned)deviceSubtype;
- (unsigned)deviceType;
@end

@implementation MRUVirtualHearingAidDevice

- (MRUVirtualHearingAidDevice)initWithDeviceDescription:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRUVirtualHearingAidDevice;
  v6 = [(MRUVirtualHearingAidDevice *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_deviceDescription, a3);
  }

  return v7;
}

- (id)name
{
  return (id)[(MRAVOutputDeviceDescription *)self->_deviceDescription name];
}

- (id)uid
{
  return (id)[(MRAVOutputDeviceDescription *)self->_deviceDescription uid];
}

- (unsigned)deviceType
{
  return [(MRAVOutputDeviceDescription *)self->_deviceDescription deviceType];
}

- (unsigned)deviceSubtype
{
  return [(MRAVOutputDeviceDescription *)self->_deviceDescription deviceSubtype];
}

- (MRAVOutputDeviceDescription)deviceDescription
{
  return self->_deviceDescription;
}

- (void).cxx_destruct
{
}

@end