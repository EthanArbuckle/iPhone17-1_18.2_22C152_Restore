@interface BMDictationUserEdit
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMDictationUserEdit)initWithAsrID:(id)a3 interactionID:(id)a4 metadata:(id)a5 startIndex:(id)a6 endIndex:(id)a7 correctedText:(id)a8 recognizedText:(id)a9 recognizedTokens:(id)a10 alternativeSelections:(id)a11;
- (BMDictationUserEdit)initWithAsrID:(id)a3 interactionID:(id)a4 metadata:(id)a5 startIndex:(id)a6 endIndex:(id)a7 correctedText:(id)a8 recognizedText:(id)a9 recognizedTokens:(id)a10 alternativeSelections:(id)a11 preItnNbest:(id)a12 postItnNbest:(id)a13;
- (BMDictationUserEdit)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMDictationUserEditRequestMetadata)metadata;
- (BOOL)hasEndIndex;
- (BOOL)hasStartIndex;
- (BOOL)isEqual:(id)a3;
- (NSArray)alternativeSelections;
- (NSArray)postItnNbest;
- (NSArray)preItnNbest;
- (NSArray)recognizedTokens;
- (NSString)asrID;
- (NSString)correctedText;
- (NSString)description;
- (NSString)interactionID;
- (NSString)recognizedText;
- (id)_alternativeSelectionsJSONArray;
- (id)_postItnNbestJSONArray;
- (id)_preItnNbestJSONArray;
- (id)_recognizedTokensJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (unsigned)endIndex;
- (unsigned)startIndex;
- (void)setHasEndIndex:(BOOL)a3;
- (void)setHasStartIndex:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMDictationUserEdit

+ (id)columns
{
  v15[11] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"asrID" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"interactionID" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"metadata_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_259];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"startIndex" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:4 convertedType:0];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"endIndex" dataType:0 requestOnly:0 fieldNumber:5 protoDataType:4 convertedType:0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"correctedText" dataType:2 requestOnly:0 fieldNumber:6 protoDataType:13 convertedType:0];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"recognizedText" dataType:2 requestOnly:0 fieldNumber:7 protoDataType:13 convertedType:0];
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"recognizedTokens_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_261];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"alternativeSelections_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_263];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"preItnNbest_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_265];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"postItnNbest_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_267];
  v15[0] = v2;
  v15[1] = v3;
  v15[2] = v4;
  v15[3] = v5;
  v15[4] = v13;
  v15[5] = v6;
  v15[6] = v7;
  v15[7] = v14;
  v15[8] = v8;
  v15[9] = v9;
  v15[10] = v10;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:11];

  return v12;
}

- (BMDictationUserEdit)initWithAsrID:(id)a3 interactionID:(id)a4 metadata:(id)a5 startIndex:(id)a6 endIndex:(id)a7 correctedText:(id)a8 recognizedText:(id)a9 recognizedTokens:(id)a10 alternativeSelections:(id)a11
{
  return [(BMDictationUserEdit *)self initWithAsrID:a3 interactionID:a4 metadata:a5 startIndex:a6 endIndex:a7 correctedText:a8 recognizedText:a9 recognizedTokens:a10 alternativeSelections:a11 preItnNbest:MEMORY[0x1E4F1CBF0] postItnNbest:MEMORY[0x1E4F1CBF0]];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postItnNbest, 0);
  objc_storeStrong((id *)&self->_preItnNbest, 0);
  objc_storeStrong((id *)&self->_alternativeSelections, 0);
  objc_storeStrong((id *)&self->_recognizedTokens, 0);
  objc_storeStrong((id *)&self->_recognizedText, 0);
  objc_storeStrong((id *)&self->_correctedText, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_interactionID, 0);

  objc_storeStrong((id *)&self->_asrID, 0);
}

- (NSArray)postItnNbest
{
  return self->_postItnNbest;
}

- (NSArray)preItnNbest
{
  return self->_preItnNbest;
}

- (NSArray)alternativeSelections
{
  return self->_alternativeSelections;
}

- (NSArray)recognizedTokens
{
  return self->_recognizedTokens;
}

- (NSString)recognizedText
{
  return self->_recognizedText;
}

- (NSString)correctedText
{
  return self->_correctedText;
}

- (void)setHasEndIndex:(BOOL)a3
{
  self->_hasEndIndex = a3;
}

- (BOOL)hasEndIndex
{
  return self->_hasEndIndex;
}

- (unsigned)endIndex
{
  return self->_endIndex;
}

- (void)setHasStartIndex:(BOOL)a3
{
  self->_hasStartIndex = a3;
}

- (BOOL)hasStartIndex
{
  return self->_hasStartIndex;
}

- (unsigned)startIndex
{
  return self->_startIndex;
}

- (BMDictationUserEditRequestMetadata)metadata
{
  return self->_metadata;
}

- (NSString)interactionID
{
  return self->_interactionID;
}

