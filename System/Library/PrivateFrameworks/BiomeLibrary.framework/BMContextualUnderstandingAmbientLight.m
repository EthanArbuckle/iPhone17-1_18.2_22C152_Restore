@interface BMContextualUnderstandingAmbientLight
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMContextualUnderstandingAmbientLight)initWithAmbientLightColorComponent0:(id)a3 ambientLightColorComponent1:(id)a4 ambientLightColorComponent2:(id)a5;
- (BMContextualUnderstandingAmbientLight)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasAmbientLightColorComponent0;
- (BOOL)hasAmbientLightColorComponent1;
- (BOOL)hasAmbientLightColorComponent2;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (double)ambientLightColorComponent0;
- (double)ambientLightColorComponent1;
- (double)ambientLightColorComponent2;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)setHasAmbientLightColorComponent0:(BOOL)a3;
- (void)setHasAmbientLightColorComponent1:(BOOL)a3;
- (void)setHasAmbientLightColorComponent2:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMContextualUnderstandingAmbientLight

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMContextualUnderstandingAmbientLight *)self writeTo:v3];
  v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasAmbientLightColorComponent0)
  {
    PBDataWriterWriteFloatField();
    id v4 = v5;
  }
  if (self->_hasAmbientLightColorComponent1)
  {
    PBDataWriterWriteFloatField();
    id v4 = v5;
  }
  if (self->_hasAmbientLightColorComponent2)
  {
    PBDataWriterWriteFloatField();
    id v4 = v5;
  }
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BMContextualUnderstandingAmbientLight)initWithAmbientLightColorComponent0:(id)a3 ambientLightColorComponent1:(id)a4 ambientLightColorComponent2:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)BMContextualUnderstandingAmbientLight;
  v11 = [(BMEventBase *)&v19 init];
  if (v11)
  {
    v11->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v8)
    {
      v11->_hasAmbientLightColorComponent0 = 1;
      [v8 floatValue];
      double v13 = v12;
    }
    else
    {
      v11->_hasAmbientLightColorComponent0 = 0;
      double v13 = -1.0;
    }
    v11->_ambientLightColorComponent0 = v13;
    if (v9)
    {
      v11->_hasAmbientLightColorComponent1 = 1;
      [v9 floatValue];
      double v15 = v14;
    }
    else
    {
      v11->_hasAmbientLightColorComponent1 = 0;
      double v15 = -1.0;
    }
    v11->_ambientLightColorComponent1 = v15;
    if (v10)
    {
      v11->_hasAmbientLightColorComponent2 = 1;
      [v10 floatValue];
      double v17 = v16;
    }
    else
    {
      v11->_hasAmbientLightColorComponent2 = 0;
      double v17 = -1.0;
    }
    v11->_ambientLightColorComponent2 = v17;
  }

  return v11;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

- (void)setHasAmbientLightColorComponent2:(BOOL)a3
{
  self->_hasAmbientLightColorComponent2 = a3;
}

- (BOOL)hasAmbientLightColorComponent2
{
  return self->_hasAmbientLightColorComponent2;
}

- (double)ambientLightColorComponent2
{
  return self->_ambientLightColorComponent2;
}

- (void)setHasAmbientLightColorComponent1:(BOOL)a3
{
  self->_hasAmbientLightColorComponent1 = a3;
}

- (BOOL)hasAmbientLightColorComponent1
{
  return self->_hasAmbientLightColorComponent1;
}

- (double)ambientLightColorComponent1
{
  return self->_ambientLightColorComponent1;
}

- (void)setHasAmbientLightColorComponent0:(BOOL)a3
{
  self->_hasAmbientLightColorComponent0 = a3;
}

- (BOOL)hasAmbientLightColorComponent0
{
  return self->_hasAmbientLightColorComponent0;
}

- (double)ambientLightColorComponent0
{
  return self->_ambientLightColorComponent0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([(BMContextualUnderstandingAmbientLight *)self hasAmbientLightColorComponent0]
      || [v5 hasAmbientLightColorComponent0])
    {
      if (![(BMContextualUnderstandingAmbientLight *)self hasAmbientLightColorComponent0])goto LABEL_18; {
      if (![v5 hasAmbientLightColorComponent0])
      }
        goto LABEL_18;
      [(BMContextualUnderstandingAmbientLight *)self ambientLightColorComponent0];
      double v7 = v6;
      [v5 ambientLightColorComponent0];
      if (v7 != v8) {
        goto LABEL_18;
      }
    }
    if ([(BMContextualUnderstandingAmbientLight *)self hasAmbientLightColorComponent1]
      || [v5 hasAmbientLightColorComponent1])
    {
      if (![(BMContextualUnderstandingAmbientLight *)self hasAmbientLightColorComponent1])goto LABEL_18; {
      if (![v5 hasAmbientLightColorComponent1])
      }
        goto LABEL_18;
      [(BMContextualUnderstandingAmbientLight *)self ambientLightColorComponent1];
      double v10 = v9;
      [v5 ambientLightColorComponent1];
      if (v10 != v11) {
        goto LABEL_18;
      }
    }
    if (!-[BMContextualUnderstandingAmbientLight hasAmbientLightColorComponent2](self, "hasAmbientLightColorComponent2")&& ![v5 hasAmbientLightColorComponent2])
    {
      BOOL v15 = 1;
      goto LABEL_19;
    }
    if ([(BMContextualUnderstandingAmbientLight *)self hasAmbientLightColorComponent2]
      && [v5 hasAmbientLightColorComponent2])
    {
      [(BMContextualUnderstandingAmbientLight *)self ambientLightColorComponent2];
      double v13 = v12;
      [v5 ambientLightColorComponent2];
      BOOL v15 = v13 == v14;
    }
    else
    {
LABEL_18:
      BOOL v15 = 0;
    }
LABEL_19:

    goto LABEL_20;
  }
  BOOL v15 = 0;
