@interface BMOasisAnalyticsContextSnapshotType
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMOasisAnalyticsContextSnapshotType)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMOasisAnalyticsContextSnapshotType)initWithLuxLevel:(id)a3 smudgeLevel:(id)a4 prewittLevel:(id)a5 imuAcceleration:(id)a6 imuAngularVelocityX:(id)a7 imuAngularVelocityY:(id)a8 imuAngularVelocityZ:(id)a9 environmentType:(int)a10;
- (BOOL)hasImuAcceleration;
- (BOOL)hasImuAngularVelocityX;
- (BOOL)hasImuAngularVelocityY;
- (BOOL)hasImuAngularVelocityZ;
- (BOOL)hasLuxLevel;
- (BOOL)hasPrewittLevel;
- (BOOL)hasSmudgeLevel;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (float)imuAcceleration;
- (float)imuAngularVelocityX;
- (float)imuAngularVelocityY;
- (float)imuAngularVelocityZ;
- (float)luxLevel;
- (float)prewittLevel;
- (float)smudgeLevel;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)environmentType;
- (unsigned)dataVersion;
- (void)setHasImuAcceleration:(BOOL)a3;
- (void)setHasImuAngularVelocityX:(BOOL)a3;
- (void)setHasImuAngularVelocityY:(BOOL)a3;
- (void)setHasImuAngularVelocityZ:(BOOL)a3;
- (void)setHasLuxLevel:(BOOL)a3;
- (void)setHasPrewittLevel:(BOOL)a3;
- (void)setHasSmudgeLevel:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMOasisAnalyticsContextSnapshotType

- (int)environmentType
{
  return self->_environmentType;
}

- (void)setHasImuAngularVelocityZ:(BOOL)a3
{
  self->_hasImuAngularVelocityZ = a3;
}

- (BOOL)hasImuAngularVelocityZ
{
  return self->_hasImuAngularVelocityZ;
}

- (float)imuAngularVelocityZ
{
  return self->_imuAngularVelocityZ;
}

- (void)setHasImuAngularVelocityY:(BOOL)a3
{
  self->_hasImuAngularVelocityY = a3;
}

- (BOOL)hasImuAngularVelocityY
{
  return self->_hasImuAngularVelocityY;
}

- (float)imuAngularVelocityY
{
  return self->_imuAngularVelocityY;
}

- (void)setHasImuAngularVelocityX:(BOOL)a3
{
  self->_hasImuAngularVelocityX = a3;
}

- (BOOL)hasImuAngularVelocityX
{
  return self->_hasImuAngularVelocityX;
}

- (float)imuAngularVelocityX
{
  return self->_imuAngularVelocityX;
}

- (void)setHasImuAcceleration:(BOOL)a3
{
  self->_hasImuAcceleration = a3;
}

- (BOOL)hasImuAcceleration
{
  return self->_hasImuAcceleration;
}

- (float)imuAcceleration
{
  return self->_imuAcceleration;
}

- (void)setHasPrewittLevel:(BOOL)a3
{
  self->_hasPrewittLevel = a3;
}

- (BOOL)hasPrewittLevel
{
  return self->_hasPrewittLevel;
}

- (float)prewittLevel
{
  return self->_prewittLevel;
}

- (void)setHasSmudgeLevel:(BOOL)a3
{
  self->_hasSmudgeLevel = a3;
}

- (BOOL)hasSmudgeLevel
{
  return self->_hasSmudgeLevel;
}

- (float)smudgeLevel
{
  return self->_smudgeLevel;
}

- (void)setHasLuxLevel:(BOOL)a3
{
  self->_hasLuxLevel = a3;
}

- (BOOL)hasLuxLevel
{
  return self->_hasLuxLevel;
}

