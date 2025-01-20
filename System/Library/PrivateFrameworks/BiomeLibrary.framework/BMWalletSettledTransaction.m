@interface BMWalletSettledTransaction
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMWalletSettledTransaction)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMWalletSettledTransaction)initWithPassUniqueID:(id)a3 transactionID:(id)a4 merchantType:(int)a5 geoPOICategory:(id)a6;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)geoPOICategory;
- (NSString)passUniqueID;
- (NSString)transactionID;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)merchantType;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMWalletSettledTransaction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geoPOICategory, 0);
  objc_storeStrong((id *)&self->_transactionID, 0);

  objc_storeStrong((id *)&self->_passUniqueID, 0);
}

- (NSString)geoPOICategory
{
  return self->_geoPOICategory;
}

- (int)merchantType
{
  return self->_merchantType;
}

- (NSString)transactionID
{
  return self->_transactionID;
}

- (NSString)passUniqueID
{
  return self->_passUniqueID;
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
    v6 = [(BMWalletSettledTransaction *)self passUniqueID];
    uint64_t v7 = [v5 passUniqueID];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMWalletSettledTransaction *)self passUniqueID];
      v10 = [v5 passUniqueID];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_14;
      }
    }
    v13 = [(BMWalletSettledTransaction *)self transactionID];
    uint64_t v14 = [v5 transactionID];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMWalletSettledTransaction *)self transactionID];
      v17 = [v5 transactionID];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_14;
      }
    }
    int v19 = [(BMWalletSettledTransaction *)self merchantType];
    if (v19 == [v5 merchantType])
    {
      v20 = [(BMWalletSettledTransaction *)self geoPOICategory];
      v21 = [v5 geoPOICategory];
      if (v20 == v21)
      {
        char v12 = 1;
      }
      else
      {
        v22 = [(BMWalletSettledTransaction *)self geoPOICategory];
        v23 = [v5 geoPOICategory];
        char v12 = [v22 isEqual:v23];
      }
      goto LABEL_17;
    }
LABEL_14:
    char v12 = 0;
LABEL_17:

    goto LABEL_18;
  }
  char v12 = 0;
LABEL_18:

  return v12;
}

- (id)jsonDictionary
{
  v14[4] = *MEMORY[0x1E4F143B8];
  v3 = [(BMWalletSettledTransaction *)self passUniqueID];
  id v4 = [(BMWalletSettledTransaction *)self transactionID];
  id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMWalletSettledTransaction merchantType](self, "merchantType"));
  v6 = [(BMWalletSettledTransaction *)self geoPOICategory];
  v13[0] = @"passUniqueID";
  uint64_t v7 = v3;
  if (!v3)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[0] = v7;
  v13[1] = @"transactionID";
  v8 = v4;
  if (!v4)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[1] = v8;
  v13[2] = @"merchantType";
  v9 = v5;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[2] = v9;
  v13[3] = @"geoPOICategory";
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
      goto LABEL_11;
    }
  }
  else
  {

    if (v5)
    {
LABEL_11:
      if (v4) {
        goto LABEL_12;
      }
LABEL_18:

      if (v3) {
        goto LABEL_13;
      }
      goto LABEL_19;
    }
  }

  if (!v4) {
    goto LABEL_18;
  }
LABEL_12:
  if (v3) {
    goto LABEL_13;
  }
LABEL_19:

LABEL_13:

  return v11;
}

- (BMWalletSettledTransaction)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v42[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"passUniqueID"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"transactionID"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v33 = 0;
          v17 = 0;
          goto LABEL_29;
        }
        id v34 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v18 = *MEMORY[0x1E4F502C8];
        uint64_t v39 = *MEMORY[0x1E4F28568];
        int v19 = v7;
        v20 = a4;
        v13 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"transactionID"];
        v40 = v13;
        v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
        id v21 = (id)[v34 initWithDomain:v18 code:2 userInfo:v10];
        id v33 = 0;
        v17 = 0;
        id *v20 = v21;
        uint64_t v7 = v19;
        goto LABEL_28;
      }
      id v33 = v9;
    }
    else
    {
      id v33 = 0;
    }
    v32 = v7;
    v10 = [v6 objectForKeyedSubscript:@"merchantType"];
    int v11 = a4;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      char v12 = self;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = v10;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v13 = 0;
            v17 = 0;
            uint64_t v7 = v32;
            goto LABEL_28;
          }
          id v31 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v27 = *MEMORY[0x1E4F502C8];
          uint64_t v37 = *MEMORY[0x1E4F28568];
          id v23 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"merchantType"];
          id v38 = v23;
          v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
          id v28 = (id)[v31 initWithDomain:v27 code:2 userInfo:v22];
          v13 = 0;
          v17 = 0;
          *int v11 = v28;
          goto LABEL_27;
        }
        id v14 = [NSNumber numberWithInt:BMWalletSettledTransactionMerchantTypeFromString(v10)];
      }
      v13 = v14;
    }
    else
    {
      char v12 = self;
      v13 = 0;
    }
    v22 = [v6 objectForKeyedSubscript:@"geoPOICategory"];
    if (v22 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v11)
        {
          id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v29 = *MEMORY[0x1E4F502C8];
          uint64_t v35 = *MEMORY[0x1E4F28568];
          v25 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"geoPOICategory"];
          v36 = v25;
          v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
          *int v11 = (id)[v30 initWithDomain:v29 code:2 userInfo:v26];
        }
        id v23 = 0;
        v17 = 0;
        goto LABEL_27;
      }
      id v23 = v22;
    }
    else
    {
      id v23 = 0;
    }
    v17 = -[BMWalletSettledTransaction initWithPassUniqueID:transactionID:merchantType:geoPOICategory:](v12, "initWithPassUniqueID:transactionID:merchantType:geoPOICategory:", v8, v33, [v13 intValue], v23);
    char v12 = v17;
