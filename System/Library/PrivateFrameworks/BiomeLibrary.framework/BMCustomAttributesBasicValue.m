@interface BMCustomAttributesBasicValue
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMCustomAttributesBasicValue)initWithBoolValue:(id)a3 int64Value:(id)a4 doubleValue:(id)a5 stringValue:(id)a6;
- (BMCustomAttributesBasicValue)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)BOOLValue;
- (BOOL)hasBoolValue;
- (BOOL)hasDoubleValue;
- (BOOL)hasInt64Value;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)stringValue;
- (double)doubleValue;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int64_t)int64Value;
- (unsigned)dataVersion;
- (void)setHasBoolValue:(BOOL)a3;
- (void)setHasDoubleValue:(BOOL)a3;
- (void)setHasInt64Value:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMCustomAttributesBasicValue

- (void).cxx_destruct
{
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setHasDoubleValue:(BOOL)a3
{
  self->_hasDoubleValue = a3;
}

- (BOOL)hasDoubleValue
{
  return self->_hasDoubleValue;
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (void)setHasInt64Value:(BOOL)a3
{
  self->_hasInt64Value = a3;
}

- (BOOL)hasInt64Value
{
  return self->_hasInt64Value;
}

- (int64_t)int64Value
{
  return self->_int64Value;
}

- (void)setHasBoolValue:(BOOL)a3
{
  self->_hasBoolValue = a3;
}

- (BOOL)hasBoolValue
{
  return self->_hasBoolValue;
}

- (BOOL)BOOLValue
{
  return self->_BOOLValue;
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
    if ((![(BMCustomAttributesBasicValue *)self hasBoolValue]
       && ![v5 hasBoolValue]
       || [(BMCustomAttributesBasicValue *)self hasBoolValue]
       && [v5 hasBoolValue]
       && (int v6 = [(BMCustomAttributesBasicValue *)self BOOLValue],
           v6 == [v5 BOOLValue]))
      && (![(BMCustomAttributesBasicValue *)self hasInt64Value]
       && ![v5 hasInt64Value]
       || [(BMCustomAttributesBasicValue *)self hasInt64Value]
       && [v5 hasInt64Value]
       && (int64_t v7 = -[BMCustomAttributesBasicValue int64Value](self, "int64Value"), v7 == [v5 int64Value]))
      && (![(BMCustomAttributesBasicValue *)self hasDoubleValue]
       && ![v5 hasDoubleValue]
       || [(BMCustomAttributesBasicValue *)self hasDoubleValue]
       && [v5 hasDoubleValue]
       && ([(BMCustomAttributesBasicValue *)self doubleValue],
           double v9 = v8,
           [v5 doubleValue],
           v9 == v10)))
    {
      v11 = [(BMCustomAttributesBasicValue *)self stringValue];
      v12 = [v5 stringValue];
      if (v11 == v12)
      {
        char v15 = 1;
      }
      else
      {
        v13 = [(BMCustomAttributesBasicValue *)self stringValue];
        v14 = [v5 stringValue];
        char v15 = [v13 isEqual:v14];
      }
    }
    else
    {
      char v15 = 0;
    }
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (id)jsonDictionary
{
  v16[4] = *MEMORY[0x1E4F143B8];
  if ([(BMCustomAttributesBasicValue *)self hasBoolValue])
  {
    v3 = objc_msgSend(NSNumber, "numberWithBool:", -[BMCustomAttributesBasicValue BOOLValue](self, "BOOLValue"));
  }
  else
  {
    v3 = 0;
  }
  if ([(BMCustomAttributesBasicValue *)self hasInt64Value])
  {
    id v4 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMCustomAttributesBasicValue int64Value](self, "int64Value"));
  }
  else
  {
    id v4 = 0;
  }
  if (![(BMCustomAttributesBasicValue *)self hasDoubleValue]
    || ([(BMCustomAttributesBasicValue *)self doubleValue], fabs(v5) == INFINITY))
  {
    int64_t v7 = 0;
  }
  else
  {
    [(BMCustomAttributesBasicValue *)self doubleValue];
    int v6 = NSNumber;
    [(BMCustomAttributesBasicValue *)self doubleValue];
    int64_t v7 = objc_msgSend(v6, "numberWithDouble:");
  }
  double v8 = [(BMCustomAttributesBasicValue *)self stringValue];
  v15[0] = @"BOOLValue";
  double v9 = v3;
  if (!v3)
  {
    double v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v16[0] = v9;
  v15[1] = @"int64Value";
  double v10 = v4;
  if (!v4)
  {
    double v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v16[1] = v10;
  v15[2] = @"doubleValue";
  v11 = v7;
  if (!v7)
  {
    v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v16[2] = v11;
  v15[3] = @"stringValue";
  v12 = v8;
  if (!v8)
  {
    v12 = [MEMORY[0x1E4F1CA98] null];
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
      if (v4) {
        goto LABEL_22;
      }
LABEL_28:

      if (v3) {
        goto LABEL_23;
      }
      goto LABEL_29;
    }
  }

  if (!v4) {
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

- (BMCustomAttributesBasicValue)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int64_t v7 = [v6 objectForKeyedSubscript:@"BOOLValue"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    double v9 = [v6 objectForKeyedSubscript:@"int64Value"];
    v32 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          char v15 = 0;
          goto LABEL_35;
        }
        id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
        v20 = a4;
        uint64_t v21 = *MEMORY[0x1E4F502C8];
        uint64_t v37 = *MEMORY[0x1E4F28568];
        id v12 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"int64Value"];
        id v38 = v12;
        double v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
        id v22 = (id)[v19 initWithDomain:v21 code:2 userInfo:v10];
        char v15 = 0;
        a4 = 0;
        id *v20 = v22;
        goto LABEL_33;
      }
      v31 = v9;
    }
    else
    {
      v31 = 0;
    }
    double v10 = [v6 objectForKeyedSubscript:@"doubleValue"];
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v12 = 0;
          char v15 = 0;
          a4 = v31;
          goto LABEL_34;
        }
        v11 = self;
        id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v23 = *MEMORY[0x1E4F502C8];
        uint64_t v35 = *MEMORY[0x1E4F28568];
        id v14 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"doubleValue"];
        id v36 = v14;
        v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
        id v24 = (id)[v29 initWithDomain:v23 code:2 userInfo:v13];
        char v15 = 0;
        id v12 = 0;
        *a4 = v24;
        goto LABEL_31;
      }
      v11 = self;
      id v12 = v10;
    }
    else
    {
      v11 = self;
      id v12 = 0;
    }
    v13 = [v6 objectForKeyedSubscript:@"stringValue"];
    if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v14 = 0;
