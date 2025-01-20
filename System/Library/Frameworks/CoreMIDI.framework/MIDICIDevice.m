@interface MIDICIDevice
+ (id)description;
- (BOOL)deserialize:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)setProfile:(id)a3 newState:(BOOL)a4 enabledChannelCount:(unsigned __int16)a5 error:(id *)a6;
- (BOOL)supportsProcessInquiry;
- (BOOL)supportsProfileConfiguration;
- (BOOL)supportsPropertyExchange;
- (BOOL)supportsProtocolNegotiation;
- (MIDI2DeviceInfo)deviceInfo;
- (MIDICIDevice)initWithDescription:(id)a3;
- (NSArray)profiles;
- (id)serializeDescription;
- (unint64_t)maxPropertyExchangeRequests;
- (unint64_t)maxSysExSize;
- (unsigned)MIDIDestination;
- (unsigned)MIDISource;
- (unsigned)MUID;
- (unsigned)deviceType;
- (unsigned)functionBlockID;
- (unsigned)objectRef;
- (void)setFunctionBlockID:(unsigned __int8)a3;
- (void)setMIDIDestination:(unsigned int)a3;
- (void)setMIDISource:(unsigned int)a3;
- (void)setObjectRef:(unsigned int)a3;
@end

@implementation MIDICIDevice

+ (id)description
{
  return @"MIDI-CI Device";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profiles, 0);

  objc_storeStrong((id *)&self->_deviceInfo, 0);
}

- (void)setFunctionBlockID:(unsigned __int8)a3
{
  self->_functionBlockID = a3;
}

- (unsigned)functionBlockID
{
  return self->_functionBlockID;
}

- (void)setMIDIDestination:(unsigned int)a3
{
  self->_MIDIDestination = a3;
}

- (unsigned)MIDIDestination
{
  return self->_MIDIDestination;
}

- (void)setMIDISource:(unsigned int)a3
{
  self->_MIDISource = a3;
}

- (unsigned)MIDISource
{
  return self->_MIDISource;
}

- (void)setObjectRef:(unsigned int)a3
{
  self->_objectRef = a3;
}

- (unsigned)objectRef
{
  return self->_objectRef;
}

- (NSArray)profiles
{
  return self->_profiles;
}

- (unsigned)deviceType
{
  return self->_deviceType;
}

- (unint64_t)maxPropertyExchangeRequests
{
  return self->_maxPropertyExchangeRequests;
}

- (unint64_t)maxSysExSize
{
  return self->_maxSysExSize;
}

- (BOOL)supportsProcessInquiry
{
  return self->_supportsProcessInquiry;
}

- (BOOL)supportsPropertyExchange
{
  return self->_supportsPropertyExchange;
}

- (BOOL)supportsProfileConfiguration
{
  return self->_supportsProfileConfiguration;
}

- (BOOL)supportsProtocolNegotiation
{
  return self->_supportsProtocolNegotiation;
}

- (unsigned)MUID
{
  return self->_MUID;
}

- (MIDI2DeviceInfo)deviceInfo
{
  return self->_deviceInfo;
}

- (BOOL)setProfile:(id)a3 newState:(BOOL)a4 enabledChannelCount:(unsigned __int16)a5 error:(id *)a6
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = [v8 profileID];
  int __src = v9;
  char v16 = BYTE4(v9);
  v10 = +[MIDICIDeviceManager sharedInstance];
  unsigned int v11 = [v10 serverMUID];

  if (v6) {
    midi::ci::message::make_with_payload_size((midi::ci::message *)&v13, 5, 34, v11, self->_MUID, 127);
  }
  else {
    midi::ci::message::make_with_payload_size((midi::ci::message *)&v13, 5, 35, v11, self->_MUID, 127);
  }
  std::vector<unsigned char>::__insert_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>((uint64_t)__p, (char *)__p[1], (char *)&__src, v17, 5);
  sendUMPMessage(self->_MIDIDestination, &v13);
  if (__p[0]) {
    operator delete(__p[0]);
  }

  return 1;
}

