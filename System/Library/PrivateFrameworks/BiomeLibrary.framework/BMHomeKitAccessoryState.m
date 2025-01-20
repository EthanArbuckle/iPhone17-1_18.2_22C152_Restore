@interface BMHomeKitAccessoryState
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMHomeKitAccessoryState)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMHomeKitAccessoryState)initWithMediaPropertyType:(id)a3 valueType:(int)a4 dataValue:(id)a5 stringValue:(id)a6 numValue:(id)a7;
- (BOOL)hasNumValue;
- (BOOL)isEqual:(id)a3;
- (NSData)dataValue;
- (NSString)description;
- (NSString)mediaPropertyType;
- (NSString)stringValue;
- (double)numValue;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)valueType;
- (unsigned)dataVersion;
- (void)setHasNumValue:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMHomeKitAccessoryState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_dataValue, 0);

  objc_storeStrong((id *)&self->_mediaPropertyType, 0);
}

- (void)setHasNumValue:(BOOL)a3
{
  self->_hasNumValue = a3;
}

- (BOOL)hasNumValue
{
  return self->_hasNumValue;
}

- (double)numValue
{
  return self->_numValue;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (NSData)dataValue
{
  return self->_dataValue;
}

- (int)valueType
{
  return self->_valueType;
}

- (NSString)mediaPropertyType
{
  return self->_mediaPropertyType;
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
    v6 = [(BMHomeKitAccessoryState *)self mediaPropertyType];
    uint64_t v7 = [v5 mediaPropertyType];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMHomeKitAccessoryState *)self mediaPropertyType];
      v10 = [v5 mediaPropertyType];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_21;
      }
    }
    int v13 = [(BMHomeKitAccessoryState *)self valueType];
    if (v13 == [v5 valueType])
    {
      v14 = [(BMHomeKitAccessoryState *)self dataValue];
      uint64_t v15 = [v5 dataValue];
      if (v14 == (void *)v15)
      {
      }
      else
      {
        v16 = (void *)v15;
        v17 = [(BMHomeKitAccessoryState *)self dataValue];
        v18 = [v5 dataValue];
        int v19 = [v17 isEqual:v18];

        if (!v19) {
          goto LABEL_21;
        }
      }
      v20 = [(BMHomeKitAccessoryState *)self stringValue];
      uint64_t v21 = [v5 stringValue];
      if (v20 == (void *)v21)
      {
      }
      else
      {
        v22 = (void *)v21;
        v23 = [(BMHomeKitAccessoryState *)self stringValue];
        v24 = [v5 stringValue];
        int v25 = [v23 isEqual:v24];

        if (!v25) {
          goto LABEL_21;
        }
      }
      if (![(BMHomeKitAccessoryState *)self hasNumValue]
        && ![v5 hasNumValue])
      {
        BOOL v12 = 1;
        goto LABEL_22;
      }
      if (-[BMHomeKitAccessoryState hasNumValue](self, "hasNumValue") && [v5 hasNumValue])
      {
        [(BMHomeKitAccessoryState *)self numValue];
        double v27 = v26;
        [v5 numValue];
        BOOL v12 = v27 == v28;
LABEL_22:

        goto LABEL_23;
      }
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
  v21[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMHomeKitAccessoryState *)self mediaPropertyType];
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMHomeKitAccessoryState valueType](self, "valueType"));
  id v5 = [(BMHomeKitAccessoryState *)self dataValue];
  v6 = [v5 base64EncodedStringWithOptions:0];

  uint64_t v7 = [(BMHomeKitAccessoryState *)self stringValue];
  v8 = 0;
  if ([(BMHomeKitAccessoryState *)self hasNumValue])
  {
    [(BMHomeKitAccessoryState *)self numValue];
    if (fabs(v9) == INFINITY)
    {
      v8 = 0;
    }
    else
    {
      [(BMHomeKitAccessoryState *)self numValue];
      v10 = NSNumber;
      [(BMHomeKitAccessoryState *)self numValue];
      v8 = objc_msgSend(v10, "numberWithDouble:");
    }
  }
  uint64_t v18 = v3;
  v20[0] = @"mediaPropertyType";
  int v11 = (void *)v3;
  if (!v3)
  {
    int v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v21[0] = v11;
  v20[1] = @"valueType";
  BOOL v12 = v4;
  if (!v4)
  {
    BOOL v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v21[1] = v12;
  v20[2] = @"dataValue";
  int v13 = v6;
  if (!v6)
  {
    int v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v21[2] = v13;
  v20[3] = @"stringValue";
  v14 = v7;
  if (!v7)
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v21[3] = v14;
  v20[4] = @"numValue";
  uint64_t v15 = v8;
  if (!v8)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v21[4] = v15;
  v16 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v21, v20, 5, v18);
  if (v8)
  {
    if (v7) {
      goto LABEL_17;
    }
  }
  else
  {

    if (v7)
    {
LABEL_17:
      if (v6) {
        goto LABEL_18;
      }
LABEL_26:

      if (v4) {
        goto LABEL_19;
      }
      goto LABEL_27;
    }
  }

  if (!v6) {
    goto LABEL_26;
  }
LABEL_18:
  if (v4) {
    goto LABEL_19;
  }
LABEL_27:

LABEL_19:
  if (!v19) {

  }
  return v16;
}

- (BMHomeKitAccessoryState)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"mediaPropertyType"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    double v9 = [v6 objectForKeyedSubscript:@"valueType"];
    v40 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v10 = v9;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v16 = 0;
            goto LABEL_29;
          }
          id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
          v33 = a4;
          uint64_t v34 = *MEMORY[0x1E4F502C8];
          uint64_t v49 = *MEMORY[0x1E4F28568];
          id v42 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"valueType"];
          id v50 = v42;
          v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
          id v35 = (id)[v32 initWithDomain:v34 code:2 userInfo:v17];
          a4 = 0;
          v16 = 0;
          id *v33 = v35;
