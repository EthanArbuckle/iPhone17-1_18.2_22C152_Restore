@interface BMWalletTransaction
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMWalletTransaction)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMWalletTransaction)initWithPassUniqueID:(id)a3 passLocalizedDescription:(id)a4 transactionType:(int)a5 transactionID:(id)a6;
- (BMWalletTransaction)initWithPassUniqueID:(id)a3 passLocalizedDescription:(id)a4 transactionType:(int)a5 transactionID:(id)a6 merchantType:(int)a7 poiCategory:(id)a8;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)passLocalizedDescription;
- (NSString)passUniqueID;
- (NSString)poiCategory;
- (NSString)transactionID;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)merchantType;
- (int)transactionType;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMWalletTransaction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_poiCategory, 0);
  objc_storeStrong((id *)&self->_transactionID, 0);
  objc_storeStrong((id *)&self->_passLocalizedDescription, 0);

  objc_storeStrong((id *)&self->_passUniqueID, 0);
}

- (NSString)poiCategory
{
  return self->_poiCategory;
}

- (int)merchantType
{
  return self->_merchantType;
}

- (NSString)transactionID
{
  return self->_transactionID;
}

- (int)transactionType
{
  return self->_transactionType;
}

- (NSString)passLocalizedDescription
{
  return self->_passLocalizedDescription;
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
    v6 = [(BMWalletTransaction *)self passUniqueID];
    uint64_t v7 = [v5 passUniqueID];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMWalletTransaction *)self passUniqueID];
      v10 = [v5 passUniqueID];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_19;
      }
    }
    v13 = [(BMWalletTransaction *)self passLocalizedDescription];
    uint64_t v14 = [v5 passLocalizedDescription];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMWalletTransaction *)self passLocalizedDescription];
      v17 = [v5 passLocalizedDescription];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_19;
      }
    }
    int v19 = [(BMWalletTransaction *)self transactionType];
    if (v19 == [v5 transactionType])
    {
      v20 = [(BMWalletTransaction *)self transactionID];
      uint64_t v21 = [v5 transactionID];
      if (v20 == (void *)v21)
      {
      }
      else
      {
        v22 = (void *)v21;
        v23 = [(BMWalletTransaction *)self transactionID];
        v24 = [v5 transactionID];
        int v25 = [v23 isEqual:v24];

        if (!v25) {
          goto LABEL_19;
        }
      }
      int v26 = [(BMWalletTransaction *)self merchantType];
      if (v26 == [v5 merchantType])
      {
        v27 = [(BMWalletTransaction *)self poiCategory];
        v28 = [v5 poiCategory];
        if (v27 == v28)
        {
          char v12 = 1;
        }
        else
        {
          v29 = [(BMWalletTransaction *)self poiCategory];
          v30 = [v5 poiCategory];
          char v12 = [v29 isEqual:v30];
        }
        goto LABEL_20;
      }
    }
LABEL_19:
    char v12 = 0;
LABEL_20:

    goto LABEL_21;
  }
  char v12 = 0;
LABEL_21:

  return v12;
}

- (id)jsonDictionary
{
  v23[6] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMWalletTransaction *)self passUniqueID];
  uint64_t v4 = [(BMWalletTransaction *)self passLocalizedDescription];
  id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMWalletTransaction transactionType](self, "transactionType"));
  v6 = [(BMWalletTransaction *)self transactionID];
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", -[BMWalletTransaction merchantType](self, "merchantType"));
  v8 = [(BMWalletTransaction *)self poiCategory];
  v22[0] = @"passUniqueID";
  uint64_t v9 = v3;
  if (!v3)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v20 = (void *)v9;
  uint64_t v21 = (void *)v4;
  v23[0] = v9;
  v22[1] = @"passLocalizedDescription";
  uint64_t v10 = v4;
  if (!v4)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v18 = v10;
  v23[1] = v10;
  v22[2] = @"transactionType";
  int v11 = v5;
  if (!v5)
  {
    int v11 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v10, v20);
  }
  v23[2] = v11;
  v22[3] = @"transactionID";
  char v12 = v6;
  if (!v6)
  {
    char v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v13 = (void *)v3;
  v23[3] = v12;
  v22[4] = @"merchantType";
  uint64_t v14 = v7;
  if (!v7)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v23[4] = v14;
  v22[5] = @"poiCategory";
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
      goto LABEL_15;
    }
  }
  else
  {

    if (v7)
    {
LABEL_15:
      if (v6) {
        goto LABEL_16;
      }
LABEL_24:

      if (v5) {
        goto LABEL_17;
      }
      goto LABEL_25;
    }
  }

  if (!v6) {
    goto LABEL_24;
  }
