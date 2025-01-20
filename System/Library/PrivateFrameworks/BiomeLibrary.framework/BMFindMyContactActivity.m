@interface BMFindMyContactActivity
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMFindMyContactActivity)initWithHandle:(id)a3 actionType:(int)a4 eventTimestampBegin:(id)a5 eventTimestampEnd:(id)a6 bundleID:(id)a7;
- (BMFindMyContactActivity)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSDate)eventTimestampBegin;
- (NSDate)eventTimestampEnd;
- (NSString)bundleID;
- (NSString)description;
- (NSString)handle;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)actionType;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMFindMyContactActivity

+ (id)columns
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"handle" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"actionType" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"eventTimestampBegin" dataType:3 requestOnly:0 fieldNumber:3 protoDataType:0 convertedType:2];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"eventTimestampEnd" dataType:3 requestOnly:0 fieldNumber:4 protoDataType:0 convertedType:2];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleID" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  v9[4] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_handle, 0);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (int)actionType
{
  return self->_actionType;
}

- (NSString)handle
{
  return self->_handle;
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
    v6 = [(BMFindMyContactActivity *)self handle];
    uint64_t v7 = [v5 handle];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMFindMyContactActivity *)self handle];
      v10 = [v5 handle];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_14;
      }
    }
    int v13 = [(BMFindMyContactActivity *)self actionType];
    if (v13 == [v5 actionType])
    {
      v14 = [(BMFindMyContactActivity *)self eventTimestampBegin];
      uint64_t v15 = [v5 eventTimestampBegin];
      if (v14 == (void *)v15)
      {
      }
      else
      {
        v16 = (void *)v15;
        v17 = [(BMFindMyContactActivity *)self eventTimestampBegin];
        v18 = [v5 eventTimestampBegin];
        int v19 = [v17 isEqual:v18];

        if (!v19) {
          goto LABEL_14;
        }
      }
      v20 = [(BMFindMyContactActivity *)self eventTimestampEnd];
      uint64_t v21 = [v5 eventTimestampEnd];
      if (v20 == (void *)v21)
      {
      }
      else
      {
        v22 = (void *)v21;
        v23 = [(BMFindMyContactActivity *)self eventTimestampEnd];
        v24 = [v5 eventTimestampEnd];
        int v25 = [v23 isEqual:v24];

        if (!v25) {
          goto LABEL_14;
        }
      }
      v27 = [(BMFindMyContactActivity *)self bundleID];
      v28 = [v5 bundleID];
      if (v27 == v28)
      {
        char v12 = 1;
      }
      else
      {
        v29 = [(BMFindMyContactActivity *)self bundleID];
        v30 = [v5 bundleID];
        char v12 = [v29 isEqual:v30];
      }
      goto LABEL_15;
    }
LABEL_14:
    char v12 = 0;
LABEL_15:

    goto LABEL_16;
  }
  char v12 = 0;
LABEL_16:

  return v12;
}

- (NSDate)eventTimestampEnd
{
  if (self->_hasRaw_eventTimestampEnd)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_eventTimestampEnd];
    id v4 = [v2 convertValue:v3 toType:2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (NSDate)eventTimestampBegin
{
  if (self->_hasRaw_eventTimestampBegin)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_eventTimestampBegin];
    id v4 = [v2 convertValue:v3 toType:2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (id)jsonDictionary
{
  v28[5] = *MEMORY[0x1E4F143B8];
  v3 = [(BMFindMyContactActivity *)self handle];
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMFindMyContactActivity actionType](self, "actionType"));
  id v5 = [(BMFindMyContactActivity *)self eventTimestampBegin];
  if (v5)
  {
    v6 = NSNumber;
    uint64_t v7 = [(BMFindMyContactActivity *)self eventTimestampBegin];
    [v7 timeIntervalSince1970];
    v8 = objc_msgSend(v6, "numberWithDouble:");
  }
  else
  {
    v8 = 0;
  }

  v9 = [(BMFindMyContactActivity *)self eventTimestampEnd];
  if (v9)
  {
    v10 = NSNumber;
    int v11 = [(BMFindMyContactActivity *)self eventTimestampEnd];
    [v11 timeIntervalSince1970];
    char v12 = objc_msgSend(v10, "numberWithDouble:");
  }
  else
  {
    char v12 = 0;
  }

  int v13 = [(BMFindMyContactActivity *)self bundleID];
  v23 = @"handle";
  uint64_t v14 = (uint64_t)v3;
  if (!v3)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v21 = v14;
  v28[0] = v14;
  v24 = @"actionType";
  uint64_t v15 = v4;
  if (!v4)
  {
    uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v14, v23, v24);
  }
  v28[1] = v15;
  int v25 = @"eventTimestampBegin";
  v16 = v8;
  if (!v8)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[2] = v16;
  v26 = @"eventTimestampEnd";
  v17 = v12;
  if (!v12)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[3] = v17;
  v27 = @"bundleID";
  v18 = v13;
  if (!v13)
  {
    v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[4] = v18;
  int v19 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v28, &v23, 5, v21);
  if (v13)
  {
    if (v12) {
      goto LABEL_19;
    }
  }
  else
  {

    if (v12)
    {
LABEL_19:
      if (v8) {
        goto LABEL_20;
      }
      goto LABEL_27;
    }
  }

  if (v8)
  {
LABEL_20:
    if (v4) {
      goto LABEL_21;
    }
LABEL_28:

    if (v3) {
      goto LABEL_22;
    }
    goto LABEL_29;
  }
