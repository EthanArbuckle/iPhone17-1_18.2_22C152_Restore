@interface BMOasisAnalyticsTrackingStateEvent
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMOasisAnalyticsMetadata)metadata;
- (BMOasisAnalyticsQualityTrace)qualityTrace;
- (BMOasisAnalyticsTrackingStateEvent)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMOasisAnalyticsTrackingStateEvent)initWithQualityTrace:(id)a3 metadata:(id)a4 payload:(id)a5;
- (BMOasisAnalyticsTrackingStateType)payload;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMOasisAnalyticsTrackingStateEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_qualityTrace, 0);
}

- (BMOasisAnalyticsTrackingStateType)payload
{
  return self->_payload;
}

- (BMOasisAnalyticsMetadata)metadata
{
  return self->_metadata;
}

- (BMOasisAnalyticsQualityTrace)qualityTrace
{
  return self->_qualityTrace;
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
    v6 = [(BMOasisAnalyticsTrackingStateEvent *)self qualityTrace];
    uint64_t v7 = [v5 qualityTrace];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMOasisAnalyticsTrackingStateEvent *)self qualityTrace];
      v10 = [v5 qualityTrace];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_9;
      }
    }
    v13 = [(BMOasisAnalyticsTrackingStateEvent *)self metadata];
    uint64_t v14 = [v5 metadata];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMOasisAnalyticsTrackingStateEvent *)self metadata];
      v17 = [v5 metadata];
      int v18 = [v16 isEqual:v17];

      if (!v18)
      {
LABEL_9:
        char v12 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    v19 = [(BMOasisAnalyticsTrackingStateEvent *)self payload];
    v20 = [v5 payload];
    if (v19 == v20)
    {
      char v12 = 1;
    }
    else
    {
      v21 = [(BMOasisAnalyticsTrackingStateEvent *)self payload];
      v22 = [v5 payload];
      char v12 = [v21 isEqual:v22];
    }
    goto LABEL_15;
  }
  char v12 = 0;
LABEL_16:

  return v12;
}

- (id)jsonDictionary
{
  v15[3] = *MEMORY[0x1E4F143B8];
  v3 = [(BMOasisAnalyticsTrackingStateEvent *)self qualityTrace];
  id v4 = [v3 jsonDictionary];

  id v5 = [(BMOasisAnalyticsTrackingStateEvent *)self metadata];
  v6 = [v5 jsonDictionary];

  uint64_t v7 = [(BMOasisAnalyticsTrackingStateEvent *)self payload];
  v8 = [v7 jsonDictionary];

  v14[0] = @"qualityTrace";
  v9 = v4;
  if (!v4)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[0] = v9;
  v14[1] = @"metadata";
  v10 = v6;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[1] = v10;
  v14[2] = @"payload";
  int v11 = v8;
  if (!v8)
  {
    int v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[2] = v11;
  char v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
  if (v8)
  {
    if (v6) {
      goto LABEL_9;
    }
LABEL_14:

    if (v4) {
      goto LABEL_10;
    }
    goto LABEL_15;
  }

  if (!v6) {
    goto LABEL_14;
  }
LABEL_9:
  if (v4) {
    goto LABEL_10;
  }
LABEL_15:

LABEL_10:

  return v12;
}

- (BMOasisAnalyticsTrackingStateEvent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"qualityTrace"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v7;
    id v33 = 0;
    v8 = [[BMOasisAnalyticsQualityTrace alloc] initWithJSONDictionary:v9 error:&v33];
    id v15 = v33;
    if (v15)
    {
      v16 = v15;
      if (a4) {
        *a4 = v15;
      }

      goto LABEL_34;
    }

LABEL_4:
    id v9 = [v6 objectForKeyedSubscript:@"metadata"];
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v10 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = v9;
      id v32 = 0;
      v10 = [[BMOasisAnalyticsMetadata alloc] initWithJSONDictionary:v11 error:&v32];
      id v17 = v32;
      if (v17)
      {
        int v18 = v17;
        if (a4) {
          *a4 = v17;
        }

        goto LABEL_37;
      }

LABEL_7:
      id v11 = [v6 objectForKeyedSubscript:@"payload"];
      if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        char v12 = 0;
LABEL_10:
        self = [(BMOasisAnalyticsTrackingStateEvent *)self initWithQualityTrace:v8 metadata:v10 payload:v12];
        v13 = self;
LABEL_11:

LABEL_12:
        goto LABEL_13;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v28 = a4;
        id v19 = v11;
        id v31 = 0;
        char v12 = [[BMOasisAnalyticsTrackingStateType alloc] initWithJSONDictionary:v19 error:&v31];
        id v20 = v31;
        if (v20)
        {
          v21 = v20;
          if (v28) {
            id *v28 = v20;
          }

          v13 = 0;
          goto LABEL_11;
        }

        goto LABEL_10;
      }
      if (a4)
      {
        id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v27 = *MEMORY[0x1E4F502C8];
        uint64_t v34 = *MEMORY[0x1E4F28568];
        char v12 = (BMOasisAnalyticsTrackingStateType *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"payload"];
        v35 = v12;
        v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
        *a4 = (id)[v30 initWithDomain:v27 code:2 userInfo:v26];

        v13 = 0;
        goto LABEL_11;
      }
LABEL_37:
      v13 = 0;
      goto LABEL_12;
    }
    if (a4)
    {
      id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v24 = *MEMORY[0x1E4F502C8];
      uint64_t v36 = *MEMORY[0x1E4F28568];
      v10 = (BMOasisAnalyticsMetadata *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"metadata"];
      v37 = v10;
      id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
      id v25 = (id)[v29 initWithDomain:v24 code:2 userInfo:v11];
      v13 = 0;
      *a4 = v25;
      goto LABEL_12;
    }