- (float)luxLevel
{
  return self->_luxLevel;
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
    if ([(BMOasisAnalyticsContextSnapshotType *)self hasLuxLevel]
      || [v5 hasLuxLevel])
    {
      if (![(BMOasisAnalyticsContextSnapshotType *)self hasLuxLevel]) {
        goto LABEL_39;
      }
      if (![v5 hasLuxLevel]) {
        goto LABEL_39;
      }
      [(BMOasisAnalyticsContextSnapshotType *)self luxLevel];
      float v7 = v6;
      [v5 luxLevel];
      if (v7 != v8) {
        goto LABEL_39;
      }
    }
    if ([(BMOasisAnalyticsContextSnapshotType *)self hasSmudgeLevel]
      || [v5 hasSmudgeLevel])
    {
      if (![(BMOasisAnalyticsContextSnapshotType *)self hasSmudgeLevel]) {
        goto LABEL_39;
      }
      if (![v5 hasSmudgeLevel]) {
        goto LABEL_39;
      }
      [(BMOasisAnalyticsContextSnapshotType *)self smudgeLevel];
      float v10 = v9;
      [v5 smudgeLevel];
      if (v10 != v11) {
        goto LABEL_39;
      }
    }
    if ([(BMOasisAnalyticsContextSnapshotType *)self hasPrewittLevel]
      || [v5 hasPrewittLevel])
    {
      if (![(BMOasisAnalyticsContextSnapshotType *)self hasPrewittLevel]) {
        goto LABEL_39;
      }
      if (![v5 hasPrewittLevel]) {
        goto LABEL_39;
      }
      [(BMOasisAnalyticsContextSnapshotType *)self prewittLevel];
      float v13 = v12;
      [v5 prewittLevel];
      if (v13 != v14) {
        goto LABEL_39;
      }
    }
    if ([(BMOasisAnalyticsContextSnapshotType *)self hasImuAcceleration]
      || [v5 hasImuAcceleration])
    {
      if (![(BMOasisAnalyticsContextSnapshotType *)self hasImuAcceleration]) {
        goto LABEL_39;
      }
      if (![v5 hasImuAcceleration]) {
        goto LABEL_39;
      }
      [(BMOasisAnalyticsContextSnapshotType *)self imuAcceleration];
      float v16 = v15;
      [v5 imuAcceleration];
      if (v16 != v17) {
        goto LABEL_39;
      }
    }
    if ([(BMOasisAnalyticsContextSnapshotType *)self hasImuAngularVelocityX]
      || [v5 hasImuAngularVelocityX])
    {
      if (![(BMOasisAnalyticsContextSnapshotType *)self hasImuAngularVelocityX]) {
        goto LABEL_39;
      }
      if (![v5 hasImuAngularVelocityX]) {
        goto LABEL_39;
      }
      [(BMOasisAnalyticsContextSnapshotType *)self imuAngularVelocityX];
      float v19 = v18;
      [v5 imuAngularVelocityX];
      if (v19 != v20) {
        goto LABEL_39;
      }
    }
    if ((![(BMOasisAnalyticsContextSnapshotType *)self hasImuAngularVelocityY]
       && ![v5 hasImuAngularVelocityY]
       || [(BMOasisAnalyticsContextSnapshotType *)self hasImuAngularVelocityY]
       && [v5 hasImuAngularVelocityY]
       && ([(BMOasisAnalyticsContextSnapshotType *)self imuAngularVelocityY],
           float v22 = v21,
           [v5 imuAngularVelocityY],
           v22 == v23))
      && (![(BMOasisAnalyticsContextSnapshotType *)self hasImuAngularVelocityZ]
       && ![v5 hasImuAngularVelocityZ]
       || [(BMOasisAnalyticsContextSnapshotType *)self hasImuAngularVelocityZ]
       && [v5 hasImuAngularVelocityZ]
       && ([(BMOasisAnalyticsContextSnapshotType *)self imuAngularVelocityZ],
           float v25 = v24,
           [v5 imuAngularVelocityZ],
           v25 == v26)))
    {
      int v27 = [(BMOasisAnalyticsContextSnapshotType *)self environmentType];
      BOOL v28 = v27 == [v5 environmentType];
    }
    else
    {
LABEL_39:
      BOOL v28 = 0;
    }
  }
  else
  {
    BOOL v28 = 0;
  }

  return v28;
}

