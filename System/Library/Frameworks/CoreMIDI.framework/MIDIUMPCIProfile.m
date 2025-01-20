@interface MIDIUMPCIProfile
+ (id)description;
- ($5812A533162E050B866F6153AD2572B5)profileID;
- (BOOL)deserialize:(id)a3;
- (BOOL)hasOwner;
- (BOOL)isEnabled;
- (BOOL)isMine;
- (BOOL)registerToDevice:(id)a3;
- (BOOL)setProfileState:(BOOL)a3 enabledChannelCount:(unsigned __int16)a4 error:(id *)a5;
- (MIDICIDevice)ciDevice;
- (MIDIUMPCIProfile)initWithDescription:(id)a3;
- (MIDIUMPCIProfile)initWithProfileID:(id)a3 name:(id)a4 type:(unsigned __int8)a5 firstGroup:(unsigned __int8)a6 firstChannel:(unsigned __int8)a7 enabledChannelCount:(unsigned __int16)a8 totalChannelCount:(unsigned __int16)a9;
- (NSString)name;
- (id)serializeDescription;
- (unsigned)enabledChannelCount;
- (unsigned)firstChannel;
- (unsigned)groupOffset;
- (unsigned)objectRef;
- (unsigned)profileType;
- (unsigned)totalChannelCount;
- (void)setCiDevice:(id)a3;
- (void)setIsMine:(BOOL)a3;
- (void)setObjectRef:(unsigned int)a3;
@end

@implementation MIDIUMPCIProfile

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_ciDevice);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_profileID, 0);
}

- (void)setIsMine:(BOOL)a3
{
  self->_isMine = a3;
}

- (BOOL)isMine
{
  return self->_isMine;
}

- (void)setObjectRef:(unsigned int)a3
{
  self->_objectRef = a3;
}

- (unsigned)objectRef
{
  return self->_objectRef;
}

- (void)setCiDevice:(id)a3
{
}

- (MIDICIDevice)ciDevice
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ciDevice);

  return (MIDICIDevice *)WeakRetained;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (unsigned)totalChannelCount
{
  return self->_totalChannelCount;
}

- (unsigned)enabledChannelCount
{
  return self->_enabledChannelCount;
}

- (unsigned)firstChannel
{
  return self->_firstChannel;
}

- (unsigned)groupOffset
{
  return self->_groupOffset;
}

- (unsigned)profileType
{
  return self->_profileType;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)setProfileState:(BOOL)a3 enabledChannelCount:(unsigned __int16)a4 error:(id *)a5
{
  uint64_t v6 = a4;
  BOOL v7 = a3;
  p_ciDevice = &self->_ciDevice;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ciDevice);

  if (!WeakRetained) {
    return 0;
  }
  id v11 = objc_loadWeakRetained((id *)p_ciDevice);
  char v12 = [v11 setProfile:self newState:v7 enabledChannelCount:v6 error:a5];

  return v12;
}

- ($5812A533162E050B866F6153AD2572B5)profileID
{
  if ([(NSData *)self->_profileID length] == 5)
  {
    v3 = [(NSData *)self->_profileID bytes];
    unsigned int v4 = *v3;
    v5.i32[0] = *(_DWORD *)(v3 + 1);
    uint32x4_t v6 = vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(v5));
    v7.i64[0] = v6.u32[2];
    v7.i64[1] = v6.u32[3];
    v8.i64[0] = 255;
    v8.i64[1] = 255;
    int8x16_t v9 = vandq_s8(v7, v8);
    uint64_t v10 = v9.i64[1];
    uint64_t v11 = v9.i64[0];
    v7.i64[0] = v6.u32[0];
    v7.i64[1] = v6.u32[1];
    int8x16_t v12 = vandq_s8(v7, v8);
    uint64_t v13 = v12.i64[1];
    uint64_t v14 = v12.i64[0];
  }
  else
  {
    unsigned int v4 = 0;
    uint64_t v14 = 0;
    uint64_t v13 = 0;
    uint64_t v11 = 0;
    uint64_t v10 = 0;
  }
  v15.i64[0] = v14;
  v15.i64[1] = v13;
  v16.i64[0] = v11;
  v16.i64[1] = v10;
  int8x16_t v17 = vorrq_s8((int8x16_t)vshlq_u64(v15, (uint64x2_t)xmmword_1DD699A50), (int8x16_t)vshlq_u64(v16, (uint64x2_t)xmmword_1DD699A60));
  unint64_t v18 = *(unint64_t *)&vorr_s8(*(int8x8_t *)v17.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v17, v17, 8uLL)) | v4;
  *(_DWORD *)&result.var0.var0 = v18;
  result.var0.var4 = BYTE4(v18);
  return result;
}

