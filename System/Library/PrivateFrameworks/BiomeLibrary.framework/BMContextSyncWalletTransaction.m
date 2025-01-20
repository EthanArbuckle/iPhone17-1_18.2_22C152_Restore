@interface BMContextSyncWalletTransaction
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMContextSyncWalletTransaction)initWithID:(id)a3 deviceUUID:(id)a4 passUniqueID:(id)a5 passLocalizedDescription:(id)a6 transactionType:(int)a7 transactionID:(id)a8 merchantType:(int)a9 poiCategory:(id)a10;
- (BMContextSyncWalletTransaction)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)ID;
- (NSString)description;
- (NSString)deviceUUID;
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

@implementation BMContextSyncWalletTransaction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_poiCategory, 0);
  objc_storeStrong((id *)&self->_transactionID, 0);
  objc_storeStrong((id *)&self->_passLocalizedDescription, 0);
  objc_storeStrong((id *)&self->_passUniqueID, 0);
  objc_storeStrong((id *)&self->_deviceUUID, 0);

  objc_storeStrong((id *)&self->_ID, 0);
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

- (NSString)deviceUUID
{
  return self->_deviceUUID;
}

- (NSString)ID
{
  return self->_ID;
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
    v6 = [(BMContextSyncWalletTransaction *)self ID];
    uint64_t v7 = [v5 ID];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMContextSyncWalletTransaction *)self ID];
      v10 = [v5 ID];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_27;
      }
    }
    v13 = [(BMContextSyncWalletTransaction *)self deviceUUID];
    uint64_t v14 = [v5 deviceUUID];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMContextSyncWalletTransaction *)self deviceUUID];
      v17 = [v5 deviceUUID];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_27;
      }
    }
    v19 = [(BMContextSyncWalletTransaction *)self passUniqueID];
    uint64_t v20 = [v5 passUniqueID];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMContextSyncWalletTransaction *)self passUniqueID];
      v23 = [v5 passUniqueID];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_27;
      }
    }
    v25 = [(BMContextSyncWalletTransaction *)self passLocalizedDescription];
    uint64_t v26 = [v5 passLocalizedDescription];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMContextSyncWalletTransaction *)self passLocalizedDescription];
      v29 = [v5 passLocalizedDescription];
      int v30 = [v28 isEqual:v29];

      if (!v30) {
        goto LABEL_27;
      }
    }
    int v31 = [(BMContextSyncWalletTransaction *)self transactionType];
    if (v31 == [v5 transactionType])
    {
      v32 = [(BMContextSyncWalletTransaction *)self transactionID];
      uint64_t v33 = [v5 transactionID];
      if (v32 == (void *)v33)
      {
      }
      else
      {
        v34 = (void *)v33;
        v35 = [(BMContextSyncWalletTransaction *)self transactionID];
        v36 = [v5 transactionID];
        int v37 = [v35 isEqual:v36];

        if (!v37) {
          goto LABEL_27;
        }
      }
      int v38 = [(BMContextSyncWalletTransaction *)self merchantType];
      if (v38 == [v5 merchantType])
      {
        v39 = [(BMContextSyncWalletTransaction *)self poiCategory];
        v40 = [v5 poiCategory];
        if (v39 == v40)
        {
          char v12 = 1;
        }
        else
        {
          v41 = [(BMContextSyncWalletTransaction *)self poiCategory];
          v42 = [v5 poiCategory];
          char v12 = [v41 isEqual:v42];
        }
        goto LABEL_28;
      }
    }
LABEL_27:
    char v12 = 0;
LABEL_28:

    goto LABEL_29;
  }
  char v12 = 0;
LABEL_29:

  return v12;
}

