@interface BMTextUnderstandingPoemBuffer
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMTextUnderstandingPoemBuffer)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMTextUnderstandingPoemBuffer)initWithMessageTimestamp:(id)a3 conversationId:(id)a4 spotlightId:(id)a5 photoAttachment:(id)a6 extractions:(id)a7 continuousFeatures:(id)a8 rawMessage:(id)a9;
- (BMTextUnderstandingPoemBuffer)initWithMessageTimestamp:(id)a3 conversationId:(id)a4 spotlightId:(id)a5 photoAttachment:(id)a6 extractions:(id)a7 continuousFeatures:(id)a8 rawMessage:(id)a9 senderId:(id)a10;
- (BOOL)hasPhotoAttachment;
- (BOOL)isEqual:(id)a3;
- (BOOL)photoAttachment;
- (NSArray)continuousFeatures;
- (NSArray)extractions;
- (NSDate)messageTimestamp;
- (NSString)conversationId;
- (NSString)description;
- (NSString)rawMessage;
- (NSString)senderId;
- (NSString)spotlightId;
- (id)_continuousFeaturesJSONArray;
- (id)_extractionsJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)setHasPhotoAttachment:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMTextUnderstandingPoemBuffer

+ (id)columns
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"messageTimestamp" dataType:3 requestOnly:0 fieldNumber:1 protoDataType:0 convertedType:2];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"conversationId" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"spotlightId" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"photoAttachment" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:12 convertedType:0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"extractions_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_245];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"continuousFeatures_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_247];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"rawMessage" dataType:2 requestOnly:0 fieldNumber:7 protoDataType:13 convertedType:0];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"senderId" dataType:2 requestOnly:0 fieldNumber:8 protoDataType:13 convertedType:0];
  v12[0] = v2;
  v12[1] = v3;
  v12[2] = v4;
  v12[3] = v5;
  v12[4] = v6;
  v12[5] = v7;
  v12[6] = v8;
  v12[7] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:8];

  return v10;
}

- (BMTextUnderstandingPoemBuffer)initWithMessageTimestamp:(id)a3 conversationId:(id)a4 spotlightId:(id)a5 photoAttachment:(id)a6 extractions:(id)a7 continuousFeatures:(id)a8 rawMessage:(id)a9
{
  return [(BMTextUnderstandingPoemBuffer *)self initWithMessageTimestamp:a3 conversationId:a4 spotlightId:a5 photoAttachment:a6 extractions:a7 continuousFeatures:a8 rawMessage:a9 senderId:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderId, 0);
  objc_storeStrong((id *)&self->_rawMessage, 0);
  objc_storeStrong((id *)&self->_continuousFeatures, 0);
  objc_storeStrong((id *)&self->_extractions, 0);
  objc_storeStrong((id *)&self->_spotlightId, 0);

  objc_storeStrong((id *)&self->_conversationId, 0);
}

- (NSString)senderId
{
  return self->_senderId;
}

- (NSString)rawMessage
{
  return self->_rawMessage;
}

- (NSArray)continuousFeatures
{
  return self->_continuousFeatures;
}

- (NSArray)extractions
{
  return self->_extractions;
}

- (void)setHasPhotoAttachment:(BOOL)a3
{
  self->_hasPhotoAttachment = a3;
}

- (BOOL)hasPhotoAttachment
{
  return self->_hasPhotoAttachment;
}

- (BOOL)photoAttachment
{
  return self->_photoAttachment;
}

- (NSString)spotlightId
{
  return self->_spotlightId;
}

