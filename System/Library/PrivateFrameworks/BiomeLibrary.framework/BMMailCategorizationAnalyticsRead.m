@interface BMMailCategorizationAnalyticsRead
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMailCategorizationAnalyticsRead)initWithAccountId:(id)a3 messageId:(id)a4 readTimestamp:(id)a5 readWithCategoriesEnabled:(id)a6;
- (BMMailCategorizationAnalyticsRead)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMMailCategorizationAnalyticsRead)readWithCategoriesEnabled;
- (BOOL)hasMessageId;
- (BOOL)hasReadTimestamp;
- (BOOL)hasReadWithCategoriesEnabled;
- (BOOL)isEqual:(id)a3;
- (NSString)accountId;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)messageId;
- (int)readTimestamp;
- (unsigned)dataVersion;
- (void)setHasMessageId:(BOOL)a3;
- (void)setHasReadTimestamp:(BOOL)a3;
- (void)setHasReadWithCategoriesEnabled:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMMailCategorizationAnalyticsRead

- (void).cxx_destruct
{
}

- (void)setHasReadWithCategoriesEnabled:(BOOL)a3
{
  self->_hasReadWithCategoriesEnabled = a3;
}

- (BOOL)hasReadWithCategoriesEnabled
{
  return self->_hasReadWithCategoriesEnabled;
}

- (BMMailCategorizationAnalyticsRead)readWithCategoriesEnabled
{
  return (BMMailCategorizationAnalyticsRead *)self->_readWithCategoriesEnabled;
}

- (void)setHasReadTimestamp:(BOOL)a3
{
  self->_hasReadTimestamp = a3;
}

- (BOOL)hasReadTimestamp
{
  return self->_hasReadTimestamp;
}

- (int)readTimestamp
{
  return self->_readTimestamp;
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
    v6 = [(BMMailCategorizationAnalyticsRead *)self accountId];
    uint64_t v7 = [v5 accountId];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMMailCategorizationAnalyticsRead *)self accountId];
      v10 = [v5 accountId];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_22;
      }
    }
    if (![(BMMailCategorizationAnalyticsRead *)self hasMessageId]
      && ![v5 hasMessageId]
      || [(BMMailCategorizationAnalyticsRead *)self hasMessageId]
      && [v5 hasMessageId]
      && (int v13 = [(BMMailCategorizationAnalyticsRead *)self messageId],
          v13 == [v5 messageId]))
    {
      if (![(BMMailCategorizationAnalyticsRead *)self hasReadTimestamp]
        && ![v5 hasReadTimestamp]
        || [(BMMailCategorizationAnalyticsRead *)self hasReadTimestamp]
        && [v5 hasReadTimestamp]
        && (int v14 = [(BMMailCategorizationAnalyticsRead *)self readTimestamp],
            v14 == [v5 readTimestamp]))
      {
        if (![(BMMailCategorizationAnalyticsRead *)self hasReadWithCategoriesEnabled]
          && ![v5 hasReadWithCategoriesEnabled])
        {
          LOBYTE(v12) = 1;
          goto LABEL_23;
        }
        if ([(BMMailCategorizationAnalyticsRead *)self hasReadWithCategoriesEnabled]
          && [v5 hasReadWithCategoriesEnabled])
        {
          int v15 = (int)[(BMMailCategorizationAnalyticsRead *)self readWithCategoriesEnabled];
          int v12 = v15 ^ [v5 readWithCategoriesEnabled] ^ 1;
LABEL_23:

          goto LABEL_24;
        }
      }
    }
LABEL_22:
    LOBYTE(v12) = 0;
    goto LABEL_23;
  }
  LOBYTE(v12) = 0;
LABEL_24:

  return v12;
}

