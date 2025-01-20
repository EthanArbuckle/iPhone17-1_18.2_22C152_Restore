@interface MIDIUMPEndpoint
+ (id)description;
- (BOOL)containsFunctionBlock:(id)a3;
- (BOOL)deserialize:(id)a3;
- (BOOL)hasJRTSReceiveCapability;
- (BOOL)hasJRTSTransmitCapability;
- (BOOL)hasStaticFunctionBlocks;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMine;
- (MIDI2DeviceInfo)deviceInfo;
- (MIDIUMPEndpoint)initWithDescription:(id)a3;
- (NSArray)functionBlocks;
- (NSString)name;
- (NSString)productInstanceID;
- (id)receiveBlock;
- (id)serializeDescription;
- (int)MIDIProtocol;
- (unsigned)MIDIDestination;
- (unsigned)MIDISource;
- (unsigned)endpointType;
- (unsigned)objectRef;
- (unsigned)supportedMIDIProtocols;
- (void)setFunctionBlocks:(id)a3;
- (void)setIsMine:(BOOL)a3;
- (void)setObjectRef:(unsigned int)a3;
- (void)setReceiveBlock:(id)a3;
@end

@implementation MIDIUMPEndpoint

- (void).cxx_destruct
{
  objc_storeStrong(&self->_receiveBlock, 0);
  objc_storeStrong((id *)&self->_functionBlocks, 0);
  objc_storeStrong((id *)&self->_productInstanceID, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setObjectRef:(unsigned int)a3
{
  self->_objectRef = a3;
}

- (unsigned)objectRef
{
  return self->_objectRef;
}

- (void)setIsMine:(BOOL)a3
{
  self->_isMine = a3;
}

- (BOOL)isMine
{
  return self->_isMine;
}

- (void)setReceiveBlock:(id)a3
{
}

- (id)receiveBlock
{
  return self->_receiveBlock;
}

- (void)setFunctionBlocks:(id)a3
{
}

- (NSArray)functionBlocks
{
  return self->_functionBlocks;
}

- (unsigned)endpointType
{
  return self->_endpointType;
}

- (BOOL)hasJRTSTransmitCapability
{
  return self->_hasJRTSTransmitCapability;
}

- (BOOL)hasJRTSReceiveCapability
{
  return self->_hasJRTSReceiveCapability;
}

- (BOOL)hasStaticFunctionBlocks
{
  return self->_hasStaticFunctionBlocks;
}

- (NSString)productInstanceID
{
  return self->_productInstanceID;
}

- (MIDI2DeviceInfo)deviceInfo
{
  return self->_deviceInfo;
}

- (unsigned)MIDISource
{
  return self->_MIDISource;
}

- (unsigned)MIDIDestination
{
  return self->_MIDIDestination;
}

- (unsigned)supportedMIDIProtocols
{
  return self->_supportedMIDIProtocols;
}

- (int)MIDIProtocol
{
  return self->_MIDIProtocol;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)containsFunctionBlock:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_functionBlocks;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (*(id *)(*((void *)&v10 + 1) + 8 * i) == v4)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)deserialize:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [NSString stringWithUTF8String:"name"];
  id obj = [v4 objectForKey:v5];

  uint64_t v6 = [NSString stringWithUTF8String:"device_info"];
  uint64_t v7 = [v4 objectForKey:v6];
  id v41 = +[MIDI2DeviceInfo infoWithDescription:v7];

  v8 = [NSString stringWithUTF8String:"product_instance"];
  id v36 = [v4 objectForKey:v8];

  v9 = [NSString stringWithUTF8String:"protocol"];
  v35 = [v4 objectForKey:v9];

  long long v10 = [NSString stringWithUTF8String:"has_static_function_blocks"];
  v33 = [v4 objectForKey:v10];

  long long v11 = [NSString stringWithUTF8String:"jrts_receive_capability"];
  v31 = [v4 objectForKey:v11];

  long long v12 = [NSString stringWithUTF8String:"jrts_transmit_capability"];
  v32 = [v4 objectForKey:v12];

  long long v13 = [NSString stringWithUTF8String:"source"];
  v34 = [v4 objectForKey:v13];

  v14 = [NSString stringWithUTF8String:"destination"];
  v38 = [v4 objectForKey:v14];

  uint64_t v15 = [NSString stringWithUTF8String:"endpoint_type"];
  v30 = [v4 objectForKey:v15];

  v16 = [NSString stringWithUTF8String:"function_blocks"];
  v29 = [v4 objectForKey:v16];

  v17 = [NSString stringWithUTF8String:"object"];
  v39 = [v4 objectForKey:v17];

  v18 = [NSString stringWithUTF8String:"supported_protocols"];
  v40 = [v4 objectForKey:v18];

  objc_storeStrong((id *)&self->_name, obj);
  objc_storeStrong((id *)&self->_deviceInfo, v41);
  objc_storeStrong((id *)&self->_productInstanceID, v36);
  self->_MIDIProtocol = [v35 intValue];
  self->_supportedMIDIProtocols = [v40 unsignedIntegerValue];
  v19 = +[MIDI2DeviceInfo infoWithInfo:v41];
  deviceInfo = self->_deviceInfo;
  self->_deviceInfo = v19;

  self->_hasStaticFunctionBlocks = [v33 BOOLValue];
  self->_hasJRTSReceiveCapability = [v31 BOOLValue];
  self->_hasJRTSTransmitCapability = [v32 BOOLValue];
  self->_MIDISource = [v34 unsignedIntegerValue];
  self->_MIDIDestination = [v38 unsignedIntegerValue];
  self->_objectRef = [v39 unsignedIntValue];
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v22 = v29;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v43;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v43 != v24) {
          objc_enumerationMutation(v22);
        }
        id v26 = *(id *)(*((void *)&v42 + 1) + 8 * v25);
        v27 = [[MIDIUMPFunctionBlock alloc] initWithDescription:v26];
        [(MIDIUMPFunctionBlock *)v27 setEndpoint:self];
        [v21 addObject:v27];

        ++v25;
      }
      while (v23 != v25);
      uint64_t v23 = [v22 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v23);
  }

  objc_storeStrong((id *)&self->_functionBlocks, v21);
  self->_endpointType = [v30 unsignedIntegerValue];

  return 1;
}