LABEL_20:

  return v15;
}

- (id)jsonDictionary
{
  v18[3] = *MEMORY[0x1E4F143B8];
  if (![(BMContextualUnderstandingAmbientLight *)self hasAmbientLightColorComponent0]
    || ([(BMContextualUnderstandingAmbientLight *)self ambientLightColorComponent0],
        fabs(v3) == INFINITY))
  {
    id v5 = 0;
  }
  else
  {
    [(BMContextualUnderstandingAmbientLight *)self ambientLightColorComponent0];
    id v4 = NSNumber;
    [(BMContextualUnderstandingAmbientLight *)self ambientLightColorComponent0];
    id v5 = objc_msgSend(v4, "numberWithDouble:");
  }
  if (![(BMContextualUnderstandingAmbientLight *)self hasAmbientLightColorComponent1]
    || ([(BMContextualUnderstandingAmbientLight *)self ambientLightColorComponent1],
        fabs(v6) == INFINITY))
  {
    double v8 = 0;
  }
  else
  {
    [(BMContextualUnderstandingAmbientLight *)self ambientLightColorComponent1];
    double v7 = NSNumber;
    [(BMContextualUnderstandingAmbientLight *)self ambientLightColorComponent1];
    double v8 = objc_msgSend(v7, "numberWithDouble:");
  }
  if (![(BMContextualUnderstandingAmbientLight *)self hasAmbientLightColorComponent2]
    || ([(BMContextualUnderstandingAmbientLight *)self ambientLightColorComponent2],
        fabs(v9) == INFINITY))
  {
    double v11 = 0;
  }
  else
  {
    [(BMContextualUnderstandingAmbientLight *)self ambientLightColorComponent2];
    double v10 = NSNumber;
    [(BMContextualUnderstandingAmbientLight *)self ambientLightColorComponent2];
    double v11 = objc_msgSend(v10, "numberWithDouble:");
  }
  v17[0] = @"ambientLightColorComponent0";
  double v12 = v5;
  if (!v5)
  {
    double v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[0] = v12;
  v17[1] = @"ambientLightColorComponent1";
  double v13 = v8;
  if (!v8)
  {
    double v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[1] = v13;
  v17[2] = @"ambientLightColorComponent2";
  double v14 = v11;
  if (!v11)
  {
    double v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[2] = v14;
  BOOL v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];
  if (v11)
  {
    if (v8) {
      goto LABEL_21;
    }
LABEL_26:

    if (v5) {
      goto LABEL_22;
    }
    goto LABEL_27;
  }

  if (!v8) {
    goto LABEL_26;
  }
LABEL_21:
  if (v5) {
    goto LABEL_22;
  }
LABEL_27:

LABEL_22:

  return v15;
}

- (BMContextualUnderstandingAmbientLight)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = [v6 objectForKeyedSubscript:@"ambientLightColorComponent0"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    double v9 = [v6 objectForKeyedSubscript:@"ambientLightColorComponent1"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v10 = 0;
          double v13 = 0;
          goto LABEL_12;
        }
        id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v18 = *MEMORY[0x1E4F502C8];
        uint64_t v27 = *MEMORY[0x1E4F28568];
        id v12 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"ambientLightColorComponent1"];
        id v28 = v12;
        double v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
        id v19 = (id)[v23 initWithDomain:v18 code:2 userInfo:v11];
        double v13 = 0;
        id v10 = 0;
        *a4 = v19;
        goto LABEL_11;
      }
      id v10 = v9;
    }
    else
    {
      id v10 = 0;
    }
    double v11 = [v6 objectForKeyedSubscript:@"ambientLightColorComponent2"];
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v22 = *MEMORY[0x1E4F502C8];
          uint64_t v25 = *MEMORY[0x1E4F28568];
          v20 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"ambientLightColorComponent2"];
          v26 = v20;
          v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
          *a4 = (id)[v24 initWithDomain:v22 code:2 userInfo:v21];
        }
        id v12 = 0;
        double v13 = 0;
        goto LABEL_11;
      }
      id v12 = v11;
    }
    else
    {
      id v12 = 0;
    }
    self = [(BMContextualUnderstandingAmbientLight *)self initWithAmbientLightColorComponent0:v8 ambientLightColorComponent1:v10 ambientLightColorComponent2:v12];
    double v13 = self;
