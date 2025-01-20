@interface BMSiriRequestContextUser
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriRequestContextUser)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMSiriRequestContextUser)initWithUserID:(id)a3 isOnlyUserInHome:(id)a4 classification:(int)a5;
- (BOOL)hasIsOnlyUserInHome;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOnlyUserInHome;
- (NSString)description;
- (NSString)userID;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)classification;
- (unsigned)dataVersion;
- (void)setHasIsOnlyUserInHome:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriRequestContextUser

- (void).cxx_destruct
{
}

- (int)classification
{
  return self->_classification;
}

- (void)setHasIsOnlyUserInHome:(BOOL)a3
{
  self->_hasIsOnlyUserInHome = a3;
}

- (BOOL)hasIsOnlyUserInHome
{
  return self->_hasIsOnlyUserInHome;
}

- (BOOL)isOnlyUserInHome
{
  return self->_isOnlyUserInHome;
}

- (NSString)userID
{
  return self->_userID;
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
    v6 = [(BMSiriRequestContextUser *)self userID];
    uint64_t v7 = [v5 userID];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMSiriRequestContextUser *)self userID];
      v10 = [v5 userID];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_12;
      }
    }
    if (![(BMSiriRequestContextUser *)self hasIsOnlyUserInHome]
      && ![v5 hasIsOnlyUserInHome]
      || [(BMSiriRequestContextUser *)self hasIsOnlyUserInHome]
      && [v5 hasIsOnlyUserInHome]
      && (int v13 = [(BMSiriRequestContextUser *)self isOnlyUserInHome],
          v13 == [v5 isOnlyUserInHome]))
    {
      int v14 = [(BMSiriRequestContextUser *)self classification];
      BOOL v12 = v14 == [v5 classification];
      goto LABEL_14;
    }
LABEL_12:
    BOOL v12 = 0;
LABEL_14:

    goto LABEL_15;
  }
  BOOL v12 = 0;
LABEL_15:

  return v12;
}

- (id)jsonDictionary
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v3 = [(BMSiriRequestContextUser *)self userID];
  if ([(BMSiriRequestContextUser *)self hasIsOnlyUserInHome])
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriRequestContextUser isOnlyUserInHome](self, "isOnlyUserInHome"));
  }
  else
  {
    id v4 = 0;
  }
  id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriRequestContextUser classification](self, "classification"));
  v11[0] = @"userID";
  v6 = v3;
  if (!v3)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[0] = v6;
  v11[1] = @"isOnlyUserInHome";
  uint64_t v7 = v4;
  if (!v4)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v7;
  v11[2] = @"classification";
  v8 = v5;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  if (v5)
  {
    if (v4) {
      goto LABEL_12;
    }
LABEL_17:

    if (v3) {
      goto LABEL_13;
    }
    goto LABEL_18;
  }

  if (!v4) {
    goto LABEL_17;
  }
LABEL_12:
  if (v3) {
    goto LABEL_13;
  }
LABEL_18:

LABEL_13:

  return v9;
}

- (BMSiriRequestContextUser)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"userID"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"isOnlyUserInHome"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v10 = 0;
          v16 = 0;
          goto LABEL_25;
        }
        id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v17 = *MEMORY[0x1E4F502C8];
        uint64_t v27 = *MEMORY[0x1E4F28568];
        BOOL v12 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"isOnlyUserInHome"];
        v28 = v12;
        int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
        id v18 = (id)[v23 initWithDomain:v17 code:2 userInfo:v11];
        id v10 = 0;
        v16 = 0;
        *a4 = v18;
        goto LABEL_24;
      }
      id v10 = v9;
    }
    else
    {
      id v10 = 0;
    }
    int v11 = [v6 objectForKeyedSubscript:@"classification"];
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = v11;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v22 = *MEMORY[0x1E4F502C8];
            uint64_t v25 = *MEMORY[0x1E4F28568];
            v20 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"classification"];
            v26 = v20;
            v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
            *a4 = (id)[v24 initWithDomain:v22 code:2 userInfo:v21];
          }
          BOOL v12 = 0;
          v16 = 0;
          goto LABEL_24;
        }
        id v13 = [NSNumber numberWithInt:BMSiriRequestContextUserClassificationFromString(v11)];
      }
      BOOL v12 = v13;
    }
    else
    {
      BOOL v12 = 0;
    }
    self = -[BMSiriRequestContextUser initWithUserID:isOnlyUserInHome:classification:](self, "initWithUserID:isOnlyUserInHome:classification:", v8, v10, [v12 intValue]);
    v16 = self;
