@interface BMMailCategorizationAnalyticsRecategorize
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMailCategorizationAnalyticsRecategorize)initWithAccountId:(id)a3 messageId:(id)a4 currCategoryView:(id)a5 recategorizationBy:(id)a6 recategorizeTimestamp:(id)a7;
- (BMMailCategorizationAnalyticsRecategorize)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasCurrCategoryView;
- (BOOL)hasMessageId;
- (BOOL)hasRecategorizationBy;
- (BOOL)hasRecategorizeTimestamp;
- (BOOL)isEqual:(id)a3;
- (NSString)accountId;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)currCategoryView;
- (int)messageId;
- (int)recategorizationBy;
- (int)recategorizeTimestamp;
- (unsigned)dataVersion;
- (void)setHasCurrCategoryView:(BOOL)a3;
- (void)setHasMessageId:(BOOL)a3;
- (void)setHasRecategorizationBy:(BOOL)a3;
- (void)setHasRecategorizeTimestamp:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMMailCategorizationAnalyticsRecategorize

- (void).cxx_destruct
{
}

- (void)setHasRecategorizeTimestamp:(BOOL)a3
{
  self->_hasRecategorizeTimestamp = a3;
}

- (BOOL)hasRecategorizeTimestamp
{
  return self->_hasRecategorizeTimestamp;
}

- (int)recategorizeTimestamp
{
  return self->_recategorizeTimestamp;
}

- (void)setHasRecategorizationBy:(BOOL)a3
{
  self->_hasRecategorizationBy = a3;
}

- (BOOL)hasRecategorizationBy
{
  return self->_hasRecategorizationBy;
}

- (int)recategorizationBy
{
  return self->_recategorizationBy;
}

- (void)setHasCurrCategoryView:(BOOL)a3
{
  self->_hasCurrCategoryView = a3;
}

- (BOOL)hasCurrCategoryView
{
  return self->_hasCurrCategoryView;
}

- (int)currCategoryView
{
  return self->_currCategoryView;
}

- (void)setHasMessageId:(BOOL)a3
{
  self->_hasMessageId = a3;
}

- (BOOL)hasMessageId
{
  return self->_hasMessageId;
}

- (int)messageId
{
  return self->_messageId;
}

- (NSString)accountId
{
  return self->_accountId;
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
    v6 = [(BMMailCategorizationAnalyticsRecategorize *)self accountId];
    uint64_t v7 = [v5 accountId];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMMailCategorizationAnalyticsRecategorize *)self accountId];
      v10 = [v5 accountId];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_27;
      }
    }
    if (![(BMMailCategorizationAnalyticsRecategorize *)self hasMessageId]
      && ![v5 hasMessageId]
      || [(BMMailCategorizationAnalyticsRecategorize *)self hasMessageId]
      && [v5 hasMessageId]
      && (int v13 = [(BMMailCategorizationAnalyticsRecategorize *)self messageId],
          v13 == [v5 messageId]))
    {
      if (![(BMMailCategorizationAnalyticsRecategorize *)self hasCurrCategoryView]
        && ![v5 hasCurrCategoryView]
        || [(BMMailCategorizationAnalyticsRecategorize *)self hasCurrCategoryView]
        && [v5 hasCurrCategoryView]
        && (int v14 = [(BMMailCategorizationAnalyticsRecategorize *)self currCategoryView],
            v14 == [v5 currCategoryView]))
      {
        if (![(BMMailCategorizationAnalyticsRecategorize *)self hasRecategorizationBy]
          && ![v5 hasRecategorizationBy]
          || [(BMMailCategorizationAnalyticsRecategorize *)self hasRecategorizationBy]
          && [v5 hasRecategorizationBy]
          && (int v15 = [(BMMailCategorizationAnalyticsRecategorize *)self recategorizationBy],
              v15 == [v5 recategorizationBy]))
        {
          if (![(BMMailCategorizationAnalyticsRecategorize *)self hasRecategorizeTimestamp]
            && ![v5 hasRecategorizeTimestamp])
          {
            BOOL v12 = 1;
            goto LABEL_28;
          }
          if ([(BMMailCategorizationAnalyticsRecategorize *)self hasRecategorizeTimestamp]
            && [v5 hasRecategorizeTimestamp])
          {
            int v16 = [(BMMailCategorizationAnalyticsRecategorize *)self recategorizeTimestamp];
            BOOL v12 = v16 == [v5 recategorizeTimestamp];
LABEL_28:

            goto LABEL_29;
          }
        }
      }
    }
