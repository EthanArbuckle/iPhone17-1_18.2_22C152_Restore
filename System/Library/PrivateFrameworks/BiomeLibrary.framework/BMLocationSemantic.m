@interface BMLocationSemantic
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMLocationSemantic)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMLocationSemantic)initWithStarting:(id)a3 userSpecificPlaceType:(int)a4 placeType:(int)a5;
- (BMLocationSemantic)initWithStarting:(id)a3 userSpecificPlaceType:(int)a4 placeType:(int)a5 loiIdentifier:(id)a6;
- (BOOL)hasStarting;
- (BOOL)isEqual:(id)a3;
- (BOOL)starting;
- (NSString)description;
- (NSUUID)loiIdentifier;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)placeType;
- (int)userSpecificPlaceType;
- (unsigned)dataVersion;
- (void)setHasStarting:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMLocationSemantic

- (BMLocationSemantic)initWithStarting:(id)a3 userSpecificPlaceType:(int)a4 placeType:(int)a5
{
  return [(BMLocationSemantic *)self initWithStarting:a3 userSpecificPlaceType:*(void *)&a4 placeType:*(void *)&a5 loiIdentifier:0];
}

- (void).cxx_destruct
{
}

- (int)placeType
{
  return self->_placeType;
}

- (int)userSpecificPlaceType
{
  return self->_userSpecificPlaceType;
}

- (void)setHasStarting:(BOOL)a3
{
  self->_hasStarting = a3;
}

- (BOOL)hasStarting
{
  return self->_hasStarting;
}

- (BOOL)starting
{
  return self->_starting;
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
    if ((!-[BMLocationSemantic hasStarting](self, "hasStarting") && ![v5 hasStarting]
       || [(BMLocationSemantic *)self hasStarting]
       && [v5 hasStarting]
       && (int v6 = -[BMLocationSemantic starting](self, "starting"), v6 == [v5 starting]))
      && (int v7 = [(BMLocationSemantic *)self userSpecificPlaceType],
          v7 == [v5 userSpecificPlaceType])
      && (int v8 = -[BMLocationSemantic placeType](self, "placeType"), v8 == [v5 placeType]))
    {
      v9 = [(BMLocationSemantic *)self loiIdentifier];
      v10 = [v5 loiIdentifier];
      if (v9 == v10)
      {
        char v13 = 1;
      }
      else
      {
        v11 = [(BMLocationSemantic *)self loiIdentifier];
        v12 = [v5 loiIdentifier];
        char v13 = [v11 isEqual:v12];
      }
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (NSUUID)loiIdentifier
{
  raw_loiIdentifier = self->_raw_loiIdentifier;
  if (raw_loiIdentifier)
  {
    v3 = [MEMORY[0x1E4F50320] convertValue:raw_loiIdentifier toType:3];
  }
  else
  {
    v3 = 0;
  }

  return (NSUUID *)v3;
}

- (id)jsonDictionary
{
  v15[4] = *MEMORY[0x1E4F143B8];
  if ([(BMLocationSemantic *)self hasStarting])
  {
    v3 = objc_msgSend(NSNumber, "numberWithBool:", -[BMLocationSemantic starting](self, "starting"));
  }
  else
  {
    v3 = 0;
  }
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMLocationSemantic userSpecificPlaceType](self, "userSpecificPlaceType"));
  id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMLocationSemantic placeType](self, "placeType"));
  int v6 = [(BMLocationSemantic *)self loiIdentifier];
  int v7 = [v6 UUIDString];

  v14[0] = @"starting";
  int v8 = v3;
  if (!v3)
  {
    int v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[0] = v8;
  v14[1] = @"userSpecificPlaceType";
  v9 = v4;
  if (!v4)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[1] = v9;
  v14[2] = @"placeType";
  v10 = v5;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[2] = v10;
  v14[3] = @"loiIdentifier";
  v11 = v7;
  if (!v7)
  {
    v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[3] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
  if (v7)
  {
    if (v5) {
      goto LABEL_14;
    }
  }
  else
  {

    if (v5)
    {
LABEL_14:
      if (v4) {
        goto LABEL_15;
      }
LABEL_21:

      if (v3) {
        goto LABEL_16;
      }
      goto LABEL_22;
    }
  }

  if (!v4) {
    goto LABEL_21;
  }
LABEL_15:
  if (v3) {
    goto LABEL_16;
  }
LABEL_22:

LABEL_16:

  return v12;
}

- (BMLocationSemantic)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v49[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [v6 objectForKeyedSubscript:@"starting"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v39 = 0;
LABEL_4:
    int v8 = [v6 objectForKeyedSubscript:@"userSpecificPlaceType"];
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = v8;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v9 = 0;
            char v13 = 0;
            goto LABEL_44;
          }
          id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v25 = *MEMORY[0x1E4F502C8];
          uint64_t v46 = *MEMORY[0x1E4F28568];
          v16 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"userSpecificPlaceType"];
          v47 = v16;
          v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
          id v26 = (id)[v24 initWithDomain:v25 code:2 userInfo:v14];
          v9 = 0;
          char v13 = 0;
          *a4 = v26;
          goto LABEL_43;
        }
        id v10 = [NSNumber numberWithInt:BMLocationSemanticUserSpecificPlaceTypeFromString(v8)];
      }
      v9 = v10;
    }
    else
    {
      v9 = 0;
    }
    v14 = [v6 objectForKeyedSubscript:@"placeType"];
    v38 = self;
    if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v15 = a4;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v17 = v14;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v16 = 0;
            char v13 = 0;
            self = v38;
            goto LABEL_43;
          }
          id v27 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v28 = *MEMORY[0x1E4F502C8];
          uint64_t v44 = *MEMORY[0x1E4F28568];
          v18 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"placeType"];
          v45 = v18;
          v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
          id *v15 = (id)[v27 initWithDomain:v28 code:2 userInfo:v29];

          v16 = 0;
          goto LABEL_37;
        }
        id v17 = [NSNumber numberWithInt:BMLocationSemanticPlaceTypeFromString(v14)];
      }
      v16 = v17;
    }
    else
    {
      v15 = a4;
      v16 = 0;
    }
    v18 = [v6 objectForKeyedSubscript:@"loiIdentifier"];
    if (!v18 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v19 = 0;
LABEL_27:
      self = -[BMLocationSemantic initWithStarting:userSpecificPlaceType:placeType:loiIdentifier:](v38, "initWithStarting:userSpecificPlaceType:placeType:loiIdentifier:", v39, [v9 intValue], objc_msgSend(v16, "intValue"), v19);

      char v13 = self;
LABEL_42:

LABEL_43:
      goto LABEL_44;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v36 = v9;
      id v20 = v18;
      uint64_t v21 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v20];
      if (!v21)
      {
        if (v15)
        {
          id v35 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v30 = *MEMORY[0x1E4F502C8];
          uint64_t v42 = *MEMORY[0x1E4F28568];
          v31 = (void *)[[NSString alloc] initWithFormat:@"-initWithUUIDString: for %@ returned nil", @"loiIdentifier"];
          v43 = v31;
          v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
          id *v15 = (id)[v35 initWithDomain:v30 code:2 userInfo:v32];
        }
        char v13 = 0;
        v18 = v20;
        v9 = v36;
        self = v38;
        goto LABEL_42;
      }
      v19 = (void *)v21;

      v9 = v36;
      goto LABEL_27;
    }
    if (v15)
    {
      id v37 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v34 = *MEMORY[0x1E4F502C8];
      uint64_t v40 = *MEMORY[0x1E4F28568];
      v22 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"loiIdentifier"];
      v41 = v22;
      v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
      id *v15 = (id)[v37 initWithDomain:v34 code:2 userInfo:v23];
    }
