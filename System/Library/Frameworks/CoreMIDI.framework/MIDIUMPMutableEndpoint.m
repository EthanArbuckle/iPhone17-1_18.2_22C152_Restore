@interface MIDIUMPMutableEndpoint
+ (id)description;
- (BOOL)changeStreamProtocol:(int)a3;
- (BOOL)deserialize:(id)a3;
- (BOOL)disableFunctionBlock:(id)a3;
- (BOOL)enableFunctionBlock:(id)a3;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)registerFunctionBlocks:(id)a3 markAsStatic:(BOOL)a4 error:(id *)a5;
- (BOOL)registerWithServer;
- (BOOL)setEnabled:(BOOL)a3 error:(id *)a4;
- (BOOL)setName:(id)a3 error:(id *)a4;
- (MIDIUMPMutableEndpoint)initWithName:(id)a3 deviceInfo:(id)a4 productInstanceID:(id)a5 MIDIProtocol:(int)a6 destinationCallback:(id)a7;
- (NSArray)mutableFunctionBlocks;
- (id)serializeDescription;
- (void)setMutableFunctionBlocks:(id)a3;
@end

@implementation MIDIUMPMutableEndpoint

- (void).cxx_destruct
{
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (void)setMutableFunctionBlocks:(id)a3
{
}

- (NSArray)mutableFunctionBlocks
{
  return self->_mutableFunctionBlocks;
}

- (BOOL)registerFunctionBlocks:(id)a3 markAsStatic:(BOOL)a4 error:(id *)a5
{
  BOOL v5 = a4;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = v7;
  id v9 = v7;
  if (v5)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v31;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v31 != v12) {
            objc_enumerationMutation(v10);
          }
          id v14 = *(id *)(*((void *)&v30 + 1) + 8 * i);
          if (([v14 isEnabled] & 1) == 0)
          {
            if (a5)
            {
              id v23 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-10844 userInfo:0];
              *a5 = v23;
            }
            BOOL v22 = 0;
            goto LABEL_24;
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v35 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v15 = v8;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v27;
    char v18 = 1;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(v15);
        }
        id v20 = *(id *)(*((void *)&v26 + 1) + 8 * j);
        [v20 setFunctionBlockID:(v18 + j)];

        v8 = v9;
      }
      uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
      v18 += j;
    }
    while (v16);
  }

  [(MIDIUMPEndpoint *)self setFunctionBlocks:v15];
  [(MIDIUMPMutableEndpoint *)self setMutableFunctionBlocks:v15];
  self->super._hasStaticFunctionBlocks = v5;
  BOOL v21 = [(MIDIUMPMutableEndpoint *)self setEnabled:1 error:a5];
  if (a5) {
    BOOL v22 = 0;
  }
  else {
    BOOL v22 = v21;
  }
LABEL_24:

  return v22;
}

- (BOOL)setEnabled:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  if ([(MIDIUMPEndpoint *)self objectRef]
    || [(MIDIUMPMutableEndpoint *)self registerWithServer])
  {
    int v7 = UMPCIObjectSetEnableState((MIDIServer *)[(MIDIUMPEndpoint *)self objectRef], v5);
    if (!v7)
    {
      self->_isEnabled = v5;
      return 1;
    }
    if (a4)
    {
      uint64_t v8 = *MEMORY[0x1E4F28760];
      uint64_t v9 = v7;
      id v10 = (void *)MEMORY[0x1E4F28C58];
LABEL_9:
      id v12 = [v10 errorWithDomain:v8 code:v9 userInfo:0];
      *a4 = v12;
    }
  }
  else if (a4)
  {
    id v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = *MEMORY[0x1E4F28760];
    uint64_t v9 = -10844;
    goto LABEL_9;
  }
  return 0;
}

- (BOOL)changeStreamProtocol:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  BOOL v5 = [(MIDIUMPMutableEndpoint *)self serializeDescription];
  v6 = [NSNumber numberWithInt:v3];
  int v7 = [NSString stringWithUTF8String:"protocol"];
  [v5 setValue:v6 forKey:v7];

  int v8 = UMPCIObjectSetDescription((MIDIServer *)[(MIDIUMPEndpoint *)self objectRef], v5);
  if (!v8) {
    self->super._MIDIProtocol = v3;
  }
  BOOL v9 = v8 == 0;

  return v9;
}