- (MIDIUMPEndpoint)initWithDescription:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MIDIUMPEndpoint;
  v5 = [(MIDIUMPEndpoint *)&v8 init];
  uint64_t v6 = v5;
  if (v5) {
    [(MIDIUMPEndpoint *)v5 deserialize:v4];
  }
  v6->_isMine = 0;

  return v6;
}

- (id)serializeDescription
{
  v50[14] = *MEMORY[0x1E4F143B8];
  uint64_t v43 = mach_absolute_time();
  id v41 = [NSString stringWithUTF8String:"object"];
  v49[0] = v41;
  v39 = [NSNumber numberWithUnsignedInt:self->_objectRef];
  v50[0] = v39;
  v29 = [NSString stringWithUTF8String:"type"];
  v49[1] = v29;
  v50[1] = &unk_1F38D9560;
  v38 = [NSString stringWithUTF8String:"timestamp"];
  v49[2] = v38;
  v28 = [NSNumber numberWithUnsignedLongLong:v43];
  v50[2] = v28;
  v37 = [NSString stringWithUTF8String:"name"];
  v49[3] = v37;
  v50[3] = self->_name;
  id v36 = [NSString stringWithUTF8String:"protocol"];
  v49[4] = v36;
  v35 = [NSNumber numberWithInt:self->_MIDIProtocol];
  v50[4] = v35;
  v34 = [NSString stringWithUTF8String:"source"];
  v49[5] = v34;
  v27 = [NSNumber numberWithUnsignedInt:self->_MIDISource];
  v50[5] = v27;
  v33 = [NSString stringWithUTF8String:"destination"];
  v49[6] = v33;
  id v26 = [NSNumber numberWithUnsignedInt:self->_MIDIDestination];
  v50[6] = v26;
  v32 = [NSString stringWithUTF8String:"device_info"];
  v49[7] = v32;
  uint64_t v25 = [(MIDI2DeviceInfo *)self->_deviceInfo serializeDescription];
  v50[7] = v25;
  v31 = [NSString stringWithUTF8String:"product_instance"];
  v49[8] = v31;
  v50[8] = self->_productInstanceID;
  v30 = [NSString stringWithUTF8String:"has_static_function_blocks"];
  v49[9] = v30;
  v2 = [NSNumber numberWithBool:self->_hasStaticFunctionBlocks];
  v50[9] = v2;
  v3 = [NSString stringWithUTF8String:"jrts_receive_capability"];
  v49[10] = v3;
  id v4 = [NSNumber numberWithBool:self->_hasJRTSReceiveCapability];
  v50[10] = v4;
  v5 = [NSString stringWithUTF8String:"jrts_transmit_capability"];
  v49[11] = v5;
  uint64_t v6 = [NSNumber numberWithBool:self->_hasJRTSTransmitCapability];
  v50[11] = v6;
  uint64_t v7 = [NSString stringWithUTF8String:"endpoint_type"];
  v49[12] = v7;
  objc_super v8 = [NSNumber numberWithUnsignedChar:self->_endpointType];
  v50[12] = v8;
  v9 = [NSString stringWithUTF8String:"supported_protocols"];
  v49[13] = v9;
  long long v10 = [NSNumber numberWithUnsignedChar:self->_supportedMIDIProtocols];
  v50[13] = v10;
  long long v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:14];
  id v40 = (id)[v11 mutableCopy];

  if (self->_functionBlocks)
  {
    long long v12 = [MEMORY[0x1E4F1CA48] array];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v13 = self->_functionBlocks;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v45 != v15) {
            objc_enumerationMutation(v13);
          }
          id v17 = *(id *)(*((void *)&v44 + 1) + 8 * i);
          v18 = [v17 UMPEndpoint];
          BOOL v19 = v18 == 0;

          if (v19) {
            [v17 setEndpoint:self];
          }
          v20 = [v17 serializeDescription];
          id v21 = [NSNumber numberWithUnsignedLongLong:v43];
          id v22 = [NSString stringWithUTF8String:"timestamp"];
          [v20 setValue:v21 forKey:v22];

          [v12 addObject:v20];
        }
        uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v44 objects:v48 count:16];
      }
      while (v14);
    }

    uint64_t v23 = [NSString stringWithUTF8String:"function_blocks"];
    [v40 setValue:v12 forKey:v23];
  }

  return v40;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4
    && [(NSString *)self->_name isEqualToString:v4[4]]
    && self->_MIDIProtocol == *((_DWORD *)v4 + 4)
    && self->_MIDIDestination == *((_DWORD *)v4 + 5)
    && self->_MIDISource == *((_DWORD *)v4 + 6)
    && [(MIDI2DeviceInfo *)self->_deviceInfo isEqual:v4[5]]
    && self->_hasStaticFunctionBlocks == *((unsigned __int8 *)v4 + 9)
    && self->_hasJRTSReceiveCapability == *((unsigned __int8 *)v4 + 10)
    && self->_hasJRTSTransmitCapability == *((unsigned __int8 *)v4 + 11)
    && [(NSArray *)self->_functionBlocks isEqualToArray:v4[7]];

  return v5;
}

+ (id)description
{
  return @"MIDI UMP Endpoint";
}

@end