- (NSString)conversationId
{
  return self->_conversationId;
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
    v6 = [(BMTextUnderstandingPoemBuffer *)self messageTimestamp];
    uint64_t v7 = [v5 messageTimestamp];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMTextUnderstandingPoemBuffer *)self messageTimestamp];
      v10 = [v5 messageTimestamp];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_30;
      }
    }
    v13 = [(BMTextUnderstandingPoemBuffer *)self conversationId];
    uint64_t v14 = [v5 conversationId];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMTextUnderstandingPoemBuffer *)self conversationId];
      v17 = [v5 conversationId];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_30;
      }
    }
    v19 = [(BMTextUnderstandingPoemBuffer *)self spotlightId];
    uint64_t v20 = [v5 spotlightId];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMTextUnderstandingPoemBuffer *)self spotlightId];
      v23 = [v5 spotlightId];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_30;
      }
    }
    if ([(BMTextUnderstandingPoemBuffer *)self hasPhotoAttachment]
      || [v5 hasPhotoAttachment])
    {
      if (![(BMTextUnderstandingPoemBuffer *)self hasPhotoAttachment]) {
        goto LABEL_30;
      }
      if (![v5 hasPhotoAttachment]) {
        goto LABEL_30;
      }
      int v25 = [(BMTextUnderstandingPoemBuffer *)self photoAttachment];
      if (v25 != [v5 photoAttachment]) {
        goto LABEL_30;
      }
    }
    v26 = [(BMTextUnderstandingPoemBuffer *)self extractions];
    uint64_t v27 = [v5 extractions];
    if (v26 == (void *)v27)
    {
    }
    else
    {
      v28 = (void *)v27;
      v29 = [(BMTextUnderstandingPoemBuffer *)self extractions];
      v30 = [v5 extractions];
      int v31 = [v29 isEqual:v30];

      if (!v31) {
        goto LABEL_30;
      }
    }
    v32 = [(BMTextUnderstandingPoemBuffer *)self continuousFeatures];
    uint64_t v33 = [v5 continuousFeatures];
    if (v32 == (void *)v33)
    {
    }
    else
    {
      v34 = (void *)v33;
      v35 = [(BMTextUnderstandingPoemBuffer *)self continuousFeatures];
      v36 = [v5 continuousFeatures];
      int v37 = [v35 isEqual:v36];

      if (!v37) {
        goto LABEL_30;
      }
    }
    v38 = [(BMTextUnderstandingPoemBuffer *)self rawMessage];
    uint64_t v39 = [v5 rawMessage];
    if (v38 == (void *)v39)
    {
    }
    else
    {
      v40 = (void *)v39;
      v41 = [(BMTextUnderstandingPoemBuffer *)self rawMessage];
      v42 = [v5 rawMessage];
      int v43 = [v41 isEqual:v42];

      if (!v43)
      {
LABEL_30:
        char v12 = 0;
LABEL_31:

        goto LABEL_32;
      }
    }
    v45 = [(BMTextUnderstandingPoemBuffer *)self senderId];
    v46 = [v5 senderId];
    if (v45 == v46)
    {
      char v12 = 1;
    }
    else
    {
      v47 = [(BMTextUnderstandingPoemBuffer *)self senderId];
      v48 = [v5 senderId];
      char v12 = [v47 isEqual:v48];
    }
    goto LABEL_31;
  }
  char v12 = 0;
LABEL_32:

  return v12;
}

- (NSDate)messageTimestamp
{
  if (self->_hasRaw_messageTimestamp)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_messageTimestamp];
    id v4 = [v2 convertValue:v3 toType:2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (id)jsonDictionary
{
  v30[8] = *MEMORY[0x1E4F143B8];
  v3 = [(BMTextUnderstandingPoemBuffer *)self messageTimestamp];
  if (v3)
  {
    id v4 = NSNumber;
    id v5 = [(BMTextUnderstandingPoemBuffer *)self messageTimestamp];
    [v5 timeIntervalSince1970];
    uint64_t v6 = objc_msgSend(v4, "numberWithDouble:");
  }
  else
  {
    uint64_t v6 = 0;
  }

  uint64_t v7 = [(BMTextUnderstandingPoemBuffer *)self conversationId];
  v8 = [(BMTextUnderstandingPoemBuffer *)self spotlightId];
  if ([(BMTextUnderstandingPoemBuffer *)self hasPhotoAttachment])
  {
    v28 = objc_msgSend(NSNumber, "numberWithBool:", -[BMTextUnderstandingPoemBuffer photoAttachment](self, "photoAttachment"));
  }
  else
  {
    v28 = 0;
  }
  v9 = [(BMTextUnderstandingPoemBuffer *)self _extractionsJSONArray];
  v10 = [(BMTextUnderstandingPoemBuffer *)self _continuousFeaturesJSONArray];
  int v11 = [(BMTextUnderstandingPoemBuffer *)self rawMessage];
  char v12 = [(BMTextUnderstandingPoemBuffer *)self senderId];
  v29[0] = @"messageTimestamp";
  uint64_t v13 = v6;
  if (!v6)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  int v24 = (void *)v13;
  v30[0] = v13;
  v29[1] = @"conversationId";
  uint64_t v14 = v7;
  if (!v7)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v23 = (void *)v14;
  v30[1] = v14;
  v29[2] = @"spotlightId";
  uint64_t v15 = (uint64_t)v8;
  if (!v8)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v22 = (void *)v15;
  v30[2] = v15;
  v29[3] = @"photoAttachment";
  v16 = v28;
  if (!v28)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v27 = (void *)v6;
  v30[3] = v16;
  v29[4] = @"extractions";
  v17 = v9;
  if (!v9)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v26 = (void *)v7;
  v30[4] = v17;
  v29[5] = @"continuousFeatures";
  int v18 = v10;
  if (!v10)
  {
    int v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v30[5] = v18;
  v29[6] = @"rawMessage";
  v19 = v11;
  if (!v11)
  {
    v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v30[6] = v19;
  v29[7] = @"senderId";
  uint64_t v20 = v12;
  if (!v12)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v30[7] = v20;
  id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:8];
  if (v12)
  {
    if (v11) {
      goto LABEL_25;
    }
LABEL_36:

    if (v10) {
      goto LABEL_26;
    }
    goto LABEL_37;
  }

  if (!v11) {
    goto LABEL_36;
  }
LABEL_25:
  if (v10) {
    goto LABEL_26;
  }
LABEL_37:

LABEL_26:
  if (!v9) {

  }
  if (v28)
  {
    if (v8) {
      goto LABEL_30;
    }
  }
  else
  {

    if (v8)
    {
LABEL_30:
      if (v26) {
        goto LABEL_31;
      }
LABEL_40:

      if (v27) {
        goto LABEL_32;
      }
      goto LABEL_41;
    }
  }

  if (!v26) {
    goto LABEL_40;
  }
LABEL_31:
  if (v27) {
    goto LABEL_32;
  }
LABEL_41:

LABEL_32:

  return v25;
}

- (id)_continuousFeaturesJSONArray
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(BMTextUnderstandingPoemBuffer *)self continuousFeatures];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        [v9 doubleValue];
        if (fabs(v10) == INFINITY)
        {
          int v11 = [MEMORY[0x1E4F1CA98] null];
          [v3 addObject:v11];
        }
        else
        {
          [v9 doubleValue];
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_extractionsJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMTextUnderstandingPoemBuffer *)self extractions];
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

