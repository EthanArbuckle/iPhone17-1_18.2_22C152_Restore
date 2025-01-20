@interface AXMIDIManager
- (AXMIDIManager)init;
- (AXMIDIManager)initWithIdentifier:(id)a3 eventHandler:(id)a4;
- (AXMIDIParser)parser;
- (NSMutableSet)devices;
- (NSString)clientIdentifier;
- (id)_deviceForMidiDevice:(unsigned int)a3 addIfNeeded:(BOOL)a4;
- (id)_nameForMidiObjectType:(int)a3;
- (id)eventHandler;
- (unsigned)midiClientRef;
- (unsigned)midiInputPortRef;
- (void)_addMidiDestination:(unsigned int)a3;
- (void)_addMidiEntity:(unsigned int)a3;
- (void)_addMidiSource:(unsigned int)a3;
- (void)_handleIOErrorNotification:(MIDIIOErrorNotification *)a3;
- (void)_handleObjectAddedNotification:(MIDIObjectAddRemoveNotification *)a3;
- (void)_handleObjectRemovedNotification:(MIDIObjectAddRemoveNotification *)a3;
- (void)_handlePropertyChangedNotification:(MIDIObjectPropertyChangeNotification *)a3;
- (void)_handleSerialPortOwnerChangedNotification:(MIDIObjectPropertyChangeNotification *)a3;
- (void)_handleThruConnectionsChangedNotification:(MIDIObjectPropertyChangeNotification *)a3;
- (void)_removeMidiDestination:(unsigned int)a3;
- (void)_removeMidiDevice:(unsigned int)a3;
- (void)_removeMidiEntity:(unsigned int)a3;
- (void)_removeMidiSource:(unsigned int)a3;
- (void)_resetAndDetectDevices;
- (void)dealloc;
- (void)device:(id)a3 entity:(id)a4 didAddSource:(id)a5;
- (void)device:(id)a3 entity:(id)a4 didRemoveSource:(id)a5;
- (void)printAttachedDevices;
- (void)setClientIdentifier:(id)a3;
- (void)setDevices:(id)a3;
- (void)setEventHandler:(id)a3;
- (void)setMidiClientRef:(unsigned int)a3;
- (void)setMidiInputPortRef:(unsigned int)a3;
- (void)setParser:(id)a3;
@end

@implementation AXMIDIManager

- (AXMIDIManager)init
{
  return [(AXMIDIManager *)self initWithIdentifier:@"MIDIClient" eventHandler:0];
}

- (AXMIDIManager)initWithIdentifier:(id)a3 eventHandler:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {

LABEL_9:
    v8 = 0;
    goto LABEL_15;
  }
  v38.receiver = self;
  v38.super_class = (Class)AXMIDIManager;
  v8 = [(AXMIDIManager *)&v38 init];
  if (!v8)
  {

    goto LABEL_9;
  }
  v9 = [MEMORY[0x1E4F29128] UUID];
  v10 = [v9 UUIDString];
  v11 = [v6 stringByAppendingFormat:@"-%@", v10];

  [(AXMIDIManager *)v8 setEventHandler:v7];
  v12 = objc_alloc_init(AXMIDIParser);
  parser = v8->_parser;
  v8->_parser = v12;

  objc_storeStrong((id *)&v8->_clientIdentifier, v11);
  uint64_t v14 = [MEMORY[0x1E4F1CA80] set];
  devices = v8->_devices;
  v8->_devices = (NSMutableSet *)v14;

  objc_initWeak(&location, v8);
  v16 = AXLogMIDI();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v40 = v11;
    _os_log_impl(&dword_18D308000, v16, OS_LOG_TYPE_INFO, "Will create MIDI client with identifier: %@", buf, 0xCu);
  }

  notifyBlock[0] = MEMORY[0x1E4F143A8];
  notifyBlock[1] = 3221225472;
  notifyBlock[2] = __49__AXMIDIManager_initWithIdentifier_eventHandler___block_invoke;
  notifyBlock[3] = &unk_1E5588728;
  objc_copyWeak(&v36, &location);
  OSStatus v17 = MIDIClientCreateWithBlock(v11, &v8->_midiClientRef, notifyBlock);
  v18 = NSString;
  v19 = [(AXMIDIManager *)v8 clientIdentifier];
  v20 = [v18 stringWithFormat:@"Error creating MIDI client with identifier: %@", v19];
  BOOL v21 = _AXMIDIHandleErrorOSStatus(v17, 1, v20);

  if (v21)
  {

    v8 = 0;
  }
  else
  {
    MIDIClientRef midiClientRef = v8->_midiClientRef;
    uint64_t readBlock = MEMORY[0x1E4F143A8];
    uint64_t v31 = 3221225472;
    v32 = __49__AXMIDIManager_initWithIdentifier_eventHandler___block_invoke_15;
    v33 = &unk_1E5588750;
    objc_copyWeak(&v34, &location);
    OSStatus v23 = MIDIInputPortCreateWithBlock(midiClientRef, @"Input", &v8->_midiInputPortRef, &readBlock);
    v24 = NSString;
    id v25 = objc_loadWeakRetained(&location);
    v26 = [v25 clientIdentifier];
    v27 = [v24 stringWithFormat:@"Error creating MIDI client input port with identifier: %@", v26, readBlock, v31, v32, v33];
    BOOL v28 = _AXMIDIHandleErrorOSStatus(v23, 3, v27);

    if (v28)
    {

      v8 = 0;
    }
    else
    {
      [(AXMIDIManager *)v8 _resetAndDetectDevices];
    }
    objc_destroyWeak(&v34);
  }
  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);