LABEL_13:
      a4 = v31;
      char v15 = [(BMCustomAttributesBasicValue *)v11 initWithBoolValue:v8 int64Value:v31 doubleValue:v12 stringValue:v14];
      v11 = v15;
LABEL_32:

      self = v11;
LABEL_33:
      int64_t v7 = v32;
LABEL_34:

      goto LABEL_35;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = v13;
      goto LABEL_13;
    }
    if (a4)
    {
      id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v28 = *MEMORY[0x1E4F502C8];
      uint64_t v33 = *MEMORY[0x1E4F28568];
      v25 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"stringValue"];
      v34 = v25;
      v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      *a4 = (id)[v30 initWithDomain:v28 code:2 userInfo:v26];
    }
    id v14 = 0;
    char v15 = 0;
LABEL_31:
    a4 = v31;
    goto LABEL_32;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    char v15 = 0;
    id v8 = 0;
    goto LABEL_36;
  }
  id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v17 = *MEMORY[0x1E4F502C8];
  uint64_t v39 = *MEMORY[0x1E4F28568];
  v18 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"BOOLValue"];
  v40[0] = v18;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
  char v15 = 0;
  id v8 = 0;
  *a4 = (id)[v16 initWithDomain:v17 code:2 userInfo:v9];
  a4 = v18;
LABEL_35:

LABEL_36:
  return v15;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMCustomAttributesBasicValue *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasBoolValue)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_hasInt64Value)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
  if (self->_hasDoubleValue)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_stringValue)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)BMCustomAttributesBasicValue;
  id v5 = [(BMEventBase *)&v41 init];
  if (!v5) {
    goto LABEL_53;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  int64_t v7 = (int *)MEMORY[0x1E4F940E0];
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
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
          v5->_hasBoolValue = 1;
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
              goto LABEL_41;
            }
            v20 += 7;
            BOOL v17 = v21++ >= 9;
            if (v17)
            {
              uint64_t v22 = 0;
              goto LABEL_43;
            }
          }
          v4[*v8] = 1;
LABEL_41:
          if (v4[*v8]) {
            uint64_t v22 = 0;
          }