LABEL_27:
    BOOL v12 = 0;
    goto LABEL_28;
  }
  BOOL v12 = 0;
LABEL_29:

  return v12;
}

- (id)jsonDictionary
{
  v18[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMMailCategorizationAnalyticsRecategorize *)self accountId];
  if ([(BMMailCategorizationAnalyticsRecategorize *)self hasMessageId])
  {
    id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMailCategorizationAnalyticsRecategorize messageId](self, "messageId"));
  }
  else
  {
    id v4 = 0;
  }
  if ([(BMMailCategorizationAnalyticsRecategorize *)self hasCurrCategoryView])
  {
    id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMailCategorizationAnalyticsRecategorize currCategoryView](self, "currCategoryView"));
  }
  else
  {
    id v5 = 0;
  }
  if ([(BMMailCategorizationAnalyticsRecategorize *)self hasRecategorizationBy])
  {
    v6 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMailCategorizationAnalyticsRecategorize recategorizationBy](self, "recategorizationBy"));
  }
  else
  {
    v6 = 0;
  }
  if ([(BMMailCategorizationAnalyticsRecategorize *)self hasRecategorizeTimestamp])
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMailCategorizationAnalyticsRecategorize recategorizeTimestamp](self, "recategorizeTimestamp"));
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v15 = v3;
  v17[0] = @"accountId";
  v8 = (void *)v3;
  if (!v3)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[0] = v8;
  v17[1] = @"messageId";
  v9 = v4;
  if (!v4)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[1] = v9;
  v17[2] = @"currCategoryView";
  v10 = v5;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[2] = v10;
  v17[3] = @"recategorizationBy";
  int v11 = v6;
  if (!v6)
  {
    int v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[3] = v11;
  v17[4] = @"recategorizeTimestamp";
  BOOL v12 = v7;
  if (!v7)
  {
    BOOL v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[4] = v12;
  int v13 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v18, v17, 5, v15);
  if (v7)
  {
    if (v6) {
      goto LABEL_25;
    }
  }
  else
  {

    if (v6)
    {
LABEL_25:
      if (v5) {
        goto LABEL_26;
      }
LABEL_34:

      if (v4) {
        goto LABEL_27;
      }
      goto LABEL_35;
    }
  }

  if (!v5) {
    goto LABEL_34;
  }
LABEL_26:
  if (v4) {
    goto LABEL_27;
  }
LABEL_35:

LABEL_27:
  if (!v16) {

  }
  return v13;
}

- (BMMailCategorizationAnalyticsRecategorize)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"accountId"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"messageId"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v38 = 0;
          int v16 = 0;
          goto LABEL_20;
        }
        v32 = a4;
        id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v22 = *MEMORY[0x1E4F502C8];
        uint64_t v45 = *MEMORY[0x1E4F28568];
        id v36 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"messageId"];
        id v46 = v36;
        v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
        int v16 = 0;
        id v38 = 0;
        id *v32 = (id)[v21 initWithDomain:v22 code:2 userInfo:v10];
        goto LABEL_19;
      }
      id v38 = v9;
    }
    else
    {
      id v38 = 0;
    }
    v10 = [v6 objectForKeyedSubscript:@"currCategoryView"];
    id v35 = v8;
    v37 = self;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v36 = 0;
          int v16 = 0;
          goto LABEL_19;
        }
        v23 = a4;
        id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v25 = *MEMORY[0x1E4F502C8];
        uint64_t v43 = *MEMORY[0x1E4F28568];
        id v13 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"currCategoryView"];
        id v44 = v13;
        int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
        int v16 = 0;
        id v36 = 0;
        id *v23 = (id)[v24 initWithDomain:v25 code:2 userInfo:v11];
LABEL_18:

        self = v37;
        id v8 = v35;
