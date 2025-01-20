@interface MRAVConcreteOutputDeviceDescriptionImpl
- (AVOutputDeviceDescription)avDescription;
- (BOOL)isClusterLeader;
- (BOOL)supportsEngageOnClusterActivation;
- (MRAVConcreteOutputDeviceDescriptionImpl)initWithAVDescription:(id)a3;
- (NSArray)subComponents;
- (NSString)modelID;
- (NSString)name;
- (NSString)roomID;
- (NSString)roomName;
- (NSString)uid;
- (unsigned)clusterType;
- (unsigned)deviceSubtype;
- (unsigned)deviceType;
@end

@implementation MRAVConcreteOutputDeviceDescriptionImpl

- (MRAVConcreteOutputDeviceDescriptionImpl)initWithAVDescription:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRAVConcreteOutputDeviceDescriptionImpl;
  v6 = [(MRAVConcreteOutputDeviceDescriptionImpl *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_avDescription, a3);
  }

  return v7;
}

- (unsigned)deviceType
{
  unint64_t v2 = [(AVOutputDeviceDescription *)self->_avDescription deviceType];

  return MRAVOutputDeviceTypeFromAVType(v2);
}

- (unsigned)deviceSubtype
{
  uint64_t v2 = [(AVOutputDeviceDescription *)self->_avDescription deviceSubType];

  return MRAVOutputDeviceSubtypeFromAVSubtype(v2);
}

- (NSString)uid
{
  return (NSString *)[(AVOutputDeviceDescription *)self->_avDescription deviceID];
}

- (NSString)name
{
  return (NSString *)[(AVOutputDeviceDescription *)self->_avDescription deviceName];
}

- (NSString)modelID
{
  return (NSString *)[(AVOutputDeviceDescription *)self->_avDescription modelID];
}

- (NSString)roomID
{
  return 0;
}

- (NSString)roomName
{
  return 0;
}

- (BOOL)isClusterLeader
{
  return [(AVOutputDeviceDescription *)self->_avDescription isClusterLeader];
}

- (unsigned)clusterType
{
  return 0;
}

- (NSArray)subComponents
{
  return 0;
}

- (BOOL)supportsEngageOnClusterActivation
{
  return 0;
}

- (AVOutputDeviceDescription)avDescription
{
  return self->_avDescription;
}

- (void).cxx_destruct
{
}

@end