- (BMTextUnderstandingPoemBuffer)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v165[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"messageTimestamp"];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v7 = 0;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = (objc_class *)MEMORY[0x1E4F1C9C8];
    id v9 = v6;
    id v10 = [v8 alloc];
    [v9 doubleValue];
    double v12 = v11;

    id v13 = (id)[v10 initWithTimeIntervalSince1970:v12];
LABEL_6:
    uint64_t v7 = v13;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        uint64_t v7 = 0;
        v47 = 0;
        goto LABEL_110;
      }
      id v87 = objc_alloc(MEMORY[0x1E4F28C58]);
      v88 = v6;
      uint64_t v89 = *MEMORY[0x1E4F502C8];
      uint64_t v164 = *MEMORY[0x1E4F28568];
      v90 = self;
      id v91 = [NSString alloc];
      uint64_t v107 = objc_opt_class();
      v92 = v91;
      self = v90;
      v46 = (void *)[v92 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", v107, @"messageTimestamp"];
      v165[0] = v46;
      uint64_t v93 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v165 forKeys:&v164 count:1];
      uint64_t v94 = v89;
      uint64_t v6 = v88;
      v127 = (void *)v93;
      id v95 = (id)objc_msgSend(v87, "initWithDomain:code:userInfo:", v94, 2);
      uint64_t v7 = 0;
      v47 = 0;
      *a4 = v95;
      goto LABEL_109;
    }
    id v13 = v6;
    goto LABEL_6;
  }
  id v14 = objc_alloc_init(MEMORY[0x1E4F28D48]);
  uint64_t v7 = [v14 dateFromString:v6];

