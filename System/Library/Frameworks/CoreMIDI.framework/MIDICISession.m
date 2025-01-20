@interface MIDICISession
+ (id)description;
- (BOOL)disableProfile:(MIDICIProfile *)profile onChannel:(MIDIChannelNumber)channel error:(NSError *)outError;
- (BOOL)enableProfile:(MIDICIProfile *)profile onChannel:(MIDIChannelNumber)channel error:(NSError *)outError;
- (BOOL)isEqual:(id)a3;
- (BOOL)sendProfile:(MIDICIProfile *)profile onChannel:(MIDIChannelNumber)channel profileData:(NSData *)profileSpecificData;
- (BOOL)supportsProfileCapability;
- (BOOL)supportsPropertyCapability;
- (BOOL)toggleProfile:(id)a3 onChannel:(unsigned __int8)a4 enabling:(BOOL)a5 error:(id *)a6;
- (BOOL)updateProfileStateForChannel:(unsigned __int8)a3 withProfile:(id)a4 enabled:(BOOL)a5;
- (MIDICIDeviceIdentification)deviceID;
- (MIDICIDeviceInfo)deviceInfo;
- (MIDICIProfileChangedBlock)profileChangedCallback;
- (MIDICIProfileSpecificDataBlock)profileSpecificDataHandler;
- (MIDICIProfileState)profileStateForChannel:(MIDIChannelNumber)channel;
- (MIDICISession)init;
- (MIDICISession)initWithDiscoveredNode:(MIDICIDiscoveredNode *)discoveredNode dataReadyHandler:(void *)handler disconnectHandler:(MIDICISessionDisconnectBlock)disconnectHandler;
- (MIDICISession)initWithMIDIDestination:(unsigned int)a3 dataReadyHandler:(id)a4;
- (MIDICISession)initWithMIDIDestination:(unsigned int)a3 dataReadyHandler:(id)a4 disconnectHandler:(id)a5 profileSpecificDataHandler:(id)a6;
- (MIDICISession)initWithMIDIEntity:(unsigned int)a3 dataReadyHandler:(id)a4;
- (MIDIEntityRef)midiDestination;
- (NSNumber)maxPropertyRequests;
- (NSNumber)maxSysExSize;
- (id)description;
- (id)disconnectBlock;
- (id)profileSpecificDataBlock;
- (id)propertyChangedCallback;
- (id)propertyResponseCallback;
- (void)addProfileState:(char *)a3 length:(unsigned int)a4 channel:(unsigned __int8)a5;
- (void)getProperty:(id)a3 onChannel:(unsigned __int8)a4 responseHandler:(id)a5;
- (void)handleCINotification:(const MIDINotification *)a3 withHandler:(id)a4;
- (void)hasProperty:(id)a3 onChannel:(unsigned __int8)a4 responseHandler:(id)a5;
- (void)setDisconnectBlock:(id)a3;
- (void)setProfileChangedCallback:(MIDICIProfileChangedBlock)profileChangedCallback;
- (void)setProfileSpecificDataBlock:(id)a3;
- (void)setProfileSpecificDataHandler:(MIDICIProfileSpecificDataBlock)profileSpecificDataHandler;
- (void)setProperty:(id)a3 onChannel:(unsigned __int8)a4 responseHandler:(id)a5;
- (void)setPropertyChangedCallback:(id)a3;
- (void)setPropertyResponseCallback:(id)a3;
@end

@implementation MIDICISession