- (MIDIUMPCIProfile)initWithDescription:(id)a3
{
  id v4 = a3;
  uint8x8_t v5 = [NSString stringWithUTF8String:"name"];
  v38 = [v4 objectForKey:v5];

  uint32x4_t v6 = [NSString stringWithUTF8String:"midi_channel"];
  v37 = [v4 objectForKey:v6];

  int8x16_t v7 = [NSString stringWithUTF8String:"profile_type"];
  v36 = [v4 objectForKey:v7];

  int8x16_t v8 = [NSString stringWithUTF8String:"group_offset"];
  v35 = [v4 objectForKey:v8];

  int8x16_t v9 = [NSString stringWithUTF8String:"enabled"];
  v32 = [v4 objectForKey:v9];

  uint64_t v10 = [NSString stringWithUTF8String:"enabled_channel_count"];
  v34 = [v4 objectForKey:v10];

  uint64_t v11 = [NSString stringWithUTF8String:"total_channel_count"];
  v33 = [v4 objectForKey:v11];

  int8x16_t v12 = [NSString stringWithUTF8String:"id"];
  uint64_t v13 = [v4 objectForKey:v12];

  uint64_t v14 = [NSString stringWithUTF8String:"object"];
  uint64x2_t v15 = [v4 objectForKey:v14];

  if ([v13 count] == 5)
  {
    uint64x2_t v16 = [v13 objectAtIndex:0];
    unsigned __int8 v17 = [v16 unsignedIntValue];

    unint64_t v18 = [v13 objectAtIndex:1];
    LOBYTE(v16) = [v18 unsignedIntValue];

    v19 = [v13 objectAtIndex:2];
    unsigned __int8 v20 = [v19 unsignedIntValue];

    v21 = [v13 objectAtIndex:3];
    LODWORD(v19) = [v21 unsignedIntValue];

    v22 = [v13 objectAtIndex:4];
    unsigned __int8 v23 = [v22 unsignedIntValue];

    unint64_t v24 = (v19 << 24) | ((unint64_t)v23 << 32) | (v20 << 16) | (unint64_t)(v16 << 8) | v17;
  }
  else
  {
    unint64_t v24 = 0;
  }
  unsigned __int8 v25 = [v36 unsignedIntValue];
  unsigned __int8 v26 = [v35 unsignedIntValue];
  unsigned __int8 v27 = [v37 unsignedIntValue];
  unsigned __int16 v28 = [v34 unsignedIntValue];
  LOWORD(v31) = [v33 unsignedIntValue];
  v29 = [(MIDIUMPCIProfile *)self initWithProfileID:v24 name:v38 type:v25 firstGroup:v26 firstChannel:v27 enabledChannelCount:v28 totalChannelCount:v31];
  if (v29)
  {
    -[MIDIUMPCIProfile setObjectRef:](v29, "setObjectRef:", [v15 unsignedIntValue]);
    v29->_isMine = 0;
    v29->_isEnabled = [v32 BOOLValue];
  }

  return v29;
}

- (MIDIUMPCIProfile)initWithProfileID:(id)a3 name:(id)a4 type:(unsigned __int8)a5 firstGroup:(unsigned __int8)a6 firstChannel:(unsigned __int8)a7 enabledChannelCount:(unsigned __int16)a8 totalChannelCount:(unsigned __int16)a9
{
  $5812A533162E050B866F6153AD2572B5 v22 = a3;
  id v14 = a4;
  v21.receiver = self;
  v21.super_class = (Class)MIDIUMPCIProfile;
  uint64x2_t v15 = [(MIDIUMPCIProfile *)&v21 init];
  if (v15)
  {
    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&v22 length:5];
    profileID = v15->_profileID;
    v15->_profileID = (NSData *)v16;

    if (v14)
    {
      uint64_t v18 = [NSString stringWithString:v14];
      name = v15->_name;
      v15->_name = (NSString *)v18;
    }
    else
    {
      name = v15->_name;
      v15->_name = 0;
    }

    v15->_profileType = a5;
    v15->_groupOffset = a6;
    v15->_firstChannel = a7;
    v15->_enabledChannelCount = a8;
    v15->_totalChannelCount = a9;
    v15->_isEnabled = 0;
  }

  return v15;
}