- (NSString)asrID
{
  return self->_asrID;
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
    v6 = [(BMDictationUserEdit *)self asrID];
    uint64_t v7 = [v5 asrID];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMDictationUserEdit *)self asrID];
      v10 = [v5 asrID];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_43;
      }
    }
    v13 = [(BMDictationUserEdit *)self interactionID];
    uint64_t v14 = [v5 interactionID];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMDictationUserEdit *)self interactionID];
      v17 = [v5 interactionID];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_43;
      }
    }
    v19 = [(BMDictationUserEdit *)self metadata];
    uint64_t v20 = [v5 metadata];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMDictationUserEdit *)self metadata];
      v23 = [v5 metadata];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_43;
      }
    }
    if (-[BMDictationUserEdit hasStartIndex](self, "hasStartIndex") || [v5 hasStartIndex])
    {
      if (![(BMDictationUserEdit *)self hasStartIndex]) {
        goto LABEL_43;
      }
      if (![v5 hasStartIndex]) {
        goto LABEL_43;
      }
      unsigned int v25 = [(BMDictationUserEdit *)self startIndex];
      if (v25 != [v5 startIndex]) {
        goto LABEL_43;
      }
    }
    if (-[BMDictationUserEdit hasEndIndex](self, "hasEndIndex") || [v5 hasEndIndex])
    {
      if (![(BMDictationUserEdit *)self hasEndIndex]) {
        goto LABEL_43;
      }
      if (![v5 hasEndIndex]) {
        goto LABEL_43;
      }
      unsigned int v26 = [(BMDictationUserEdit *)self endIndex];
      if (v26 != [v5 endIndex]) {
        goto LABEL_43;
      }
    }
    v27 = [(BMDictationUserEdit *)self correctedText];
    uint64_t v28 = [v5 correctedText];
    if (v27 == (void *)v28)
    {
    }
    else
    {
      v29 = (void *)v28;
      v30 = [(BMDictationUserEdit *)self correctedText];
      v31 = [v5 correctedText];
      int v32 = [v30 isEqual:v31];

      if (!v32) {
        goto LABEL_43;
      }
    }
    v33 = [(BMDictationUserEdit *)self recognizedText];
    uint64_t v34 = [v5 recognizedText];
    if (v33 == (void *)v34)
    {
    }
    else
    {
      v35 = (void *)v34;
      v36 = [(BMDictationUserEdit *)self recognizedText];
      v37 = [v5 recognizedText];
      int v38 = [v36 isEqual:v37];

      if (!v38) {
        goto LABEL_43;
      }
    }
    v39 = [(BMDictationUserEdit *)self recognizedTokens];
    uint64_t v40 = [v5 recognizedTokens];
    if (v39 == (void *)v40)
    {
    }
    else
    {
      v41 = (void *)v40;
      v42 = [(BMDictationUserEdit *)self recognizedTokens];
      v43 = [v5 recognizedTokens];
      int v44 = [v42 isEqual:v43];

      if (!v44) {
        goto LABEL_43;
      }
    }
    v45 = [(BMDictationUserEdit *)self alternativeSelections];
    uint64_t v46 = [v5 alternativeSelections];
    if (v45 == (void *)v46)
    {
    }
    else
    {
      v47 = (void *)v46;
      v48 = [(BMDictationUserEdit *)self alternativeSelections];
      v49 = [v5 alternativeSelections];
      int v50 = [v48 isEqual:v49];

      if (!v50) {
        goto LABEL_43;
      }
    }
    v51 = [(BMDictationUserEdit *)self preItnNbest];
    uint64_t v52 = [v5 preItnNbest];
    if (v51 == (void *)v52)
    {
    }
    else
    {
      v53 = (void *)v52;
      v54 = [(BMDictationUserEdit *)self preItnNbest];
      v55 = [v5 preItnNbest];
      int v56 = [v54 isEqual:v55];

      if (!v56)
      {
LABEL_43:
        char v12 = 0;
LABEL_44:

        goto LABEL_45;
      }
    }
    v58 = [(BMDictationUserEdit *)self postItnNbest];
    v59 = [v5 postItnNbest];
    if (v58 == v59)
    {
      char v12 = 1;
    }
    else
    {
      v60 = [(BMDictationUserEdit *)self postItnNbest];
      v61 = [v5 postItnNbest];
      char v12 = [v60 isEqual:v61];
    }
    goto LABEL_44;
  }
  char v12 = 0;
LABEL_45:

  return v12;
}

- (id)jsonDictionary
{
  v38[11] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMDictationUserEdit *)self asrID];
  uint64_t v4 = [(BMDictationUserEdit *)self interactionID];
  id v5 = [(BMDictationUserEdit *)self metadata];
  uint64_t v6 = [v5 jsonDictionary];

  if ([(BMDictationUserEdit *)self hasStartIndex])
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDictationUserEdit startIndex](self, "startIndex"));
  }
  else
  {
    uint64_t v7 = 0;
  }
  if ([(BMDictationUserEdit *)self hasEndIndex])
  {
    v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDictationUserEdit endIndex](self, "endIndex"));
  }
  else
  {
    v8 = 0;
  }
  v36 = [(BMDictationUserEdit *)self correctedText];
  v35 = [(BMDictationUserEdit *)self recognizedText];
  uint64_t v34 = [(BMDictationUserEdit *)self _recognizedTokensJSONArray];
  v9 = [(BMDictationUserEdit *)self _alternativeSelectionsJSONArray];
  v10 = [(BMDictationUserEdit *)self _preItnNbestJSONArray];
  int v11 = [(BMDictationUserEdit *)self _postItnNbestJSONArray];
  v37[0] = @"asrID";
  uint64_t v12 = v3;
  if (!v3)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v28 = (void *)v12;
  v38[0] = v12;
  v37[1] = @"interactionID";
  uint64_t v13 = v4;
  if (!v4)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v27 = (void *)v13;
  v38[1] = v13;
  v37[2] = @"metadata";
  uint64_t v14 = v6;
  if (!v6)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  unsigned int v26 = (void *)v14;
  v38[2] = v14;
  v37[3] = @"startIndex";
  uint64_t v15 = v7;
  if (!v7)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v33 = (void *)v3;
  unsigned int v25 = (void *)v15;
  v38[3] = v15;
  v37[4] = @"endIndex";
  uint64_t v16 = (uint64_t)v8;
  if (!v8)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  int v32 = (void *)v4;
  int v24 = (void *)v16;
  v38[4] = v16;
  v37[5] = @"correctedText";
  v17 = v36;
  if (!v36)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v31 = (void *)v6;
  v38[5] = v17;
  v37[6] = @"recognizedText";
  int v18 = v35;
  if (!v35)
  {
    int v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v30 = (void *)v7;
  v38[6] = v18;
  v37[7] = @"recognizedTokens";
  v19 = v34;
  if (!v34)
  {
    v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v38[7] = v19;
  v37[8] = @"alternativeSelections";
  uint64_t v20 = v9;
  if (!v9)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v38[8] = v20;
  v37[9] = @"preItnNbest";
  v21 = v10;
  if (!v10)
  {
    v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v38[9] = v21;
  v37[10] = @"postItnNbest";
  v22 = v11;
  if (!v11)
  {
    v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v38[10] = v22;
  id v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:11];
  if (v11)
  {
    if (v10) {
      goto LABEL_31;
    }
LABEL_48:

    if (v9) {
      goto LABEL_32;
    }
    goto LABEL_49;
  }

  if (!v10) {
    goto LABEL_48;
  }
LABEL_31:
  if (v9) {
    goto LABEL_32;
  }
LABEL_49:

LABEL_32:
  if (!v34) {

  }
  if (!v35) {
  if (!v36)
  }

  if (!v8) {
  if (v30)
  }
  {
    if (v31) {
      goto LABEL_42;
    }
  }
  else
  {

    if (v31)
    {
LABEL_42:
      if (v32) {
        goto LABEL_43;
      }
LABEL_52:

      if (v33) {
        goto LABEL_44;
      }
      goto LABEL_53;
    }
  }

  if (!v32) {
    goto LABEL_52;
  }
LABEL_43:
  if (v33) {
    goto LABEL_44;
  }
LABEL_53:

LABEL_44:

  return v29;
}

- (id)_postItnNbestJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(BMDictationUserEdit *)self postItnNbest];
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

- (id)_preItnNbestJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(BMDictationUserEdit *)self preItnNbest];
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

