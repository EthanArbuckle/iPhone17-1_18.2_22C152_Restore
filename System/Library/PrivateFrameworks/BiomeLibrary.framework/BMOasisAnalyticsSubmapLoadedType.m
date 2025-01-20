@interface BMOasisAnalyticsSubmapLoadedType
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMOasisAnalyticsSubmapLoadedType)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMOasisAnalyticsSubmapLoadedType)initWithSubmapId:(id)a3 isLocationAttached:(id)a4 bytesReadFromDisk:(id)a5 timeToLoadSubmapInSecond:(id)a6 secondsElapsedSinceLastActive:(id)a7 numberOfSubmapsWithinLoadingChunk:(id)a8;
- (BOOL)hasBytesReadFromDisk;
- (BOOL)hasIsLocationAttached;
- (BOOL)hasNumberOfSubmapsWithinLoadingChunk;
- (BOOL)hasSecondsElapsedSinceLastActive;
- (BOOL)hasSubmapId;
- (BOOL)hasTimeToLoadSubmapInSecond;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocationAttached;
- (NSString)description;
- (float)secondsElapsedSinceLastActive;
- (float)timeToLoadSubmapInSecond;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unint64_t)bytesReadFromDisk;
- (unint64_t)submapId;
- (unsigned)dataVersion;
- (unsigned)numberOfSubmapsWithinLoadingChunk;
- (void)setHasBytesReadFromDisk:(BOOL)a3;
- (void)setHasIsLocationAttached:(BOOL)a3;
- (void)setHasNumberOfSubmapsWithinLoadingChunk:(BOOL)a3;
- (void)setHasSecondsElapsedSinceLastActive:(BOOL)a3;
- (void)setHasSubmapId:(BOOL)a3;
- (void)setHasTimeToLoadSubmapInSecond:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMOasisAnalyticsSubmapLoadedType

- (void)setHasNumberOfSubmapsWithinLoadingChunk:(BOOL)a3
{
  self->_hasNumberOfSubmapsWithinLoadingChunk = a3;
}

- (BOOL)hasNumberOfSubmapsWithinLoadingChunk
{
  return self->_hasNumberOfSubmapsWithinLoadingChunk;
}

- (unsigned)numberOfSubmapsWithinLoadingChunk
{
  return self->_numberOfSubmapsWithinLoadingChunk;
}

- (void)setHasSecondsElapsedSinceLastActive:(BOOL)a3
{
  self->_hasSecondsElapsedSinceLastActive = a3;
}

- (BOOL)hasSecondsElapsedSinceLastActive
{
  return self->_hasSecondsElapsedSinceLastActive;
}

- (float)secondsElapsedSinceLastActive
{
  return self->_secondsElapsedSinceLastActive;
}

- (void)setHasTimeToLoadSubmapInSecond:(BOOL)a3
{
  self->_hasTimeToLoadSubmapInSecond = a3;
}

- (BOOL)hasTimeToLoadSubmapInSecond
{
  return self->_hasTimeToLoadSubmapInSecond;
}

- (float)timeToLoadSubmapInSecond
{
  return self->_timeToLoadSubmapInSecond;
}

- (void)setHasBytesReadFromDisk:(BOOL)a3
{
  self->_hasBytesReadFromDisk = a3;
}

- (BOOL)hasBytesReadFromDisk
{
  return self->_hasBytesReadFromDisk;
}

- (unint64_t)bytesReadFromDisk
{
  return self->_bytesReadFromDisk;
}

- (void)setHasIsLocationAttached:(BOOL)a3
{
  self->_hasIsLocationAttached = a3;
}

- (BOOL)hasIsLocationAttached
{
  return self->_hasIsLocationAttached;
}

- (BOOL)isLocationAttached
{
  return self->_isLocationAttached;
}

- (void)setHasSubmapId:(BOOL)a3
{
  self->_hasSubmapId = a3;
}

- (BOOL)hasSubmapId
{
  return self->_hasSubmapId;
}

