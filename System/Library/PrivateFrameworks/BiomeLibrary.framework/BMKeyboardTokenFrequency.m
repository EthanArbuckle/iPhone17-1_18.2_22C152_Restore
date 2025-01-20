@interface BMKeyboardTokenFrequency
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMKeyboardTokenFrequency)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMKeyboardTokenFrequency)initWithTokenFrequencies:(id)a3 locale:(id)a4 tokenType:(int)a5;
- (BOOL)isEqual:(id)a3;
- (NSArray)tokenFrequencies;
- (NSString)description;
- (NSString)locale;
- (id)_tokenFrequenciesJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)tokenType;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMKeyboardTokenFrequency

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);

  objc_storeStrong((id *)&self->_tokenFrequencies, 0);
}

- (int)tokenType
{
  return self->_tokenType;
}

- (NSString)locale
{
  return self->_locale;
}

- (NSArray)tokenFrequencies
{
  return self->_tokenFrequencies;
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
    v6 = [(BMKeyboardTokenFrequency *)self tokenFrequencies];
    uint64_t v7 = [v5 tokenFrequencies];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMKeyboardTokenFrequency *)self tokenFrequencies];
      v10 = [v5 tokenFrequencies];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_9;
      }
    }
    v13 = [(BMKeyboardTokenFrequency *)self locale];
    uint64_t v14 = [v5 locale];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMKeyboardTokenFrequency *)self locale];
      v17 = [v5 locale];
      int v18 = [v16 isEqual:v17];

      if (!v18)
      {
LABEL_9:
        BOOL v12 = 0;
LABEL_12:

        goto LABEL_13;
      }
    }
    int v19 = [(BMKeyboardTokenFrequency *)self tokenType];
    BOOL v12 = v19 == [v5 tokenType];
    goto LABEL_12;
  }
  BOOL v12 = 0;
LABEL_13:

  return v12;
}

- (id)jsonDictionary
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v3 = [(BMKeyboardTokenFrequency *)self _tokenFrequenciesJSONArray];
  id v4 = [(BMKeyboardTokenFrequency *)self locale];
  id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMKeyboardTokenFrequency tokenType](self, "tokenType"));
  v11[0] = @"tokenFrequencies";
  v6 = v3;
  if (!v3)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[0] = v6;
  v11[1] = @"locale";
  uint64_t v7 = v4;
  if (!v4)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v7;
  v11[2] = @"tokenType";
  v8 = v5;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  if (v5)
  {
    if (v4) {
      goto LABEL_9;
    }
LABEL_14:

    if (v3) {
      goto LABEL_10;
    }
    goto LABEL_15;
  }

  if (!v4) {
    goto LABEL_14;
  }
LABEL_9:
  if (v3) {
    goto LABEL_10;
  }
LABEL_15:

LABEL_10:

  return v9;
}