LABEL_16:
  if (v5) {
    goto LABEL_17;
  }
LABEL_25:

LABEL_17:
  if (v21)
  {
    if (v13) {
      goto LABEL_19;
    }
  }
  else
  {

    if (v13) {
      goto LABEL_19;
    }
  }

LABEL_19:

  return v16;
}

- (BMWalletTransaction)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v61[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"passUniqueID"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    uint64_t v9 = [v6 objectForKeyedSubscript:@"passLocalizedDescription"];
    v42 = a4;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          uint64_t v14 = 0;
          v16 = 0;
          goto LABEL_46;
        }
        id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v18 = v8;
        uint64_t v19 = *MEMORY[0x1E4F502C8];
        uint64_t v58 = *MEMORY[0x1E4F28568];
        v47 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"passLocalizedDescription"];
        v59 = v47;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
        uint64_t v10 = v20 = a4;
        uint64_t v21 = v19;
        id v8 = v18;
        uint64_t v14 = 0;
        v16 = 0;
        id *v20 = (id)[v17 initWithDomain:v21 code:2 userInfo:v10];
        goto LABEL_45;
      }
      id v46 = v9;
    }
    else
    {
      id v46 = 0;
    }
    uint64_t v10 = [v6 objectForKeyedSubscript:@"transactionType"];
    v49 = self;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = v10;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v42)
          {
            v47 = 0;
            v16 = 0;
            uint64_t v14 = v46;
            goto LABEL_45;
          }
          id v48 = objc_alloc(MEMORY[0x1E4F28C58]);
          id v33 = v8;
          uint64_t v34 = *MEMORY[0x1E4F502C8];
          uint64_t v56 = *MEMORY[0x1E4F28568];
          id v44 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"transactionType"];
          id v57 = v44;
          v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
          uint64_t v35 = v34;
          id v8 = v33;
          id v36 = (id)[v48 initWithDomain:v35 code:2 userInfo:v22];
          v47 = 0;
          v16 = 0;
          id *v42 = v36;
LABEL_44:
          uint64_t v14 = v46;

          self = v49;
