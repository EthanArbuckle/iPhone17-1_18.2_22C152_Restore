@interface CCPeopleSuggesterContactPriorContent
+ (Class)contentMessageClass;
+ (Class)metaContentMessageClass;
+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3;
+ (unsigned)itemType;
- (BOOL)hasMinVersion;
- (BOOL)hasReferenceDate;
- (BOOL)hasVersion;
- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4;
- (CCPeopleSuggesterContactPriorContent)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (CCPeopleSuggesterContactPriorContent)initWithVersion:(id)a3 minVersion:(id)a4 sourceSharedIdentifier:(id)a5 priorScore:(id)a6 modelName:(id)a7 modelVersion:(id)a8 referenceDate:(id)a9 error:(id *)a10;
- (CCRepeatedFloat)priorScore;
- (CCRepeatedInt64)sourceSharedIdentifier;
- (NSString)modelName;
- (NSString)modelVersion;
- (double)referenceDate;
- (id)jsonDictionary;
- (unsigned)minVersion;
- (unsigned)version;
- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4;
- (void)setHasMinVersion:(BOOL)a3;
- (void)setHasReferenceDate:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
@end

@implementation CCPeopleSuggesterContactPriorContent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_priorScore, 0);
  objc_storeStrong((id *)&self->_sourceSharedIdentifier, 0);
}

- (void)setHasReferenceDate:(BOOL)a3
{
  self->_hasReferenceDate = a3;
}

- (BOOL)hasReferenceDate
{
  return self->_hasReferenceDate;
}

- (void)setHasMinVersion:(BOOL)a3
{
  self->_hasMinVersion = a3;
}

- (BOOL)hasMinVersion
{
  return self->_hasMinVersion;
}

- (void)setHasVersion:(BOOL)a3
{
  self->_hasVersion = a3;
}

- (BOOL)hasVersion
{
  return self->_hasVersion;
}

- (double)referenceDate
{
  return self->_referenceDate;
}

- (CCRepeatedFloat)priorScore
{
  return self->_priorScore;
}

- (CCRepeatedInt64)sourceSharedIdentifier
{
  return self->_sourceSharedIdentifier;
}

- (unsigned)minVersion
{
  return self->_minVersion;
}

- (unsigned)version
{
  return self->_version;
}

