@interface MIDI2DeviceInfo
+ (MIDI2DeviceInfo)infoWithDescription:(id)a3;
+ (MIDI2DeviceInfo)infoWithInfo:(id)a3;
+ (id)description;
- ($7EB1B296D1955B59A85A052388D5D5F9)manufacturerID;
- ($A0BF7C2F34202597F9F30F6CD4123348)revisionLevel;
- (BOOL)isEqual:(id)a3;
- (MIDI2DeviceInfo)initWithManufacturerID:(id)a3 family:(unsigned __int16)a4 modelNumber:(unsigned __int16)a5 revisionLevel:(id)a6;
- (id)serializeDescription;
- (unsigned)family;
- (unsigned)modelNumber;
@end

@implementation MIDI2DeviceInfo

- ($A0BF7C2F34202597F9F30F6CD4123348)revisionLevel
{
  return ($A0BF7C2F34202597F9F30F6CD4123348)self->_revisionLevel;
}

- (unsigned)modelNumber
{
  return self->_modelNumber;
}

- (unsigned)family
{
  return self->_family;
}

- ($7EB1B296D1955B59A85A052388D5D5F9)manufacturerID
{
  return ($7EB1B296D1955B59A85A052388D5D5F9)(*(unsigned __int16 *)self->_manufacturerID.sysExIDByte | (self->_manufacturerID.sysExIDByte[2] << 16));
}

- (MIDI2DeviceInfo)initWithManufacturerID:(id)a3 family:(unsigned __int16)a4 modelNumber:(unsigned __int16)a5 revisionLevel:(id)a6
{
  int v6 = *(_DWORD *)a3.var0;
  v7 = 0;
  if (!((*(_DWORD *)a3.var0 | (*(_DWORD *)a3.var0 >> 8)) & 0x80 | a3.var0[2] & 0x80)
    && !((a5 | a4) >> 14))
  {
    v13.receiver = self;
    v13.super_class = (Class)MIDI2DeviceInfo;
    v11 = [(MIDI2DeviceInfo *)&v13 init];
    if (v11)
    {
      *((_WORD *)v11 + 6) = v6;
      v11[14] = BYTE2(v6);
      *((_WORD *)v11 + 4) = a4;
      *((_WORD *)v11 + 5) = a5;
      *($A0BF7C2F34202597F9F30F6CD4123348 *)(v11 + 15) = a6;
    }
    self = v11;
    v7 = self;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (unsigned __int8 *)a3;
  v5 = v4;
  if (__PAIR64__(self->_manufacturerID.sysExIDByte[1], self->_manufacturerID.sysExIDByte[0]) == __PAIR64__(v4[13], v4[12])&& self->_manufacturerID.sysExIDByte[2] == v4[14]&& self->_family == *((unsigned __int16 *)v4 + 4)&& self->_modelNumber == *((unsigned __int16 *)v4 + 5)&& self->_revisionLevel.revisionLevel[0] == v4[15])
  {
    uint64_t v6 = 0;
    unint64_t v7 = 3;
    while (v6 != 3)
    {
      int v8 = self->_revisionLevel.revisionLevel[v6 + 1];
      int v9 = v4[v6++ + 16];
      if (v8 != v9)
      {
        unint64_t v7 = v6 - 1;
        break;
      }
    }
    BOOL v10 = v7 > 2;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

+ (id)description
{
  return @"MIDI 2.0 DeviceID Info";
}

- (id)serializeDescription
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
  for (uint64_t i = 0; i != 3; ++i)
  {
    uint64_t v6 = [NSNumber numberWithUnsignedChar:self->_manufacturerID.sysExIDByte[i]];
    [v4 addObject:v6];
  }
  unint64_t v7 = [NSString stringWithUTF8String:"manufacturer_id"];
  [v3 setObject:v4 forKey:v7];

  int v8 = [NSNumber numberWithUnsignedShort:self->_family];
  int v9 = [NSString stringWithUTF8String:"family"];
  [v3 setObject:v8 forKey:v9];

  BOOL v10 = [NSNumber numberWithUnsignedShort:self->_modelNumber];
  v11 = [NSString stringWithUTF8String:"model_number"];
  [v3 setObject:v10 forKey:v11];

  v12 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:4];
  uint64_t v13 = 0;
  p_revisionLevel = &self->_revisionLevel;
  do
  {
    v15 = [NSNumber numberWithUnsignedChar:p_revisionLevel->revisionLevel[v13]];
    [v12 addObject:v15];

    ++v13;
  }
  while (v13 != 4);
  v16 = [NSString stringWithUTF8String:"revision_level"];
  [v3 setObject:v12 forKey:v16];

  return v3;
}

+ (MIDI2DeviceInfo)infoWithDescription:(id)a3
{
  id v3 = a3;
  unsigned __int8 v23 = 0;
  unsigned __int16 v22 = 0;
  v4 = [NSString stringWithUTF8String:"manufacturer_id"];
  v5 = [v3 objectForKey:v4];

  for (uint64_t i = 0; i != 3; ++i)
  {
    unint64_t v7 = [v5 objectAtIndex:i];
    *((unsigned char *)&v22 + i) = [v7 unsignedIntValue];
  }
  int v8 = [NSString stringWithUTF8String:"family"];
  int v9 = [v3 objectForKey:v8];
  unsigned __int16 v10 = [v9 unsignedIntValue];

  v11 = [NSString stringWithUTF8String:"model_number"];
  v12 = [v3 objectForKey:v11];
  unsigned __int16 v13 = [v12 unsignedIntValue];

  unsigned int v21 = 0;
  v14 = [NSString stringWithUTF8String:"revision_level"];
  v15 = [v3 objectForKey:v14];

  for (uint64_t j = 0; j != 4; ++j)
  {
    v17 = [v15 objectAtIndex:j];
    *((unsigned char *)&v21 + j) = [v17 unsignedIntValue];
  }
  v18 = [MIDI2DeviceInfo alloc];
  v19 = [(MIDI2DeviceInfo *)v18 initWithManufacturerID:v22 | ((unint64_t)v23 << 16) family:v10 modelNumber:v13 revisionLevel:v21];

  return v19;
}

+ (MIDI2DeviceInfo)infoWithInfo:(id)a3
{
  id v3 = (unsigned __int16 *)a3;
  v4 = [[MIDI2DeviceInfo alloc] initWithManufacturerID:v3[6] | ((unint64_t)*((unsigned __int8 *)v3 + 14) << 16) family:v3[4] modelNumber:v3[5] revisionLevel:*(unsigned int *)((char *)v3 + 15)];

  return v4;
}

@end