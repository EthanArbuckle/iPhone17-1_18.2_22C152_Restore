@interface BMOasisAnalyticsTrackingStateType
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMOasisAnalyticsTrackingStateType)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMOasisAnalyticsTrackingStateType)initWithMode:(int)a3 health:(id)a4 numberInlierPoints:(id)a5 numberOfRegularKeyframes:(id)a6;
- (BOOL)hasHealth;
- (BOOL)hasNumberInlierPoints;
- (BOOL)hasNumberOfRegularKeyframes;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (float)health;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)mode;
- (unsigned)dataVersion;
- (unsigned)numberInlierPoints;
- (unsigned)numberOfRegularKeyframes;
- (void)setHasHealth:(BOOL)a3;
- (void)setHasNumberInlierPoints:(BOOL)a3;
- (void)setHasNumberOfRegularKeyframes:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMOasisAnalyticsTrackingStateType

- (void)setHasNumberOfRegularKeyframes:(BOOL)a3
{
  self->_hasNumberOfRegularKeyframes = a3;
}

- (BOOL)hasNumberOfRegularKeyframes
{
  return self->_hasNumberOfRegularKeyframes;
}

- (unsigned)numberOfRegularKeyframes
{
  return self->_numberOfRegularKeyframes;
}

- (void)setHasNumberInlierPoints:(BOOL)a3
{
  self->_hasNumberInlierPoints = a3;
}

- (BOOL)hasNumberInlierPoints
{
  return self->_hasNumberInlierPoints;
}

- (unsigned)numberInlierPoints
{
  return self->_numberInlierPoints;
}

- (void)setHasHealth:(BOOL)a3
{
  self->_hasHealth = a3;
}

- (BOOL)hasHealth
{
  return self->_hasHealth;
}

- (float)health
{
  return self->_health;
}

- (int)mode
{
  return self->_mode;
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
    int v6 = [(BMOasisAnalyticsTrackingStateType *)self mode];
    if (v6 != [v5 mode]) {
      goto LABEL_19;
    }
    if ([(BMOasisAnalyticsTrackingStateType *)self hasHealth]
      || [v5 hasHealth])
    {
      if (![(BMOasisAnalyticsTrackingStateType *)self hasHealth]) {
        goto LABEL_19;
      }
      if (![v5 hasHealth]) {
        goto LABEL_19;
      }
      [(BMOasisAnalyticsTrackingStateType *)self health];
      float v8 = v7;
      [v5 health];
      if (v8 != v9) {
        goto LABEL_19;
      }
    }
    if ([(BMOasisAnalyticsTrackingStateType *)self hasNumberInlierPoints]
      || [v5 hasNumberInlierPoints])
    {
      if (![(BMOasisAnalyticsTrackingStateType *)self hasNumberInlierPoints]) {
        goto LABEL_19;
      }
      if (![v5 hasNumberInlierPoints]) {
        goto LABEL_19;
      }
      unsigned int v10 = [(BMOasisAnalyticsTrackingStateType *)self numberInlierPoints];
      if (v10 != [v5 numberInlierPoints]) {
        goto LABEL_19;
      }
    }
    if (![(BMOasisAnalyticsTrackingStateType *)self hasNumberOfRegularKeyframes]
      && ![v5 hasNumberOfRegularKeyframes])
    {
      BOOL v12 = 1;
      goto LABEL_20;
    }
    if ([(BMOasisAnalyticsTrackingStateType *)self hasNumberOfRegularKeyframes]
      && [v5 hasNumberOfRegularKeyframes])
    {
      unsigned int v11 = [(BMOasisAnalyticsTrackingStateType *)self numberOfRegularKeyframes];
      BOOL v12 = v11 == [v5 numberOfRegularKeyframes];
    }
    else
    {
LABEL_19:
      BOOL v12 = 0;
    }
LABEL_20:

    goto LABEL_21;
  }
  BOOL v12 = 0;
LABEL_21:

  return v12;
}

