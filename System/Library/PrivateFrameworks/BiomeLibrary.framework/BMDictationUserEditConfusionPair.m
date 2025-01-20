@interface BMDictationUserEditConfusionPair
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMDictationUserEditConfusionPair)initWithIndex:(id)a3 recognizedTokens:(id)a4 correctedTokens:(id)a5;
- (BMDictationUserEditConfusionPair)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasIndex;
- (BOOL)isEqual:(id)a3;
- (NSArray)correctedTokens;
- (NSArray)recognizedTokens;
- (NSString)description;
- (id)_correctedTokensJSONArray;
- (id)_recognizedTokensJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (unsigned)index;
- (void)setHasIndex:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMDictationUserEditConfusionPair

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correctedTokens, 0);

  objc_storeStrong((id *)&self->_recognizedTokens, 0);
}

- (NSArray)correctedTokens
{
  return self->_correctedTokens;
}

- (NSArray)recognizedTokens
{
  return self->_recognizedTokens;
}

- (void)setHasIndex:(BOOL)a3
{
  self->_hasIndex = a3;
}

- (BOOL)hasIndex
{
  return self->_hasIndex;
}

- (unsigned)index
{
  return self->_index;
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
    if (-[BMDictationUserEditConfusionPair hasIndex](self, "hasIndex") || [v5 hasIndex])
    {
      if (![(BMDictationUserEditConfusionPair *)self hasIndex]) {
        goto LABEL_9;
      }
      if (![v5 hasIndex]) {
        goto LABEL_9;
      }
      unsigned int v6 = [(BMDictationUserEditConfusionPair *)self index];
      if (v6 != [v5 index]) {
        goto LABEL_9;
      }
    }
    v7 = [(BMDictationUserEditConfusionPair *)self recognizedTokens];
    uint64_t v8 = [v5 recognizedTokens];
    if (v7 == (void *)v8)
    {
    }
    else
    {
      v9 = (void *)v8;
      v10 = [(BMDictationUserEditConfusionPair *)self recognizedTokens];
      v11 = [v5 recognizedTokens];
      int v12 = [v10 isEqual:v11];

      if (!v12)
      {
LABEL_9:
        char v13 = 0;
LABEL_16:

        goto LABEL_17;
      }
    }
    v14 = [(BMDictationUserEditConfusionPair *)self correctedTokens];
    v15 = [v5 correctedTokens];
    if (v14 == v15)
    {
      char v13 = 1;
    }
    else
    {
      v16 = [(BMDictationUserEditConfusionPair *)self correctedTokens];
      v17 = [v5 correctedTokens];
      char v13 = [v16 isEqual:v17];
    }
    goto LABEL_16;
  }
  char v13 = 0;
LABEL_17:

  return v13;
}

- (id)jsonDictionary
{
  v12[3] = *MEMORY[0x1E4F143B8];
  if ([(BMDictationUserEditConfusionPair *)self hasIndex])
  {
    v3 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDictationUserEditConfusionPair index](self, "index"));
  }
  else
  {
    v3 = 0;
  }
  id v4 = [(BMDictationUserEditConfusionPair *)self _recognizedTokensJSONArray];
  id v5 = [(BMDictationUserEditConfusionPair *)self _correctedTokensJSONArray];
  v11[0] = @"index";
  unsigned int v6 = v3;
  if (!v3)
  {
    unsigned int v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[0] = v6;
  v11[1] = @"recognizedTokens";
  v7 = v4;
  if (!v4)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v7;
  v11[2] = @"correctedTokens";
  uint64_t v8 = v5;
  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  if (v5)
  {
    if (v4) {
      goto LABEL_12;
    }
LABEL_17:

    if (v3) {
      goto LABEL_13;
    }
    goto LABEL_18;
  }

  if (!v4) {
    goto LABEL_17;
  }
LABEL_12:
  if (v3) {
    goto LABEL_13;
  }
LABEL_18:

LABEL_13:

  return v9;
}

