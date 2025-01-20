@interface BMOasisAnalyticsTrackingInitializedType
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMOasisAnalyticsTrackingInitializedType)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMOasisAnalyticsTrackingInitializedType)initWithSecondsToInitializeTracking:(id)a3;
- (BOOL)hasSecondsToInitializeTracking;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (float)secondsToInitializeTracking;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)setHasSecondsToInitializeTracking:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMOasisAnalyticsTrackingInitializedType

- (void)setHasSecondsToInitializeTracking:(BOOL)a3
{
  self->_hasSecondsToInitializeTracking = a3;
}

- (BOOL)hasSecondsToInitializeTracking
{
  return self->_hasSecondsToInitializeTracking;
}

- (float)secondsToInitializeTracking
{
  return self->_secondsToInitializeTracking;
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
    if (-[BMOasisAnalyticsTrackingInitializedType hasSecondsToInitializeTracking](self, "hasSecondsToInitializeTracking")|| [v5 hasSecondsToInitializeTracking])
    {
      if (-[BMOasisAnalyticsTrackingInitializedType hasSecondsToInitializeTracking](self, "hasSecondsToInitializeTracking")&& [v5 hasSecondsToInitializeTracking])
      {
        [(BMOasisAnalyticsTrackingInitializedType *)self secondsToInitializeTracking];
        float v7 = v6;
        [v5 secondsToInitializeTracking];
        BOOL v9 = v7 == v8;
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 1;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)jsonDictionary
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (![(BMOasisAnalyticsTrackingInitializedType *)self hasSecondsToInitializeTracking]|| ([(BMOasisAnalyticsTrackingInitializedType *)self secondsToInitializeTracking], fabsf(v3) == INFINITY))
  {
    v11 = @"secondsToInitializeTracking";
  }
  else
  {
    [(BMOasisAnalyticsTrackingInitializedType *)self secondsToInitializeTracking];
    id v4 = NSNumber;
    [(BMOasisAnalyticsTrackingInitializedType *)self secondsToInitializeTracking];
    uint64_t v5 = objc_msgSend(v4, "numberWithFloat:");
    v11 = @"secondsToInitializeTracking";
    if (v5)
    {
      float v6 = (void *)v5;
      int v7 = 0;
      float v8 = (void *)v5;
      goto LABEL_7;
    }
  }
  float v8 = [MEMORY[0x1E4F1CA98] null];
  float v6 = 0;
  int v7 = 1;
LABEL_7:
  v12[0] = v8;
  BOOL v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  if (v7) {

  }
  return v9;
}

- (BMOasisAnalyticsTrackingInitializedType)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  float v6 = [a3 objectForKeyedSubscript:@"secondsToInitializeTracking"];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    a4 = 0;
LABEL_4:
    self = [(BMOasisAnalyticsTrackingInitializedType *)self initWithSecondsToInitializeTracking:a4];
    int v7 = self;
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    a4 = v6;
    goto LABEL_4;
  }
  if (a4)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v10 = *MEMORY[0x1E4F502C8];
    uint64_t v13 = *MEMORY[0x1E4F28568];
    v11 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"secondsToInitializeTracking"];
    v14[0] = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    *a4 = (id)[v9 initWithDomain:v10 code:2 userInfo:v12];

    int v7 = 0;
    a4 = 0;
  }
  else
  {
    int v7 = 0;
  }
LABEL_5:

  return v7;
}

- (id)serialize
{
  float v3 = objc_opt_new();
  [(BMOasisAnalyticsTrackingInitializedType *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  if (self->_hasSecondsToInitializeTracking) {
    PBDataWriterWriteFloatField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)BMOasisAnalyticsTrackingInitializedType;
  uint64_t v5 = [(BMEventBase *)&v25 init];
  if (!v5) {
    goto LABEL_30;
  }
  float v6 = (int *)MEMORY[0x1E4F940E8];
  int v7 = (int *)MEMORY[0x1E4F940E0];
  float v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    id v9 = (int *)MEMORY[0x1E4F940B8];
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
        if (v11++ >= 9)
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
      if ((v12 >> 3) == 1)
      {
        v5->_hasSecondsToInitializeTracking = 1;
        uint64_t v20 = *v6;
        unint64_t v21 = *(void *)&v4[v20];
        if (v21 <= 0xFFFFFFFFFFFFFFFBLL && v21 + 4 <= *(void *)&v4[*v7])
        {
          float v22 = *(float *)(*(void *)&v4[*v9] + v21);
          *(void *)&v4[v20] = v21 + 4;
        }
        else
        {
          v4[*v8] = 1;
          float v22 = 0.0;
        }
        v5->_secondsToInitializeTracking = v22;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_29;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_29:
  }
    v23 = 0;
  else {
LABEL_30:
  }
    v23 = v5;

  return v23;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = NSNumber;
  [(BMOasisAnalyticsTrackingInitializedType *)self secondsToInitializeTracking];
  uint64_t v5 = objc_msgSend(v4, "numberWithFloat:");
  float v6 = (void *)[v3 initWithFormat:@"BMOasisAnalyticsTrackingInitializedType with secondsToInitializeTracking: %@", v5];

  return (NSString *)v6;
}

- (BMOasisAnalyticsTrackingInitializedType)initWithSecondsToInitializeTracking:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BMOasisAnalyticsTrackingInitializedType;
  uint64_t v5 = [(BMEventBase *)&v8 init];
  if (v5)
  {
    v5->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v4)
    {
      v5->_hasSecondsToInitializeTracking = 1;
      [v4 floatValue];
    }
    else
    {
      v5->_hasSecondsToInitializeTracking = 0;
      float v6 = -1.0;
    }
    v5->_secondsToInitializeTracking = v6;
  }

  return v5;
}

+ (id)protoFields
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"secondsToInitializeTracking" number:1 type:1 subMessageClass:0];
  v5[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF7860;
}

+ (id)columns
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"secondsToInitializeTracking" dataType:1 requestOnly:0 fieldNumber:1 protoDataType:1 convertedType:0];
  v5[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
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
    int v7 = (void *)[[v5 alloc] initWithData:v6];

    objc_super v8 = [[BMOasisAnalyticsTrackingInitializedType alloc] initByReadFrom:v7];
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