@interface BMOasisAnalyticsDeviceWornPayload
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMOasisAnalyticsDeviceWornEvent)deviceWorn;
- (BMOasisAnalyticsDeviceWornPayload)initWithDeviceWorn:(id)a3;
- (BMOasisAnalyticsDeviceWornPayload)initWithJSONDictionary:(id)a3 error:(id *)p_isa;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMOasisAnalyticsDeviceWornPayload

- (void).cxx_destruct
{
}

- (BMOasisAnalyticsDeviceWornEvent)deviceWorn
{
  return self->_deviceWorn;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(BMOasisAnalyticsDeviceWornPayload *)self deviceWorn];
    v7 = [v5 deviceWorn];
    if (v6 == v7)
    {
      char v10 = 1;
    }
    else
    {
      v8 = [(BMOasisAnalyticsDeviceWornPayload *)self deviceWorn];
      v9 = [v5 deviceWorn];
      char v10 = [v8 isEqual:v9];
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)jsonDictionary
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = [(BMOasisAnalyticsDeviceWornPayload *)self deviceWorn];
  v3 = [v2 jsonDictionary];

  v7 = @"deviceWorn";
  id v4 = v3;
  if (!v3)
  {
    id v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v8[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  if (!v3) {

  }
  return v5;
}

- (BMOasisAnalyticsDeviceWornPayload)initWithJSONDictionary:(id)a3 error:(id *)p_isa
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v6 = [a3 objectForKeyedSubscript:@"deviceWorn"];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = 0;
LABEL_4:
    self = [(BMOasisAnalyticsDeviceWornPayload *)self initWithDeviceWorn:v7];
    p_isa = (id *)&self->super.super.isa;
LABEL_13:

    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v6;
    id v15 = 0;
    v7 = [[BMOasisAnalyticsDeviceWornEvent alloc] initWithJSONDictionary:v8 error:&v15];
    id v9 = v15;
    if (!v9)
    {

      goto LABEL_4;
    }
    char v10 = v9;
    if (p_isa) {
      *p_isa = v9;
    }

LABEL_12:
    p_isa = 0;
    goto LABEL_13;
  }
  if (p_isa)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v12 = *MEMORY[0x1E4F502C8];
    uint64_t v16 = *MEMORY[0x1E4F28568];
    v7 = (BMOasisAnalyticsDeviceWornEvent *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"deviceWorn"];
    v17[0] = v7;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    *p_isa = (id)[v11 initWithDomain:v12 code:2 userInfo:v13];

    goto LABEL_12;
  }
LABEL_14:

  return (BMOasisAnalyticsDeviceWornPayload *)p_isa;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMOasisAnalyticsDeviceWornPayload *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  if (self->_deviceWorn)
  {
    id v4 = a3;
    PBDataWriterPlaceMark();
    [(BMOasisAnalyticsDeviceWornEvent *)self->_deviceWorn writeTo:v4];
    PBDataWriterRecallMark();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)BMOasisAnalyticsDeviceWornPayload;
  id v5 = [(BMEventBase *)&v23 init];
  if (!v5) {
    goto LABEL_27;
  }
  v6 = (int *)MEMORY[0x1E4F940E8];
  v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    id v9 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v8]) {
        break;
      }
      char v10 = 0;
      unsigned int v11 = 0;
      unint64_t v12 = 0;
      while (1)
      {
        uint64_t v13 = *v6;
        unint64_t v14 = *(void *)&v4[v13];
        if (v14 == -1 || v14 >= *(void *)&v4[*v7]) {
          break;
        }
        char v15 = *(unsigned char *)(*(void *)&v4[*v9] + v14);
        *(void *)&v4[v13] = v14 + 1;
        v12 |= (unint64_t)(v15 & 0x7F) << v10;
        if ((v15 & 0x80) == 0) {
          goto LABEL_13;
        }
        v10 += 7;
        if (v11++ >= 9)
        {
          unint64_t v12 = 0;
          int v17 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      int v17 = v4[*v8];
      if (v4[*v8]) {
        unint64_t v12 = 0;
      }
LABEL_15:
      if (v17 || (v12 & 7) == 4) {
        break;
      }
      if ((v12 >> 3) == 1)
      {
        uint64_t v24 = 0;
        uint64_t v25 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_26;
        }
        v19 = [[BMOasisAnalyticsDeviceWornEvent alloc] initByReadFrom:v4];
        if (!v19) {
          goto LABEL_26;
        }
        deviceWorn = v5->_deviceWorn;
        v5->_deviceWorn = v19;

        PBReaderRecallMark();
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_26;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_26:
  }
    v21 = 0;
  else {
LABEL_27:
  }
    v21 = v5;

  return v21;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMOasisAnalyticsDeviceWornPayload *)self deviceWorn];
  id v5 = (void *)[v3 initWithFormat:@"BMOasisAnalyticsDeviceWornPayload with deviceWorn: %@", v4];

  return (NSString *)v5;
}

- (BMOasisAnalyticsDeviceWornPayload)initWithDeviceWorn:(id)a3
{
  id v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BMOasisAnalyticsDeviceWornPayload;
  v6 = [(BMEventBase *)&v8 init];
  if (v6)
  {
    v6->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v6->_deviceWorn, a3);
  }

  return v6;
}

+ (id)protoFields
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"deviceWorn" number:1 type:14 subMessageClass:objc_opt_class()];
  v5[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF77D0;
}

+ (id)columns
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"deviceWorn_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_183_90257];
  v5[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

id __44__BMOasisAnalyticsDeviceWornPayload_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 deviceWorn];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    id v4 = 0;
  }
  else
  {
    id v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    v7 = (void *)[[v5 alloc] initWithData:v6];

    objc_super v8 = [[BMOasisAnalyticsDeviceWornPayload alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[4] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end