- (id)_alternativeSelectionsJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(BMDictationUserEdit *)self alternativeSelections];
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

- (id)_recognizedTokensJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [(BMDictationUserEdit *)self recognizedTokens];
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

- (BMDictationUserEdit)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v243[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"asrID"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v28 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v29 = *MEMORY[0x1E4F502C8];
        uint64_t v242 = *MEMORY[0x1E4F28568];
        unsigned int v26 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"asrID"];
        v243[0] = v26;
        v179 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v243 forKeys:&v242 count:1];
        id v30 = (id)objc_msgSend(v28, "initWithDomain:code:userInfo:", v29, 2);
        id v8 = 0;
        unsigned int v25 = 0;
        *a4 = v30;
        goto LABEL_185;
      }
      id v8 = 0;
      unsigned int v25 = 0;
      goto LABEL_186;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }
  uint64_t v9 = [v6 objectForKeyedSubscript:@"interactionID"];
  v179 = (void *)v9;
  if (v9 && (long long v10 = (void *)v9, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v41 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v42 = v8;
        uint64_t v43 = *MEMORY[0x1E4F502C8];
        uint64_t v240 = *MEMORY[0x1E4F28568];
        id v22 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"interactionID"];
        id v241 = v22;
        v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v241 forKeys:&v240 count:1];
        uint64_t v44 = v43;
        id v8 = v42;
        unsigned int v26 = 0;
        unsigned int v25 = 0;
        *a4 = (id)[v41 initWithDomain:v44 code:2 userInfo:v27];
        goto LABEL_183;
      }
      unsigned int v26 = 0;
      unsigned int v25 = 0;
      goto LABEL_185;
    }
    id v176 = v10;
  }
  else
  {
    id v176 = 0;
  }
  long long v11 = [v6 objectForKeyedSubscript:@"metadata"];
  v178 = a4;
  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v45 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v170 = v8;
        uint64_t v46 = *MEMORY[0x1E4F502C8];
        uint64_t v238 = *MEMORY[0x1E4F28568];
        v47 = v11;
        v27 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"metadata"];
        v239 = v27;
        v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v239 forKeys:&v238 count:1];
        uint64_t v49 = v46;
        id v8 = v170;
        *a4 = (id)[v45 initWithDomain:v49 code:2 userInfo:v48];

        unsigned int v25 = 0;
        id v22 = v47;
        unsigned int v26 = v176;
        goto LABEL_183;
      }
      unsigned int v25 = 0;
      unsigned int v26 = v176;
      goto LABEL_184;
    }
    id v22 = v11;
    id v201 = 0;
    v173 = [[BMDictationUserEditRequestMetadata alloc] initWithJSONDictionary:v22 error:&v201];
    id v23 = v201;
    if (v23)
    {
      int v24 = v23;
      if (a4) {
        *a4 = v23;
      }

      unsigned int v25 = 0;
      unsigned int v26 = v176;
      v27 = v173;
      goto LABEL_183;
    }
  }
  else
  {
    v173 = 0;
  }
  long long v12 = [v6 objectForKeyedSubscript:@"startIndex"];
  v174 = v12;
  v175 = v11;
  v177 = self;
  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v50 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v51 = v8;
        uint64_t v52 = *MEMORY[0x1E4F502C8];
        uint64_t v236 = *MEMORY[0x1E4F28568];
        id v53 = [NSString alloc];
        uint64_t v155 = objc_opt_class();
        v54 = v53;
        long long v11 = v175;
        v55 = (id *)[v54 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v155, @"startIndex"];
        v237 = v55;
        long long v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v237 forKeys:&v236 count:1];
        int v56 = v50;
        long long v12 = v174;
        uint64_t v57 = v52;
        id v8 = v51;
        v58 = 0;
        unsigned int v25 = 0;
        *a4 = (id)[v56 initWithDomain:v57 code:2 userInfo:v13];
        a4 = v55;
        unsigned int v26 = v176;
        goto LABEL_181;
      }
      v58 = 0;
      unsigned int v25 = 0;
      unsigned int v26 = v176;
      goto LABEL_182;
    }
    id v171 = v12;
  }
  else
  {
    id v171 = 0;
  }
  long long v13 = [v6 objectForKeyedSubscript:@"endIndex"];
  if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v65 = objc_alloc(MEMORY[0x1E4F28C58]);
        id v66 = v8;
        uint64_t v67 = *MEMORY[0x1E4F502C8];
        uint64_t v234 = *MEMORY[0x1E4F28568];
        id v68 = [NSString alloc];
        uint64_t v156 = objc_opt_class();
        v69 = v68;
        long long v11 = v175;
        id v168 = (id)[v69 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v156, @"endIndex"];
        id v235 = v168;
        uint64_t v70 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v235 forKeys:&v234 count:1];
        v71 = v65;
        long long v12 = v174;
        uint64_t v72 = v67;
        id v8 = v66;
        v166 = (void *)v70;
        unsigned int v25 = 0;
        *a4 = (id)objc_msgSend(v71, "initWithDomain:code:userInfo:", v72, 2);
        a4 = 0;
        unsigned int v26 = v176;
        v58 = v171;
        goto LABEL_180;
      }
      unsigned int v25 = 0;
      unsigned int v26 = v176;
      v58 = v171;
      goto LABEL_181;
    }
    v163 = v13;
    v164 = v13;
  }
  else
  {
    v163 = v13;
    v164 = 0;
  }
  uint64_t v14 = [v6 objectForKeyedSubscript:@"correctedText"];
  v166 = (void *)v14;
  id v169 = v8;
  if (v14 && (uint64_t v15 = (void *)v14, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        id v168 = 0;
        unsigned int v25 = 0;
        unsigned int v26 = v176;
        v58 = v171;
        long long v13 = v163;
        a4 = v164;
        goto LABEL_180;
      }
      id v75 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v76 = *MEMORY[0x1E4F502C8];
      uint64_t v232 = *MEMORY[0x1E4F28568];
      uint64_t v77 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"correctedText"];
      uint64_t v233 = v77;
      uint64_t v78 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v233 forKeys:&v232 count:1];
      v79 = v75;
      long long v12 = v174;
      uint64_t v80 = v76;
      v81 = (void *)v77;
      v162 = (void *)v78;
      id v168 = 0;
      unsigned int v25 = 0;
      *a4 = (id)objc_msgSend(v79, "initWithDomain:code:userInfo:", v80, 2);
