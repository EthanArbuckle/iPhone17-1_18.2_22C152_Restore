@interface BMOasisAnalyticsSystemInfoEvent
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMOasisAnalyticsDeviceInfo)deviceInfo;
- (BMOasisAnalyticsMetadata)metadata;
- (BMOasisAnalyticsQualityTrace)qualityTrace;
- (BMOasisAnalyticsRegionInfo)regionInfo;
- (BMOasisAnalyticsSystemInfoEvent)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMOasisAnalyticsSystemInfoEvent)initWithQualityTrace:(id)a3 metadata:(id)a4 deviceInfo:(id)a5 regionInfo:(id)a6 epochTimestampInNanosecond:(id)a7;
- (BOOL)hasEpochTimestampInNanosecond;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unint64_t)epochTimestampInNanosecond;
- (unsigned)dataVersion;
- (void)setHasEpochTimestampInNanosecond:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMOasisAnalyticsSystemInfoEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionInfo, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_qualityTrace, 0);
}

- (void)setHasEpochTimestampInNanosecond:(BOOL)a3
{
  self->_hasEpochTimestampInNanosecond = a3;
}

- (BOOL)hasEpochTimestampInNanosecond
{
  return self->_hasEpochTimestampInNanosecond;
}

- (unint64_t)epochTimestampInNanosecond
{
  return self->_epochTimestampInNanosecond;
}

- (BMOasisAnalyticsRegionInfo)regionInfo
{
  return self->_regionInfo;
}

- (BMOasisAnalyticsDeviceInfo)deviceInfo
{
  return self->_deviceInfo;
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
    v6 = [(BMOasisAnalyticsSystemInfoEvent *)self qualityTrace];
    uint64_t v7 = [v5 qualityTrace];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMOasisAnalyticsSystemInfoEvent *)self qualityTrace];
      v10 = [v5 qualityTrace];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_24;
      }
    }
    v13 = [(BMOasisAnalyticsSystemInfoEvent *)self metadata];
    uint64_t v14 = [v5 metadata];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMOasisAnalyticsSystemInfoEvent *)self metadata];
      v17 = [v5 metadata];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_24;
      }
    }
    v19 = [(BMOasisAnalyticsSystemInfoEvent *)self deviceInfo];
    uint64_t v20 = [v5 deviceInfo];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMOasisAnalyticsSystemInfoEvent *)self deviceInfo];
      v23 = [v5 deviceInfo];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_24;
      }
    }
    v25 = [(BMOasisAnalyticsSystemInfoEvent *)self regionInfo];
    uint64_t v26 = [v5 regionInfo];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMOasisAnalyticsSystemInfoEvent *)self regionInfo];
      v29 = [v5 regionInfo];
      int v30 = [v28 isEqual:v29];

      if (!v30) {
        goto LABEL_24;
      }
    }
    if (![(BMOasisAnalyticsSystemInfoEvent *)self hasEpochTimestampInNanosecond]
      && ![v5 hasEpochTimestampInNanosecond])
    {
      BOOL v12 = 1;
      goto LABEL_25;
    }
    if ([(BMOasisAnalyticsSystemInfoEvent *)self hasEpochTimestampInNanosecond]
      && [v5 hasEpochTimestampInNanosecond])
    {
      unint64_t v31 = [(BMOasisAnalyticsSystemInfoEvent *)self epochTimestampInNanosecond];
      BOOL v12 = v31 == [v5 epochTimestampInNanosecond];
LABEL_25:

      goto LABEL_26;
    }
LABEL_24:
    BOOL v12 = 0;
    goto LABEL_25;
  }
  BOOL v12 = 0;
LABEL_26:

  return v12;
}