- (void).cxx_destruct
{
  objc_storeStrong(&self->_profileSpecificDataHandler, 0);
  objc_storeStrong(&self->_propertyResponseCallback, 0);
  objc_storeStrong(&self->_propertyChangedCallback, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong(&self->_profileSpecificDataCallback, 0);
  objc_storeStrong(&self->_sessionDisconnectCallback, 0);
  objc_storeStrong(&self->_profileChangedCallback, 0);
  objc_storeStrong((id *)&self->_profileStates, 0);

  objc_storeStrong((id *)&self->_supportedProtocols, 0);
}

- (void)setProfileSpecificDataHandler:(MIDICIProfileSpecificDataBlock)profileSpecificDataHandler
{
}

- (MIDICIProfileSpecificDataBlock)profileSpecificDataHandler
{
  return self->_profileSpecificDataHandler;
}

- (MIDIEntityRef)midiDestination
{
  return self->_destination;
}

- (void)setPropertyChangedCallback:(id)a3
{
}

- (id)propertyChangedCallback
{
  return self->_propertyChangedCallback;
}

- (void)setPropertyResponseCallback:(id)a3
{
}

- (id)propertyResponseCallback
{
  return self->_propertyResponseCallback;
}

- (MIDICIDeviceIdentification)deviceID
{
  uint64_t v2 = *(void *)&self->_deviceID.revisionLevel[1];
  uint64_t v3 = *(void *)self->_deviceID.manufacturer;
  *(_DWORD *)&result.revisionLevel[1] = v2;
  *(_DWORD *)&result.reserved[1] = HIDWORD(v2);
  *(_WORD *)result.manufacturer = v3;
  result.manufacturer[2] = BYTE2(v3);
  *(_WORD *)result.family = *(_WORD *)((char *)&v3 + 3);
  *(_WORD *)result.modelNumber = *(_WORD *)((char *)&v3 + 5);
  result.revisionLevel[0] = HIBYTE(v3);
  return result;
}

- (void)setProfileSpecificDataBlock:(id)a3
{
}

- (id)profileSpecificDataBlock
{
  return self->_profileSpecificDataCallback;
}

- (void)setDisconnectBlock:(id)a3
{
}

- (id)disconnectBlock
{
  return self->_sessionDisconnectCallback;
}

- (void)setProfileChangedCallback:(MIDICIProfileChangedBlock)profileChangedCallback
{
}

- (MIDICIProfileChangedBlock)profileChangedCallback
{
  return self->_profileChangedCallback;
}

- (MIDICIDeviceInfo)deviceInfo
{
  return self->_deviceInfo;
}

- (BOOL)supportsPropertyCapability
{
  return self->_supportsPropertyCapability;
}

- (BOOL)supportsProfileCapability
{
  return self->_supportsProfileCapability;
}

- (BOOL)updateProfileStateForChannel:(unsigned __int8)a3 withProfile:(id)a4 enabled:(BOOL)a5
{
  BOOL v5 = a5;
  unsigned int v6 = a3;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = v8;
  v10 = "NO";
  if (v5) {
    v10 = "YES";
  }
  NSLog(&cfstr_Updateprofiles.isa, v6, v8, v10);
  if (v6 == 127) {
    uint64_t v11 = 16;
  }
  else {
    uint64_t v11 = v6;
  }
  v12 = [(NSMutableArray *)self->_profileStates objectAtIndex:v11];
  v13 = v12;
  if (v12)
  {
    v14 = [v12 disabledProfiles];
    if (v5)
    {
      v15 = (void *)[v14 mutableCopy];

      v16 = [v13 enabledProfiles];
      v17 = (void *)[v16 mutableCopy];
      v18 = v15;
    }
    else
    {
      v17 = (void *)[v14 mutableCopy];

      v16 = [v13 enabledProfiles];
      v15 = (void *)[v16 mutableCopy];
      v18 = v17;
    }

    NSLog(&cfstr_RemovingFrom.isa, v15);
    NSLog(&cfstr_AddingTo.isa, v17);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v19 = v15;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v28 != v21) {
            objc_enumerationMutation(v19);
          }
          id v23 = *(id *)(*((void *)&v27 + 1) + 8 * i);
          if ([v23 isEqual:v9])
          {
            [v19 removeObject:v23];
            [v17 addObject:v23];

            NSLog(&cfstr_Updating.isa);
            if (v5) {
              id v25 = v17;
            }
            else {
              id v25 = v19;
            }
            [v13 updateWithEnabledProfiles:v25 disabledProfiles:v18];
            BOOL v24 = 1;
            goto LABEL_25;
          }
        }
        uint64_t v20 = [v19 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v20) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    v17 = 0;
    id v19 = 0;
  }
  BOOL v24 = 0;
LABEL_25:

  return v24;
}