- (BOOL)deserialize:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint8x8_t v5 = [NSString stringWithUTF8String:"name"];
    v32 = [v4 objectForKey:v5];

    uint32x4_t v6 = [NSString stringWithUTF8String:"midi_channel"];
    uint64_t v31 = [v4 objectForKey:v6];

    int8x16_t v7 = [NSString stringWithUTF8String:"profile_type"];
    v30 = [v4 objectForKey:v7];

    int8x16_t v8 = [NSString stringWithUTF8String:"group_offset"];
    int8x16_t v9 = [v4 objectForKey:v8];

    uint64_t v10 = [NSString stringWithUTF8String:"enabled"];
    uint64_t v11 = [v4 objectForKey:v10];

    int8x16_t v12 = [NSString stringWithUTF8String:"enabled_channel_count"];
    uint64_t v13 = [v4 objectForKey:v12];

    id v14 = [NSString stringWithUTF8String:"total_channel_count"];
    uint64x2_t v15 = [v4 objectForKey:v14];

    uint64_t v16 = [NSString stringWithUTF8String:"id"];
    unsigned __int8 v17 = [v4 objectForKey:v16];

    uint64_t v18 = [NSString stringWithUTF8String:"object"];
    v19 = [v4 objectForKey:v18];

    char v34 = 0;
    int v33 = 0;
    if ([v17 count] == 5)
    {
      unsigned __int8 v20 = [v17 objectAtIndex:0];
      LOBYTE(v33) = [v20 unsignedIntValue];

      objc_super v21 = [v17 objectAtIndex:1];
      BYTE1(v33) = [v21 unsignedIntValue];

      $5812A533162E050B866F6153AD2572B5 v22 = [v17 objectAtIndex:2];
      BYTE2(v33) = [v22 unsignedIntValue];

      unsigned __int8 v23 = [v17 objectAtIndex:3];
      HIBYTE(v33) = [v23 unsignedIntValue];

      unint64_t v24 = [v17 objectAtIndex:4];
      char v34 = [v24 unsignedIntValue];
    }
    unsigned __int8 v25 = (NSData *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&v33 length:5];
    profileID = self->_profileID;
    self->_profileID = v25;

    unsigned __int8 v27 = [NSString stringWithString:v32];
    name = self->_name;
    self->_name = v27;

    self->_profileType = [v30 unsignedIntValue];
    self->_groupOffset = [v9 unsignedIntValue];
    self->_firstChannel = [v31 unsignedIntValue];
    self->_enabledChannelCount = [v13 unsignedIntValue];
    self->_totalChannelCount = [v15 unsignedIntValue];
    self->_isEnabled = [v11 BOOLValue];
    self->_objectRef = [v19 unsignedIntValue];
  }
  return v4 != 0;
}

- (id)serializeDescription
{
  v36[11] = *MEMORY[0x1E4F143B8];
  p_ciDevice = &self->_ciDevice;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ciDevice);

  if (WeakRetained)
  {
    v32 = [NSString stringWithUTF8String:"object"];
    v35[0] = v32;
    uint64_t v31 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MIDIUMPCIProfile objectRef](self, "objectRef"));
    v36[0] = v31;
    unsigned __int16 v28 = [NSString stringWithUTF8String:"type"];
    v35[1] = v28;
    v36[1] = &unk_1F38D9518;
    v29 = [NSString stringWithUTF8String:"name"];
    v35[2] = v29;
    v36[2] = self->_name;
    v30 = [NSString stringWithUTF8String:"type"];
    v35[3] = v30;
    int v33 = [NSNumber numberWithUnsignedChar:self->_profileType];
    v36[3] = v33;
    char v34 = [NSString stringWithUTF8String:"id"];
    v35[4] = v34;
    uint8x8_t v5 = self->_profileID;
    uint32x4_t v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:5];
    int8x16_t v7 = v5;
    uint64_t v8 = [(NSData *)v7 bytes];
    for (uint64_t i = 0; i != 5; ++i)
    {
      uint64_t v10 = [NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v8 + i)];
      [v6 addObject:v10];
    }
    v36[4] = v6;
    unsigned __int8 v27 = [NSString stringWithUTF8String:"midi_channel"];
    v35[5] = v27;
    unsigned __int8 v26 = [NSNumber numberWithUnsignedChar:self->_firstChannel];
    v36[5] = v26;
    unsigned __int8 v25 = [NSString stringWithUTF8String:"group_offset"];
    v35[6] = v25;
    unint64_t v24 = [NSNumber numberWithUnsignedChar:self->_groupOffset];
    v36[6] = v24;
    unsigned __int8 v23 = [NSString stringWithUTF8String:"enabled"];
    v35[7] = v23;
    $5812A533162E050B866F6153AD2572B5 v22 = [NSNumber numberWithBool:self->_isEnabled];
    v36[7] = v22;
    objc_super v21 = [NSString stringWithUTF8String:"enabled_channel_count"];
    v35[8] = v21;
    unsigned __int8 v20 = [NSNumber numberWithUnsignedShort:self->_enabledChannelCount];
    v36[8] = v20;
    uint64_t v11 = [NSString stringWithUTF8String:"total_channel_count"];
    v35[9] = v11;
    int8x16_t v12 = [NSNumber numberWithUnsignedShort:self->_totalChannelCount];
    v36[9] = v12;
    uint64_t v13 = [NSString stringWithUTF8String:"owner"];
    v35[10] = v13;
    id v14 = NSNumber;
    id v15 = objc_loadWeakRetained((id *)p_ciDevice);
    uint64_t v16 = objc_msgSend(v14, "numberWithUnsignedInt:", objc_msgSend(v15, "objectRef"));
    v36[10] = v16;
    unsigned __int8 v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:11];
    uint64_t v18 = (void *)[v17 mutableCopy];
  }
  else
  {
    uint64_t v18 = 0;
  }

  return v18;
}

- (BOOL)registerToDevice:(id)a3
{
  id v4 = a3;
  p_ciDevice = &self->_ciDevice;
  id WeakRetained = objc_loadWeakRetained((id *)p_ciDevice);

  if (!WeakRetained) {
    objc_storeWeak((id *)p_ciDevice, v4);
  }

  return WeakRetained == 0;
}

- (BOOL)hasOwner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ciDevice);
  BOOL v3 = WeakRetained != 0;

  return v3;
}

+ (id)description
{
  return @"MIDIUMPCI Profile";
}

@end