- (unint64_t)submapId
{
  return self->_submapId;
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
    if ([(BMOasisAnalyticsSubmapLoadedType *)self hasSubmapId]
      || [v5 hasSubmapId])
    {
      if (![(BMOasisAnalyticsSubmapLoadedType *)self hasSubmapId]) {
        goto LABEL_33;
      }
      if (![v5 hasSubmapId]) {
        goto LABEL_33;
      }
      unint64_t v6 = [(BMOasisAnalyticsSubmapLoadedType *)self submapId];
      if (v6 != [v5 submapId]) {
        goto LABEL_33;
      }
    }
    if ([(BMOasisAnalyticsSubmapLoadedType *)self hasIsLocationAttached]
      || [v5 hasIsLocationAttached])
    {
      if (![(BMOasisAnalyticsSubmapLoadedType *)self hasIsLocationAttached]) {
        goto LABEL_33;
      }
      if (![v5 hasIsLocationAttached]) {
        goto LABEL_33;
      }
      int v7 = [(BMOasisAnalyticsSubmapLoadedType *)self isLocationAttached];
      if (v7 != [v5 isLocationAttached]) {
        goto LABEL_33;
      }
    }
    if ([(BMOasisAnalyticsSubmapLoadedType *)self hasBytesReadFromDisk]
      || [v5 hasBytesReadFromDisk])
    {
      if (![(BMOasisAnalyticsSubmapLoadedType *)self hasBytesReadFromDisk]) {
        goto LABEL_33;
      }
      if (![v5 hasBytesReadFromDisk]) {
        goto LABEL_33;
      }
      unint64_t v8 = [(BMOasisAnalyticsSubmapLoadedType *)self bytesReadFromDisk];
      if (v8 != [v5 bytesReadFromDisk]) {
        goto LABEL_33;
      }
    }
    if ([(BMOasisAnalyticsSubmapLoadedType *)self hasTimeToLoadSubmapInSecond]
      || [v5 hasTimeToLoadSubmapInSecond])
    {
      if (![(BMOasisAnalyticsSubmapLoadedType *)self hasTimeToLoadSubmapInSecond]) {
        goto LABEL_33;
      }
      if (![v5 hasTimeToLoadSubmapInSecond]) {
        goto LABEL_33;
      }
      [(BMOasisAnalyticsSubmapLoadedType *)self timeToLoadSubmapInSecond];
      float v10 = v9;
      [v5 timeToLoadSubmapInSecond];
      if (v10 != v11) {
        goto LABEL_33;
      }
    }
    if ([(BMOasisAnalyticsSubmapLoadedType *)self hasSecondsElapsedSinceLastActive]
      || [v5 hasSecondsElapsedSinceLastActive])
    {
      if (![(BMOasisAnalyticsSubmapLoadedType *)self hasSecondsElapsedSinceLastActive])goto LABEL_33; {
      if (![v5 hasSecondsElapsedSinceLastActive])
      }
        goto LABEL_33;
      [(BMOasisAnalyticsSubmapLoadedType *)self secondsElapsedSinceLastActive];
      float v13 = v12;
      [v5 secondsElapsedSinceLastActive];
      if (v13 != v14) {
        goto LABEL_33;
      }
    }
    if (!-[BMOasisAnalyticsSubmapLoadedType hasNumberOfSubmapsWithinLoadingChunk](self, "hasNumberOfSubmapsWithinLoadingChunk")&& ![v5 hasNumberOfSubmapsWithinLoadingChunk])
    {
      BOOL v16 = 1;
      goto LABEL_34;
    }
    if (-[BMOasisAnalyticsSubmapLoadedType hasNumberOfSubmapsWithinLoadingChunk](self, "hasNumberOfSubmapsWithinLoadingChunk")&& [v5 hasNumberOfSubmapsWithinLoadingChunk])
    {
      unsigned int v15 = [(BMOasisAnalyticsSubmapLoadedType *)self numberOfSubmapsWithinLoadingChunk];
      BOOL v16 = v15 == [v5 numberOfSubmapsWithinLoadingChunk];
    }
    else
    {
LABEL_33:
      BOOL v16 = 0;
    }
LABEL_34:

    goto LABEL_35;
  }
  BOOL v16 = 0;
LABEL_35:

  return v16;
}