LABEL_34:
    v13 = 0;
    goto LABEL_13;
  }
  if (!a4)
  {
    v13 = 0;
    goto LABEL_14;
  }
  id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v23 = *MEMORY[0x1E4F502C8];
  uint64_t v38 = *MEMORY[0x1E4F28568];
  v8 = (BMOasisAnalyticsQualityTrace *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"qualityTrace"];
  v39[0] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
  v13 = 0;
  *a4 = (id)[v22 initWithDomain:v23 code:2 userInfo:v9];
LABEL_13:

LABEL_14:
  return v13;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMOasisAnalyticsTrackingStateEvent *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_qualityTrace)
  {
    PBDataWriterPlaceMark();
    [(BMOasisAnalyticsQualityTrace *)self->_qualityTrace writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_metadata)
  {
    PBDataWriterPlaceMark();
    [(BMOasisAnalyticsMetadata *)self->_metadata writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_payload)
  {
    PBDataWriterPlaceMark();
    [(BMOasisAnalyticsTrackingStateType *)self->_payload writeTo:v4];
    PBDataWriterRecallMark();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)BMOasisAnalyticsTrackingStateEvent;
  id v5 = [(BMEventBase *)&v26 init];
  if (!v5) {
    goto LABEL_36;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  v8 = (int *)MEMORY[0x1E4F940C8];
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
        uint64_t v14 = *(void *)&v4[v13];
        unint64_t v15 = v14 + 1;
        if (v14 == -1 || v15 > *(void *)&v4[*v7]) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)&v4[*v9] + v14);
        *(void *)&v4[v13] = v15;
        v12 |= (unint64_t)(v16 & 0x7F) << v10;
        if ((v16 & 0x80) == 0) {
          goto LABEL_13;
        }
        v10 += 7;
        if (v11++ >= 9)
        {
          unint64_t v12 = 0;
          int v18 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      int v18 = v4[*v8];
      if (v4[*v8]) {
        unint64_t v12 = 0;
      }
LABEL_15:
      if (v18 || (v12 & 7) == 4) {
        break;
      }
      unint64_t v20 = v12 >> 3;
      if ((v12 >> 3) == 1)
      {
        uint64_t v27 = 0;
        uint64_t v28 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_35;
        }
        v21 = [[BMOasisAnalyticsMetadata alloc] initByReadFrom:v4];
        if (!v21) {
          goto LABEL_35;
        }
        uint64_t v22 = 32;
      }
      else if (v20 == 2)
      {
        uint64_t v27 = 0;
        uint64_t v28 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_35;
        }
        v21 = [[BMOasisAnalyticsTrackingStateType alloc] initByReadFrom:v4];
        if (!v21) {
          goto LABEL_35;
        }
        uint64_t v22 = 40;
      }
      else
      {
        if (v20 != 101)
        {
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_35;
          }
          continue;
        }
        uint64_t v27 = 0;
        uint64_t v28 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_35;
        }
        v21 = [[BMOasisAnalyticsQualityTrace alloc] initByReadFrom:v4];
        if (!v21) {
          goto LABEL_35;
        }
        uint64_t v22 = 24;
      }
      uint64_t v23 = *(Class *)((char *)&v5->super.super.isa + v22);
      *(Class *)((char *)&v5->super.super.isa + v22) = v21;

      PBReaderRecallMark();
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_35:
  }
    uint64_t v24 = 0;
  else {
LABEL_36:
  }
    uint64_t v24 = v5;

  return v24;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMOasisAnalyticsTrackingStateEvent *)self qualityTrace];
  id v5 = [(BMOasisAnalyticsTrackingStateEvent *)self metadata];
  id v6 = [(BMOasisAnalyticsTrackingStateEvent *)self payload];
  uint64_t v7 = (void *)[v3 initWithFormat:@"BMOasisAnalyticsTrackingStateEvent with qualityTrace: %@, metadata: %@, payload: %@", v4, v5, v6];

  return (NSString *)v7;
}

- (BMOasisAnalyticsTrackingStateEvent)initWithQualityTrace:(id)a3 metadata:(id)a4 payload:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BMOasisAnalyticsTrackingStateEvent;
  unint64_t v12 = [(BMEventBase *)&v14 init];
  if (v12)
  {
    v12->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v12->_qualityTrace, a3);
    objc_storeStrong((id *)&v12->_metadata, a4);
    objc_storeStrong((id *)&v12->_payload, a5);
  }

  return v12;
}

+ (id)protoFields
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"qualityTrace" number:101 type:14 subMessageClass:objc_opt_class()];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"metadata", 1, 14, objc_opt_class(), v2);
  v7[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"payload" number:2 type:14 subMessageClass:objc_opt_class()];
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF7848;
}

+ (id)columns
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"qualityTrace_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_434];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"metadata_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_436];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"payload_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_438];
  v7[0] = v3;
  v7[1] = v4;
  v7[2] = v2;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

id __45__BMOasisAnalyticsTrackingStateEvent_columns__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 payload];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __45__BMOasisAnalyticsTrackingStateEvent_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 metadata];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __45__BMOasisAnalyticsTrackingStateEvent_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 qualityTrace];
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
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    v8 = [[BMOasisAnalyticsTrackingStateEvent alloc] initByReadFrom:v7];
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