- (id)jsonDictionary
{
  v29[8] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMContextSyncWalletTransaction *)self ID];
  uint64_t v4 = [(BMContextSyncWalletTransaction *)self deviceUUID];
  uint64_t v5 = [(BMContextSyncWalletTransaction *)self passUniqueID];
  uint64_t v6 = [(BMContextSyncWalletTransaction *)self passLocalizedDescription];
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", -[BMContextSyncWalletTransaction transactionType](self, "transactionType"));
  v8 = [(BMContextSyncWalletTransaction *)self transactionID];
  v9 = objc_msgSend(NSNumber, "numberWithInt:", -[BMContextSyncWalletTransaction merchantType](self, "merchantType"));
  v10 = [(BMContextSyncWalletTransaction *)self poiCategory];
  v28[0] = @"ID";
  uint64_t v11 = v3;
  if (!v3)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v23 = (void *)v11;
  v29[0] = v11;
  v28[1] = @"deviceUUID";
  uint64_t v12 = v4;
  if (!v4)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v27 = (void *)v3;
  v22 = (void *)v12;
  v29[1] = v12;
  v28[2] = @"passUniqueID";
  uint64_t v13 = v5;
  if (!v5)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v26 = (void *)v4;
  v21 = (void *)v13;
  v29[2] = v13;
  v28[3] = @"passLocalizedDescription";
  uint64_t v14 = (void *)v6;
  if (!v6)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v25 = (void *)v5;
  v29[3] = v14;
  v28[4] = @"transactionType";
  v15 = v7;
  if (!v7)
  {
    v15 = [MEMORY[0x1E4F1CA98] null];
  }
  int v24 = (void *)v6;
  v29[4] = v15;
  v28[5] = @"transactionID";
  v16 = v8;
  if (!v8)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v29[5] = v16;
  v28[6] = @"merchantType";
  v17 = v9;
  if (!v9)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v29[6] = v17;
  v28[7] = @"poiCategory";
  int v18 = v10;
  if (!v10)
  {
    int v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v29[7] = v18;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:8];
  if (v10)
  {
    if (v9) {
      goto LABEL_19;
    }
LABEL_32:

    if (v8) {
      goto LABEL_20;
    }
    goto LABEL_33;
  }

  if (!v9) {
    goto LABEL_32;
  }
LABEL_19:
  if (v8) {
    goto LABEL_20;
  }
LABEL_33:

LABEL_20:
  if (!v7) {

  }
  if (!v24) {
  if (!v25)
  }

  if (v26)
  {
    if (v27) {
      goto LABEL_28;
    }
  }
  else
  {

    if (v27) {
      goto LABEL_28;
    }
  }

LABEL_28:

  return v19;
}

- (BMContextSyncWalletTransaction)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v87[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"ID"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"deviceUUID"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v25 = 0;
          goto LABEL_66;
        }
        v61 = a4;
        id v27 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v28 = *MEMORY[0x1E4F502C8];
        uint64_t v84 = *MEMORY[0x1E4F28568];
        id v15 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"deviceUUID"];
        id v85 = v15;
        uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v85 forKeys:&v84 count:1];
        uint64_t v30 = v28;
        uint64_t v11 = (void *)v29;
        id v31 = (id)[v27 initWithDomain:v30 code:2 userInfo:v29];
        v25 = 0;
        a4 = 0;
        id *v61 = v31;
        goto LABEL_65;
      }
      id v71 = v9;
    }
    else
    {
      id v71 = 0;
    }
    uint64_t v10 = [v6 objectForKeyedSubscript:@"passUniqueID"];
    v70 = v7;
    v65 = (void *)v10;
    if (v10 && (uint64_t v11 = (void *)v10, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v15 = 0;
          v25 = v71;
          goto LABEL_65;
        }
        id v68 = objc_alloc(MEMORY[0x1E4F28C58]);
        v62 = a4;
        uint64_t v33 = *MEMORY[0x1E4F502C8];
        uint64_t v82 = *MEMORY[0x1E4F28568];
        id v69 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"passUniqueID"];
        id v83 = v69;
        v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v83 forKeys:&v82 count:1];
        id v35 = (id)[v68 initWithDomain:v33 code:2 userInfo:v34];
        id v15 = 0;
        a4 = 0;
        id *v62 = v35;
        v25 = v71;