- (id)_correctedTokensJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(BMDictationUserEditConfusionPair *)self correctedTokens];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addObject:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_recognizedTokensJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(BMDictationUserEditConfusionPair *)self recognizedTokens];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addObject:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BMDictationUserEditConfusionPair)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v78[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"index"];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v31 = *MEMORY[0x1E4F502C8];
        uint64_t v77 = *MEMORY[0x1E4F28568];
        id v8 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"index"];
        v78[0] = v8;
        long long v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v78 forKeys:&v77 count:1];
        id v7 = 0;
        v29 = 0;
        *a4 = (id)[v30 initWithDomain:v31 code:2 userInfo:v11];
        goto LABEL_54;
      }
      id v7 = 0;
      v29 = 0;
      goto LABEL_56;
    }
    id v7 = v6;
  }
  else
  {
    id v7 = 0;
  }
  id v8 = [v5 objectForKeyedSubscript:@"recognizedTokens"];
  v9 = [MEMORY[0x1E4F1CA98] null];
  int v10 = [v8 isEqual:v9];

  v52 = v6;
  v53 = self;
  if (v10)
  {
    id v50 = v7;

    id v8 = 0;
  }
  else
  {
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v37 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v38 = *MEMORY[0x1E4F502C8];
          uint64_t v75 = *MEMORY[0x1E4F28568];
          long long v11 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"recognizedTokens"];
          v76 = v11;
          id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
          v29 = 0;
          *a4 = (id)[v37 initWithDomain:v38 code:2 userInfo:v17];
          goto LABEL_53;
        }
        v29 = 0;
        goto LABEL_55;
      }
    }
    id v50 = v7;
  }
  long long v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v8 = v8;
  uint64_t v12 = [v8 countByEnumeratingWithState:&v59 objects:v74 count:16];
  id v51 = v5;
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v60 != v14) {
          objc_enumerationMutation(v8);
        }
        uint64_t v16 = *(void *)(*((void *)&v59 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v20 = a4;
          if (a4)
          {
            id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v22 = *MEMORY[0x1E4F502C8];
            uint64_t v72 = *MEMORY[0x1E4F28568];
            v23 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"recognizedTokens"];
            v73 = v23;
            v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v73 forKeys:&v72 count:1];
            v25 = v21;
            uint64_t v26 = v22;
            goto LABEL_26;
          }
LABEL_27:
          v29 = 0;
          id v17 = v8;
          id v7 = v50;
          id v5 = v51;
          goto LABEL_53;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v20 = a4;
          if (!a4) {
            goto LABEL_27;
          }
          id v27 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v28 = *MEMORY[0x1E4F502C8];
          uint64_t v70 = *MEMORY[0x1E4F28568];
          v23 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"recognizedTokens"];
          v71 = v23;
          v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v71 forKeys:&v70 count:1];
          v25 = v27;
          uint64_t v26 = v28;
LABEL_26:
          id v5 = v51;
          id *v20 = (id)[v25 initWithDomain:v26 code:2 userInfo:v24];

          v29 = 0;
          id v17 = v8;
LABEL_51:
          id v7 = v50;
          goto LABEL_52;
        }
        [v11 addObject:v16];
      }
      uint64_t v13 = [v8 countByEnumeratingWithState:&v59 objects:v74 count:16];
      id v5 = v51;
    }
    while (v13);
  }

  id v17 = [v5 objectForKeyedSubscript:@"correctedTokens"];
  v18 = [MEMORY[0x1E4F1CA98] null];
  int v19 = [v17 isEqual:v18];

  if (v19)
  {

    id v17 = 0;
  }
  else if (v17)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        v29 = 0;
        id v7 = v50;
        goto LABEL_53;
      }
      id v47 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v48 = *MEMORY[0x1E4F502C8];
      uint64_t v68 = *MEMORY[0x1E4F28568];
      v23 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"correctedTokens"];
      v69 = v23;
      v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v69 forKeys:&v68 count:1];
      *a4 = (id)[v47 initWithDomain:v48 code:2 userInfo:v49];