LABEL_15:
  return v8;
}

void __49__AXMIDIManager_initWithIdentifier_eventHandler___block_invoke(uint64_t a1, unsigned int *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v4 = AXLogMIDI();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = [NSNumber numberWithInt:*a2];
    int v20 = 138412290;
    BOOL v21 = v5;
    _os_log_impl(&dword_18D308000, v4, OS_LOG_TYPE_INFO, "MIDI system change occurred. change type: %@", (uint8_t *)&v20, 0xCu);
  }
  switch(*a2)
  {
    case 1u:
      return;
    case 2u:
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      id v7 = WeakRetained;
      if (a2[1] == 24) {
        v8 = a2;
      }
      else {
        v8 = 0;
      }
      [WeakRetained _handleObjectAddedNotification:v8];
      goto LABEL_30;
    case 3u:
      v10 = objc_loadWeakRetained((id *)(a1 + 32));
      id v7 = v10;
      if (a2[1] == 24) {
        v11 = a2;
      }
      else {
        v11 = 0;
      }
      [v10 _handleObjectRemovedNotification:v11];
      goto LABEL_30;
    case 4u:
      v12 = objc_loadWeakRetained((id *)(a1 + 32));
      id v7 = v12;
      if (a2[1] == 24) {
        v13 = a2;
      }
      else {
        v13 = 0;
      }
      [v12 _handlePropertyChangedNotification:v13];
      goto LABEL_30;
    case 5u:
      uint64_t v14 = objc_loadWeakRetained((id *)(a1 + 32));
      id v7 = v14;
      if (a2[1] == 24) {
        v15 = a2;
      }
      else {
        v15 = 0;
      }
      [v14 _handleThruConnectionsChangedNotification:v15];
      goto LABEL_30;
    case 6u:
      v16 = objc_loadWeakRetained((id *)(a1 + 32));
      id v7 = v16;
      if (a2[1] == 24) {
        OSStatus v17 = a2;
      }
      else {
        OSStatus v17 = 0;
      }
      [v16 _handleSerialPortOwnerChangedNotification:v17];
      goto LABEL_30;
    case 7u:
      v18 = objc_loadWeakRetained((id *)(a1 + 32));
      id v7 = v18;
      if (a2[1] == 16) {
        v19 = a2;
      }
      else {
        v19 = 0;
      }
      [v18 _handleIOErrorNotification:v19];
      goto LABEL_30;
    default:
      id v7 = AXLogMIDI();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v9 = [NSNumber numberWithInt:*a2];
        int v20 = 138412290;
        BOOL v21 = v9;
        _os_log_impl(&dword_18D308000, v7, OS_LOG_TYPE_INFO, "Unhandled MIDI notification: %@", (uint8_t *)&v20, 0xCu);
      }
LABEL_30:

      return;
  }
}

void __49__AXMIDIManager_initWithIdentifier_eventHandler___block_invoke_15(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v6 = a3;
    id v7 = [v6 entity];
    v8 = [v7 device];
    v9 = [WeakRetained parser];
    id v15 = 0;
    v10 = [v9 parse:a2 error:&v15];
    id v11 = v15;

    if (v11)
    {
      AXMIDILogError(v11);
    }
    else
    {
      v12 = AXLogMIDI();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        OSStatus v17 = v10;
        _os_log_impl(&dword_18D308000, v12, OS_LOG_TYPE_INFO, "Dispatching event: %@", buf, 0xCu);
      }

      v13 = [WeakRetained eventHandler];

      if (v13)
      {
        uint64_t v14 = [WeakRetained eventHandler];
        ((void (**)(void, void *, void *, void *, id))v14)[2](v14, v10, v8, v7, v6);
      }
    }
  }
}

