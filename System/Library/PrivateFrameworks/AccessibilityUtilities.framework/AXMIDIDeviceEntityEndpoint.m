@interface AXMIDIDeviceEntityEndpoint
- (AXMIDIDeviceEntity)entity;
- (AXMIDIDeviceEntityEndpoint)initWithMIDIEndpoint:(unsigned int)a3 entity:(id)a4;
- (NSNumber)isBroadcast;
- (NSNumber)isEmbedded;
- (NSNumber)isOffline;
- (NSNumber)isPrivate;
- (NSNumber)receiveChannels;
- (NSNumber)transmitChannels;
- (NSNumber)uniqueID;
- (NSString)driverName;
- (NSString)manufacturer;
- (NSString)model;
- (NSString)name;
- (id)description;
- (unsigned)midiEndpoint;
- (void)setEntity:(id)a3;
- (void)setMidiEndpoint:(unsigned int)a3;
@end

@implementation AXMIDIDeviceEntityEndpoint

- (AXMIDIDeviceEntityEndpoint)initWithMIDIEndpoint:(unsigned int)a3 entity:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)AXMIDIDeviceEntityEndpoint;
  v7 = [(AXMIDIDeviceEntityEndpoint *)&v10 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_entity, v6);
    v8->_midiEndpoint = a3;
  }

  return v8;
}

- (id)description
{
  v3 = NSString;
  v4 = [(AXMIDIDeviceEntityEndpoint *)self entity];
  v5 = [v3 stringWithFormat:@"<AXMIDIDeviceEntityEndpoint:%p parent:%@>", self, v4];

  return v5;
}

- (NSString)name
{
  return (NSString *)_AXMIDIStringProperty(self->_midiEndpoint, (const __CFString *)*MEMORY[0x1E4F1E7B8], @"kMIDIPropertyName");
}

- (NSString)manufacturer
{
  return (NSString *)_AXMIDIStringProperty(self->_midiEndpoint, (const __CFString *)*MEMORY[0x1E4F1E7A8], @"kMIDIPropertyManufacturer");
}

- (NSString)model
{
  return (NSString *)_AXMIDIStringProperty(self->_midiEndpoint, (const __CFString *)*MEMORY[0x1E4F1E7B0], @"kMIDIPropertyModel");
}

- (NSNumber)uniqueID
{
  return (NSNumber *)_AXMIDIIntegerProperty(self->_midiEndpoint, (const __CFString *)*MEMORY[0x1E4F1E7E8], @"kMIDIPropertyUniqueID");
}

- (NSNumber)receiveChannels
{
  return (NSNumber *)_AXMIDIIntegerProperty(self->_midiEndpoint, (const __CFString *)*MEMORY[0x1E4F1E7E0], @"kMIDIPropertyTransmitChannels");
}

- (NSNumber)transmitChannels
{
  return (NSNumber *)_AXMIDIIntegerProperty(self->_midiEndpoint, (const __CFString *)*MEMORY[0x1E4F1E7E0], @"kMIDIPropertyTransmitChannels");
}

- (NSNumber)isEmbedded
{
  return (NSNumber *)_AXMIDIBooleanProperty(self->_midiEndpoint, (const __CFString *)*MEMORY[0x1E4F1E7A0], @"kMIDIPropertyIsEmbeddedEntity");
}

- (NSNumber)isBroadcast
{
  return (NSNumber *)_AXMIDIBooleanProperty(self->_midiEndpoint, (const __CFString *)*MEMORY[0x1E4F1E798], @"kMIDIPropertyIsBroadcast");
}

- (NSNumber)isOffline
{
  return (NSNumber *)_AXMIDIBooleanProperty(self->_midiEndpoint, (const __CFString *)*MEMORY[0x1E4F1E7C0], @"kMIDIPropertyOffline");
}

- (NSNumber)isPrivate
{
  return (NSNumber *)_AXMIDIBooleanProperty(self->_midiEndpoint, (const __CFString *)*MEMORY[0x1E4F1E7C8], @"kMIDIPropertyPrivate");
}

- (NSString)driverName
{
  return (NSString *)_AXMIDIStringProperty(self->_midiEndpoint, (const __CFString *)*MEMORY[0x1E4F1E790], @"kMIDIPropertyDriverOwner");
}

- (unsigned)midiEndpoint
{
  return self->_midiEndpoint;
}

- (void)setMidiEndpoint:(unsigned int)a3
{
  self->_midiEndpoint = a3;
}

- (AXMIDIDeviceEntity)entity
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_entity);

  return (AXMIDIDeviceEntity *)WeakRetained;
}

- (void)setEntity:(id)a3
{
}

- (void).cxx_destruct
{
}

@end