- (BOOL)disableFunctionBlock:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 UMPEndpoint];

  if (v5 == self)
  {
    BOOL v6 = 1;
    if ([(MIDIUMPMutableEndpoint *)self isEnabled])
    {
      self->_isEnabled = 1;
      BOOL v6 = UMPCIObjectSetEnableState((MIDIServer *)[v4 objectRef], 0) == 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)enableFunctionBlock:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 UMPEndpoint];

  if (v5 == self)
  {
    BOOL v6 = 1;
    if (![(MIDIUMPMutableEndpoint *)self isEnabled])
    {
      self->_isEnabled = 1;
      BOOL v6 = UMPCIObjectSetEnableState((MIDIServer *)[(MIDIUMPEndpoint *)self objectRef], 1) == 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)registerWithServer
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v2 = [(MIDIUMPMutableEndpoint *)self serializeDescription];
  uint64_t v3 = v2;
  id v4 = [NSNumber numberWithBool:1];
  BOOL v5 = [NSString stringWithUTF8String:"client_owned"];
  [v2 setValue:v4 forKey:v5];

  unsigned int v39 = 0;
  if (UMPCIObjectCreate(2, v2, (int *)&v39)
    || ([(MIDIUMPEndpoint *)self setObjectRef:v39],
        CFDictionaryRef outDict = 0,
        MIDIObjectGetDictionaryProperty([(MIDIUMPEndpoint *)self objectRef], @"object description", &outDict)))
  {
    BOOL v6 = 0;
  }
  else
  {
    CFDictionaryRef v23 = outDict;
    int v8 = [NSString stringWithUTF8String:"function_blocks"];
    v24 = [(__CFDictionary *)v23 objectForKey:v8];

    if (v24)
    {
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      obuint64_t j = v24;
      uint64_t v9 = [obj countByEnumeratingWithState:&v34 objects:v41 count:16];
      if (v9)
      {
        uint64_t v27 = *(void *)v35;
        while (2)
        {
          uint64_t v26 = v9;
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v35 != v27) {
              objc_enumerationMutation(obj);
            }
            id v29 = *(id *)(*((void *)&v34 + 1) + 8 * i);
            uint64_t v11 = [NSString stringWithUTF8String:"object"];
            id v12 = [v29 objectForKey:v11];

            v13 = [NSString stringWithUTF8String:"id"];
            id v14 = [v29 objectForKey:v13];

            if (v12) {
              BOOL v15 = v14 == 0;
            }
            else {
              BOOL v15 = 1;
            }
            if (v15)
            {

              BOOL v6 = 0;
              goto LABEL_29;
            }
            uint64_t v16 = [(MIDIUMPEndpoint *)self functionBlocks];
            long long v32 = 0u;
            long long v33 = 0u;
            long long v30 = 0u;
            long long v31 = 0u;
            id v17 = v16;
            uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v40 count:16];
            if (v18)
            {
              uint64_t v19 = *(void *)v31;
              while (2)
              {
                for (uint64_t j = 0; j != v18; ++j)
                {
                  if (*(void *)v31 != v19) {
                    objc_enumerationMutation(v17);
                  }
                  id v21 = *(id *)(*((void *)&v30 + 1) + 8 * j);
                  int v22 = [v21 functionBlockID];
                  if ([v14 unsignedIntegerValue] == v22)
                  {
                    v2 = v3;
                    objc_msgSend(v21, "setObjectRef:", objc_msgSend(v12, "unsignedIntValue"));

                    goto LABEL_25;
                  }
                }
                v2 = v3;
                uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v40 count:16];
                if (v18) {
                  continue;
                }
                break;
              }
            }
LABEL_25:
          }
          uint64_t v9 = [obj countByEnumeratingWithState:&v34 objects:v41 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
      BOOL v6 = 1;
LABEL_29:
    }
    else
    {
      BOOL v6 = 1;
    }
  }
  return v6;
}

- (BOOL)setName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int v7 = (NSString *)[v6 copy];
  name = self->super._name;
  self->super._name = v7;

  uint64_t v9 = [(MIDIUMPMutableEndpoint *)self serializeDescription];
  int v10 = UMPCIObjectSetDescription((MIDIServer *)[(MIDIUMPEndpoint *)self objectRef], v9);
  int v11 = v10;
  if (a4 && v10)
  {
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-10844 userInfo:0];
    *a4 = v12;
  }
  return v11 == 0;
}