LABEL_19:

        goto LABEL_20;
      }
      id v36 = v10;
    }
    else
    {
      id v36 = 0;
    }
    int v11 = [v6 objectForKeyedSubscript:@"recategorizationBy"];
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v13 = 0;
          int v16 = 0;
          goto LABEL_18;
        }
        id v33 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v26 = *MEMORY[0x1E4F502C8];
        uint64_t v41 = *MEMORY[0x1E4F28568];
        v27 = a4;
        id v15 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"recategorizationBy"];
        id v42 = v15;
        int v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
        id v28 = (id)[v33 initWithDomain:v26 code:2 userInfo:v14];
        int v16 = 0;
        id v13 = 0;
        id *v27 = v28;
        goto LABEL_17;
      }
      BOOL v12 = a4;
      id v13 = v11;
    }
    else
    {
      BOOL v12 = a4;
      id v13 = 0;
    }
    int v14 = [v6 objectForKeyedSubscript:@"recategorizeTimestamp"];
    if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v12)
        {
          id v34 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v31 = *MEMORY[0x1E4F502C8];
          uint64_t v39 = *MEMORY[0x1E4F28568];
          v29 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"recategorizeTimestamp"];
          v40 = v29;
          v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
          *BOOL v12 = (id)[v34 initWithDomain:v31 code:2 userInfo:v30];
        }
        id v15 = 0;
        int v16 = 0;
        goto LABEL_17;
      }
      id v15 = v14;
    }
    else
    {
      id v15 = 0;
    }
    int v16 = [(BMMailCategorizationAnalyticsRecategorize *)v37 initWithAccountId:v35 messageId:v38 currCategoryView:v36 recategorizationBy:v13 recategorizeTimestamp:v15];
    v37 = v16;
LABEL_17:

    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    int v16 = 0;
    id v8 = 0;
    goto LABEL_21;
  }
  v18 = a4;
  id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v20 = *MEMORY[0x1E4F502C8];
  uint64_t v47 = *MEMORY[0x1E4F28568];
  id v38 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"accountId"];
  v48[0] = v38;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:&v47 count:1];
  int v16 = 0;
  id v8 = 0;
  id *v18 = (id)[v19 initWithDomain:v20 code:2 userInfo:v9];
LABEL_20:

LABEL_21:
  return v16;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMMailCategorizationAnalyticsRecategorize *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_accountId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasMessageId)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasCurrCategoryView)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasRecategorizationBy)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasRecategorizeTimestamp)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)BMMailCategorizationAnalyticsRecategorize;
  id v5 = [(BMEventBase *)&v45 init];
  if (!v5) {
    goto LABEL_71;
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
          uint64_t v19 = PBReaderReadString();
          accountId = v5->_accountId;
          v5->_accountId = (NSString *)v19;

          continue;
        case 2u:
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          v5->_hasMessageId = 1;
          while (1)
          {
            uint64_t v24 = *v6;
            unint64_t v25 = *(void *)&v4[v24];
            if (v25 == -1 || v25 >= *(void *)&v4[*v7]) {
              break;
            }
            char v26 = *(unsigned char *)(*(void *)&v4[*v9] + v25);
            *(void *)&v4[v24] = v25 + 1;
            v23 |= (unint64_t)(v26 & 0x7F) << v21;
            if ((v26 & 0x80) == 0) {
              goto LABEL_52;
            }
            v21 += 7;
            BOOL v16 = v22++ >= 9;
            if (v16)
            {
              LODWORD(v23) = 0;
              goto LABEL_54;
            }
          }
          v4[*v8] = 1;
LABEL_52:
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_54:
          uint64_t v42 = 24;
          goto LABEL_67;
        case 3u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v23 = 0;
          v5->_hasCurrCategoryView = 1;
          while (2)
          {
            uint64_t v29 = *v6;
            unint64_t v30 = *(void *)&v4[v29];
            if (v30 == -1 || v30 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v31 = *(unsigned char *)(*(void *)&v4[*v9] + v30);
              *(void *)&v4[v29] = v30 + 1;
              v23 |= (unint64_t)(v31 & 0x7F) << v27;
              if (v31 < 0)
              {
                v27 += 7;
                BOOL v16 = v28++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_58;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_58:
          uint64_t v42 = 28;
          goto LABEL_67;
        case 4u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v23 = 0;
          v5->_hasRecategorizationBy = 1;
          while (2)
          {
            uint64_t v34 = *v6;
            unint64_t v35 = *(void *)&v4[v34];
            if (v35 == -1 || v35 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v36 = *(unsigned char *)(*(void *)&v4[*v9] + v35);
              *(void *)&v4[v34] = v35 + 1;
              v23 |= (unint64_t)(v36 & 0x7F) << v32;
              if (v36 < 0)
              {
                v32 += 7;
                BOOL v16 = v33++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_62;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_62:
          uint64_t v42 = 32;
          goto LABEL_67;
        case 5u:
          char v37 = 0;
          unsigned int v38 = 0;
          uint64_t v23 = 0;
          v5->_hasRecategorizeTimestamp = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_70;
          }
          continue;
      }
      while (1)
      {
        uint64_t v39 = *v6;
        unint64_t v40 = *(void *)&v4[v39];
        if (v40 == -1 || v40 >= *(void *)&v4[*v7]) {
          break;
        }
        char v41 = *(unsigned char *)(*(void *)&v4[*v9] + v40);
        *(void *)&v4[v39] = v40 + 1;
        v23 |= (unint64_t)(v41 & 0x7F) << v37;
        if ((v41 & 0x80) == 0) {
          goto LABEL_64;
        }
        v37 += 7;
        BOOL v16 = v38++ >= 9;
        if (v16)
        {
          LODWORD(v23) = 0;
          goto LABEL_66;
        }
      }
      v4[*v8] = 1;
LABEL_64:
      if (v4[*v8]) {
        LODWORD(v23) = 0;
      }
LABEL_66:
      uint64_t v42 = 36;
LABEL_67:
      *(_DWORD *)((char *)&v5->super.super.isa + v42) = v23;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_70:
  }
    uint64_t v43 = 0;
  else {
LABEL_71:
  }
    uint64_t v43 = v5;

  return v43;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMMailCategorizationAnalyticsRecategorize *)self accountId];
  id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMailCategorizationAnalyticsRecategorize messageId](self, "messageId"));
  id v6 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMailCategorizationAnalyticsRecategorize currCategoryView](self, "currCategoryView"));
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMailCategorizationAnalyticsRecategorize recategorizationBy](self, "recategorizationBy"));
  id v8 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMailCategorizationAnalyticsRecategorize recategorizeTimestamp](self, "recategorizeTimestamp"));
  v9 = (void *)[v3 initWithFormat:@"BMMailCategorizationAnalyticsRecategorize with accountId: %@, messageId: %@, currCategoryView: %@, recategorizationBy: %@, recategorizeTimestamp: %@", v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (BMMailCategorizationAnalyticsRecategorize)initWithAccountId:(id)a3 messageId:(id)a4 currCategoryView:(id)a5 recategorizationBy:(id)a6 recategorizeTimestamp:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v24.receiver = self;
  v24.super_class = (Class)BMMailCategorizationAnalyticsRecategorize;
  v18 = [(BMEventBase *)&v24 init];
  if (v18)
  {
    v18->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v18->_accountId, a3);
    if (v14)
    {
      v18->_hasMessageId = 1;
      int v19 = [v14 intValue];
    }
    else
    {
      v18->_hasMessageId = 0;
      int v19 = -1;
    }
    v18->_messageId = v19;
    if (v15)
    {
      v18->_hasCurrCategoryView = 1;
      int v20 = [v15 intValue];
    }
    else
    {
      v18->_hasCurrCategoryView = 0;
      int v20 = -1;
    }
    v18->_currCategoryView = v20;
    if (v16)
    {
      v18->_hasRecategorizationBy = 1;
      int v21 = [v16 intValue];
    }
    else
    {
      v18->_hasRecategorizationBy = 0;
      int v21 = -1;
    }
    v18->_recategorizationBy = v21;
    if (v17)
    {
      v18->_hasRecategorizeTimestamp = 1;
      int v22 = [v17 intValue];
    }
    else
    {
      v18->_hasRecategorizeTimestamp = 0;
      int v22 = -1;
    }
    v18->_recategorizeTimestamp = v22;
  }

  return v18;
}

+ (id)protoFields
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"accountId" number:1 type:13 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"messageId", 2, 2, 0, v2);
  v9[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"currCategoryView" number:3 type:2 subMessageClass:0];
  v9[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"recategorizationBy" number:4 type:2 subMessageClass:0];
  v9[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"recategorizeTimestamp" number:5 type:2 subMessageClass:0];
  v9[4] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF7608;
}

+ (id)columns
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"accountId" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"messageId" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:2 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"currCategoryView" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:2 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"recategorizationBy" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:2 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"recategorizeTimestamp" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:2 convertedType:0];
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  v9[4] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
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

    id v8 = [[BMMailCategorizationAnalyticsRecategorize alloc] initByReadFrom:v7];
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