- (id)jsonDictionary
{
  v44[8] = *MEMORY[0x1E4F143B8];
  if (![(BMOasisAnalyticsContextSnapshotType *)self hasLuxLevel]
    || ([(BMOasisAnalyticsContextSnapshotType *)self luxLevel], fabsf(v3) == INFINITY))
  {
    uint64_t v5 = 0;
  }
  else
  {
    [(BMOasisAnalyticsContextSnapshotType *)self luxLevel];
    id v4 = NSNumber;
    [(BMOasisAnalyticsContextSnapshotType *)self luxLevel];
    uint64_t v5 = objc_msgSend(v4, "numberWithFloat:");
  }
  if (![(BMOasisAnalyticsContextSnapshotType *)self hasSmudgeLevel]
    || ([(BMOasisAnalyticsContextSnapshotType *)self smudgeLevel], fabsf(v6) == INFINITY))
  {
    uint64_t v8 = 0;
  }
  else
  {
    [(BMOasisAnalyticsContextSnapshotType *)self smudgeLevel];
    float v7 = NSNumber;
    [(BMOasisAnalyticsContextSnapshotType *)self smudgeLevel];
    uint64_t v8 = objc_msgSend(v7, "numberWithFloat:");
  }
  if (![(BMOasisAnalyticsContextSnapshotType *)self hasPrewittLevel]
    || ([(BMOasisAnalyticsContextSnapshotType *)self prewittLevel], fabsf(v9) == INFINITY))
  {
    uint64_t v11 = 0;
  }
  else
  {
    [(BMOasisAnalyticsContextSnapshotType *)self prewittLevel];
    float v10 = NSNumber;
    [(BMOasisAnalyticsContextSnapshotType *)self prewittLevel];
    uint64_t v11 = objc_msgSend(v10, "numberWithFloat:");
  }
  if (![(BMOasisAnalyticsContextSnapshotType *)self hasImuAcceleration]
    || ([(BMOasisAnalyticsContextSnapshotType *)self imuAcceleration], fabsf(v12) == INFINITY))
  {
    uint64_t v14 = 0;
  }
  else
  {
    [(BMOasisAnalyticsContextSnapshotType *)self imuAcceleration];
    float v13 = NSNumber;
    [(BMOasisAnalyticsContextSnapshotType *)self imuAcceleration];
    uint64_t v14 = objc_msgSend(v13, "numberWithFloat:");
  }
  if (![(BMOasisAnalyticsContextSnapshotType *)self hasImuAngularVelocityX]
    || ([(BMOasisAnalyticsContextSnapshotType *)self imuAngularVelocityX], fabsf(v15) == INFINITY))
  {
    uint64_t v17 = 0;
  }
  else
  {
    [(BMOasisAnalyticsContextSnapshotType *)self imuAngularVelocityX];
    float v16 = NSNumber;
    [(BMOasisAnalyticsContextSnapshotType *)self imuAngularVelocityX];
    uint64_t v17 = objc_msgSend(v16, "numberWithFloat:");
  }
  if (![(BMOasisAnalyticsContextSnapshotType *)self hasImuAngularVelocityY]
    || ([(BMOasisAnalyticsContextSnapshotType *)self imuAngularVelocityY], fabsf(v18) == INFINITY))
  {
    float v20 = 0;
  }
  else
  {
    [(BMOasisAnalyticsContextSnapshotType *)self imuAngularVelocityY];
    float v19 = NSNumber;
    [(BMOasisAnalyticsContextSnapshotType *)self imuAngularVelocityY];
    float v20 = objc_msgSend(v19, "numberWithFloat:");
  }
  if (![(BMOasisAnalyticsContextSnapshotType *)self hasImuAngularVelocityZ]
    || ([(BMOasisAnalyticsContextSnapshotType *)self imuAngularVelocityZ], fabsf(v21) == INFINITY))
  {
    float v23 = 0;
  }
  else
  {
    [(BMOasisAnalyticsContextSnapshotType *)self imuAngularVelocityZ];
    float v22 = NSNumber;
    [(BMOasisAnalyticsContextSnapshotType *)self imuAngularVelocityZ];
    float v23 = objc_msgSend(v22, "numberWithFloat:");
  }
  float v24 = objc_msgSend(NSNumber, "numberWithInt:", -[BMOasisAnalyticsContextSnapshotType environmentType](self, "environmentType"));
  v43[0] = @"luxLevel";
  uint64_t v25 = v5;
  if (!v5)
  {
    uint64_t v25 = [MEMORY[0x1E4F1CA98] null];
  }
  v42 = (void *)v5;
  v38 = (void *)v25;
  v44[0] = v25;
  v43[1] = @"smudgeLevel";
  uint64_t v26 = v8;
  if (!v8)
  {
    uint64_t v26 = [MEMORY[0x1E4F1CA98] null];
  }
  v41 = (void *)v8;
  v37 = (void *)v26;
  v44[1] = v26;
  v43[2] = @"prewittLevel";
  uint64_t v27 = v11;
  if (!v11)
  {
    uint64_t v27 = [MEMORY[0x1E4F1CA98] null];
  }
  v40 = (void *)v11;
  v36 = (void *)v27;
  v44[2] = v27;
  v43[3] = @"imuAcceleration";
  BOOL v28 = (void *)v14;
  if (!v14)
  {
    BOOL v28 = [MEMORY[0x1E4F1CA98] null];
  }
  v39 = (void *)v14;
  v44[3] = v28;
  v43[4] = @"imuAngularVelocityX";
  v29 = (void *)v17;
  if (!v17)
  {
    v29 = [MEMORY[0x1E4F1CA98] null];
  }
  v30 = (void *)v17;
  v44[4] = v29;
  v43[5] = @"imuAngularVelocityY";
  v31 = v20;
  if (!v20)
  {
    v31 = [MEMORY[0x1E4F1CA98] null];
  }
  v44[5] = v31;
  v43[6] = @"imuAngularVelocityZ";
  v32 = v23;
  if (!v23)
  {
    v32 = [MEMORY[0x1E4F1CA98] null];
  }
  v44[6] = v32;
  v43[7] = @"environmentType";
  v33 = v24;
  if (!v24)
  {
    v33 = [MEMORY[0x1E4F1CA98] null];
  }
  v44[7] = v33;
  v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:8];
  if (v24)
  {
    if (v23) {
      goto LABEL_47;
    }
LABEL_62:

    if (v20) {
      goto LABEL_48;
    }
    goto LABEL_63;
  }

  if (!v23) {
    goto LABEL_62;
  }
