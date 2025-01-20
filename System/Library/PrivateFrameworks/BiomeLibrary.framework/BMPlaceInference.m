@interface BMPlaceInference
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMPlaceInference)initWithIdentifier:(id)a3 placeType:(int)a4 userSpecificPlaceType:(int)a5 userSpecificPlaceTypeSource:(int)a6 mapItem:(id)a7;
- (BMPlaceInference)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMPlaceInferenceMapItem)mapItem;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSUUID)identifier;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)placeType;
- (int)userSpecificPlaceType;
- (int)userSpecificPlaceTypeSource;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMPlaceInference

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);

  objc_storeStrong((id *)&self->_raw_identifier, 0);
}

- (BMPlaceInferenceMapItem)mapItem
{
  return self->_mapItem;
}

- (int)userSpecificPlaceTypeSource
{
  return self->_userSpecificPlaceTypeSource;
}

- (int)userSpecificPlaceType
{
  return self->_userSpecificPlaceType;
}

- (int)placeType
{
  return self->_placeType;
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
    v6 = [(BMPlaceInference *)self identifier];
    uint64_t v7 = [v5 identifier];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMPlaceInference *)self identifier];
      v10 = [v5 identifier];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_12;
      }
    }
    int v13 = [(BMPlaceInference *)self placeType];
    if (v13 == [v5 placeType])
    {
      int v14 = [(BMPlaceInference *)self userSpecificPlaceType];
      if (v14 == [v5 userSpecificPlaceType])
      {
        int v15 = [(BMPlaceInference *)self userSpecificPlaceTypeSource];
        if (v15 == [v5 userSpecificPlaceTypeSource])
        {
          v16 = [(BMPlaceInference *)self mapItem];
          v17 = [v5 mapItem];
          if (v16 == v17)
          {
            char v12 = 1;
          }
          else
          {
            v18 = [(BMPlaceInference *)self mapItem];
            v19 = [v5 mapItem];
            char v12 = [v18 isEqual:v19];
          }
          goto LABEL_13;
        }
      }
    }
LABEL_12:
    char v12 = 0;
LABEL_13:

    goto LABEL_14;
  }
  char v12 = 0;
LABEL_14:

  return v12;
}

- (NSUUID)identifier
{
  raw_identifier = self->_raw_identifier;
  if (raw_identifier)
  {
    v3 = [MEMORY[0x1E4F50320] convertValue:raw_identifier toType:3];
  }
  else
  {
    v3 = 0;
  }

  return (NSUUID *)v3;
}

- (id)jsonDictionary
{
  v24[5] = *MEMORY[0x1E4F143B8];
  v3 = [(BMPlaceInference *)self identifier];
  id v4 = [v3 UUIDString];

  id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPlaceInference placeType](self, "placeType"));
  v6 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPlaceInference userSpecificPlaceType](self, "userSpecificPlaceType"));
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPlaceInference userSpecificPlaceTypeSource](self, "userSpecificPlaceTypeSource"));
  v8 = [(BMPlaceInference *)self mapItem];
  v9 = [v8 jsonDictionary];

  v19 = @"identifier";
  uint64_t v10 = (uint64_t)v4;
  if (!v4)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v17 = v10;
  v24[0] = v10;
  v20 = @"placeType";
  int v11 = v5;
  if (!v5)
  {
    int v11 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v10, v19, v20);
  }
  v24[1] = v11;
  v21 = @"userSpecificPlaceType";
  char v12 = v6;
  if (!v6)
  {
    char v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v24[2] = v12;
  v22 = @"userSpecificPlaceTypeSource";
  int v13 = v7;
  if (!v7)
  {
    int v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v24[3] = v13;
  v23 = @"mapItem";
  int v14 = v9;
  if (!v9)
  {
    int v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v24[4] = v14;
  int v15 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v24, &v19, 5, v17);
  if (v9)
  {
    if (v7) {
      goto LABEL_13;
    }
  }
  else
  {

    if (v7)
    {
LABEL_13:
      if (v6) {
        goto LABEL_14;
      }
      goto LABEL_21;
    }
  }

  if (v6)
  {
LABEL_14:
    if (v5) {
      goto LABEL_15;
    }
LABEL_22:

    if (v4) {
      goto LABEL_16;
    }
    goto LABEL_23;
  }
LABEL_21:

  if (!v5) {
    goto LABEL_22;
  }
LABEL_15:
  if (v4) {
    goto LABEL_16;
  }
LABEL_23:

LABEL_16:

  return v15;
}

- (BMPlaceInference)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v63[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"identifier"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v8];
    if (!v10)
    {
      if (a4)
      {
        id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v31 = *MEMORY[0x1E4F502C8];
        uint64_t v62 = *MEMORY[0x1E4F28568];
        v50 = (void *)[[NSString alloc] initWithFormat:@"-initWithUUIDString: for %@ returned nil", @"identifier"];
        v63[0] = v50;
        v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:&v62 count:1];
        *a4 = (id)[v30 initWithDomain:v31 code:2 userInfo:v32];

        int v15 = 0;
      }
      else
      {
        int v15 = 0;
      }
      goto LABEL_60;
    }
    int v11 = (void *)v10;

    id v8 = v11;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"placeType"];
    v42 = a4;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = v9;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v47 = 0;
            int v15 = 0;
