@interface AXMIDIDeviceEntity
- (AXMIDIDevice)device;
- (AXMIDIDeviceEntity)initWithMIDIEntity:(unsigned int)a3 device:(id)a4;
- (NSMutableSet)destinations;
- (NSMutableSet)sources;
- (NSNumber)deviceID;
- (NSNumber)isBroadcast;
- (NSNumber)isEmbedded;
- (NSNumber)isOffline;
- (NSNumber)isPrivate;
- (NSNumber)supportsGeneralMIDI;
- (NSNumber)supportsMMC;
- (NSNumber)uniqueID;
- (NSString)driverName;
- (NSString)name;
- (id)_destinationForMidiEndpoint:(unsigned int)a3 addIfNeeded:(BOOL)a4;
- (id)_sourceForMidiEndpoint:(unsigned int)a3 addIfNeeded:(BOOL)a4;
- (id)description;
- (id)supportsGeneralMMC;
- (unsigned)midiEntity;
- (void)addMidiDestination:(unsigned int)a3;
- (void)addMidiSource:(unsigned int)a3;
- (void)removeMidiDestination:(unsigned int)a3;
- (void)removeMidiSource:(unsigned int)a3;
- (void)resetAndDetectEndpoints;
- (void)setDestinations:(id)a3;
- (void)setDevice:(id)a3;
- (void)setMidiEntity:(unsigned int)a3;
- (void)setSources:(id)a3;
@end

@implementation AXMIDIDeviceEntity

- (AXMIDIDeviceEntity)initWithMIDIEntity:(unsigned int)a3 device:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AXMIDIDeviceEntity;
  v7 = [(AXMIDIDeviceEntity *)&v14 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_device, v6);
    v8->_midiEntity = a3;
    uint64_t v9 = [MEMORY[0x1E4F1CA80] set];
    sources = v8->_sources;
    v8->_sources = (NSMutableSet *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA80] set];
    destinations = v8->_destinations;
    v8->_destinations = (NSMutableSet *)v11;
  }
  return v8;
}

- (id)description
{
  v3 = NSString;
  v4 = [(AXMIDIDeviceEntity *)self device];
  v5 = [v3 stringWithFormat:@"<AXMIDIDeviceEntity:%p parent:%@>", self, v4];

  return v5;
}

- (NSString)name
{
  return (NSString *)_AXMIDIStringProperty(self->_midiEntity, (const __CFString *)*MEMORY[0x1E4F1E7B8], @"kMIDIPropertyName");
}

- (NSNumber)uniqueID
{
  return (NSNumber *)_AXMIDIIntegerProperty(self->_midiEntity, (const __CFString *)*MEMORY[0x1E4F1E7E8], @"kMIDIPropertyUniqueID");
}

- (NSNumber)deviceID
{
  return (NSNumber *)_AXMIDIIntegerProperty(self->_midiEntity, (const __CFString *)*MEMORY[0x1E4F1E788], @"kMIDIPropertyDeviceID");
}

- (NSNumber)isEmbedded
{
  return (NSNumber *)_AXMIDIBooleanProperty(self->_midiEntity, (const __CFString *)*MEMORY[0x1E4F1E7A0], @"kMIDIPropertyIsEmbeddedEntity");
}

- (NSNumber)isBroadcast
{
  return (NSNumber *)_AXMIDIBooleanProperty(self->_midiEntity, (const __CFString *)*MEMORY[0x1E4F1E798], @"kMIDIPropertyIsBroadcast");
}

- (NSNumber)isOffline
{
  return (NSNumber *)_AXMIDIBooleanProperty(self->_midiEntity, (const __CFString *)*MEMORY[0x1E4F1E7C0], @"kMIDIPropertyOffline");
}

- (NSNumber)isPrivate
{
  return (NSNumber *)_AXMIDIBooleanProperty(self->_midiEntity, (const __CFString *)*MEMORY[0x1E4F1E7C8], @"kMIDIPropertyPrivate");
}

- (NSString)driverName
{
  return (NSString *)_AXMIDIStringProperty(self->_midiEntity, (const __CFString *)*MEMORY[0x1E4F1E790], @"kMIDIPropertyDriverOwner");
}

- (NSNumber)supportsGeneralMIDI
{
  return (NSNumber *)_AXMIDIBooleanProperty(self->_midiEntity, (const __CFString *)*MEMORY[0x1E4F1E7D0], @"kMIDIPropertySupportsGeneralMIDI");
}

- (id)supportsGeneralMMC
{
  return _AXMIDIBooleanProperty(self->_midiEntity, (const __CFString *)*MEMORY[0x1E4F1E7D8], @"kMIDIPropertySupportsMMC");
}

