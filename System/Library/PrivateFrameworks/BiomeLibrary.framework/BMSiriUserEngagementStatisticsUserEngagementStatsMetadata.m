@interface BMSiriUserEngagementStatisticsUserEngagementStatsMetadata
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriUserEngagementStatisticsUserEngagementStatsMetadata)initWithDeviceFamily:(id)a3 siriInputLocale:(id)a4 systemBuild:(id)a5 audioInputRoute:(id)a6 invocationSource:(id)a7 waitTime:(id)a8;
- (BMSiriUserEngagementStatisticsUserEngagementStatsMetadata)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasWaitTime;
- (BOOL)isEqual:(id)a3;
- (NSString)audioInputRoute;
- (NSString)description;
- (NSString)deviceFamily;
- (NSString)invocationSource;
- (NSString)siriInputLocale;
- (NSString)systemBuild;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)waitTime;
- (unsigned)dataVersion;
- (void)setHasWaitTime:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriUserEngagementStatisticsUserEngagementStatsMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invocationSource, 0);
  objc_storeStrong((id *)&self->_audioInputRoute, 0);
  objc_storeStrong((id *)&self->_systemBuild, 0);
  objc_storeStrong((id *)&self->_siriInputLocale, 0);

  objc_storeStrong((id *)&self->_deviceFamily, 0);
}

- (void)setHasWaitTime:(BOOL)a3
{
  self->_hasWaitTime = a3;
}

- (BOOL)hasWaitTime
{
  return self->_hasWaitTime;
}

- (int)waitTime
{
  return self->_waitTime;
}

- (NSString)invocationSource
{
  return self->_invocationSource;
}

- (NSString)audioInputRoute
{
  return self->_audioInputRoute;
}

- (NSString)systemBuild
{
  return self->_systemBuild;
}

- (NSString)siriInputLocale
{
  return self->_siriInputLocale;
}

- (NSString)deviceFamily
{
  return self->_deviceFamily;
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
    v6 = [(BMSiriUserEngagementStatisticsUserEngagementStatsMetadata *)self deviceFamily];
    uint64_t v7 = [v5 deviceFamily];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMSiriUserEngagementStatisticsUserEngagementStatsMetadata *)self deviceFamily];
      v10 = [v5 deviceFamily];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_28;
      }
    }
    v13 = [(BMSiriUserEngagementStatisticsUserEngagementStatsMetadata *)self siriInputLocale];
    uint64_t v14 = [v5 siriInputLocale];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMSiriUserEngagementStatisticsUserEngagementStatsMetadata *)self siriInputLocale];
      v17 = [v5 siriInputLocale];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_28;
      }
    }
    v19 = [(BMSiriUserEngagementStatisticsUserEngagementStatsMetadata *)self systemBuild];
    uint64_t v20 = [v5 systemBuild];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMSiriUserEngagementStatisticsUserEngagementStatsMetadata *)self systemBuild];
      v23 = [v5 systemBuild];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_28;
      }
    }
    v25 = [(BMSiriUserEngagementStatisticsUserEngagementStatsMetadata *)self audioInputRoute];
    uint64_t v26 = [v5 audioInputRoute];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMSiriUserEngagementStatisticsUserEngagementStatsMetadata *)self audioInputRoute];
      v29 = [v5 audioInputRoute];
      int v30 = [v28 isEqual:v29];

      if (!v30) {
        goto LABEL_28;
      }
    }
    v31 = [(BMSiriUserEngagementStatisticsUserEngagementStatsMetadata *)self invocationSource];
    uint64_t v32 = [v5 invocationSource];
    if (v31 == (void *)v32)
    {
    }
    else
    {
      v33 = (void *)v32;
      v34 = [(BMSiriUserEngagementStatisticsUserEngagementStatsMetadata *)self invocationSource];
      v35 = [v5 invocationSource];
      int v36 = [v34 isEqual:v35];

      if (!v36) {
        goto LABEL_28;
      }
    }
    if (![(BMSiriUserEngagementStatisticsUserEngagementStatsMetadata *)self hasWaitTime]
      && ![v5 hasWaitTime])
    {
      BOOL v12 = 1;
      goto LABEL_29;
    }
    if ([(BMSiriUserEngagementStatisticsUserEngagementStatsMetadata *)self hasWaitTime]
      && [v5 hasWaitTime])
    {
      int v37 = [(BMSiriUserEngagementStatisticsUserEngagementStatsMetadata *)self waitTime];
      BOOL v12 = v37 == [v5 waitTime];
LABEL_29:

      goto LABEL_30;
    }
