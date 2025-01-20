@interface BMMapsRecentConversationsIntent
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMapsRecentConversationsIntent)initWithContactInformation:(id)a3 actionType:(int)a4 predictionTimestamp:(id)a5 predictionExpiration:(id)a6 bundleID:(id)a7;
- (BMMapsRecentConversationsIntent)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMMapsRecentConversationsIntentContactInformation)contactInformation;
- (BOOL)isEqual:(id)a3;
- (NSDate)predictionExpiration;
- (NSDate)predictionTimestamp;
- (NSString)bundleID;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)actionType;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMMapsRecentConversationsIntent

+ (id)columns
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"contactInformation_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_244_81706];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"actionType" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"predictionTimestamp" dataType:3 requestOnly:0 fieldNumber:3 protoDataType:0 convertedType:2];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"predictionExpiration" dataType:3 requestOnly:0 fieldNumber:4 protoDataType:0 convertedType:2];
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

  objc_storeStrong((id *)&self->_contactInformation, 0);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (int)actionType
{
  return self->_actionType;
}

- (BMMapsRecentConversationsIntentContactInformation)contactInformation
{
  return self->_contactInformation;
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
    v6 = [(BMMapsRecentConversationsIntent *)self contactInformation];
    uint64_t v7 = [v5 contactInformation];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMMapsRecentConversationsIntent *)self contactInformation];
      v10 = [v5 contactInformation];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_14;
      }
    }
    int v13 = [(BMMapsRecentConversationsIntent *)self actionType];
    if (v13 == [v5 actionType])
    {
      v14 = [(BMMapsRecentConversationsIntent *)self predictionTimestamp];
      uint64_t v15 = [v5 predictionTimestamp];
      if (v14 == (void *)v15)
      {
      }
      else
      {
        v16 = (void *)v15;
        v17 = [(BMMapsRecentConversationsIntent *)self predictionTimestamp];
        v18 = [v5 predictionTimestamp];
        int v19 = [v17 isEqual:v18];

        if (!v19) {
          goto LABEL_14;
        }
      }
      v20 = [(BMMapsRecentConversationsIntent *)self predictionExpiration];
      uint64_t v21 = [v5 predictionExpiration];
      if (v20 == (void *)v21)
      {
      }
      else
      {
        v22 = (void *)v21;
        v23 = [(BMMapsRecentConversationsIntent *)self predictionExpiration];
        v24 = [v5 predictionExpiration];
        int v25 = [v23 isEqual:v24];

        if (!v25) {
          goto LABEL_14;
        }
      }
      v27 = [(BMMapsRecentConversationsIntent *)self bundleID];
      v28 = [v5 bundleID];
      if (v27 == v28)
      {
        char v12 = 1;
      }
      else
      {
        v29 = [(BMMapsRecentConversationsIntent *)self bundleID];
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

- (NSDate)predictionExpiration
{
  if (self->_hasRaw_predictionExpiration)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_predictionExpiration];
    id v4 = [v2 convertValue:v3 toType:2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (NSDate)predictionTimestamp
{
  if (self->_hasRaw_predictionTimestamp)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_predictionTimestamp];
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
  v29[5] = *MEMORY[0x1E4F143B8];
  v3 = [(BMMapsRecentConversationsIntent *)self contactInformation];
  id v4 = [v3 jsonDictionary];

  id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMapsRecentConversationsIntent actionType](self, "actionType"));
  v6 = [(BMMapsRecentConversationsIntent *)self predictionTimestamp];
  if (v6)
  {
    uint64_t v7 = NSNumber;
    v8 = [(BMMapsRecentConversationsIntent *)self predictionTimestamp];
    [v8 timeIntervalSince1970];
    v9 = objc_msgSend(v7, "numberWithDouble:");
  }
  else
  {
    v9 = 0;
  }

  v10 = [(BMMapsRecentConversationsIntent *)self predictionExpiration];
  if (v10)
  {
    int v11 = NSNumber;
    char v12 = [(BMMapsRecentConversationsIntent *)self predictionExpiration];
    [v12 timeIntervalSince1970];
    int v13 = objc_msgSend(v11, "numberWithDouble:");
  }
  else
  {
    int v13 = 0;
  }

  v14 = [(BMMapsRecentConversationsIntent *)self bundleID];
  v24 = @"contactInformation";
  uint64_t v15 = (uint64_t)v4;
  if (!v4)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v22 = v15;
  v29[0] = v15;
  int v25 = @"actionType";
  v16 = v5;
  if (!v5)
  {
    v16 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v15, v24, v25);
  }
  v29[1] = v16;
  v26 = @"predictionTimestamp";
  v17 = v9;
  if (!v9)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v29[2] = v17;
  v27 = @"predictionExpiration";
  v18 = v13;
  if (!v13)
  {
    v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v29[3] = v18;
  v28 = @"bundleID";
  int v19 = v14;
  if (!v14)
  {
    int v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v29[4] = v19;
  v20 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v29, &v24, 5, v22);
  if (v14)
  {
    if (v13) {
      goto LABEL_19;
    }
  }
  else
  {

    if (v13)
    {
LABEL_19:
      if (v9) {
        goto LABEL_20;
      }
      goto LABEL_27;
    }
  }

  if (v9)
  {
LABEL_20:
    if (v5) {
      goto LABEL_21;
    }
LABEL_28:

    if (v4) {
      goto LABEL_22;
    }
    goto LABEL_29;
  }
LABEL_27:

  if (!v5) {
    goto LABEL_28;
  }
LABEL_21:
  if (v4) {
    goto LABEL_22;
  }
LABEL_29:

LABEL_22:

  return v20;
}