LABEL_92:
      long long v11 = v175;
      unsigned int v26 = v176;
      v58 = v171;
      long long v13 = v163;
      a4 = v164;
      goto LABEL_179;
    }
    id v168 = v15;
  }
  else
  {
    id v168 = 0;
  }
  uint64_t v16 = [v6 objectForKeyedSubscript:@"recognizedText"];
  v17 = v177;
  v162 = (void *)v16;
  if (!v16 || (int v18 = (void *)v16, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v161 = 0;
    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      id v82 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v83 = *MEMORY[0x1E4F502C8];
      uint64_t v230 = *MEMORY[0x1E4F28568];
      id v19 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"recognizedText"];
      id v231 = v19;
      uint64_t v84 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v231 forKeys:&v230 count:1];
      v85 = v82;
      long long v12 = v174;
      v181 = (void *)v84;
      id v161 = 0;
      unsigned int v25 = 0;
      *a4 = (id)objc_msgSend(v85, "initWithDomain:code:userInfo:", v83, 2);
      long long v11 = v175;
      unsigned int v26 = v176;
      v58 = v171;
      long long v13 = v163;
      a4 = v164;

      goto LABEL_178;
    }
    v81 = 0;
    unsigned int v25 = 0;
    goto LABEL_92;
  }
  id v161 = v18;
LABEL_22:
  id v19 = [v6 objectForKeyedSubscript:@"recognizedTokens"];
  uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  int v21 = [v19 isEqual:v20];

  v172 = v7;
  if (v21)
  {

    id v19 = 0;
  }
  else if (v19)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        unsigned int v25 = 0;
        long long v11 = v175;
        unsigned int v26 = v176;
        long long v12 = v174;
        v58 = v171;
        long long v13 = v163;
        a4 = v164;
        goto LABEL_178;
      }
      id v89 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v90 = *MEMORY[0x1E4F502C8];
      uint64_t v228 = *MEMORY[0x1E4F28568];
      v180 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"recognizedTokens"];
      v229 = v180;
      obuint64_t j = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v229 forKeys:&v228 count:1];
      unsigned int v25 = 0;
      *a4 = (id)objc_msgSend(v89, "initWithDomain:code:userInfo:", v90, 2);
      goto LABEL_84;
    }
  }
  v180 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v19, "count"));
  long long v197 = 0u;
  long long v198 = 0u;
  long long v199 = 0u;
  long long v200 = 0u;
  id v19 = v19;
  uint64_t v31 = [v19 countByEnumeratingWithState:&v197 objects:v227 count:16];
  if (!v31) {
    goto LABEL_50;
  }
  uint64_t v32 = v31;
  uint64_t v33 = *(void *)v198;
  do
  {
    uint64_t v34 = v17;
    for (uint64_t i = 0; i != v32; ++i)
    {
      if (*(void *)v198 != v33) {
        objc_enumerationMutation(v19);
      }
      uint64_t v36 = *(void *)(*((void *)&v197 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v59 = v178;
        if (v178)
        {
          id v60 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v61 = *MEMORY[0x1E4F502C8];
          uint64_t v225 = *MEMORY[0x1E4F28568];
          v165 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"recognizedTokens"];
          v226 = v165;
          v62 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v226 forKeys:&v225 count:1];
          v63 = v60;
          uint64_t v64 = v61;
LABEL_68:
          unsigned int v26 = v176;
          unsigned int v25 = 0;
          id *v59 = (id)[v63 initWithDomain:v64 code:2 userInfo:v62];
          obuint64_t j = v19;
          goto LABEL_69;
        }
LABEL_74:
        unsigned int v25 = 0;
        obuint64_t j = v19;
LABEL_84:
        long long v11 = v175;
        unsigned int v26 = v176;
        goto LABEL_85;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v178)
        {
          id v73 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v74 = *MEMORY[0x1E4F502C8];
          uint64_t v223 = *MEMORY[0x1E4F28568];
          v165 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"recognizedTokens"];
          v224 = v165;
          v62 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v224 forKeys:&v223 count:1];
          v63 = v73;
          uint64_t v64 = v74;
          v59 = v178;
          goto LABEL_68;
        }
        goto LABEL_74;
      }
      [v180 addObject:v36];
    }
    uint64_t v32 = [v19 countByEnumeratingWithState:&v197 objects:v227 count:16];
    v17 = v34;
  }
  while (v32);
LABEL_50:

  v37 = [v6 objectForKeyedSubscript:@"alternativeSelections"];
  int v38 = [MEMORY[0x1E4F1CA98] null];
  int v39 = [v37 isEqual:v38];

  if (v39)
  {

    v37 = 0;
    long long v11 = v175;
    uint64_t v40 = v178;
    goto LABEL_94;
  }
  uint64_t v40 = v178;
  if (!v37)
  {
    long long v11 = v175;
    goto LABEL_94;
  }
  objc_opt_class();
  long long v11 = v175;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    obuint64_t j = v37;
    if (v178)
    {
      id v86 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v87 = *MEMORY[0x1E4F502C8];
      uint64_t v221 = *MEMORY[0x1E4F28568];
      v165 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"alternativeSelections"];
      v222 = v165;
      v62 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v222 forKeys:&v221 count:1];
      uint64_t v88 = v87;
      long long v11 = v175;
      unsigned int v25 = 0;
      id *v178 = (id)[v86 initWithDomain:v88 code:2 userInfo:v62];
      unsigned int v26 = v176;
      goto LABEL_70;
    }
    unsigned int v25 = 0;
    unsigned int v26 = v176;
LABEL_85:
    long long v12 = v174;
    goto LABEL_176;
  }