LABEL_47:
  if (v20) {
    goto LABEL_48;
  }
LABEL_63:

LABEL_48:
  if (!v30) {

  }
  if (!v39) {
  if (!v40)
  }

  if (!v41) {
  if (!v42)
  }

  return v34;
}

- (BMOasisAnalyticsContextSnapshotType)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v92[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  float v7 = [v6 objectForKeyedSubscript:@"luxLevel"];
  v74 = a4;
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
LABEL_4:
    float v9 = [v6 objectForKeyedSubscript:@"smudgeLevel"];
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v10 = 0;
LABEL_7:
      uint64_t v11 = [v6 objectForKeyedSubscript:@"prewittLevel"];
      id v76 = v8;
      if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            BOOL v28 = 0;
            uint64_t v25 = 0;
            goto LABEL_69;
          }
          id v73 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v31 = *MEMORY[0x1E4F502C8];
          uint64_t v87 = *MEMORY[0x1E4F28568];
          id v32 = v10;
          id v33 = [NSString alloc];
          uint64_t v61 = objc_opt_class();
          v34 = v33;
          id v10 = v32;
          id v75 = (id)[v34 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v61, @"prewittLevel"];
          id v88 = v75;
          uint64_t v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v88 forKeys:&v87 count:1];
          uint64_t v36 = v31;
          v37 = (void *)v35;
          BOOL v28 = 0;
          uint64_t v25 = 0;
          id *v74 = (id)[v73 initWithDomain:v36 code:2 userInfo:v35];
          goto LABEL_68;
        }
        float v12 = v9;
        float v13 = self;
        id v72 = v11;
      }
      else
      {
        float v12 = v9;
        float v13 = self;
        id v72 = 0;
      }
      uint64_t v14 = [v6 objectForKeyedSubscript:@"imuAcceleration"];
      v67 = v11;
      v70 = (void *)v14;
      if (v14 && (float v15 = (void *)v14, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            id v75 = 0;
            uint64_t v25 = 0;
            BOOL v28 = v72;
            v37 = v70;
            self = v13;
            float v9 = v12;
            id v8 = v76;
            goto LABEL_68;
          }
          id v39 = objc_alloc(MEMORY[0x1E4F28C58]);
          id v40 = v10;
          uint64_t v41 = *MEMORY[0x1E4F502C8];
          uint64_t v85 = *MEMORY[0x1E4F28568];
          v42 = a4;
          id v71 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"imuAcceleration"];
          id v86 = v71;
          float v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v86 forKeys:&v85 count:1];
          v43 = v39;
          uint64_t v11 = v67;
          v44 = v40;
          id v75 = 0;
          uint64_t v25 = 0;
          id *v42 = (id)[v43 initWithDomain:v41 code:2 userInfo:v16];
          self = v13;
          float v9 = v12;
          id v8 = v76;
          id v10 = v44;
LABEL_67:

          BOOL v28 = v72;
          v37 = v70;