- (BMMapsRecentConversationsIntent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v62[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"contactInformation"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v51 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v7;
    id v52 = 0;
    v51 = [[BMMapsRecentConversationsIntentContactInformation alloc] initWithJSONDictionary:v9 error:&v52];
    id v10 = v52;
    if (v10)
    {
      int v11 = v10;
      if (a4) {
        *a4 = v10;
      }

      char v12 = 0;
      goto LABEL_51;
    }

LABEL_4:
    v8 = [v6 objectForKeyedSubscript:@"actionType"];
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = v8;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            id v9 = 0;
            char v12 = 0;
            goto LABEL_50;
          }
          id v33 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v34 = *MEMORY[0x1E4F502C8];
          uint64_t v59 = *MEMORY[0x1E4F28568];
          v48 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"actionType"];
          v60 = v48;
          v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60 forKeys:&v59 count:1];
          v50 = 0;
          char v12 = 0;
          *a4 = (id)[v33 initWithDomain:v34 code:2 userInfo:v16];
LABEL_49:

          id v9 = v50;
LABEL_50:

          goto LABEL_51;
        }
        id v13 = [NSNumber numberWithInt:BMMapsRecentConversationsIntentActionTypeFromString(v8)];
      }
      v50 = v13;
    }
    else
    {
      v50 = 0;
    }
    v47 = a4;
    v16 = [v6 objectForKeyedSubscript:@"predictionTimestamp"];
    if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v17 = (objc_class *)MEMORY[0x1E4F1C9C8];
        id v18 = v16;
        id v19 = [v17 alloc];
        [v18 doubleValue];
        double v21 = v20;

        id v22 = (id)[v19 initWithTimeIntervalSince1970:v21];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v23 = objc_alloc_init(MEMORY[0x1E4F28D48]);
          v48 = [v23 dateFromString:v16];

          goto LABEL_27;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v48 = 0;
            char v12 = 0;
            goto LABEL_49;
          }
          id v49 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v40 = *MEMORY[0x1E4F502C8];
          uint64_t v57 = *MEMORY[0x1E4F28568];
          int v25 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"predictionTimestamp"];
          v58 = v25;
          v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
          id v41 = (id)[v49 initWithDomain:v40 code:2 userInfo:v24];
          v48 = 0;
          char v12 = 0;
          id *v47 = v41;
          goto LABEL_48;
        }
        id v22 = v16;
      }
      v48 = v22;
    }
    else
    {
      v48 = 0;
    }