LABEL_50:
      v29 = 0;
      goto LABEL_51;
    }
  }
  v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v17, "count"));
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v17 = v17;
  uint64_t v32 = [v17 countByEnumeratingWithState:&v55 objects:v67 count:16];
  if (!v32) {
    goto LABEL_41;
  }
  uint64_t v33 = v32;
  uint64_t v34 = *(void *)v56;
  while (2)
  {
    for (uint64_t j = 0; j != v33; ++j)
    {
      if (*(void *)v56 != v34) {
        objc_enumerationMutation(v17);
      }
      uint64_t v36 = *(void *)(*((void *)&v55 + 1) + 8 * j);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v5 = v51;
        if (a4)
        {
          id v39 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v40 = *MEMORY[0x1E4F502C8];
          uint64_t v65 = *MEMORY[0x1E4F28568];
          v41 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"correctedTokens"];
          v66 = v41;
          v42 = (void *)MEMORY[0x1E4F1C9E8];
          v43 = &v66;
          v44 = &v65;
LABEL_48:
          v45 = [v42 dictionaryWithObjects:v43 forKeys:v44 count:1];
          *a4 = (id)[v39 initWithDomain:v40 code:2 userInfo:v45];
        }
LABEL_49:

        goto LABEL_50;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v5 = v51;
        if (a4)
        {
          id v39 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v40 = *MEMORY[0x1E4F502C8];
          uint64_t v63 = *MEMORY[0x1E4F28568];
          v41 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"correctedTokens"];
          v64 = v41;
          v42 = (void *)MEMORY[0x1E4F1C9E8];
          v43 = &v64;
          v44 = &v63;
          goto LABEL_48;
        }
        goto LABEL_49;
      }
      [v23 addObject:v36];
    }
    uint64_t v33 = [v17 countByEnumeratingWithState:&v55 objects:v67 count:16];
    if (v33) {
      continue;
    }
    break;
  }
LABEL_41:

  id v7 = v50;
  v29 = [(BMDictationUserEditConfusionPair *)v53 initWithIndex:v50 recognizedTokens:v11 correctedTokens:v23];
  v53 = v29;
  id v5 = v51;
LABEL_52:

LABEL_53:
  uint64_t v6 = v52;
  self = v53;
LABEL_54:

LABEL_55:
LABEL_56:

  return v29;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMDictationUserEditConfusionPair *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_hasIndex) {
    PBDataWriterWriteUint32Field();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = self->_recognizedTokens;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v10 = self->_correctedTokens;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)BMDictationUserEditConfusionPair;
  id v5 = [(BMEventBase *)&v39 init];
  if (!v5) {
    goto LABEL_43;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v9 = (int *)MEMORY[0x1E4F940E0];
  int v10 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    uint64_t v11 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (v4[*v10]) {
        goto LABEL_41;
      }
      char v12 = 0;
      unsigned int v13 = 0;
      unint64_t v14 = 0;
      while (1)
      {
        uint64_t v15 = *v8;
        unint64_t v16 = *(void *)&v4[v15];
        if (v16 == -1 || v16 >= *(void *)&v4[*v9]) {
          break;
        }
        char v17 = *(unsigned char *)(*(void *)&v4[*v11] + v16);
        *(void *)&v4[v15] = v16 + 1;
        v14 |= (unint64_t)(v17 & 0x7F) << v12;
        if ((v17 & 0x80) == 0) {
          goto LABEL_13;
        }
        v12 += 7;
        BOOL v18 = v13++ >= 9;
        if (v18)
        {
          unint64_t v14 = 0;
          int v19 = v4[*v10];
          goto LABEL_15;
        }
      }
      v4[*v10] = 1;
LABEL_13:
      int v19 = v4[*v10];
      if (v4[*v10]) {
        unint64_t v14 = 0;
      }
LABEL_15:
      if (v19 || (v14 & 7) == 4) {
        goto LABEL_41;
      }
      unint64_t v21 = v14 >> 3;
      if ((v14 >> 3) == 3) {
        break;
      }
      if (v21 == 2)
      {
        uint64_t v31 = PBReaderReadString();
        if (!v31) {
          goto LABEL_45;
        }
        v29 = (void *)v31;
        id v30 = v6;
        goto LABEL_33;
      }
      if (v21 == 1)
      {
        char v22 = 0;
        unsigned int v23 = 0;
        uint64_t v24 = 0;
        v5->_hasIndex = 1;
        while (1)
        {
          uint64_t v25 = *v8;
          unint64_t v26 = *(void *)&v4[v25];
          if (v26 == -1 || v26 >= *(void *)&v4[*v9]) {
            break;
          }
          char v27 = *(unsigned char *)(*(void *)&v4[*v11] + v26);
          *(void *)&v4[v25] = v26 + 1;
          v24 |= (unint64_t)(v27 & 0x7F) << v22;
          if ((v27 & 0x80) == 0) {
            goto LABEL_37;
          }
          v22 += 7;
          BOOL v18 = v23++ >= 9;
          if (v18)
          {
            LODWORD(v24) = 0;
            goto LABEL_39;
          }
        }
        v4[*v10] = 1;
LABEL_37:
        if (v4[*v10]) {
          LODWORD(v24) = 0;
        }
LABEL_39:
        v5->_index = v24;
      }
      else if (!PBReaderSkipValueWithTag())
      {
LABEL_45:

        goto LABEL_42;
      }
LABEL_40:
      if (*(void *)&v4[*v8] >= *(void *)&v4[*v9]) {
        goto LABEL_41;
      }
    }
    uint64_t v28 = PBReaderReadString();
    if (!v28) {
      goto LABEL_45;
    }
    v29 = (void *)v28;
    id v30 = v7;