- (id)_tokenFrequenciesJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMKeyboardTokenFrequency *)self tokenFrequencies];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) jsonDictionary];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BMKeyboardTokenFrequency)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v65[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 objectForKeyedSubscript:@"tokenFrequencies"];
  v8 = [MEMORY[0x1E4F1CA98] null];
  int v9 = [v7 isEqual:v8];

  if (v9)
  {
    v44 = a4;
    v45 = self;
    v47 = v6;

    id v7 = 0;
  }
  else
  {
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v31 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v32 = *MEMORY[0x1E4F502C8];
          uint64_t v64 = *MEMORY[0x1E4F28568];
          v49 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"tokenFrequencies"];
          v65[0] = v49;
          [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v65 forKeys:&v64 count:1];
          v33 = a4;
          id v19 = (id)objc_claimAutoreleasedReturnValue();
          v22 = 0;
          id *v33 = (id)[v31 initWithDomain:v32 code:2 userInfo:v19];
          goto LABEL_35;
        }
        v22 = 0;
        goto LABEL_36;
      }
    }
    v44 = a4;
    v45 = self;
    v47 = v6;
  }
  v49 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v7 = v7;
  uint64_t v10 = [v7 countByEnumeratingWithState:&v51 objects:v63 count:16];
  if (!v10) {
    goto LABEL_16;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v52;
  while (2)
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v52 != v12) {
        objc_enumerationMutation(v7);
      }
      long long v14 = *(void **)(*((void *)&v51 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v23 = v44;
        if (v44)
        {
          id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v25 = *MEMORY[0x1E4F502C8];
          uint64_t v61 = *MEMORY[0x1E4F28568];
          id v15 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"tokenFrequencies"];
          id v62 = v15;
          v26 = (void *)MEMORY[0x1E4F1C9E8];
          v27 = &v62;
          v28 = &v61;
LABEL_28:
          id v21 = [v26 dictionaryWithObjects:v27 forKeys:v28 count:1];
          id v29 = (id)[v24 initWithDomain:v25 code:2 userInfo:v21];
          v22 = 0;
          id *v23 = v29;
LABEL_32:
          id v19 = v7;
          self = v45;
          id v6 = v47;
          goto LABEL_33;
        }
LABEL_39:
        v22 = 0;
        id v19 = v7;
        self = v45;
        id v6 = v47;
        goto LABEL_35;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v23 = v44;
        if (v44)
        {
          id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v25 = *MEMORY[0x1E4F502C8];
          uint64_t v59 = *MEMORY[0x1E4F28568];
          id v15 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"tokenFrequencies"];
          id v60 = v15;
          v26 = (void *)MEMORY[0x1E4F1C9E8];
          v27 = &v60;
          v28 = &v59;
          goto LABEL_28;
        }
        goto LABEL_39;
      }
      id v15 = v14;
      uint64_t v16 = [BMKeyboardTokenFrequencyTokenFrequency alloc];
      id v50 = 0;
      v17 = [(BMKeyboardTokenFrequencyTokenFrequency *)v16 initWithJSONDictionary:v15 error:&v50];
      id v18 = v50;
      if (v18)
      {
        id v21 = v18;
        if (v44) {
          id *v44 = v18;
        }

        v22 = 0;
        goto LABEL_32;
      }
      [v49 addObject:v17];
    }
    uint64_t v11 = [v7 countByEnumeratingWithState:&v51 objects:v63 count:16];
    if (v11) {
      continue;
    }
    break;
  }
LABEL_16:

  id v6 = v47;
  id v15 = [v47 objectForKeyedSubscript:@"locale"];
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v34 = v47;
      objc_opt_class();
      self = v45;
      if (objc_opt_isKindOfClass())
      {
        id v19 = v15;
        goto LABEL_19;
      }
      if (!v44)
      {
        id v19 = 0;
        v22 = 0;
        goto LABEL_34;
      }
      id v43 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v35 = *MEMORY[0x1E4F502C8];
      uint64_t v57 = *MEMORY[0x1E4F28568];
      id v21 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"locale"];
      id v58 = v21;
      v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
      id v36 = (id)[v43 initWithDomain:v35 code:2 userInfo:v20];
      id v19 = 0;
      v22 = 0;
      id *v44 = v36;
LABEL_52:
      id v6 = v34;
      goto LABEL_23;
    }
  }
  id v19 = 0;
  self = v45;
LABEL_19:
  v20 = [v47 objectForKeyedSubscript:@"tokenType"];
  if (!v20 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v21 = 0;
    goto LABEL_22;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v21 = v20;
    goto LABEL_22;
  }
  v34 = v47;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v44)
    {
      id v48 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v46 = *MEMORY[0x1E4F502C8];
      uint64_t v55 = *MEMORY[0x1E4F28568];
      v41 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"tokenType"];
      v56 = v41;
      v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
      id *v44 = (id)[v48 initWithDomain:v46 code:2 userInfo:v42];
    }
    id v21 = 0;
    v22 = 0;
    goto LABEL_52;
  }
  v37 = self;
  v38 = NSNumber;
  v39 = BMKeyboardTokenFrequencyTokenTypeFromString(v20);
  v40 = v38;
  self = v37;
  id v21 = [v40 numberWithInt:v39];
  id v6 = v47;
LABEL_22:
  self = -[BMKeyboardTokenFrequency initWithTokenFrequencies:locale:tokenType:](self, "initWithTokenFrequencies:locale:tokenType:", v49, v19, [v21 intValue]);
  v22 = self;
LABEL_23:

LABEL_33:
LABEL_34:

LABEL_35:
LABEL_36:

  return v22;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMKeyboardTokenFrequency *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = self->_tokenFrequencies;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        PBDataWriterPlaceMark();
        [v10 writeTo:v4];
        PBDataWriterRecallMark();
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  if (self->_locale) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)BMKeyboardTokenFrequency;
  uint64_t v5 = [(BMEventBase *)&v36 init];
  if (!v5) {
    goto LABEL_44;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  int v9 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    uint64_t v10 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v9]) {
        break;
      }
      char v11 = 0;
      unsigned int v12 = 0;
      unint64_t v13 = 0;
      while (1)
      {
        uint64_t v14 = *v7;
        unint64_t v15 = *(void *)&v4[v14];
        if (v15 == -1 || v15 >= *(void *)&v4[*v8]) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)&v4[*v10] + v15);
        *(void *)&v4[v14] = v15 + 1;
        v13 |= (unint64_t)(v16 & 0x7F) << v11;
        if ((v16 & 0x80) == 0) {
          goto LABEL_13;
        }
        v11 += 7;
        BOOL v17 = v12++ >= 9;
        if (v17)
        {
          unint64_t v13 = 0;
          int v18 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      int v18 = v4[*v9];
      if (v4[*v9]) {
        unint64_t v13 = 0;
      }
LABEL_15:
      if (v18 || (v13 & 7) == 4) {
        break;
      }
      unint64_t v20 = v13 >> 3;
      if ((v13 >> 3) == 1)
      {
        uint64_t v37 = 0;
        uint64_t v38 = 0;
        if ((PBReaderPlaceMark() & 1) == 0
          || (id v27 = [[BMKeyboardTokenFrequencyTokenFrequency alloc] initByReadFrom:v4]) == 0)
        {
LABEL_46:

          goto LABEL_43;
        }
        v28 = v27;
        [v6 addObject:v27];
        PBReaderRecallMark();
      }
      else if (v20 == 2)
      {
        uint64_t v29 = PBReaderReadString();
        locale = v5->_locale;
        v5->_locale = (NSString *)v29;
      }
      else if (v20 == 3)
      {
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        while (1)
        {
          uint64_t v24 = *v7;
          unint64_t v25 = *(void *)&v4[v24];
          if (v25 == -1 || v25 >= *(void *)&v4[*v8]) {
            break;
          }
          char v26 = *(unsigned char *)(*(void *)&v4[*v10] + v25);
          *(void *)&v4[v24] = v25 + 1;
          v23 |= (unint64_t)(v26 & 0x7F) << v21;
          if ((v26 & 0x80) == 0) {
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
        v4[*v9] = 1;
LABEL_36:
        if (v4[*v9]) {
          LODWORD(v23) = 0;
        }
LABEL_38:
        if (v23 >= 5) {
          LODWORD(v23) = 0;
        }
        v5->_tokenType = v23;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_46;
      }
    }
    while (*(void *)&v4[*v7] < *(void *)&v4[*v8]);
  }
  uint64_t v31 = [v6 copy];
  tokenFrequencies = v5->_tokenFrequencies;
  v5->_tokenFrequencies = (NSArray *)v31;

  int v33 = v4[*v9];
  if (v33) {
LABEL_43:
  }
    v34 = 0;
  else {
LABEL_44:
  }
    v34 = v5;

  return v34;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMKeyboardTokenFrequency *)self tokenFrequencies];
  uint64_t v5 = [(BMKeyboardTokenFrequency *)self locale];
  uint64_t v6 = BMKeyboardTokenFrequencyTokenTypeAsString([(BMKeyboardTokenFrequency *)self tokenType]);
  uint64_t v7 = (void *)[v3 initWithFormat:@"BMKeyboardTokenFrequency with tokenFrequencies: %@, locale: %@, tokenType: %@", v4, v5, v6];

  return (NSString *)v7;
}

- (BMKeyboardTokenFrequency)initWithTokenFrequencies:(id)a3 locale:(id)a4 tokenType:(int)a5
{
  id v9 = a3;
  id v10 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BMKeyboardTokenFrequency;
  char v11 = [(BMEventBase *)&v13 init];
  if (v11)
  {
    v11->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v11->_tokenFrequencies, a3);
    objc_storeStrong((id *)&v11->_locale, a4);
    v11->_tokenType = a5;
  }

  return v11;
}

+ (id)protoFields
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"tokenFrequencies" number:1 type:14 subMessageClass:objc_opt_class()];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"locale", 2, 13, 0, v2);
  v7[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"tokenType" number:3 type:4 subMessageClass:0];
  v7[2] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF6678;
}

+ (id)columns
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"tokenFrequencies_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_168];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"locale" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"tokenType" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:4 convertedType:0];
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

id __35__BMKeyboardTokenFrequency_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _tokenFrequenciesJSONArray];
  id v4 = BMConvertObjectToJSONString();

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
    uint64_t v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    uint64_t v8 = [[BMKeyboardTokenFrequency alloc] initByReadFrom:v7];
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