LABEL_27:
    v24 = [v6 objectForKeyedSubscript:@"predictionExpiration"];
    if (!v24 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      int v25 = 0;
      goto LABEL_43;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v26 = (objc_class *)MEMORY[0x1E4F1C9C8];
      id v27 = v24;
      id v28 = [v26 alloc];
      [v27 doubleValue];
      double v30 = v29;

      id v31 = (id)[v28 initWithTimeIntervalSince1970:v30];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v32 = objc_alloc_init(MEMORY[0x1E4F28D48]);
        int v25 = [v32 dateFromString:v24];

        goto LABEL_43;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v47)
        {
          int v25 = 0;
          char v12 = 0;
          goto LABEL_48;
        }
        id v46 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v42 = *MEMORY[0x1E4F502C8];
        uint64_t v55 = *MEMORY[0x1E4F28568];
        id v36 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"predictionExpiration"];
        id v56 = v36;
        v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
        id v43 = (id)[v46 initWithDomain:v42 code:2 userInfo:v35];
        int v25 = 0;
        char v12 = 0;
        id *v47 = v43;
        goto LABEL_47;
      }
      id v31 = v24;
    }
    int v25 = v31;
LABEL_43:
    v35 = [v6 objectForKeyedSubscript:@"bundleID"];
    if (v35 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v47)
        {
          id v45 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v44 = *MEMORY[0x1E4F502C8];
          uint64_t v53 = *MEMORY[0x1E4F28568];
          v38 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"bundleID"];
          v54 = v38;
          v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
          id *v47 = (id)[v45 initWithDomain:v44 code:2 userInfo:v39];
        }
        id v36 = 0;
        char v12 = 0;
        goto LABEL_47;
      }
      id v36 = v35;
    }
    else
    {
      id v36 = 0;
    }
    char v12 = -[BMMapsRecentConversationsIntent initWithContactInformation:actionType:predictionTimestamp:predictionExpiration:bundleID:](self, "initWithContactInformation:actionType:predictionTimestamp:predictionExpiration:bundleID:", v51, [v50 intValue], v48, v25, v36);
    self = v12;
LABEL_47:

LABEL_48:
    goto LABEL_49;
  }
  if (a4)
  {
    id v14 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v15 = *MEMORY[0x1E4F502C8];
    uint64_t v61 = *MEMORY[0x1E4F28568];
    v51 = (BMMapsRecentConversationsIntentContactInformation *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"contactInformation"];
    v62[0] = v51;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:&v61 count:1];
    char v12 = 0;
    *a4 = (id)[v14 initWithDomain:v15 code:2 userInfo:v9];
LABEL_51:

    goto LABEL_52;
  }
  char v12 = 0;
LABEL_52:

  return v12;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMMapsRecentConversationsIntent *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_contactInformation)
  {
    PBDataWriterPlaceMark();
    [(BMMapsRecentConversationsIntentContactInformation *)self->_contactInformation writeTo:v4];
    PBDataWriterRecallMark();
  }
  PBDataWriterWriteUint32Field();
  if (self->_hasRaw_predictionTimestamp) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasRaw_predictionExpiration) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_bundleID) {
    PBDataWriterWriteStringField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)BMMapsRecentConversationsIntent;
  id v5 = [(BMEventBase *)&v39 init];
  if (!v5) {
    goto LABEL_53;
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
          uint64_t v40 = 0;
          uint64_t v41 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_52;
          }
          double v20 = [[BMMapsRecentConversationsIntentContactInformation alloc] initByReadFrom:v4];
          if (!v20) {
            goto LABEL_52;
          }
          contactInformation = v5->_contactInformation;
          v5->_contactInformation = v20;

          PBReaderRecallMark();
          continue;
        case 2u:
          char v22 = 0;
          unsigned int v23 = 0;
          uint64_t v24 = 0;
          break;
        case 3u:
          v5->_hasRaw_predictionTimestamp = 1;
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
          uint64_t v36 = 24;
          goto LABEL_49;
        case 4u:
          v5->_hasRaw_predictionExpiration = 1;
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
          uint64_t v36 = 40;
