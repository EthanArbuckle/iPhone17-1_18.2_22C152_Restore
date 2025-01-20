@interface BMSystemSettingsAppearanceSetup
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSystemSettingsAppearanceSetup)initWithChoice:(id)a3 childSetup:(id)a4 childChoice:(id)a5 childAge:(id)a6;
- (BMSystemSettingsAppearanceSetup)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)childSetup;
- (BOOL)hasChildAge;
- (BOOL)hasChildSetup;
- (BOOL)isEqual:(id)a3;
- (NSString)childChoice;
- (NSString)choice;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)childAge;
- (unsigned)dataVersion;
- (void)setHasChildAge:(BOOL)a3;
- (void)setHasChildSetup:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSystemSettingsAppearanceSetup

+ (id)columns
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"choice" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"childSetup" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:12 convertedType:0];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"childChoice" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"childAge" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:4 convertedType:0];
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  v8[3] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childChoice, 0);

  objc_storeStrong((id *)&self->_choice, 0);
}

- (void)setHasChildAge:(BOOL)a3
{
  self->_hasChildAge = a3;
}

- (BOOL)hasChildAge
{
  return self->_hasChildAge;
}

- (unsigned)childAge
{
  return self->_childAge;
}

- (NSString)childChoice
{
  return self->_childChoice;
}

- (void)setHasChildSetup:(BOOL)a3
{
  self->_hasChildSetup = a3;
}

- (BOOL)hasChildSetup
{
  return self->_hasChildSetup;
}

- (BOOL)childSetup
{
  return self->_childSetup;
}

- (NSString)choice
{
  return self->_choice;
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
    v6 = [(BMSystemSettingsAppearanceSetup *)self choice];
    uint64_t v7 = [v5 choice];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMSystemSettingsAppearanceSetup *)self choice];
      v10 = [v5 choice];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_21;
      }
    }
    if ([(BMSystemSettingsAppearanceSetup *)self hasChildSetup]
      || [v5 hasChildSetup])
    {
      if (![(BMSystemSettingsAppearanceSetup *)self hasChildSetup]) {
        goto LABEL_21;
      }
      if (![v5 hasChildSetup]) {
        goto LABEL_21;
      }
      int v13 = [(BMSystemSettingsAppearanceSetup *)self childSetup];
      if (v13 != [v5 childSetup]) {
        goto LABEL_21;
      }
    }
    v14 = [(BMSystemSettingsAppearanceSetup *)self childChoice];
    uint64_t v15 = [v5 childChoice];
    if (v14 == (void *)v15)
    {
    }
    else
    {
      v16 = (void *)v15;
      v17 = [(BMSystemSettingsAppearanceSetup *)self childChoice];
      v18 = [v5 childChoice];
      int v19 = [v17 isEqual:v18];

      if (!v19) {
        goto LABEL_21;
      }
    }
    if (![(BMSystemSettingsAppearanceSetup *)self hasChildAge]
      && ![v5 hasChildAge])
    {
      BOOL v12 = 1;
      goto LABEL_22;
    }
    if ([(BMSystemSettingsAppearanceSetup *)self hasChildAge]
      && [v5 hasChildAge])
    {
      unsigned int v20 = [(BMSystemSettingsAppearanceSetup *)self childAge];
      BOOL v12 = v20 == [v5 childAge];
LABEL_22:

      goto LABEL_23;
    }
LABEL_21:
    BOOL v12 = 0;
    goto LABEL_22;
  }
  BOOL v12 = 0;
LABEL_23:

  return v12;
}