LABEL_37:
    char v13 = 0;
    self = v38;
    goto LABEL_42;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v39 = v7;
    goto LABEL_4;
  }
  if (a4)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v12 = *MEMORY[0x1E4F502C8];
    uint64_t v48 = *MEMORY[0x1E4F28568];
    v9 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"starting"];
    v49[0] = v9;
    int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:&v48 count:1];
    id v39 = 0;
    char v13 = 0;
    *a4 = (id)[v11 initWithDomain:v12 code:2 userInfo:v8];
LABEL_44:

    goto LABEL_45;
  }
  id v39 = 0;
  char v13 = 0;
LABEL_45:

  return v13;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMLocationSemantic *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_hasStarting) {
    PBDataWriterWriteBOOLField();
  }
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_raw_loiIdentifier) {
    PBDataWriterWriteStringField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)BMLocationSemantic;
  id v5 = [(BMEventBase *)&v41 init];
  if (!v5) {
    goto LABEL_64;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  int v7 = (int *)MEMORY[0x1E4F940E0];
  int v8 = (int *)MEMORY[0x1E4F940C8];
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
          char v19 = 0;
          unsigned int v20 = 0;
          uint64_t v21 = 0;
          v5->_hasStarting = 1;
          while (2)
          {
            uint64_t v22 = *v6;
            unint64_t v23 = *(void *)&v4[v22];
            if (v23 == -1 || v23 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v24 = *(unsigned char *)(*(void *)&v4[*v9] + v23);
              *(void *)&v4[v22] = v23 + 1;
              v21 |= (unint64_t)(v24 & 0x7F) << v19;
              if (v24 < 0)
              {
                v19 += 7;
                BOOL v16 = v20++ >= 9;
                if (v16)
                {
                  uint64_t v21 = 0;
                  goto LABEL_47;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v21 = 0;
          }
LABEL_47:
          v5->_starting = v21 != 0;
          continue;
        case 2u:
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v27 = 0;
          while (1)
          {
            uint64_t v28 = *v6;
            unint64_t v29 = *(void *)&v4[v28];
            if (v29 == -1 || v29 >= *(void *)&v4[*v7]) {
              break;
            }
            char v30 = *(unsigned char *)(*(void *)&v4[*v9] + v29);
            *(void *)&v4[v28] = v29 + 1;
            v27 |= (unint64_t)(v30 & 0x7F) << v25;
            if ((v30 & 0x80) == 0) {
              goto LABEL_49;
            }
            v25 += 7;
            BOOL v16 = v26++ >= 9;
            if (v16)
            {
              LODWORD(v27) = 0;
              goto LABEL_51;
            }
          }
          v4[*v8] = 1;
LABEL_49:
          if (v4[*v8]) {
            LODWORD(v27) = 0;
          }
LABEL_51:
          if (v27 >= 5) {
            LODWORD(v27) = 0;
          }
          uint64_t v38 = 32;
          goto LABEL_60;
        case 3u:
          char v31 = 0;
          unsigned int v32 = 0;
          uint64_t v27 = 0;
          break;
        case 4u:
          uint64_t v36 = PBReaderReadString();
          raw_loiIdentifier = v5->_raw_loiIdentifier;
          v5->_raw_loiIdentifier = (NSString *)v36;

          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_63;
          }
          continue;
      }
      while (1)
      {
        uint64_t v33 = *v6;
        unint64_t v34 = *(void *)&v4[v33];
        if (v34 == -1 || v34 >= *(void *)&v4[*v7]) {
          break;
        }
        char v35 = *(unsigned char *)(*(void *)&v4[*v9] + v34);
        *(void *)&v4[v33] = v34 + 1;
        v27 |= (unint64_t)(v35 & 0x7F) << v31;
        if ((v35 & 0x80) == 0) {
          goto LABEL_55;
        }
        v31 += 7;
        BOOL v16 = v32++ >= 9;
        if (v16)
        {
          LODWORD(v27) = 0;
          goto LABEL_57;
        }
      }
      v4[*v8] = 1;
LABEL_55:
      if (v4[*v8]) {
        LODWORD(v27) = 0;
      }
LABEL_57:
      if (v27 >= 4) {
        LODWORD(v27) = 0;
      }
      uint64_t v38 = 36;
LABEL_60:
      *(_DWORD *)((char *)&v5->super.super.isa + v38) = v27;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_63:
  }
    id v39 = 0;
  else {
LABEL_64:
  }
    id v39 = v5;

  return v39;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMLocationSemantic starting](self, "starting"));
  id v5 = BMLocationSemanticUserSpecificPlaceTypeAsString([(BMLocationSemantic *)self userSpecificPlaceType]);
  id v6 = BMLocationSemanticPlaceTypeAsString([(BMLocationSemantic *)self placeType]);
  int v7 = [(BMLocationSemantic *)self loiIdentifier];
  int v8 = (void *)[v3 initWithFormat:@"BMLocationSemantic with starting: %@, userSpecificPlaceType: %@, placeType: %@, loiIdentifier: %@", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (BMLocationSemantic)initWithStarting:(id)a3 userSpecificPlaceType:(int)a4 placeType:(int)a5 loiIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v16.receiver = self;
  v16.super_class = (Class)BMLocationSemantic;
  unint64_t v12 = [(BMEventBase *)&v16 init];
  if (v12)
  {
    v12->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v10)
    {
      v12->_hasStarting = 1;
      v12->_starting = [v10 BOOLValue];
    }
    else
    {
      v12->_hasStarting = 0;
      v12->_starting = 0;
    }
    v12->_userSpecificPlaceType = a4;
    v12->_placeType = a5;
    if (v11)
    {
      uint64_t v13 = [v11 UUIDString];
      raw_loiIdentifier = v12->_raw_loiIdentifier;
      v12->_raw_loiIdentifier = (NSString *)v13;
    }
    else
    {
      raw_loiIdentifier = v12->_raw_loiIdentifier;
      v12->_raw_loiIdentifier = 0;
    }
  }
  return v12;
}

+ (id)protoFields
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"starting" number:1 type:12 subMessageClass:0];
  v8[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"userSpecificPlaceType" number:2 type:4 subMessageClass:0];
  v8[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"placeType" number:3 type:4 subMessageClass:0];
  v8[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"loiIdentifier" number:4 type:13 subMessageClass:0];
  v8[3] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3ED0;
}

+ (id)columns
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"starting" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:12 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"userSpecificPlaceType" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"placeType" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:4 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"loiIdentifier" dataType:6 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:3];
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  v8[3] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5 = a3;
  if (a4)
  {
    if (a4 != 1)
    {
      v9 = 0;
      goto LABEL_9;
    }
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F94090]) initWithData:v5];
    int v7 = BMLocationSemantic;
  }
  else
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F94090]) initWithData:v5];
    int v7 = BMLocationSemantic_v0;
  }
  uint64_t v8 = [[v7 alloc] initByReadFrom:v6];
  v9 = (void *)v8;
  if (v8) {
    *(_DWORD *)(v8 + 28) = a4;
  }

LABEL_9:

  return v9;
}

+ (unsigned)latestDataVersion
{
  return 1;
}

@end