- (void)dealloc
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = AXLogMIDI();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = [(AXMIDIManager *)self clientIdentifier];
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl(&dword_18D308000, v3, OS_LOG_TYPE_INFO, "Will dispose of MIDI client with identifier: %@", buf, 0xCu);
  }
  MIDIClientRef midiClientRef = self->_midiClientRef;
  if (midiClientRef)
  {
    OSStatus v6 = MIDIClientDispose(midiClientRef);
    id v7 = NSString;
    v8 = [(AXMIDIManager *)self clientIdentifier];
    v9 = [v7 stringWithFormat:@"Error disposing MIDI client with identifier: %@", v8];
    _AXMIDIHandleErrorOSStatus(v6, 2, v9);
  }
  v10.receiver = self;
  v10.super_class = (Class)AXMIDIManager;
  [(AXMIDIManager *)&v10 dealloc];
}

- (void)printAttachedDevices
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [(AXMIDIManager *)self devices];
  v3 = [v2 allObjects];

  uint64_t v4 = [v3 count];
  v5 = AXLogMIDI();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    OSStatus v6 = [NSNumber numberWithUnsignedInteger:v4];
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = v6;
    _os_log_impl(&dword_18D308000, v5, OS_LOG_TYPE_INFO, "%@ attached devices", buf, 0xCu);
  }
  if (v4)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      v8 = AXLogMIDI();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = [NSNumber numberWithUnsignedInteger:i + 1];
        objc_super v10 = [NSNumber numberWithUnsignedInteger:v4];
        *(_DWORD *)buf = 138412546;
        uint64_t v14 = v9;
        __int16 v15 = 2112;
        v16 = v10;
        _os_log_impl(&dword_18D308000, v8, OS_LOG_TYPE_INFO, "Device %@ of %@:", buf, 0x16u);
      }
      id v11 = AXLogMIDI();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = [v3 objectAtIndex:i];
        *(_DWORD *)buf = 138412290;
        uint64_t v14 = v12;
        _os_log_impl(&dword_18D308000, v11, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
      }
    }
  }
}

- (id)_nameForMidiObjectType:(int)a3
{
  if ((a3 + 1) > 0x14) {
    return @"Unknown";
  }
  else {
    return off_1E5588770[a3 + 1];
  }
}

- (void)_handleObjectAddedNotification:(MIDIObjectAddRemoveNotification *)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v5 = AXLogMIDI();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      OSStatus v6 = [(AXMIDIManager *)self _nameForMidiObjectType:a3->childType];
      int v10 = 138412290;
      id v11 = v6;
      _os_log_impl(&dword_18D308000, v5, OS_LOG_TYPE_INFO, "MIDI Notification: add object: %@", (uint8_t *)&v10, 0xCu);
    }
    switch(a3->childType)
    {
      case kMIDIObjectType_Device:
        id v7 = [(AXMIDIManager *)self _deviceForMidiDevice:a3->child addIfNeeded:1];
        break;
      case kMIDIObjectType_Entity:
        [(AXMIDIManager *)self _addMidiEntity:a3->child];
        break;
      case kMIDIObjectType_Source:
        [(AXMIDIManager *)self _addMidiSource:a3->child];
        break;
      case kMIDIObjectType_Destination:
        [(AXMIDIManager *)self _addMidiDestination:a3->child];
        break;
      default:
        v8 = AXLogMIDI();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          v9 = [(AXMIDIManager *)self _nameForMidiObjectType:a3->childType];
          int v10 = 138412290;
          id v11 = v9;
          _os_log_impl(&dword_18D308000, v8, OS_LOG_TYPE_INFO, "Unhandled Object added: %@", (uint8_t *)&v10, 0xCu);
        }
        break;
    }
  }
}