- (id)serializeDescription
{
  v46[10] = *MEMORY[0x1E4F143B8];
  uint64_t v39 = mach_absolute_time();
  v36 = [NSString stringWithUTF8String:"type"];
  v45[0] = v36;
  v46[0] = &unk_1F38D9548;
  v33 = [NSString stringWithUTF8String:"object"];
  v45[1] = v33;
  v27 = [NSNumber numberWithUnsignedInt:self->_objectRef];
  v46[1] = v27;
  v35 = [NSString stringWithUTF8String:"source"];
  v45[2] = v35;
  v32 = [NSNumber numberWithUnsignedInt:self->_MIDISource];
  v46[2] = v32;
  v31 = [NSString stringWithUTF8String:"destination"];
  v45[3] = v31;
  v30 = [NSNumber numberWithUnsignedInt:self->_MIDIDestination];
  v46[3] = v30;
  v34 = [NSString stringWithUTF8String:"supports_protocol_negotiation"];
  v45[4] = v34;
  v29 = [NSNumber numberWithBool:self->_supportsProtocolNegotiation];
  v46[4] = v29;
  v28 = [NSString stringWithUTF8String:"supports_profile_capability"];
  v45[5] = v28;
  v2 = [NSNumber numberWithBool:self->_supportsProfileConfiguration];
  v46[5] = v2;
  v3 = [NSString stringWithUTF8String:"supports_property_exchange_capability"];
  v45[6] = v3;
  v4 = [NSNumber numberWithBool:self->_supportsPropertyExchange];
  v46[6] = v4;
  v5 = [NSString stringWithUTF8String:"supports_process_inquiry_capability"];
  v45[7] = v5;
  BOOL v6 = [NSNumber numberWithBool:self->_supportsProcessInquiry];
  v46[7] = v6;
  v7 = [NSString stringWithUTF8String:"max_sysex_size"];
  v45[8] = v7;
  id v8 = [NSNumber numberWithUnsignedInteger:self->_maxSysExSize];
  v46[8] = v8;
  uint64_t v9 = [NSString stringWithUTF8String:"max_property_requests"];
  v45[9] = v9;
  v10 = [NSNumber numberWithUnsignedInteger:self->_maxPropertyExchangeRequests];
  v46[9] = v10;
  unsigned int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:10];
  id v37 = (id)[v11 mutableCopy];

  if (self->_profiles)
  {
    v12 = [MEMORY[0x1E4F1CA48] array];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    int v13 = self->_profiles;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v41 != v15) {
            objc_enumerationMutation(v13);
          }
          id v17 = *(id *)(*((void *)&v40 + 1) + 8 * i);
          v18 = [v17 ciDevice];
          BOOL v19 = v18 == 0;

          if (v19) {
            [v17 setCiDevice:self];
          }
          v20 = [v17 serializeDescription];
          v21 = [NSNumber numberWithUnsignedLongLong:v39];
          v22 = [NSString stringWithUTF8String:"timestamp"];
          [v20 setValue:v21 forKey:v22];

          [v12 addObject:v20];
        }
        uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v14);
    }

    v23 = [NSString stringWithUTF8String:"profiles"];
    [v37 setValue:v12 forKey:v23];
  }
  v24 = [NSNumber numberWithUnsignedLongLong:v39];
  v25 = [NSString stringWithUTF8String:"timestamp"];
  [v37 setValue:v24 forKey:v25];

  return v37;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  unsigned int v5 = [(MIDICIDevice *)self MUID];
  BOOL v10 = v5 == [v4 MUID]
     && (int v6 = [(MIDICIDevice *)self supportsProtocolNegotiation],
         v6 == [v4 supportsProtocolNegotiation])
     && (int v7 = [(MIDICIDevice *)self supportsProfileConfiguration],
         v7 == [v4 supportsProfileConfiguration])
     && (int v8 = [(MIDICIDevice *)self supportsPropertyExchange],
         v8 == [v4 supportsPropertyExchange])
     && (int v9 = [(MIDICIDevice *)self supportsProcessInquiry],
         v9 == [v4 supportsProcessInquiry])
     && self->_maxSysExSize == v4[5]
     && self->_maxPropertyExchangeRequests == v4[6]
     && [(NSArray *)self->_profiles isEqualToArray:v4[7]];

  return v10;
}