LABEL_28:
    BOOL v12 = 0;
    goto LABEL_29;
  }
  BOOL v12 = 0;
LABEL_30:

  return v12;
}

- (id)jsonDictionary
{
  v23[6] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMSiriUserEngagementStatisticsUserEngagementStatsMetadata *)self deviceFamily];
  uint64_t v4 = [(BMSiriUserEngagementStatisticsUserEngagementStatsMetadata *)self siriInputLocale];
  id v5 = [(BMSiriUserEngagementStatisticsUserEngagementStatsMetadata *)self systemBuild];
  v6 = [(BMSiriUserEngagementStatisticsUserEngagementStatsMetadata *)self audioInputRoute];
  uint64_t v7 = [(BMSiriUserEngagementStatisticsUserEngagementStatsMetadata *)self invocationSource];
  if ([(BMSiriUserEngagementStatisticsUserEngagementStatsMetadata *)self hasWaitTime])
  {
    v8 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriUserEngagementStatisticsUserEngagementStatsMetadata waitTime](self, "waitTime"));
  }
  else
  {
    v8 = 0;
  }
  v22[0] = @"deviceFamily";
  uint64_t v9 = v3;
  if (!v3)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v20 = (void *)v9;
  v21 = (void *)v4;
  v23[0] = v9;
  v22[1] = @"siriInputLocale";
  uint64_t v10 = v4;
  if (!v4)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v18 = v10;
  v23[1] = v10;
  v22[2] = @"systemBuild";
  int v11 = v5;
  if (!v5)
  {
    int v11 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v10, v20);
  }
  v23[2] = v11;
  v22[3] = @"audioInputRoute";
  BOOL v12 = v6;
  if (!v6)
  {
    BOOL v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v13 = (void *)v3;
  v23[3] = v12;
  v22[4] = @"invocationSource";
  uint64_t v14 = v7;
  if (!v7)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v23[4] = v14;
  v22[5] = @"waitTime";
  v15 = v8;
  if (!v8)
  {
    v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v23[5] = v15;
  v16 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v23, v22, 6, v18);
  if (v8)
  {
    if (v7) {
      goto LABEL_18;
    }
  }
  else
  {

    if (v7)
    {
LABEL_18:
      if (v6) {
        goto LABEL_19;
      }
LABEL_27:

      if (v5) {
        goto LABEL_20;
      }
      goto LABEL_28;
    }
  }

  if (!v6) {
    goto LABEL_27;
  }
LABEL_19:
  if (v5) {
    goto LABEL_20;
  }
LABEL_28:

LABEL_20:
  if (v21)
  {
    if (v13) {
      goto LABEL_22;
    }
  }
  else
  {

    if (v13) {
      goto LABEL_22;
    }
  }

LABEL_22:

  return v16;
}

- (BMSiriUserEngagementStatisticsUserEngagementStatsMetadata)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v64[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"deviceFamily"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    uint64_t v9 = [v6 objectForKeyedSubscript:@"siriInputLocale"];
    v49 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v17 = 0;
          v16 = 0;
          goto LABEL_25;
        }
        id v23 = v8;
        id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
        v25 = a4;
        uint64_t v26 = *MEMORY[0x1E4F502C8];
        uint64_t v61 = *MEMORY[0x1E4F28568];
        v27 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"siriInputLocale"];
        v62 = v27;
        uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
        v28 = v24;
        id v8 = v23;
        uint64_t v29 = v26;
        a4 = v27;
        v16 = 0;
        v17 = 0;
        id *v25 = (id)[v28 initWithDomain:v29 code:2 userInfo:v10];
        goto LABEL_24;
      }
      id v51 = v9;
    }
    else
    {
      id v51 = 0;
    }
    uint64_t v10 = [v6 objectForKeyedSubscript:@"systemBuild"];
    v52 = self;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v16 = 0;
          v17 = v51;
          goto LABEL_24;
        }
        id v30 = v8;
        id v31 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v32 = a4;
        uint64_t v33 = *MEMORY[0x1E4F502C8];
        uint64_t v59 = *MEMORY[0x1E4F28568];
        id v50 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"systemBuild"];
        id v60 = v50;
        int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60 forKeys:&v59 count:1];
        v34 = v31;
        id v8 = v30;
        id v35 = (id)[v34 initWithDomain:v33 code:2 userInfo:v11];
        v16 = 0;
        a4 = 0;
        *uint64_t v32 = v35;
        goto LABEL_22;
      }
      v47 = v10;
    }
    else
    {
      v47 = 0;
    }
    int v11 = [v6 objectForKeyedSubscript:@"audioInputRoute"];
    id v48 = v8;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v50 = 0;
          v16 = 0;
          v17 = v51;
          a4 = v47;
          goto LABEL_23;
        }
        id v36 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v37 = *MEMORY[0x1E4F502C8];
        uint64_t v57 = *MEMORY[0x1E4F28568];
        id v13 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"audioInputRoute"];
        id v58 = v13;
        BOOL v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
        id v38 = (id)[v36 initWithDomain:v37 code:2 userInfo:v12];
        v16 = 0;
        id v50 = 0;
        *a4 = v38;
        goto LABEL_57;
      }
      id v50 = v11;
    }
    else
    {
      id v50 = 0;
    }
    BOOL v12 = [v6 objectForKeyedSubscript:@"invocationSource"];
    if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v13 = 0;
      goto LABEL_16;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = v12;