LABEL_9:
  uint64_t v15 = [v5 objectForKeyedSubscript:@"conversationId"];
  v127 = (void *)v15;
  if (!v15 || (uint64_t v16 = (void *)v15, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v124 = 0;
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v124 = v16;
LABEL_12:
    uint64_t v17 = [v5 objectForKeyedSubscript:@"spotlightId"];
    v126 = (void *)v17;
    if (!v17 || (uint64_t v18 = (void *)v17, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v19 = 0;
      goto LABEL_15;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v19 = v18;
LABEL_15:
      uint64_t v20 = [v5 objectForKeyedSubscript:@"photoAttachment"];
      v122 = v7;
      if (!v20 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v119 = v20;
        v120 = v6;
        id v123 = 0;
LABEL_18:
        id v21 = [v5 objectForKeyedSubscript:@"extractions"];
        v22 = [MEMORY[0x1E4F1CA98] null];
        int v23 = [v21 isEqual:v22];

        v121 = self;
        if (v23)
        {
          v115 = v5;
          id v116 = v19;

          id v21 = 0;
LABEL_25:
          v129 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v21, "count"));
          long long v136 = 0u;
          long long v137 = 0u;
          long long v138 = 0u;
          long long v139 = 0u;
          id v21 = v21;
          uint64_t v24 = [v21 countByEnumeratingWithState:&v136 objects:v155 count:16];
          if (!v24) {
            goto LABEL_35;
          }
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v137;
          while (1)
          {
            for (uint64_t i = 0; i != v25; ++i)
            {
              if (*(void *)v137 != v26) {
                objc_enumerationMutation(v21);
              }
              v28 = *(void **)(*((void *)&v136 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v62 = a4;
                if (a4)
                {
                  id v63 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v64 = *MEMORY[0x1E4F502C8];
                  uint64_t v153 = *MEMORY[0x1E4F28568];
                  id v29 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"extractions"];
                  id v154 = v29;
                  v65 = (void *)MEMORY[0x1E4F1C9E8];
                  v66 = &v154;
                  v67 = &v153;
LABEL_51:
                  id v68 = [v65 dictionaryWithObjects:v66 forKeys:v67 count:1];
                  id v69 = (id)[v63 initWithDomain:v64 code:2 userInfo:v68];
                  v47 = 0;
                  id *v62 = v69;
                  id v33 = v21;
                  id v5 = v115;
                  goto LABEL_86;
                }
LABEL_73:
                v47 = 0;
                id v33 = v21;
                id v5 = v115;
                self = v121;
                v46 = v124;
                goto LABEL_74;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v62 = a4;
                if (a4)
                {
                  id v63 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v64 = *MEMORY[0x1E4F502C8];
                  uint64_t v151 = *MEMORY[0x1E4F28568];
                  id v29 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"extractions"];
                  id v152 = v29;
                  v65 = (void *)MEMORY[0x1E4F1C9E8];
                  v66 = &v152;
                  v67 = &v151;
                  goto LABEL_51;
                }
                goto LABEL_73;
              }
              id v29 = v28;
              v30 = [BMTextUnderstandingPoemBufferExtraction alloc];
              id v135 = 0;
              int v31 = [(BMTextUnderstandingPoemBufferExtraction *)v30 initWithJSONDictionary:v29 error:&v135];
              id v32 = v135;
              if (v32)
              {
                id v68 = v32;
                v55 = v119;
                if (a4) {
                  *a4 = v32;
                }

                v47 = 0;
                id v33 = v21;
                id v5 = v115;
                id v19 = v116;
                self = v121;
                v46 = v124;
                goto LABEL_103;
              }
              [v129 addObject:v31];
            }
            uint64_t v25 = [v21 countByEnumeratingWithState:&v136 objects:v155 count:16];
            if (!v25)
            {
LABEL_35:

              id v5 = v115;
              id v33 = [v115 objectForKeyedSubscript:@"continuousFeatures"];
              v34 = [MEMORY[0x1E4F1CA98] null];
              int v35 = [v33 isEqual:v34];

              if (v35)
              {

                id v33 = 0;
                self = v121;
LABEL_57:
                id v29 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v33, "count"));
                long long v131 = 0u;
                long long v132 = 0u;
                long long v133 = 0u;
                long long v134 = 0u;
                id v33 = v33;
                uint64_t v70 = [v33 countByEnumeratingWithState:&v131 objects:v148 count:16];
                if (!v70) {
                  goto LABEL_66;
                }
                uint64_t v71 = v70;
                uint64_t v72 = *(void *)v132;
LABEL_59:
                uint64_t v73 = 0;
                while (1)
                {
                  if (*(void *)v132 != v72) {
                    objc_enumerationMutation(v33);
                  }
                  uint64_t v74 = *(void *)(*((void *)&v131 + 1) + 8 * v73);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    break;
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    v79 = a4;
                    if (a4)
                    {
                      id v85 = objc_alloc(MEMORY[0x1E4F28C58]);
                      uint64_t v86 = *MEMORY[0x1E4F502C8];
                      uint64_t v144 = *MEMORY[0x1E4F28568];
                      v113 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"continuousFeatures"];
                      v145 = v113;
                      uint64_t v82 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v145 forKeys:&v144 count:1];
                      v83 = v85;
                      uint64_t v84 = v86;
                      goto LABEL_81;
                    }
                    goto LABEL_85;
                  }
                  [v29 addObject:v74];
                  if (v71 == ++v73)
                  {
                    uint64_t v71 = [v33 countByEnumeratingWithState:&v131 objects:v148 count:16];
                    self = v121;
                    if (v71) {
                      goto LABEL_59;
                    }
LABEL_66:

                    uint64_t v75 = [v115 objectForKeyedSubscript:@"rawMessage"];
                    v113 = (void *)v75;
                    if (!v75)
                    {
                      id v68 = 0;
                      v46 = v124;
                      goto LABEL_94;
                    }
                    v76 = (void *)v75;
                    objc_opt_class();
                    v46 = v124;
                    if (objc_opt_isKindOfClass())
                    {
                      id v68 = 0;
                      goto LABEL_94;
                    }
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v68 = v76;
LABEL_94:
                      id v19 = v116;
                      id v98 = [v115 objectForKeyedSubscript:@"senderId"];
                      v109 = v98;
                      if (v98)
                      {
                        v99 = v98;
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          id v98 = 0;
                          goto LABEL_99;
                        }
                        v100 = v116;
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          id v98 = v99;
                          goto LABEL_99;
                        }
                        if (a4)
                        {
                          id v125 = objc_alloc(MEMORY[0x1E4F28C58]);
                          uint64_t v118 = *MEMORY[0x1E4F502C8];
                          uint64_t v140 = *MEMORY[0x1E4F28568];
                          v104 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"senderId"];
                          v141 = v104;
                          v105 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v141 forKeys:&v140 count:1];
                          *a4 = (id)[v125 initWithDomain:v118 code:2 userInfo:v105];
                        }
                        v112 = 0;
                        v47 = 0;
                        id v19 = v100;
                      }
                      else
                      {
LABEL_99:
                        v112 = v98;
                        self = [(BMTextUnderstandingPoemBuffer *)self initWithMessageTimestamp:v122 conversationId:v46 spotlightId:v116 photoAttachment:v123 extractions:v129 continuousFeatures:v29 rawMessage:v68 senderId:v98];
                        v47 = self;
                      }