LABEL_43:
          v5->_BOOLValue = v22 != 0;
          break;
        case 2u:
          char v27 = 0;
          unsigned int v28 = 0;
          int64_t v29 = 0;
          v5->_hasInt64Value = 1;
          while (1)
          {
            uint64_t v30 = *v6;
            uint64_t v31 = *(void *)&v4[v30];
            unint64_t v32 = v31 + 1;
            if (v31 == -1 || v32 > *(void *)&v4[*v7]) {
              break;
            }
            char v33 = *(unsigned char *)(*(void *)&v4[*v9] + v31);
            *(void *)&v4[v30] = v32;
            v29 |= (unint64_t)(v33 & 0x7F) << v27;
            if ((v33 & 0x80) == 0) {
              goto LABEL_45;
            }
            v27 += 7;
            BOOL v17 = v28++ >= 9;
            if (v17)
            {
              int64_t v29 = 0;
              goto LABEL_47;
            }
          }
          v4[*v8] = 1;
LABEL_45:
          if (v4[*v8]) {
            int64_t v29 = 0;
          }
LABEL_47:
          v5->_int64Value = v29;
          break;
        case 3u:
          v5->_hasDoubleValue = 1;
          uint64_t v34 = *v6;
          unint64_t v35 = *(void *)&v4[v34];
          if (v35 <= 0xFFFFFFFFFFFFFFF7 && v35 + 8 <= *(void *)&v4[*v7])
          {
            double v36 = *(double *)(*(void *)&v4[*v9] + v35);
            *(void *)&v4[v34] = v35 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v36 = 0.0;
          }
          v5->_doubleValue = v36;
          break;
        case 4u:
          uint64_t v37 = PBReaderReadString();
          stringValue = v5->_stringValue;
          v5->_stringValue = (NSString *)v37;

          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_52;
          }
          break;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_52:
  }
    uint64_t v39 = 0;
  else {
LABEL_53:
  }
    uint64_t v39 = v5;

  return v39;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMCustomAttributesBasicValue BOOLValue](self, "BOOLValue"));
  id v5 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMCustomAttributesBasicValue int64Value](self, "int64Value"));
  id v6 = NSNumber;
  [(BMCustomAttributesBasicValue *)self doubleValue];
  int64_t v7 = objc_msgSend(v6, "numberWithDouble:");
  id v8 = [(BMCustomAttributesBasicValue *)self stringValue];
  double v9 = (void *)[v3 initWithFormat:@"BMCustomAttributesBasicValue with BOOLValue: %@, int64Value: %@, doubleValue: %@, stringValue: %@", v4, v5, v7, v8];

  return (NSString *)v9;
}

- (BMCustomAttributesBasicValue)initWithBoolValue:(id)a3 int64Value:(id)a4 doubleValue:(id)a5 stringValue:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)BMCustomAttributesBasicValue;
  uint64_t v14 = [(BMEventBase *)&v18 init];
  if (v14)
  {
    v14->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v10)
    {
      v14->_hasBoolValue = 1;
      v14->_BOOLValue = [v10 BOOLValue];
    }
    else
    {
      v14->_hasBoolValue = 0;
      v14->_BOOLValue = 0;
    }
    if (v11)
    {
      v14->_hasInt64Value = 1;
      uint64_t v15 = [v11 longLongValue];
    }
    else
    {
      v14->_hasInt64Value = 0;
      uint64_t v15 = -1;
    }
    v14->_int64Value = v15;
    if (v12)
    {
      v14->_hasDoubleValue = 1;
      [v12 doubleValue];
    }
    else
    {
      v14->_hasDoubleValue = 0;
      double v16 = -1.0;
    }
    v14->_doubleValue = v16;
    objc_storeStrong((id *)&v14->_stringValue, a6);
  }

  return v14;
}

+ (id)protoFields
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"BOOLValue" number:1 type:12 subMessageClass:0];
  v8[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"int64Value" number:2 type:3 subMessageClass:0];
  v8[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"doubleValue" number:3 type:0 subMessageClass:0];
  v8[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"stringValue" number:4 type:13 subMessageClass:0];
  v8[3] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4440;
}

+ (id)columns
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"BOOLValue" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:12 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"int64Value" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:3 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"doubleValue" dataType:1 requestOnly:0 fieldNumber:3 protoDataType:0 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"stringValue" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
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
    id v4 = 0;
  }
  else
  {
    id v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    int64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMCustomAttributesBasicValue alloc] initByReadFrom:v7];
    id v4 = v8;
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