- (id)jsonDictionary
{
  v26[5] = *MEMORY[0x1E4F143B8];
  v3 = [(BMOasisAnalyticsSystemInfoEvent *)self qualityTrace];
  id v4 = [v3 jsonDictionary];

  id v5 = [(BMOasisAnalyticsSystemInfoEvent *)self metadata];
  v6 = [v5 jsonDictionary];

  uint64_t v7 = [(BMOasisAnalyticsSystemInfoEvent *)self deviceInfo];
  v8 = [v7 jsonDictionary];

  v9 = [(BMOasisAnalyticsSystemInfoEvent *)self regionInfo];
  v10 = [v9 jsonDictionary];

  if ([(BMOasisAnalyticsSystemInfoEvent *)self hasEpochTimestampInNanosecond])
  {
    int v11 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BMOasisAnalyticsSystemInfoEvent epochTimestampInNanosecond](self, "epochTimestampInNanosecond"));
  }
  else
  {
    int v11 = 0;
  }
  v21 = @"qualityTrace";
  uint64_t v12 = (uint64_t)v4;
  if (!v4)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v19 = v12;
  v26[0] = v12;
  v22 = @"metadata";
  v13 = v6;
  if (!v6)
  {
    v13 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v12, v21, v22);
  }
  v26[1] = v13;
  v23 = @"deviceInfo";
  uint64_t v14 = v8;
  if (!v8)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v26[2] = v14;
  int v24 = @"regionInfo";
  v15 = v10;
  if (!v10)
  {
    v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v26[3] = v15;
  v25 = @"epochTimestampInNanosecond";
  v16 = v11;
  if (!v11)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v26[4] = v16;
  v17 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v26, &v21, 5, v19);
  if (v11)
  {
    if (v10) {
      goto LABEL_16;
    }
  }
  else
  {

    if (v10)
    {
LABEL_16:
      if (v8) {
        goto LABEL_17;
      }
      goto LABEL_24;
    }
  }

  if (v8)
  {
LABEL_17:
    if (v6) {
      goto LABEL_18;
    }
LABEL_25:

    if (v4) {
      goto LABEL_19;
    }
    goto LABEL_26;
  }
LABEL_24:

  if (!v6) {
    goto LABEL_25;
  }
LABEL_18:
  if (v4) {
    goto LABEL_19;
  }
LABEL_26:

LABEL_19:

  return v17;
}

- (BMOasisAnalyticsSystemInfoEvent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v68[1] = *MEMORY[0x1E4F143B8];
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
    id v58 = 0;
    v8 = [[BMOasisAnalyticsQualityTrace alloc] initWithJSONDictionary:v9 error:&v58];
    id v17 = v58;
    if (v17)
    {
      int v18 = v17;
      if (a4) {
        *a4 = v17;
      }

LABEL_42:
      v16 = 0;
      goto LABEL_55;
    }

LABEL_4:
    id v9 = [v6 objectForKeyedSubscript:@"metadata"];
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v52 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v9;
      id v57 = 0;
      v52 = [[BMOasisAnalyticsMetadata alloc] initWithJSONDictionary:v10 error:&v57];
      id v19 = v57;
      if (v19)
      {
        uint64_t v20 = v19;
        if (a4) {
          *a4 = v19;
        }

        v16 = 0;
        goto LABEL_65;
      }

LABEL_7:
      id v10 = [v6 objectForKeyedSubscript:@"deviceInfo"];
      v54 = self;
      if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v53 = 0;
        goto LABEL_10;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = v10;
        id v56 = 0;
        v53 = [[BMOasisAnalyticsDeviceInfo alloc] initWithJSONDictionary:v11 error:&v56];
        id v21 = v56;
        if (v21)
        {
          v22 = v21;
          if (a4) {
            *a4 = v21;
          }

LABEL_51:
          v16 = 0;
          goto LABEL_52;
        }

LABEL_10:
        id v11 = [v6 objectForKeyedSubscript:@"regionInfo"];
        if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          uint64_t v12 = v8;
          v51 = 0;
LABEL_13:
          v13 = [v6 objectForKeyedSubscript:@"epochTimestampInNanosecond"];
          if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (a4)
              {
                id v50 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v47 = *MEMORY[0x1E4F502C8];
                uint64_t v59 = *MEMORY[0x1E4F28568];
                v44 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"epochTimestampInNanosecond"];
                v60 = v44;
                v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60 forKeys:&v59 count:1];
                *a4 = (id)[v50 initWithDomain:v47 code:2 userInfo:v45];
              }
              v16 = 0;
              id v14 = 0;
              v15 = v52;
              goto LABEL_17;
            }
            id v14 = v13;
          }
          else
          {
            id v14 = 0;
          }
          v15 = v52;
          v16 = [(BMOasisAnalyticsSystemInfoEvent *)v54 initWithQualityTrace:v12 metadata:v52 deviceInfo:v53 regionInfo:v51 epochTimestampInNanosecond:v14];
          v54 = v16;
LABEL_17:

          v8 = v12;
LABEL_50:

LABEL_53:
          self = v54;
          goto LABEL_54;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v14 = v11;
          id v55 = 0;
          v51 = [[BMOasisAnalyticsRegionInfo alloc] initWithJSONDictionary:v14 error:&v55];
          id v28 = v55;
          if (!v28)
          {
            uint64_t v12 = v8;

            goto LABEL_13;
          }
          v29 = v28;
          if (a4) {
            *a4 = v28;
          }

          v16 = 0;