LABEL_64:

        uint64_t v11 = v65;
LABEL_65:

        goto LABEL_66;
      }
      id v12 = v8;
      uint64_t v13 = v9;
      uint64_t v14 = self;
      id v15 = v11;
    }
    else
    {
      id v12 = v8;
      uint64_t v13 = v9;
      uint64_t v14 = self;
      id v15 = 0;
    }
    v16 = [v6 objectForKeyedSubscript:@"passLocalizedDescription"];
    id v67 = v15;
    if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v69 = 0;
          v34 = v16;
          self = v14;
          v9 = v13;
          id v8 = v12;
          uint64_t v7 = v70;
          v25 = v71;
          goto LABEL_64;
        }
        v36 = a4;
        id v37 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v38 = *MEMORY[0x1E4F502C8];
        uint64_t v80 = *MEMORY[0x1E4F28568];
        id v66 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"passLocalizedDescription"];
        id v81 = v66;
        v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v81 forKeys:&v80 count:1];
        uint64_t v39 = v38;
        v34 = v16;
        id v40 = (id)[v37 initWithDomain:v39 code:2 userInfo:v17];
        id v69 = 0;
        a4 = 0;
        id *v36 = v40;
        self = v14;
        v9 = v13;
        id v8 = v12;
        uint64_t v7 = v70;
        v25 = v71;
        goto LABEL_63;
      }
      v59 = v16;
      id v69 = v16;
    }
    else
    {
      v59 = v16;
      id v69 = 0;
    }
    v17 = [v6 objectForKeyedSubscript:@"transactionType"];
    self = v14;
    v60 = a4;
    if (v17)
    {
      objc_opt_class();
      v9 = v13;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        id v8 = v12;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          uint64_t v7 = v70;
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              id v66 = 0;
              v25 = v71;
              v34 = v59;
              goto LABEL_63;
            }
            id v50 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v51 = *MEMORY[0x1E4F502C8];
            uint64_t v78 = *MEMORY[0x1E4F28568];
            id v64 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"transactionType"];
            id v79 = v64;
            int v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v79 forKeys:&v78 count:1];
            id v52 = (id)[v50 initWithDomain:v51 code:2 userInfo:v18];
            id v66 = 0;
            a4 = 0;
            id *v60 = v52;
LABEL_62:
            v34 = v59;

            v25 = v71;
LABEL_63:

            id v15 = v67;
            goto LABEL_64;
          }
          id v66 = [NSNumber numberWithInt:BMContextSyncWalletTransactionTypeFromString(v17)];
LABEL_25:
          int v18 = [v6 objectForKeyedSubscript:@"transactionID"];
          id v63 = v8;
          if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!a4)
              {
                id v64 = 0;
                goto LABEL_61;
              }
              id v41 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v42 = *MEMORY[0x1E4F502C8];
              uint64_t v76 = *MEMORY[0x1E4F28568];
              v21 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"transactionID"];
              v77 = v21;
              v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v77 forKeys:&v76 count:1];
              id v43 = (id)[v41 initWithDomain:v42 code:2 userInfo:v19];
              id v64 = 0;
              a4 = 0;
              id *v60 = v43;
LABEL_60:

LABEL_61:
              id v8 = v63;
              goto LABEL_62;
            }
            id v64 = v18;
          }
          else
          {
            id v64 = 0;
          }
          v19 = [v6 objectForKeyedSubscript:@"merchantType"];
          if (v19 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            uint64_t v20 = self;
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v32 = v19;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!a4)
                {
                  v21 = 0;
                  a4 = 0;
                  goto LABEL_59;
                }
                id v58 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v53 = *MEMORY[0x1E4F502C8];
                uint64_t v74 = *MEMORY[0x1E4F28568];
                id v45 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"merchantType"];
                id v75 = v45;
                v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v75 forKeys:&v74 count:1];
                id v54 = (id)[v58 initWithDomain:v53 code:2 userInfo:v44];
                v21 = 0;
                a4 = 0;
                id *v60 = v54;
                goto LABEL_58;
              }
              id v32 = [NSNumber numberWithInt:BMContextSyncWalletTransactionMerchantTypeFromString(v19)];
            }
            v21 = v32;
          }
          else
          {
            uint64_t v20 = self;
            v21 = 0;
          }
          v44 = [v6 objectForKeyedSubscript:@"poiCategory"];
          if (v44 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (a4)
              {
                id v57 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v56 = *MEMORY[0x1E4F502C8];
                uint64_t v72 = *MEMORY[0x1E4F28568];
                v48 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"poiCategory"];
                v73 = v48;
                v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v73 forKeys:&v72 count:1];
                id *v60 = (id)[v57 initWithDomain:v56 code:2 userInfo:v49];
              }
              id v45 = 0;
              a4 = 0;
              goto LABEL_58;
            }
            id v45 = v44;
          }
          else
          {
            id v45 = 0;
          }
          uint64_t v46 = [v66 intValue];
          LODWORD(v55) = [v21 intValue];
          a4 = [(BMContextSyncWalletTransaction *)v20 initWithID:v63 deviceUUID:v71 passUniqueID:v67 passLocalizedDescription:v69 transactionType:v46 transactionID:v64 merchantType:v55 poiCategory:v45];
          uint64_t v20 = (BMContextSyncWalletTransaction *)a4;
LABEL_58:

LABEL_59:
          self = v20;
          uint64_t v7 = v70;
          goto LABEL_60;
        }
        id v66 = v17;
LABEL_24:
        uint64_t v7 = v70;
        goto LABEL_25;
      }
      id v66 = 0;
    }
    else
    {
      id v66 = 0;
      v9 = v13;
    }
    id v8 = v12;
    goto LABEL_24;
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
    goto LABEL_67;
  }
  v22 = a4;
  id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v24 = *MEMORY[0x1E4F502C8];
  uint64_t v86 = *MEMORY[0x1E4F28568];
  v25 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"ID"];
  v87[0] = v25;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v87 forKeys:&v86 count:1];
  id v26 = (id)[v23 initWithDomain:v24 code:2 userInfo:v9];
  id v8 = 0;
  a4 = 0;
  id *v22 = v26;
LABEL_66:

LABEL_67:
  return (BMContextSyncWalletTransaction *)a4;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMContextSyncWalletTransaction *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_ID) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceUUID) {
    PBDataWriterWriteStringField();
  }
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
  v36.super_class = (Class)BMContextSyncWalletTransaction;
  uint64_t v5 = [(BMEventBase *)&v36 init];
  if (!v5) {
    goto LABEL_59;
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
          uint64_t v20 = 32;
          goto LABEL_42;
        case 2u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 40;
          goto LABEL_42;
        case 3u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 48;
          goto LABEL_42;
        case 4u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 56;
          goto LABEL_42;
        case 5u:
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
                  goto LABEL_46;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v23) = 0;
          }
LABEL_46:
          if (v23 >= 7) {
            LODWORD(v23) = 0;
          }
          uint64_t v33 = 20;
          goto LABEL_55;
        case 6u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 64;
          goto LABEL_42;
        case 7u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v23 = 0;
          break;
        case 8u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 72;
LABEL_42:
          id v32 = *(Class *)((char *)&v5->super.super.isa + v20);
          *(Class *)((char *)&v5->super.super.isa + v20) = (Class)v19;

          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_58;
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
          goto LABEL_50;
        }
        v27 += 7;
        BOOL v16 = v28++ >= 9;
        if (v16)
        {
          LODWORD(v23) = 0;
          goto LABEL_52;
        }
      }
      v4[*v8] = 1;
LABEL_50:
      if (v4[*v8]) {
        LODWORD(v23) = 0;
      }
LABEL_52:
      if (v23 >= 8) {
        LODWORD(v23) = 0;
      }
      uint64_t v33 = 24;