LABEL_68:

          goto LABEL_69;
        }
        id v75 = v15;
      }
      else
      {
        id v75 = 0;
      }
      float v16 = [v6 objectForKeyedSubscript:@"imuAngularVelocityX"];
      self = v13;
      id v68 = v10;
      if (v16)
      {
        objc_opt_class();
        float v9 = v12;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          id v8 = v76;
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!v74)
            {
              id v71 = 0;
              uint64_t v25 = 0;
              goto LABEL_67;
            }
            id v45 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v46 = *MEMORY[0x1E4F502C8];
            uint64_t v83 = *MEMORY[0x1E4F28568];
            id v47 = [NSString alloc];
            uint64_t v62 = objc_opt_class();
            v48 = v47;
            id v8 = v76;
            id v69 = (id)[v48 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v62, @"imuAngularVelocityX"];
            id v84 = v69;
            uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v84 forKeys:&v83 count:1];
            v49 = v45;
            uint64_t v50 = v46;
            uint64_t v11 = v67;
            id v10 = v68;
            id v71 = 0;
            uint64_t v25 = 0;
            id *v74 = (id)[v49 initWithDomain:v50 code:2 userInfo:v17];
            goto LABEL_66;
          }
          id v71 = v16;
LABEL_24:
          uint64_t v17 = [v6 objectForKeyedSubscript:@"imuAngularVelocityY"];
          v66 = v7;
          if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!v74)
              {
                id v69 = 0;
                uint64_t v25 = 0;
                goto LABEL_65;
              }
              float v19 = self;
              id v51 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v52 = *MEMORY[0x1E4F502C8];
              uint64_t v81 = *MEMORY[0x1E4F28568];
              id v20 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"imuAngularVelocityY"];
              id v82 = v20;
              float v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v82 forKeys:&v81 count:1];
              v53 = v51;
              id v10 = v68;
              id v54 = (id)[v53 initWithDomain:v52 code:2 userInfo:v18];
              id v69 = 0;
              uint64_t v25 = 0;
              id *v74 = v54;
LABEL_64:

              self = v19;
              float v7 = v66;
              id v8 = v76;
LABEL_65:
              uint64_t v11 = v67;
LABEL_66:

              goto LABEL_67;
            }
            id v69 = v17;
          }
          else
          {
            id v69 = 0;
          }
          float v18 = [v6 objectForKeyedSubscript:@"imuAngularVelocityZ"];
          if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            float v19 = self;
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (!v74)
              {
                id v20 = 0;
                uint64_t v25 = 0;
                goto LABEL_64;
              }
              id v55 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v56 = *MEMORY[0x1E4F502C8];
              uint64_t v79 = *MEMORY[0x1E4F28568];
              float v22 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"imuAngularVelocityZ"];
              v80 = v22;
              float v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v80 forKeys:&v79 count:1];
              id v57 = (id)[v55 initWithDomain:v56 code:2 userInfo:v21];
              id v20 = 0;
              uint64_t v25 = 0;
              id *v74 = v57;
              goto LABEL_63;
            }
            id v20 = v18;
          }
          else
          {
            float v19 = self;
            id v20 = 0;
          }
          float v21 = [v6 objectForKeyedSubscript:@"environmentType"];
          if (v21 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v38 = v21;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (v74)
                {
                  id v65 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v64 = *MEMORY[0x1E4F502C8];
                  uint64_t v77 = *MEMORY[0x1E4F28568];
                  v59 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"environmentType"];
                  v78 = v59;
                  v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v78 forKeys:&v77 count:1];
                  id *v74 = (id)[v65 initWithDomain:v64 code:2 userInfo:v60];
                }
                float v22 = 0;
                uint64_t v25 = 0;
                goto LABEL_63;
              }
              id v38 = [NSNumber numberWithInt:BMOasisAnalyticsContextSnapshotEnvironmentTypeFromString(v21)];
            }
            float v22 = v38;
          }
          else
          {
            float v22 = 0;
          }
          LODWORD(v63) = [v22 intValue];
          uint64_t v25 = [(BMOasisAnalyticsContextSnapshotType *)v19 initWithLuxLevel:v76 smudgeLevel:v68 prewittLevel:v72 imuAcceleration:v75 imuAngularVelocityX:v71 imuAngularVelocityY:v69 imuAngularVelocityZ:v20 environmentType:v63];
          float v19 = v25;
LABEL_63:

          id v10 = v68;
          goto LABEL_64;
        }
        id v71 = 0;
      }
      else
      {
        id v71 = 0;
        float v9 = v12;
      }
      id v8 = v76;
      goto LABEL_24;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v9;
      goto LABEL_7;
    }
    if (a4)
    {
      id v26 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v27 = *MEMORY[0x1E4F502C8];
      uint64_t v89 = *MEMORY[0x1E4F28568];
      BOOL v28 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"smudgeLevel"];
      v90 = v28;
      uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v90 forKeys:&v89 count:1];
      v30 = v26;
      uint64_t v11 = (void *)v29;
      id v10 = 0;
      uint64_t v25 = 0;
      id *v74 = (id)[v30 initWithDomain:v27 code:2 userInfo:v29];