LABEL_94:
  v165 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v37, "count"));
  long long v193 = 0u;
  long long v194 = 0u;
  long long v195 = 0u;
  long long v196 = 0u;
  obuint64_t j = v37;
  uint64_t v91 = [obj countByEnumeratingWithState:&v193 objects:v220 count:16];
  if (!v91) {
    goto LABEL_104;
  }
  uint64_t v92 = v91;
  uint64_t v93 = *(void *)v194;
  do
  {
    for (uint64_t j = 0; j != v92; ++j)
    {
      if (*(void *)v194 != v93) {
        objc_enumerationMutation(obj);
      }
      v95 = *(void **)(*((void *)&v193 + 1) + 8 * j);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (v40)
        {
          id v103 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v104 = *MEMORY[0x1E4F502C8];
          uint64_t v218 = *MEMORY[0x1E4F28568];
          v105 = v40;
          id v96 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"alternativeSelections"];
          id v219 = v96;
          id v106 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v219 forKeys:&v218 count:1];
          v107 = v103;
          uint64_t v108 = v104;
LABEL_111:
          unsigned int v25 = 0;
          id *v105 = (id)[v107 initWithDomain:v108 code:2 userInfo:v106];
          id v160 = obj;
          unsigned int v26 = v176;
          v17 = v177;
          long long v12 = v174;
          long long v11 = v175;
          goto LABEL_173;
        }
LABEL_131:
        unsigned int v25 = 0;
        v62 = obj;
        unsigned int v26 = v176;
LABEL_69:
        long long v11 = v175;
LABEL_70:
        long long v12 = v174;
        goto LABEL_175;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v40)
        {
          id v109 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v110 = *MEMORY[0x1E4F502C8];
          uint64_t v216 = *MEMORY[0x1E4F28568];
          v105 = v40;
          id v96 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"alternativeSelections"];
          id v217 = v96;
          id v106 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v217 forKeys:&v216 count:1];
          v107 = v109;
          uint64_t v108 = v110;
          goto LABEL_111;
        }
        goto LABEL_131;
      }
      id v96 = v95;
      v97 = [BMDictationUserEditConfusionPair alloc];
      id v192 = 0;
      v98 = [(BMDictationUserEditConfusionPair *)v97 initWithJSONDictionary:v96 error:&v192];
      id v99 = v192;
      if (v99)
      {
        id v106 = v99;
        long long v12 = v174;
        if (v178) {
          id *v178 = v99;
        }

        unsigned int v25 = 0;
        id v160 = obj;
        unsigned int v26 = v176;
        v17 = v177;
        long long v11 = v175;
        goto LABEL_173;
      }
      [v165 addObject:v98];

      uint64_t v7 = v172;
      uint64_t v40 = v178;
    }
    uint64_t v92 = [obj countByEnumeratingWithState:&v193 objects:v220 count:16];
    v17 = v177;
    long long v11 = v175;
  }
  while (v92);
LABEL_104:

  v100 = [v6 objectForKeyedSubscript:@"preItnNbest"];
  v101 = [MEMORY[0x1E4F1CA98] null];
  int v102 = [v100 isEqual:v101];

  if (v102)
  {

    goto LABEL_118;
  }
  if (v100)
  {
    objc_opt_class();
    id v160 = v100;
    long long v12 = v174;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!v40)
      {
        unsigned int v25 = 0;
        unsigned int v26 = v176;
        goto LABEL_174;
      }
      id v145 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v146 = *MEMORY[0x1E4F502C8];
      uint64_t v214 = *MEMORY[0x1E4F28568];
      v147 = v40;
      id v96 = (id)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"preItnNbest"];
      id v215 = v96;
      id v106 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v215 forKeys:&v214 count:1];
      uint64_t v148 = v146;
      long long v12 = v174;
      unsigned int v25 = 0;
      id *v147 = (id)[v145 initWithDomain:v148 code:2 userInfo:v106];
LABEL_159:
      unsigned int v26 = v176;
      goto LABEL_173;
    }
    v111 = v100;
  }
  else
  {
LABEL_118:
    v111 = 0;
    long long v12 = v174;
  }
  id v96 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v111, "count"));
  long long v188 = 0u;
  long long v189 = 0u;
  long long v190 = 0u;
  long long v191 = 0u;
  id v112 = v111;
  uint64_t v113 = [v112 countByEnumeratingWithState:&v188 objects:v213 count:16];
  id v160 = v112;
  if (!v113) {
    goto LABEL_129;
  }
  uint64_t v114 = v113;
  uint64_t v115 = *(void *)v189;
  do
  {
    for (uint64_t k = 0; k != v114; ++k)
    {
      if (*(void *)v189 != v115) {
        objc_enumerationMutation(v160);
      }
      v117 = *(void **)(*((void *)&v188 + 1) + 8 * k);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v124 = v178;
        if (v178)
        {
          id v125 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v126 = *MEMORY[0x1E4F502C8];
          uint64_t v211 = *MEMORY[0x1E4F28568];
          id v118 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"preItnNbest"];
          id v212 = v118;
          v127 = (void *)MEMORY[0x1E4F1C9E8];
          v128 = &v212;
          v129 = &v211;
LABEL_137:
          v130 = [v127 dictionaryWithObjects:v128 forKeys:v129 count:1];
          v131 = v125;
          uint64_t v132 = v126;
          long long v12 = v174;
          long long v11 = v175;
          id *v124 = (id)[v131 initWithDomain:v132 code:2 userInfo:v130];

          unsigned int v25 = 0;
          id v106 = v160;
          unsigned int v26 = v176;
          v17 = v177;
          goto LABEL_172;
        }
LABEL_160:
        unsigned int v25 = 0;
        id v106 = v160;
        unsigned int v26 = v176;
        v17 = v177;
        goto LABEL_173;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v124 = v178;
        if (v178)
        {
          id v125 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v126 = *MEMORY[0x1E4F502C8];
          uint64_t v209 = *MEMORY[0x1E4F28568];
          id v118 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"preItnNbest"];
          id v210 = v118;
          v127 = (void *)MEMORY[0x1E4F1C9E8];
          v128 = &v210;
          v129 = &v209;
          goto LABEL_137;
        }
        goto LABEL_160;
      }
      id v118 = v117;
      v119 = [BMDictationUserEditRecognitionResult alloc];
      id v187 = 0;
      v120 = [(BMDictationUserEditRecognitionResult *)v119 initWithJSONDictionary:v118 error:&v187];
      id v121 = v187;
      if (v121)
      {
        v133 = v121;
        if (v178) {
          id *v178 = v121;
        }

        unsigned int v25 = 0;
        id v106 = v160;
        unsigned int v26 = v176;
        v17 = v177;
        long long v12 = v174;
        long long v11 = v175;
        goto LABEL_172;
      }
      [v96 addObject:v120];

      long long v12 = v174;
      long long v11 = v175;
    }
    id v112 = v160;
    uint64_t v114 = [v160 countByEnumeratingWithState:&v188 objects:v213 count:16];
  }
  while (v114);
