@interface MIDIUMPFunctionBlock
+ (id)description;
- (BOOL)deserialize:(id)a3;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (MIDICIDevice)midiCIDevice;
- (MIDIUMPEndpoint)UMPEndpoint;
- (MIDIUMPFunctionBlock)initWithDescription:(id)a3;
- (NSString)name;
- (id)serializeDescription;
- (int)MIDI1Info;
- (int)UIHint;
- (int)direction;
- (unsigned)firstGroup;
- (unsigned)functionBlockID;
- (unsigned)maxSysEx8Streams;
- (unsigned)objectRef;
- (unsigned)totalGroupsSpanned;
- (void)setEndpoint:(id)a3;
- (void)setFunctionBlockID:(unsigned __int8)a3;
- (void)setObjectRef:(unsigned int)a3;
@end

@implementation MIDIUMPFunctionBlock

+ (id)description
{
  return @"MIDI UMP Function Block";
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_UMPEndpoint);

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

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (MIDIUMPEndpoint)UMPEndpoint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_UMPEndpoint);

  return (MIDIUMPEndpoint *)WeakRetained;
}

- (int)UIHint
{
  return self->_UIHint;
}

- (int)MIDI1Info
{
  return self->_MIDI1Info;
}

- (unsigned)maxSysEx8Streams
{
  return self->_maxSysEx8Streams;
}

- (unsigned)totalGroupsSpanned
{
  return self->_totalGroupsSpanned;
}

- (unsigned)firstGroup
{
  return self->_firstGroup;
}

- (int)direction
{
  return self->_direction;
}

- (unsigned)functionBlockID
{
  return self->_functionBlockID;
}

- (NSString)name
{
  return self->_name;
}

- (MIDICIDevice)midiCIDevice
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  p_UMPEndpoint = &self->_UMPEndpoint;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_UMPEndpoint);

  if (WeakRetained)
  {
    v4 = +[MIDICIDeviceManager sharedInstance];
    v5 = [v4 devices];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v6);
          }
          v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          int v11 = [v10 MIDISource];
          id v12 = objc_loadWeakRetained((id *)p_UMPEndpoint);
          if (v11 != [v12 MIDISource]) {
            goto LABEL_13;
          }
          int v13 = [v10 MIDIDestination];
          id v14 = objc_loadWeakRetained((id *)p_UMPEndpoint);
          if (v13 != [v14 MIDIDestination]
            || [v10 functionBlockID] != self->_functionBlockID)
          {

LABEL_13:
            continue;
          }
          id v15 = objc_loadWeakRetained((id *)p_UMPEndpoint);
          char v16 = [v15 containsFunctionBlock:self];

          if (v16)
          {
            id v17 = v10;
            goto LABEL_18;
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v7);
    }
    id v17 = 0;
LABEL_18:
  }
  else
  {
    id v17 = 0;
  }

  return (MIDICIDevice *)v17;
}

- (void)setEndpoint:(id)a3
{
}

- (void)setFunctionBlockID:(unsigned __int8)a3
{
  self->_functionBlockID = a3;
}