LABEL_24:

    goto LABEL_25;
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
    goto LABEL_26;
  }
  id v14 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v15 = *MEMORY[0x1E4F502C8];
  uint64_t v29 = *MEMORY[0x1E4F28568];
  id v10 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"userID"];
  v30[0] = v10;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
  id v8 = 0;
  v16 = 0;
  *a4 = (id)[v14 initWithDomain:v15 code:2 userInfo:v9];
LABEL_25:

LABEL_26:
  return v16;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMSiriRequestContextUser *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_userID) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasIsOnlyUserInHome) {
    PBDataWriterWriteBOOLField();
  }
  PBDataWriterWriteUint32Field();
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)BMSiriRequestContextUser;
  id v5 = [(BMEventBase *)&v39 init];
  if (!v5) {
    goto LABEL_52;
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
      unint64_t v20 = v12 >> 3;
      if ((v12 >> 3) == 1)
      {
        uint64_t v28 = PBReaderReadString();
        userID = v5->_userID;
        v5->_userID = (NSString *)v28;
      }
      else if (v20 == 2)
      {
        char v30 = 0;
        unsigned int v31 = 0;
        uint64_t v32 = 0;
        v5->_hasIsOnlyUserInHome = 1;
        while (1)
        {
          uint64_t v33 = *v6;
          uint64_t v34 = *(void *)&v4[v33];
          unint64_t v35 = v34 + 1;
          if (v34 == -1 || v35 > *(void *)&v4[*v7]) {
            break;
          }
          char v36 = *(unsigned char *)(*(void *)&v4[*v9] + v34);
          *(void *)&v4[v33] = v35;
          v32 |= (unint64_t)(v36 & 0x7F) << v30;
          if ((v36 & 0x80) == 0) {
            goto LABEL_46;
          }
          v30 += 7;
          BOOL v17 = v31++ >= 9;
          if (v17)
          {
            uint64_t v32 = 0;
            goto LABEL_48;
          }
        }
        v4[*v8] = 1;
LABEL_46:
        if (v4[*v8]) {
          uint64_t v32 = 0;
        }
LABEL_48:
        v5->_isOnlyUserInHome = v32 != 0;
      }
      else if (v20 == 3)
      {
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        while (1)
        {
          uint64_t v24 = *v6;
          uint64_t v25 = *(void *)&v4[v24];
          unint64_t v26 = v25 + 1;
          if (v25 == -1 || v26 > *(void *)&v4[*v7]) {
            break;
          }
          char v27 = *(unsigned char *)(*(void *)&v4[*v9] + v25);
          *(void *)&v4[v24] = v26;
          v23 |= (unint64_t)(v27 & 0x7F) << v21;
          if ((v27 & 0x80) == 0) {
            goto LABEL_40;
          }
          v21 += 7;
          BOOL v17 = v22++ >= 9;
          if (v17)
          {
            LODWORD(v23) = 0;
            goto LABEL_42;
          }
        }
        v4[*v8] = 1;
LABEL_40:
        if (v4[*v8]) {
          LODWORD(v23) = 0;
        }
LABEL_42:
        if (v23 >= 5) {
          LODWORD(v23) = 0;
        }
        v5->_classification = v23;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_51;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_51:
  }
    v37 = 0;
  else {
LABEL_52:
  }
    v37 = v5;

  return v37;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMSiriRequestContextUser *)self userID];
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSiriRequestContextUser isOnlyUserInHome](self, "isOnlyUserInHome"));
  id v6 = BMSiriRequestContextUserClassificationAsString([(BMSiriRequestContextUser *)self classification]);
  uint64_t v7 = (void *)[v3 initWithFormat:@"BMSiriRequestContextUser with userID: %@, isOnlyUserInHome: %@, classification: %@", v4, v5, v6];

  return (NSString *)v7;
}

- (BMSiriRequestContextUser)initWithUserID:(id)a3 isOnlyUserInHome:(id)a4 classification:(int)a5
{
  id v9 = a3;
  id v10 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BMSiriRequestContextUser;
  unsigned int v11 = [(BMEventBase *)&v13 init];
  if (v11)
  {
    v11->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v11->_userID, a3);
    if (v10)
    {
      v11->_hasIsOnlyUserInHome = 1;
      v11->_isOnlyUserInHome = [v10 BOOLValue];
    }
    else
    {
      v11->_hasIsOnlyUserInHome = 0;
      v11->_isOnlyUserInHome = 0;
    }
    v11->_classification = a5;
  }

  return v11;
}

+ (id)protoFields
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"userID" number:1 type:13 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"isOnlyUserInHome", 2, 12, 0, v2);
  v7[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"classification" number:3 type:4 subMessageClass:0];
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5190;
}

+ (id)columns
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"userID" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isOnlyUserInHome" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:12 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"classification" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:4 convertedType:0];
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

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

    id v8 = [[BMSiriRequestContextUser alloc] initByReadFrom:v7];
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