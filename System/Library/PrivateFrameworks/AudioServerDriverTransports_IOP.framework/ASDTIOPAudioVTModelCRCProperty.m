@interface ASDTIOPAudioVTModelCRCProperty
+ (id)configDictForService:(id)a3;
- (ASDTIOPAudioVTModelCRCProperty)initWithConfig:(id)a3;
- (BOOL)retrieveUInt32Value:(unsigned int *)a3;
@end

@implementation ASDTIOPAudioVTModelCRCProperty

+ (id)configDictForService:(id)a3
{
  v9[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F28D20];
  v8[0] = *MEMORY[0x263F28D40];
  v8[1] = v3;
  v9[0] = @"ASDTIOPAudioVTModelCRCProperty";
  v9[1] = a3;
  v4 = NSDictionary;
  id v5 = a3;
  v6 = [v4 dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

- (ASDTIOPAudioVTModelCRCProperty)initWithConfig:(id)a3
{
  v11[2] = *MEMORY[0x263EF8340];
  v4 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:a3];
  uint64_t v5 = *MEMORY[0x263F28CE8];
  v10[0] = *MEMORY[0x263F28D10];
  v10[1] = v5;
  v11[0] = &unk_26FCB4368;
  v11[1] = MEMORY[0x263EFFA80];
  v6 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  [v4 asdtAddMissingEntriesFromDictionary:v6];

  v9.receiver = self;
  v9.super_class = (Class)ASDTIOPAudioVTModelCRCProperty;
  v7 = [(ASDTIOPAudioVTUInt32Property *)&v9 initWithConfig:v4];

  return v7;
}

- (BOOL)retrieveUInt32Value:(unsigned int *)a3
{
  v4 = [(ASDTIOPAudioVTProperty *)self vtDevice];
  LOBYTE(a3) = [v4 getModelCRC:a3];

  return (char)a3;
}

@end