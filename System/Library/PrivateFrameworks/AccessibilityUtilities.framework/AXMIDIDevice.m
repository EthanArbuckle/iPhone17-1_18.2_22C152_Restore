@interface AXMIDIDevice
- (AXMIDIDevice)initWithMIDIDevice:(unsigned int)a3 delegate:(id)a4;
- (AXMIDIDeviceProtocol)delegate;
- (BOOL)isEqual:(id)a3;
- (NSMutableSet)entities;
- (NSNumber)deviceID;
- (NSNumber)isOffline;
- (NSNumber)isPrivate;
- (NSNumber)supportsGeneralMIDI;
- (NSNumber)supportsMMC;
- (NSNumber)uniqueID;
- (NSString)description;
- (NSString)driverName;
- (NSString)manufacturer;
- (NSString)model;
- (NSString)name;
- (id)_entityForMidiEntity:(unsigned int)a3 addIfNeeded:(BOOL)a4;
- (id)fullDescription;
- (id)supportsGeneralMMC;
- (unint64_t)hash;
- (unsigned)midiDevice;
- (void)addMidiDestination:(unsigned int)a3;
- (void)addMidiEntity:(unsigned int)a3;
- (void)addMidiSource:(unsigned int)a3;
- (void)entity:(id)a3 didAddDestination:(id)a4;
- (void)entity:(id)a3 didAddSource:(id)a4;
- (void)entity:(id)a3 didRemoveDestination:(id)a4;
- (void)entity:(id)a3 didRemoveSource:(id)a4;
- (void)removeMidiDestination:(unsigned int)a3;
- (void)removeMidiEntity:(unsigned int)a3;
- (void)removeMidiSource:(unsigned int)a3;
- (void)resetAndDetectEntities;
- (void)setDelegate:(id)a3;
- (void)setEntities:(id)a3;
- (void)setMidiDevice:(unsigned int)a3;
@end

@implementation AXMIDIDevice

- (AXMIDIDevice)initWithMIDIDevice:(unsigned int)a3 delegate:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AXMIDIDevice;
  v7 = [(AXMIDIDevice *)&v12 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    v8->_midiDevice = a3;
    uint64_t v9 = [MEMORY[0x1E4F1CA80] set];
    entities = v8->_entities;
    v8->_entities = (NSMutableSet *)v9;
  }
  return v8;
}

- (NSString)description
{
  v3 = NSString;
  v4 = [(AXMIDIDevice *)self name];
  v5 = [v3 stringWithFormat:@"<AXMIDIDevice:%p [%@]>", self, v4];

  return (NSString *)v5;
}