LABEL_69:

      goto LABEL_70;
    }
    id v10 = 0;
    uint64_t v25 = 0;
LABEL_70:

    goto LABEL_71;
  }
  if (a4)
  {
    id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v24 = *MEMORY[0x1E4F502C8];
    uint64_t v91 = *MEMORY[0x1E4F28568];
    id v10 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"luxLevel"];
    v92[0] = v10;
    float v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v92 forKeys:&v91 count:1];
    id v8 = 0;
    uint64_t v25 = 0;
    id *v74 = (id)[v23 initWithDomain:v24 code:2 userInfo:v9];
    goto LABEL_70;
  }
  id v8 = 0;
  uint64_t v25 = 0;
LABEL_71:

  return v25;
}

- (id)serialize
{
  float v3 = objc_opt_new();
  [(BMOasisAnalyticsContextSnapshotType *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_hasLuxLevel) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasSmudgeLevel) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasPrewittLevel) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasImuAcceleration) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasImuAngularVelocityX) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasImuAngularVelocityY) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasImuAngularVelocityZ) {
    PBDataWriterWriteFloatField();
  }
  PBDataWriterWriteUint32Field();
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)BMOasisAnalyticsContextSnapshotType;
  uint64_t v5 = [(BMEventBase *)&v45 init];
  if (!v5) {
    goto LABEL_74;
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
          v5->_hasLuxLevel = 1;
          uint64_t v20 = *v6;
          unint64_t v21 = *(void *)&v4[v20];
          if (v21 <= 0xFFFFFFFFFFFFFFFBLL && v21 + 4 <= *(void *)&v4[*v7])
          {
            int v22 = *(_DWORD *)(*(void *)&v4[*v9] + v21);
            *(void *)&v4[v20] = v21 + 4;
          }
          else
          {
            v4[*v8] = 1;
            int v22 = 0;
          }
          uint64_t v42 = 28;
          goto LABEL_70;
        case 2u:
          v5->_hasSmudgeLevel = 1;
          uint64_t v23 = *v6;
          unint64_t v24 = *(void *)&v4[v23];
          if (v24 <= 0xFFFFFFFFFFFFFFFBLL && v24 + 4 <= *(void *)&v4[*v7])
          {
            int v22 = *(_DWORD *)(*(void *)&v4[*v9] + v24);
            *(void *)&v4[v23] = v24 + 4;
          }
          else
          {
            v4[*v8] = 1;
            int v22 = 0;
          }
          uint64_t v42 = 32;
          goto LABEL_70;
        case 3u:
          v5->_hasPrewittLevel = 1;
          uint64_t v25 = *v6;
          unint64_t v26 = *(void *)&v4[v25];
          if (v26 <= 0xFFFFFFFFFFFFFFFBLL && v26 + 4 <= *(void *)&v4[*v7])
          {
            int v22 = *(_DWORD *)(*(void *)&v4[*v9] + v26);
            *(void *)&v4[v25] = v26 + 4;
          }
          else
          {
            v4[*v8] = 1;
            int v22 = 0;
          }
          uint64_t v42 = 36;
          goto LABEL_70;
        case 4u:
          v5->_hasImuAcceleration = 1;
          uint64_t v27 = *v6;
          unint64_t v28 = *(void *)&v4[v27];
          if (v28 <= 0xFFFFFFFFFFFFFFFBLL && v28 + 4 <= *(void *)&v4[*v7])
          {
            int v22 = *(_DWORD *)(*(void *)&v4[*v9] + v28);
            *(void *)&v4[v27] = v28 + 4;
          }
          else
          {
            v4[*v8] = 1;
            int v22 = 0;
          }
          uint64_t v42 = 40;
          goto LABEL_70;
        case 5u:
          v5->_hasImuAngularVelocityX = 1;
          uint64_t v29 = *v6;
          unint64_t v30 = *(void *)&v4[v29];
          if (v30 <= 0xFFFFFFFFFFFFFFFBLL && v30 + 4 <= *(void *)&v4[*v7])
          {
            int v22 = *(_DWORD *)(*(void *)&v4[*v9] + v30);
            *(void *)&v4[v29] = v30 + 4;
          }
          else
          {
            v4[*v8] = 1;
            int v22 = 0;
          }
          uint64_t v42 = 44;
          goto LABEL_70;
        case 6u:
          v5->_hasImuAngularVelocityY = 1;
          uint64_t v31 = *v6;
          unint64_t v32 = *(void *)&v4[v31];
          if (v32 <= 0xFFFFFFFFFFFFFFFBLL && v32 + 4 <= *(void *)&v4[*v7])
          {
            int v22 = *(_DWORD *)(*(void *)&v4[*v9] + v32);
            *(void *)&v4[v31] = v32 + 4;
          }
          else
          {
            v4[*v8] = 1;
            int v22 = 0;
          }
          uint64_t v42 = 48;
          goto LABEL_70;
        case 7u:
          v5->_hasImuAngularVelocityZ = 1;
          uint64_t v33 = *v6;
          unint64_t v34 = *(void *)&v4[v33];
          if (v34 <= 0xFFFFFFFFFFFFFFFBLL && v34 + 4 <= *(void *)&v4[*v7])
          {
            int v22 = *(_DWORD *)(*(void *)&v4[*v9] + v34);
            *(void *)&v4[v33] = v34 + 4;
          }
          else
          {
            v4[*v8] = 1;
            int v22 = 0;
          }
          uint64_t v42 = 52;
LABEL_70:
          *(_DWORD *)((char *)&v5->super.super.isa + v42) = v22;
          continue;
        case 8u:
          char v35 = 0;
          unsigned int v36 = 0;
          uint64_t v37 = 0;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_73;
          }
          continue;
      }
      while (1)
      {
        uint64_t v38 = *v6;
        uint64_t v39 = *(void *)&v4[v38];
        unint64_t v40 = v39 + 1;
        if (v39 == -1 || v40 > *(void *)&v4[*v7]) {
          break;
        }
        char v41 = *(unsigned char *)(*(void *)&v4[*v9] + v39);
        *(void *)&v4[v38] = v40;
        v37 |= (unint64_t)(v41 & 0x7F) << v35;
        if ((v41 & 0x80) == 0) {
          goto LABEL_51;
        }
        v35 += 7;
        BOOL v17 = v36++ >= 9;
        if (v17)
        {
          LODWORD(v37) = 0;
          goto LABEL_53;
        }
      }
      v4[*v8] = 1;