LABEL_100:
                      v55 = v119;
                    }
                    else
                    {
                      if (a4)
                      {
                        id v110 = objc_alloc(MEMORY[0x1E4F28C58]);
                        uint64_t v108 = *MEMORY[0x1E4F502C8];
                        uint64_t v142 = *MEMORY[0x1E4F28568];
                        v112 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"rawMessage"];
                        v143 = v112;
                        uint64_t v102 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v143 forKeys:&v142 count:1];
                        v103 = v110;
                        v109 = (void *)v102;
                        v47 = 0;
                        id v68 = 0;
                        *a4 = (id)objc_msgSend(v103, "initWithDomain:code:userInfo:", v108, 2);
                        id v19 = v116;
                        goto LABEL_100;
                      }
                      id v68 = 0;
                      v47 = 0;
                      id v19 = v116;
                      v55 = v119;
                    }
LABEL_102:

LABEL_103:
LABEL_104:

                    uint64_t v6 = v120;
                    goto LABEL_106;
                  }
                }
                v79 = a4;
                if (a4)
                {
                  id v80 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v81 = *MEMORY[0x1E4F502C8];
                  uint64_t v146 = *MEMORY[0x1E4F28568];
                  v113 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"continuousFeatures"];
                  v147 = v113;
                  uint64_t v82 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v147 forKeys:&v146 count:1];
                  v83 = v80;
                  uint64_t v84 = v81;
LABEL_81:
                  v111 = (void *)v82;
                  self = v121;
                  v46 = v124;
                  v55 = v119;
                  v47 = 0;
                  id *v79 = (id)objc_msgSend(v83, "initWithDomain:code:userInfo:", v84, 2);
                  id v68 = v33;
                  id v19 = v116;

                  goto LABEL_102;
                }
LABEL_85:
                v47 = 0;
                id v68 = v33;
LABEL_86:
                self = v121;
                v46 = v124;
LABEL_87:
                id v19 = v116;
                v55 = v119;
                goto LABEL_103;
              }
              self = v121;
              if (!v33) {
                goto LABEL_57;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                goto LABEL_57;
              }
              v46 = v124;
              if (a4)
              {
                id v114 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v96 = *MEMORY[0x1E4F502C8];
                uint64_t v149 = *MEMORY[0x1E4F28568];
                id v29 = (id)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"continuousFeatures"];
                id v150 = v29;
                id v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v150 forKeys:&v149 count:1];
                id v97 = (id)[v114 initWithDomain:v96 code:2 userInfo:v68];
                v47 = 0;
                *a4 = v97;
                goto LABEL_87;
              }
              v47 = 0;