- (void)resetAndDetectEndpoints
{
  ItemCount NumberOfSources = MIDIEntityGetNumberOfSources(self->_midiEntity);
  if (NumberOfSources)
  {
    ItemCount v4 = NumberOfSources;
    for (ItemCount i = 0; i != v4; ++i)
      [(AXMIDIDeviceEntity *)self addMidiSource:MIDIEntityGetSource(self->_midiEntity, i)];
  }
  ItemCount NumberOfDestinations = MIDIEntityGetNumberOfDestinations(self->_midiEntity);
  if (NumberOfDestinations)
  {
    ItemCount v7 = NumberOfDestinations;
    for (ItemCount j = 0; j != v7; ++j)
      [(AXMIDIDeviceEntity *)self addMidiDestination:MIDIEntityGetDestination(self->_midiEntity, j)];
  }
}

- (void)addMidiSource:(unsigned int)a3
{
  id v3 = [(AXMIDIDeviceEntity *)self _sourceForMidiEndpoint:*(void *)&a3 addIfNeeded:1];
}

- (void)removeMidiSource:(unsigned int)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  ItemCount v4 = [(AXMIDIDeviceEntity *)self _sourceForMidiEndpoint:*(void *)&a3 addIfNeeded:0];
  if (v4)
  {
    v5 = AXLogMIDI();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      uint64_t v9 = v4;
      _os_log_impl(&dword_18D308000, v5, OS_LOG_TYPE_INFO, "Removing source: %@", (uint8_t *)&v8, 0xCu);
    }

    id v6 = [(AXMIDIDeviceEntity *)self sources];
    [v6 removeObject:v4];

    ItemCount v7 = [(AXMIDIDeviceEntity *)self device];
    [v7 entity:self didRemoveSource:v4];
  }
}

- (void)addMidiDestination:(unsigned int)a3
{
  id v3 = [(AXMIDIDeviceEntity *)self _destinationForMidiEndpoint:*(void *)&a3 addIfNeeded:1];
}

- (void)removeMidiDestination:(unsigned int)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  ItemCount v4 = [(AXMIDIDeviceEntity *)self _destinationForMidiEndpoint:*(void *)&a3 addIfNeeded:0];
  if (v4)
  {
    v5 = AXLogMIDI();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      uint64_t v9 = v4;
      _os_log_impl(&dword_18D308000, v5, OS_LOG_TYPE_INFO, "Removing destination: %@", (uint8_t *)&v8, 0xCu);
    }

    id v6 = [(AXMIDIDeviceEntity *)self destinations];
    [v6 removeObject:v4];

    ItemCount v7 = [(AXMIDIDeviceEntity *)self device];
    [v7 entity:self didRemoveDestination:v4];
  }
}

- (id)_sourceForMidiEndpoint:(unsigned int)a3 addIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  ItemCount v7 = [(AXMIDIDeviceEntity *)self sources];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v12 midiEndpoint] == v5)
        {
          v13 = v12;
          goto LABEL_14;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v23 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  if (v4)
  {
    v13 = [[AXMIDIDeviceEntityEndpoint alloc] initWithMIDIEndpoint:v5 entity:self];
    objc_super v14 = [(AXMIDIDeviceEntity *)self sources];
    [v14 addObject:v13];

    v15 = AXLogMIDI();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v13;
      _os_log_impl(&dword_18D308000, v15, OS_LOG_TYPE_INFO, "Did add source endpoint: %@", buf, 0xCu);
    }

    ItemCount v7 = [(AXMIDIDeviceEntity *)self device];
    [v7 entity:self didAddSource:v13];
LABEL_14:
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_destinationForMidiEndpoint:(unsigned int)a3 addIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  ItemCount v7 = [(AXMIDIDeviceEntity *)self destinations];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v12 midiEndpoint] == v5)
        {
          v13 = v12;
          goto LABEL_14;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v23 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  if (v4)
  {
    v13 = [[AXMIDIDeviceEntityEndpoint alloc] initWithMIDIEndpoint:v5 entity:self];
    objc_super v14 = [(AXMIDIDeviceEntity *)self destinations];
    [v14 addObject:v13];

    v15 = AXLogMIDI();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v13;
      _os_log_impl(&dword_18D308000, v15, OS_LOG_TYPE_INFO, "Did add destination endpoint: %@", buf, 0xCu);
    }

    ItemCount v7 = [(AXMIDIDeviceEntity *)self device];
    [v7 entity:self didAddDestination:v13];
LABEL_14:
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (AXMIDIDevice)device
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);

  return (AXMIDIDevice *)WeakRetained;
}

- (void)setDevice:(id)a3
{
}

- (NSMutableSet)sources
{
  return self->_sources;
}

- (void)setSources:(id)a3
{
}

- (NSMutableSet)destinations
{
  return self->_destinations;
}

- (void)setDestinations:(id)a3
{
}

- (NSNumber)supportsMMC
{
  return self->_supportsMMC;
}

- (unsigned)midiEntity
{
  return self->_midiEntity;
}

- (void)setMidiEntity:(unsigned int)a3
{
  self->_midiEntity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportsMMC, 0);
  objc_storeStrong((id *)&self->_destinations, 0);
  objc_storeStrong((id *)&self->_sources, 0);

  objc_destroyWeak((id *)&self->_device);
}

@end