- (void)_handleObjectRemovedNotification:(MIDIObjectAddRemoveNotification *)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v5 = AXLogMIDI();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      OSStatus v6 = [(AXMIDIManager *)self _nameForMidiObjectType:a3->childType];
      int v9 = 138412290;
      int v10 = v6;
      _os_log_impl(&dword_18D308000, v5, OS_LOG_TYPE_INFO, "MIDI Notification: Remove object: %@", (uint8_t *)&v9, 0xCu);
    }
    switch(a3->childType)
    {
      case kMIDIObjectType_Device:
        [(AXMIDIManager *)self _removeMidiDevice:a3->child];
        break;
      case kMIDIObjectType_Entity:
        [(AXMIDIManager *)self _removeMidiEntity:a3->child];
        break;
      case kMIDIObjectType_Source:
        [(AXMIDIManager *)self _removeMidiSource:a3->child];
        break;
      case kMIDIObjectType_Destination:
        [(AXMIDIManager *)self _removeMidiDestination:a3->child];
        break;
      default:
        id v7 = AXLogMIDI();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          v8 = [(AXMIDIManager *)self _nameForMidiObjectType:a3->childType];
          int v9 = 138412290;
          int v10 = v8;
          _os_log_impl(&dword_18D308000, v7, OS_LOG_TYPE_INFO, "Unhandled Object removed: %@", (uint8_t *)&v9, 0xCu);
        }
        break;
    }
  }
}

- (void)_handlePropertyChangedNotification:(MIDIObjectPropertyChangeNotification *)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v5 = AXLogMIDI();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      OSStatus v6 = [(AXMIDIManager *)self _nameForMidiObjectType:a3->objectType];
      CFStringRef propertyName = a3->propertyName;
      int v8 = 138412546;
      int v9 = v6;
      __int16 v10 = 2112;
      CFStringRef v11 = propertyName;
      _os_log_impl(&dword_18D308000, v5, OS_LOG_TYPE_INFO, "MIDI Notification: Property Changed: %@ - %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)_handleThruConnectionsChangedNotification:(MIDIObjectPropertyChangeNotification *)a3
{
  v3 = AXLogMIDI();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_18D308000, v3, OS_LOG_TYPE_INFO, "MIDI Notification: Thru Connections Changed", v4, 2u);
  }
}

- (void)_handleSerialPortOwnerChangedNotification:(MIDIObjectPropertyChangeNotification *)a3
{
  v3 = AXLogMIDI();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_18D308000, v3, OS_LOG_TYPE_INFO, "MIDI Notification: Serial Port Owner Changed", v4, 2u);
  }
}

- (void)_handleIOErrorNotification:(MIDIIOErrorNotification *)a3
{
  if (a3)
  {
    v3 = a3;
    id v5 = [(AXMIDIManager *)self _deviceForMidiDevice:a3->driverDevice addIfNeeded:0];
    LODWORD(v3) = v3->errorCode;
    uint64_t v4 = [NSString stringWithFormat:@"MIDI Notification: MIDI I/O error. Device: %@", v5];
    _AXMIDIHandleErrorOSStatus((int)v3, 6, v4);
  }
}

- (void)_resetAndDetectDevices
{
  v3 = [(AXMIDIManager *)self devices];
  [v3 removeAllObjects];

  ItemCount v4 = MIDIGetNumberOfDevices();
  if (v4)
  {
    ItemCount v5 = v4;
    for (ItemCount i = 0; i != v5; ++i)
      id v7 = [(AXMIDIManager *)self _deviceForMidiDevice:MIDIGetDevice(i) addIfNeeded:1];
  }
}

- (void)_removeMidiDevice:(unsigned int)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  ItemCount v4 = [(AXMIDIManager *)self _deviceForMidiDevice:*(void *)&a3 addIfNeeded:0];
  if (v4)
  {
    ItemCount v5 = AXLogMIDI();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      int v8 = v4;
      _os_log_impl(&dword_18D308000, v5, OS_LOG_TYPE_INFO, "Removing device: %@", (uint8_t *)&v7, 0xCu);
    }

    OSStatus v6 = [(AXMIDIManager *)self devices];
    [v6 removeObject:v4];
  }
}

- (id)_deviceForMidiDevice:(unsigned int)a3 addIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  int v7 = [(AXMIDIManager *)self devices];
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
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v12 midiDevice] == v5)
        {
          uint64_t v13 = v12;

          goto LABEL_15;
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
    uint64_t v13 = [[AXMIDIDevice alloc] initWithMIDIDevice:v5 delegate:self];
    uint64_t v14 = [(AXMIDIManager *)self devices];
    [v14 addObject:v13];

    __int16 v15 = AXLogMIDI();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v22 = v13;
      _os_log_impl(&dword_18D308000, v15, OS_LOG_TYPE_INFO, "Did add device: %@", buf, 0xCu);
    }

    [(AXMIDIDevice *)v13 resetAndDetectEntities];
  }
  else
  {
    uint64_t v13 = 0;
  }