LABEL_129:

  id v106 = [v6 objectForKeyedSubscript:@"postItnNbest"];
  v122 = [MEMORY[0x1E4F1CA98] null];
  int v123 = [v106 isEqual:v122];

  if (v123)
  {

    id v106 = 0;
    v17 = v177;
    goto LABEL_145;
  }
  v17 = v177;
  if (v106)
  {
    objc_opt_class();
    long long v12 = v174;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v178)
      {
        id v134 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v135 = *MEMORY[0x1E4F502C8];
        uint64_t v207 = *MEMORY[0x1E4F28568];
        id v118 = (id)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"postItnNbest"];
        id v208 = v118;
        v136 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v208 forKeys:&v207 count:1];
        v137 = v134;
        uint64_t v138 = v135;
        long long v12 = v174;
        long long v11 = v175;
        id *v178 = (id)[v137 initWithDomain:v138 code:2 userInfo:v136];

        unsigned int v25 = 0;
        unsigned int v26 = v176;
        goto LABEL_172;
      }
      unsigned int v25 = 0;
      goto LABEL_159;
    }
  }
  else
  {
LABEL_145:
    long long v12 = v174;
  }
  id v118 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v106, "count"));
  long long v183 = 0u;
  long long v184 = 0u;
  long long v185 = 0u;
  long long v186 = 0u;
  id v106 = v106;
  uint64_t v157 = [v106 countByEnumeratingWithState:&v183 objects:v206 count:16];
  if (!v157) {
    goto LABEL_156;
  }
  uint64_t v158 = *(void *)v184;
  while (2)
  {
    uint64_t v139 = 0;
    while (2)
    {
      if (*(void *)v184 != v158) {
        objc_enumerationMutation(v106);
      }
      v140 = *(void **)(*((void *)&v183 + 1) + 8 * v139);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unsigned int v26 = v176;
        v17 = v177;
        if (v178)
        {
          id v159 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v149 = *MEMORY[0x1E4F502C8];
          uint64_t v204 = *MEMORY[0x1E4F28568];
          id v141 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"postItnNbest"];
          id v205 = v141;
          v150 = (void *)MEMORY[0x1E4F1C9E8];
          v151 = &v205;
          v152 = &v204;
LABEL_166:
          v153 = [v150 dictionaryWithObjects:v151 forKeys:v152 count:1];
          id *v178 = (id)[v159 initWithDomain:v149 code:2 userInfo:v153];
LABEL_170:

          long long v12 = v174;
        }
LABEL_171:

        unsigned int v25 = 0;
        long long v11 = v175;
        goto LABEL_172;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        unsigned int v26 = v176;
        v17 = v177;
        if (v178)
        {
          id v159 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v149 = *MEMORY[0x1E4F502C8];
          uint64_t v202 = *MEMORY[0x1E4F28568];
          id v141 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"postItnNbest"];
          id v203 = v141;
          v150 = (void *)MEMORY[0x1E4F1C9E8];
          v151 = &v203;
          v152 = &v202;
          goto LABEL_166;
        }
        goto LABEL_171;
      }
      id v141 = v140;
      v142 = [BMDictationUserEditRecognitionResult alloc];
      id v182 = 0;
      v143 = [(BMDictationUserEditRecognitionResult *)v142 initWithJSONDictionary:v141 error:&v182];
      id v144 = v182;
      if (v144)
      {
        v153 = v144;
        if (v178) {
          id *v178 = v144;
        }

        unsigned int v26 = v176;
        v17 = v177;
        goto LABEL_170;
      }
      [v118 addObject:v143];

      ++v139;
      long long v12 = v174;
      if (v157 != v139) {
        continue;
      }
      break;
    }
    v17 = v177;
    long long v11 = v175;
    uint64_t v157 = [v106 countByEnumeratingWithState:&v183 objects:v206 count:16];
    if (v157) {
      continue;
    }
    break;
  }
LABEL_156:

  unsigned int v26 = v176;
  v17 = [(BMDictationUserEdit *)v17 initWithAsrID:v169 interactionID:v176 metadata:v173 startIndex:v171 endIndex:v164 correctedText:v168 recognizedText:v161 recognizedTokens:v180 alternativeSelections:v165 preItnNbest:v96 postItnNbest:v118];
  unsigned int v25 = v17;
LABEL_172:

LABEL_173:
  v177 = v17;

  uint64_t v7 = v172;
LABEL_174:
  v62 = v160;
LABEL_175:

LABEL_176:
  v58 = v171;
  long long v13 = v163;
  a4 = v164;

LABEL_178:
  v81 = v161;
LABEL_179:

  id v8 = v169;
LABEL_180:

LABEL_181:
LABEL_182:

  id v22 = v11;
  v27 = v173;
  self = v177;
LABEL_183:

  long long v11 = v22;
LABEL_184:

LABEL_185:
LABEL_186:

  return v25;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMDictationUserEdit *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_asrID) {
    PBDataWriterWriteStringField();
  }
  if (self->_interactionID) {
    PBDataWriterWriteStringField();
  }
  if (self->_metadata)
  {
    uint64_t v44 = 0;
    PBDataWriterPlaceMark();
    [(BMDictationUserEditRequestMetadata *)self->_metadata writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_hasStartIndex) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasEndIndex) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_correctedText) {
    PBDataWriterWriteStringField();
  }
  if (self->_recognizedText) {
    PBDataWriterWriteStringField();
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v5 = self->_recognizedTokens;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v41;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v41 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v40 objects:v48 count:16];
    }
    while (v7);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v10 = self->_alternativeSelections;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v36 objects:v47 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v37;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v37 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v36 + 1) + 8 * v14);
        uint64_t v44 = 0;
        PBDataWriterPlaceMark();
        [v15 writeTo:v4];
        PBDataWriterRecallMark();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v36 objects:v47 count:16];
    }
    while (v12);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v16 = self->_preItnNbest;
  uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v32 objects:v46 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v33;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v33 != v19) {
          objc_enumerationMutation(v16);
        }
        int v21 = *(void **)(*((void *)&v32 + 1) + 8 * v20);
        uint64_t v44 = 0;
        PBDataWriterPlaceMark();
        [v21 writeTo:v4];
        PBDataWriterRecallMark();
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v32 objects:v46 count:16];
    }
    while (v18);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v22 = self->_postItnNbest;
  uint64_t v23 = [(NSArray *)v22 countByEnumeratingWithState:&v28 objects:v45 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v29;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v29 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = *(void **)(*((void *)&v28 + 1) + 8 * v26);
        uint64_t v44 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v27, "writeTo:", v4, (void)v28);
        PBDataWriterRecallMark();
        ++v26;
      }
      while (v24 != v26);
      uint64_t v24 = [(NSArray *)v22 countByEnumeratingWithState:&v28 objects:v45 count:16];
    }
    while (v24);
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v57.receiver = self;
  v57.super_class = (Class)BMDictationUserEdit;
  uint64_t v5 = [(BMEventBase *)&v57 init];
  if (!v5) {
    goto LABEL_69;
  }
  int v56 = objc_opt_new();
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = objc_opt_new();
  uint64_t v9 = (int *)MEMORY[0x1E4F940E8];
  long long v10 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v11 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    uint64_t v12 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v11]) {
        break;
      }
      char v13 = 0;
      unsigned int v14 = 0;
      unint64_t v15 = 0;
      while (1)
      {
        uint64_t v16 = *v9;
        unint64_t v17 = *(void *)&v4[v16];
        if (v17 == -1 || v17 >= *(void *)&v4[*v10]) {
          break;
        }
        char v18 = *(unsigned char *)(*(void *)&v4[*v12] + v17);
        *(void *)&v4[v16] = v17 + 1;
        v15 |= (unint64_t)(v18 & 0x7F) << v13;
        if ((v18 & 0x80) == 0) {
          goto LABEL_13;
        }
        v13 += 7;
        BOOL v19 = v14++ >= 9;
        if (v19)
        {
          unint64_t v15 = 0;
          int v20 = v4[*v11];
          goto LABEL_15;
        }
      }
      v4[*v11] = 1;
LABEL_13:
      int v20 = v4[*v11];
      if (v4[*v11]) {
        unint64_t v15 = 0;
      }
LABEL_15:
      if (v20 || (v15 & 7) == 4) {
        break;
      }
      switch((v15 >> 3))
      {
        case 1u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 32;
          goto LABEL_43;
        case 2u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 40;
          goto LABEL_43;
        case 3u:
          uint64_t v58 = 0;
          uint64_t v59 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_71;
          }
          uint64_t v24 = [[BMDictationUserEditRequestMetadata alloc] initByReadFrom:v4];
          if (!v24) {
            goto LABEL_71;
          }
          metadata = v5->_metadata;
          v5->_metadata = v24;

          PBReaderRecallMark();
          continue;
        case 4u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          v5->_hasStartIndex = 1;
          while (2)
          {
            uint64_t v29 = *v9;
            unint64_t v30 = *(void *)&v4[v29];
            if (v30 == -1 || v30 >= *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v31 = *(unsigned char *)(*(void *)&v4[*v12] + v30);
              *(void *)&v4[v29] = v30 + 1;
              v28 |= (unint64_t)(v31 & 0x7F) << v26;
              if (v31 < 0)
              {
                v26 += 7;
                BOOL v19 = v27++ >= 9;
                if (v19)
                {
                  LODWORD(v28) = 0;
                  goto LABEL_60;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            LODWORD(v28) = 0;
          }
LABEL_60:
          uint64_t v44 = 24;
          goto LABEL_65;
        case 5u:
          char v32 = 0;
          unsigned int v33 = 0;
          uint64_t v28 = 0;
          v5->_hasEndIndex = 1;
          break;
        case 6u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 56;
          goto LABEL_43;
        case 7u:
          uint64_t v22 = PBReaderReadString();
          uint64_t v23 = 64;
LABEL_43:
          long long v37 = *(Class *)((char *)&v5->super.super.isa + v23);
          *(Class *)((char *)&v5->super.super.isa + v23) = (Class)v22;

          continue;
        case 8u:
          uint64_t v38 = PBReaderReadString();
          if (!v38) {
            goto LABEL_71;
          }
          long long v39 = (void *)v38;
          [v56 addObject:v38];
          goto LABEL_56;
        case 9u:
          uint64_t v58 = 0;
          uint64_t v59 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_71;
          }
          id v40 = [[BMDictationUserEditConfusionPair alloc] initByReadFrom:v4];
          if (!v40) {
            goto LABEL_71;
          }
          long long v39 = v40;
          long long v41 = v6;
          goto LABEL_55;
        case 0xAu:
          uint64_t v58 = 0;
          uint64_t v59 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_71;
          }
          id v42 = [[BMDictationUserEditRecognitionResult alloc] initByReadFrom:v4];
          if (!v42) {
            goto LABEL_71;
          }
          long long v39 = v42;
          long long v41 = v7;
          goto LABEL_55;
        case 0xBu:
          uint64_t v58 = 0;
          uint64_t v59 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_71;
          }
          id v43 = [[BMDictationUserEditRecognitionResult alloc] initByReadFrom:v4];
          if (!v43) {
            goto LABEL_71;
          }
          long long v39 = v43;
          long long v41 = v8;
LABEL_55:
          [v41 addObject:v39];
          PBReaderRecallMark();
LABEL_56:

          continue;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
LABEL_71:

          goto LABEL_68;
      }
      while (1)
      {
        uint64_t v34 = *v9;
        unint64_t v35 = *(void *)&v4[v34];
        if (v35 == -1 || v35 >= *(void *)&v4[*v10]) {
          break;
        }
        char v36 = *(unsigned char *)(*(void *)&v4[*v12] + v35);
        *(void *)&v4[v34] = v35 + 1;
        v28 |= (unint64_t)(v36 & 0x7F) << v32;
        if ((v36 & 0x80) == 0) {
          goto LABEL_62;
        }
        v32 += 7;
        BOOL v19 = v33++ >= 9;
        if (v19)
        {
          LODWORD(v28) = 0;
          goto LABEL_64;
        }
      }
      v4[*v11] = 1;
