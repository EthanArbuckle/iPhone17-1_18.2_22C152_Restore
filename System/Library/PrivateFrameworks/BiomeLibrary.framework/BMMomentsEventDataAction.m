@interface BMMomentsEventDataAction
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMomentsEventDataAction)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMMomentsEventDataAction)initWithType:(int)a3;
- (BMMomentsEventDataAction)initWithType:(int)a3 actionName:(id)a4 actionNameConfidence:(id)a5;
- (BOOL)hasActionNameConfidence;
- (BOOL)isEqual:(id)a3;
- (NSString)actionName;
- (NSString)description;
- (double)actionNameConfidence;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)type;
- (unsigned)dataVersion;
- (void)setHasActionNameConfidence:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMMomentsEventDataAction

- (void).cxx_destruct
{
}

- (void)setHasActionNameConfidence:(BOOL)a3
{
  self->_hasActionNameConfidence = a3;
}

- (BOOL)hasActionNameConfidence
{
  return self->_hasActionNameConfidence;
}

- (double)actionNameConfidence
{
  return self->_actionNameConfidence;
}

- (NSString)actionName
{
  return self->_actionName;
}

- (int)type
{
  return self->_type;
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
    int v6 = [(BMMomentsEventDataAction *)self type];
    if (v6 == [v5 type])
    {
      v7 = [(BMMomentsEventDataAction *)self actionName];
      uint64_t v8 = [v5 actionName];
      if (v7 == (void *)v8)
      {
      }
      else
      {
        v9 = (void *)v8;
        v10 = [(BMMomentsEventDataAction *)self actionName];
        v11 = [v5 actionName];
        int v12 = [v10 isEqual:v11];

        if (!v12) {
          goto LABEL_13;
        }
      }
      if (![(BMMomentsEventDataAction *)self hasActionNameConfidence]
        && ![v5 hasActionNameConfidence])
      {
        BOOL v13 = 1;
        goto LABEL_14;
      }
      if ([(BMMomentsEventDataAction *)self hasActionNameConfidence]
        && [v5 hasActionNameConfidence])
      {
        [(BMMomentsEventDataAction *)self actionNameConfidence];
        double v15 = v14;
        [v5 actionNameConfidence];
        BOOL v13 = v15 == v16;
LABEL_14:

        goto LABEL_15;
      }
    }
LABEL_13:
    BOOL v13 = 0;
    goto LABEL_14;
  }
  BOOL v13 = 0;
LABEL_15:

  return v13;
}

- (id)jsonDictionary
{
  v14[3] = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEventDataAction type](self, "type"));
  id v4 = [(BMMomentsEventDataAction *)self actionName];
  if (![(BMMomentsEventDataAction *)self hasActionNameConfidence]
    || ([(BMMomentsEventDataAction *)self actionNameConfidence], fabs(v5) == INFINITY))
  {
    v7 = 0;
  }
  else
  {
    [(BMMomentsEventDataAction *)self actionNameConfidence];
    int v6 = NSNumber;
    [(BMMomentsEventDataAction *)self actionNameConfidence];
    v7 = objc_msgSend(v6, "numberWithDouble:");
  }
  v13[0] = @"type";
  uint64_t v8 = v3;
  if (!v3)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[0] = v8;
  v13[1] = @"actionName";
  v9 = v4;
  if (!v4)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[1] = v9;
  v13[2] = @"actionNameConfidence";
  v10 = v7;
  if (!v7)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[2] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  if (v7)
  {
    if (v4) {
      goto LABEL_13;
    }
LABEL_18:

    if (v3) {
      goto LABEL_14;
    }
    goto LABEL_19;
  }

  if (!v4) {
    goto LABEL_18;
  }
LABEL_13:
  if (v3) {
    goto LABEL_14;
  }
LABEL_19:

LABEL_14:

  return v11;
}

- (BMMomentsEventDataAction)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:@"type"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v8 = 0;
LABEL_9:
    v10 = [v6 objectForKeyedSubscript:@"actionName"];
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v11 = 0;
          double v14 = 0;
          goto LABEL_17;
        }
        id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v16 = *MEMORY[0x1E4F502C8];
        uint64_t v27 = *MEMORY[0x1E4F28568];
        id v13 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"actionName"];
        id v28 = v13;
        int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
        id v17 = (id)[v23 initWithDomain:v16 code:2 userInfo:v12];
        double v14 = 0;
        id v11 = 0;
        *a4 = v17;
        goto LABEL_16;
      }
      id v11 = v10;
    }
    else
    {
      id v11 = 0;
    }
    int v12 = [v6 objectForKeyedSubscript:@"actionNameConfidence"];
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v22 = *MEMORY[0x1E4F502C8];
          uint64_t v25 = *MEMORY[0x1E4F28568];
          v18 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"actionNameConfidence"];
          v26 = v18;
          v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
          *a4 = (id)[v24 initWithDomain:v22 code:2 userInfo:v19];
        }
        id v13 = 0;
        double v14 = 0;
        goto LABEL_16;
      }
      id v13 = v12;
    }
    else
    {
      id v13 = 0;
    }
    self = -[BMMomentsEventDataAction initWithType:actionName:actionNameConfidence:](self, "initWithType:actionName:actionNameConfidence:", [v8 intValue], v11, v13);
    double v14 = self;
