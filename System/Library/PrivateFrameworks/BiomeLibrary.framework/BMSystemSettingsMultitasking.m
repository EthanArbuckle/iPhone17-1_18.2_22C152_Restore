@interface BMSystemSettingsMultitasking
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSystemSettingsMultitasking)initWithChildAccount:(id)a3 firstUpdate:(id)a4 buddySetup:(id)a5 buddySetupMultitaskingOff:(id)a6 multitaskingOption:(id)a7 source:(id)a8;
- (BMSystemSettingsMultitasking)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)buddySetup;
- (BOOL)buddySetupMultitaskingOff;
- (BOOL)childAccount;
- (BOOL)firstUpdate;
- (BOOL)hasBuddySetup;
- (BOOL)hasBuddySetupMultitaskingOff;
- (BOOL)hasChildAccount;
- (BOOL)hasFirstUpdate;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)multitaskingOption;
- (NSString)source;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)setHasBuddySetup:(BOOL)a3;
- (void)setHasBuddySetupMultitaskingOff:(BOOL)a3;
- (void)setHasChildAccount:(BOOL)a3;
- (void)setHasFirstUpdate:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSystemSettingsMultitasking

+ (id)columns
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"childAccount" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:12 convertedType:0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"firstUpdate" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:12 convertedType:0];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"buddySetup" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:12 convertedType:0];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"buddySetupMultitaskingOff" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:12 convertedType:0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"multitaskingOption" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"source" dataType:2 requestOnly:0 fieldNumber:6 protoDataType:13 convertedType:0];
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v4;
  v10[3] = v5;
  v10[4] = v6;
  v10[5] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);

  objc_storeStrong((id *)&self->_multitaskingOption, 0);
}

- (NSString)source
{
  return self->_source;
}

- (NSString)multitaskingOption
{
  return self->_multitaskingOption;
}

- (void)setHasBuddySetupMultitaskingOff:(BOOL)a3
{
  self->_hasBuddySetupMultitaskingOff = a3;
}

- (BOOL)hasBuddySetupMultitaskingOff
{
  return self->_hasBuddySetupMultitaskingOff;
}

- (BOOL)buddySetupMultitaskingOff
{
  return self->_buddySetupMultitaskingOff;
}

- (void)setHasBuddySetup:(BOOL)a3
{
  self->_hasBuddySetup = a3;
}

- (BOOL)hasBuddySetup
{
  return self->_hasBuddySetup;
}

- (BOOL)buddySetup
{
  return self->_buddySetup;
}

- (void)setHasFirstUpdate:(BOOL)a3
{
  self->_hasFirstUpdate = a3;
}

- (BOOL)hasFirstUpdate
{
  return self->_hasFirstUpdate;
}

- (BOOL)firstUpdate
{
  return self->_firstUpdate;
}

- (void)setHasChildAccount:(BOOL)a3
{
  self->_hasChildAccount = a3;
}

- (BOOL)hasChildAccount
{
  return self->_hasChildAccount;
}

