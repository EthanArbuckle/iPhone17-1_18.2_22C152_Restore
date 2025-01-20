@interface BMPersonalizedSensingMomentsContextContextFetchDetails
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMPersonalizedSensingMomentsContextContextFetchDetails)initWithFetchId:(id)a3 timestamp:(id)a4 clientBundleIdentifier:(id)a5 alternateClientIdentifier:(id)a6 totalContextReplyCount:(id)a7 batchContextReplyStartIndex:(id)a8;
- (BMPersonalizedSensingMomentsContextContextFetchDetails)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasBatchContextReplyStartIndex;
- (BOOL)hasFetchId;
- (BOOL)hasTotalContextReplyCount;
- (BOOL)isEqual:(id)a3;
- (NSDate)timestamp;
- (NSString)alternateClientIdentifier;
- (NSString)clientBundleIdentifier;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)batchContextReplyStartIndex;
- (unsigned)dataVersion;
- (unsigned)fetchId;
- (unsigned)totalContextReplyCount;
- (void)setHasBatchContextReplyStartIndex:(BOOL)a3;
- (void)setHasFetchId:(BOOL)a3;
- (void)setHasTotalContextReplyCount:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPersonalizedSensingMomentsContextContextFetchDetails

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateClientIdentifier, 0);

  objc_storeStrong((id *)&self->_clientBundleIdentifier, 0);
}

- (void)setHasBatchContextReplyStartIndex:(BOOL)a3
{
  self->_hasBatchContextReplyStartIndex = a3;
}

- (BOOL)hasBatchContextReplyStartIndex
{
  return self->_hasBatchContextReplyStartIndex;
}

- (unsigned)batchContextReplyStartIndex
{
  return self->_batchContextReplyStartIndex;
}

- (void)setHasTotalContextReplyCount:(BOOL)a3
{
  self->_hasTotalContextReplyCount = a3;
}

- (BOOL)hasTotalContextReplyCount
{
  return self->_hasTotalContextReplyCount;
}

- (unsigned)totalContextReplyCount
{
  return self->_totalContextReplyCount;
}

- (NSString)alternateClientIdentifier
{
  return self->_alternateClientIdentifier;
}

- (NSString)clientBundleIdentifier
{
  return self->_clientBundleIdentifier;
}

- (void)setHasFetchId:(BOOL)a3
{
  self->_hasFetchId = a3;
}

- (BOOL)hasFetchId
{
  return self->_hasFetchId;
}