LABEL_49:
          v15 = v52;
          goto LABEL_50;
        }
        if (a4)
        {
          id v46 = objc_alloc(MEMORY[0x1E4F28C58]);
          v40 = v8;
          uint64_t v41 = *MEMORY[0x1E4F502C8];
          uint64_t v61 = *MEMORY[0x1E4F28568];
          v51 = (BMOasisAnalyticsRegionInfo *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"regionInfo"];
          v62 = v51;
          id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
          uint64_t v42 = v41;
          v8 = v40;
          v16 = 0;
          *a4 = (id)[v46 initWithDomain:v42 code:2 userInfo:v14];
          goto LABEL_49;
        }
        goto LABEL_51;
      }
      if (a4)
      {
        v49 = a4;
        id v36 = objc_alloc(MEMORY[0x1E4F28C58]);
        v37 = v8;
        uint64_t v38 = *MEMORY[0x1E4F502C8];
        uint64_t v63 = *MEMORY[0x1E4F28568];
        v53 = (BMOasisAnalyticsDeviceInfo *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"deviceInfo"];
        v64 = v53;
        id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
        uint64_t v39 = v38;
        v8 = v37;
        v16 = 0;
        id *v49 = (id)[v36 initWithDomain:v39 code:2 userInfo:v11];
LABEL_52:
        v15 = v52;
        goto LABEL_53;
      }
      v16 = 0;
LABEL_65:
      v15 = v52;
      goto LABEL_54;
    }
    if (a4)
    {
      v48 = a4;
      id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
      unint64_t v31 = v8;
      uint64_t v32 = *MEMORY[0x1E4F502C8];
      uint64_t v65 = *MEMORY[0x1E4F28568];
      uint64_t v33 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"metadata"];
      uint64_t v66 = v33;
      id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
      v34 = v30;
      v15 = (void *)v33;
      uint64_t v35 = v32;
      v8 = v31;
      v16 = 0;
      id *v48 = (id)[v34 initWithDomain:v35 code:2 userInfo:v10];
LABEL_54:

      goto LABEL_55;
    }
    goto LABEL_42;
  }
  if (!a4)
  {
    v16 = 0;
    goto LABEL_56;
  }
  v23 = a4;
  id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v25 = *MEMORY[0x1E4F502C8];
  uint64_t v67 = *MEMORY[0x1E4F28568];
  uint64_t v26 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"qualityTrace"];
  v68[0] = v26;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:&v67 count:1];
  uint64_t v27 = v25;
  v8 = (BMOasisAnalyticsQualityTrace *)v26;
  v16 = 0;
  id *v23 = (id)[v24 initWithDomain:v27 code:2 userInfo:v9];
LABEL_55:

LABEL_56:
  return v16;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMOasisAnalyticsSystemInfoEvent *)self writeTo:v3];
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
  if (self->_deviceInfo)
  {
    PBDataWriterPlaceMark();
    [(BMOasisAnalyticsDeviceInfo *)self->_deviceInfo writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_regionInfo)
  {
    PBDataWriterPlaceMark();
    [(BMOasisAnalyticsRegionInfo *)self->_regionInfo writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_hasEpochTimestampInNanosecond) {
    PBDataWriterWriteUint64Field();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)BMOasisAnalyticsSystemInfoEvent;
  id v5 = [(BMEventBase *)&v30 init];
  if (!v5) {
    goto LABEL_50;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    id v9 = (int *)MEMORY[0x1E4F940B8];
    while (!v4[*v8])
    {
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
        BOOL v16 = v11++ >= 9;
        if (v16)
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
      switch((v12 >> 3))
      {
        case 1u:
          uint64_t v31 = 0;
          uint64_t v32 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_49;
          }
          id v19 = [[BMOasisAnalyticsMetadata alloc] initByReadFrom:v4];
          if (!v19) {
            goto LABEL_49;
          }
          uint64_t v20 = 32;
          goto LABEL_33;
        case 2u:
          uint64_t v31 = 0;
          uint64_t v32 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_49;
          }
          id v19 = [[BMOasisAnalyticsDeviceInfo alloc] initByReadFrom:v4];
          if (!v19) {
            goto LABEL_49;
          }
          uint64_t v20 = 40;
          goto LABEL_33;
        case 3u:
          uint64_t v31 = 0;
          uint64_t v32 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_49;
          }
          id v19 = [[BMOasisAnalyticsRegionInfo alloc] initByReadFrom:v4];
          if (!v19) {
            goto LABEL_49;
          }
          uint64_t v20 = 48;
          goto LABEL_33;
        case 4u:
          char v22 = 0;
          unsigned int v23 = 0;
          unint64_t v24 = 0;
          v5->_hasEpochTimestampInNanosecond = 1;
          while (2)
          {
            uint64_t v25 = *v6;
            unint64_t v26 = *(void *)&v4[v25];
            if (v26 == -1 || v26 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v27 = *(unsigned char *)(*(void *)&v4[*v9] + v26);
              *(void *)&v4[v25] = v26 + 1;
              v24 |= (unint64_t)(v27 & 0x7F) << v22;
              if (v27 < 0)
              {
                v22 += 7;
                BOOL v16 = v23++ >= 9;
                if (v16)
                {
                  unint64_t v24 = 0;
                  goto LABEL_46;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            unint64_t v24 = 0;
          }
LABEL_46:
          v5->_epochTimestampInNanosecond = v24;
          goto LABEL_47;
        default:
          if ((v12 >> 3) == 101)
          {
            uint64_t v31 = 0;
            uint64_t v32 = 0;
            if ((PBReaderPlaceMark() & 1) == 0) {
              goto LABEL_49;
            }
            id v19 = [[BMOasisAnalyticsQualityTrace alloc] initByReadFrom:v4];
            if (!v19) {
              goto LABEL_49;
            }
            uint64_t v20 = 24;
LABEL_33:
            id v21 = *(Class *)((char *)&v5->super.super.isa + v20);
            *(Class *)((char *)&v5->super.super.isa + v20) = v19;

            PBReaderRecallMark();
          }
          else if (!PBReaderSkipValueWithTag())
          {
            goto LABEL_49;
          }
LABEL_47:
          if (*(void *)&v4[*v6] >= *(void *)&v4[*v7]) {
            goto LABEL_48;
          }
          break;
      }
    }
  }
LABEL_48:
  if (v4[*v8]) {
LABEL_49:
  }
    id v28 = 0;
  else {
LABEL_50:
  }
    id v28 = v5;

  return v28;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMOasisAnalyticsSystemInfoEvent *)self qualityTrace];
  id v5 = [(BMOasisAnalyticsSystemInfoEvent *)self metadata];
  id v6 = [(BMOasisAnalyticsSystemInfoEvent *)self deviceInfo];
  uint64_t v7 = [(BMOasisAnalyticsSystemInfoEvent *)self regionInfo];
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BMOasisAnalyticsSystemInfoEvent epochTimestampInNanosecond](self, "epochTimestampInNanosecond"));
  id v9 = (void *)[v3 initWithFormat:@"BMOasisAnalyticsSystemInfoEvent with qualityTrace: %@, metadata: %@, deviceInfo: %@, regionInfo: %@, epochTimestampInNanosecond: %@", v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (BMOasisAnalyticsSystemInfoEvent)initWithQualityTrace:(id)a3 metadata:(id)a4 deviceInfo:(id)a5 regionInfo:(id)a6 epochTimestampInNanosecond:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)BMOasisAnalyticsSystemInfoEvent;
  int v17 = [(BMEventBase *)&v21 init];
  if (v17)
  {
    v17->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v17->_qualityTrace, a3);
    objc_storeStrong((id *)&v17->_metadata, a4);
    objc_storeStrong((id *)&v17->_deviceInfo, a5);
    objc_storeStrong((id *)&v17->_regionInfo, a6);
    if (v16)
    {
      v17->_hasEpochTimestampInNanosecond = 1;
      uint64_t v18 = [v16 unsignedLongLongValue];
    }
    else
    {
      uint64_t v18 = 0;
      v17->_hasEpochTimestampInNanosecond = 0;
    }
    v17->_epochTimestampInNanosecond = v18;
  }

  return v17;
}

+ (id)protoFields
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"qualityTrace" number:101 type:14 subMessageClass:objc_opt_class()];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"metadata", 1, 14, objc_opt_class(), v2);
  v9[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"deviceInfo" number:2 type:14 subMessageClass:objc_opt_class()];
  v9[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"regionInfo" number:3 type:14 subMessageClass:objc_opt_class()];
  v9[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"epochTimestampInNanosecond" number:4 type:5 subMessageClass:0];
  v9[4] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF7A10;
}

+ (id)columns
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"qualityTrace_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_966];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"metadata_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_968];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"deviceInfo_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_970_92041];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"regionInfo_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_972_92042];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"epochTimestampInNanosecond" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:5 convertedType:0];
  v9[0] = v3;
  v9[1] = v4;
  v9[2] = v5;
  v9[3] = v6;
  v9[4] = v2;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

id __42__BMOasisAnalyticsSystemInfoEvent_columns__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 regionInfo];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __42__BMOasisAnalyticsSystemInfoEvent_columns__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 deviceInfo];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __42__BMOasisAnalyticsSystemInfoEvent_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 metadata];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __42__BMOasisAnalyticsSystemInfoEvent_columns__block_invoke(uint64_t a1, void *a2)
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

    v8 = [[BMOasisAnalyticsSystemInfoEvent alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[5] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end