- (id)jsonDictionary
{
  v16[4] = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMOasisAnalyticsTrackingStateType mode](self, "mode"));
  if (![(BMOasisAnalyticsTrackingStateType *)self hasHealth]
    || ([(BMOasisAnalyticsTrackingStateType *)self health], fabsf(v4) == INFINITY))
  {
    int v6 = 0;
  }
  else
  {
    [(BMOasisAnalyticsTrackingStateType *)self health];
    id v5 = NSNumber;
    [(BMOasisAnalyticsTrackingStateType *)self health];
    int v6 = objc_msgSend(v5, "numberWithFloat:");
  }
  if ([(BMOasisAnalyticsTrackingStateType *)self hasNumberInlierPoints])
  {
    float v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMOasisAnalyticsTrackingStateType numberInlierPoints](self, "numberInlierPoints"));
  }
  else
  {
    float v7 = 0;
  }
  if ([(BMOasisAnalyticsTrackingStateType *)self hasNumberOfRegularKeyframes])
  {
    float v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMOasisAnalyticsTrackingStateType numberOfRegularKeyframes](self, "numberOfRegularKeyframes"));
  }
  else
  {
    float v8 = 0;
  }
  v15[0] = @"mode";
  float v9 = v3;
  if (!v3)
  {
    float v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v16[0] = v9;
  v15[1] = @"health";
  unsigned int v10 = v6;
  if (!v6)
  {
    unsigned int v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v16[1] = v10;
  v15[2] = @"numberInlierPoints";
  unsigned int v11 = v7;
  if (!v7)
  {
    unsigned int v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v16[2] = v11;
  v15[3] = @"numberOfRegularKeyframes";
  BOOL v12 = v8;
  if (!v8)
  {
    BOOL v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v16[3] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];
  if (v8)
  {
    if (v7) {
      goto LABEL_21;
    }
  }
  else
  {

    if (v7)
    {
LABEL_21:
      if (v6) {
        goto LABEL_22;
      }
LABEL_28:

      if (v3) {
        goto LABEL_23;
      }
      goto LABEL_29;
    }
  }

  if (!v6) {
    goto LABEL_28;
  }
LABEL_22:
  if (v3) {
    goto LABEL_23;
  }
LABEL_29:

LABEL_23:

  return v13;
}

- (BMOasisAnalyticsTrackingStateType)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v44[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  float v7 = [v6 objectForKeyedSubscript:@"mode"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v36 = 0;
LABEL_9:
    float v9 = [v6 objectForKeyedSubscript:@"health"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v10 = 0;
          v20 = 0;
          goto LABEL_35;
        }
        id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v22 = *MEMORY[0x1E4F502C8];
        uint64_t v41 = *MEMORY[0x1E4F28568];
        id v15 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"health"];
        id v42 = v15;
        unsigned int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
        id v23 = (id)[v21 initWithDomain:v22 code:2 userInfo:v11];
        v20 = 0;
        id v10 = 0;
        *a4 = v23;
        goto LABEL_34;
      }
      id v10 = v9;
    }
    else
    {
      id v10 = 0;
    }
    unsigned int v11 = [v6 objectForKeyedSubscript:@"numberInlierPoints"];
    v35 = v7;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v15 = 0;
          v20 = 0;
          goto LABEL_34;
        }
        id v33 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v24 = *MEMORY[0x1E4F502C8];
        uint64_t v39 = *MEMORY[0x1E4F28568];
        id v17 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"numberInlierPoints"];
        id v40 = v17;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
        id v12 = v10;
        v13 = self;
        v16 = v25 = a4;
        id v26 = (id)[v33 initWithDomain:v24 code:2 userInfo:v16];
        v20 = 0;
        id v15 = 0;
        id *v25 = v26;
        goto LABEL_32;
      }
      id v12 = v10;
      v13 = self;
      v14 = a4;
      id v15 = v11;
    }
    else
    {
      id v12 = v10;
      v13 = self;
      v14 = a4;
      id v15 = 0;
    }
    v16 = [v6 objectForKeyedSubscript:@"numberOfRegularKeyframes"];
    if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v17 = 0;