- (unsigned)fetchId
{
  return self->_fetchId;
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
    if ([(BMPersonalizedSensingMomentsContextContextFetchDetails *)self hasFetchId]
      || [v5 hasFetchId])
    {
      if (![(BMPersonalizedSensingMomentsContextContextFetchDetails *)self hasFetchId]) {
        goto LABEL_30;
      }
      if (![v5 hasFetchId]) {
        goto LABEL_30;
      }
      unsigned int v6 = [(BMPersonalizedSensingMomentsContextContextFetchDetails *)self fetchId];
      if (v6 != [v5 fetchId]) {
        goto LABEL_30;
      }
    }
    v7 = [(BMPersonalizedSensingMomentsContextContextFetchDetails *)self timestamp];
    uint64_t v8 = [v5 timestamp];
    if (v7 == (void *)v8)
    {
    }
    else
    {
      v9 = (void *)v8;
      v10 = [(BMPersonalizedSensingMomentsContextContextFetchDetails *)self timestamp];
      v11 = [v5 timestamp];
      int v12 = [v10 isEqual:v11];

      if (!v12) {
        goto LABEL_30;
      }
    }
    v14 = [(BMPersonalizedSensingMomentsContextContextFetchDetails *)self clientBundleIdentifier];
    uint64_t v15 = [v5 clientBundleIdentifier];
    if (v14 == (void *)v15)
    {
    }
    else
    {
      v16 = (void *)v15;
      v17 = [(BMPersonalizedSensingMomentsContextContextFetchDetails *)self clientBundleIdentifier];
      v18 = [v5 clientBundleIdentifier];
      int v19 = [v17 isEqual:v18];

      if (!v19) {
        goto LABEL_30;
      }
    }
    v20 = [(BMPersonalizedSensingMomentsContextContextFetchDetails *)self alternateClientIdentifier];
    uint64_t v21 = [v5 alternateClientIdentifier];
    if (v20 == (void *)v21)
    {
    }
    else
    {
      v22 = (void *)v21;
      v23 = [(BMPersonalizedSensingMomentsContextContextFetchDetails *)self alternateClientIdentifier];
      v24 = [v5 alternateClientIdentifier];
      int v25 = [v23 isEqual:v24];

      if (!v25) {
        goto LABEL_30;
      }
    }
    if (!-[BMPersonalizedSensingMomentsContextContextFetchDetails hasTotalContextReplyCount](self, "hasTotalContextReplyCount")&& ![v5 hasTotalContextReplyCount]|| -[BMPersonalizedSensingMomentsContextContextFetchDetails hasTotalContextReplyCount](self, "hasTotalContextReplyCount")&& objc_msgSend(v5, "hasTotalContextReplyCount")&& (unsigned int v26 = -[BMPersonalizedSensingMomentsContextContextFetchDetails totalContextReplyCount](self, "totalContextReplyCount"), v26 == objc_msgSend(v5, "totalContextReplyCount")))
    {
      if (!-[BMPersonalizedSensingMomentsContextContextFetchDetails hasBatchContextReplyStartIndex](self, "hasBatchContextReplyStartIndex")&& ![v5 hasBatchContextReplyStartIndex])
      {
        BOOL v13 = 1;
        goto LABEL_31;
      }
      if (-[BMPersonalizedSensingMomentsContextContextFetchDetails hasBatchContextReplyStartIndex](self, "hasBatchContextReplyStartIndex")&& [v5 hasBatchContextReplyStartIndex])
      {
        unsigned int v27 = [(BMPersonalizedSensingMomentsContextContextFetchDetails *)self batchContextReplyStartIndex];
        BOOL v13 = v27 == [v5 batchContextReplyStartIndex];
LABEL_31:

        goto LABEL_32;
      }
    }
LABEL_30:
    BOOL v13 = 0;
    goto LABEL_31;
  }
  BOOL v13 = 0;
LABEL_32:

  return v13;
}

- (NSDate)timestamp
{
  if (self->_hasRaw_timestamp)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_timestamp];
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
  v25[6] = *MEMORY[0x1E4F143B8];
  if ([(BMPersonalizedSensingMomentsContextContextFetchDetails *)self hasFetchId])
  {
    uint64_t v3 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMPersonalizedSensingMomentsContextContextFetchDetails fetchId](self, "fetchId"));
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = [(BMPersonalizedSensingMomentsContextContextFetchDetails *)self timestamp];
  if (v4)
  {
    id v5 = NSNumber;
    unsigned int v6 = [(BMPersonalizedSensingMomentsContextContextFetchDetails *)self timestamp];
    [v6 timeIntervalSince1970];
    uint64_t v7 = objc_msgSend(v5, "numberWithDouble:");
  }
  else
  {
    uint64_t v7 = 0;
  }

  uint64_t v8 = [(BMPersonalizedSensingMomentsContextContextFetchDetails *)self clientBundleIdentifier];
  v9 = [(BMPersonalizedSensingMomentsContextContextFetchDetails *)self alternateClientIdentifier];
  if ([(BMPersonalizedSensingMomentsContextContextFetchDetails *)self hasTotalContextReplyCount])
  {
    v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMPersonalizedSensingMomentsContextContextFetchDetails totalContextReplyCount](self, "totalContextReplyCount"));
  }
  else
  {
    v10 = 0;
  }
  if ([(BMPersonalizedSensingMomentsContextContextFetchDetails *)self hasBatchContextReplyStartIndex])
  {
    v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMPersonalizedSensingMomentsContextContextFetchDetails batchContextReplyStartIndex](self, "batchContextReplyStartIndex"));
  }
  else
  {
    v11 = 0;
  }
  v23 = (void *)v3;
  v24[0] = @"fetchId";
  uint64_t v12 = v3;
  if (!v3)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v20 = v12;
  v22 = (void *)v7;
  v25[0] = v12;
  v24[1] = @"timestamp";
  BOOL v13 = (void *)v7;
  if (!v7)
  {
    BOOL v13 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v12);
  }
  v25[1] = v13;
  v24[2] = @"clientBundleIdentifier";
  v14 = v8;
  if (!v8)
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[2] = v14;
  v24[3] = @"alternateClientIdentifier";
  uint64_t v15 = v9;
  if (!v9)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[3] = v15;
  v24[4] = @"totalContextReplyCount";
  v16 = v10;
  if (!v10)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[4] = v16;
  v24[5] = @"batchContextReplyStartIndex";
  v17 = v11;
  if (!v11)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v25[5] = v17;
  v18 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v25, v24, 6, v20);
  if (v11)
  {
    if (v10) {
      goto LABEL_27;
    }
  }
  else
  {

    if (v10)
    {
LABEL_27:
      if (v9) {
        goto LABEL_28;
      }
LABEL_38:

      if (v8) {
        goto LABEL_29;
      }
      goto LABEL_39;
    }
  }

  if (!v9) {
    goto LABEL_38;
  }