- (void)addProfileState:(char *)a3 length:(unsigned int)a4 channel:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  v7 = a3 + 2;
  unsigned int v6 = *(unsigned __int16 *)a3;
  unsigned int v8 = *(unsigned __int16 *)&a3[5 * *(unsigned __int16 *)a3 + 2];
  if (a5 == 127) {
    uint64_t v9 = 16;
  }
  else {
    uint64_t v9 = a5;
  }
  uint64_t v19 = v9;
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v6)
  {
    for (unsigned int i = 0; i < v6; ++i)
    {
      v12 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v7 length:5];
      v13 = [[MIDICIProfile alloc] initWithData:v12];
      [v21 addObject:v13];
      v7 += 5;
    }
  }
  if (v8)
  {
    unsigned int v14 = 0;
    v15 = v7 + 2;
    do
    {
      v16 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v15 length:5];
      v17 = [[MIDICIProfile alloc] initWithData:v16];
      [v10 addObject:v17];
      v15 += 5;

      ++v14;
    }
    while (v14 < v8);
  }
  v18 = [[MIDICIProfileState alloc] initWithChannel:v5 enabledProfiles:v21 disabledProfiles:v10];
  [(NSMutableArray *)self->_profileStates replaceObjectAtIndex:v19 withObject:v18];
}

- (BOOL)sendProfile:(MIDICIProfile *)profile onChannel:(MIDIChannelNumber)channel profileData:(NSData *)profileSpecificData
{
  unsigned int v5 = channel;
  unsigned int v6 = profile;
  v7 = v6;
  if (v6 && (v5 == 127 || v5 <= 0xF))
  {
    id v8 = [(MIDICIProfile *)v6 profileID];
    [v8 bytes];
  }
  return 0;
}

- (BOOL)toggleProfile:(id)a3 onChannel:(unsigned __int8)a4 enabling:(BOOL)a5 error:(id *)a6
{
  unsigned int v7 = a4;
  id v8 = a3;
  uint64_t v9 = v8;
  if (v8 && (v7 == 127 || v7 <= 0xF))
  {
    id v10 = [v8 profileID];
    [v10 bytes];

    if (a6)
    {
      id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-10844 userInfo:0];
      *a6 = v11;
    }
  }

  return 0;
}

- (BOOL)disableProfile:(MIDICIProfile *)profile onChannel:(MIDIChannelNumber)channel error:(NSError *)outError
{
  return [(MIDICISession *)self toggleProfile:profile onChannel:channel enabling:0 error:outError];
}

- (BOOL)enableProfile:(MIDICIProfile *)profile onChannel:(MIDIChannelNumber)channel error:(NSError *)outError
{
  return [(MIDICISession *)self toggleProfile:profile onChannel:channel enabling:1 error:outError];
}

- (MIDICIProfileState)profileStateForChannel:(MIDIChannelNumber)channel
{
  if (channel == 127) {
    *(void *)&channel = 16;
  }
  else {
    *(void *)&channel = channel;
  }
  return (MIDICIProfileState *)[(NSMutableArray *)self->_profileStates objectAtIndex:channel];
}

