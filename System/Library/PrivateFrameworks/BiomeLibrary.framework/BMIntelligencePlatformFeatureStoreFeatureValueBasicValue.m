@interface BMIntelligencePlatformFeatureStoreFeatureValueBasicValue
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMIntelligencePlatformFeatureStoreFeatureValueBasicValue)initWithInt_value:(id)a3 double_value:(id)a4 float_value:(id)a5 string_value:(id)a6;
- (BMIntelligencePlatformFeatureStoreFeatureValueBasicValue)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasDouble_value;
- (BOOL)hasFloat_value;
- (BOOL)hasInt_value;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)string_value;
- (double)double_value;
- (double)float_value;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int64_t)int_value;
- (unsigned)dataVersion;
- (void)setHasDouble_value:(BOOL)a3;
- (void)setHasFloat_value:(BOOL)a3;
- (void)setHasInt_value:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMIntelligencePlatformFeatureStoreFeatureValueBasicValue

- (void).cxx_destruct
{
}

- (NSString)string_value
{
  return self->_string_value;
}

- (void)setHasFloat_value:(BOOL)a3
{
  self->_hasFloat_value = a3;
}

- (BOOL)hasFloat_value
{
  return self->_hasFloat_value;
}

- (double)float_value
{
  return self->_float_value;
}

- (void)setHasDouble_value:(BOOL)a3
{
  self->_hasDouble_value = a3;
}

- (BOOL)hasDouble_value
{
  return self->_hasDouble_value;
}

- (double)double_value
{
  return self->_double_value;
}

- (void)setHasInt_value:(BOOL)a3
{
  self->_hasInt_value = a3;
}

- (BOOL)hasInt_value
{
  return self->_hasInt_value;
}

- (int64_t)int_value
{
  return self->_int_value;
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
    if ((![(BMIntelligencePlatformFeatureStoreFeatureValueBasicValue *)self hasInt_value]
       && !objc_msgSend(v5, "hasInt_value")
       || [(BMIntelligencePlatformFeatureStoreFeatureValueBasicValue *)self hasInt_value]
       && objc_msgSend(v5, "hasInt_value")
       && (int64_t v6 = [(BMIntelligencePlatformFeatureStoreFeatureValueBasicValue *)self int_value],
           v6 == objc_msgSend(v5, "int_value")))
      && (![(BMIntelligencePlatformFeatureStoreFeatureValueBasicValue *)self hasDouble_value]
       && !objc_msgSend(v5, "hasDouble_value")
       || [(BMIntelligencePlatformFeatureStoreFeatureValueBasicValue *)self hasDouble_value]
       && objc_msgSend(v5, "hasDouble_value")
       && ([(BMIntelligencePlatformFeatureStoreFeatureValueBasicValue *)self double_value],
           double v8 = v7,
           objc_msgSend(v5, "double_value"),
           v8 == v9))
      && (![(BMIntelligencePlatformFeatureStoreFeatureValueBasicValue *)self hasFloat_value]
       && !objc_msgSend(v5, "hasFloat_value")
       || [(BMIntelligencePlatformFeatureStoreFeatureValueBasicValue *)self hasFloat_value]
       && objc_msgSend(v5, "hasFloat_value")
       && ([(BMIntelligencePlatformFeatureStoreFeatureValueBasicValue *)self float_value],
           double v11 = v10,
           objc_msgSend(v5, "float_value"),
           v11 == v12)))
    {
      v13 = [(BMIntelligencePlatformFeatureStoreFeatureValueBasicValue *)self string_value];
      v14 = objc_msgSend(v5, "string_value");
      if (v13 == v14)
      {
        char v17 = 1;
      }
      else
      {
        v15 = [(BMIntelligencePlatformFeatureStoreFeatureValueBasicValue *)self string_value];
        v16 = objc_msgSend(v5, "string_value");
        char v17 = [v15 isEqual:v16];
      }
    }
    else
    {
      char v17 = 0;
    }
  }
  else
  {
    char v17 = 0;
  }

  return v17;
}

