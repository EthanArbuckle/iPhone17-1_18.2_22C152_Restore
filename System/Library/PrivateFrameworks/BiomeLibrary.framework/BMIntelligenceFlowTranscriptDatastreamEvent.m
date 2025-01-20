@interface BMIntelligenceFlowTranscriptDatastreamEvent
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMIntelligenceFlowIdentifiers)identifiers;
- (BMIntelligenceFlowTranscriptDatastreamEvent)initWithAbsoluteTimestamp:(id)a3 monotonicTimestamp:(id)a4 identifiers:(id)a5 eventId:(id)a6 eventType:(id)a7 data:(id)a8;
- (BMIntelligenceFlowTranscriptDatastreamEvent)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMMonotonicTimestamp)monotonicTimestamp;
- (BOOL)isEqual:(id)a3;
- (NSData)data;
- (NSDate)absoluteTimestamp;
- (NSString)description;
- (NSString)eventId;
- (NSString)eventType;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMIntelligenceFlowTranscriptDatastreamEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_eventType, 0);
  objc_storeStrong((id *)&self->_eventId, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);

  objc_storeStrong((id *)&self->_monotonicTimestamp, 0);
}

- (NSData)data
{
  return self->_data;
}

- (NSString)eventType
{
  return self->_eventType;
}

- (NSString)eventId
{
  return self->_eventId;
}

- (BMIntelligenceFlowIdentifiers)identifiers
{
  return self->_identifiers;
}

- (BMMonotonicTimestamp)monotonicTimestamp
{
  return self->_monotonicTimestamp;
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
    v6 = [(BMIntelligenceFlowTranscriptDatastreamEvent *)self absoluteTimestamp];
    uint64_t v7 = [v5 absoluteTimestamp];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMIntelligenceFlowTranscriptDatastreamEvent *)self absoluteTimestamp];
      v10 = [v5 absoluteTimestamp];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_21;
      }
    }
    v13 = [(BMIntelligenceFlowTranscriptDatastreamEvent *)self monotonicTimestamp];
    uint64_t v14 = [v5 monotonicTimestamp];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMIntelligenceFlowTranscriptDatastreamEvent *)self monotonicTimestamp];
      v17 = [v5 monotonicTimestamp];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_21;
      }
    }
    v19 = [(BMIntelligenceFlowTranscriptDatastreamEvent *)self identifiers];
    uint64_t v20 = [v5 identifiers];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMIntelligenceFlowTranscriptDatastreamEvent *)self identifiers];
      v23 = [v5 identifiers];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_21;
      }
    }
    v25 = [(BMIntelligenceFlowTranscriptDatastreamEvent *)self eventId];
    uint64_t v26 = [v5 eventId];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMIntelligenceFlowTranscriptDatastreamEvent *)self eventId];
      v29 = [v5 eventId];
      int v30 = [v28 isEqual:v29];

      if (!v30) {
        goto LABEL_21;
      }
    }
    v31 = [(BMIntelligenceFlowTranscriptDatastreamEvent *)self eventType];
    uint64_t v32 = [v5 eventType];
    if (v31 == (void *)v32)
    {
    }
    else
    {
      v33 = (void *)v32;
      v34 = [(BMIntelligenceFlowTranscriptDatastreamEvent *)self eventType];
      v35 = [v5 eventType];
      int v36 = [v34 isEqual:v35];

      if (!v36)
      {
LABEL_21:
        char v12 = 0;
LABEL_22:

        goto LABEL_23;
      }
    }
    v38 = [(BMIntelligenceFlowTranscriptDatastreamEvent *)self data];
    v39 = [v5 data];
    if (v38 == v39)
    {
      char v12 = 1;
    }
    else
    {
      v40 = [(BMIntelligenceFlowTranscriptDatastreamEvent *)self data];
      v41 = [v5 data];
      char v12 = [v40 isEqual:v41];
    }
    goto LABEL_22;
  }
  char v12 = 0;
LABEL_23:

  return v12;
}