- (BOOL)deserialize:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unsigned int v5 = [NSString stringWithUTF8String:"destination"];
  int v6 = [v4 objectForKey:v5];
  MIDIObjectRef v7 = [v6 unsignedIntValue];

  SInt32 outValue = 0;
  if (MIDIObjectGetIntegerProperty(v7, kMIDIPropertyProtocolID, &outValue))
  {
    BOOL v51 = 0;
  }
  else
  {
    int v8 = [NSString stringWithUTF8String:"device_info"];
    int v9 = [v4 objectForKey:v8];
    id obj = +[MIDI2DeviceInfo infoWithDescription:v9];

    BOOL v10 = [NSString stringWithUTF8String:"source"];
    unsigned int v11 = [v4 objectForKey:v10];
    unsigned int v12 = [v11 unsignedIntValue];

    int v13 = [NSString stringWithUTF8String:"muid"];
    uint64_t v14 = [v4 objectForKey:v13];
    unsigned int v15 = [v14 unsignedIntValue];

    char v16 = [NSString stringWithUTF8String:"device_type"];
    id v17 = [v4 objectForKey:v16];
    unsigned __int8 v40 = [v17 unsignedIntValue];

    v18 = [NSString stringWithUTF8String:"destination"];
    BOOL v19 = [v4 objectForKey:v18];
    unsigned int v20 = [v19 unsignedIntValue];

    v21 = [NSString stringWithUTF8String:"supports_protocol_negotiation"];
    v45 = [v4 objectForKey:v21];

    v22 = [NSString stringWithUTF8String:"supports_profile_capability"];
    v44 = [v4 objectForKey:v22];

    v23 = [NSString stringWithUTF8String:"supports_property_exchange_capability"];
    long long v42 = [v4 objectForKey:v23];

    v24 = [NSString stringWithUTF8String:"supports_process_inquiry_capability"];
    long long v41 = [v4 objectForKey:v24];

    v25 = [NSString stringWithUTF8String:"max_sysex_size"];
    long long v43 = [v4 objectForKey:v25];

    v26 = [NSString stringWithUTF8String:"max_property_requests"];
    v46 = [v4 objectForKey:v26];

    v27 = [NSString stringWithUTF8String:"object"];
    v47 = [v4 objectForKey:v27];

    v28 = [NSString stringWithUTF8String:"profiles"];
    v49 = [v4 objectForKey:v28];

    v29 = [NSString stringWithUTF8String:"function_block_id"];
    v50 = [v4 objectForKey:v29];

    OSStatus IntegerProperty = MIDIObjectGetIntegerProperty(v7, kMIDIPropertyProtocolID, &outValue);
    BOOL v51 = IntegerProperty == 0;
    if (!IntegerProperty)
    {
      objc_storeStrong((id *)&self->_deviceInfo, obj);
      self->_MUID = v15;
      self->_deviceType = v40;
      self->_MIDISource = v12;
      self->_MIDIDestination = v20;
      self->_supportsProtocolNegotiation = [v45 BOOLValue];
      self->_supportsProfileConfiguration = [v44 BOOLValue];
      self->_supportsPropertyExchange = [v42 BOOLValue];
      self->_supportsProcessInquiry = [v41 BOOLValue];
      self->_maxSysExSize = [v43 unsignedIntValue];
      self->_maxPropertyExchangeRequests = [v46 unsignedIntValue];
      self->_objectRef = [v47 unsignedIntValue];
      self->_functionBlockID = [v50 unsignedIntValue];
      v31 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v32 = v49;
      uint64_t v33 = [v32 countByEnumeratingWithState:&v52 objects:v57 count:16];
      if (v33)
      {
        uint64_t v34 = *(void *)v53;
        do
        {
          for (uint64_t i = 0; i != v33; ++i)
          {
            if (*(void *)v53 != v34) {
              objc_enumerationMutation(v32);
            }
            id v36 = *(id *)(*((void *)&v52 + 1) + 8 * i);
            id v37 = [[MIDIUMPCIProfile alloc] initWithDescription:v36];
            [(MIDIUMPCIProfile *)v37 registerToDevice:self];
            [(NSArray *)v31 addObject:v37];
          }
          uint64_t v33 = [v32 countByEnumeratingWithState:&v52 objects:v57 count:16];
        }
        while (v33);
      }

      profiles = self->_profiles;
      self->_profiles = v31;
    }
  }

  return v51;
}

- (MIDICIDevice)initWithDescription:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(MIDICIDevice *)self init];
  int v6 = v5;
  if (v5) {
    [(MIDICIDevice *)v5 deserialize:v4];
  }

  return v6;
}

@end