- (id)fullDescription
{
  v3 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"AXMIDIDevice<%p>\n", self);
  v4 = [(AXMIDIDevice *)self name];
  [v3 appendFormat:@" Name: %@\n", v4];

  v5 = [(AXMIDIDevice *)self manufacturer];
  [v3 appendFormat:@" Manufacturer: %@\n", v5];

  id v6 = [(AXMIDIDevice *)self model];
  [v3 appendFormat:@" Model: %@\n", v6];

  v7 = [(AXMIDIDevice *)self driverName];
  [v3 appendFormat:@" Driver: %@\n", v7];

  v8 = [(AXMIDIDevice *)self uniqueID];
  [v3 appendFormat:@" Unique ID: %@\n", v8];

  uint64_t v9 = [(AXMIDIDevice *)self deviceID];
  [v3 appendFormat:@" Device ID: %@\n", v9];

  v10 = [(AXMIDIDevice *)self isOffline];
  [v3 appendFormat:@" Is Offline: %@\n", v10];

  v11 = [(AXMIDIDevice *)self isPrivate];
  [v3 appendFormat:@" Is Private: %@\n", v11];

  objc_super v12 = [(AXMIDIDevice *)self supportsGeneralMIDI];
  [v3 appendFormat:@" Supports General MIDI: %@\n", v12];

  v13 = [(AXMIDIDevice *)self supportsMMC];
  [v3 appendFormat:@" Supports MMC: %@\n", v13];

  v14 = [(AXMIDIDevice *)self entities];
  v15 = [v14 allObjects];

  v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
  [v3 appendFormat:@" Entities: %@\n", v16];

  if ([v15 count])
  {
    unint64_t v17 = 0;
    v18 = @"     Name: %@\n";
    v19 = @"     Manufacturer: %@\n";
    v20 = @"     Model: %@\n";
    v80 = v15;
    do
    {
      unint64_t v82 = v17 + 1;
      v21 = objc_msgSend(NSNumber, "numberWithInteger:");
      v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
      [v3 appendFormat:@"  Entity %@ of %@\n", v21, v22];

      v23 = [v15 objectAtIndex:v17];
      v24 = [v23 name];
      [v3 appendFormat:@"   Name: %@\n", v24];

      v25 = [v23 driverName];
      [v3 appendFormat:@"   Driver: %@\n", v25];

      v26 = [v23 uniqueID];
      [v3 appendFormat:@"   Unique ID: %@\n", v26];

      v27 = [v23 deviceID];
      [v3 appendFormat:@"   Device ID: %@\n", v27];

      v28 = [v23 isEmbedded];
      [v3 appendFormat:@"   Is Embedded: %@\n", v28];

      v29 = [v23 isBroadcast];
      [v3 appendFormat:@"   Is Broadcast: %@\n", v29];

      v30 = [v23 isOffline];
      [v3 appendFormat:@"   Is Offline: %@\n", v30];

      v31 = [v23 isPrivate];
      [v3 appendFormat:@"   Is Private: %@\n", v31];

      v32 = [v23 supportsGeneralMIDI];
      [v3 appendFormat:@"   Supports General MIDI: %@\n", v32];

      v33 = [v23 supportsMMC];
      [v3 appendFormat:@"   Supports MMC: %@\n", v33];

      v34 = NSNumber;
      v35 = [v23 sources];
      v36 = objc_msgSend(v34, "numberWithUnsignedInteger:", objc_msgSend(v35, "count"));
      [v3 appendFormat:@"   Sources: %@\n", v36];

      v83 = v23;
      v37 = [v23 sources];
      v38 = [v37 allObjects];

      if ([v38 count])
      {
        unint64_t v39 = 0;
        do
        {
          unint64_t v40 = v39 + 1;
          v41 = [NSNumber numberWithInteger:v39 + 1];
          v42 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v38, "count"));
          [v3 appendFormat:@"    Source %@ of %@\n", v41, v42];

          v43 = [v38 objectAtIndex:v39];
          v44 = [v43 name];
          objc_msgSend(v3, "appendFormat:", v18, v44);

          v45 = [v43 manufacturer];
          objc_msgSend(v3, "appendFormat:", v19, v45);

          v46 = [v43 model];
          objc_msgSend(v3, "appendFormat:", v20, v46);

          v47 = [v43 driverName];
          [v3 appendFormat:@"     Driver: %@\n", v47];

          v48 = [v43 uniqueID];
          [v3 appendFormat:@"     Unique ID: %@\n", v48];

          v49 = [v43 receiveChannels];
          [v3 appendFormat:@"     Receive Channels: %@\n", v49];

          v50 = [v43 transmitChannels];
          [v3 appendFormat:@"     Transmit Channels: %@\n", v50];

          v51 = [v43 isEmbedded];
          [v3 appendFormat:@"     Is Embedded: %@\n", v51];

          v52 = [v43 isBroadcast];
          [v3 appendFormat:@"     Is Broadcast: %@\n", v52];

          v53 = [v43 isOffline];
          [v3 appendFormat:@"     Is Offline: %@\n", v53];

          v54 = [v43 isPrivate];
          [v3 appendFormat:@"     Is Private: %@\n", v54];

          unint64_t v39 = v40;
        }
        while (v40 < [v38 count]);
      }
      v81 = v38;
      v55 = [v83 destinations];
      v56 = [v55 allObjects];

      v57 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v56, "count"));
      [v3 appendFormat:@"   Destinations: %@\n", v57];

      v58 = v19;
      v59 = v18;
      if ([v56 count])
      {
        unint64_t v60 = 0;
        do
        {
          unint64_t v61 = v60 + 1;
          [NSNumber numberWithInteger:v60 + 1];
          v62 = v20;
          v63 = v59;
          v65 = v64 = v58;
          v66 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v56, "count"));
          [v3 appendFormat:@"    Destination %@ of %@\n", v65, v66];

          v58 = v64;
          v59 = v63;
          v20 = v62;
          v67 = [v56 objectAtIndex:v60];
          v68 = [v67 name];
          objc_msgSend(v3, "appendFormat:", v59, v68);

          v69 = [v67 manufacturer];
          objc_msgSend(v3, "appendFormat:", v58, v69);

          v70 = [v67 model];
          objc_msgSend(v3, "appendFormat:", v62, v70);

          v71 = [v67 driverName];
          [v3 appendFormat:@"     Driver: %@\n", v71];

          v72 = [v67 uniqueID];
          [v3 appendFormat:@"     Unique ID: %@\n", v72];

          v73 = [v67 receiveChannels];
          [v3 appendFormat:@"     Receive Channels: %@\n", v73];

          v74 = [v67 transmitChannels];
          [v3 appendFormat:@"     Transmit Channels: %@\n", v74];

          v75 = [v67 isEmbedded];
          [v3 appendFormat:@"     Is Embedded: %@\n", v75];

          v76 = [v67 isBroadcast];
          [v3 appendFormat:@"     Is Broadcast: %@\n", v76];

          v77 = [v67 isOffline];
          [v3 appendFormat:@"     Is Offline: %@\n", v77];

          v78 = [v67 isPrivate];
          [v3 appendFormat:@"     Is Private: %@\n", v78];

          unint64_t v60 = v61;
        }
        while (v61 < [v56 count]);
      }

      v15 = v80;
      unint64_t v17 = v82;
      v18 = v59;
      v19 = v58;
    }
    while (v82 < [v80 count]);
  }

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(AXMIDIDevice *)self uniqueID];
    id v6 = [v4 uniqueID];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(AXMIDIDevice *)self uniqueID];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (NSString)name
{
  return (NSString *)_AXMIDIStringProperty(self->_midiDevice, (const __CFString *)*MEMORY[0x1E4F1E7B8], @"kMIDIPropertyName");
}