LABEL_28:

LABEL_29:
          uint64_t v7 = v40;
          goto LABEL_30;
        }
        v10 = [NSNumber numberWithInt:BMHomeKitAccessoryStateValueTypeFromString(v9)];
      }
      v39 = v10;
    }
    else
    {
      v39 = 0;
    }
    v17 = [v6 objectForKeyedSubscript:@"dataValue"];
    id v41 = v8;
    if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v42 = 0;
          v16 = 0;
          a4 = v39;
          goto LABEL_28;
        }
        id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v24 = *MEMORY[0x1E4F502C8];
        uint64_t v47 = *MEMORY[0x1E4F28568];
        id v19 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSData", objc_opt_class(), @"dataValue"];
        id v48 = v19;
        uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
        id v25 = (id)[v23 initWithDomain:v24 code:2 userInfo:v18];
        v16 = 0;
        id v42 = 0;
        double v26 = a4;
        a4 = v39;
        *double v26 = v25;
        goto LABEL_27;
      }
      id v42 = v17;
    }
    else
    {
      id v42 = 0;
    }
    uint64_t v18 = [v6 objectForKeyedSubscript:@"stringValue"];
    if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v19 = 0;
          v16 = 0;
          a4 = v39;
          goto LABEL_27;
        }
        id v27 = objc_alloc(MEMORY[0x1E4F28C58]);
        v37 = a4;
        uint64_t v28 = *MEMORY[0x1E4F502C8];
        uint64_t v45 = *MEMORY[0x1E4F28568];
        id v21 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"stringValue"];
        id v46 = v21;
        v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
        id v29 = (id)[v27 initWithDomain:v28 code:2 userInfo:v20];
        v16 = 0;
        id v19 = 0;
        a4 = v39;
        id *v37 = v29;
        goto LABEL_26;
      }
      id v19 = v18;
    }
    else
    {
      id v19 = 0;
    }
    v20 = [v6 objectForKeyedSubscript:@"numValue"];
    if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v38 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v36 = *MEMORY[0x1E4F502C8];
          uint64_t v43 = *MEMORY[0x1E4F28568];
          v30 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"numValue"];
          v44 = v30;
          v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
          *a4 = (id)[v38 initWithDomain:v36 code:2 userInfo:v31];
        }
        id v21 = 0;
        v16 = 0;
        a4 = v39;
        goto LABEL_26;
      }
      id v21 = v20;
    }
    else
    {
      id v21 = 0;
    }
    a4 = v39;
    v16 = -[BMHomeKitAccessoryState initWithMediaPropertyType:valueType:dataValue:stringValue:numValue:](self, "initWithMediaPropertyType:valueType:dataValue:stringValue:numValue:", v41, [v39 intValue], v42, v19, v21);
    self = v16;
LABEL_26:

LABEL_27:
    id v8 = v41;
    goto LABEL_28;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    id v8 = 0;
    v16 = 0;
    goto LABEL_31;
  }
  id v11 = objc_alloc(MEMORY[0x1E4F28C58]);
  BOOL v12 = a4;
  uint64_t v13 = *MEMORY[0x1E4F502C8];
  uint64_t v51 = *MEMORY[0x1E4F28568];
  v14 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"mediaPropertyType"];
  v52[0] = v14;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:&v51 count:1];
  uint64_t v15 = v13;
  a4 = v14;
  id v8 = 0;
  v16 = 0;
  *BOOL v12 = (id)[v11 initWithDomain:v15 code:2 userInfo:v9];
LABEL_30:

LABEL_31:
  return v16;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMHomeKitAccessoryState *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if (self->_mediaPropertyType) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_dataValue) {
    PBDataWriterWriteDataField();
  }
  if (self->_stringValue) {
    PBDataWriterWriteStringField();
  }
  id v4 = v5;
  if (self->_hasNumValue)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)BMHomeKitAccessoryState;
  id v5 = [(BMEventBase *)&v35 init];
  if (!v5) {
    goto LABEL_47;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
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
          uint64_t v21 = 32;
          goto LABEL_32;
        case 2u:
          char v22 = 0;
          unsigned int v23 = 0;
          uint64_t v24 = 0;
          break;
        case 3u:
          uint64_t v20 = PBReaderReadData();
          uint64_t v21 = 40;
          goto LABEL_32;
        case 4u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 48;
LABEL_32:
          id v29 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        case 5u:
          v5->_hasNumValue = 1;
          uint64_t v30 = *v6;
          unint64_t v31 = *(void *)&v4[v30];
          if (v31 <= 0xFFFFFFFFFFFFFFF7 && v31 + 8 <= *(void *)&v4[*v7])
          {
            double v32 = *(double *)(*(void *)&v4[*v9] + v31);
            *(void *)&v4[v30] = v31 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v32 = 0.0;
          }
          v5->_numValue = v32;
          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_46;
          }
          continue;
      }
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
          goto LABEL_37;
        }
        v22 += 7;
        BOOL v17 = v23++ >= 9;
        if (v17)
        {
          LODWORD(v24) = 0;
          goto LABEL_39;
        }
      }
      v4[*v8] = 1;
LABEL_37:
      if (v4[*v8]) {
        LODWORD(v24) = 0;
      }
LABEL_39:
      if (v24 >= 4) {
        LODWORD(v24) = 0;
      }
      v5->_valueType = v24;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_46:
  }
    v33 = 0;
  else {
LABEL_47:
  }
    v33 = v5;

  return v33;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMHomeKitAccessoryState *)self mediaPropertyType];
  id v5 = BMHomeKitAccessoryStateValueTypeAsString([(BMHomeKitAccessoryState *)self valueType]);
  id v6 = [(BMHomeKitAccessoryState *)self dataValue];
  uint64_t v7 = [(BMHomeKitAccessoryState *)self stringValue];
  id v8 = NSNumber;
  [(BMHomeKitAccessoryState *)self numValue];
  double v9 = objc_msgSend(v8, "numberWithDouble:");
  char v10 = (void *)[v3 initWithFormat:@"BMHomeKitAccessoryState with mediaPropertyType: %@, valueType: %@, dataValue: %@, stringValue: %@, numValue: %@", v4, v5, v6, v7, v9];

  return (NSString *)v10;
}

- (BMHomeKitAccessoryState)initWithMediaPropertyType:(id)a3 valueType:(int)a4 dataValue:(id)a5 stringValue:(id)a6 numValue:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)BMHomeKitAccessoryState;
  BOOL v17 = [(BMEventBase *)&v20 init];
  if (v17)
  {
    v17->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v17->_mediaPropertyType, a3);
    v17->_valueType = a4;
    objc_storeStrong((id *)&v17->_dataValue, a5);
    objc_storeStrong((id *)&v17->_stringValue, a6);
    if (v16)
    {
      v17->_hasNumValue = 1;
      [v16 doubleValue];
    }
    else
    {
      v17->_hasNumValue = 0;
      double v18 = -1.0;
    }
    v17->_numValue = v18;
  }

  return v17;
}

+ (id)protoFields
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"mediaPropertyType" number:1 type:13 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"valueType", 2, 4, 0, v2);
  v9[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"dataValue" number:3 type:14 subMessageClass:0];
  v9[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"stringValue" number:4 type:13 subMessageClass:0];
  v9[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"numValue" number:5 type:0 subMessageClass:0];
  v9[4] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5FD0;
}

+ (id)columns
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"mediaPropertyType" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"valueType" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"dataValue" dataType:4 requestOnly:0 fieldNumber:3 protoDataType:14 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"stringValue" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"numValue" dataType:1 requestOnly:0 fieldNumber:5 protoDataType:0 convertedType:0];
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  v9[4] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5 = a3;
  if (a4)
  {
    if (a4 != 1)
    {
      double v9 = 0;
      goto LABEL_9;
    }
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F94090]) initWithData:v5];
    uint64_t v7 = BMHomeKitAccessoryState;
  }
  else
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F94090]) initWithData:v5];
    uint64_t v7 = BMHomeKitAccessoryState_v0;
  }
  uint64_t v8 = [[v7 alloc] initByReadFrom:v6];
  double v9 = (void *)v8;
  if (v8) {
    *(_DWORD *)(v8 + 20) = a4;
  }

LABEL_9:

  return v9;
}

+ (unsigned)latestDataVersion
{
  return 1;
}

@end