- (id)jsonDictionary
{
  v27[6] = *MEMORY[0x1E4F143B8];
  if ([(BMOasisAnalyticsSubmapLoadedType *)self hasSubmapId])
  {
    uint64_t v3 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BMOasisAnalyticsSubmapLoadedType submapId](self, "submapId"));
  }
  else
  {
    uint64_t v3 = 0;
  }
  if ([(BMOasisAnalyticsSubmapLoadedType *)self hasIsLocationAttached])
  {
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMOasisAnalyticsSubmapLoadedType isLocationAttached](self, "isLocationAttached"));
  }
  else
  {
    uint64_t v4 = 0;
  }
  if ([(BMOasisAnalyticsSubmapLoadedType *)self hasBytesReadFromDisk])
  {
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BMOasisAnalyticsSubmapLoadedType bytesReadFromDisk](self, "bytesReadFromDisk"));
  }
  else
  {
    uint64_t v5 = 0;
  }
  if (![(BMOasisAnalyticsSubmapLoadedType *)self hasTimeToLoadSubmapInSecond]
    || ([(BMOasisAnalyticsSubmapLoadedType *)self timeToLoadSubmapInSecond],
        fabsf(v6) == INFINITY))
  {
    unint64_t v8 = 0;
  }
  else
  {
    [(BMOasisAnalyticsSubmapLoadedType *)self timeToLoadSubmapInSecond];
    int v7 = NSNumber;
    [(BMOasisAnalyticsSubmapLoadedType *)self timeToLoadSubmapInSecond];
    unint64_t v8 = objc_msgSend(v7, "numberWithFloat:");
  }
  if (![(BMOasisAnalyticsSubmapLoadedType *)self hasSecondsElapsedSinceLastActive]
    || ([(BMOasisAnalyticsSubmapLoadedType *)self secondsElapsedSinceLastActive],
        fabsf(v9) == INFINITY))
  {
    float v11 = 0;
  }
  else
  {
    [(BMOasisAnalyticsSubmapLoadedType *)self secondsElapsedSinceLastActive];
    float v10 = NSNumber;
    [(BMOasisAnalyticsSubmapLoadedType *)self secondsElapsedSinceLastActive];
    float v11 = objc_msgSend(v10, "numberWithFloat:");
  }
  if ([(BMOasisAnalyticsSubmapLoadedType *)self hasNumberOfSubmapsWithinLoadingChunk])
  {
    float v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMOasisAnalyticsSubmapLoadedType numberOfSubmapsWithinLoadingChunk](self, "numberOfSubmapsWithinLoadingChunk"));
  }
  else
  {
    float v12 = 0;
  }
  v26[0] = @"submapId";
  uint64_t v13 = v3;
  if (!v3)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v22 = v13;
  v27[0] = v13;
  v26[1] = @"isLocationAttached";
  float v14 = (void *)v4;
  v25 = (void *)v4;
  if (!v4)
  {
    float v14 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v13);
  }
  v27[1] = v14;
  v26[2] = @"bytesReadFromDisk";
  unsigned int v15 = (void *)v5;
  v24 = (void *)v5;
  if (!v5)
  {
    unsigned int v15 = [MEMORY[0x1E4F1CA98] null];
  }
  BOOL v16 = (void *)v3;
  v27[2] = v15;
  v26[3] = @"timeToLoadSubmapInSecond";
  v17 = v8;
  if (!v8)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v27[3] = v17;
  v26[4] = @"secondsElapsedSinceLastActive";
  v18 = v11;
  if (!v11)
  {
    v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v27[4] = v18;
  v26[5] = @"numberOfSubmapsWithinLoadingChunk";
  v19 = v12;
  if (!v12)
  {
    v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v27[5] = v19;
  v20 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v27, v26, 6, v22);
  if (v12)
  {
    if (v11) {
      goto LABEL_35;
    }
LABEL_44:

    if (v8) {
      goto LABEL_36;
    }
    goto LABEL_45;
  }

  if (!v11) {
    goto LABEL_44;
  }
LABEL_35:
  if (v8) {
    goto LABEL_36;
  }
LABEL_45:

LABEL_36:
  if (!v24) {

  }
  if (v25)
  {
    if (v16) {
      goto LABEL_40;
    }
  }
  else
  {

    if (v16) {
      goto LABEL_40;
    }
  }

LABEL_40:

  return v20;
}

