@interface BMAppIntentInvocationValue
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMAppIntentInvocationDisplayRepresentation)displayRepresentation;
- (BMAppIntentInvocationValue)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMAppIntentInvocationValue)initWithValueType:(id)a3 value:(id)a4 displayRepresentation:(id)a5;
- (BMAppIntentInvocationValueType)valueType;
- (BOOL)isEqual:(id)a3;
- (NSData)value;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMAppIntentInvocationValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayRepresentation, 0);
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_valueType, 0);
}

- (BMAppIntentInvocationDisplayRepresentation)displayRepresentation
{
  return self->_displayRepresentation;
}

- (NSData)value
{
  return self->_value;
}

- (BMAppIntentInvocationValueType)valueType
{
  return self->_valueType;
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
    v6 = [(BMAppIntentInvocationValue *)self valueType];
    uint64_t v7 = [v5 valueType];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMAppIntentInvocationValue *)self valueType];
      v10 = [v5 valueType];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_9;
      }
    }
    v13 = [(BMAppIntentInvocationValue *)self value];
    uint64_t v14 = [v5 value];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMAppIntentInvocationValue *)self value];
      v17 = [v5 value];
      int v18 = [v16 isEqual:v17];

      if (!v18)
      {
LABEL_9:
        char v12 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    v19 = [(BMAppIntentInvocationValue *)self displayRepresentation];
    v20 = [v5 displayRepresentation];
    if (v19 == v20)
    {
      char v12 = 1;
    }
    else
    {
      v21 = [(BMAppIntentInvocationValue *)self displayRepresentation];
      v22 = [v5 displayRepresentation];
      char v12 = [v21 isEqual:v22];
    }
    goto LABEL_15;
  }
  char v12 = 0;
LABEL_16:

  return v12;
}

- (id)jsonDictionary
{
  v15[3] = *MEMORY[0x1E4F143B8];
  v3 = [(BMAppIntentInvocationValue *)self valueType];
  id v4 = [v3 jsonDictionary];

  id v5 = [(BMAppIntentInvocationValue *)self value];
  v6 = [v5 base64EncodedStringWithOptions:0];

  uint64_t v7 = [(BMAppIntentInvocationValue *)self displayRepresentation];
  v8 = [v7 jsonDictionary];

  v14[0] = @"valueType";
  v9 = v4;
  if (!v4)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[0] = v9;
  v14[1] = @"value";
  v10 = v6;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[1] = v10;
  v14[2] = @"displayRepresentation";
  int v11 = v8;
  if (!v8)
  {
    int v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[2] = v11;
  char v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
  if (v8)
  {
    if (v6) {
      goto LABEL_9;
    }
LABEL_14:

    if (v4) {
      goto LABEL_10;
    }
    goto LABEL_15;
  }

  if (!v6) {
    goto LABEL_14;
  }
LABEL_9:
  if (v4) {
    goto LABEL_10;
  }
LABEL_15:

LABEL_10:

  return v12;
}

- (BMAppIntentInvocationValue)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"valueType"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v7;
    id v33 = 0;
    v8 = [[BMAppIntentInvocationValueType alloc] initWithJSONDictionary:v11 error:&v33];
    id v16 = v33;
    if (v16)
    {
      v17 = v16;
      if (a4) {
        *a4 = v16;
      }

      uint64_t v14 = 0;
      goto LABEL_14;
    }

LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"value"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          uint64_t v14 = 0;
          id v11 = 0;
          goto LABEL_13;
        }
        id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v23 = *MEMORY[0x1E4F502C8];
        uint64_t v36 = *MEMORY[0x1E4F28568];
        char v12 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSData", objc_opt_class(), @"value"];
        v37 = v12;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
        v24 = a4;
        v13 = (BMAppIntentInvocationDisplayRepresentation *)objc_claimAutoreleasedReturnValue();
        id v25 = (id)[v30 initWithDomain:v23 code:2 userInfo:v13];
        uint64_t v14 = 0;
        id v11 = 0;
        id *v24 = v25;
        goto LABEL_11;
      }
      v10 = a4;
      id v11 = v9;
    }
    else
    {
      v10 = a4;
      id v11 = 0;
    }
    char v12 = [v6 objectForKeyedSubscript:@"displayRepresentation"];
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v10)
        {
          uint64_t v14 = 0;
          goto LABEL_12;
        }
        id v28 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v27 = *MEMORY[0x1E4F502C8];
        uint64_t v34 = *MEMORY[0x1E4F28568];
        v31 = v10;
        v13 = (BMAppIntentInvocationDisplayRepresentation *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"displayRepresentation"];
        v35 = v13;
        v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
        id *v31 = (id)[v28 initWithDomain:v27 code:2 userInfo:v26];

        uint64_t v14 = 0;