- (BOOL)childAccount
{
  return self->_childAccount;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v16 = 0;
    goto LABEL_27;
  }
  id v5 = v4;
  if ([(BMSystemSettingsMultitasking *)self hasChildAccount]
    || [v5 hasChildAccount])
  {
    if (![(BMSystemSettingsMultitasking *)self hasChildAccount]) {
      goto LABEL_24;
    }
    if (![v5 hasChildAccount]) {
      goto LABEL_24;
    }
    int v6 = [(BMSystemSettingsMultitasking *)self childAccount];
    if (v6 != [v5 childAccount]) {
      goto LABEL_24;
    }
  }
  if ([(BMSystemSettingsMultitasking *)self hasFirstUpdate]
    || [v5 hasFirstUpdate])
  {
    if (![(BMSystemSettingsMultitasking *)self hasFirstUpdate]) {
      goto LABEL_24;
    }
    if (![v5 hasFirstUpdate]) {
      goto LABEL_24;
    }
    int v7 = [(BMSystemSettingsMultitasking *)self firstUpdate];
    if (v7 != [v5 firstUpdate]) {
      goto LABEL_24;
    }
  }
  if ([(BMSystemSettingsMultitasking *)self hasBuddySetup]
    || [v5 hasBuddySetup])
  {
    if (![(BMSystemSettingsMultitasking *)self hasBuddySetup]) {
      goto LABEL_24;
    }
    if (![v5 hasBuddySetup]) {
      goto LABEL_24;
    }
    int v8 = [(BMSystemSettingsMultitasking *)self buddySetup];
    if (v8 != [v5 buddySetup]) {
      goto LABEL_24;
    }
  }
  if ([(BMSystemSettingsMultitasking *)self hasBuddySetupMultitaskingOff]
    || [v5 hasBuddySetupMultitaskingOff])
  {
    if (![(BMSystemSettingsMultitasking *)self hasBuddySetupMultitaskingOff]) {
      goto LABEL_24;
    }
    if (![v5 hasBuddySetupMultitaskingOff]) {
      goto LABEL_24;
    }
    int v9 = [(BMSystemSettingsMultitasking *)self buddySetupMultitaskingOff];
    if (v9 != [v5 buddySetupMultitaskingOff]) {
      goto LABEL_24;
    }
  }
  v10 = [(BMSystemSettingsMultitasking *)self multitaskingOption];
  uint64_t v11 = [v5 multitaskingOption];
  if (v10 == (void *)v11)
  {

    goto LABEL_29;
  }
  v12 = (void *)v11;
  v13 = [(BMSystemSettingsMultitasking *)self multitaskingOption];
  v14 = [v5 multitaskingOption];
  int v15 = [v13 isEqual:v14];

  if (v15)
  {
LABEL_29:
    v18 = [(BMSystemSettingsMultitasking *)self source];
    v19 = [v5 source];
    if (v18 == v19)
    {
      char v16 = 1;
    }
    else
    {
      v20 = [(BMSystemSettingsMultitasking *)self source];
      v21 = [v5 source];
      char v16 = [v20 isEqual:v21];
    }
    goto LABEL_25;
  }
LABEL_24:
  char v16 = 0;
LABEL_25:

LABEL_27:
  return v16;
}

- (id)jsonDictionary
{
  v22[6] = *MEMORY[0x1E4F143B8];
  if ([(BMSystemSettingsMultitasking *)self hasChildAccount])
  {
    uint64_t v3 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSystemSettingsMultitasking childAccount](self, "childAccount"));
  }
  else
  {
    uint64_t v3 = 0;
  }
  if ([(BMSystemSettingsMultitasking *)self hasFirstUpdate])
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSystemSettingsMultitasking firstUpdate](self, "firstUpdate"));
  }
  else
  {
    id v4 = 0;
  }
  if ([(BMSystemSettingsMultitasking *)self hasBuddySetup])
  {
    id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSystemSettingsMultitasking buddySetup](self, "buddySetup"));
  }
  else
  {
    id v5 = 0;
  }
  if ([(BMSystemSettingsMultitasking *)self hasBuddySetupMultitaskingOff])
  {
    int v6 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSystemSettingsMultitasking buddySetupMultitaskingOff](self, "buddySetupMultitaskingOff"));
  }
  else
  {
    int v6 = 0;
  }
  int v7 = [(BMSystemSettingsMultitasking *)self multitaskingOption];
  int v8 = [(BMSystemSettingsMultitasking *)self source];
  v21[0] = @"childAccount";
  uint64_t v9 = v3;
  if (!v3)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v19 = (void *)v9;
  v22[0] = v9;
  v21[1] = @"firstUpdate";
  uint64_t v10 = (uint64_t)v4;
  if (!v4)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v17 = v10;
  v22[1] = v10;
  v21[2] = @"buddySetup";
  uint64_t v11 = v5;
  if (!v5)
  {
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v10, v19);
  }
  v20 = (void *)v3;
  v22[2] = v11;
  v21[3] = @"buddySetupMultitaskingOff";
  v12 = v6;
  if (!v6)
  {
    v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[3] = v12;
  v21[4] = @"multitaskingOption";
  v13 = v7;
  if (!v7)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[4] = v13;
  v21[5] = @"source";
  v14 = v8;
  if (!v8)
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v22[5] = v14;
  int v15 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v22, v21, 6, v17);
  if (v8)
  {
    if (v7) {
      goto LABEL_27;
    }
LABEL_35:

    if (v6) {
      goto LABEL_28;
    }
    goto LABEL_36;
  }

  if (!v7) {
    goto LABEL_35;
  }
LABEL_27:
  if (v6) {
    goto LABEL_28;
  }
LABEL_36:

LABEL_28:
  if (v5)
  {
    if (v4) {
      goto LABEL_30;
    }
LABEL_38:

    if (v20) {
      goto LABEL_31;
    }
    goto LABEL_39;
  }

  if (!v4) {
    goto LABEL_38;
  }
LABEL_30:
  if (v20) {
    goto LABEL_31;
  }
LABEL_39:

LABEL_31:

  return v15;
}

- (BMSystemSettingsMultitasking)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v68[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [v6 objectForKeyedSubscript:@"childAccount"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    uint64_t v9 = [v6 objectForKeyedSubscript:@"firstUpdate"];
    v54 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v10 = 0;
          v19 = 0;
          goto LABEL_50;
        }
        v24 = a4;
        id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v26 = v8;
        uint64_t v27 = *MEMORY[0x1E4F502C8];
        uint64_t v65 = *MEMORY[0x1E4F28568];
        uint64_t v28 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"firstUpdate"];
        uint64_t v66 = v28;
        uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
        uint64_t v29 = v27;
        id v8 = v26;
        v19 = 0;
        id v10 = 0;
        id *v24 = (id)[v25 initWithDomain:v29 code:2 userInfo:v11];
        id v12 = (id)v28;
        goto LABEL_49;
      }
      id v10 = v9;
    }
    else
    {
      id v10 = 0;
    }
    uint64_t v11 = [v6 objectForKeyedSubscript:@"buddySetup"];
    v56 = self;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v12 = 0;
          v19 = 0;
          goto LABEL_49;
        }
        v30 = a4;
        id v31 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v32 = v8;
        uint64_t v33 = *MEMORY[0x1E4F502C8];
        uint64_t v63 = *MEMORY[0x1E4F28568];
        id v34 = v10;
        id v35 = [NSString alloc];
        uint64_t v48 = objc_opt_class();
        v36 = v35;
        id v10 = v34;
        id v55 = (id)[v36 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v48, @"buddySetup"];
        id v64 = v55;
        v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
        uint64_t v37 = v33;
        id v8 = v32;
        v19 = 0;
        id *v30 = (id)[v31 initWithDomain:v37 code:2 userInfo:v13];
        id v12 = 0;
LABEL_48:

        self = v56;
LABEL_49:

        int v7 = v54;
        goto LABEL_50;
      }
      id v12 = v11;
    }
    else
    {
      id v12 = 0;
    }
    v13 = [v6 objectForKeyedSubscript:@"buddySetupMultitaskingOff"];
    id v52 = v10;
    id v53 = v8;
    id v51 = v12;
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v55 = 0;
          v19 = 0;
          goto LABEL_48;
        }
        id v38 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v39 = *MEMORY[0x1E4F502C8];
        uint64_t v61 = *MEMORY[0x1E4F28568];
        v40 = a4;
        id v16 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"buddySetupMultitaskingOff"];
        id v62 = v16;
        int v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
        id v41 = (id)[v38 initWithDomain:v39 code:2 userInfo:v15];
        v19 = 0;
        id v55 = 0;
        id *v40 = v41;
        goto LABEL_57;
      }
      v14 = a4;
      id v55 = v13;
    }
    else
    {
      v14 = a4;
      id v55 = 0;
    }
    int v15 = [v6 objectForKeyedSubscript:@"multitaskingOption"];
    if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v16 = 0;
      goto LABEL_16;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v16 = v15;
LABEL_16:
      uint64_t v17 = [v6 objectForKeyedSubscript:@"source"];
      if (!v17 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v18 = 0;
LABEL_19:
        id v12 = v51;
        v19 = [(BMSystemSettingsMultitasking *)v56 initWithChildAccount:v53 firstUpdate:v52 buddySetup:v51 buddySetupMultitaskingOff:v55 multitaskingOption:v16 source:v18];
        v56 = v19;
LABEL_46:

LABEL_47:
        id v10 = v52;
        id v8 = v53;
        goto LABEL_48;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v18 = v17;
        goto LABEL_19;
      }
      if (v14)
      {
        id v50 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v49 = *MEMORY[0x1E4F502C8];
        uint64_t v57 = *MEMORY[0x1E4F28568];
        v45 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"source"];
        v58 = v45;
        v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
        id *v14 = (id)[v50 initWithDomain:v49 code:2 userInfo:v46];
      }
      id v18 = 0;
      v19 = 0;