- (NSString)manufacturer
{
  return (NSString *)_AXMIDIStringProperty(self->_midiDevice, (const __CFString *)*MEMORY[0x1E4F1E7A8], @"kMIDIPropertyManufacturer");
}

- (NSString)model
{
  return (NSString *)_AXMIDIStringProperty(self->_midiDevice, (const __CFString *)*MEMORY[0x1E4F1E7B0], @"kMIDIPropertyModel");
}

- (NSNumber)uniqueID
{
  return (NSNumber *)_AXMIDIIntegerProperty(self->_midiDevice, (const __CFString *)*MEMORY[0x1E4F1E7E8], @"kMIDIPropertyUniqueID");
}

- (NSNumber)deviceID
{
  return (NSNumber *)_AXMIDIIntegerProperty(self->_midiDevice, (const __CFString *)*MEMORY[0x1E4F1E788], @"kMIDIPropertyDeviceID");
}

- (NSNumber)isOffline
{
  return (NSNumber *)_AXMIDIBooleanProperty(self->_midiDevice, (const __CFString *)*MEMORY[0x1E4F1E7C0], @"kMIDIPropertyOffline");
}

- (NSNumber)isPrivate
{
  return (NSNumber *)_AXMIDIBooleanProperty(self->_midiDevice, (const __CFString *)*MEMORY[0x1E4F1E7C8], @"kMIDIPropertyPrivate");
}

- (NSString)driverName
{
  return (NSString *)_AXMIDIStringProperty(self->_midiDevice, (const __CFString *)*MEMORY[0x1E4F1E790], @"kMIDIPropertyDriverOwner");
}

- (NSNumber)supportsGeneralMIDI
{
  return (NSNumber *)_AXMIDIBooleanProperty(self->_midiDevice, (const __CFString *)*MEMORY[0x1E4F1E7D0], @"kMIDIPropertySupportsGeneralMIDI");
}

- (id)supportsGeneralMMC
{
  return _AXMIDIBooleanProperty(self->_midiDevice, (const __CFString *)*MEMORY[0x1E4F1E7D8], @"kMIDIPropertySupportsMMC");
}

- (void)resetAndDetectEntities
{
  ItemCount NumberOfEntities = MIDIDeviceGetNumberOfEntities(self->_midiDevice);
  if (NumberOfEntities)
  {
    ItemCount v4 = NumberOfEntities;
    for (ItemCount i = 0; i != v4; ++i)
      id v6 = [(AXMIDIDevice *)self _entityForMidiEntity:MIDIDeviceGetEntity(self->_midiDevice, i) addIfNeeded:1];
  }
}