LABEL_51:
      if (v4[*v8]) {
        LODWORD(v37) = 0;
      }
LABEL_53:
      if (v37 >= 0x20) {
        LODWORD(v37) = 0;
      }
      v5->_environmentType = v37;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_73:
  }
    v43 = 0;
  else {
LABEL_74:
  }
    v43 = v5;

  return v43;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = NSNumber;
  [(BMOasisAnalyticsContextSnapshotType *)self luxLevel];
  uint64_t v5 = objc_msgSend(v4, "numberWithFloat:");
  id v6 = NSNumber;
  [(BMOasisAnalyticsContextSnapshotType *)self smudgeLevel];
  float v7 = objc_msgSend(v6, "numberWithFloat:");
  id v8 = NSNumber;
  [(BMOasisAnalyticsContextSnapshotType *)self prewittLevel];
  float v9 = objc_msgSend(v8, "numberWithFloat:");
  char v10 = NSNumber;
  [(BMOasisAnalyticsContextSnapshotType *)self imuAcceleration];
  unsigned int v11 = objc_msgSend(v10, "numberWithFloat:");
  unint64_t v12 = NSNumber;
  [(BMOasisAnalyticsContextSnapshotType *)self imuAngularVelocityX];
  uint64_t v13 = objc_msgSend(v12, "numberWithFloat:");
  uint64_t v14 = NSNumber;
  [(BMOasisAnalyticsContextSnapshotType *)self imuAngularVelocityY];
  unint64_t v15 = objc_msgSend(v14, "numberWithFloat:");
  char v16 = NSNumber;
  [(BMOasisAnalyticsContextSnapshotType *)self imuAngularVelocityZ];
  BOOL v17 = objc_msgSend(v16, "numberWithFloat:");
  int v18 = BMOasisAnalyticsContextSnapshotEnvironmentTypeAsString([(BMOasisAnalyticsContextSnapshotType *)self environmentType]);
  float v19 = (void *)[v3 initWithFormat:@"BMOasisAnalyticsContextSnapshotType with luxLevel: %@, smudgeLevel: %@, prewittLevel: %@, imuAcceleration: %@, imuAngularVelocityX: %@, imuAngularVelocityY: %@, imuAngularVelocityZ: %@, environmentType: %@", v5, v7, v9, v11, v13, v15, v17, v18];

  return (NSString *)v19;
}

