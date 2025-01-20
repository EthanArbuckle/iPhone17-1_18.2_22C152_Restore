@interface ASDTIOPAudioVTDebugProperty
+ (id)configDictForService:(id)a3;
- (ASDTIOPAudioVTDebugProperty)initWithConfig:(id)a3;
- (BOOL)retrieveUInt32Value:(unsigned int *)a3;
- (BOOL)storeUInt32Value:(unsigned int)a3;
@end

@implementation ASDTIOPAudioVTDebugProperty

+ (id)configDictForService:(id)a3
{
  v9[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F28D20];
  v8[0] = *MEMORY[0x263F28D40];
  v8[1] = v3;
  v9[0] = @"ASDTIOPAudioVTDebugProperty";
  v9[1] = a3;
  v4 = NSDictionary;
  id v5 = a3;
  v6 = [v4 dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

- (ASDTIOPAudioVTDebugProperty)initWithConfig:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  v4 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:a3];
  uint64_t v9 = *MEMORY[0x263F28D10];
  v10[0] = &unk_26FCB4440;
  id v5 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [v4 asdtAddMissingEntriesFromDictionary:v5];

  v8.receiver = self;
  v8.super_class = (Class)ASDTIOPAudioVTDebugProperty;
  v6 = [(ASDTIOPAudioVTUInt32Property *)&v8 initWithConfig:v4];

  return v6;
}

- (BOOL)storeUInt32Value:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = [(ASDTIOPAudioVTProperty *)self vtDevice];
  LOBYTE(v3) = [v4 setDebugEnabled:v3];

  return v3;
}

- (BOOL)retrieveUInt32Value:(unsigned int *)a3
{
  v4 = [(ASDTIOPAudioVTProperty *)self vtDevice];
  LOBYTE(a3) = [v4 getDebugEnabled:a3];

  return (char)a3;
}

@end