- (id)jsonDictionary
{
  v18[4] = *MEMORY[0x1E4F143B8];
  if ([(BMIntelligencePlatformFeatureStoreFeatureValueBasicValue *)self hasInt_value])
  {
    v3 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMIntelligencePlatformFeatureStoreFeatureValueBasicValue int_value](self, "int_value"));
  }
  else
  {
    v3 = 0;
  }
  if (![(BMIntelligencePlatformFeatureStoreFeatureValueBasicValue *)self hasDouble_value]
    || ([(BMIntelligencePlatformFeatureStoreFeatureValueBasicValue *)self double_value],
        fabs(v4) == INFINITY))
  {
    int64_t v6 = 0;
  }
  else
  {
    [(BMIntelligencePlatformFeatureStoreFeatureValueBasicValue *)self double_value];
    id v5 = NSNumber;
    [(BMIntelligencePlatformFeatureStoreFeatureValueBasicValue *)self double_value];
    int64_t v6 = objc_msgSend(v5, "numberWithDouble:");
  }
  if (![(BMIntelligencePlatformFeatureStoreFeatureValueBasicValue *)self hasFloat_value]
    || ([(BMIntelligencePlatformFeatureStoreFeatureValueBasicValue *)self float_value],
        fabs(v7) == INFINITY))
  {
    double v9 = 0;
  }
  else
  {
    [(BMIntelligencePlatformFeatureStoreFeatureValueBasicValue *)self float_value];
    double v8 = NSNumber;
    [(BMIntelligencePlatformFeatureStoreFeatureValueBasicValue *)self float_value];
    double v9 = objc_msgSend(v8, "numberWithDouble:");
  }
  double v10 = [(BMIntelligencePlatformFeatureStoreFeatureValueBasicValue *)self string_value];
  v17[0] = @"int_value";
  double v11 = v3;
  if (!v3)
  {
    double v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[0] = v11;
  v17[1] = @"double_value";
  double v12 = v6;
  if (!v6)
  {
    double v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[1] = v12;
  v17[2] = @"float_value";
  v13 = v9;
  if (!v9)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[2] = v13;
  v17[3] = @"string_value";
  v14 = v10;
  if (!v10)
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[3] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];
  if (v10)
  {
    if (v9) {
      goto LABEL_22;
    }
  }
  else
  {

    if (v9)
    {
LABEL_22:
      if (v6) {
        goto LABEL_23;
      }
LABEL_29:

      if (v3) {
        goto LABEL_24;
      }
      goto LABEL_30;
    }
  }

  if (!v6) {
    goto LABEL_29;
  }
LABEL_23:
  if (v3) {
    goto LABEL_24;
  }
LABEL_30:

LABEL_24:

  return v15;
}

- (BMIntelligencePlatformFeatureStoreFeatureValueBasicValue)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = [v6 objectForKeyedSubscript:@"int_value"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    double v9 = [v6 objectForKeyedSubscript:@"double_value"];
    v32 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v15 = 0;
          goto LABEL_35;
        }
        id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
        v20 = a4;
        uint64_t v21 = *MEMORY[0x1E4F502C8];
        uint64_t v37 = *MEMORY[0x1E4F28568];
        id v12 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"double_value"];
        id v38 = v12;
        double v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
        id v22 = (id)[v19 initWithDomain:v21 code:2 userInfo:v10];
        v15 = 0;
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
    double v10 = [v6 objectForKeyedSubscript:@"float_value"];
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v12 = 0;
          v15 = 0;
          a4 = v31;
          goto LABEL_34;
        }
        double v11 = self;
        id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v23 = *MEMORY[0x1E4F502C8];
        uint64_t v35 = *MEMORY[0x1E4F28568];
        id v14 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"float_value"];
        id v36 = v14;
        v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
        id v24 = (id)[v29 initWithDomain:v23 code:2 userInfo:v13];
        v15 = 0;
        id v12 = 0;
        *a4 = v24;
        goto LABEL_31;
      }
      double v11 = self;
      id v12 = v10;
    }
    else
    {
      double v11 = self;
      id v12 = 0;
    }
    v13 = [v6 objectForKeyedSubscript:@"string_value"];
    if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v14 = 0;
LABEL_13:
      a4 = v31;
      v15 = [(BMIntelligencePlatformFeatureStoreFeatureValueBasicValue *)v11 initWithInt_value:v8 double_value:v31 float_value:v12 string_value:v14];
      double v11 = v15;
LABEL_32:

      self = v11;