LABEL_55:
      *(_DWORD *)((char *)&v5->super.super.isa + v33) = v23;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_58:
  }
    v34 = 0;
  else {
LABEL_59:
  }
    v34 = v5;

  return v34;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMContextSyncWalletTransaction *)self ID];
  uint64_t v5 = [(BMContextSyncWalletTransaction *)self deviceUUID];
  id v6 = [(BMContextSyncWalletTransaction *)self passUniqueID];
  uint64_t v7 = [(BMContextSyncWalletTransaction *)self passLocalizedDescription];
  id v8 = BMContextSyncWalletTransactionTypeAsString([(BMContextSyncWalletTransaction *)self transactionType]);
  v9 = [(BMContextSyncWalletTransaction *)self transactionID];
  char v10 = BMContextSyncWalletTransactionMerchantTypeAsString([(BMContextSyncWalletTransaction *)self merchantType]);
  unsigned int v11 = [(BMContextSyncWalletTransaction *)self poiCategory];
  unint64_t v12 = (void *)[v3 initWithFormat:@"BMContextSyncWalletTransaction with ID: %@, deviceUUID: %@, passUniqueID: %@, passLocalizedDescription: %@, transactionType: %@, transactionID: %@, merchantType: %@, poiCategory: %@", v4, v5, v6, v7, v8, v9, v10, v11];

  return (NSString *)v12;
}

- (BMContextSyncWalletTransaction)initWithID:(id)a3 deviceUUID:(id)a4 passUniqueID:(id)a5 passLocalizedDescription:(id)a6 transactionType:(int)a7 transactionID:(id)a8 merchantType:(int)a9 poiCategory:(id)a10
{
  id v16 = a3;
  id v24 = a4;
  id v23 = a5;
  id v22 = a6;
  id v17 = a8;
  id v18 = a10;
  v25.receiver = self;
  v25.super_class = (Class)BMContextSyncWalletTransaction;
  uint64_t v19 = [(BMEventBase *)&v25 init];
  if (v19)
  {
    v19->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v19->_ID, a3);
    objc_storeStrong((id *)&v19->_deviceUUID, a4);
    objc_storeStrong((id *)&v19->_passUniqueID, a5);
    objc_storeStrong((id *)&v19->_passLocalizedDescription, a6);
    v19->_transactionType = a7;
    objc_storeStrong((id *)&v19->_transactionID, a8);
    v19->_merchantType = a9;
    objc_storeStrong((id *)&v19->_poiCategory, a10);
  }

  return v19;
}

+ (id)protoFields
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"ID" number:1 type:13 subMessageClass:0];
  v12[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"deviceUUID" number:2 type:13 subMessageClass:0];
  v12[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"passUniqueID" number:3 type:13 subMessageClass:0];
  v12[2] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"passLocalizedDescription" number:4 type:13 subMessageClass:0];
  v12[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"transactionType" number:5 type:4 subMessageClass:0];
  v12[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"transactionID" number:6 type:13 subMessageClass:0];
  v12[5] = v7;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"merchantType" number:7 type:4 subMessageClass:0];
  v12[6] = v8;
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"poiCategory" number:8 type:13 subMessageClass:0];
  v12[7] = v9;
  char v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:8];

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5BC8;
}

+ (id)columns
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"ID" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"deviceUUID" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"passUniqueID" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"passLocalizedDescription" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"transactionType" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:4 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"transactionID" dataType:2 requestOnly:0 fieldNumber:6 protoDataType:13 convertedType:0];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"merchantType" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:4 convertedType:0];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"poiCategory" dataType:2 requestOnly:0 fieldNumber:8 protoDataType:13 convertedType:0];
  v12[0] = v2;
  v12[1] = v3;
  v12[2] = v4;
  v12[3] = v5;
  v12[4] = v6;
  v12[5] = v7;
  v12[6] = v8;
  v12[7] = v9;
  char v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:8];

  return v10;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    id v4 = 0;
  }
  else
  {
    uint64_t v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMContextSyncWalletTransaction alloc] initByReadFrom:v7];
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