LABEL_45:

          goto LABEL_46;
        }
        id v11 = [NSNumber numberWithInt:BMWalletTransactionTypeFromString(v10)];
      }
      v47 = v11;
    }
    else
    {
      v47 = 0;
    }
    v22 = [v6 objectForKeyedSubscript:@"transactionID"];
    id v43 = v8;
    if (v22 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v42)
        {
          id v44 = 0;
          v16 = 0;
          goto LABEL_44;
        }
        id v45 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v26 = *MEMORY[0x1E4F502C8];
        uint64_t v54 = *MEMORY[0x1E4F28568];
        v24 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"transactionID"];
        v55 = v24;
        v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
        id v27 = (id)[v45 initWithDomain:v26 code:2 userInfo:v23];
        id v44 = 0;
        v16 = 0;
        id *v42 = v27;
        goto LABEL_43;
      }
      id v44 = v22;
    }
    else
    {
      id v44 = 0;
    }
    v23 = [v6 objectForKeyedSubscript:@"merchantType"];
    if (v23 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v25 = v23;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v42)
          {
            v24 = 0;
            v16 = 0;
            goto LABEL_43;
          }
          id v37 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v38 = *MEMORY[0x1E4F502C8];
          uint64_t v52 = *MEMORY[0x1E4F28568];
          id v29 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"merchantType"];
          id v53 = v29;
          v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
          id v39 = (id)[v37 initWithDomain:v38 code:2 userInfo:v28];
          v24 = 0;
          v16 = 0;
          id *v42 = v39;
          goto LABEL_42;
        }
        id v25 = [NSNumber numberWithInt:BMWalletTransactionMerchantTypeFromString(v23)];
      }
      v24 = v25;
    }
    else
    {
      v24 = 0;
    }
    v28 = [v6 objectForKeyedSubscript:@"poiCategory"];
    if (v28 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v42)
        {
          id v41 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v40 = *MEMORY[0x1E4F502C8];
          uint64_t v50 = *MEMORY[0x1E4F28568];
          v31 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"poiCategory"];
          v51 = v31;
          v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
          id *v42 = (id)[v41 initWithDomain:v40 code:2 userInfo:v32];
        }
        id v29 = 0;
        v16 = 0;
        goto LABEL_42;
      }
      id v29 = v28;
    }
    else
    {
      id v29 = 0;
    }
    v16 = -[BMWalletTransaction initWithPassUniqueID:passLocalizedDescription:transactionType:transactionID:merchantType:poiCategory:](v49, "initWithPassUniqueID:passLocalizedDescription:transactionType:transactionID:merchantType:poiCategory:", v43, v46, [v47 intValue], v44, objc_msgSend(v24, "intValue"), v29);
    v49 = v16;
LABEL_42:

LABEL_43:
    id v8 = v43;
    goto LABEL_44;
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
    v16 = 0;
    goto LABEL_47;
  }
  id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v13 = *MEMORY[0x1E4F502C8];
  uint64_t v60 = *MEMORY[0x1E4F28568];
  uint64_t v14 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"passUniqueID"];
  v61[0] = v14;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:&v60 count:1];
  id v15 = (id)[v12 initWithDomain:v13 code:2 userInfo:v9];
  id v8 = 0;
  v16 = 0;
  *a4 = v15;
LABEL_46:

LABEL_47:
  return v16;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMWalletTransaction *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_passUniqueID) {
    PBDataWriterWriteStringField();
  }
  if (self->_passLocalizedDescription) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_transactionID) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_poiCategory) {
    PBDataWriterWriteStringField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)BMWalletTransaction;
  id v5 = [(BMEventBase *)&v36 init];
  if (!v5) {
    goto LABEL_57;
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
          uint64_t v20 = 32;
          goto LABEL_40;
        case 2u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 40;
          goto LABEL_40;
        case 3u:
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          while (2)
          {
            uint64_t v24 = *v6;
            unint64_t v25 = *(void *)&v4[v24];
            if (v25 == -1 || v25 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v26 = *(unsigned char *)(*(void *)&v4[*v9] + v25);
              *(void *)&v4[v24] = v25 + 1;
              v23 |= (unint64_t)(v26 & 0x7F) << v21;
              if (v26 < 0)
              {
                v21 += 7;
                BOOL v16 = v22++ >= 9;
                if (v16)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_44;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_44:
          if (v23 >= 7) {
            LODWORD(v23) = 0;
          }
          uint64_t v33 = 20;
          goto LABEL_53;
        case 4u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 48;
          goto LABEL_40;
        case 5u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v23 = 0;
          break;
        case 6u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 56;
LABEL_40:
          v32 = *(Class *)((char *)&v5->super.super.isa + v20);
          *(Class *)((char *)&v5->super.super.isa + v20) = (Class)v19;

          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_56;
          }
          continue;
      }
      while (1)
      {
        uint64_t v29 = *v6;
        unint64_t v30 = *(void *)&v4[v29];
        if (v30 == -1 || v30 >= *(void *)&v4[*v7]) {
          break;
        }
        char v31 = *(unsigned char *)(*(void *)&v4[*v9] + v30);
        *(void *)&v4[v29] = v30 + 1;
        v23 |= (unint64_t)(v31 & 0x7F) << v27;
        if ((v31 & 0x80) == 0) {
          goto LABEL_48;
        }
        v27 += 7;
        BOOL v16 = v28++ >= 9;
        if (v16)
        {
          LODWORD(v23) = 0;
          goto LABEL_50;
        }
      }
      v4[*v8] = 1;
LABEL_48:
      if (v4[*v8]) {
        LODWORD(v23) = 0;
      }
LABEL_50:
      if (v23 >= 8) {
        LODWORD(v23) = 0;
      }
      uint64_t v33 = 24;
LABEL_53:
      *(_DWORD *)((char *)&v5->super.super.isa + v33) = v23;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_56:
  }
    uint64_t v34 = 0;
  else {
LABEL_57:
  }
    uint64_t v34 = v5;

  return v34;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMWalletTransaction *)self passUniqueID];
  id v5 = [(BMWalletTransaction *)self passLocalizedDescription];
  id v6 = BMWalletTransactionTypeAsString([(BMWalletTransaction *)self transactionType]);
  uint64_t v7 = [(BMWalletTransaction *)self transactionID];
  id v8 = BMWalletTransactionMerchantTypeAsString([(BMWalletTransaction *)self merchantType]);
  uint64_t v9 = [(BMWalletTransaction *)self poiCategory];
  char v10 = (void *)[v3 initWithFormat:@"BMWalletTransaction with passUniqueID: %@, passLocalizedDescription: %@, transactionType: %@, transactionID: %@, merchantType: %@, poiCategory: %@", v4, v5, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (BMWalletTransaction)initWithPassUniqueID:(id)a3 passLocalizedDescription:(id)a4 transactionType:(int)a5 transactionID:(id)a6 merchantType:(int)a7 poiCategory:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a8;
  v21.receiver = self;
  v21.super_class = (Class)BMWalletTransaction;
  id v18 = [(BMEventBase *)&v21 init];
  if (v18)
  {
    v18->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v18->_passUniqueID, a3);
    objc_storeStrong((id *)&v18->_passLocalizedDescription, a4);
    v18->_transactionType = a5;
    objc_storeStrong((id *)&v18->_transactionID, a6);
    v18->_merchantType = a7;
    objc_storeStrong((id *)&v18->_poiCategory, a8);
  }

  return v18;
}

+ (id)protoFields
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"passUniqueID" number:1 type:13 subMessageClass:0];
  v10[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"passLocalizedDescription" number:2 type:13 subMessageClass:0];
  v10[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"transactionType" number:3 type:4 subMessageClass:0];
  v10[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"transactionID" number:4 type:13 subMessageClass:0];
  v10[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"merchantType" number:5 type:4 subMessageClass:0];
  v10[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"poiCategory" number:6 type:13 subMessageClass:0];
  v10[5] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF36D8;
}

+ (id)columns
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"passUniqueID" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"passLocalizedDescription" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"transactionType" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:4 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"transactionID" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"merchantType" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:4 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"poiCategory" dataType:2 requestOnly:0 fieldNumber:6 protoDataType:13 convertedType:0];
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

    id v8 = [[BMWalletTransaction alloc] initByReadFrom:v7];
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

- (BMWalletTransaction)initWithPassUniqueID:(id)a3 passLocalizedDescription:(id)a4 transactionType:(int)a5 transactionID:(id)a6
{
  return [(BMWalletTransaction *)self initWithPassUniqueID:a3 passLocalizedDescription:a4 transactionType:*(void *)&a5 transactionID:a6 merchantType:0 poiCategory:0];
}

@end