- (NSDate)absoluteTimestamp
{
  if (self->_hasRaw_absoluteTimestamp)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_absoluteTimestamp];
    id v4 = [v2 convertValue:v3 toType:1];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (id)jsonDictionary
{
  v28[6] = *MEMORY[0x1E4F143B8];
  v3 = [(BMIntelligenceFlowTranscriptDatastreamEvent *)self absoluteTimestamp];
  if (v3)
  {
    id v4 = NSNumber;
    id v5 = [(BMIntelligenceFlowTranscriptDatastreamEvent *)self absoluteTimestamp];
    [v5 timeIntervalSinceReferenceDate];
    uint64_t v6 = objc_msgSend(v4, "numberWithDouble:");
  }
  else
  {
    uint64_t v6 = 0;
  }

  uint64_t v7 = [(BMIntelligenceFlowTranscriptDatastreamEvent *)self monotonicTimestamp];
  v8 = [v7 jsonDictionary];

  v9 = [(BMIntelligenceFlowTranscriptDatastreamEvent *)self identifiers];
  v10 = [v9 jsonDictionary];

  int v11 = [(BMIntelligenceFlowTranscriptDatastreamEvent *)self eventId];
  char v12 = [(BMIntelligenceFlowTranscriptDatastreamEvent *)self eventType];
  v13 = [(BMIntelligenceFlowTranscriptDatastreamEvent *)self data];
  uint64_t v14 = [v13 base64EncodedStringWithOptions:0];

  v27[0] = @"absoluteTimestamp";
  uint64_t v15 = v6;
  if (!v6)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v25 = (void *)v15;
  uint64_t v26 = (void *)v6;
  v28[0] = v15;
  v27[1] = @"monotonicTimestamp";
  uint64_t v16 = (uint64_t)v8;
  if (!v8)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v23 = v16;
  v28[1] = v16;
  v27[2] = @"identifiers";
  v17 = v10;
  if (!v10)
  {
    v17 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v16, v25);
  }
  v28[2] = v17;
  v27[3] = @"eventId";
  int v18 = v11;
  if (!v11)
  {
    int v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[3] = v18;
  v27[4] = @"eventType";
  v19 = v12;
  if (!v12)
  {
    v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[4] = v19;
  v27[5] = @"data";
  uint64_t v20 = v14;
  if (!v14)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[5] = v20;
  v21 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v28, v27, 6, v23);
  if (v14)
  {
    if (v12) {
      goto LABEL_18;
    }
  }
  else
  {

    if (v12)
    {
LABEL_18:
      if (v11) {
        goto LABEL_19;
      }
      goto LABEL_28;
    }
  }

  if (v11)
  {
LABEL_19:
    if (v10) {
      goto LABEL_20;
    }
LABEL_29:

    if (v8) {
      goto LABEL_21;
    }
    goto LABEL_30;
  }
LABEL_28:

  if (!v10) {
    goto LABEL_29;
  }
LABEL_20:
  if (v8) {
    goto LABEL_21;
  }
LABEL_30:

LABEL_21:
  if (!v26) {

  }
  return v21;
}

- (BMIntelligenceFlowTranscriptDatastreamEvent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v74[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"absoluteTimestamp"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = (objc_class *)MEMORY[0x1E4F1C9C8];
      id v20 = v7;
      id v21 = [v19 alloc];
      [v20 doubleValue];
      double v23 = v22;

      id v8 = (id)[v21 initWithTimeIntervalSinceReferenceDate:v23];
    }
    else
    {
      v29 = a4;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v30 = objc_alloc_init(MEMORY[0x1E4F28D48]);
        id v8 = [v30 dateFromString:v7];
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            id v8 = 0;
            int v18 = 0;
            goto LABEL_62;
          }
          id v48 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v49 = *MEMORY[0x1E4F502C8];
          uint64_t v73 = *MEMORY[0x1E4F28568];
          id v24 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"absoluteTimestamp"];
          v74[0] = v24;
          v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v74 forKeys:&v73 count:1];
          id v50 = (id)[v48 initWithDomain:v49 code:2 userInfo:v17];
          id v8 = 0;
          int v18 = 0;
          id *v29 = v50;
          goto LABEL_60;
        }
        id v8 = v7;
      }
    }
  }
  else
  {
    id v8 = 0;
  }
  v9 = [v6 objectForKeyedSubscript:@"monotonicTimestamp"];
  if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v56 = v7;
    v57 = 0;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v24 = v9;
    id v62 = 0;
    v57 = [[BMMonotonicTimestamp alloc] initWithJSONDictionary:v24 error:&v62];
    id v25 = v62;
    if (v25)
    {
      uint64_t v26 = v25;
      if (a4) {
        *a4 = v25;
      }

      int v18 = 0;
      v17 = v57;
      goto LABEL_60;
    }
    v56 = v7;