LABEL_27:

  if (!v4) {
    goto LABEL_28;
  }
LABEL_21:
  if (v3) {
    goto LABEL_22;
  }
LABEL_29:

LABEL_22:

  return v19;
}

- (BMFindMyContactActivity)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v60[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"handle"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v50 = 0;
LABEL_4:
    v8 = [v6 objectForKeyedSubscript:@"actionType"];
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = v8;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v49 = 0;
            char v12 = 0;
            goto LABEL_39;
          }
          id v35 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v36 = *MEMORY[0x1E4F502C8];
          uint64_t v57 = *MEMORY[0x1E4F28568];
          v37 = a4;
          a4 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"actionType"];
          v58 = a4;
          int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
          v49 = 0;
          char v12 = 0;
          id *v37 = (id)[v35 initWithDomain:v36 code:2 userInfo:v13];
          goto LABEL_38;
        }
        id v9 = [NSNumber numberWithInt:BMFindMyContactActivityEventTypeFromString(v8)];
      }
      v49 = v9;
    }
    else
    {
      v49 = 0;
    }
    int v13 = [v6 objectForKeyedSubscript:@"eventTimestampBegin"];
    v47 = a4;
    v48 = v7;
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v14 = (objc_class *)MEMORY[0x1E4F1C9C8];
        id v15 = v13;
        id v16 = [v14 alloc];
        [v15 doubleValue];
        double v18 = v17;

        int v19 = (id *)[v16 initWithTimeIntervalSince1970:v18];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v20 = objc_alloc_init(MEMORY[0x1E4F28D48]);
          a4 = [v20 dateFromString:v13];

          goto LABEL_24;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            char v12 = 0;
            goto LABEL_38;
          }
          id v38 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v39 = *MEMORY[0x1E4F502C8];
          uint64_t v55 = *MEMORY[0x1E4F28568];
          v22 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"eventTimestampBegin"];
          v56 = v22;
          uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
          id v40 = (id)[v38 initWithDomain:v39 code:2 userInfo:v21];
          v41 = a4;
          a4 = 0;
          char v12 = 0;
          id *v41 = v40;
LABEL_37:

          uint64_t v7 = v48;
LABEL_38:

          goto LABEL_39;
        }
        int v19 = v13;
      }
      a4 = v19;
    }
    else
    {
      a4 = 0;
    }
LABEL_24:
    uint64_t v21 = [v6 objectForKeyedSubscript:@"eventTimestampEnd"];
    if (v21 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v23 = (objc_class *)MEMORY[0x1E4F1C9C8];
        id v24 = v21;
        id v25 = [v23 alloc];
        [v24 doubleValue];
        double v27 = v26;

        id v28 = (id)[v25 initWithTimeIntervalSince1970:v27];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v29 = objc_alloc_init(MEMORY[0x1E4F28D48]);
          v22 = [v29 dateFromString:v21];

          goto LABEL_32;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v47)
          {
            v22 = 0;
            char v12 = 0;
            goto LABEL_37;
          }
          id v46 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v42 = *MEMORY[0x1E4F502C8];
          uint64_t v53 = *MEMORY[0x1E4F28568];
          id v31 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"eventTimestampEnd"];
          id v54 = v31;
          v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
          id v43 = (id)[v46 initWithDomain:v42 code:2 userInfo:v30];
          v22 = 0;
          char v12 = 0;
          id *v47 = v43;
          goto LABEL_36;
        }
        id v28 = v21;
      }
      v22 = v28;
    }
    else
    {
      v22 = 0;
    }
LABEL_32:
    v30 = [v6 objectForKeyedSubscript:@"bundleID"];
    if (v30 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v47)
        {
          id v45 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v44 = *MEMORY[0x1E4F502C8];
          uint64_t v51 = *MEMORY[0x1E4F28568];
          v33 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"bundleID"];
          v52 = v33;
          v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
          id *v47 = (id)[v45 initWithDomain:v44 code:2 userInfo:v34];
        }
        id v31 = 0;
        char v12 = 0;
        goto LABEL_36;
      }
      id v31 = v30;
    }
    else
    {
      id v31 = 0;
    }
    char v12 = -[BMFindMyContactActivity initWithHandle:actionType:eventTimestampBegin:eventTimestampEnd:bundleID:](self, "initWithHandle:actionType:eventTimestampBegin:eventTimestampEnd:bundleID:", v50, [v49 intValue], a4, v22, v31);
    self = v12;