- (id)jsonDictionary
{
  v14[4] = *MEMORY[0x1E4F143B8];
  v3 = [(BMSystemSettingsAppearanceSetup *)self choice];
  if ([(BMSystemSettingsAppearanceSetup *)self hasChildSetup])
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSystemSettingsAppearanceSetup childSetup](self, "childSetup"));
  }
  else
  {
    id v4 = 0;
  }
  id v5 = [(BMSystemSettingsAppearanceSetup *)self childChoice];
  if ([(BMSystemSettingsAppearanceSetup *)self hasChildAge])
  {
    v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSystemSettingsAppearanceSetup childAge](self, "childAge"));
  }
  else
  {
    v6 = 0;
  }
  v13[0] = @"choice";
  uint64_t v7 = v3;
  if (!v3)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[0] = v7;
  v13[1] = @"childSetup";
  v8 = v4;
  if (!v4)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[1] = v8;
  v13[2] = @"childChoice";
  v9 = v5;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[2] = v9;
  v13[3] = @"childAge";
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
      goto LABEL_17;
    }
  }
  else
  {

    if (v5)
    {
LABEL_17:
      if (v4) {
        goto LABEL_18;
      }
LABEL_24:

      if (v3) {
        goto LABEL_19;
      }
      goto LABEL_25;
    }
  }

  if (!v4) {
    goto LABEL_24;
  }
LABEL_18:
  if (v3) {
    goto LABEL_19;
  }
LABEL_25:

LABEL_19:

  return v11;
}

- (BMSystemSettingsAppearanceSetup)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"choice"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"childSetup"];
    v31 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          uint64_t v15 = 0;
          goto LABEL_16;
        }
        id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v21 = *MEMORY[0x1E4F502C8];
        uint64_t v36 = *MEMORY[0x1E4F28568];
        id v12 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"childSetup"];
        id v37 = v12;
        v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
        uint64_t v15 = 0;
        *a4 = (id)[v20 initWithDomain:v21 code:2 userInfo:v10];
        a4 = 0;
        goto LABEL_15;
      }
      v30 = v9;
    }
    else
    {
      v30 = 0;
    }
    v10 = [v6 objectForKeyedSubscript:@"childChoice"];
    int v11 = self;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v12 = 0;
          uint64_t v15 = 0;
          a4 = v30;
          goto LABEL_15;
        }
        id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
        v28 = a4;
        uint64_t v23 = *MEMORY[0x1E4F502C8];
        uint64_t v34 = *MEMORY[0x1E4F28568];
        id v14 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"childChoice"];
        id v35 = v14;
        int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
        id v24 = (id)[v22 initWithDomain:v23 code:2 userInfo:v13];
        uint64_t v15 = 0;
        id v12 = 0;
        a4 = v30;
        id *v28 = v24;
        goto LABEL_14;
      }
      id v12 = v10;
    }
    else
    {
      id v12 = 0;
    }
    int v13 = [v6 objectForKeyedSubscript:@"childAge"];
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v27 = *MEMORY[0x1E4F502C8];
          uint64_t v32 = *MEMORY[0x1E4F28568];
          v25 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"childAge"];
          v33 = v25;
          v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
          *a4 = (id)[v29 initWithDomain:v27 code:2 userInfo:v26];
        }
        id v14 = 0;
        uint64_t v15 = 0;
        a4 = v30;
        goto LABEL_14;
      }
      id v14 = v13;
    }
    else
    {
      id v14 = 0;
    }
    a4 = v30;
    uint64_t v15 = [(BMSystemSettingsAppearanceSetup *)v11 initWithChoice:v8 childSetup:v30 childChoice:v12 childAge:v14];
    int v11 = v15;
LABEL_14:

    self = v11;
LABEL_15:

    uint64_t v7 = v31;
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    uint64_t v15 = 0;
    id v8 = 0;
    goto LABEL_17;
  }
  id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v18 = *MEMORY[0x1E4F502C8];
  uint64_t v38 = *MEMORY[0x1E4F28568];
  int v19 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"choice"];
  v39[0] = v19;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
  uint64_t v15 = 0;
  id v8 = 0;
  *a4 = (id)[v17 initWithDomain:v18 code:2 userInfo:v9];
  a4 = v19;
LABEL_16:

LABEL_17:
  return v15;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMSystemSettingsAppearanceSetup *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_choice)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasChildSetup)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_childChoice)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasChildAge)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)BMSystemSettingsAppearanceSetup;
  id v5 = [(BMEventBase *)&v36 init];
  if (!v5) {
    goto LABEL_50;
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
          goto LABEL_31;
        case 2u:
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          v5->_hasChildSetup = 1;
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
                  uint64_t v23 = 0;
                  goto LABEL_42;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v23 = 0;
          }
LABEL_42:
          v5->_childSetup = v23 != 0;
          continue;
        case 3u:
          uint64_t v19 = PBReaderReadString();
          uint64_t v20 = 40;
LABEL_31:
          uint64_t v27 = *(Class *)((char *)&v5->super.super.isa + v20);
          *(Class *)((char *)&v5->super.super.isa + v20) = (Class)v19;

          continue;
        case 4u:
          char v28 = 0;
          unsigned int v29 = 0;
          uint64_t v30 = 0;
          v5->_hasChildAge = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_49;
          }
          continue;
      }
      while (1)
      {
        uint64_t v31 = *v6;
        unint64_t v32 = *(void *)&v4[v31];
        if (v32 == -1 || v32 >= *(void *)&v4[*v7]) {
          break;
        }
        char v33 = *(unsigned char *)(*(void *)&v4[*v9] + v32);
        *(void *)&v4[v31] = v32 + 1;
        v30 |= (unint64_t)(v33 & 0x7F) << v28;
        if ((v33 & 0x80) == 0) {
          goto LABEL_44;
        }
        v28 += 7;
        BOOL v16 = v29++ >= 9;
        if (v16)
        {
          LODWORD(v30) = 0;
          goto LABEL_46;
        }
      }
      v4[*v8] = 1;
LABEL_44:
      if (v4[*v8]) {
        LODWORD(v30) = 0;
      }
LABEL_46:
      v5->_childAge = v30;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_49:
  }
    uint64_t v34 = 0;
  else {
LABEL_50:
  }
    uint64_t v34 = v5;

  return v34;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMSystemSettingsAppearanceSetup *)self choice];
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSystemSettingsAppearanceSetup childSetup](self, "childSetup"));
  id v6 = [(BMSystemSettingsAppearanceSetup *)self childChoice];
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMSystemSettingsAppearanceSetup childAge](self, "childAge"));
  id v8 = (void *)[v3 initWithFormat:@"BMSystemSettingsAppearanceSetup with choice: %@, childSetup: %@, childChoice: %@, childAge: %@", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (BMSystemSettingsAppearanceSetup)initWithChoice:(id)a3 childSetup:(id)a4 childChoice:(id)a5 childAge:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)BMSystemSettingsAppearanceSetup;
  char v15 = [(BMEventBase *)&v18 init];
  if (v15)
  {
    v15->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v15->_choice, a3);
    if (v12)
    {
      v15->_hasChildSetup = 1;
      v15->_childSetup = [v12 BOOLValue];
    }
    else
    {
      v15->_hasChildSetup = 0;
      v15->_childSetup = 0;
    }
    objc_storeStrong((id *)&v15->_childChoice, a5);
    if (v14)
    {
      v15->_hasChildAge = 1;
      unsigned int v16 = [v14 unsignedIntValue];
    }
    else
    {
      unsigned int v16 = 0;
      v15->_hasChildAge = 0;
    }
    v15->_childAge = v16;
  }

  return v15;
}

+ (id)protoFields
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"choice" number:1 type:13 subMessageClass:0];
  v8[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"childSetup" number:2 type:12 subMessageClass:0];
  v8[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"childChoice" number:3 type:13 subMessageClass:0];
  v8[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"childAge" number:4 type:4 subMessageClass:0];
  v8[3] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4650;
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

    id v8 = [[BMSystemSettingsAppearanceSetup alloc] initByReadFrom:v7];
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