- (void)addMidiEntity:(unsigned int)a3
{
  id v3 = [(AXMIDIDevice *)self _entityForMidiEntity:*(void *)&a3 addIfNeeded:1];
}

- (void)removeMidiEntity:(unsigned int)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  ItemCount v4 = [(AXMIDIDevice *)self _entityForMidiEntity:*(void *)&a3 addIfNeeded:0];
  if (v4)
  {
    v5 = AXLogMIDI();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      uint64_t v9 = v4;
      _os_log_impl(&dword_18D308000, v5, OS_LOG_TYPE_INFO, "Removing entity: %@", (uint8_t *)&v8, 0xCu);
    }

    [v4 setDevice:0];
    id v6 = [(AXMIDIDevice *)self entities];
    [v6 removeObject:v4];

    char v7 = [(AXMIDIDevice *)self delegate];
    [v7 device:self didRemoveEntity:v4];
  }
}

- (void)addMidiSource:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = AXMIDIEntityForEndpoint(a3);
  if (v5)
  {
    id v7 = v5;
    id v6 = -[AXMIDIDevice _entityForMidiEntity:addIfNeeded:](self, "_entityForMidiEntity:addIfNeeded:", [v5 MIDIEntity], 1);
    [v6 addMidiSource:v3];

    v5 = v7;
  }
}

- (void)removeMidiSource:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = AXMIDIEntityForEndpoint(a3);
  if (v5)
  {
    id v7 = v5;
    id v6 = -[AXMIDIDevice _entityForMidiEntity:addIfNeeded:](self, "_entityForMidiEntity:addIfNeeded:", [v5 MIDIEntity], 0);
    [v6 removeMidiSource:v3];

    v5 = v7;
  }
}

- (void)addMidiDestination:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = AXMIDIEntityForEndpoint(a3);
  if (v5)
  {
    id v7 = v5;
    id v6 = -[AXMIDIDevice _entityForMidiEntity:addIfNeeded:](self, "_entityForMidiEntity:addIfNeeded:", [v5 MIDIEntity], 1);
    [v6 addMidiDestination:v3];

    v5 = v7;
  }
}

- (void)removeMidiDestination:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = AXMIDIEntityForEndpoint(a3);
  if (v5)
  {
    id v7 = v5;
    id v6 = -[AXMIDIDevice _entityForMidiEntity:addIfNeeded:](self, "_entityForMidiEntity:addIfNeeded:", [v5 MIDIEntity], 0);
    [v6 removeMidiDestination:v3];

    v5 = v7;
  }
}

- (id)_entityForMidiEntity:(unsigned int)a3 addIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = [(AXMIDIDevice *)self entities];
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
        objc_super v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v12 midiEntity] == v5)
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
    v13 = [[AXMIDIDeviceEntity alloc] initWithMIDIEntity:v5 device:self];
    v14 = [(AXMIDIDevice *)self entities];
    [v14 addObject:v13];

    v15 = AXLogMIDI();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v13;
      _os_log_impl(&dword_18D308000, v15, OS_LOG_TYPE_INFO, "Did add entity: %@", buf, 0xCu);
    }

    [(AXMIDIDeviceEntity *)v13 resetAndDetectEndpoints];
    id v7 = [(AXMIDIDevice *)self delegate];
    [v7 device:self didAddEntity:v13];
LABEL_14:
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)entity:(id)a3 didAddSource:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AXMIDIDevice *)self delegate];
  [v8 device:self entity:v7 didAddSource:v6];
}

- (void)entity:(id)a3 didRemoveSource:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AXMIDIDevice *)self delegate];
  [v8 device:self entity:v7 didRemoveSource:v6];
}

- (void)entity:(id)a3 didAddDestination:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AXMIDIDevice *)self delegate];
  [v8 device:self entity:v7 didAddDestination:v6];
}

- (void)entity:(id)a3 didRemoveDestination:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AXMIDIDevice *)self delegate];
  [v8 device:self entity:v7 didRemoveDestination:v6];
}

- (unsigned)midiDevice
{
  return self->_midiDevice;
}

- (void)setMidiDevice:(unsigned int)a3
{
  self->_midiDevice = a3;
}

- (AXMIDIDeviceProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AXMIDIDeviceProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSNumber)supportsMMC
{
  return self->_supportsMMC;
}

- (NSMutableSet)entities
{
  return self->_entities;
}

- (void)setEntities:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entities, 0);
  objc_storeStrong((id *)&self->_supportsMMC, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end