LABEL_36:

    goto LABEL_37;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v50 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    id v50 = 0;
    char v12 = 0;
    goto LABEL_40;
  }
  id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v11 = *MEMORY[0x1E4F502C8];
  uint64_t v59 = *MEMORY[0x1E4F28568];
  v49 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"handle"];
  v60[0] = v49;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:&v59 count:1];
  id v50 = 0;
  char v12 = 0;
  *a4 = (id)[v10 initWithDomain:v11 code:2 userInfo:v8];
LABEL_39:

LABEL_40:
  return v12;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMFindMyContactActivity *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if (self->_handle) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_hasRaw_eventTimestampBegin) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasRaw_eventTimestampEnd) {
    PBDataWriterWriteDoubleField();
  }
  id v4 = v5;
  if (self->_bundleID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)BMFindMyContactActivity;
  id v5 = [(BMEventBase *)&v38 init];
  if (!v5) {
    goto LABEL_52;
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
          uint64_t v21 = 56;
          goto LABEL_37;
        case 2u:
          char v22 = 0;
          unsigned int v23 = 0;
          uint64_t v24 = 0;
          break;
        case 3u:
          v5->_hasRaw_eventTimestampBegin = 1;
          uint64_t v29 = *v6;
          unint64_t v30 = *(void *)&v4[v29];
          if (v30 <= 0xFFFFFFFFFFFFFFF7 && v30 + 8 <= *(void *)&v4[*v7])
          {
            id v31 = *(objc_class **)(*(void *)&v4[*v9] + v30);
            *(void *)&v4[v29] = v30 + 8;
          }
          else
          {
            v4[*v8] = 1;
            id v31 = 0;
          }
          uint64_t v35 = 24;
          goto LABEL_48;
        case 4u:
          v5->_hasRaw_eventTimestampEnd = 1;
          uint64_t v32 = *v6;
          unint64_t v33 = *(void *)&v4[v32];
          if (v33 <= 0xFFFFFFFFFFFFFFF7 && v33 + 8 <= *(void *)&v4[*v7])
          {
            id v31 = *(objc_class **)(*(void *)&v4[*v9] + v33);
            *(void *)&v4[v32] = v33 + 8;
          }
          else
          {
            v4[*v8] = 1;
            id v31 = 0;
          }
          uint64_t v35 = 40;
LABEL_48:
          *(Class *)((char *)&v5->super.super.isa + v35) = v31;
          continue;
        case 5u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 64;
LABEL_37:
          v34 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_51;
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
          goto LABEL_39;
        }
        v22 += 7;
        BOOL v17 = v23++ >= 9;
        if (v17)
        {
          LODWORD(v24) = 0;
          goto LABEL_41;
        }
      }
      v4[*v8] = 1;
LABEL_39:
      if (v4[*v8]) {
        LODWORD(v24) = 0;
      }
LABEL_41:
      if (v24 >= 4) {
        LODWORD(v24) = 0;
      }
      v5->_actionType = v24;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_51:
  }
    uint64_t v36 = 0;
  else {
LABEL_52:
  }
    uint64_t v36 = v5;

  return v36;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMFindMyContactActivity *)self handle];
  id v5 = BMFindMyContactActivityEventTypeAsString([(BMFindMyContactActivity *)self actionType]);
  id v6 = [(BMFindMyContactActivity *)self eventTimestampBegin];
  uint64_t v7 = [(BMFindMyContactActivity *)self eventTimestampEnd];
  v8 = [(BMFindMyContactActivity *)self bundleID];
  id v9 = (void *)[v3 initWithFormat:@"BMFindMyContactActivity with handle: %@, actionType: %@, eventTimestampBegin: %@, eventTimestampEnd: %@, bundleID: %@", v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (BMFindMyContactActivity)initWithHandle:(id)a3 actionType:(int)a4 eventTimestampBegin:(id)a5 eventTimestampEnd:(id)a6 bundleID:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)BMFindMyContactActivity;
  BOOL v17 = [(BMEventBase *)&v21 init];
  if (v17)
  {
    v17->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v17->_handle, a3);
    v17->_actionType = a4;
    if (v14)
    {
      v17->_hasRaw_eventTimestampBegin = 1;
      [v14 timeIntervalSince1970];
    }
    else
    {
      v17->_hasRaw_eventTimestampBegin = 0;
      double v18 = -1.0;
    }
    v17->_raw_eventTimestampBegin = v18;
    if (v15)
    {
      v17->_hasRaw_eventTimestampEnd = 1;
      [v15 timeIntervalSince1970];
    }
    else
    {
      v17->_hasRaw_eventTimestampEnd = 0;
      double v19 = -1.0;
    }
    v17->_raw_eventTimestampEnd = v19;
    objc_storeStrong((id *)&v17->_bundleID, a7);
  }

  return v17;
}

+ (id)protoFields
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"handle" number:1 type:13 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"actionType", 2, 4, 0, v2);
  v9[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"eventTimestampBegin" number:3 type:0 subMessageClass:0];
  v9[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"eventTimestampEnd" number:4 type:0 subMessageClass:0];
  v9[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleID" number:5 type:13 subMessageClass:0];
  v9[4] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF59E8;
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

    v8 = [[BMFindMyContactActivity alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[12] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end