- (BMOasisAnalyticsContextSnapshotType)initWithLuxLevel:(id)a3 smudgeLevel:(id)a4 prewittLevel:(id)a5 imuAcceleration:(id)a6 imuAngularVelocityX:(id)a7 imuAngularVelocityY:(id)a8 imuAngularVelocityZ:(id)a9 environmentType:(int)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  v32.receiver = self;
  v32.super_class = (Class)BMOasisAnalyticsContextSnapshotType;
  uint64_t v23 = [(BMEventBase *)&v32 init];
  if (v23)
  {
    v23->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v16)
    {
      v23->_hasLuxLevel = 1;
      [v16 floatValue];
    }
    else
    {
      v23->_hasLuxLevel = 0;
      float v24 = -1.0;
    }
    v23->_luxLevel = v24;
    if (v17)
    {
      v23->_hasSmudgeLevel = 1;
      [v17 floatValue];
    }
    else
    {
      v23->_hasSmudgeLevel = 0;
      float v25 = -1.0;
    }
    v23->_smudgeLevel = v25;
    if (v18)
    {
      v23->_hasPrewittLevel = 1;
      [v18 floatValue];
    }
    else
    {
      v23->_hasPrewittLevel = 0;
      float v26 = -1.0;
    }
    v23->_prewittLevel = v26;
    if (v19)
    {
      v23->_hasImuAcceleration = 1;
      [v19 floatValue];
    }
    else
    {
      v23->_hasImuAcceleration = 0;
      float v27 = -1.0;
    }
    v23->_imuAcceleration = v27;
    if (v20)
    {
      v23->_hasImuAngularVelocityX = 1;
      [v20 floatValue];
    }
    else
    {
      v23->_hasImuAngularVelocityX = 0;
      float v28 = -1.0;
    }
    v23->_imuAngularVelocityX = v28;
    if (v21)
    {
      v23->_hasImuAngularVelocityY = 1;
      [v21 floatValue];
    }
    else
    {
      v23->_hasImuAngularVelocityY = 0;
      float v29 = -1.0;
    }
    v23->_imuAngularVelocityY = v29;
    if (v22)
    {
      v23->_hasImuAngularVelocityZ = 1;
      [v22 floatValue];
    }
    else
    {
      v23->_hasImuAngularVelocityZ = 0;
      float v30 = -1.0;
    }
    v23->_imuAngularVelocityZ = v30;
    v23->_environmentType = a10;
  }

  return v23;
}

+ (id)protoFields
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"luxLevel" number:1 type:1 subMessageClass:0];
  v12[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"smudgeLevel" number:2 type:1 subMessageClass:0];
  v12[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"prewittLevel" number:3 type:1 subMessageClass:0];
  v12[2] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"imuAcceleration" number:4 type:1 subMessageClass:0];
  v12[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"imuAngularVelocityX" number:5 type:1 subMessageClass:0];
  v12[4] = v6;
  float v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"imuAngularVelocityY" number:6 type:1 subMessageClass:0];
  v12[5] = v7;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"imuAngularVelocityZ" number:7 type:1 subMessageClass:0];
  v12[6] = v8;
  float v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"environmentType" number:8 type:4 subMessageClass:0];
  v12[7] = v9;
  char v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:8];

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF7800;
}

+ (id)columns
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"luxLevel" dataType:1 requestOnly:0 fieldNumber:1 protoDataType:1 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"smudgeLevel" dataType:1 requestOnly:0 fieldNumber:2 protoDataType:1 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"prewittLevel" dataType:1 requestOnly:0 fieldNumber:3 protoDataType:1 convertedType:0];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"imuAcceleration" dataType:1 requestOnly:0 fieldNumber:4 protoDataType:1 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"imuAngularVelocityX" dataType:1 requestOnly:0 fieldNumber:5 protoDataType:1 convertedType:0];
  float v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"imuAngularVelocityY" dataType:1 requestOnly:0 fieldNumber:6 protoDataType:1 convertedType:0];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"imuAngularVelocityZ" dataType:1 requestOnly:0 fieldNumber:7 protoDataType:1 convertedType:0];
  float v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"environmentType" dataType:0 requestOnly:0 fieldNumber:8 protoDataType:4 convertedType:0];
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
    float v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMOasisAnalyticsContextSnapshotType alloc] initByReadFrom:v7];
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