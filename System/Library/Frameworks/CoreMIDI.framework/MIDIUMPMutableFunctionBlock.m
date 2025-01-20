@interface MIDIUMPMutableFunctionBlock
+ (id)description;
- (BOOL)reconfigureWithFirstGroup:(unsigned __int8)a3 direction:(int)a4 MIDI1Info:(int)a5 UIHint:(int)a6 error:(id *)a7;
- (BOOL)registerWithServer;
- (BOOL)setEnabled:(BOOL)a3 error:(id *)a4;
- (BOOL)setName:(id)a3 error:(id *)a4;
- (MIDIUMPMutableFunctionBlock)initWithName:(id)a3 direction:(int)a4 firstGroup:(unsigned __int8)a5 totalGroupsSpanned:(unsigned __int8)a6 maxSysEx8Streams:(unsigned __int8)a7 MIDI1Info:(int)a8 UIHint:(int)a9 isEnabled:(BOOL)a10;
- (void)setFunctionBlockID:(unsigned __int8)a3;
@end

@implementation MIDIUMPMutableFunctionBlock

+ (id)description
{
  return @"MIDI UMP Function Block";
}

- (BOOL)reconfigureWithFirstGroup:(unsigned __int8)a3 direction:(int)a4 MIDI1Info:(int)a5 UIHint:(int)a6 error:(id *)a7
{
  if ([(MIDIUMPFunctionBlock *)self totalGroupsSpanned] + a3 < 0x11)
  {
    if (a4 == 3
      || ([(MIDIUMPFunctionBlock *)self midiCIDevice],
          v15 = objc_claimAutoreleasedReturnValue(),
          v15,
          !v15))
    {
      self->super._firstGroup = a3;
      self->super._direction = a4;
      self->super._MIDI1Info = a5;
      self->super._UIHint = a6;
      id v13 = [(MIDIUMPFunctionBlock *)self serializeDescription];
      int v16 = UMPCIObjectSetDescription((MIDIServer *)[(MIDIUMPFunctionBlock *)self objectRef], v13);
      BOOL v14 = v16 == 0;
      if (a7 && v16)
      {
        id v17 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v16 userInfo:0];
        *a7 = v17;

        BOOL v14 = 0;
      }
      goto LABEL_11;
    }
    if (a7)
    {
LABEL_3:
      id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-10845 userInfo:0];
      BOOL v14 = 0;
      *a7 = v13;
LABEL_11:

      return v14;
    }
  }
  else if (a7)
  {
    goto LABEL_3;
  }
  return 0;
}

- (BOOL)setName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (NSString *)[v6 copy];
  name = self->super._name;
  self->super._name = v7;

  v9 = [(MIDIUMPFunctionBlock *)self serializeDescription];
  int v10 = UMPCIObjectSetDescription((MIDIServer *)[(MIDIUMPFunctionBlock *)self objectRef], v9);
  int v11 = v10;
  if (a4 && v10)
  {
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-10844 userInfo:0];
    *a4 = v12;
  }
  return v11 == 0;
}

- (BOOL)setEnabled:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  if ([(MIDIUMPFunctionBlock *)self objectRef]
    || [(MIDIUMPMutableFunctionBlock *)self registerWithServer])
  {
    int v7 = UMPCIObjectSetEnableState((MIDIServer *)[(MIDIUMPFunctionBlock *)self objectRef], v5);
    if (!v7)
    {
      self->super._isEnabled = v5;
      return 1;
    }
    if (a4)
    {
      uint64_t v8 = *MEMORY[0x1E4F28760];
      uint64_t v9 = v7;
      int v10 = (void *)MEMORY[0x1E4F28C58];
LABEL_9:
      id v12 = [v10 errorWithDomain:v8 code:v9 userInfo:0];
      *a4 = v12;
    }
  }
  else if (a4)
  {
    int v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = *MEMORY[0x1E4F28760];
    uint64_t v9 = -10844;
    goto LABEL_9;
  }
  return 0;
}

- (BOOL)registerWithServer
{
  v3 = [(MIDIUMPFunctionBlock *)self serializeDescription];
  unsigned int v6 = 0;
  int v4 = UMPCIObjectCreate(1, v3, (int *)&v6);
  if (!v4) {
    [(MIDIUMPFunctionBlock *)self setObjectRef:v6];
  }

  return v4 == 0;
}

- (void)setFunctionBlockID:(unsigned __int8)a3
{
  self->super._functionBlockID = a3;
}

- (MIDIUMPMutableFunctionBlock)initWithName:(id)a3 direction:(int)a4 firstGroup:(unsigned __int8)a5 totalGroupsSpanned:(unsigned __int8)a6 maxSysEx8Streams:(unsigned __int8)a7 MIDI1Info:(int)a8 UIHint:(int)a9 isEnabled:(BOOL)a10
{
  id v17 = a3;
  if (CheckVirtualEndpointCreation(void)::virtualEndpointsAllowed < 0)
  {
    CheckVirtualEndpointCreation(void)::virtualEndpointsAllowed = 0;
    MainBundle = CFBundleGetMainBundle();
    if (MainBundle
      && (CFArrayRef ValueForInfoDictionaryKey = (const __CFArray *)CFBundleGetValueForInfoDictionaryKey(MainBundle, @"UIBackgroundModes"), (v20 = ValueForInfoDictionaryKey) != 0)&& (v23 = CFGetTypeID(ValueForInfoDictionaryKey), v23 == CFArrayGetTypeID())&& (v24.length = CFArrayGetCount(v20), v24.location = 0, CFArrayContainsValue(v20, v24, @"audio")))
    {
      CheckVirtualEndpointCreation(void)::virtualEndpointsAllowed = 1;
    }
    else if (!CheckVirtualEndpointCreation(void)::virtualEndpointsAllowed)
    {
LABEL_11:
      v21 = 0;
      goto LABEL_12;
    }
  }
  else if (!CheckVirtualEndpointCreation(void)::virtualEndpointsAllowed)
  {
    goto LABEL_11;
  }
  objc_storeStrong((id *)&self->super._name, a3);
  self->super._direction = a4;
  self->super._firstGroup = a5;
  self->super._totalGroupsSpanned = a6;
  self->super._maxSysEx8Streams = a7;
  self->super._MIDI1Info = a8;
  self->super._UIHint = a9;
  self->super._isEnabled = a10;
  v21 = self;
LABEL_12:

  return v21;
}

@end