LABEL_27:
    uint64_t v7 = v32;

    self = v12;
LABEL_28:

    goto LABEL_29;
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
    v17 = 0;
    goto LABEL_30;
  }
  id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v16 = *MEMORY[0x1E4F502C8];
  uint64_t v41 = *MEMORY[0x1E4F28568];
  id v33 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"passUniqueID"];
  v42[0] = v33;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:&v41 count:1];
  id v8 = 0;
  v17 = 0;
  *a4 = (id)[v15 initWithDomain:v16 code:2 userInfo:v9];
LABEL_29:

LABEL_30:
  return v17;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMWalletSettledTransaction *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_passUniqueID) {
    PBDataWriterWriteStringField();
  }
  if (self->_transactionID) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_geoPOICategory) {
    PBDataWriterWriteStringField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)BMWalletSettledTransaction;
  id v5 = [(BMEventBase *)&v30 init];
  if (!v5) {
    goto LABEL_42;
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
          uint64_t v20 = 24;
          goto LABEL_32;
        case 2u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 32;
          goto LABEL_32;
        case 3u:
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          break;
        case 4u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 40;
LABEL_32:
          uint64_t v27 = *(Class *)((char *)&v5->super.super.isa + v20);
          *(Class *)((char *)&v5->super.super.isa + v20) = (Class)v19;

          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_41;
          }
          continue;
      }
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
          goto LABEL_34;
        }
        v21 += 7;
        BOOL v16 = v22++ >= 9;
        if (v16)
        {
          LODWORD(v23) = 0;
          goto LABEL_36;
        }
      }
      v4[*v8] = 1;
LABEL_34:
      if (v4[*v8]) {
        LODWORD(v23) = 0;
      }
LABEL_36:
      if (v23 >= 8) {
        LODWORD(v23) = 0;
      }
      v5->_merchantType = v23;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_41:
  }
    id v28 = 0;
  else {
LABEL_42:
  }
    id v28 = v5;

  return v28;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMWalletSettledTransaction *)self passUniqueID];
  id v5 = [(BMWalletSettledTransaction *)self transactionID];
  id v6 = BMWalletSettledTransactionMerchantTypeAsString([(BMWalletSettledTransaction *)self merchantType]);
  uint64_t v7 = [(BMWalletSettledTransaction *)self geoPOICategory];
  id v8 = (void *)[v3 initWithFormat:@"BMWalletSettledTransaction with passUniqueID: %@, transactionID: %@, merchantType: %@, geoPOICategory: %@", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (BMWalletSettledTransaction)initWithPassUniqueID:(id)a3 transactionID:(id)a4 merchantType:(int)a5 geoPOICategory:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v16.receiver = self;
  v16.super_class = (Class)BMWalletSettledTransaction;
  unint64_t v14 = [(BMEventBase *)&v16 init];
  if (v14)
  {
    v14->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v14->_passUniqueID, a3);
    objc_storeStrong((id *)&v14->_transactionID, a4);
    v14->_merchantType = a5;
    objc_storeStrong((id *)&v14->_geoPOICategory, a6);
  }

  return v14;
}

+ (id)protoFields
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"passUniqueID" number:1 type:13 subMessageClass:0];
  v8[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"transactionID" number:2 type:13 subMessageClass:0];
  v8[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"merchantType" number:3 type:4 subMessageClass:0];
  v8[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"geoPOICategory" number:4 type:13 subMessageClass:0];
  v8[3] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF73C8;
}

+ (id)columns
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"passUniqueID" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"transactionID" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"merchantType" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:4 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"geoPOICategory" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
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

    id v8 = [[BMWalletSettledTransaction alloc] initByReadFrom:v7];
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