LABEL_11:

LABEL_12:
LABEL_13:

        goto LABEL_14;
      }
      v29 = v8;
      id v18 = v12;
      id v32 = 0;
      v13 = [[BMAppIntentInvocationDisplayRepresentation alloc] initWithJSONDictionary:v18 error:&v32];
      id v19 = v32;
      if (v19)
      {
        v20 = v19;
        if (v10) {
          id *v10 = v19;
        }

        uint64_t v14 = 0;
        char v12 = v18;
        v8 = v29;
        goto LABEL_11;
      }

      v8 = v29;
    }
    else
    {
      v13 = 0;
    }
    self = [(BMAppIntentInvocationValue *)self initWithValueType:v8 value:v11 displayRepresentation:v13];
    uint64_t v14 = self;
    goto LABEL_11;
  }
  if (!a4)
  {
    uint64_t v14 = 0;
    goto LABEL_15;
  }
  id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v22 = *MEMORY[0x1E4F502C8];
  uint64_t v38 = *MEMORY[0x1E4F28568];
  v8 = (BMAppIntentInvocationValueType *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"valueType"];
  v39[0] = v8;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
  uint64_t v14 = 0;
  *a4 = (id)[v21 initWithDomain:v22 code:2 userInfo:v11];
LABEL_14:

LABEL_15:
  return v14;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMAppIntentInvocationValue *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_valueType)
  {
    PBDataWriterPlaceMark();
    [(BMAppIntentInvocationValueType *)self->_valueType writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_value) {
    PBDataWriterWriteDataField();
  }
  if (self->_displayRepresentation)
  {
    PBDataWriterPlaceMark();
    [(BMAppIntentInvocationDisplayRepresentation *)self->_displayRepresentation writeTo:v4];
    PBDataWriterRecallMark();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)BMAppIntentInvocationValue;
  id v5 = [(BMEventBase *)&v28 init];
  if (!v5) {
    goto LABEL_34;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  v8 = (int *)MEMORY[0x1E4F940C8];
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
        uint64_t v29 = 0;
        uint64_t v30 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_33;
        }
        id v21 = [[BMAppIntentInvocationDisplayRepresentation alloc] initByReadFrom:v4];
        if (!v21) {
          goto LABEL_33;
        }
        uint64_t v22 = 40;
      }
      else
      {
        if (v20 == 2)
        {
          uint64_t v24 = PBReaderReadData();
          value = v5->_value;
          v5->_value = (NSData *)v24;

          continue;
        }
        if (v20 != 1)
        {
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_33;
          }
          continue;
        }
        uint64_t v29 = 0;
        uint64_t v30 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_33;
        }
        id v21 = [[BMAppIntentInvocationValueType alloc] initByReadFrom:v4];
        if (!v21) {
          goto LABEL_33;
        }
        uint64_t v22 = 24;
      }
      uint64_t v23 = *(Class *)((char *)&v5->super.super.isa + v22);
      *(Class *)((char *)&v5->super.super.isa + v22) = v21;

      PBReaderRecallMark();
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_33:
  }
    v26 = 0;
  else {
LABEL_34:
  }
    v26 = v5;

  return v26;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMAppIntentInvocationValue *)self valueType];
  id v5 = [(BMAppIntentInvocationValue *)self value];
  id v6 = [(BMAppIntentInvocationValue *)self displayRepresentation];
  uint64_t v7 = (void *)[v3 initWithFormat:@"BMAppIntentInvocationValue with valueType: %@, value: %@, displayRepresentation: %@", v4, v5, v6];

  return (NSString *)v7;
}

- (BMAppIntentInvocationValue)initWithValueType:(id)a3 value:(id)a4 displayRepresentation:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BMAppIntentInvocationValue;
  unint64_t v12 = [(BMEventBase *)&v14 init];
  if (v12)
  {
    v12->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v12->_valueType, a3);
    objc_storeStrong((id *)&v12->_value, a4);
    objc_storeStrong((id *)&v12->_displayRepresentation, a5);
  }

  return v12;
}

+ (id)protoFields
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"valueType" number:1 type:14 subMessageClass:objc_opt_class()];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"value", 2, 14, 0, v2);
  v7[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"displayRepresentation" number:3 type:14 subMessageClass:objc_opt_class()];
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5040;
}

+ (id)columns
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"valueType_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_728];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"value" dataType:4 requestOnly:0 fieldNumber:2 protoDataType:14 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"displayRepresentation_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_730];
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

id __37__BMAppIntentInvocationValue_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 displayRepresentation];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __37__BMAppIntentInvocationValue_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 valueType];
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

    v8 = [[BMAppIntentInvocationValue alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[4] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end