LABEL_28:
  if (v8) {
    goto LABEL_29;
  }
LABEL_39:

LABEL_29:
  if (!v22) {

  }
  if (!v23) {

  }
  return v18;
}

- (BMPersonalizedSensingMomentsContextContextFetchDetails)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v79[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"fetchId"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    uint64_t v9 = [v6 objectForKeyedSubscript:@"timestamp"];
    v65 = (void *)v9;
    if (v9 && (v10 = (void *)v9, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v12 = (objc_class *)MEMORY[0x1E4F1C9C8];
        BOOL v13 = a4;
        id v14 = v10;
        id v15 = [v12 alloc];
        [v14 doubleValue];
        double v17 = v16;

        a4 = v13;
        id v18 = (id)[v15 initWithTimeIntervalSince1970:v17];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v25 = objc_alloc_init(MEMORY[0x1E4F28D48]);
          v11 = [v25 dateFromString:v10];

          goto LABEL_16;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v11 = 0;
            v24 = 0;
            goto LABEL_51;
          }
          v61 = a4;
          id v50 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v51 = *MEMORY[0x1E4F502C8];
          uint64_t v76 = *MEMORY[0x1E4F28568];
          id v28 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"timestamp"];
          id v77 = v28;
          uint64_t v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v77 forKeys:&v76 count:1];
          uint64_t v53 = v51;
          unsigned int v27 = (void *)v52;
          v11 = 0;
          v24 = 0;
          id *v61 = (id)[v50 initWithDomain:v53 code:2 userInfo:v52];
          goto LABEL_50;
        }
        id v18 = v10;
      }
      v11 = v18;
    }
    else
    {
      v11 = 0;
    }
LABEL_16:
    uint64_t v26 = [v6 objectForKeyedSubscript:@"clientBundleIdentifier"];
    id v67 = v8;
    v64 = (void *)v26;
    if (v26 && (unsigned int v27 = (void *)v26, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v24 = 0;
          id v28 = 0;
          goto LABEL_50;
        }
        v57 = a4;
        id v36 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v37 = *MEMORY[0x1E4F502C8];
        uint64_t v74 = *MEMORY[0x1E4F28568];
        id v66 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"clientBundleIdentifier"];
        id v75 = v66;
        v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v75 forKeys:&v74 count:1];
        v24 = 0;
        id *v57 = (id)[v36 initWithDomain:v37 code:2 userInfo:v29];
        id v28 = 0;
LABEL_49:

        id v8 = v67;
        unsigned int v27 = v64;