- (id)serializeDescription
{
  v31[11] = *MEMORY[0x1E4F143B8];
  p_UMPEndpoint = &self->_UMPEndpoint;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_UMPEndpoint);

  if (WeakRetained)
  {
    v29 = [NSString stringWithUTF8String:"object"];
    v30[0] = v29;
    v28 = [NSNumber numberWithUnsignedInt:self->_objectRef];
    v31[0] = v28;
    v27 = [NSString stringWithUTF8String:"type"];
    v30[1] = v27;
    v31[1] = &unk_1F38D9530;
    v26 = [NSString stringWithUTF8String:"id"];
    v30[2] = v26;
    uint64_t v25 = [NSNumber numberWithUnsignedChar:self->_functionBlockID];
    v31[2] = v25;
    v24 = [NSString stringWithUTF8String:"name"];
    v30[3] = v24;
    v31[3] = self->_name;
    long long v23 = [NSString stringWithUTF8String:"first_group"];
    v30[4] = v23;
    long long v22 = [NSNumber numberWithUnsignedChar:self->_firstGroup];
    v31[4] = v22;
    long long v21 = [NSString stringWithUTF8String:"groups_spanned"];
    v30[5] = v21;
    long long v20 = [NSNumber numberWithUnsignedChar:self->_totalGroupsSpanned];
    v31[5] = v20;
    v19 = [NSString stringWithUTF8String:"max_sysex8_stream"];
    v30[6] = v19;
    v18 = [NSNumber numberWithUnsignedChar:self->_maxSysEx8Streams];
    v31[6] = v18;
    id v17 = [NSString stringWithUTF8String:"midi1_info"];
    v30[7] = v17;
    v5 = [NSNumber numberWithInt:self->_MIDI1Info];
    v31[7] = v5;
    id v6 = [NSString stringWithUTF8String:"ui_hint"];
    v30[8] = v6;
    uint64_t v7 = [NSNumber numberWithInt:self->_UIHint];
    v31[8] = v7;
    uint64_t v8 = [NSString stringWithUTF8String:"enabled"];
    v30[9] = v8;
    v9 = [NSNumber numberWithBool:self->_isEnabled];
    v31[9] = v9;
    v10 = [NSString stringWithUTF8String:"owner"];
    v30[10] = v10;
    int v11 = NSNumber;
    id v12 = objc_loadWeakRetained((id *)p_UMPEndpoint);
    int v13 = objc_msgSend(v11, "numberWithUnsignedInt:", objc_msgSend(v12, "objectRef"));
    v31[10] = v13;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:11];
    id v15 = (void *)[v14 mutableCopy];
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (BOOL)deserialize:(id)a3
{
  id v4 = a3;
  v5 = [NSString stringWithUTF8String:"id"];
  long long v23 = [v4 objectForKey:v5];

  id v6 = [NSString stringWithUTF8String:"name"];
  id obj = [v4 objectForKey:v6];

  uint64_t v7 = [NSString stringWithUTF8String:"direction"];
  v24 = [v4 objectForKey:v7];

  uint64_t v8 = [NSString stringWithUTF8String:"first_group"];
  v9 = [v4 objectForKey:v8];

  v10 = [NSString stringWithUTF8String:"groups_spanned"];
  int v11 = [v4 objectForKey:v10];

  id v12 = [NSString stringWithUTF8String:"max_sysex8_stream"];
  int v13 = [v4 objectForKey:v12];

  id v14 = [NSString stringWithUTF8String:"midi1_info"];
  id v15 = [v4 objectForKey:v14];

  char v16 = [NSString stringWithUTF8String:"ui_hint"];
  id v17 = [v4 objectForKey:v16];

  v18 = [NSString stringWithUTF8String:"enabled"];
  v19 = [v4 objectForKey:v18];

  long long v20 = [NSString stringWithUTF8String:"object"];
  long long v21 = [v4 objectForKey:v20];

  self->_functionBlockID = [v23 unsignedIntegerValue];
  objc_storeStrong((id *)&self->_name, obj);
  self->_direction = [v24 unsignedIntegerValue];
  self->_firstGroup = [v9 unsignedIntegerValue];
  self->_totalGroupsSpanned = [v11 unsignedIntegerValue];
  self->_maxSysEx8Streams = [v13 unsignedIntValue];
  self->_MIDI1Info = [v15 unsignedIntegerValue];
  self->_UIHint = [v17 unsignedIntegerValue];
  self->_isEnabled = [v19 BOOLValue];
  self->_objectRef = [v21 unsignedIntValue];

  return 1;
}

- (MIDIUMPFunctionBlock)initWithDescription:(id)a3
{
  self->_isMine = 0;
  return self;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NSString *)self->_name isEqualToString:v4[1]]
    && self->_functionBlockID == *((unsigned __int8 *)v4 + 16)
    && self->_direction == *((_DWORD *)v4 + 5)
    && self->_firstGroup == *((unsigned __int8 *)v4 + 24)
    && self->_totalGroupsSpanned == *((unsigned __int8 *)v4 + 25)
    && self->_maxSysEx8Streams == *((unsigned __int8 *)v4 + 26)
    && self->_MIDI1Info == *((_DWORD *)v4 + 7)
    && self->_UIHint == *((_DWORD *)v4 + 8)
    && self->_isEnabled == *((unsigned __int8 *)v4 + 48);

  return v5;
}

@end