LABEL_74:
              id v19 = v116;
              v55 = v119;
              goto LABEL_104;
            }
          }
        }
        if (!v21 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v115 = v5;
          id v116 = v19;
          goto LABEL_25;
        }
        if (a4)
        {
          id v77 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v78 = *MEMORY[0x1E4F502C8];
          uint64_t v156 = *MEMORY[0x1E4F28568];
          v129 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"extractions"];
          v157 = v129;
          id v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v157 forKeys:&v156 count:1];
          v47 = 0;
          *a4 = (id)[v77 initWithDomain:v78 code:2 userInfo:v33];
          v46 = v124;
          v55 = v119;
          goto LABEL_104;
        }
        v47 = 0;
        v46 = v124;
        v55 = v119;
        uint64_t v6 = v120;
LABEL_106:

        uint64_t v7 = v122;
        goto LABEL_107;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v119 = v20;
        v120 = v6;
        id v123 = v20;
        goto LABEL_18;
      }
      if (a4)
      {
        id v117 = v19;
        v56 = v6;
        id v57 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v58 = *MEMORY[0x1E4F502C8];
        uint64_t v158 = *MEMORY[0x1E4F28568];
        id v21 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"photoAttachment"];
        id v159 = v21;
        uint64_t v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v159 forKeys:&v158 count:1];
        v60 = v57;
        uint64_t v6 = v56;
        id v19 = v117;
        v130 = (void *)v59;
        id v61 = (id)objc_msgSend(v60, "initWithDomain:code:userInfo:", v58, 2);
        id v123 = 0;
        v47 = 0;
        *a4 = v61;
        v55 = v20;
        v46 = v124;

        goto LABEL_106;
      }
      id v123 = 0;
      v47 = 0;
      v46 = v124;
      v55 = v20;
LABEL_107:

      goto LABEL_108;
    }
    if (a4)
    {
      v48 = v7;
      id v49 = objc_alloc(MEMORY[0x1E4F28C58]);
      v50 = v6;
      uint64_t v51 = *MEMORY[0x1E4F502C8];
      uint64_t v160 = *MEMORY[0x1E4F28568];
      id v123 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"spotlightId"];
      id v161 = v123;
      uint64_t v52 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v161 forKeys:&v160 count:1];
      v53 = v49;
      uint64_t v7 = v48;
      uint64_t v54 = v51;
      uint64_t v6 = v50;
      v55 = (void *)v52;
      id v19 = 0;
      v47 = 0;
      *a4 = (id)[v53 initWithDomain:v54 code:2 userInfo:v52];
      v46 = v124;
      goto LABEL_107;
    }
    id v19 = 0;
    v47 = 0;
    v46 = v124;
LABEL_108:

    goto LABEL_109;
  }
  if (a4)
  {
    v36 = v7;
    id v37 = objc_alloc(MEMORY[0x1E4F28C58]);
    v38 = v6;
    uint64_t v39 = *MEMORY[0x1E4F502C8];
    uint64_t v162 = *MEMORY[0x1E4F28568];
    id v40 = v5;
    id v41 = [NSString alloc];
    uint64_t v106 = objc_opt_class();
    v42 = v41;
    id v5 = v40;
    id v19 = (id)[v42 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v106, @"conversationId"];
    id v163 = v19;
    uint64_t v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v163 forKeys:&v162 count:1];
    v44 = v37;
    uint64_t v7 = v36;
    uint64_t v45 = v39;
    uint64_t v6 = v38;
    v126 = (void *)v43;
    v46 = 0;
    v47 = 0;
    *a4 = (id)objc_msgSend(v44, "initWithDomain:code:userInfo:", v45, 2);
    goto LABEL_108;
  }
  v46 = 0;
  v47 = 0;
LABEL_109:

LABEL_110:
  return v47;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMTextUnderstandingPoemBuffer *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_hasRaw_messageTimestamp) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_conversationId) {
    PBDataWriterWriteStringField();
  }
  if (self->_spotlightId) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasPhotoAttachment) {
    PBDataWriterWriteBOOLField();
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = self->_extractions;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v21 + 1) + 8 * v9);
        uint64_t v20 = 0;
        PBDataWriterPlaceMark();
        [v10 writeTo:v4];
        PBDataWriterRecallMark();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  double v11 = self->_continuousFeatures;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v16 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v15), "doubleValue", (void)v16);
        PBDataWriterWriteDoubleField();
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v16 objects:v25 count:16];
    }
    while (v13);
  }

  if (self->_rawMessage) {
    PBDataWriterWriteStringField();
  }
  if (self->_senderId) {
    PBDataWriterWriteStringField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)BMTextUnderstandingPoemBuffer;
  id v5 = [(BMEventBase *)&v50 init];
  if (!v5) {
    goto LABEL_56;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v9 = (int *)MEMORY[0x1E4F940E0];
  id v10 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    double v11 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v10]) {
        break;
      }
      char v12 = 0;
      unsigned int v13 = 0;
      unint64_t v14 = 0;
      while (1)
      {
        uint64_t v15 = *v8;
        uint64_t v16 = *(void *)&v4[v15];
        unint64_t v17 = v16 + 1;
        if (v16 == -1 || v17 > *(void *)&v4[*v9]) {
          break;
        }
        char v18 = *(unsigned char *)(*(void *)&v4[*v11] + v16);
        *(void *)&v4[v15] = v17;
        v14 |= (unint64_t)(v18 & 0x7F) << v12;
        if ((v18 & 0x80) == 0) {
          goto LABEL_13;
        }
        v12 += 7;
        BOOL v19 = v13++ >= 9;
        if (v19)
        {
          unint64_t v14 = 0;
          uint64_t v20 = *v10;
          int v21 = v4[v20];
          goto LABEL_15;
        }
      }
      v4[*v10] = 1;
LABEL_13:
      uint64_t v20 = *v10;
      int v21 = v4[v20];
      if (v4[v20]) {
        unint64_t v14 = 0;
      }
LABEL_15:
      if (v21 || (v14 & 7) == 4) {
        break;
      }
      switch((v14 >> 3))
      {
        case 1u:
          v5->_hasRaw_messageTimestamp = 1;
          uint64_t v23 = *v8;
          unint64_t v24 = *(void *)&v4[v23];
          if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(void *)&v4[*v9])
          {
            double v25 = *(double *)(*(void *)&v4[*v11] + v24);
            *(void *)&v4[v23] = v24 + 8;
          }
          else
          {
            v4[*v10] = 1;
            double v25 = 0.0;
          }
          v5->_raw_messageTimestamp = v25;
          continue;
        case 2u:
          uint64_t v26 = PBReaderReadString();
          uint64_t v27 = 40;
          goto LABEL_42;
        case 3u:
          uint64_t v26 = PBReaderReadString();
          uint64_t v27 = 48;
          goto LABEL_42;
        case 4u:
          char v28 = 0;
          unsigned int v29 = 0;
          uint64_t v30 = 0;
          v5->_hasPhotoAttachment = 1;
          break;
        case 5u:
          uint64_t v51 = 0;
          uint64_t v52 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_58;
          }
          id v35 = [[BMTextUnderstandingPoemBufferExtraction alloc] initByReadFrom:v4];
          if (!v35) {
            goto LABEL_58;
          }
          v36 = v35;
          [v6 addObject:v35];
          PBReaderRecallMark();
          goto LABEL_52;
        case 6u:
          id v37 = NSNumber;
          uint64_t v38 = *v8;
          unint64_t v39 = *(void *)&v4[v38];
          if (v39 <= 0xFFFFFFFFFFFFFFF7 && v39 + 8 <= *(void *)&v4[*v9])
          {
            double v40 = *(double *)(*(void *)&v4[*v11] + v39);
            *(void *)&v4[v38] = v39 + 8;
          }
          else
          {
            v4[v20] = 1;
            double v40 = 0.0;
          }
          uint64_t v42 = [v37 numberWithDouble:v40];
          if (!v42) {
            goto LABEL_58;
          }
          v36 = (void *)v42;
          [v7 addObject:v42];
LABEL_52:

          continue;
        case 7u:
          uint64_t v26 = PBReaderReadString();
          uint64_t v27 = 72;
          goto LABEL_42;
        case 8u:
          uint64_t v26 = PBReaderReadString();
          uint64_t v27 = 80;
LABEL_42:
          id v41 = *(Class *)((char *)&v5->super.super.isa + v27);
          *(Class *)((char *)&v5->super.super.isa + v27) = (Class)v26;

          continue;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
LABEL_58:

          goto LABEL_55;
      }
      while (1)
      {
        uint64_t v31 = *v8;
        uint64_t v32 = *(void *)&v4[v31];
        unint64_t v33 = v32 + 1;
        if (v32 == -1 || v33 > *(void *)&v4[*v9]) {
          break;
        }
        char v34 = *(unsigned char *)(*(void *)&v4[*v11] + v32);
        *(void *)&v4[v31] = v33;
        v30 |= (unint64_t)(v34 & 0x7F) << v28;
        if ((v34 & 0x80) == 0) {
          goto LABEL_44;
        }
        v28 += 7;
        BOOL v19 = v29++ >= 9;
        if (v19)
        {
          uint64_t v30 = 0;
          goto LABEL_46;
        }
      }
      v4[*v10] = 1;