- (void)handleCINotification:(const MIDINotification *)a3 withHandler:(id)a4
{
  v36 = (void (**)(void))a4;
  char v6 = 0;
  uint64_t messageID = a3->messageID;
  UInt32 messageSize = a3->messageSize;
  while (2)
  {
    uint64_t v9 = a3 + 1;
    switch((int)messageID)
    {
      case 20:
        NSLog(&cfstr_Handlecinotifi_0.isa);
        self->_supportsProfileCapability = 1;
        [(MIDICISession *)self addProfileState:(char *)&a3[1].messageID + 1 length:messageSize - 1 channel:LOBYTE(a3[1].messageID)];
        goto LABEL_6;
      case 21:
      case 22:
        v13 = [(MIDICISession *)self profileChangedCallback];
        unsigned int v14 = v13;
        if (messageID == 21) {
          v15 = @"kMIDIMsgProfileEnabled";
        }
        else {
          v15 = @"kMIDIMsgProfileDisabled";
        }
        v16 = _Block_copy(v13);
        NSLog(&cfstr_Handlecinotifi_1.isa, v15, v16);

        uint64_t messageID_low = LOBYTE(v9->messageID);
        v18 = [MIDICIProfile alloc];
        uint64_t v19 = [MEMORY[0x1E4F1C9B8] dataWithBytes:(char *)&a3[1].messageID + 1 length:5];
        uint64_t v20 = [(MIDICIProfile *)v18 initWithData:v19];

        [(MIDICISession *)self updateProfileStateForChannel:messageID_low withProfile:v20 enabled:messageID == 21];
        id v21 = [(MIDICISession *)self profileChangedCallback];

        if (v21)
        {
          NSLog(&cfstr_Notifying.isa);
          v22 = [(MIDICISession *)self profileChangedCallback];
          ((void (**)(void, MIDICISession *, uint64_t, MIDICIProfile *, BOOL))v22)[2](v22, self, messageID_low, v20, messageID == 21);

          id v23 = @"Done notifying.";
        }
        else
        {
          id v23 = @"Not notifying.";
        }
        BOOL v24 = 0;
        NSLog(&v23->isa);
        id v25 = 0;
        goto LABEL_26;
      case 23:
        v26 = [(MIDICISession *)self profileSpecificDataBlock];
        long long v27 = _Block_copy(v26);
        NSLog(&cfstr_Handlecinotifi_2.isa, @"kMIDIMsgProfileSpecificData", v27);

        unsigned int v35 = LOBYTE(v9->messageID);
        long long v28 = [MIDICIProfile alloc];
        long long v29 = [MEMORY[0x1E4F1C9B8] dataWithBytes:(char *)&a3[1].messageID + 1 length:5];
        uint64_t v20 = [(MIDICIProfile *)v28 initWithData:v29];

        BOOL v24 = [MEMORY[0x1E4F1C9B8] dataWithBytes:(char *)&a3[1].messageSize + 2 length:messageSize - 5];
        long long v30 = [(MIDICISession *)self profileSpecificDataBlock];

        if (v30)
        {
          NSLog(&cfstr_NotifyingProfi.isa);
          v31 = [(MIDICISession *)self profileSpecificDataBlock];
          ((void (**)(void, MIDICISession *, void, MIDICIProfile *, void *))v31)[2](v31, self, v35, v20, v24);

          NSLog(&cfstr_DoneNotifying.isa);
        }
        else
        {
          NSLog(&cfstr_NotNotifyingSi.isa);
        }
        id v25 = 0;
        goto LABEL_26;
      case 24:
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
      case 30:
        goto LABEL_15;
      case 31:
        self->_supportsPropertyCapability = 1;
        unsigned __int8 v12 = a3[1].messageID;
        a3 = (const MIDINotification *)((char *)a3 + messageSize + 8);
        self->_maxRequests = v12;
        goto LABEL_8;
      case 32:
        uint64_t v32 = [(MIDICISession *)self propertyChangedCallback];

        if (!v32) {
          goto LABEL_20;
        }
        uint64_t v33 = LOBYTE(v9->messageID);
        id v25 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:(char *)&a3[1].messageID + 1 length:messageSize - 1];
        v34 = [(MIDICISession *)self propertyChangedCallback];
        ((void (**)(void, MIDICISession *, uint64_t, void *))v34)[2](v34, self, v33, v25);

        uint64_t v20 = 0;
        BOOL v24 = 0;
        [(MIDICISession *)self setPropertyChangedCallback:0];
        goto LABEL_26;
      default:
        if (messageID == 11)
        {
          NSLog(&cfstr_Handlecinotifi.isa);
          *(MIDINotification *)&v37[16] = a3[3];
          *(_OWORD *)v37 = *(_OWORD *)&v9->messageID;
          self->_destination = a3[4].messageID;
          self->_deviceID = *(MIDICIDeviceIdentification *)&v37[4];
          id v10 = [[MIDICIDeviceInfo alloc] initWithDestination:0 deviceID:&self->_deviceID];
          deviceInfo = self->_deviceInfo;
          self->_deviceInfo = v10;

LABEL_6:
          a3 = (const MIDINotification *)((char *)a3 + messageSize + 8);
LABEL_8:
          uint64_t messageID = a3->messageID;
          UInt32 messageSize = a3->messageSize;
          char v6 = 1;
          continue;
        }
        if (messageID == 40)
        {
LABEL_20:
          uint64_t v20 = 0;
          id v25 = 0;
          BOOL v24 = 0;
          if (v6) {
            goto LABEL_27;
          }
        }
        else
        {
LABEL_15:
          uint64_t v20 = 0;
          BOOL v24 = 0;
          NSLog(&cfstr_UnexpectedMsgI.isa, messageID, messageSize);
          id v25 = 0;
LABEL_26:
          if (v6) {
LABEL_27:
          }
            v36[2]();
        }

        return;
    }
  }
}

- (BOOL)isEqual:(id)a3
{
  return self->_ciSessionRef == *((_DWORD *)a3 + 18);
}