- (BOOL)deserialize:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [NSString stringWithUTF8String:"name"];
  obuint64_t j = [v4 objectForKey:v5];

  id v6 = [NSString stringWithUTF8String:"device_info"];
  int v7 = [v4 objectForKey:v6];
  id v37 = +[MIDI2DeviceInfo infoWithDescription:v7];

  int v8 = [NSString stringWithUTF8String:"product_instance"];
  id v31 = [v4 objectForKey:v8];

  uint64_t v9 = [NSString stringWithUTF8String:"protocol"];
  long long v30 = [v4 objectForKey:v9];

  int v10 = [NSString stringWithUTF8String:"has_static_function_blocks"];
  id v29 = [v4 objectForKey:v10];

  int v11 = [NSString stringWithUTF8String:"jrts_receive_capability"];
  long long v32 = [v4 objectForKey:v11];

  id v12 = [NSString stringWithUTF8String:"jrts_transmit_capability"];
  long long v34 = [v4 objectForKey:v12];

  v13 = [NSString stringWithUTF8String:"source"];
  long long v35 = [v4 objectForKey:v13];

  id v14 = [NSString stringWithUTF8String:"destination"];
  long long v36 = [v4 objectForKey:v14];

  BOOL v15 = [NSString stringWithUTF8String:"function_blocks"];
  uint64_t v27 = [v4 objectForKey:v15];

  uint64_t v16 = [NSString stringWithUTF8String:"supported_protocols"];
  long long v28 = [v4 objectForKey:v16];

  objc_storeStrong((id *)&self->super._name, obj);
  objc_storeStrong((id *)&self->super._deviceInfo, v37);
  objc_storeStrong((id *)&self->super._productInstanceID, v31);
  self->super._MIDIProtocol = [v30 intValue];
  id v17 = +[MIDI2DeviceInfo infoWithInfo:v37];
  deviceInfo = self->super._deviceInfo;
  self->super._deviceInfo = v17;

  self->super._hasStaticFunctionBlocks = [v29 BOOLValue];
  self->super._hasJRTSReceiveCapability = [v32 BOOLValue];
  self->super._hasJRTSTransmitCapability = [v34 BOOLValue];
  self->super._MIDISource = [v35 unsignedIntegerValue];
  self->super._MIDIDestination = [v36 unsignedIntegerValue];
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v20 = v27;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v39;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v39 != v22) {
          objc_enumerationMutation(v20);
        }
        id v24 = *(id *)(*((void *)&v38 + 1) + 8 * v23);
        v25 = [[MIDIUMPFunctionBlock alloc] initWithDescription:v24];
        [v19 addObject:v25];

        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [v20 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v21);
  }

  objc_storeStrong((id *)&self->super._functionBlocks, v19);
  self->super._supportedMIDIProtocols = [v28 unsignedIntegerValue];

  return 1;
}

- (id)serializeDescription
{
  v8.receiver = self;
  v8.super_class = (Class)MIDIUMPMutableEndpoint;
  uint64_t v3 = [(MIDIUMPEndpoint *)&v8 serializeDescription];
  if (v3)
  {
    id v4 = [NSNumber numberWithBool:self->_isEnabled];
    BOOL v5 = [NSString stringWithUTF8String:"enabled"];
    [v3 setValue:v4 forKey:v5];

    id v6 = v3;
  }

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  v9.receiver = self;
  v9.super_class = (Class)MIDIUMPMutableEndpoint;
  unsigned int v5 = [(MIDIUMPEndpoint *)&v9 isEqual:v4];
  objc_opt_class();
  int isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & v5) == 1) {
    char v7 = self->_isEnabled == v4[72];
  }
  else {
    char v7 = v5 & ~(_BYTE)isKindOfClass;
  }

  return v7;
}