- (BMOasisAnalyticsSubmapLoadedType)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v72[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [v6 objectForKeyedSubscript:@"submapId"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    float v9 = [v6 objectForKeyedSubscript:@"isLocationAttached"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v21 = 0;
          v17 = 0;
          goto LABEL_50;
        }
        id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
        v52 = a4;
        uint64_t v23 = *MEMORY[0x1E4F502C8];
        uint64_t v69 = *MEMORY[0x1E4F28568];
        v24 = v7;
        id v25 = v8;
        id v26 = [NSString alloc];
        uint64_t v49 = objc_opt_class();
        v27 = v26;
        id v8 = v25;
        int v7 = v24;
        v28 = (id *)[v27 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v49, @"isLocationAttached"];
        v70 = v28;
        float v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v70 forKeys:&v69 count:1];
        uint64_t v29 = v23;
        a4 = v28;
        v17 = 0;
        v21 = 0;
        id *v52 = (id)[v22 initWithDomain:v29 code:2 userInfo:v10];
        goto LABEL_49;
      }
      id v59 = v9;
    }
    else
    {
      id v59 = 0;
    }
    float v10 = [v6 objectForKeyedSubscript:@"bytesReadFromDisk"];
    v60 = self;
    v57 = v9;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v17 = 0;
          v21 = v59;
          goto LABEL_49;
        }
        id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
        v31 = a4;
        uint64_t v32 = *MEMORY[0x1E4F502C8];
        uint64_t v67 = *MEMORY[0x1E4F28568];
        v33 = v7;
        id v34 = v8;
        id v35 = [NSString alloc];
        uint64_t v50 = objc_opt_class();
        v36 = v35;
        id v8 = v34;
        int v7 = v33;
        id v58 = (id)[v36 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v50, @"bytesReadFromDisk"];
        id v68 = v58;
        float v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v68 forKeys:&v67 count:1];
        id v37 = (id)[v30 initWithDomain:v32 code:2 userInfo:v11];
        v17 = 0;
        a4 = 0;
        id *v31 = v37;
        float v9 = v57;
        v21 = v59;
LABEL_48:

        self = v60;
LABEL_49:

        goto LABEL_50;
      }
      v56 = v10;
    }
    else
    {
      v56 = 0;
    }
    float v11 = [v6 objectForKeyedSubscript:@"timeToLoadSubmapInSecond"];
    v55 = v7;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v58 = 0;
          v17 = 0;
          v21 = v59;
          a4 = v56;
          goto LABEL_48;
        }
        id v38 = v8;
        id v39 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v40 = *MEMORY[0x1E4F502C8];
        uint64_t v65 = *MEMORY[0x1E4F28568];
        id v14 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"timeToLoadSubmapInSecond"];
        id v66 = v14;
        float v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
        v41 = v39;
        id v8 = v38;
        int v7 = v55;
        id v42 = (id)[v41 initWithDomain:v40 code:2 userInfo:v12];
        v17 = 0;
        id v58 = 0;
        *a4 = v42;
        goto LABEL_57;
      }
      id v58 = v11;
    }
    else
    {
      id v58 = 0;
    }
    float v12 = [v6 objectForKeyedSubscript:@"secondsElapsedSinceLastActive"];
    if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v13 = v8;
      id v14 = 0;
      goto LABEL_16;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = v8;
      id v14 = v12;
LABEL_16:
      unsigned int v15 = [v6 objectForKeyedSubscript:@"numberOfSubmapsWithinLoadingChunk"];
      if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v16 = 0;
LABEL_19:
        a4 = v56;
        v17 = [(BMOasisAnalyticsSubmapLoadedType *)v60 initWithSubmapId:v13 isLocationAttached:v59 bytesReadFromDisk:v56 timeToLoadSubmapInSecond:v58 secondsElapsedSinceLastActive:v14 numberOfSubmapsWithinLoadingChunk:v16];
        v60 = v17;
LABEL_46:

        id v8 = v13;
        int v7 = v55;
LABEL_47:

        v21 = v59;
        float v9 = v57;
        goto LABEL_48;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = v15;
        goto LABEL_19;
      }
      if (a4)
      {
        id v54 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v51 = *MEMORY[0x1E4F502C8];
        uint64_t v61 = *MEMORY[0x1E4F28568];
        v46 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"numberOfSubmapsWithinLoadingChunk"];
        v62 = v46;
        v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
        *a4 = (id)[v54 initWithDomain:v51 code:2 userInfo:v47];
      }
      id v16 = 0;
      v17 = 0;