LABEL_49:
          *(Class *)((char *)&v5->super.super.isa + v36) = v31;
          continue;
        case 5u:
          uint64_t v34 = PBReaderReadString();
          bundleID = v5->_bundleID;
          v5->_bundleID = (NSString *)v34;

          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_52;
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
          goto LABEL_40;
        }
        v22 += 7;
        BOOL v17 = v23++ >= 9;
        if (v17)
        {
          LODWORD(v24) = 0;
          goto LABEL_42;
        }
      }
      v4[*v8] = 1;
LABEL_40:
      if (v4[*v8]) {
        LODWORD(v24) = 0;
      }
LABEL_42:
      if (v24 >= 0x13) {
        LODWORD(v24) = 0;
      }
      v5->_actionType = v24;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_52:
  }
    v37 = 0;
  else {
LABEL_53:
  }
    v37 = v5;

  return v37;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMMapsRecentConversationsIntent *)self contactInformation];
  id v5 = BMMapsRecentConversationsIntentActionTypeAsString([(BMMapsRecentConversationsIntent *)self actionType]);
  id v6 = [(BMMapsRecentConversationsIntent *)self predictionTimestamp];
  uint64_t v7 = [(BMMapsRecentConversationsIntent *)self predictionExpiration];
  v8 = [(BMMapsRecentConversationsIntent *)self bundleID];
  id v9 = (void *)[v3 initWithFormat:@"BMMapsRecentConversationsIntent with contactInformation: %@, actionType: %@, predictionTimestamp: %@, predictionExpiration: %@, bundleID: %@", v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (BMMapsRecentConversationsIntent)initWithContactInformation:(id)a3 actionType:(int)a4 predictionTimestamp:(id)a5 predictionExpiration:(id)a6 bundleID:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)BMMapsRecentConversationsIntent;
  BOOL v17 = [(BMEventBase *)&v21 init];
  if (v17)
  {
    v17->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v17->_contactInformation, a3);
    v17->_actionType = a4;
    if (v14)
    {
      v17->_hasRaw_predictionTimestamp = 1;
      [v14 timeIntervalSince1970];
    }
    else
    {
      v17->_hasRaw_predictionTimestamp = 0;
      double v18 = -1.0;
    }
    v17->_raw_predictionTimestamp = v18;
    if (v15)
    {
      v17->_hasRaw_predictionExpiration = 1;
      [v15 timeIntervalSince1970];
    }
    else
    {
      v17->_hasRaw_predictionExpiration = 0;
      double v19 = -1.0;
    }
    v17->_raw_predictionExpiration = v19;
    objc_storeStrong((id *)&v17->_bundleID, a7);
  }

  return v17;
}

+ (id)protoFields
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"contactInformation" number:1 type:14 subMessageClass:objc_opt_class()];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"actionType", 2, 4, 0, v2);
  v9[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"predictionTimestamp" number:3 type:0 subMessageClass:0];
  v9[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"predictionExpiration" number:4 type:0 subMessageClass:0];
  v9[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleID" number:5 type:13 subMessageClass:0];
  v9[4] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF71A0;
}

id __42__BMMapsRecentConversationsIntent_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 contactInformation];
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

    v8 = [[BMMapsRecentConversationsIntent alloc] initByReadFrom:v7];
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