LABEL_62:
      if (v4[*v11]) {
        LODWORD(v28) = 0;
      }
LABEL_64:
      uint64_t v44 = 28;
LABEL_65:
      *(_DWORD *)((char *)&v5->super.super.isa + v44) = v28;
    }
    while (*(void *)&v4[*v9] < *(void *)&v4[*v10]);
  }
  uint64_t v45 = [v56 copy];
  recognizedTokens = v5->_recognizedTokens;
  v5->_recognizedTokens = (NSArray *)v45;

  uint64_t v47 = [v6 copy];
  alternativeSelections = v5->_alternativeSelections;
  v5->_alternativeSelections = (NSArray *)v47;

  uint64_t v49 = [v7 copy];
  preItnNbest = v5->_preItnNbest;
  v5->_preItnNbest = (NSArray *)v49;

  uint64_t v51 = [v8 copy];
  postItnNbest = v5->_postItnNbest;
  v5->_postItnNbest = (NSArray *)v51;

  int v53 = v4[*v11];
  if (v53) {
LABEL_68:
  }
    v54 = 0;
  else {
LABEL_69:
  }
    v54 = v5;

  return v54;
}

- (NSString)description
{
  id v14 = [NSString alloc];
  uint64_t v16 = [(BMDictationUserEdit *)self asrID];
  uint64_t v3 = [(BMDictationUserEdit *)self interactionID];
  char v13 = [(BMDictationUserEdit *)self metadata];
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDictationUserEdit startIndex](self, "startIndex"));
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMDictationUserEdit endIndex](self, "endIndex"));
  uint64_t v6 = [(BMDictationUserEdit *)self correctedText];
  uint64_t v7 = [(BMDictationUserEdit *)self recognizedText];
  uint64_t v8 = [(BMDictationUserEdit *)self recognizedTokens];
  uint64_t v9 = [(BMDictationUserEdit *)self alternativeSelections];
  long long v10 = [(BMDictationUserEdit *)self preItnNbest];
  uint64_t v11 = [(BMDictationUserEdit *)self postItnNbest];
  id v15 = (id)[v14 initWithFormat:@"BMDictationUserEdit with asrID: %@, interactionID: %@, metadata: %@, startIndex: %@, endIndex: %@, correctedText: %@, recognizedText: %@, recognizedTokens: %@, alternativeSelections: %@, preItnNbest: %@, postItnNbest: %@", v16, v3, v13, v4, v5, v6, v7, v8, v9, v10, v11];

  return (NSString *)v15;
}

- (BMDictationUserEdit)initWithAsrID:(id)a3 interactionID:(id)a4 metadata:(id)a5 startIndex:(id)a6 endIndex:(id)a7 correctedText:(id)a8 recognizedText:(id)a9 recognizedTokens:(id)a10 alternativeSelections:(id)a11 preItnNbest:(id)a12 postItnNbest:(id)a13
{
  id v36 = a3;
  id v29 = a4;
  id v35 = a4;
  id v34 = a5;
  id v18 = a6;
  id v19 = a7;
  id v30 = a8;
  id v33 = a8;
  id v32 = a9;
  id v20 = a10;
  id v21 = a11;
  id v22 = a12;
  id v23 = a13;
  v37.receiver = self;
  v37.super_class = (Class)BMDictationUserEdit;
  uint64_t v24 = [(BMEventBase *)&v37 init];
  if (v24)
  {
    v24->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v24->_asrID, a3);
    objc_storeStrong((id *)&v24->_interactionID, v29);
    objc_storeStrong((id *)&v24->_metadata, a5);
    if (v18)
    {
      v24->_hasStartIndex = 1;
      unsigned int v25 = [v18 unsignedIntValue];
    }
    else
    {
      unsigned int v25 = 0;
      v24->_hasStartIndex = 0;
    }
    v24->_startIndex = v25;
    if (v19)
    {
      v24->_hasEndIndex = 1;
      unsigned int v26 = [v19 unsignedIntValue];
    }
    else
    {
      unsigned int v26 = 0;
      v24->_hasEndIndex = 0;
    }
    v24->_endIndex = v26;
    objc_storeStrong((id *)&v24->_correctedText, v30);
    objc_storeStrong((id *)&v24->_recognizedText, a9);
    objc_storeStrong((id *)&v24->_recognizedTokens, a10);
    objc_storeStrong((id *)&v24->_alternativeSelections, a11);
    objc_storeStrong((id *)&v24->_preItnNbest, a12);
    objc_storeStrong((id *)&v24->_postItnNbest, a13);
  }

  return v24;
}

+ (id)protoFields
{
  v15[11] = *MEMORY[0x1E4F143B8];
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"asrID" number:1 type:13 subMessageClass:0];
  v15[0] = v14;
  char v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"interactionID" number:2 type:13 subMessageClass:0];
  v15[1] = v13;
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"metadata" number:3 type:14 subMessageClass:objc_opt_class()];
  v15[2] = v12;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"startIndex" number:4 type:4 subMessageClass:0];
  v15[3] = v2;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"endIndex" number:5 type:4 subMessageClass:0];
  v15[4] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"correctedText" number:6 type:13 subMessageClass:0];
  v15[5] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"recognizedText" number:7 type:13 subMessageClass:0];
  v15[6] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"recognizedTokens" number:8 type:13 subMessageClass:0];
  v15[7] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"alternativeSelections" number:9 type:14 subMessageClass:objc_opt_class()];
  v15[8] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"preItnNbest" number:10 type:14 subMessageClass:objc_opt_class()];
  v15[9] = v8;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"postItnNbest" number:11 type:14 subMessageClass:objc_opt_class()];
  v15[10] = v9;
  long long v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:11];

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF70E0;
}

id __30__BMDictationUserEdit_columns__block_invoke_5(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 _postItnNbestJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __30__BMDictationUserEdit_columns__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 _preItnNbestJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __30__BMDictationUserEdit_columns__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 _alternativeSelectionsJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __30__BMDictationUserEdit_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 _recognizedTokensJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __30__BMDictationUserEdit_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 metadata];
  id v4 = [v3 jsonDictionary];
  uint64_t v5 = BMConvertObjectToJSONString();

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
    uint64_t v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    uint64_t v8 = [[BMDictationUserEdit alloc] initByReadFrom:v7];
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