LABEL_18:
      uint64_t v18 = [v36 intValue];
      v19 = v13;
      id v10 = v12;
      self = [(BMOasisAnalyticsTrackingStateType *)v19 initWithMode:v18 health:v12 numberInlierPoints:v15 numberOfRegularKeyframes:v17];
      v20 = self;
LABEL_33:

      float v7 = v35;
LABEL_34:

      goto LABEL_35;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v17 = v16;
      goto LABEL_18;
    }
    if (v14)
    {
      id v34 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v32 = *MEMORY[0x1E4F502C8];
      uint64_t v37 = *MEMORY[0x1E4F28568];
      v27 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"numberOfRegularKeyframes"];
      v38 = v27;
      v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
      id *v14 = (id)[v34 initWithDomain:v32 code:2 userInfo:v28];
    }
    id v17 = 0;
    v20 = 0;
LABEL_32:
    self = v13;
    id v10 = v12;
    goto LABEL_33;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
LABEL_8:
    v36 = v8;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [NSNumber numberWithInt:BMOasisAnalyticsTrackingStateTrackingModeFromString(v7)];
    goto LABEL_8;
  }
  if (!a4)
  {
    v36 = 0;
    v20 = 0;
    goto LABEL_36;
  }
  id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v31 = *MEMORY[0x1E4F502C8];
  uint64_t v43 = *MEMORY[0x1E4F28568];
  id v10 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"mode"];
  v44[0] = v10;
  float v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:&v43 count:1];
  v36 = 0;
  v20 = 0;
  *a4 = (id)[v30 initWithDomain:v31 code:2 userInfo:v9];
LABEL_35:

LABEL_36:
  return v20;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMOasisAnalyticsTrackingStateType *)self writeTo:v3];
  float v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_hasHealth) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasNumberInlierPoints) {
    PBDataWriterWriteUint32Field();
  }
  float v4 = v5;
  if (self->_hasNumberOfRegularKeyframes)
  {
    PBDataWriterWriteUint32Field();
    float v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  float v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)BMOasisAnalyticsTrackingStateType;
  id v5 = [(BMEventBase *)&v46 init];
  if (!v5) {
    goto LABEL_66;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  float v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    float v9 = (int *)MEMORY[0x1E4F940B8];
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
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          while (2)
          {
            uint64_t v23 = *v6;
            uint64_t v24 = *(void *)&v4[v23];
            unint64_t v25 = v24 + 1;
            if (v24 == -1 || v25 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v26 = *(unsigned char *)(*(void *)&v4[*v9] + v24);
              *(void *)&v4[v23] = v25;
              v22 |= (unint64_t)(v26 & 0x7F) << v20;
              if (v26 < 0)
              {
                v20 += 7;
                BOOL v17 = v21++ >= 9;
                if (v17)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_49;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v22) = 0;
          }
LABEL_49:
          if (v22 >= 4) {
            LODWORD(v22) = 0;
          }
          v5->_mode = v22;
          continue;
        case 2u:
          v5->_hasHealth = 1;
          uint64_t v27 = *v6;
          unint64_t v28 = *(void *)&v4[v27];
          if (v28 <= 0xFFFFFFFFFFFFFFFBLL && v28 + 4 <= *(void *)&v4[*v7])
          {
            float v29 = *(float *)(*(void *)&v4[*v9] + v28);
            *(void *)&v4[v27] = v28 + 4;
          }
          else
          {
            v4[*v8] = 1;
            float v29 = 0.0;
          }
          v5->_health = v29;
          continue;
        case 3u:
          char v30 = 0;
          unsigned int v31 = 0;
          uint64_t v32 = 0;
          v5->_hasNumberInlierPoints = 1;
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
              goto LABEL_53;
            }
            v30 += 7;
            BOOL v17 = v31++ >= 9;
            if (v17)
            {
              LODWORD(v32) = 0;
              goto LABEL_55;
            }
          }
          v4[*v8] = 1;
LABEL_53:
          if (v4[*v8]) {
            LODWORD(v32) = 0;
          }
