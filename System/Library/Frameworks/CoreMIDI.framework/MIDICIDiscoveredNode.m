@interface MIDICIDiscoveredNode
+ (BOOL)supportsSecureCoding;
+ (id)description;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsProfiles;
- (BOOL)supportsProperties;
- (MIDICIDeviceInfo)deviceInfo;
- (MIDICIDiscoveredNode)init;
- (MIDICIDiscoveredNode)initWithCoder:(id)a3;
- (MIDICIDiscoveredNode)initWithDestination:(unsigned int)a3 deviceID:(MIDICIDeviceIdentification)a4 profilesSupported:(BOOL)a5 propertiesSupported:(BOOL)a6 maxSysExSize:(unsigned int)a7;
- (MIDIEntityRef)destination;
- (NSNumber)maximumSysExSize;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MIDICIDiscoveredNode

- (void).cxx_destruct
{
}

- (BOOL)supportsProperties
{
  return self->_supportsProperties;
}

- (BOOL)supportsProfiles
{
  return self->_supportsProfiles;
}

- (MIDICIDeviceInfo)deviceInfo
{
  return self->_deviceInfo;
}

- (MIDIEntityRef)destination
{
  return self->_destination;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 destination] == self->_destination
    && self->_supportsProfiles == [v4 supportsProfiles]
    && self->_supportsProperties == [v4 supportsProperties])
  {
    v5 = [v4 deviceInfo];
    if ([v5 isEqual:self->_deviceInfo])
    {
      v6 = [v4 maximumSysExSize];
      BOOL v7 = [v6 unsignedLongValue] == self->_maxSysExSize;
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (NSNumber)maximumSysExSize
{
  return (NSNumber *)[NSNumber numberWithUnsignedLong:self->_maxSysExSize];
}

- (id)description
{
  if (self->_supportsProperties) {
    v2 = @"supports profiles & properties";
  }
  else {
    v2 = @"supports profiles";
  }
  v3 = @"supports properties";
  if (!self->_supportsProperties) {
    v3 = @"MIDI-CI supported?";
  }
  if (!self->_supportsProfiles) {
    v2 = v3;
  }
  id v4 = [NSString stringWithFormat:@"<MIDICIDiscoveredNode(%p) : destination: 0x%x (%@) deviceInfo: %@>", self, self->_destination, v2, self->_deviceInfo];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInt32:self->_destination forKey:@"destination"];
  [v4 encodeObject:self->_deviceInfo forKey:@"deviceInfo"];
  [v4 encodeBool:self->_supportsProfiles forKey:@"supportsProfiles"];
  [v4 encodeBool:self->_supportsProperties forKey:@"supportsProperties"];
  [v4 encodeInt32:self->_maxSysExSize forKey:@"maxSysExSize"];
}

- (MIDICIDiscoveredNode)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MIDICIDiscoveredNode;
  v5 = [(MIDICIDiscoveredNode *)&v9 init];
  if (v5)
  {
    v5->_destination = [v4 decodeInt32ForKey:@"destination"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceInfo"];
    deviceInfo = v5->_deviceInfo;
    v5->_deviceInfo = (MIDICIDeviceInfo *)v6;

    v5->_supportsProfiles = [v4 decodeBoolForKey:@"supportsProfiles"];
    v5->_supportsProperties = [v4 decodeBoolForKey:@"supportsProperties"];
    v5->_maxSysExSize = [v4 decodeInt32ForKey:@"maxSysExSize"];
  }

  return v5;
}

- (MIDICIDiscoveredNode)initWithDestination:(unsigned int)a3 deviceID:(MIDICIDeviceIdentification)a4 profilesSupported:(BOOL)a5 propertiesSupported:(BOOL)a6 maxSysExSize:(unsigned int)a7
{
  uint64_t v10 = *(void *)&a3;
  MIDICIDeviceIdentification v17 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MIDICIDiscoveredNode;
  v11 = [(MIDICIDiscoveredNode *)&v16 init];
  v12 = v11;
  if (v11)
  {
    v11->_destination = v10;
    v13 = [[MIDICIDeviceInfo alloc] initWithDestination:v10 deviceID:&v17];
    deviceInfo = v12->_deviceInfo;
    v12->_deviceInfo = v13;

    v12->_supportsProfiles = a5;
    v12->_supportsProperties = a6;
    v12->_maxSysExSize = a7;
  }
  return v12;
}

- (MIDICIDiscoveredNode)init
{
  return 0;
}

+ (id)description
{
  return @"MIDI-CI Discovered Node";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end