LABEL_33:
    [v30 addObject:v29];

    goto LABEL_40;
  }
LABEL_41:
  uint64_t v32 = [v6 copy];
  recognizedTokens = v5->_recognizedTokens;
  v5->_recognizedTokens = (NSArray *)v32;

  uint64_t v34 = [v7 copy];
  correctedTokens = v5->_correctedTokens;
  v5->_correctedTokens = (NSArray *)v34;

  int v36 = v4[*v10];
  if (v36) {
LABEL_42:
  }
    id v37 = 0;
  else {
LABEL_43:
  }
    id v37 = v5;

  return v37;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDictationUserEditConfusionPair index](self, "index"));
  id v5 = [(BMDictationUserEditConfusionPair *)self recognizedTokens];
  uint64_t v6 = [(BMDictationUserEditConfusionPair *)self correctedTokens];
  uint64_t v7 = (void *)[v3 initWithFormat:@"BMDictationUserEditConfusionPair with index: %@, recognizedTokens: %@, correctedTokens: %@", v4, v5, v6];

  return (NSString *)v7;
}

- (BMDictationUserEditConfusionPair)initWithIndex:(id)a3 recognizedTokens:(id)a4 correctedTokens:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BMDictationUserEditConfusionPair;
  uint64_t v11 = [(BMEventBase *)&v14 init];
  if (v11)
  {
    v11->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v8)
    {
      v11->_hasIndex = 1;
      unsigned int v12 = [v8 unsignedIntValue];
    }
    else
    {
      unsigned int v12 = 0;
      v11->_hasIndex = 0;
    }
    v11->_index = v12;
    objc_storeStrong((id *)&v11->_recognizedTokens, a4);
    objc_storeStrong((id *)&v11->_correctedTokens, a5);
  }

  return v11;
}

+ (id)protoFields
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"index" number:1 type:4 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"recognizedTokens", 2, 13, 0, v2);
  v7[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"correctedTokens" number:3 type:13 subMessageClass:0];
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF70C8;
}

+ (id)columns
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"index" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:4 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"recognizedTokens_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_177_80492];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"correctedTokens_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_179_80493];
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

id __43__BMDictationUserEditConfusionPair_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _correctedTokensJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __43__BMDictationUserEditConfusionPair_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _recognizedTokensJSONArray];
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
    id v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMDictationUserEditConfusionPair alloc] initByReadFrom:v7];
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