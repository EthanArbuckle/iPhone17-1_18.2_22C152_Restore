@interface MRAVDistantOutputDeviceDescriptionImpl
- (BOOL)isClusterLeader;
- (BOOL)supportsEngageOnClusterActivation;
- (MRAVDistantOutputDeviceDescriptionImpl)initWithDescriptor:(id)a3;
- (NSArray)subComponents;
- (NSString)modelID;
- (NSString)name;
- (NSString)roomID;
- (NSString)roomName;
- (NSString)uid;
- (_MRAVOutputDeviceDescriptorProtobuf)descriptor;
- (unsigned)clusterType;
- (unsigned)deviceSubtype;
- (unsigned)deviceType;
@end

@implementation MRAVDistantOutputDeviceDescriptionImpl

- (MRAVDistantOutputDeviceDescriptionImpl)initWithDescriptor:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRAVDistantOutputDeviceDescriptionImpl;
  v6 = [(MRAVDistantOutputDeviceDescriptionImpl *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_descriptor, a3);
  }

  return v7;
}

- (unsigned)deviceType
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_descriptor deviceType];
}

- (unsigned)deviceSubtype
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_descriptor deviceSubType];
}

- (NSString)uid
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_descriptor uniqueIdentifier];
}

- (NSString)name
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_descriptor name];
}

- (NSString)modelID
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_descriptor modelID];
}

- (NSString)roomID
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_descriptor roomID];
}

- (NSString)roomName
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_descriptor roomName];
}

- (BOOL)isClusterLeader
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_descriptor isClusterLeader];
}

- (unsigned)clusterType
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_descriptor clusterType];
}

- (NSArray)subComponents
{
  v2 = [(_MRAVOutputDeviceDescriptorProtobuf *)self->_descriptor allClusterMembers];
  v3 = objc_msgSend(v2, "msv_map:", &__block_literal_global_129);

  return (NSArray *)v3;
}

MRAVOutputDeviceDescription *__55__MRAVDistantOutputDeviceDescriptionImpl_subComponents__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[MRAVOutputDeviceDescription alloc] initWithDescriptor:v2];

  return v3;
}

- (BOOL)supportsEngageOnClusterActivation
{
  return [(_MRAVOutputDeviceDescriptorProtobuf *)self->_descriptor engageOnClusterActivate];
}

- (_MRAVOutputDeviceDescriptorProtobuf)descriptor
{
  return self->_descriptor;
}

- (void).cxx_destruct
{
}

@end