LABEL_33:
      double v7 = v32;
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
      v25 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"string_value"];
      v34 = v25;
      v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
      *a4 = (id)[v30 initWithDomain:v28 code:2 userInfo:v26];
    }
    id v14 = 0;
    v15 = 0;
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
    v15 = 0;
    id v8 = 0;
    goto LABEL_36;
  }
  id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v17 = *MEMORY[0x1E4F502C8];
  uint64_t v39 = *MEMORY[0x1E4F28568];
  v18 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"int_value"];
  v40[0] = v18;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
  v15 = 0;
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
  [(BMIntelligencePlatformFeatureStoreFeatureValueBasicValue *)self writeTo:v3];
  double v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasInt_value)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
  if (self->_hasDouble_value)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_hasFloat_value)
  {
    PBDataWriterWriteFloatField();
    id v4 = v5;
  }
  if (self->_string_value)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)BMIntelligencePlatformFeatureStoreFeatureValueBasicValue;
  id v5 = [(BMEventBase *)&v38 init];
  if (!v5) {
    goto LABEL_48;
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
          int64_t v22 = 0;
          v5->_hasInt_value = 1;
          break;
        case 2u:
          v5->_hasDouble_value = 1;
          uint64_t v27 = *v6;
          unint64_t v28 = *(void *)&v4[v27];
          if (v28 <= 0xFFFFFFFFFFFFFFF7 && v28 + 8 <= *(void *)&v4[*v7])
          {
            double v29 = *(double *)(*(void *)&v4[*v9] + v28);
            *(void *)&v4[v27] = v28 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v29 = 0.0;
          }
          uint64_t v35 = 32;
          goto LABEL_44;
        case 3u:
          v5->_hasFloat_value = 1;
          uint64_t v30 = *v6;
          unint64_t v31 = *(void *)&v4[v30];
          if (v31 <= 0xFFFFFFFFFFFFFFFBLL && v31 + 4 <= *(void *)&v4[*v7])
          {
            float v32 = *(float *)(*(void *)&v4[*v9] + v31);
            *(void *)&v4[v30] = v31 + 4;
          }
          else
          {
            v4[*v8] = 1;
            float v32 = 0.0;
          }
          double v29 = v32;
          uint64_t v35 = 40;
LABEL_44:
          *(double *)((char *)&v5->super.super.isa + v35) = v29;
          continue;
        case 4u:
          uint64_t v33 = PBReaderReadString();
          string_value = v5->_string_value;
          v5->_string_value = (NSString *)v33;

          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_47;
          }
          continue;
      }
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
          goto LABEL_37;
        }
        v20 += 7;
        BOOL v17 = v21++ >= 9;
        if (v17)
        {
          int64_t v22 = 0;
          goto LABEL_39;
        }
      }
      v4[*v8] = 1;
LABEL_37:
      if (v4[*v8]) {
        int64_t v22 = 0;
      }
LABEL_39:
      v5->_int_value = v22;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_47:
  }
    id v36 = 0;
  else {
LABEL_48:
  }
    id v36 = v5;

  return v36;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BMIntelligencePlatformFeatureStoreFeatureValueBasicValue int_value](self, "int_value"));
  id v5 = NSNumber;
  [(BMIntelligencePlatformFeatureStoreFeatureValueBasicValue *)self double_value];
  id v6 = objc_msgSend(v5, "numberWithDouble:");
  double v7 = NSNumber;
  [(BMIntelligencePlatformFeatureStoreFeatureValueBasicValue *)self float_value];
  id v8 = objc_msgSend(v7, "numberWithDouble:");
  double v9 = [(BMIntelligencePlatformFeatureStoreFeatureValueBasicValue *)self string_value];
  char v10 = (void *)[v3 initWithFormat:@"BMIntelligencePlatformFeatureStoreFeatureValueBasicValue with int_value: %@, double_value: %@, float_value: %@, string_value: %@", v4, v6, v8, v9];

  return (NSString *)v10;
}

- (BMIntelligencePlatformFeatureStoreFeatureValueBasicValue)initWithInt_value:(id)a3 double_value:(id)a4 float_value:(id)a5 string_value:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)BMIntelligencePlatformFeatureStoreFeatureValueBasicValue;
  uint64_t v14 = [(BMEventBase *)&v20 init];
  if (v14)
  {
    v14->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v10)
    {
      v14->_hasInt_value = 1;
      uint64_t v15 = [v10 longLongValue];
    }
    else
    {
      v14->_hasInt_value = 0;
      uint64_t v15 = -1;
    }
    v14->_int_value = v15;
    if (v11)
    {
      v14->_hasDouble_value = 1;
      [v11 doubleValue];
    }
    else
    {
      v14->_hasDouble_value = 0;
      double v16 = -1.0;
    }
    v14->_double_value = v16;
    if (v12)
    {
      v14->_hasFloat_value = 1;
      [v12 floatValue];
      double v18 = v17;
    }
    else
    {
      v14->_hasFloat_value = 0;
      double v18 = -1.0;
    }
    v14->_float_value = v18;
    objc_storeStrong((id *)&v14->_string_value, a6);
  }

  return v14;
}

+ (id)protoFields
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"int_value" number:1 type:3 subMessageClass:0];
  v8[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"double_value" number:2 type:0 subMessageClass:0];
  v8[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"float_value" number:3 type:1 subMessageClass:0];
  v8[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"string_value" number:4 type:13 subMessageClass:0];
  v8[3] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3948;
}

+ (id)columns
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"int_value" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:3 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"double_value" dataType:1 requestOnly:0 fieldNumber:2 protoDataType:0 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"float_value" dataType:1 requestOnly:0 fieldNumber:3 protoDataType:1 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"string_value" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
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
    double v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMIntelligencePlatformFeatureStoreFeatureValueBasicValue alloc] initByReadFrom:v7];
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