- (CCPeopleSuggesterContactPriorContent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v6 = a3;
  objc_opt_class();
  uint64_t v60 = 0;
  char IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  id v8 = 0;
  if (IsInstanceOfExpectedClass)
  {
    v9 = [v6 objectForKeyedSubscript:@"version"];
    v10 = [v6 objectForKeyedSubscript:@"minVersion"];
    uint64_t v11 = [v6 objectForKeyedSubscript:@"sourceSharedIdentifier"];
    if (v11)
    {
      v12 = (void *)v11;
      objc_opt_class();
      id v59 = v8;
      char v13 = CCValidateIsInstanceOfExpectedClass();
      id v14 = v8;

      if ((v13 & 1) == 0)
      {
        CCSetError();
        v24 = 0;
        v15 = v12;
LABEL_33:

        id v8 = v14;
        goto LABEL_34;
      }
      v40 = v10;
      v41 = v9;
      v44 = self;
      v15 = objc_opt_new();
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      id v16 = v12;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v55 objects:v62 count:16];
      v47 = a4;
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v56;
        while (2)
        {
          uint64_t v20 = 0;
          v21 = v14;
          do
          {
            if (*(void *)v56 != v19) {
              objc_enumerationMutation(v16);
            }
            v22 = *(void **)(*((void *)&v55 + 1) + 8 * v20);
            objc_opt_class();
            v54 = v21;
            int v23 = CCValidateIsInstanceOfExpectedClass();
            id v14 = v21;

            if (!v23)
            {
              CCSetError();

              v24 = 0;
              v15 = v16;
              self = v44;
              v10 = v40;
              v9 = v41;
              goto LABEL_33;
            }
            objc_msgSend(v15, "appendInt64Value:", objc_msgSend(v22, "longLongValue"));
            ++v20;
            v21 = v14;
          }
          while (v18 != v20);
          uint64_t v18 = [v16 countByEnumeratingWithState:&v55 objects:v62 count:16];
          if (v18) {
            continue;
          }
          break;
        }
      }

      id v8 = v14;
      self = v44;
      v10 = v40;
      v9 = v41;
      a4 = v47;
    }
    else
    {
      v15 = 0;
    }
    uint64_t v25 = [v6 objectForKeyedSubscript:@"priorScore"];
    if (v25)
    {
      id v26 = (id)v25;
      objc_opt_class();
      id v53 = v8;
      char v27 = CCValidateIsInstanceOfExpectedClass();
      id v14 = v8;

      if ((v27 & 1) == 0)
      {
        CCSetError();
        v24 = 0;
        goto LABEL_32;
      }
      v39 = v15;
      v45 = self;
      v48 = a4;
      v42 = v9;
      id v43 = v6;
      v28 = objc_opt_new();
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v26 = v26;
      uint64_t v29 = [v26 countByEnumeratingWithState:&v49 objects:v61 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v50;
        while (2)
        {
          uint64_t v32 = 0;
          v33 = v14;
          do
          {
            if (*(void *)v50 != v31) {
              objc_enumerationMutation(v26);
            }
            v34 = *(void **)(*((void *)&v49 + 1) + 8 * v32);
            objc_opt_class();
            int v35 = CCValidateIsInstanceOfExpectedClass();
            id v14 = v33;

            if (!v35)
            {
              CCSetError();

              v24 = 0;
              id v6 = v43;
              self = v45;
              v9 = v42;
              v15 = v39;
              goto LABEL_32;
            }
            [v34 floatValue];
            objc_msgSend(v28, "appendFloatValue:");
            ++v32;
            v33 = v14;
          }
          while (v30 != v32);
          uint64_t v30 = [v26 countByEnumeratingWithState:&v49 objects:v61 count:16];
          if (v30) {
            continue;
          }
          break;
        }
      }

      id v6 = v43;
      self = v45;
      v9 = v42;
    }
    else
    {
      v39 = v15;
      v48 = a4;
      v28 = 0;
      id v14 = v8;
    }
    v46 = [v6 objectForKeyedSubscript:@"modelName"];
    v36 = [v6 objectForKeyedSubscript:@"modelVersion"];
    v37 = [v6 objectForKeyedSubscript:@"referenceDate"];
    v24 = [[CCPeopleSuggesterContactPriorContent alloc] initWithVersion:v9 minVersion:v10 sourceSharedIdentifier:v39 priorScore:v28 modelName:v46 modelVersion:v36 referenceDate:v37 error:v48];

    id v26 = v28;
    v15 = v39;
LABEL_32:

    goto LABEL_33;
  }
  CCSetError();
  v24 = 0;
LABEL_34:

  return v24;
}

- (id)jsonDictionary
{
  v3 = objc_opt_new();
  if (self->_hasVersion)
  {
    v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CCPeopleSuggesterContactPriorContent version](self, "version"));
    [v3 setObject:v4 forKeyedSubscript:@"version"];
  }
  if (self->_hasMinVersion)
  {
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CCPeopleSuggesterContactPriorContent minVersion](self, "minVersion"));
    [v3 setObject:v5 forKeyedSubscript:@"minVersion"];
  }
  if (self->_sourceSharedIdentifier)
  {
    id v6 = objc_opt_new();
    v7 = [(CCPeopleSuggesterContactPriorContent *)self sourceSharedIdentifier];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __54__CCPeopleSuggesterContactPriorContent_jsonDictionary__block_invoke;
    v23[3] = &unk_26539CD60;
    id v24 = v6;
    id v8 = v6;
    [v7 enumerateInt64ValuesWithBlock:v23];

    [v3 setObject:v8 forKeyedSubscript:@"sourceSharedIdentifier"];
  }
  if (self->_priorScore)
  {
    v9 = objc_opt_new();
    v10 = [(CCPeopleSuggesterContactPriorContent *)self priorScore];
    uint64_t v18 = MEMORY[0x263EF8330];
    uint64_t v19 = 3221225472;
    uint64_t v20 = __54__CCPeopleSuggesterContactPriorContent_jsonDictionary__block_invoke_2;
    v21 = &unk_26539CD88;
    id v22 = v9;
    id v11 = v9;
    [v10 enumerateFloatValuesWithBlock:&v18];

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, @"priorScore", v18, v19, v20, v21);
  }
  if (self->_modelName)
  {
    v12 = [(CCPeopleSuggesterContactPriorContent *)self modelName];
    [v3 setObject:v12 forKeyedSubscript:@"modelName"];
  }
  if (self->_modelVersion)
  {
    char v13 = [(CCPeopleSuggesterContactPriorContent *)self modelVersion];
    [v3 setObject:v13 forKeyedSubscript:@"modelVersion"];
  }
  if (self->_hasReferenceDate)
  {
    id v14 = NSNumber;
    [(CCPeopleSuggesterContactPriorContent *)self referenceDate];
    v15 = objc_msgSend(v14, "numberWithDouble:");
    [v3 setObject:v15 forKeyedSubscript:@"referenceDate"];
  }
  id v16 = (void *)[v3 copy];

  return v16;
}