LABEL_16:
      uint64_t v14 = [v6 objectForKeyedSubscript:@"waitTime"];
      if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            id v46 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v44 = *MEMORY[0x1E4F502C8];
            uint64_t v53 = *MEMORY[0x1E4F28568];
            v42 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"waitTime"];
            v54 = v42;
            v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
            *a4 = (id)[v46 initWithDomain:v44 code:2 userInfo:v43];
          }
          id v15 = 0;
          v16 = 0;
          a4 = v47;
          goto LABEL_20;
        }
        id v15 = v14;
      }
      else
      {
        id v15 = 0;
      }
      a4 = v47;
      v16 = [(BMSiriUserEngagementStatisticsUserEngagementStatsMetadata *)v52 initWithDeviceFamily:v48 siriInputLocale:v51 systemBuild:v47 audioInputRoute:v50 invocationSource:v13 waitTime:v15];
      v52 = v16;
LABEL_20:

LABEL_21:
      id v8 = v48;
LABEL_22:
      v17 = v51;
LABEL_23:

      self = v52;
LABEL_24:

      uint64_t v7 = v49;
      goto LABEL_25;
    }
    if (a4)
    {
      v45 = a4;
      id v39 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v40 = *MEMORY[0x1E4F502C8];
      uint64_t v55 = *MEMORY[0x1E4F28568];
      id v15 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"invocationSource"];
      id v56 = v15;
      uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
      id v41 = (id)[v39 initWithDomain:v40 code:2 userInfo:v14];
      v16 = 0;
      id v13 = 0;
      a4 = v47;
      id *v45 = v41;
      goto LABEL_20;
    }
    id v13 = 0;
    v16 = 0;
LABEL_57:
    a4 = v47;
    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    v16 = 0;
    id v8 = 0;
    goto LABEL_26;
  }
  id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v20 = a4;
  uint64_t v21 = *MEMORY[0x1E4F502C8];
  uint64_t v63 = *MEMORY[0x1E4F28568];
  v17 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"deviceFamily"];
  v64[0] = v17;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:&v63 count:1];
  id v22 = (id)[v19 initWithDomain:v21 code:2 userInfo:v9];
  v16 = 0;
  id v8 = 0;
  *uint64_t v20 = v22;
LABEL_25:

LABEL_26:
  return v16;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMSiriUserEngagementStatisticsUserEngagementStatsMetadata *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_deviceFamily)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_siriInputLocale)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_systemBuild)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_audioInputRoute)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_invocationSource)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasWaitTime)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)BMSiriUserEngagementStatisticsUserEngagementStatsMetadata;
  id v5 = [(BMEventBase *)&v32 init];
  if (!v5) {
    goto LABEL_43;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    uint64_t v9 = (int *)MEMORY[0x1E4F940B8];
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
        BOOL v17 = v11++ >= 9;
        if (v17)
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
      switch((v12 >> 3))
      {
        case 1u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 40;
          goto LABEL_34;
        case 2u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 48;
          goto LABEL_34;
        case 3u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 56;
          goto LABEL_34;
        case 4u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 64;
          goto LABEL_34;
        case 5u:
          char v22 = 0;
          unsigned int v23 = 0;
          uint64_t v24 = 0;
          v5->_hasWaitTime = 1;
          break;
        case 6u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 32;
LABEL_34:
          uint64_t v29 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_42;
          }
          continue;
      }
      while (1)
      {
        uint64_t v25 = *v6;
        uint64_t v26 = *(void *)&v4[v25];
        unint64_t v27 = v26 + 1;
        if (v26 == -1 || v27 > *(void *)&v4[*v7]) {
          break;
        }
        char v28 = *(unsigned char *)(*(void *)&v4[*v9] + v26);
        *(void *)&v4[v25] = v27;
        v24 |= (unint64_t)(v28 & 0x7F) << v22;
        if ((v28 & 0x80) == 0) {
          goto LABEL_38;
        }
        v22 += 7;
        BOOL v17 = v23++ >= 9;
        if (v17)
        {
          LODWORD(v24) = 0;
          goto LABEL_40;
        }
      }
      v4[*v8] = 1;
LABEL_38:
      if (v4[*v8]) {
        LODWORD(v24) = 0;
      }
LABEL_40:
      v5->_waitTime = v24;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_42:
  }
    id v30 = 0;
  else {
LABEL_43:
  }
    id v30 = v5;

  return v30;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMSiriUserEngagementStatisticsUserEngagementStatsMetadata *)self deviceFamily];
  id v5 = [(BMSiriUserEngagementStatisticsUserEngagementStatsMetadata *)self siriInputLocale];
  id v6 = [(BMSiriUserEngagementStatisticsUserEngagementStatsMetadata *)self systemBuild];
  uint64_t v7 = [(BMSiriUserEngagementStatisticsUserEngagementStatsMetadata *)self audioInputRoute];
  id v8 = [(BMSiriUserEngagementStatisticsUserEngagementStatsMetadata *)self invocationSource];
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriUserEngagementStatisticsUserEngagementStatsMetadata waitTime](self, "waitTime"));
  char v10 = (void *)[v3 initWithFormat:@"BMSiriUserEngagementStatisticsUserEngagementStatsMetadata with deviceFamily: %@, siriInputLocale: %@, systemBuild: %@, audioInputRoute: %@, invocationSource: %@, waitTime: %@", v4, v5, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (BMSiriUserEngagementStatisticsUserEngagementStatsMetadata)initWithDeviceFamily:(id)a3 siriInputLocale:(id)a4 systemBuild:(id)a5 audioInputRoute:(id)a6 invocationSource:(id)a7 waitTime:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)BMSiriUserEngagementStatisticsUserEngagementStatsMetadata;
  int v18 = [(BMEventBase *)&v24 init];
  if (v18)
  {
    v18->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v18->_deviceFamily, a3);
    objc_storeStrong((id *)&v18->_siriInputLocale, a4);
    objc_storeStrong((id *)&v18->_systemBuild, a5);
    objc_storeStrong((id *)&v18->_audioInputRoute, a6);
    objc_storeStrong((id *)&v18->_invocationSource, a7);
    if (v17)
    {
      v18->_hasWaitTime = 1;
      int v19 = [v17 intValue];
    }
    else
    {
      v18->_hasWaitTime = 0;
      int v19 = -1;
    }
    v18->_waitTime = v19;
  }

  return v18;
}

+ (id)protoFields
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"deviceFamily" number:6 type:13 subMessageClass:0];
  v10[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"siriInputLocale" number:1 type:13 subMessageClass:0];
  v10[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"systemBuild" number:2 type:13 subMessageClass:0];
  v10[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"audioInputRoute" number:3 type:13 subMessageClass:0];
  v10[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"invocationSource" number:4 type:13 subMessageClass:0];
  v10[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"waitTime" number:5 type:2 subMessageClass:0];
  v10[5] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF71B8;
}

+ (id)columns
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"deviceFamily" dataType:2 requestOnly:0 fieldNumber:6 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"siriInputLocale" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"systemBuild" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"audioInputRoute" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"invocationSource" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"waitTime" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:2 convertedType:0];
  v10[0] = v3;
  v10[1] = v4;
  v10[2] = v5;
  v10[3] = v6;
  v10[4] = v7;
  v10[5] = v2;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
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

    id v8 = [[BMSiriUserEngagementStatisticsUserEngagementStatsMetadata alloc] initByReadFrom:v7];
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