LABEL_58:

            goto LABEL_60;
          }
          id v49 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v28 = *MEMORY[0x1E4F502C8];
          uint64_t v58 = *MEMORY[0x1E4F28568];
          v45 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"placeType"];
          v59 = v45;
          v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
          id v29 = (id)[v49 initWithDomain:v28 code:2 userInfo:v16];
          v47 = 0;
          int v15 = 0;
          id *v42 = v29;
LABEL_57:

          goto LABEL_58;
        }
        id v12 = [NSNumber numberWithInt:BMPlaceInferencePlaceTypeFromString(v9)];
      }
      v47 = v12;
    }
    else
    {
      v47 = 0;
    }
    v16 = [v6 objectForKeyedSubscript:@"userSpecificPlaceType"];
    id v44 = v8;
    if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v17 = v16;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v42)
          {
            v45 = 0;
            int v15 = 0;
            goto LABEL_57;
          }
          id v46 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v33 = *MEMORY[0x1E4F502C8];
          uint64_t v56 = *MEMORY[0x1E4F28568];
          v19 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"userSpecificPlaceType"];
          v57 = v19;
          v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
          id v34 = (id)[v46 initWithDomain:v33 code:2 userInfo:v18];
          v45 = 0;
          int v15 = 0;
          id *v42 = v34;
          goto LABEL_56;
        }
        id v17 = [NSNumber numberWithInt:BMPlaceInferenceUserSpecificPlaceTypeFromString(v16)];
      }
      v45 = v17;
    }
    else
    {
      v45 = 0;
    }
    v18 = [v6 objectForKeyedSubscript:@"userSpecificPlaceTypeSource"];
    v43 = v7;
    if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v20 = v18;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v42)
          {
            v19 = 0;
            int v15 = 0;
            goto LABEL_56;
          }
          id v41 = objc_alloc(MEMORY[0x1E4F28C58]);
          v35 = self;
          uint64_t v36 = *MEMORY[0x1E4F502C8];
          uint64_t v54 = *MEMORY[0x1E4F28568];
          v21 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"userSpecificPlaceTypeSource"];
          v55 = v21;
          v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
          uint64_t v37 = v36;
          self = v35;
          v19 = 0;
          int v15 = 0;
          id *v42 = (id)[v41 initWithDomain:v37 code:2 userInfo:v23];
          goto LABEL_54;
        }
        id v20 = [NSNumber numberWithInt:BMPlaceInferenceUserSpecificPlaceTypeSourceFromString(v18)];
      }
      v19 = v20;
    }
    else
    {
      v19 = 0;
    }
    v21 = [v6 objectForKeyedSubscript:@"mapItem"];
    v22 = self;
    if (!v21 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v23 = 0;
LABEL_36:
      self = -[BMPlaceInference initWithIdentifier:placeType:userSpecificPlaceType:userSpecificPlaceTypeSource:mapItem:](v22, "initWithIdentifier:placeType:userSpecificPlaceType:userSpecificPlaceTypeSource:mapItem:", v44, [v47 intValue], objc_msgSend(v45, "intValue"), objc_msgSend(v19, "intValue"), v23);
      int v15 = self;
LABEL_54:

LABEL_55:
      uint64_t v7 = v43;

LABEL_56:
      id v8 = v44;
      goto LABEL_57;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v24 = v21;
      id v51 = 0;
      v23 = [[BMPlaceInferenceMapItem alloc] initWithJSONDictionary:v24 error:&v51];
      id v25 = v51;
      if (!v25)
      {

        goto LABEL_36;
      }
      v26 = v25;
      if (v42) {
        id *v42 = v25;
      }

      int v15 = 0;
      v21 = v24;
    }
    else
    {
      if (!v42)
      {
        int v15 = 0;
        goto LABEL_55;
      }
      id v40 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v39 = *MEMORY[0x1E4F502C8];
      uint64_t v52 = *MEMORY[0x1E4F28568];
      v23 = (BMPlaceInferenceMapItem *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"mapItem"];
      v53 = v23;
      v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
      id *v42 = (id)[v40 initWithDomain:v39 code:2 userInfo:v27];

      int v15 = 0;
    }
    self = v22;
    goto LABEL_54;
  }
  if (a4)
  {
    id v13 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v14 = *MEMORY[0x1E4F502C8];
    uint64_t v60 = *MEMORY[0x1E4F28568];
    id v8 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"identifier"];
    id v61 = v8;
    v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
    int v15 = 0;
    *a4 = (id)objc_msgSend(v13, "initWithDomain:code:userInfo:", v14, 2);