void __54__CCPeopleSuggesterContactPriorContent_jsonDictionary__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithLongLong:a2];
  [v2 addObject:v3];
}

void __54__CCPeopleSuggesterContactPriorContent_jsonDictionary__block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(NSNumber, "numberWithFloat:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 addObject:v2];
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  v12 = (void (**)(id, void *))a3;
  if (self->_hasVersion)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:40569 uint32Value:self->_version];
    v12[2](v12, v5);
  }
  if (self->_hasMinVersion)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:40570 uint32Value:self->_minVersion];
    v12[2](v12, v6);
  }
  if (self->_sourceSharedIdentifier)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:40571 repeatedInt64Value:self->_sourceSharedIdentifier];
    v12[2](v12, v7);
  }
  if (self->_priorScore)
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:40572 repeatedFloatValue:self->_priorScore];
    v12[2](v12, v8);
  }
  if (self->_modelName)
  {
    v9 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:40573 stringValue:self->_modelName];
    v12[2](v12, v9);
  }
  if (self->_modelVersion)
  {
    v10 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:40574 stringValue:self->_modelVersion];
    v12[2](v12, v10);
  }
  if (self->_hasReferenceDate)
  {
    id v11 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:40575 doubleValue:self->_referenceDate];
    v12[2](v12, v11);
  }
}

- (NSString)modelVersion
{
  id v2 = (void *)[(NSString *)self->_modelVersion copy];
  return (NSString *)v2;
}

- (NSString)modelName
{
  id v2 = (void *)[(NSString *)self->_modelName copy];
  return (NSString *)v2;
}

- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4
{
  id v57 = a3;
  v5 = (char *)[objc_alloc(MEMORY[0x263F31738]) initWithData:v57];
  id v6 = (int *)MEMORY[0x263F317C8];
  v7 = (int *)MEMORY[0x263F317C0];
  if (*(void *)&v5[*MEMORY[0x263F317C8]] >= *(void *)&v5[*MEMORY[0x263F317C0]])
  {
    v9 = 0;
    id v8 = 0;
LABEL_63:
    v10 = 0;
  }
  else
  {
    id v8 = 0;
    v9 = 0;
    v10 = 0;
    id v11 = (int *)MEMORY[0x263F317B8];
    v12 = (int *)MEMORY[0x263F317B0];
    do
    {
      if (*(void *)&v5[*v11]) {
        BOOL v13 = 0;
      }
      else {
        BOOL v13 = v10 == 0;
      }
      if (!v13) {
        break;
      }
      char v14 = 0;
      unsigned int v15 = 0;
      unint64_t v16 = 0;
      while (1)
      {
        uint64_t v17 = *v6;
        uint64_t v18 = *(void *)&v5[v17];
        unint64_t v19 = v18 + 1;
        if (v18 == -1 || v19 > *(void *)&v5[*v7]) {
          break;
        }
        char v20 = *(unsigned char *)(*(void *)&v5[*v12] + v18);
        *(void *)&v5[v17] = v19;
        v16 |= (unint64_t)(v20 & 0x7F) << v14;
        if ((v20 & 0x80) == 0) {
          goto LABEL_17;
        }
        v14 += 7;
        BOOL v21 = v15++ >= 9;
        if (v21)
        {
          unint64_t v16 = 0;
          uint64_t v22 = *v11;
          if (*(void *)&v5[v22]) {
            goto LABEL_63;
          }
          goto LABEL_18;
        }
      }
      *(void *)&v5[*v11] = 1;
LABEL_17:
      uint64_t v22 = *v11;
      if (*(void *)&v5[v22]) {
        goto LABEL_63;
      }
LABEL_18:
      switch((v16 >> 3))
      {
        case 1u:
          char v23 = 0;
          unsigned int v24 = 0;
          uint64_t v25 = 0;
          while (1)
          {
            uint64_t v26 = *v6;
            uint64_t v27 = *(void *)&v5[v26];
            unint64_t v28 = v27 + 1;
            if (v27 == -1 || v28 > *(void *)&v5[*v7]) {
              break;
            }
            char v29 = *(unsigned char *)(*(void *)&v5[*v12] + v27);
            *(void *)&v5[v26] = v28;
            v25 |= (unint64_t)(v29 & 0x7F) << v23;
            if ((v29 & 0x80) == 0) {
              goto LABEL_49;
            }
            v23 += 7;
            BOOL v21 = v24++ >= 9;
            if (v21)
            {
              LODWORD(v25) = 0;
              goto LABEL_51;
            }
          }
          *(void *)&v5[*v11] = 1;
LABEL_49:
          if (*(void *)&v5[*v11]) {
            LODWORD(v25) = 0;
          }
LABEL_51:
          v10 = 0;
          self->_version = v25;
          uint64_t v43 = 16;
          goto LABEL_59;
        case 2u:
          char v30 = 0;
          unsigned int v31 = 0;
          uint64_t v32 = 0;
          break;
        case 3u:
          if (!v9) {
            v9 = objc_opt_new();
          }
          CCPBReaderAppendRepeatedInt64FieldValues();
          goto LABEL_44;
        case 4u:
          if (!v8) {
            id v8 = objc_opt_new();
          }
          CCPBReaderAppendRepeatedFloatFieldValues();
          goto LABEL_44;
        case 5u:
          CCPBReaderReadStringNoCopy();
          v37 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v38 = 48;
          goto LABEL_43;
        case 6u:
          CCPBReaderReadStringNoCopy();
          v37 = (objc_class *)objc_claimAutoreleasedReturnValue();
          uint64_t v38 = 56;
LABEL_43:
          v39 = *(Class *)((char *)&self->super.super.isa + v38);
          *(Class *)((char *)&self->super.super.isa + v38) = v37;

LABEL_44:
          v10 = 0;
          continue;
        case 7u:
          uint64_t v40 = *v6;
          unint64_t v41 = *(void *)&v5[v40];
          if (v41 <= 0xFFFFFFFFFFFFFFF7 && v41 + 8 <= *(void *)&v5[*v7])
          {
            double v42 = *(double *)(*(void *)&v5[*v12] + v41);
            *(void *)&v5[v40] = v41 + 8;
          }
          else
          {
            *(void *)&v5[v22] = 1;
            double v42 = 0.0;
          }
          v10 = 0;
          self->_referenceDate = v42;
          uint64_t v43 = 18;
          goto LABEL_59;
        default:
          if (CCPBReaderSkipValueWithTag())
          {
            v10 = 0;
          }
          else
          {
            v44 = (objc_class *)objc_opt_class();
            NSStringFromClass(v44);
            v45 = long long v56 = v9;
            v10 = CCSkipFieldErrorForMessage();

            v9 = v56;
          }
          continue;
      }
      while (1)
      {
        uint64_t v33 = *v6;
        uint64_t v34 = *(void *)&v5[v33];
        unint64_t v35 = v34 + 1;
        if (v34 == -1 || v35 > *(void *)&v5[*v7]) {
          break;
        }
        char v36 = *(unsigned char *)(*(void *)&v5[*v12] + v34);
        *(void *)&v5[v33] = v35;
        v32 |= (unint64_t)(v36 & 0x7F) << v30;
        if ((v36 & 0x80) == 0) {
          goto LABEL_54;
        }
        v30 += 7;
        BOOL v21 = v31++ >= 9;
        if (v21)
        {
          LODWORD(v32) = 0;
          goto LABEL_56;
        }
      }
      *(void *)&v5[*v11] = 1;
LABEL_54:
      if (*(void *)&v5[*v11]) {
        LODWORD(v32) = 0;
      }
LABEL_56:
      v10 = 0;
      self->_minVersion = v32;
      uint64_t v43 = 17;
LABEL_59:
      *((unsigned char *)&self->super.super.isa + v43) = 1;
    }
    while (*(void *)&v5[*v6] < *(void *)&v5[*v7]);
  }
  v46 = (CCRepeatedInt64 *)[v9 copy];
  sourceSharedIdentifier = self->_sourceSharedIdentifier;
  self->_sourceSharedIdentifier = v46;

  v48 = (CCRepeatedFloat *)[v8 copy];
  priorScore = self->_priorScore;
  self->_priorScore = v48;

  if (v10)
  {
    CCSetError();
  }
  else
  {
    if (!*(void *)&v5[*MEMORY[0x263F317B8]])
    {
      BOOL v54 = 1;
      goto LABEL_69;
    }
    long long v50 = (objc_class *)objc_opt_class();
    long long v51 = NSStringFromClass(v50);
    CCInvalidBufferErrorForMessage();
    v53 = long long v52 = v8;
    CCSetError();

    id v8 = v52;
  }
  BOOL v54 = 0;
LABEL_69:

  return v54;
}