LABEL_44:
      if (v4[*v10]) {
        uint64_t v30 = 0;
      }
LABEL_46:
      v5->_photoAttachment = v30 != 0;
    }
    while (*(void *)&v4[*v8] < *(void *)&v4[*v9]);
  }
  uint64_t v43 = [v6 copy];
  extractions = v5->_extractions;
  v5->_extractions = (NSArray *)v43;

  uint64_t v45 = [v7 copy];
  continuousFeatures = v5->_continuousFeatures;
  v5->_continuousFeatures = (NSArray *)v45;

  int v47 = v4[*v10];
  if (v47) {
LABEL_55:
  }
    v48 = 0;
  else {
LABEL_56:
  }
    v48 = v5;

  return v48;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMTextUnderstandingPoemBuffer *)self messageTimestamp];
  id v5 = [(BMTextUnderstandingPoemBuffer *)self conversationId];
  uint64_t v6 = [(BMTextUnderstandingPoemBuffer *)self spotlightId];
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[BMTextUnderstandingPoemBuffer photoAttachment](self, "photoAttachment"));
  uint64_t v8 = [(BMTextUnderstandingPoemBuffer *)self extractions];
  uint64_t v9 = [(BMTextUnderstandingPoemBuffer *)self continuousFeatures];
  id v10 = [(BMTextUnderstandingPoemBuffer *)self rawMessage];
  double v11 = [(BMTextUnderstandingPoemBuffer *)self senderId];
  char v12 = (void *)[v3 initWithFormat:@"BMTextUnderstandingPoemBuffer with messageTimestamp: %@, conversationId: %@, spotlightId: %@, photoAttachment: %@, extractions: %@, continuousFeatures: %@, rawMessage: %@, senderId: %@", v4, v5, v6, v7, v8, v9, v10, v11];

  return (NSString *)v12;
}

- (BMTextUnderstandingPoemBuffer)initWithMessageTimestamp:(id)a3 conversationId:(id)a4 spotlightId:(id)a5 photoAttachment:(id)a6 extractions:(id)a7 continuousFeatures:(id)a8 rawMessage:(id)a9 senderId:(id)a10
{
  id v16 = a3;
  id v26 = a4;
  id v25 = a5;
  id v17 = a6;
  id v24 = a7;
  id v23 = a8;
  id v22 = a9;
  id v21 = a10;
  v27.receiver = self;
  v27.super_class = (Class)BMTextUnderstandingPoemBuffer;
  char v18 = [(BMEventBase *)&v27 init];
  if (v18)
  {
    v18->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v16)
    {
      v18->_hasRaw_messageTimestamp = 1;
      [v16 timeIntervalSince1970];
    }
    else
    {
      v18->_hasRaw_messageTimestamp = 0;
      double v19 = -1.0;
    }
    v18->_raw_messageTimestamp = v19;
    objc_storeStrong((id *)&v18->_conversationId, a4);
    objc_storeStrong((id *)&v18->_spotlightId, a5);
    if (v17)
    {
      v18->_hasPhotoAttachment = 1;
      v18->_photoAttachment = [v17 BOOLValue];
    }
    else
    {
      v18->_hasPhotoAttachment = 0;
      v18->_photoAttachment = 0;
    }
    objc_storeStrong((id *)&v18->_extractions, a7);
    objc_storeStrong((id *)&v18->_continuousFeatures, a8);
    objc_storeStrong((id *)&v18->_rawMessage, a9);
    objc_storeStrong((id *)&v18->_senderId, a10);
  }

  return v18;
}

+ (id)protoFields
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"messageTimestamp" number:1 type:0 subMessageClass:0];
  v12[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"conversationId" number:2 type:13 subMessageClass:0];
  v12[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"spotlightId" number:3 type:13 subMessageClass:0];
  v12[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"photoAttachment" number:4 type:12 subMessageClass:0];
  v12[3] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"extractions" number:5 type:14 subMessageClass:objc_opt_class()];
  v12[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"continuousFeatures" number:6 type:0 subMessageClass:0];
  v12[5] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"rawMessage" number:7 type:13 subMessageClass:0];
  v12[6] = v8;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"senderId" number:8 type:13 subMessageClass:0];
  v12[7] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:8];

  return v10;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF46B0;
}

id __40__BMTextUnderstandingPoemBuffer_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _continuousFeaturesJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __40__BMTextUnderstandingPoemBuffer_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _extractionsJSONArray];
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

    uint64_t v8 = [[BMTextUnderstandingPoemBuffer alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[9] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end