LABEL_45:
      a4 = v56;
      goto LABEL_46;
    }
    if (a4)
    {
      id v13 = v8;
      v53 = a4;
      id v43 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v44 = *MEMORY[0x1E4F502C8];
      uint64_t v63 = *MEMORY[0x1E4F28568];
      id v16 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"secondsElapsedSinceLastActive"];
      id v64 = v16;
      unsigned int v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
      id v45 = (id)[v43 initWithDomain:v44 code:2 userInfo:v15];
      v17 = 0;
      id v14 = 0;
      id *v53 = v45;
      goto LABEL_45;
    }
    id v14 = 0;
    v17 = 0;
LABEL_57:
    a4 = v56;
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
    v17 = 0;
    id v8 = 0;
    goto LABEL_51;
  }
  id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
  v19 = a4;
  uint64_t v20 = *MEMORY[0x1E4F502C8];
  uint64_t v71 = *MEMORY[0x1E4F28568];
  v21 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"submapId"];
  v72[0] = v21;
  float v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v72 forKeys:&v71 count:1];
  v17 = 0;
  id v8 = 0;
  id *v19 = (id)[v18 initWithDomain:v20 code:2 userInfo:v9];
LABEL_50:

LABEL_51:
  return v17;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMOasisAnalyticsSubmapLoadedType *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasSubmapId)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
  if (self->_hasIsLocationAttached)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasBytesReadFromDisk)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
  if (self->_hasTimeToLoadSubmapInSecond)
  {
    PBDataWriterWriteFloatField();
    id v4 = v5;
  }
  if (self->_hasSecondsElapsedSinceLastActive)
  {
    PBDataWriterWriteFloatField();
    id v4 = v5;
  }
  if (self->_hasNumberOfSubmapsWithinLoadingChunk)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v56.receiver = self;
  v56.super_class = (Class)BMOasisAnalyticsSubmapLoadedType;
  id v5 = [(BMEventBase *)&v56 init];
  if (!v5) {
    goto LABEL_81;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  int v7 = (int *)MEMORY[0x1E4F940E0];
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
          unint64_t v22 = 0;
          v5->_hasSubmapId = 1;
          while (1)
          {
            uint64_t v23 = *v6;
            uint64_t v24 = *(void *)&v4[v23];
            unint64_t v25 = v24 + 1;
            if (v24 == -1 || v25 > *(void *)&v4[*v7]) {
              break;
            }
            char v26 = *(unsigned char *)(*(void *)&v4[*v9] + v24);
            *(void *)&v4[v23] = v25;
            v22 |= (unint64_t)(v26 & 0x7F) << v20;
            if ((v26 & 0x80) == 0) {
              goto LABEL_57;
            }
            v20 += 7;
            BOOL v17 = v21++ >= 9;
            if (v17)
            {
              unint64_t v22 = 0;
              goto LABEL_59;
            }
          }
          v4[*v8] = 1;
LABEL_57:
          if (v4[*v8]) {
            unint64_t v22 = 0;
          }
LABEL_59:
          uint64_t v52 = 40;
          goto LABEL_68;
        case 2u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v29 = 0;
          v5->_hasIsLocationAttached = 1;
          while (2)
          {
            uint64_t v30 = *v6;
            uint64_t v31 = *(void *)&v4[v30];
            unint64_t v32 = v31 + 1;
            if (v31 == -1 || v32 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v33 = *(unsigned char *)(*(void *)&v4[*v9] + v31);
              *(void *)&v4[v30] = v32;
              v29 |= (unint64_t)(v33 & 0x7F) << v27;
              if (v33 < 0)
              {
                v27 += 7;
                BOOL v17 = v28++ >= 9;
                if (v17)
                {
                  uint64_t v29 = 0;
                  goto LABEL_63;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v29 = 0;
          }
LABEL_63:
          v5->_isLocationAttached = v29 != 0;
          continue;
        case 3u:
          char v34 = 0;
          unsigned int v35 = 0;
          unint64_t v22 = 0;
          v5->_hasBytesReadFromDisk = 1;
          while (2)
          {
            uint64_t v36 = *v6;
            uint64_t v37 = *(void *)&v4[v36];
            unint64_t v38 = v37 + 1;
            if (v37 == -1 || v38 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v39 = *(unsigned char *)(*(void *)&v4[*v9] + v37);
              *(void *)&v4[v36] = v38;
              v22 |= (unint64_t)(v39 & 0x7F) << v34;
              if (v39 < 0)
              {
                v34 += 7;
                BOOL v17 = v35++ >= 9;
                if (v17)
                {
                  unint64_t v22 = 0;
                  goto LABEL_67;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            unint64_t v22 = 0;
          }
LABEL_67:
          uint64_t v52 = 48;
LABEL_68:
          *(Class *)((char *)&v5->super.super.isa + v52) = (Class)v22;
          continue;
        case 4u:
          v5->_hasTimeToLoadSubmapInSecond = 1;
          uint64_t v40 = *v6;
          unint64_t v41 = *(void *)&v4[v40];
          if (v41 <= 0xFFFFFFFFFFFFFFFBLL && v41 + 4 <= *(void *)&v4[*v7])
          {
            int v42 = *(_DWORD *)(*(void *)&v4[*v9] + v41);
            *(void *)&v4[v40] = v41 + 4;
          }
          else
          {
            v4[*v8] = 1;
            int v42 = 0;
          }
          uint64_t v53 = 28;
          goto LABEL_77;
        case 5u:
          v5->_hasSecondsElapsedSinceLastActive = 1;
          uint64_t v43 = *v6;
          unint64_t v44 = *(void *)&v4[v43];
          if (v44 <= 0xFFFFFFFFFFFFFFFBLL && v44 + 4 <= *(void *)&v4[*v7])
          {
            int v42 = *(_DWORD *)(*(void *)&v4[*v9] + v44);
            *(void *)&v4[v43] = v44 + 4;
          }
          else
          {
            v4[*v8] = 1;
            int v42 = 0;
          }
          uint64_t v53 = 32;
LABEL_77:
          *(_DWORD *)((char *)&v5->super.super.isa + v53) = v42;
          continue;
        case 6u:
          char v45 = 0;
          unsigned int v46 = 0;
          uint64_t v47 = 0;
          v5->_hasNumberOfSubmapsWithinLoadingChunk = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_80;
          }
          continue;
      }
      while (1)
      {
        uint64_t v48 = *v6;
        uint64_t v49 = *(void *)&v4[v48];
        unint64_t v50 = v49 + 1;
        if (v49 == -1 || v50 > *(void *)&v4[*v7]) {
          break;
        }
        char v51 = *(unsigned char *)(*(void *)&v4[*v9] + v49);
        *(void *)&v4[v48] = v50;
        v47 |= (unint64_t)(v51 & 0x7F) << v45;
        if ((v51 & 0x80) == 0) {
          goto LABEL_70;
        }
        v45 += 7;
        BOOL v17 = v46++ >= 9;
        if (v17)
        {
          LODWORD(v47) = 0;
          goto LABEL_72;
        }
      }
      v4[*v8] = 1;
LABEL_70:
      if (v4[*v8]) {
        LODWORD(v47) = 0;
      }
LABEL_72:
      v5->_numberOfSubmapsWithinLoadingChunk = v47;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_80:
  }
    id v54 = 0;
  else {
LABEL_81:
  }
    id v54 = v5;

  return v54;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BMOasisAnalyticsSubmapLoadedType submapId](self, "submapId"));
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", -[BMOasisAnalyticsSubmapLoadedType isLocationAttached](self, "isLocationAttached"));
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BMOasisAnalyticsSubmapLoadedType bytesReadFromDisk](self, "bytesReadFromDisk"));
  int v7 = NSNumber;
  [(BMOasisAnalyticsSubmapLoadedType *)self timeToLoadSubmapInSecond];
  id v8 = objc_msgSend(v7, "numberWithFloat:");
  float v9 = NSNumber;
  [(BMOasisAnalyticsSubmapLoadedType *)self secondsElapsedSinceLastActive];
  char v10 = objc_msgSend(v9, "numberWithFloat:");
  unsigned int v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMOasisAnalyticsSubmapLoadedType numberOfSubmapsWithinLoadingChunk](self, "numberOfSubmapsWithinLoadingChunk"));
  unint64_t v12 = (void *)[v3 initWithFormat:@"BMOasisAnalyticsSubmapLoadedType with submapId: %@, isLocationAttached: %@, bytesReadFromDisk: %@, timeToLoadSubmapInSecond: %@, secondsElapsedSinceLastActive: %@, numberOfSubmapsWithinLoadingChunk: %@", v4, v5, v6, v8, v10, v11];

  return (NSString *)v12;
}