- (CCPeopleSuggesterContactPriorContent)initWithVersion:(id)a3 minVersion:(id)a4 sourceSharedIdentifier:(id)a5 priorScore:(id)a6 modelName:(id)a7 modelVersion:(id)a8 referenceDate:(id)a9 error:(id *)a10
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v38 = a9;
  BOOL v21 = objc_opt_new();
  if (v15)
  {
    objc_opt_class();
    int IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
    id v23 = 0;
    if (!IsInstanceOfExpectedClass) {
      goto LABEL_26;
    }
    unint64_t v35 = a10;
    [v15 unsignedIntValue];
    CCPBDataWriterWriteUint32Field();
    if (!v16)
    {
LABEL_4:
      id v24 = v23;
      if (v17) {
        goto LABEL_5;
      }
      goto LABEL_11;
    }
  }
  else
  {
    unint64_t v35 = a10;
    id v23 = 0;
    if (!v16) {
      goto LABEL_4;
    }
  }
  objc_opt_class();
  int v26 = CCValidateIsInstanceOfExpectedClass();
  id v24 = v23;

  if (!v26) {
    goto LABEL_25;
  }
  [v16 unsignedIntValue];
  CCPBDataWriterWriteUint32Field();
  if (v17)
  {
LABEL_5:
    objc_opt_class();
    int v25 = CCValidateIsInstanceOfExpectedClass();
    id v23 = v24;

    if (!v25) {
      goto LABEL_26;
    }
    CCPBDataWriterWriteRepeatedInt64Field();
    if (!v18) {
      goto LABEL_7;
    }
    goto LABEL_12;
  }
LABEL_11:
  id v23 = v24;
  if (!v18)
  {
LABEL_7:
    id v24 = v23;
    goto LABEL_14;
  }
LABEL_12:
  objc_opt_class();
  int v27 = CCValidateIsInstanceOfExpectedClass();
  id v24 = v23;

  if (!v27) {
    goto LABEL_25;
  }
  CCPBDataWriterWriteRepeatedFloatField();
LABEL_14:
  if (v19)
  {
    objc_opt_class();
    int v28 = CCValidateIsInstanceOfExpectedClass();
    id v23 = v24;

    if (v28)
    {
      CCPBDataWriterWriteStringField();
      if (!v20)
      {
LABEL_17:
        id v24 = v23;
LABEL_22:
        if (!v38)
        {
          id v23 = v24;
          goto LABEL_30;
        }
        objc_opt_class();
        int v30 = CCValidateIsInstanceOfExpectedClass();
        id v23 = v24;

        if (v30)
        {
          [v38 doubleValue];
          CCPBDataWriterWriteDoubleField();
LABEL_30:
          uint64_t v34 = objc_msgSend(v21, "immutableData", v35);
          unsigned int v31 = [(CCItemMessage *)self initWithData:v34 error:v36];

          uint64_t v32 = v31;
          goto LABEL_28;
        }
        goto LABEL_26;
      }
      goto LABEL_20;
    }
LABEL_26:
    CCSetError();
    unsigned int v31 = 0;
    goto LABEL_27;
  }
  id v23 = v24;
  if (!v20) {
    goto LABEL_17;
  }
LABEL_20:
  objc_opt_class();
  int v29 = CCValidateIsInstanceOfExpectedClass();
  id v24 = v23;

  if (v29)
  {
    CCPBDataWriterWriteStringField();
    goto LABEL_22;
  }
LABEL_25:
  CCSetError();
  unsigned int v31 = 0;
  id v23 = v24;
LABEL_27:
  uint64_t v32 = self;
LABEL_28:

  return v31;
}

+ (Class)contentMessageClass
{
  return (Class)objc_opt_class();
}

+ (Class)metaContentMessageClass
{
  return (Class)objc_opt_class();
}

+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3
{
  if ((unsigned __int16)(a3 + 24968) > 7u) {
    return 0;
  }
  else {
    return off_26539CDA8[(unsigned __int16)(a3 + 24968)];
  }
}

+ (unsigned)itemType
{
  return -24968;
}

@end