LABEL_16:

    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v7;
LABEL_8:
    uint64_t v8 = v9;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [NSNumber numberWithInt:BMMomentsEventDataActionTypeFromString(v7)];
    goto LABEL_8;
  }
  if (!a4)
  {
    uint64_t v8 = 0;
    double v14 = 0;
    goto LABEL_18;
  }
  id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v21 = *MEMORY[0x1E4F502C8];
  uint64_t v29 = *MEMORY[0x1E4F28568];
  id v11 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"type"];
  v30[0] = v11;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
  uint64_t v8 = 0;
  double v14 = 0;
  *a4 = (id)[v20 initWithDomain:v21 code:2 userInfo:v10];
LABEL_17:

LABEL_18:
  return v14;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMMomentsEventDataAction *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_actionName) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasActionNameConfidence) {
    PBDataWriterWriteFloatField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)BMMomentsEventDataAction;
  double v5 = [(BMEventBase *)&v35 init];
  if (!v5) {
    goto LABEL_46;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  v7 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v8 = (int *)MEMORY[0x1E4F940C8];
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
      unint64_t v20 = v12 >> 3;
      if ((v12 >> 3) == 3)
      {
        v5->_hasActionNameConfidence = 1;
        uint64_t v28 = *v6;
        unint64_t v29 = *(void *)&v4[v28];
        if (v29 <= 0xFFFFFFFFFFFFFFFBLL && v29 + 4 <= *(void *)&v4[*v7])
        {
          float v30 = *(float *)(*(void *)&v4[*v9] + v29);
          *(void *)&v4[v28] = v29 + 4;
        }
        else
        {
          v4[*v8] = 1;
          float v30 = 0.0;
        }
        v5->_actionNameConfidence = v30;
      }
      else if (v20 == 2)
      {
        uint64_t v31 = PBReaderReadString();
        actionName = v5->_actionName;
        v5->_actionName = (NSString *)v31;
      }
      else if (v20 == 1)
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
            goto LABEL_36;
          }
          v21 += 7;
          BOOL v17 = v22++ >= 9;
          if (v17)
          {
            LODWORD(v23) = 0;
            goto LABEL_38;
          }
        }
        v4[*v8] = 1;
LABEL_36:
        if (v4[*v8]) {
          LODWORD(v23) = 0;
        }
LABEL_38:
        if (v23 >= 0xD) {
          LODWORD(v23) = 0;
        }
        v5->_type = v23;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_45;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_45:
  }
    v33 = 0;
  else {
LABEL_46:
  }
    v33 = v5;

  return v33;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = BMMomentsEventDataActionTypeAsString([(BMMomentsEventDataAction *)self type]);
  double v5 = [(BMMomentsEventDataAction *)self actionName];
  id v6 = NSNumber;
  [(BMMomentsEventDataAction *)self actionNameConfidence];
  v7 = objc_msgSend(v6, "numberWithDouble:");
  uint64_t v8 = (void *)[v3 initWithFormat:@"BMMomentsEventDataAction with type: %@, actionName: %@, actionNameConfidence: %@", v4, v5, v7];

  return (NSString *)v8;
}

- (BMMomentsEventDataAction)initWithType:(int)a3 actionName:(id)a4 actionNameConfidence:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BMMomentsEventDataAction;
  unsigned int v11 = [(BMEventBase *)&v15 init];
  if (v11)
  {
    v11->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    v11->_type = a3;
    objc_storeStrong((id *)&v11->_actionName, a4);
    if (v10)
    {
      v11->_hasActionNameConfidence = 1;
      [v10 floatValue];
      double v13 = v12;
    }
    else
    {
      v11->_hasActionNameConfidence = 0;
      double v13 = -1.0;
    }
    v11->_actionNameConfidence = v13;
  }

  return v11;
}

+ (id)protoFields
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"type" number:1 type:4 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"actionName", 2, 13, 0, v2);
  v7[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"actionNameConfidence" number:3 type:1 subMessageClass:0];
  v7[2] = v4;
  double v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3270;
}

+ (id)columns
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"type" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:4 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"actionName" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"actionNameConfidence" dataType:1 requestOnly:0 fieldNumber:3 protoDataType:1 convertedType:0];
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  double v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

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
    double v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    v7 = (void *)[[v5 alloc] initWithData:v6];

    uint64_t v8 = [[BMMomentsEventDataAction alloc] initByReadFrom:v7];
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

- (BMMomentsEventDataAction)initWithType:(int)a3
{
  return [(BMMomentsEventDataAction *)self initWithType:*(void *)&a3 actionName:0 actionNameConfidence:0];
}

@end