- (NSNumber)maxPropertyRequests
{
  return (NSNumber *)[NSNumber numberWithInt:self->_maxRequests];
}

- (NSNumber)maxSysExSize
{
  return (NSNumber *)[NSNumber numberWithUnsignedLong:self->_maxSysExSize];
}

- (id)description
{
  uint64_t v2 = @"supports Profiles & Properties";
  if (self->_supportsPropertyCapability)
  {
    uint64_t v3 = @"supports Properties";
  }
  else
  {
    uint64_t v2 = @"supports Profiles";
    uint64_t v3 = @"MIDI-CI supported?";
  }
  if (!self->_supportsProfileCapability) {
    uint64_t v2 = v3;
  }
  v4 = [NSString stringWithFormat:@"<MIDICISession(%p) (%@)>", self, v2];

  return v4;
}

- (MIDICISession)initWithMIDIDestination:(unsigned int)a3 dataReadyHandler:(id)a4
{
  return 0;
}

- (MIDICISession)initWithMIDIDestination:(unsigned int)a3 dataReadyHandler:(id)a4 disconnectHandler:(id)a5 profileSpecificDataHandler:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v8)
  {
    v13 = [(MIDICISession *)self initWithMIDIDestination:v8 dataReadyHandler:v10];
    if (v13)
    {
      unsigned int v14 = _Block_copy(v11);
      id sessionDisconnectCallback = v13->_sessionDisconnectCallback;
      v13->_id sessionDisconnectCallback = v14;

      v16 = _Block_copy(v12);
      id profileSpecificDataCallback = v13->_profileSpecificDataCallback;
      v13->_id profileSpecificDataCallback = v16;
    }
    self = v13;
    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (MIDICISession)initWithMIDIEntity:(unsigned int)a3 dataReadyHandler:(id)a4
{
  return 0;
}

- (MIDICISession)initWithDiscoveredNode:(MIDICIDiscoveredNode *)discoveredNode dataReadyHandler:(void *)handler disconnectHandler:(MIDICISessionDisconnectBlock)disconnectHandler
{
  uint64_t v8 = discoveredNode;
  uint64_t v9 = handler;
  MIDICISessionDisconnectBlock v10 = disconnectHandler;
  if (v8
    && ([(MIDICIDiscoveredNode *)v8 deviceInfo], (id v11 = objc_claimAutoreleasedReturnValue()) != 0)
    && ([(MIDICIDiscoveredNode *)v8 deviceInfo],
        id v12 = objc_claimAutoreleasedReturnValue(),
        int v13 = [v12 midiDestination],
        v12,
        v11,
        v13))
  {
    v19.receiver = self;
    v19.super_class = (Class)MIDICISession;
    unsigned int v14 = [(MIDICISession *)&v19 init];
    if (v14)
    {
      v14->_destination = [(MIDICIDiscoveredNode *)v8 destination];
      v15 = _Block_copy(v10);
      id sessionDisconnectCallback = v14->_sessionDisconnectCallback;
      v14->_id sessionDisconnectCallback = v15;

      v17 = [(MIDICIDiscoveredNode *)v8 maximumSysExSize];
      v14->_maxSysExSize = [v17 unsignedLongValue];

      v14->_client = 0;
    }
  }
  else
  {
    unsigned int v14 = self;
  }

  return 0;
}

- (MIDICISession)init
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  v4 = [NSString stringWithUTF8String:"-[MIDICISession init]"];
  [v3 raise:*MEMORY[0x1E4F1C3C8], @"Unsupported! Don't call %@.", v4 format];

  return 0;
}

+ (id)description
{
  return @"MIDI-CI Session";
}

- (void)setProperty:(id)a3 onChannel:(unsigned __int8)a4 responseHandler:(id)a5
{
  self->_propertyResponseCallback = _Block_copy(a5);

  MEMORY[0x1F41817F8]();
}

- (void)getProperty:(id)a3 onChannel:(unsigned __int8)a4 responseHandler:(id)a5
{
  self->_propertyResponseCallback = _Block_copy(a5);

  MEMORY[0x1F41817F8]();
}

- (void)hasProperty:(id)a3 onChannel:(unsigned __int8)a4 responseHandler:(id)a5
{
  self->_propertyResponseCallback = _Block_copy(a5);

  MEMORY[0x1F41817F8]();
}

@end