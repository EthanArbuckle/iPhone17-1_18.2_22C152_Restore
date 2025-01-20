@interface BMContextualUnderstandingActivityInferenceInferredActivity
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMContextualUnderstandingActivityInferenceInferredActivity)initWithActivityType:(int)a3 confidence:(id)a4;
- (BMContextualUnderstandingActivityInferenceInferredActivity)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasConfidence;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (double)confidence;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)activityType;
- (unsigned)dataVersion;
- (void)setHasConfidence:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMContextualUnderstandingActivityInferenceInferredActivity

- (void)setHasConfidence:(BOOL)a3
{
  self->_hasConfidence = a3;
}

- (BOOL)hasConfidence
{
  return self->_hasConfidence;
}

- (double)confidence
{
  return self->_confidence;
}

- (int)activityType
{
  return self->_activityType;
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
    int v6 = [(BMContextualUnderstandingActivityInferenceInferredActivity *)self activityType];
    if (v6 != [v5 activityType]) {
      goto LABEL_9;
    }
    if (![(BMContextualUnderstandingActivityInferenceInferredActivity *)self hasConfidence]
      && ![v5 hasConfidence])
    {
      BOOL v10 = 1;
      goto LABEL_10;
    }
    if ([(BMContextualUnderstandingActivityInferenceInferredActivity *)self hasConfidence]
      && [v5 hasConfidence])
    {
      [(BMContextualUnderstandingActivityInferenceInferredActivity *)self confidence];
      double v8 = v7;
      [v5 confidence];
      BOOL v10 = v8 == v9;
    }
    else
    {
LABEL_9:
      BOOL v10 = 0;
    }
LABEL_10:

    goto LABEL_11;
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (id)jsonDictionary
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMContextualUnderstandingActivityInferenceInferredActivity activityType](self, "activityType"));
  if (![(BMContextualUnderstandingActivityInferenceInferredActivity *)self hasConfidence]
    || ([(BMContextualUnderstandingActivityInferenceInferredActivity *)self confidence],
        fabs(v4) == INFINITY))
  {
    int v6 = 0;
  }
  else
  {
    [(BMContextualUnderstandingActivityInferenceInferredActivity *)self confidence];
    id v5 = NSNumber;
    [(BMContextualUnderstandingActivityInferenceInferredActivity *)self confidence];
    int v6 = objc_msgSend(v5, "numberWithDouble:");
  }
  v11[0] = @"activityType";
  double v7 = v3;
  if (!v3)
  {
    double v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[1] = @"confidence";
  v12[0] = v7;
  double v8 = v6;
  if (!v6)
  {
    double v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v8;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  if (v6)
  {
    if (v3) {
      goto LABEL_11;
    }
  }
  else
  {

    if (v3) {
      goto LABEL_11;
    }
  }

LABEL_11:

  return v9;
}

- (BMContextualUnderstandingActivityInferenceInferredActivity)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = [v6 objectForKeyedSubscript:@"activityType"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v7;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          double v8 = 0;
          v12 = 0;
          goto LABEL_14;
        }
        id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v19 = *MEMORY[0x1E4F502C8];
        uint64_t v23 = *MEMORY[0x1E4F28568];
        id v11 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"activityType"];
        v24[0] = v11;
        BOOL v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
        id v20 = (id)[v18 initWithDomain:v19 code:2 userInfo:v10];
        double v8 = 0;
        v12 = 0;
        *a4 = v20;
        goto LABEL_13;
      }
      id v9 = [NSNumber numberWithInt:BMContextualUnderstandingActivityInferenceActivityTypeFromString(v7)];
    }
    double v8 = v9;
  }
  else
  {
    double v8 = 0;
  }
  BOOL v10 = [v6 objectForKeyedSubscript:@"confidence"];
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v14 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v15 = *MEMORY[0x1E4F502C8];
        uint64_t v21 = *MEMORY[0x1E4F28568];
        v16 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"confidence"];
        v22 = v16;
        v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
        *a4 = (id)[v14 initWithDomain:v15 code:2 userInfo:v17];
      }
      id v11 = 0;
      v12 = 0;
      goto LABEL_13;
    }
    id v11 = v10;
  }
  else
  {
    id v11 = 0;
  }
  self = -[BMContextualUnderstandingActivityInferenceInferredActivity initWithActivityType:confidence:](self, "initWithActivityType:confidence:", [v8 intValue], v11);
  v12 = self;
LABEL_13:

LABEL_14:
  return v12;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMContextualUnderstandingActivityInferenceInferredActivity *)self writeTo:v3];
  double v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_hasConfidence) {
    PBDataWriterWriteFloatField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)BMContextualUnderstandingActivityInferenceInferredActivity;
  id v5 = [(BMEventBase *)&v32 init];
  if (!v5) {
    goto LABEL_44;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  double v7 = (int *)MEMORY[0x1E4F940E0];
  double v8 = (int *)MEMORY[0x1E4F940C8];
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
      if ((v12 >> 3) == 2)
      {
        v5->_hasConfidence = 1;
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
        v5->_confidence = v29;
      }
      else if ((v12 >> 3) == 1)
      {
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v22 = 0;
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
            goto LABEL_34;
          }
          v20 += 7;
          BOOL v17 = v21++ >= 9;
          if (v17)
          {
            LODWORD(v22) = 0;
            goto LABEL_36;
          }
        }
        v4[*v8] = 1;
LABEL_34:
        if (v4[*v8]) {
          LODWORD(v22) = 0;
        }
LABEL_36:
        if (v22 >= 4) {
          LODWORD(v22) = 0;
        }
        v5->_activityType = v22;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_43;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_43:
  }
    v30 = 0;
  else {
LABEL_44:
  }
    v30 = v5;

  return v30;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = BMContextualUnderstandingActivityInferenceActivityTypeAsString([(BMContextualUnderstandingActivityInferenceInferredActivity *)self activityType]);
  id v5 = NSNumber;
  [(BMContextualUnderstandingActivityInferenceInferredActivity *)self confidence];
  id v6 = objc_msgSend(v5, "numberWithDouble:");
  double v7 = (void *)[v3 initWithFormat:@"BMContextualUnderstandingActivityInferenceInferredActivity with activityType: %@, confidence: %@", v4, v6];

  return (NSString *)v7;
}

- (BMContextualUnderstandingActivityInferenceInferredActivity)initWithActivityType:(int)a3 confidence:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BMContextualUnderstandingActivityInferenceInferredActivity;
  double v7 = [(BMEventBase *)&v11 init];
  if (v7)
  {
    v7->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    v7->_activityType = a3;
    if (v6)
    {
      v7->_hasConfidence = 1;
      [v6 floatValue];
      double v9 = v8;
    }
    else
    {
      v7->_hasConfidence = 0;
      double v9 = -1.0;
    }
    v7->_confidence = v9;
  }

  return v7;
}

+ (id)protoFields
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"activityType" number:1 type:4 subMessageClass:0];
  v6[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"confidence" number:2 type:1 subMessageClass:0];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5F58;
}

+ (id)columns
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"activityType" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:4 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"confidence" dataType:1 requestOnly:0 fieldNumber:2 protoDataType:1 convertedType:0];
  v6[0] = v2;
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
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
    double v7 = (void *)[[v5 alloc] initWithData:v6];

    float v8 = [[BMContextualUnderstandingActivityInferenceInferredActivity alloc] initByReadFrom:v7];
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