LABEL_7:
    v10 = [v6 objectForKeyedSubscript:@"identifiers"];
    if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v58 = 0;
      v59 = self;
LABEL_10:
      int v11 = [v6 objectForKeyedSubscript:@"eventId"];
      id v55 = v8;
      if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            int v18 = 0;
            id v12 = 0;
            v17 = v57;
            goto LABEL_57;
          }
          id v40 = objc_alloc(MEMORY[0x1E4F28C58]);
          v41 = a4;
          uint64_t v42 = *MEMORY[0x1E4F502C8];
          uint64_t v67 = *MEMORY[0x1E4F28568];
          id v14 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"eventId"];
          id v68 = v14;
          v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v68 forKeys:&v67 count:1];
          int v18 = 0;
          id *v41 = (id)[v40 initWithDomain:v42 code:2 userInfo:v13];
          id v12 = 0;
          goto LABEL_71;
        }
        id v12 = v11;
      }
      else
      {
        id v12 = 0;
      }
      v13 = [v6 objectForKeyedSubscript:@"eventType"];
      id v54 = v12;
      if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v14 = 0;
        goto LABEL_16;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = v13;
LABEL_16:
        uint64_t v15 = [v6 objectForKeyedSubscript:@"data"];
        if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v16 = 0;
LABEL_19:
          v17 = v57;
          int v18 = [(BMIntelligenceFlowTranscriptDatastreamEvent *)v59 initWithAbsoluteTimestamp:v55 monotonicTimestamp:v57 identifiers:v58 eventId:v54 eventType:v14 data:v16];
          v59 = v18;
LABEL_55:

          id v12 = v54;
LABEL_56:

LABEL_57:
          self = v59;
          id v8 = v55;
          goto LABEL_58;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v16 = v15;
          goto LABEL_19;
        }
        if (a4)
        {
          id v53 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v51 = *MEMORY[0x1E4F502C8];
          uint64_t v63 = *MEMORY[0x1E4F28568];
          v45 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSData", objc_opt_class(), @"data"];
          v64 = v45;
          v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
          *a4 = (id)[v53 initWithDomain:v51 code:2 userInfo:v46];
        }
        id v16 = 0;
        int v18 = 0;
LABEL_54:
        v17 = v57;
        goto LABEL_55;
      }
      if (a4)
      {
        id v52 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v43 = *MEMORY[0x1E4F502C8];
        uint64_t v65 = *MEMORY[0x1E4F28568];
        id v16 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"eventType"];
        id v66 = v16;
        uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
        id v44 = (id)[v52 initWithDomain:v43 code:2 userInfo:v15];
        int v18 = 0;
        id v14 = 0;
        *a4 = v44;
        goto LABEL_54;
      }
      id v14 = 0;
      int v18 = 0;