- (MIDIUMPMutableEndpoint)initWithName:(id)a3 deviceInfo:(id)a4 productInstanceID:(id)a5 MIDIProtocol:(int)a6 destinationCallback:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  v13 = (__CFString *)a3;
  id v14 = a4;
  id v15 = a5;
  CFTypeID MainBundle = (CFTypeID)a7;
  id v17 = (void *)MainBundle;
  if (CheckVirtualEndpointCreation(void)::virtualEndpointsAllowed < 0)
  {
    CheckVirtualEndpointCreation(void)::virtualEndpointsAllowed = 0;
    CFTypeID MainBundle = (CFTypeID)CFBundleGetMainBundle();
    if (MainBundle
      && (MainBundle = (CFTypeID)CFBundleGetValueForInfoDictionaryKey((CFBundleRef)MainBundle, @"UIBackgroundModes"), (CFArrayRef v18 = (const __CFArray *)MainBundle) != 0)&& (v19 = CFGetTypeID((CFTypeRef)MainBundle), MainBundle = CFArrayGetTypeID(), v19 == MainBundle)&& (v33.length = CFArrayGetCount(v18), v33.location = 0, MainBundle = CFArrayContainsValue(v18, v33, @"audio"), MainBundle))
    {
      CheckVirtualEndpointCreation(void)::virtualEndpointsAllowed = 1;
    }
    else if (!CheckVirtualEndpointCreation(void)::virtualEndpointsAllowed)
    {
LABEL_12:
      uint64_t v21 = 0;
      goto LABEL_13;
    }
  }
  else if (!CheckVirtualEndpointCreation(void)::virtualEndpointsAllowed)
  {
    goto LABEL_12;
  }
  MIDIEndpointRef outSrc = 0;
  UMPCIClients::instance((UMPCIClients *)MainBundle);
  id v20 = (UMPCIClients *)MIDISourceCreateWithProtocol(UMPCIClients::instance(void)::all, v13, (MIDIProtocolID)v8, &outSrc);
  if (v20) {
    goto LABEL_12;
  }
  self->super._MIDISource = outSrc;
  MIDIEndpointRef outSrc = 0;
  UMPCIClients::instance(v20);
  if (MIDIDestinationCreateInternal((MIDIServer *)UMPCIClients::instance(void)::all, (uint64_t)v13, v8, (int *)&outSrc, 0, (uint64_t)v17))goto LABEL_12; {
  self->super._MIDIDestination = outSrc;
  }
  SInt32 value = 0;
  SInt32 outValue = 0;
  if (!MIDIObjectGetIntegerProperty(self->super._MIDISource, kMIDIPropertyUniqueID, &outValue)
    && !MIDIObjectGetIntegerProperty(self->super._MIDIDestination, kMIDIPropertyUniqueID, &value))
  {
    CFStringRef v23 = (const __CFString *)kMIDIPropertyAssociatedEndpoint;
    MIDIObjectSetIntegerProperty(self->super._MIDISource, (CFStringRef)kMIDIPropertyAssociatedEndpoint, value);
    MIDIObjectSetIntegerProperty(self->super._MIDIDestination, v23, outValue);
  }
  MIDIObjectSetIntegerProperty(self->super._MIDISource, kMIDIPropertyUMPCanTransmitGroupless, 1);
  MIDIObjectSetIntegerProperty(self->super._MIDIDestination, kMIDIPropertyUMPCanTransmitGroupless, 1);
  MIDIObjectSetIntegerProperty(self->super._MIDISource, kMIDIPropertyUMPActiveGroupBitmap, 15);
  MIDIObjectSetIntegerProperty(self->super._MIDIDestination, kMIDIPropertyUMPActiveGroupBitmap, 15);
  objc_storeStrong((id *)&self->super._name, a3);
  id v24 = +[MIDI2DeviceInfo infoWithInfo:v14];
  deviceInfo = self->super._deviceInfo;
  self->super._deviceInfo = v24;

  uint64_t v26 = [NSString stringWithString:v15];
  productInstanceID = self->super._productInstanceID;
  self->super._productInstanceID = v26;

  self->super._MIDIProtocol = v8;
  if (v8 == 2) {
    unsigned __int8 v28 = 2;
  }
  else {
    unsigned __int8 v28 = 1;
  }
  self->super._supportedMIDIProtocols = v28;
  functionBlocks = self->super._functionBlocks;
  self->super._functionBlocks = (NSArray *)MEMORY[0x1E4F1CBF0];

  [(MIDIUMPEndpoint *)self setReceiveBlock:v17];
  self->super._endpointType = 1;
  uint64_t v21 = self;
LABEL_13:

  return v21;
}

+ (id)description
{
  return @"MIDI UMP Mutable Endpoint";
}

@end