- (BMOasisAnalyticsSubmapLoadedType)initWithSubmapId:(id)a3 isLocationAttached:(id)a4 bytesReadFromDisk:(id)a5 timeToLoadSubmapInSecond:(id)a6 secondsElapsedSinceLastActive:(id)a7 numberOfSubmapsWithinLoadingChunk:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v27.receiver = self;
  v27.super_class = (Class)BMOasisAnalyticsSubmapLoadedType;
  char v20 = [(BMEventBase *)&v27 init];
  if (v20)
  {
    v20->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v14)
    {
      v20->_hasSubmapId = 1;
      uint64_t v21 = [v14 unsignedLongLongValue];
    }
    else
    {
      uint64_t v21 = 0;
      v20->_hasSubmapId = 0;
    }
    v20->_submapId = v21;
    if (v15)
    {
      v20->_hasIsLocationAttached = 1;
      v20->_isLocationAttached = [v15 BOOLValue];
    }
    else
    {
      v20->_hasIsLocationAttached = 0;
      v20->_isLocationAttached = 0;
    }
    if (v16)
    {
      v20->_hasBytesReadFromDisk = 1;
      uint64_t v22 = [v16 unsignedLongLongValue];
    }
    else
    {
      uint64_t v22 = 0;
      v20->_hasBytesReadFromDisk = 0;
    }
    v20->_bytesReadFromDisk = v22;
    if (v17)
    {
      v20->_hasTimeToLoadSubmapInSecond = 1;
      [v17 floatValue];
    }
    else
    {
      v20->_hasTimeToLoadSubmapInSecond = 0;
      float v23 = -1.0;
    }
    v20->_timeToLoadSubmapInSecond = v23;
    if (v18)
    {
      v20->_hasSecondsElapsedSinceLastActive = 1;
      [v18 floatValue];
    }
    else
    {
      v20->_hasSecondsElapsedSinceLastActive = 0;
      float v24 = -1.0;
    }
    v20->_secondsElapsedSinceLastActive = v24;
    if (v19)
    {
      v20->_hasNumberOfSubmapsWithinLoadingChunk = 1;
      unsigned int v25 = [v19 unsignedIntValue];
    }
    else
    {
      unsigned int v25 = 0;
      v20->_hasNumberOfSubmapsWithinLoadingChunk = 0;
    }
    v20->_numberOfSubmapsWithinLoadingChunk = v25;
  }

  return v20;
}

+ (id)protoFields
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"submapId" number:1 type:5 subMessageClass:0];
  v10[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"isLocationAttached" number:2 type:12 subMessageClass:0];
  v10[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bytesReadFromDisk" number:3 type:5 subMessageClass:0];
  v10[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"timeToLoadSubmapInSecond" number:4 type:1 subMessageClass:0];
  v10[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"secondsElapsedSinceLastActive" number:5 type:1 subMessageClass:0];
  v10[4] = v6;
  int v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"numberOfSubmapsWithinLoadingChunk" number:6 type:4 subMessageClass:0];
  v10[5] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF78F0;
}

+ (id)columns
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"submapId" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:5 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"isLocationAttached" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:12 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bytesReadFromDisk" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:5 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"timeToLoadSubmapInSecond" dataType:1 requestOnly:0 fieldNumber:4 protoDataType:1 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"secondsElapsedSinceLastActive" dataType:1 requestOnly:0 fieldNumber:5 protoDataType:1 convertedType:0];
  int v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"numberOfSubmapsWithinLoadingChunk" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:4 convertedType:0];
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
    int v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMOasisAnalyticsSubmapLoadedType alloc] initByReadFrom:v7];
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