LABEL_50:

        v10 = v65;
        goto LABEL_51;
      }
      id v28 = v27;
    }
    else
    {
      id v28 = 0;
    }
    v29 = [v6 objectForKeyedSubscript:@"alternateClientIdentifier"];
    if (v29 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v66 = 0;
          v24 = 0;
          goto LABEL_49;
        }
        v58 = a4;
        id v38 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v39 = v28;
        v40 = v11;
        uint64_t v41 = *MEMORY[0x1E4F502C8];
        uint64_t v72 = *MEMORY[0x1E4F28568];
        id v33 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"alternateClientIdentifier"];
        id v73 = v33;
        v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v73 forKeys:&v72 count:1];
        uint64_t v42 = v41;
        v11 = v40;
        id v28 = v39;
        v24 = 0;
        id v66 = 0;
        id *v58 = (id)[v38 initWithDomain:v42 code:2 userInfo:v30];
        goto LABEL_48;
      }
      id v66 = v29;
    }
    else
    {
      id v66 = 0;
    }
    v30 = [v6 objectForKeyedSubscript:@"totalContextReplyCount"];
    id v62 = v28;
    v63 = v7;
    if (v30 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v33 = 0;
          v24 = 0;
          goto LABEL_48;
        }
        v32 = self;
        id v59 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v43 = *MEMORY[0x1E4F502C8];
        uint64_t v70 = *MEMORY[0x1E4F28568];
        v31 = v11;
        v44 = a4;
        a4 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"totalContextReplyCount"];
        v71 = a4;
        v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v71 forKeys:&v70 count:1];
        id v45 = (id)[v59 initWithDomain:v43 code:2 userInfo:v34];
        v24 = 0;
        id v33 = 0;
        id *v44 = v45;
        goto LABEL_46;
      }
      v31 = v11;
      v32 = self;
      id v33 = v30;
    }
    else
    {
      v31 = v11;
      v32 = self;
      id v33 = 0;
    }
    v34 = [v6 objectForKeyedSubscript:@"batchContextReplyStartIndex"];
    if (!v34 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      a4 = 0;
LABEL_28:
      v11 = v31;
      v35 = v31;
      id v28 = v62;
      v24 = [(BMPersonalizedSensingMomentsContextContextFetchDetails *)v32 initWithFetchId:v67 timestamp:v35 clientBundleIdentifier:v62 alternateClientIdentifier:v66 totalContextReplyCount:v33 batchContextReplyStartIndex:a4];
      v32 = v24;
LABEL_47:

      self = v32;
      uint64_t v7 = v63;
LABEL_48:

      goto LABEL_49;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      a4 = v34;
      goto LABEL_28;
    }
    if (a4)
    {
      id v60 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v55 = *MEMORY[0x1E4F502C8];
      uint64_t v68 = *MEMORY[0x1E4F28568];
      v46 = a4;
      v47 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"batchContextReplyStartIndex"];
      v69 = v47;
      v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v69 forKeys:&v68 count:1];
      id *v46 = (id)[v60 initWithDomain:v55 code:2 userInfo:v48];

      a4 = 0;
    }
    v24 = 0;
LABEL_46:
    v11 = v31;
    id v28 = v62;
    goto LABEL_47;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    id v8 = 0;
    v24 = 0;
    goto LABEL_52;
  }
  v56 = a4;
  id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v20 = *MEMORY[0x1E4F502C8];
  uint64_t v78 = *MEMORY[0x1E4F28568];
  uint64_t v21 = v7;
  id v22 = [NSString alloc];
  uint64_t v54 = objc_opt_class();
  v23 = v22;
  uint64_t v7 = v21;
  v11 = (void *)[v23 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v54, @"fetchId"];
  v79[0] = v11;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v79 forKeys:&v78 count:1];
  id v8 = 0;
  v24 = 0;
  id *v56 = (id)[v19 initWithDomain:v20 code:2 userInfo:v10];
LABEL_51:

LABEL_52:
  return v24;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMPersonalizedSensingMomentsContextContextFetchDetails *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasFetchId)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_hasRaw_timestamp)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_clientBundleIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_alternateClientIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasTotalContextReplyCount)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_hasBatchContextReplyStartIndex)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)BMPersonalizedSensingMomentsContextContextFetchDetails;
  id v5 = [(BMEventBase *)&v48 init];
  if (!v5) {
    goto LABEL_67;
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
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          v5->_hasFetchId = 1;
          while (1)
          {
            uint64_t v23 = *v6;
            uint64_t v24 = *(void *)&v4[v23];
            unint64_t v25 = v24 + 1;
            if (v24 == -1 || v25 > *(void *)&v4[*v7]) {
              break;
            }
            char v26 = *(unsigned char *)(*(void *)&v4[*v9] + v24);
            *(void *)&v4[v23] = v25;
            v22 |= (unint64_t)(v26 & 0x7F) << v20;
            if ((v26 & 0x80) == 0) {
              goto LABEL_50;
            }
            v20 += 7;
            BOOL v17 = v21++ >= 9;
            if (v17)
            {
              LODWORD(v22) = 0;
              goto LABEL_52;
            }
          }
          v4[*v8] = 1;
LABEL_50:
          if (v4[*v8]) {
            LODWORD(v22) = 0;
          }
LABEL_52:
          uint64_t v45 = 40;
          goto LABEL_61;
        case 2u:
          v5->_hasRaw_timestamp = 1;
          uint64_t v27 = *v6;
          unint64_t v28 = *(void *)&v4[v27];
          if (v28 <= 0xFFFFFFFFFFFFFFF7 && v28 + 8 <= *(void *)&v4[*v7])
          {
            double v29 = *(double *)(*(void *)&v4[*v9] + v28);
            *(void *)&v4[v27] = v28 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v29 = 0.0;
          }
          v5->_raw_timestamp = v29;
          continue;
        case 3u:
          uint64_t v30 = PBReaderReadString();
          uint64_t v31 = 56;
          goto LABEL_34;
        case 4u:
          uint64_t v30 = PBReaderReadString();
          uint64_t v31 = 64;
LABEL_34:
          v32 = *(Class *)((char *)&v5->super.super.isa + v31);
          *(Class *)((char *)&v5->super.super.isa + v31) = (Class)v30;

          continue;
        case 5u:
          char v33 = 0;
          unsigned int v34 = 0;
          uint64_t v22 = 0;
          v5->_hasTotalContextReplyCount = 1;
          while (2)
          {
            uint64_t v35 = *v6;
            uint64_t v36 = *(void *)&v4[v35];
            unint64_t v37 = v36 + 1;
            if (v36 == -1 || v37 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v38 = *(unsigned char *)(*(void *)&v4[*v9] + v36);
              *(void *)&v4[v35] = v37;
              v22 |= (unint64_t)(v38 & 0x7F) << v33;
              if (v38 < 0)
              {
                v33 += 7;
                BOOL v17 = v34++ >= 9;
                if (v17)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_56;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v22) = 0;
          }
LABEL_56:
          uint64_t v45 = 44;
          goto LABEL_61;
        case 6u:
          char v39 = 0;
          unsigned int v40 = 0;
          uint64_t v22 = 0;
          v5->_hasBatchContextReplyStartIndex = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_66;
          }
          continue;
      }
      while (1)
      {
        uint64_t v41 = *v6;
        uint64_t v42 = *(void *)&v4[v41];
        unint64_t v43 = v42 + 1;
        if (v42 == -1 || v43 > *(void *)&v4[*v7]) {
          break;
        }
        char v44 = *(unsigned char *)(*(void *)&v4[*v9] + v42);
        *(void *)&v4[v41] = v43;
        v22 |= (unint64_t)(v44 & 0x7F) << v39;
        if ((v44 & 0x80) == 0) {
          goto LABEL_58;
        }
        v39 += 7;
        BOOL v17 = v40++ >= 9;
        if (v17)
        {
          LODWORD(v22) = 0;
          goto LABEL_60;
        }
      }
      v4[*v8] = 1;
LABEL_58:
      if (v4[*v8]) {
        LODWORD(v22) = 0;
      }
LABEL_60:
      uint64_t v45 = 48;