LABEL_11:

    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    double v13 = 0;
    id v8 = 0;
    goto LABEL_13;
  }
  id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v16 = *MEMORY[0x1E4F502C8];
  uint64_t v29 = *MEMORY[0x1E4F28568];
  id v10 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"ambientLightColorComponent0"];
  v30[0] = v10;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
  id v17 = (id)[v15 initWithDomain:v16 code:2 userInfo:v9];
  double v13 = 0;
  id v8 = 0;
  *a4 = v17;
LABEL_12:

LABEL_13:
  return v13;
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)BMContextualUnderstandingAmbientLight;
  id v5 = [(BMEventBase *)&v31 init];
  if (!v5) {
    goto LABEL_43;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  double v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    double v9 = (int *)MEMORY[0x1E4F940B8];
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
      unint64_t v20 = v12 >> 3;
      if ((v12 >> 3) == 3)
      {
        v5->_hasAmbientLightColorComponent2 = 1;
        uint64_t v24 = *v6;
        unint64_t v25 = *(void *)&v4[v24];
        if (v25 <= 0xFFFFFFFFFFFFFFFBLL && v25 + 4 <= *(void *)&v4[*v7])
        {
          float v23 = *(float *)(*(void *)&v4[*v9] + v25);
          *(void *)&v4[v24] = v25 + 4;
        }
        else
        {
          v4[*v8] = 1;
          float v23 = 0.0;
        }
        id v28 = &OBJC_IVAR___BMContextualUnderstandingAmbientLight__ambientLightColorComponent2;
      }
      else if (v20 == 2)
      {
        v5->_hasAmbientLightColorComponent1 = 1;
        uint64_t v26 = *v6;
        unint64_t v27 = *(void *)&v4[v26];
        if (v27 <= 0xFFFFFFFFFFFFFFFBLL && v27 + 4 <= *(void *)&v4[*v7])
        {
          float v23 = *(float *)(*(void *)&v4[*v9] + v27);
          *(void *)&v4[v26] = v27 + 4;
        }
        else
        {
          v4[*v8] = 1;
          float v23 = 0.0;
        }
        id v28 = &OBJC_IVAR___BMContextualUnderstandingAmbientLight__ambientLightColorComponent1;
      }
      else
      {
        if (v20 != 1)
        {
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            goto LABEL_42;
          }
          continue;
        }
        v5->_hasAmbientLightColorComponent0 = 1;
        uint64_t v21 = *v6;
        unint64_t v22 = *(void *)&v4[v21];
        if (v22 <= 0xFFFFFFFFFFFFFFFBLL && v22 + 4 <= *(void *)&v4[*v7])
        {
          float v23 = *(float *)(*(void *)&v4[*v9] + v22);
          *(void *)&v4[v21] = v22 + 4;
        }
        else
        {
          v4[*v8] = 1;
          float v23 = 0.0;
        }
        id v28 = &OBJC_IVAR___BMContextualUnderstandingAmbientLight__ambientLightColorComponent0;
      }
      *(double *)((char *)&v5->super.super.isa + *v28) = v23;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_42:
  }
    uint64_t v29 = 0;
  else {
LABEL_43:
  }
    uint64_t v29 = v5;

  return v29;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = NSNumber;
  [(BMContextualUnderstandingAmbientLight *)self ambientLightColorComponent0];
  id v5 = objc_msgSend(v4, "numberWithDouble:");
  id v6 = NSNumber;
  [(BMContextualUnderstandingAmbientLight *)self ambientLightColorComponent1];
  double v7 = objc_msgSend(v6, "numberWithDouble:");
  id v8 = NSNumber;
  [(BMContextualUnderstandingAmbientLight *)self ambientLightColorComponent2];
  double v9 = objc_msgSend(v8, "numberWithDouble:");
  char v10 = (void *)[v3 initWithFormat:@"BMContextualUnderstandingAmbientLight with ambientLightColorComponent0: %@, ambientLightColorComponent1: %@, ambientLightColorComponent2: %@", v5, v7, v9];

  return (NSString *)v10;
}

+ (id)protoFields
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"ambientLightColorComponent0" number:1 type:1 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"ambientLightColorComponent1", 2, 1, 0, v2);
  v7[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"ambientLightColorComponent2" number:3 type:1 subMessageClass:0];
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3798;
}

+ (id)columns
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"ambientLightColorComponent0" dataType:1 requestOnly:0 fieldNumber:1 protoDataType:1 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"ambientLightColorComponent1" dataType:1 requestOnly:0 fieldNumber:2 protoDataType:1 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"ambientLightColorComponent2" dataType:1 requestOnly:0 fieldNumber:3 protoDataType:1 convertedType:0];
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
    double v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMContextualUnderstandingAmbientLight alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[5] = 0;
    }
  }

  return v4;
}

@end