LABEL_71:
      v17 = v57;
      goto LABEL_56;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v10;
      id v61 = 0;
      v58 = [[BMIntelligenceFlowIdentifiers alloc] initWithJSONDictionary:v12 error:&v61];
      id v27 = v61;
      if (!v27)
      {
        v59 = self;

        goto LABEL_10;
      }
      v28 = v27;
      if (a4) {
        *a4 = v27;
      }

      int v18 = 0;
    }
    else
    {
      if (!a4)
      {
        int v18 = 0;
        v17 = v57;
        goto LABEL_59;
      }
      id v36 = objc_alloc(MEMORY[0x1E4F28C58]);
      id v37 = v8;
      uint64_t v38 = *MEMORY[0x1E4F502C8];
      uint64_t v69 = *MEMORY[0x1E4F28568];
      v58 = (BMIntelligenceFlowIdentifiers *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"identifiers"];
      v70 = v58;
      id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v70 forKeys:&v69 count:1];
      uint64_t v39 = v38;
      id v8 = v37;
      int v18 = 0;
      *a4 = (id)[v36 initWithDomain:v39 code:2 userInfo:v12];
    }
    v17 = v57;
LABEL_58:

LABEL_59:
    id v24 = v9;
    uint64_t v7 = v56;
    goto LABEL_60;
  }
  if (!a4)
  {
    int v18 = 0;
    goto LABEL_61;
  }
  id v31 = objc_alloc(MEMORY[0x1E4F28C58]);
  id v32 = v8;
  uint64_t v33 = *MEMORY[0x1E4F502C8];
  uint64_t v71 = *MEMORY[0x1E4F28568];
  v60 = a4;
  v17 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"monotonicTimestamp"];
  v72 = v17;
  v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v72 forKeys:&v71 count:1];
  uint64_t v35 = v33;
  id v8 = v32;
  id *v60 = (id)[v31 initWithDomain:v35 code:2 userInfo:v34];

  int v18 = 0;
  id v24 = v9;
LABEL_60:

  v9 = v24;
LABEL_61:

LABEL_62:
  return v18;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMIntelligenceFlowTranscriptDatastreamEvent *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_hasRaw_absoluteTimestamp) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_monotonicTimestamp)
  {
    PBDataWriterPlaceMark();
    [(BMMonotonicTimestamp *)self->_monotonicTimestamp writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_identifiers)
  {
    PBDataWriterPlaceMark();
    [(BMIntelligenceFlowIdentifiers *)self->_identifiers writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_eventId) {
    PBDataWriterWriteStringField();
  }
  if (self->_eventType) {
    PBDataWriterWriteStringField();
  }
  if (self->_data) {
    PBDataWriterWriteDataField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)BMIntelligenceFlowTranscriptDatastreamEvent;
  id v5 = [(BMEventBase *)&v31 init];
  if (!v5) {
    goto LABEL_41;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    v9 = (int *)MEMORY[0x1E4F940B8];
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
      switch((v12 >> 3))
      {
        case 1u:
          v5->_hasRaw_absoluteTimestamp = 1;
          uint64_t v20 = *v6;
          unint64_t v21 = *(void *)&v4[v20];
          if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(void *)&v4[*v7])
          {
            double v22 = *(double *)(*(void *)&v4[*v9] + v21);
            *(void *)&v4[v20] = v21 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v22 = 0.0;
          }
          v5->_raw_absoluteTimestamp = v22;
          break;
        case 2u:
          uint64_t v32 = 0;
          uint64_t v33 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_40;
          }
          double v23 = [[BMMonotonicTimestamp alloc] initByReadFrom:v4];
          if (!v23) {
            goto LABEL_40;
          }
          uint64_t v24 = 40;
          goto LABEL_33;
        case 3u:
          uint64_t v32 = 0;
          uint64_t v33 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_40;
          }
          double v23 = [[BMIntelligenceFlowIdentifiers alloc] initByReadFrom:v4];
          if (!v23) {
            goto LABEL_40;
          }
          uint64_t v24 = 48;
LABEL_33:
          id v27 = *(Class *)((char *)&v5->super.super.isa + v24);
          *(Class *)((char *)&v5->super.super.isa + v24) = v23;

          PBReaderRecallMark();
          break;
        case 4u:
          uint64_t v25 = PBReaderReadString();
          uint64_t v26 = 56;
          goto LABEL_35;
        case 5u:
          uint64_t v25 = PBReaderReadString();
          uint64_t v26 = 64;
          goto LABEL_35;
        case 6u:
          uint64_t v25 = PBReaderReadData();
          uint64_t v26 = 72;
LABEL_35:
          v28 = *(Class *)((char *)&v5->super.super.isa + v26);
          *(Class *)((char *)&v5->super.super.isa + v26) = (Class)v25;

          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_40;
          }
          break;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_40:
  }
    v29 = 0;
  else {
LABEL_41:
  }
    v29 = v5;

  return v29;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMIntelligenceFlowTranscriptDatastreamEvent *)self absoluteTimestamp];
  id v5 = [(BMIntelligenceFlowTranscriptDatastreamEvent *)self monotonicTimestamp];
  id v6 = [(BMIntelligenceFlowTranscriptDatastreamEvent *)self identifiers];
  uint64_t v7 = [(BMIntelligenceFlowTranscriptDatastreamEvent *)self eventId];
  id v8 = [(BMIntelligenceFlowTranscriptDatastreamEvent *)self eventType];
  v9 = [(BMIntelligenceFlowTranscriptDatastreamEvent *)self data];
  char v10 = (void *)[v3 initWithFormat:@"BMIntelligenceFlowTranscriptDatastreamEvent with absoluteTimestamp: %@, monotonicTimestamp: %@, identifiers: %@, eventId: %@, eventType: %@, data: %@", v4, v5, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (BMIntelligenceFlowTranscriptDatastreamEvent)initWithAbsoluteTimestamp:(id)a3 monotonicTimestamp:(id)a4 identifiers:(id)a5 eventId:(id)a6 eventType:(id)a7 data:(id)a8
{
  id v14 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)BMIntelligenceFlowTranscriptDatastreamEvent;
  int v18 = [(BMEventBase *)&v23 init];
  if (v18)
  {
    v18->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion", v21, v22);
    if (v14)
    {
      v18->_hasRaw_absoluteTimestamp = 1;
      [v14 timeIntervalSinceReferenceDate];
    }
    else
    {
      v18->_hasRaw_absoluteTimestamp = 0;
      double v19 = -1.0;
    }
    v18->_raw_absoluteTimestamp = v19;
    objc_storeStrong((id *)&v18->_monotonicTimestamp, a4);
    objc_storeStrong((id *)&v18->_identifiers, a5);
    objc_storeStrong((id *)&v18->_eventId, a6);
    objc_storeStrong((id *)&v18->_eventType, a7);
    objc_storeStrong((id *)&v18->_data, a8);
  }

  return v18;
}

+ (id)protoFields
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"absoluteTimestamp" number:1 type:0 subMessageClass:0];
  v10[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"monotonicTimestamp" number:2 type:14 subMessageClass:objc_opt_class()];
  v10[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"identifiers" number:3 type:14 subMessageClass:objc_opt_class()];
  v10[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"eventId" number:4 type:13 subMessageClass:0];
  v10[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"eventType" number:5 type:13 subMessageClass:0];
  v10[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"data" number:6 type:14 subMessageClass:0];
  v10[5] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF7458;
}

+ (id)columns
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"absoluteTimestamp" dataType:3 requestOnly:0 fieldNumber:1 protoDataType:0 convertedType:1];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"monotonicTimestamp_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_84968];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"identifiers_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_54_84969];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"eventId" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"eventType" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"data" dataType:4 requestOnly:0 fieldNumber:6 protoDataType:14 convertedType:0];
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v4;
  v10[3] = v5;
  v10[4] = v6;
  v10[5] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

id __54__BMIntelligenceFlowTranscriptDatastreamEvent_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 identifiers];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __54__BMIntelligenceFlowTranscriptDatastreamEvent_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 monotonicTimestamp];
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

    id v8 = [[BMIntelligenceFlowTranscriptDatastreamEvent alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[8] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end