- (id)jsonDictionary
{
  v14[4] = *MEMORY[0x1E4F143B8];
  v3 = [(BMMailCategorizationAnalyticsRead *)self accountId];
  if ([(BMMailCategorizationAnalyticsRead *)self hasMessageId])
  {
    id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMailCategorizationAnalyticsRead messageId](self, "messageId"));
  }
  else
  {
    id v4 = 0;
  }
  if ([(BMMailCategorizationAnalyticsRead *)self hasReadTimestamp])
  {
    id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMailCategorizationAnalyticsRead readTimestamp](self, "readTimestamp"));
  }
  else
  {
    id v5 = 0;
  }
  if ([(BMMailCategorizationAnalyticsRead *)self hasReadWithCategoriesEnabled])
  {
    v6 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMailCategorizationAnalyticsRead readWithCategoriesEnabled](self, "readWithCategoriesEnabled"));
  }
  else
  {
    v6 = 0;
  }
  v13[0] = @"accountId";
  uint64_t v7 = v3;
  if (!v3)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[0] = v7;
  v13[1] = @"messageId";
  v8 = v4;
  if (!v4)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[1] = v8;
  v13[2] = @"readTimestamp";
  v9 = v5;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[2] = v9;
  v13[3] = @"readWithCategoriesEnabled";
  v10 = v6;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[3] = v10;
  int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];
  if (v6)
  {
    if (v5) {
      goto LABEL_20;
    }
  }
  else
  {

    if (v5)
    {
LABEL_20:
      if (v4) {
        goto LABEL_21;
      }
LABEL_27:

      if (v3) {
        goto LABEL_22;
      }
      goto LABEL_28;
    }
  }

  if (!v4) {
    goto LABEL_27;
  }
LABEL_21:
  if (v3) {
    goto LABEL_22;
  }
LABEL_28:

LABEL_22:

  return v11;
}

- (BMMailCategorizationAnalyticsRead)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"accountId"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"messageId"];
    v32 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          int v15 = 0;
          goto LABEL_35;
        }
        id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
        v20 = a4;
        uint64_t v21 = *MEMORY[0x1E4F502C8];
        uint64_t v37 = *MEMORY[0x1E4F28568];
        id v12 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"messageId"];
        id v38 = v12;
        v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
        id v22 = (id)[v19 initWithDomain:v21 code:2 userInfo:v10];
        int v15 = 0;
        a4 = 0;
        id *v20 = v22;
        goto LABEL_33;
      }
      v31 = v9;
    }
    else
    {
      v31 = 0;
    }
    v10 = [v6 objectForKeyedSubscript:@"readTimestamp"];
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v12 = 0;
          int v15 = 0;
          a4 = v31;
          goto LABEL_34;
        }
        int v11 = self;
        id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v23 = *MEMORY[0x1E4F502C8];
        uint64_t v35 = *MEMORY[0x1E4F28568];
        id v14 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"readTimestamp"];
        id v36 = v14;
        int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
        id v24 = (id)[v29 initWithDomain:v23 code:2 userInfo:v13];
        int v15 = 0;
        id v12 = 0;
        *a4 = v24;
        goto LABEL_31;
      }
      int v11 = self;
      id v12 = v10;
    }
    else
    {
      int v11 = self;
      id v12 = 0;
    }
    int v13 = [v6 objectForKeyedSubscript:@"readWithCategoriesEnabled"];
    if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v14 = 0;
LABEL_13:
      a4 = v31;
      int v15 = [(BMMailCategorizationAnalyticsRead *)v11 initWithAccountId:v8 messageId:v31 readTimestamp:v12 readWithCategoriesEnabled:v14];
      int v11 = v15;
LABEL_32:

      self = v11;
LABEL_33:
      uint64_t v7 = v32;
LABEL_34:

      goto LABEL_35;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = v13;
      goto LABEL_13;
    }
    if (a4)
    {
      id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v28 = *MEMORY[0x1E4F502C8];
      uint64_t v33 = *MEMORY[0x1E4F28568];
      v25 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"readWithCategoriesEnabled"];
      v34 = v25;
      v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      *a4 = (id)[v30 initWithDomain:v28 code:2 userInfo:v26];
    }
    id v14 = 0;
    int v15 = 0;
LABEL_31:
    a4 = v31;
    goto LABEL_32;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    int v15 = 0;
    id v8 = 0;
    goto LABEL_36;
  }
  id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v17 = *MEMORY[0x1E4F502C8];
  uint64_t v39 = *MEMORY[0x1E4F28568];
  v18 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"accountId"];
  v40[0] = v18;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
  int v15 = 0;
  id v8 = 0;
  *a4 = (id)[v16 initWithDomain:v17 code:2 userInfo:v9];
  a4 = v18;
LABEL_35:

LABEL_36:
  return v15;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMMailCategorizationAnalyticsRead *)self writeTo:v3];
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
  if (self->_hasReadTimestamp)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_hasReadWithCategoriesEnabled)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)BMMailCategorizationAnalyticsRead;
  id v5 = [(BMEventBase *)&v41 init];
  if (!v5) {
    goto LABEL_60;
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
              goto LABEL_45;
            }
            v21 += 7;
            BOOL v16 = v22++ >= 9;
            if (v16)
            {
              LODWORD(v23) = 0;
              goto LABEL_47;
            }
          }
          v4[*v8] = 1;
LABEL_45:
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_47:
          uint64_t v38 = 24;
          goto LABEL_52;
        case 3u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v23 = 0;
          v5->_hasReadTimestamp = 1;
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
                  goto LABEL_51;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_51:
          uint64_t v38 = 28;
LABEL_52:
          *(_DWORD *)((char *)&v5->super.super.isa + v38) = v23;
          continue;
        case 4u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v34 = 0;
          v5->_hasReadWithCategoriesEnabled = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_59;
          }
          continue;
      }
      while (1)
      {
        uint64_t v35 = *v6;
        unint64_t v36 = *(void *)&v4[v35];
        if (v36 == -1 || v36 >= *(void *)&v4[*v7]) {
          break;
        }
        char v37 = *(unsigned char *)(*(void *)&v4[*v9] + v36);
        *(void *)&v4[v35] = v36 + 1;
        v34 |= (unint64_t)(v37 & 0x7F) << v32;
        if ((v37 & 0x80) == 0) {
          goto LABEL_54;
        }
        v32 += 7;
        BOOL v16 = v33++ >= 9;
        if (v16)
        {
          uint64_t v34 = 0;
          goto LABEL_56;
        }
      }
      v4[*v8] = 1;
LABEL_54:
      if (v4[*v8]) {
        uint64_t v34 = 0;
      }
LABEL_56:
      v5->_readWithCategoriesEnabled = v34 != 0;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_59:
  }
    uint64_t v39 = 0;
  else {
LABEL_60:
  }
    uint64_t v39 = v5;

  return v39;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMMailCategorizationAnalyticsRead *)self accountId];
  id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMailCategorizationAnalyticsRead messageId](self, "messageId"));
  id v6 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMailCategorizationAnalyticsRead readTimestamp](self, "readTimestamp"));
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[BMMailCategorizationAnalyticsRead readWithCategoriesEnabled](self, "readWithCategoriesEnabled"));
  id v8 = (void *)[v3 initWithFormat:@"BMMailCategorizationAnalyticsRead with accountId: %@, messageId: %@, readTimestamp: %@, readWithCategoriesEnabled: %@", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (BMMailCategorizationAnalyticsRead)initWithAccountId:(id)a3 messageId:(id)a4 readTimestamp:(id)a5 readWithCategoriesEnabled:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)BMMailCategorizationAnalyticsRead;
  char v15 = [(BMEventBase *)&v19 init];
  if (v15)
  {
    v15->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v15->_accountId, a3);
    if (v12)
    {
      v15->_hasMessageId = 1;
      int v16 = [v12 intValue];
    }
    else
    {
      v15->_hasMessageId = 0;
      int v16 = -1;
    }
    v15->_messageId = v16;
    if (v13)
    {
      v15->_hasReadTimestamp = 1;
      int v17 = [v13 intValue];
    }
    else
    {
      v15->_hasReadTimestamp = 0;
      int v17 = -1;
    }
    v15->_readTimestamp = v17;
    if (v14)
    {
      v15->_hasReadWithCategoriesEnabled = 1;
      v15->_readWithCategoriesEnabled = [v14 BOOLValue];
    }
    else
    {
      v15->_hasReadWithCategoriesEnabled = 0;
      v15->_readWithCategoriesEnabled = 0;
    }
  }

  return v15;
}

+ (id)protoFields
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"accountId" number:1 type:13 subMessageClass:0];
  v8[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"messageId" number:2 type:2 subMessageClass:0];
  v8[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"readTimestamp" number:3 type:2 subMessageClass:0];
  v8[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"readWithCategoriesEnabled" number:4 type:12 subMessageClass:0];
  v8[3] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF75F0;
}

+ (id)columns
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"accountId" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"messageId" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:2 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"readTimestamp" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:2 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"readWithCategoriesEnabled" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:12 convertedType:0];
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  v8[3] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
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

    id v8 = [[BMMailCategorizationAnalyticsRead alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      void v8[5] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end