LABEL_55:
          uint64_t v43 = 32;
          goto LABEL_60;
        case 4u:
          char v37 = 0;
          unsigned int v38 = 0;
          uint64_t v32 = 0;
          v5->_hasNumberOfRegularKeyframes = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_65;
          }
          continue;
      }
      while (1)
      {
        uint64_t v39 = *v6;
        uint64_t v40 = *(void *)&v4[v39];
        unint64_t v41 = v40 + 1;
        if (v40 == -1 || v41 > *(void *)&v4[*v7]) {
          break;
        }
        char v42 = *(unsigned char *)(*(void *)&v4[*v9] + v40);
        *(void *)&v4[v39] = v41;
        v32 |= (unint64_t)(v42 & 0x7F) << v37;
        if ((v42 & 0x80) == 0) {
          goto LABEL_57;
        }
        v37 += 7;
        BOOL v17 = v38++ >= 9;
        if (v17)
        {
          LODWORD(v32) = 0;
          goto LABEL_59;
        }
      }
      v4[*v8] = 1;
LABEL_57:
      if (v4[*v8]) {
        LODWORD(v32) = 0;
      }
LABEL_59:
      uint64_t v43 = 36;
LABEL_60:
      *(_DWORD *)((char *)&v5->super.super.isa + v43) = v32;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_65:
  }
    v44 = 0;
  else {
LABEL_66:
  }
    v44 = v5;

  return v44;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  float v4 = BMOasisAnalyticsTrackingStateTrackingModeAsString([(BMOasisAnalyticsTrackingStateType *)self mode]);
  id v5 = NSNumber;
  [(BMOasisAnalyticsTrackingStateType *)self health];
  id v6 = objc_msgSend(v5, "numberWithFloat:");
  float v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMOasisAnalyticsTrackingStateType numberInlierPoints](self, "numberInlierPoints"));
  id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMOasisAnalyticsTrackingStateType numberOfRegularKeyframes](self, "numberOfRegularKeyframes"));
  float v9 = (void *)[v3 initWithFormat:@"BMOasisAnalyticsTrackingStateType with mode: %@, health: %@, numberInlierPoints: %@, numberOfRegularKeyframes: %@", v4, v6, v7, v8];

  return (NSString *)v9;
}

- (BMOasisAnalyticsTrackingStateType)initWithMode:(int)a3 health:(id)a4 numberInlierPoints:(id)a5 numberOfRegularKeyframes:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)BMOasisAnalyticsTrackingStateType;
  uint64_t v13 = [(BMEventBase *)&v18 init];
  if (v13)
  {
    v13->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    v13->_mode = a3;
    if (v10)
    {
      v13->_hasHealth = 1;
      [v10 floatValue];
    }
    else
    {
      v13->_hasHealth = 0;
      float v14 = -1.0;
    }
    v13->_health = v14;
    if (v11)
    {
      v13->_hasNumberInlierPoints = 1;
      unsigned int v15 = [v11 unsignedIntValue];
    }
    else
    {
      unsigned int v15 = 0;
      v13->_hasNumberInlierPoints = 0;
    }
    v13->_numberInlierPoints = v15;
    if (v12)
    {
      v13->_hasNumberOfRegularKeyframes = 1;
      unsigned int v16 = [v12 unsignedIntValue];
    }
    else
    {
      unsigned int v16 = 0;
      v13->_hasNumberOfRegularKeyframes = 0;
    }
    v13->_numberOfRegularKeyframes = v16;
  }

  return v13;
}

+ (id)protoFields
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"mode" number:1 type:4 subMessageClass:0];
  v8[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"health" number:2 type:1 subMessageClass:0];
  v8[1] = v3;
  float v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"numberInlierPoints" number:3 type:4 subMessageClass:0];
  v8[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"numberOfRegularKeyframes" number:4 type:4 subMessageClass:0];
  v8[3] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF7830;
}

+ (id)columns
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"mode" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:4 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"health" dataType:1 requestOnly:0 fieldNumber:2 protoDataType:1 convertedType:0];
  float v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"numberInlierPoints" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:4 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"numberOfRegularKeyframes" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:4 convertedType:0];
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
    float v4 = 0;
  }
  else
  {
    id v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    float v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMOasisAnalyticsTrackingStateType alloc] initByReadFrom:v7];
    float v4 = v8;
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