LABEL_45:
      id v12 = v51;
      goto LABEL_46;
    }
    if (v14)
    {
      id v42 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v43 = *MEMORY[0x1E4F502C8];
      uint64_t v59 = *MEMORY[0x1E4F28568];
      id v18 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"multitaskingOption"];
      id v60 = v18;
      uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60 forKeys:&v59 count:1];
      id v44 = (id)[v42 initWithDomain:v43 code:2 userInfo:v17];
      v19 = 0;
      id v16 = 0;
      id *v14 = v44;
      goto LABEL_45;
    }
    id v16 = 0;
    v19 = 0;
LABEL_57:
    id v12 = v51;
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
    v19 = 0;
    id v8 = 0;
    goto LABEL_51;
  }
  v20 = a4;
  id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v22 = *MEMORY[0x1E4F502C8];
  uint64_t v67 = *MEMORY[0x1E4F28568];
  id v10 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"childAccount"];
  v68[0] = v10;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:&v67 count:1];
  id v23 = (id)[v21 initWithDomain:v22 code:2 userInfo:v9];
  v19 = 0;
  id v8 = 0;
  id *v20 = v23;
LABEL_50:

LABEL_51:
  return v19;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMSystemSettingsMultitasking *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasChildAccount)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasFirstUpdate)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasBuddySetup)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasBuddySetupMultitaskingOff)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_multitaskingOption)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_source)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)BMSystemSettingsMultitasking;
  id v5 = [(BMEventBase *)&v50 init];
  if (!v5) {
    goto LABEL_73;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  int v7 = (int *)MEMORY[0x1E4F940E0];
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
          char v19 = 0;
          unsigned int v20 = 0;
          uint64_t v21 = 0;
          v5->_hasChildAccount = 1;
          while (1)
          {
            uint64_t v22 = *v6;
            unint64_t v23 = *(void *)&v4[v22];
            if (v23 == -1 || v23 >= *(void *)&v4[*v7]) {
              break;
            }
            char v24 = *(unsigned char *)(*(void *)&v4[*v9] + v23);
            *(void *)&v4[v22] = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if ((v24 & 0x80) == 0) {
              goto LABEL_54;
            }
            v19 += 7;
            BOOL v16 = v20++ >= 9;
            if (v16)
            {
              uint64_t v21 = 0;
              goto LABEL_56;
            }
          }
          v4[*v8] = 1;
LABEL_54:
          if (v4[*v8]) {
            uint64_t v21 = 0;
          }
LABEL_56:
          BOOL v46 = v21 != 0;
          uint64_t v47 = 16;
          goto LABEL_69;
        case 2u:
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v27 = 0;
          v5->_hasFirstUpdate = 1;
          while (2)
          {
            uint64_t v28 = *v6;
            unint64_t v29 = *(void *)&v4[v28];
            if (v29 == -1 || v29 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v30 = *(unsigned char *)(*(void *)&v4[*v9] + v29);
              *(void *)&v4[v28] = v29 + 1;
              v27 |= (unint64_t)(v30 & 0x7F) << v25;
              if (v30 < 0)
              {
                v25 += 7;
                BOOL v16 = v26++ >= 9;
                if (v16)
                {
                  uint64_t v27 = 0;
                  goto LABEL_60;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v27 = 0;
          }
LABEL_60:
          BOOL v46 = v27 != 0;
          uint64_t v47 = 18;
          goto LABEL_69;
        case 3u:
          char v31 = 0;
          unsigned int v32 = 0;
          uint64_t v33 = 0;
          v5->_hasBuddySetup = 1;
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
              v33 |= (unint64_t)(v36 & 0x7F) << v31;
              if (v36 < 0)
              {
                v31 += 7;
                BOOL v16 = v32++ >= 9;
                if (v16)
                {
                  uint64_t v33 = 0;
                  goto LABEL_64;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v33 = 0;
          }
LABEL_64:
          BOOL v46 = v33 != 0;
          uint64_t v47 = 20;
          goto LABEL_69;
        case 4u:
          char v37 = 0;
          unsigned int v38 = 0;
          uint64_t v39 = 0;
          v5->_hasBuddySetupMultitaskingOff = 1;
          break;
        case 5u:
          uint64_t v43 = PBReaderReadString();
          uint64_t v44 = 32;
          goto LABEL_52;
        case 6u:
          uint64_t v43 = PBReaderReadString();
          uint64_t v44 = 40;
LABEL_52:
          v45 = *(Class *)((char *)&v5->super.super.isa + v44);
          *(Class *)((char *)&v5->super.super.isa + v44) = (Class)v43;

          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_72;
          }
          continue;
      }
      while (1)
      {
        uint64_t v40 = *v6;
        unint64_t v41 = *(void *)&v4[v40];
        if (v41 == -1 || v41 >= *(void *)&v4[*v7]) {
          break;
        }
        char v42 = *(unsigned char *)(*(void *)&v4[*v9] + v41);
        *(void *)&v4[v40] = v41 + 1;
        v39 |= (unint64_t)(v42 & 0x7F) << v37;
        if ((v42 & 0x80) == 0) {
          goto LABEL_66;
        }
        v37 += 7;
        BOOL v16 = v38++ >= 9;
        if (v16)
        {
          uint64_t v39 = 0;
          goto LABEL_68;
        }
      }
      v4[*v8] = 1;
LABEL_66:
      if (v4[*v8]) {
        uint64_t v39 = 0;
      }
LABEL_68:
      BOOL v46 = v39 != 0;
      uint64_t v47 = 22;
LABEL_69:
      *((unsigned char *)&v5->super.super.isa + v47) = v46;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_72:
  }
    uint64_t v48 = 0;
  else {
LABEL_73:
  }
    uint64_t v48 = v5;

  return v48;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSystemSettingsMultitasking childAccount](self, "childAccount"));
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSystemSettingsMultitasking firstUpdate](self, "firstUpdate"));
  id v6 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSystemSettingsMultitasking buddySetup](self, "buddySetup"));
  int v7 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSystemSettingsMultitasking buddySetupMultitaskingOff](self, "buddySetupMultitaskingOff"));
  id v8 = [(BMSystemSettingsMultitasking *)self multitaskingOption];
  uint64_t v9 = [(BMSystemSettingsMultitasking *)self source];
  char v10 = (void *)[v3 initWithFormat:@"BMSystemSettingsMultitasking with childAccount: %@, firstUpdate: %@, buddySetup: %@, buddySetupMultitaskingOff: %@, multitaskingOption: %@, source: %@", v4, v5, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (BMSystemSettingsMultitasking)initWithChildAccount:(id)a3 firstUpdate:(id)a4 buddySetup:(id)a5 buddySetupMultitaskingOff:(id)a6 multitaskingOption:(id)a7 source:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v22.receiver = self;
  v22.super_class = (Class)BMSystemSettingsMultitasking;
  unsigned int v20 = [(BMEventBase *)&v22 init];
  if (v20)
  {
    v20->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v14)
    {
      v20->_hasChildAccount = 1;
      v20->_childAccount = [v14 BOOLValue];
    }
    else
    {
      v20->_hasChildAccount = 0;
      v20->_childAccount = 0;
    }
    if (v15)
    {
      v20->_hasFirstUpdate = 1;
      v20->_firstUpdate = [v15 BOOLValue];
    }
    else
    {
      v20->_hasFirstUpdate = 0;
      v20->_firstUpdate = 0;
    }
    if (v16)
    {
      v20->_hasBuddySetup = 1;
      v20->_buddySetup = [v16 BOOLValue];
    }
    else
    {
      v20->_hasBuddySetup = 0;
      v20->_buddySetup = 0;
    }
    if (v17)
    {
      v20->_hasBuddySetupMultitaskingOff = 1;
      v20->_buddySetupMultitaskingOff = [v17 BOOLValue];
    }
    else
    {
      v20->_hasBuddySetupMultitaskingOff = 0;
      v20->_buddySetupMultitaskingOff = 0;
    }
    objc_storeStrong((id *)&v20->_multitaskingOption, a7);
    objc_storeStrong((id *)&v20->_source, a8);
  }

  return v20;
}

+ (id)protoFields
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"childAccount" number:1 type:12 subMessageClass:0];
  v10[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"firstUpdate" number:2 type:12 subMessageClass:0];
  v10[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"buddySetup" number:3 type:12 subMessageClass:0];
  v10[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"buddySetupMultitaskingOff" number:4 type:12 subMessageClass:0];
  v10[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"multitaskingOption" number:5 type:13 subMessageClass:0];
  v10[4] = v6;
  int v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"source" number:6 type:13 subMessageClass:0];
  v10[5] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5EE0;
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
    int v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMSystemSettingsMultitasking alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[6] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end