LABEL_61:
      *(_DWORD *)((char *)&v5->super.super.isa + v45) = v22;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_66:
  }
    v46 = 0;
  else {
LABEL_67:
  }
    v46 = v5;

  return v46;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMPersonalizedSensingMomentsContextContextFetchDetails fetchId](self, "fetchId"));
  id v5 = [(BMPersonalizedSensingMomentsContextContextFetchDetails *)self timestamp];
  id v6 = [(BMPersonalizedSensingMomentsContextContextFetchDetails *)self clientBundleIdentifier];
  uint64_t v7 = [(BMPersonalizedSensingMomentsContextContextFetchDetails *)self alternateClientIdentifier];
  id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMPersonalizedSensingMomentsContextContextFetchDetails totalContextReplyCount](self, "totalContextReplyCount"));
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMPersonalizedSensingMomentsContextContextFetchDetails batchContextReplyStartIndex](self, "batchContextReplyStartIndex"));
  char v10 = (void *)[v3 initWithFormat:@"BMPersonalizedSensingMomentsContextContextFetchDetails with fetchId: %@, timestamp: %@, clientBundleIdentifier: %@, alternateClientIdentifier: %@, totalContextReplyCount: %@, batchContextReplyStartIndex: %@", v4, v5, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (BMPersonalizedSensingMomentsContextContextFetchDetails)initWithFetchId:(id)a3 timestamp:(id)a4 clientBundleIdentifier:(id)a5 alternateClientIdentifier:(id)a6 totalContextReplyCount:(id)a7 batchContextReplyStartIndex:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v26.receiver = self;
  v26.super_class = (Class)BMPersonalizedSensingMomentsContextContextFetchDetails;
  char v20 = [(BMEventBase *)&v26 init];
  if (v20)
  {
    v20->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v14)
    {
      v20->_hasFetchId = 1;
      unsigned int v21 = [v14 unsignedIntValue];
    }
    else
    {
      unsigned int v21 = 0;
      v20->_hasFetchId = 0;
    }
    v20->_fetchId = v21;
    if (v15)
    {
      v20->_hasRaw_timestamp = 1;
      [v15 timeIntervalSince1970];
    }
    else
    {
      v20->_hasRaw_timestamp = 0;
      double v22 = -1.0;
    }
    v20->_raw_timestamp = v22;
    objc_storeStrong((id *)&v20->_clientBundleIdentifier, a5);
    objc_storeStrong((id *)&v20->_alternateClientIdentifier, a6);
    if (v18)
    {
      v20->_hasTotalContextReplyCount = 1;
      unsigned int v23 = [v18 unsignedIntValue];
    }
    else
    {
      unsigned int v23 = 0;
      v20->_hasTotalContextReplyCount = 0;
    }
    v20->_totalContextReplyCount = v23;
    if (v19)
    {
      v20->_hasBatchContextReplyStartIndex = 1;
      unsigned int v24 = [v19 unsignedIntValue];
    }
    else
    {
      unsigned int v24 = 0;
      v20->_hasBatchContextReplyStartIndex = 0;
    }
    v20->_batchContextReplyStartIndex = v24;
  }

  return v20;
}

+ (id)protoFields
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"fetchId" number:1 type:4 subMessageClass:0];
  v10[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"timestamp" number:2 type:0 subMessageClass:0];
  v10[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clientBundleIdentifier" number:3 type:13 subMessageClass:0];
  v10[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"alternateClientIdentifier" number:4 type:13 subMessageClass:0];
  v10[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"totalContextReplyCount" number:5 type:4 subMessageClass:0];
  v10[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"batchContextReplyStartIndex" number:6 type:4 subMessageClass:0];
  v10[5] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF6CF0;
}

+ (id)columns
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"fetchId" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:4 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"timestamp" dataType:3 requestOnly:0 fieldNumber:2 protoDataType:0 convertedType:2];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clientBundleIdentifier" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"alternateClientIdentifier" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"totalContextReplyCount" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:4 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"batchContextReplyStartIndex" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:4 convertedType:0];
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v4;
  v10[3] = v5;
  v10[4] = v6;
  v10[5] = v7;
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

    id v8 = [[BMPersonalizedSensingMomentsContextContextFetchDetails alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[9] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end