LABEL_15:

  return v13;
}

- (void)_addMidiEntity:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = AXMIDIDeviceForEntity(a3);
  if (v5)
  {
    id v7 = v5;
    OSStatus v6 = -[AXMIDIManager _deviceForMidiDevice:addIfNeeded:](self, "_deviceForMidiDevice:addIfNeeded:", [v5 MIDIDevice], 1);
    [v6 addMidiEntity:v3];

    uint64_t v5 = v7;
  }
}

- (void)_removeMidiEntity:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = AXMIDIDeviceForEntity(a3);
  if (v5)
  {
    id v7 = v5;
    OSStatus v6 = -[AXMIDIManager _deviceForMidiDevice:addIfNeeded:](self, "_deviceForMidiDevice:addIfNeeded:", [v5 MIDIDevice], 1);
    [v6 removeMidiEntity:v3];

    uint64_t v5 = v7;
  }
}

- (void)_addMidiSource:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = AXMIDIDeviceForEndpoint(a3);
  if (v5)
  {
    id v7 = v5;
    OSStatus v6 = -[AXMIDIManager _deviceForMidiDevice:addIfNeeded:](self, "_deviceForMidiDevice:addIfNeeded:", [v5 MIDIDevice], 1);
    [v6 addMidiSource:v3];

    uint64_t v5 = v7;
  }
}

- (void)_removeMidiSource:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = AXMIDIDeviceForEndpoint(a3);
  if (v5)
  {
    id v7 = v5;
    OSStatus v6 = -[AXMIDIManager _deviceForMidiDevice:addIfNeeded:](self, "_deviceForMidiDevice:addIfNeeded:", [v5 MIDIDevice], 0);
    [v6 removeMidiSource:v3];

    uint64_t v5 = v7;
  }
}

- (void)_addMidiDestination:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = AXMIDIDeviceForEndpoint(a3);
  if (v5)
  {
    id v7 = v5;
    OSStatus v6 = -[AXMIDIManager _deviceForMidiDevice:addIfNeeded:](self, "_deviceForMidiDevice:addIfNeeded:", [v5 MIDIDevice], 1);
    [v6 addMidiDestination:v3];

    uint64_t v5 = v7;
  }
}

- (void)_removeMidiDestination:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = AXMIDIDeviceForEndpoint(a3);
  if (v5)
  {
    id v7 = v5;
    OSStatus v6 = -[AXMIDIManager _deviceForMidiDevice:addIfNeeded:](self, "_deviceForMidiDevice:addIfNeeded:", [v5 MIDIDevice], 0);
    [v6 removeMidiDestination:v3];

    uint64_t v5 = v7;
  }
}

- (void)device:(id)a3 entity:(id)a4 didAddSource:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  uint64_t v7 = MIDIPortConnectSource(self->_midiInputPortRef, [v6 midiEndpoint], v6);
  uint64_t v8 = AXLogMIDI();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = [NSNumber numberWithInt:v7];
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    _os_log_impl(&dword_18D308000, v8, OS_LOG_TYPE_INFO, "Did attempt to connect inputPort to source: %@. result: %@", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v10 = [NSString stringWithFormat:@"Could not connect end point to input port"];
  _AXMIDIHandleErrorOSStatus(v7, 4, v10);
}

- (void)device:(id)a3 entity:(id)a4 didRemoveSource:(id)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  uint64_t v7 = MIDIPortDisconnectSource(self->_midiInputPortRef, [v6 midiEndpoint]);
  uint64_t v8 = AXLogMIDI();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = [NSNumber numberWithInt:v7];
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 2112;
    __int16 v13 = v9;
    _os_log_impl(&dword_18D308000, v8, OS_LOG_TYPE_INFO, "Did attempt to disconnect inputPort from source: %@. result: %@", (uint8_t *)&v10, 0x16u);
  }
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (void)setEventHandler:(id)a3
{
}

- (AXMIDIParser)parser
{
  return self->_parser;
}

- (void)setParser:(id)a3
{
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
}

- (NSMutableSet)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
}

- (unsigned)midiClientRef
{
  return self->_midiClientRef;
}

- (void)setMidiClientRef:(unsigned int)a3
{
  self->_MIDIClientRef midiClientRef = a3;
}

- (unsigned)midiInputPortRef
{
  return self->_midiInputPortRef;
}

- (void)setMidiInputPortRef:(unsigned int)a3
{
  self->_midiInputPortRef = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_parser, 0);

  objc_storeStrong(&self->_eventHandler, 0);
}

@end