LABEL_60:
    goto LABEL_61;
  }
  int v15 = 0;
LABEL_61:

  return v15;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMPlaceInference *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_raw_identifier) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_mapItem)
  {
    PBDataWriterPlaceMark();
    [(BMPlaceInferenceMapItem *)self->_mapItem writeTo:v4];
    PBDataWriterRecallMark();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)BMPlaceInference;
  id v5 = [(BMEventBase *)&v46 init];
  if (!v5) {
    goto LABEL_69;
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
      switch((v12 >> 3))
      {
        case 1u:
          uint64_t v20 = PBReaderReadString();
          raw_identifier = v5->_raw_identifier;
          v5->_raw_identifier = (NSString *)v20;

          continue;
        case 2u:
          char v22 = 0;
          unsigned int v23 = 0;
          uint64_t v24 = 0;
          while (1)
          {
            uint64_t v25 = *v6;
            uint64_t v26 = *(void *)&v4[v25];
            unint64_t v27 = v26 + 1;
            if (v26 == -1 || v27 > *(void *)&v4[*v7]) {
              break;
            }
            char v28 = *(unsigned char *)(*(void *)&v4[*v9] + v26);
            *(void *)&v4[v25] = v27;
            v24 |= (unint64_t)(v28 & 0x7F) << v22;
            if ((v28 & 0x80) == 0) {
              goto LABEL_48;
            }
            v22 += 7;
            BOOL v17 = v23++ >= 9;
            if (v17)
            {
              LODWORD(v24) = 0;
              goto LABEL_50;
            }
          }
          v4[*v8] = 1;
LABEL_48:
          if (v4[*v8]) {
            LODWORD(v24) = 0;
          }
LABEL_50:
          if (v24 >= 5) {
            LODWORD(v24) = 0;
          }
          uint64_t v43 = 28;
          goto LABEL_65;
        case 3u:
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v24 = 0;
          while (2)
          {
            uint64_t v31 = *v6;
            uint64_t v32 = *(void *)&v4[v31];
            unint64_t v33 = v32 + 1;
            if (v32 == -1 || v33 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v34 = *(unsigned char *)(*(void *)&v4[*v9] + v32);
              *(void *)&v4[v31] = v33;
              v24 |= (unint64_t)(v34 & 0x7F) << v29;
              if (v34 < 0)
              {
                v29 += 7;
                BOOL v17 = v30++ >= 9;
                if (v17)
                {
                  LODWORD(v24) = 0;
                  goto LABEL_56;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v24) = 0;
          }
LABEL_56:
          if (v24 >= 5) {
            LODWORD(v24) = 0;
          }
          uint64_t v43 = 32;
          goto LABEL_65;
        case 4u:
          char v35 = 0;
          unsigned int v36 = 0;
          uint64_t v24 = 0;
          break;
        case 5u:
          uint64_t v47 = 0;
          uint64_t v48 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_68;
          }
          id v41 = [[BMPlaceInferenceMapItem alloc] initByReadFrom:v4];
          if (!v41) {
            goto LABEL_68;
          }
          mapItem = v5->_mapItem;
          v5->_mapItem = v41;

          PBReaderRecallMark();
          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_68;
          }
          continue;
      }
      while (1)
      {
        uint64_t v37 = *v6;
        uint64_t v38 = *(void *)&v4[v37];
        unint64_t v39 = v38 + 1;
        if (v38 == -1 || v39 > *(void *)&v4[*v7]) {
          break;
        }
        char v40 = *(unsigned char *)(*(void *)&v4[*v9] + v38);
        *(void *)&v4[v37] = v39;
        v24 |= (unint64_t)(v40 & 0x7F) << v35;
        if ((v40 & 0x80) == 0) {
          goto LABEL_60;
        }
        v35 += 7;
        BOOL v17 = v36++ >= 9;
        if (v17)
        {
          LODWORD(v24) = 0;
          goto LABEL_62;
        }
      }
      v4[*v8] = 1;
LABEL_60:
      if (v4[*v8]) {
        LODWORD(v24) = 0;
      }
LABEL_62:
      if (v24 >= 5) {
        LODWORD(v24) = 0;
      }
      uint64_t v43 = 36;
LABEL_65:
      *(_DWORD *)((char *)&v5->super.super.isa + v43) = v24;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_68:
  }
    id v44 = 0;
  else {
LABEL_69:
  }
    id v44 = v5;

  return v44;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMPlaceInference *)self identifier];
  id v5 = BMPlaceInferencePlaceTypeAsString([(BMPlaceInference *)self placeType]);
  id v6 = BMPlaceInferenceUserSpecificPlaceTypeAsString([(BMPlaceInference *)self userSpecificPlaceType]);
  uint64_t v7 = BMPlaceInferenceUserSpecificPlaceTypeSourceAsString([(BMPlaceInference *)self userSpecificPlaceTypeSource]);
  id v8 = [(BMPlaceInference *)self mapItem];
  v9 = (void *)[v3 initWithFormat:@"BMPlaceInference with identifier: %@, placeType: %@, userSpecificPlaceType: %@, userSpecificPlaceTypeSource: %@, mapItem: %@", v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (BMPlaceInference)initWithIdentifier:(id)a3 placeType:(int)a4 userSpecificPlaceType:(int)a5 userSpecificPlaceTypeSource:(int)a6 mapItem:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  v18.receiver = self;
  v18.super_class = (Class)BMPlaceInference;
  uint64_t v14 = [(BMEventBase *)&v18 init];
  if (v14)
  {
    v14->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v12)
    {
      uint64_t v15 = [v12 UUIDString];
      raw_identifier = v14->_raw_identifier;
      v14->_raw_identifier = (NSString *)v15;
    }
    else
    {
      raw_identifier = v14->_raw_identifier;
      v14->_raw_identifier = 0;
    }

    v14->_placeType = a4;
    v14->_userSpecificPlaceType = a5;
    v14->_userSpecificPlaceTypeSource = a6;
    objc_storeStrong((id *)&v14->_mapItem, a7);
  }

  return v14;
}

+ (id)protoFields
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"identifier" number:1 type:13 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"placeType", 2, 4, 0, v2);
  v9[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"userSpecificPlaceType" number:3 type:4 subMessageClass:0];
  v9[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"userSpecificPlaceTypeSource" number:4 type:4 subMessageClass:0];
  v9[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"mapItem" number:5 type:14 subMessageClass:objc_opt_class()];
  v9[4] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF6408;
}

+ (id)columns
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"identifier" dataType:6 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:3];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"placeType" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"userSpecificPlaceType" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:4 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"userSpecificPlaceTypeSource" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:4 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"mapItem_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_237_64994];
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  v9[4] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

id __27__BMPlaceInference_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 mapItem];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

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

    id v8 = [[BMPlaceInference alloc] initByReadFrom:v7];
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