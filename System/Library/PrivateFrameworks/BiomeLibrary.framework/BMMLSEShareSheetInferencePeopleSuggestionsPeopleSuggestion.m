@interface BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion)initWithIdentifier:(id)a3 model:(id)a4 modelIdentifier:(id)a5 transportBundleId:(id)a6 rank:(id)a7 score:(id)a8;
- (BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier)modelIdentifier;
- (BOOL)hasRank;
- (BOOL)hasScore;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)identifier;
- (NSString)model;
- (NSString)transportBundleId;
- (double)score;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (unsigned)rank;
- (void)setHasRank:(BOOL)a3;
- (void)setHasScore:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_transportBundleId, 0);
  objc_storeStrong((id *)&self->_modelIdentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSString)model
{
  return self->_model;
}

- (void)setHasScore:(BOOL)a3
{
  self->_hasScore = a3;
}

- (BOOL)hasScore
{
  return self->_hasScore;
}

- (double)score
{
  return self->_score;
}

- (void)setHasRank:(BOOL)a3
{
  self->_hasRank = a3;
}

- (BOOL)hasRank
{
  return self->_hasRank;
}

- (unsigned)rank
{
  return self->_rank;
}

- (NSString)transportBundleId
{
  return self->_transportBundleId;
}

- (BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier)modelIdentifier
{
  return self->_modelIdentifier;
}

- (NSString)identifier
{
  return self->_identifier;
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
    v6 = [(BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion *)self identifier];
    uint64_t v7 = [v5 identifier];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion *)self identifier];
      v10 = [v5 identifier];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_29;
      }
    }
    v13 = [(BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion *)self model];
    uint64_t v14 = [v5 model];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion *)self model];
      v17 = [v5 model];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_29;
      }
    }
    v19 = [(BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion *)self modelIdentifier];
    uint64_t v20 = [v5 modelIdentifier];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion *)self modelIdentifier];
      v23 = [v5 modelIdentifier];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_29;
      }
    }
    v25 = [(BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion *)self transportBundleId];
    uint64_t v26 = [v5 transportBundleId];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion *)self transportBundleId];
      v29 = [v5 transportBundleId];
      int v30 = [v28 isEqual:v29];

      if (!v30) {
        goto LABEL_29;
      }
    }
    if (![(BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion *)self hasRank]
      && ![v5 hasRank]
      || [(BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion *)self hasRank]
      && [v5 hasRank]
      && (unsigned int v31 = [(BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion *)self rank],
          v31 == [v5 rank]))
    {
      if (![(BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion *)self hasScore]
        && ![v5 hasScore])
      {
        BOOL v12 = 1;
        goto LABEL_30;
      }
      if ([(BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion *)self hasScore]
        && [v5 hasScore])
      {
        [(BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion *)self score];
        double v33 = v32;
        [v5 score];
        BOOL v12 = v33 == v34;
LABEL_30:

        goto LABEL_31;
      }
    }
LABEL_29:
    BOOL v12 = 0;
    goto LABEL_30;
  }
  BOOL v12 = 0;
LABEL_31:

  return v12;
}

- (id)jsonDictionary
{
  v26[6] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion *)self identifier];
  uint64_t v4 = [(BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion *)self model];
  id v5 = [(BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion *)self modelIdentifier];
  uint64_t v6 = [v5 jsonDictionary];

  uint64_t v7 = [(BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion *)self transportBundleId];
  if ([(BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion *)self hasRank])
  {
    v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion rank](self, "rank"));
  }
  else
  {
    v8 = 0;
  }
  if (![(BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion *)self hasScore]
    || ([(BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion *)self score], fabs(v9) == INFINITY))
  {
    int v11 = 0;
  }
  else
  {
    [(BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion *)self score];
    v10 = NSNumber;
    [(BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion *)self score];
    int v11 = objc_msgSend(v10, "numberWithDouble:");
  }
  v25[0] = @"identifier";
  uint64_t v12 = v3;
  if (!v3)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v21 = v12;
  v26[0] = v12;
  v25[1] = @"model";
  v13 = (void *)v4;
  int v24 = (void *)v4;
  if (!v4)
  {
    v13 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v12);
  }
  v26[1] = v13;
  v25[2] = @"modelIdentifier";
  uint64_t v14 = (void *)v6;
  v23 = (void *)v6;
  if (!v6)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v15 = (void *)v3;
  v26[2] = v14;
  v25[3] = @"transportBundleId";
  v16 = v7;
  if (!v7)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v26[3] = v16;
  v25[4] = @"rank";
  v17 = v8;
  if (!v8)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v26[4] = v17;
  v25[5] = @"score";
  int v18 = v11;
  if (!v11)
  {
    int v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v26[5] = v18;
  v19 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v26, v25, 6, v21);
  if (v11)
  {
    if (v8) {
      goto LABEL_22;
    }
LABEL_31:

    if (v7) {
      goto LABEL_23;
    }
    goto LABEL_32;
  }

  if (!v8) {
    goto LABEL_31;
  }
LABEL_22:
  if (v7) {
    goto LABEL_23;
  }
LABEL_32:

LABEL_23:
  if (!v23) {

  }
  if (v24)
  {
    if (v15) {
      goto LABEL_27;
    }
  }
  else
  {

    if (v15) {
      goto LABEL_27;
    }
  }

LABEL_27:

  return v19;
}

- (BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v69[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"identifier"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    double v9 = [v6 objectForKeyedSubscript:@"model"];
    v52 = a4;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v10 = 0;
          v17 = 0;
          goto LABEL_26;
        }
        id v26 = v8;
        id v27 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v28 = *MEMORY[0x1E4F502C8];
        uint64_t v66 = *MEMORY[0x1E4F28568];
        id v18 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"model"];
        id v67 = v18;
        uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v67 forKeys:&v66 count:1];
        int v30 = v27;
        id v8 = v26;
        v55 = (BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier *)v29;
        v17 = 0;
        id v10 = 0;
        id *v52 = (id)objc_msgSend(v30, "initWithDomain:code:userInfo:", v28, 2);
        goto LABEL_24;
      }
      id v10 = v9;
    }
    else
    {
      id v10 = 0;
    }
    int v11 = [v6 objectForKeyedSubscript:@"modelIdentifier"];
    v56 = self;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v52)
        {
          v17 = 0;
          goto LABEL_25;
        }
        id v54 = v8;
        id v31 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v51 = *MEMORY[0x1E4F502C8];
        uint64_t v64 = *MEMORY[0x1E4F28568];
        id v32 = v10;
        id v33 = [NSString alloc];
        uint64_t v46 = objc_opt_class();
        double v34 = v33;
        id v10 = v32;
        v55 = (BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier *)[v34 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", v46, @"modelIdentifier"];
        v65 = v55;
        v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v65 forKeys:&v64 count:1];
        v36 = v31;
        id v8 = v54;
        id *v52 = (id)[v36 initWithDomain:v51 code:2 userInfo:v35];

        v17 = 0;
        goto LABEL_23;
      }
      id v20 = v8;
      id v18 = v11;
      id v57 = 0;
      v55 = [[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier alloc] initWithJSONDictionary:v18 error:&v57];
      id v21 = v57;
      if (v21)
      {
        v22 = v21;
        if (v52) {
          id *v52 = v21;
        }

        v17 = 0;
        id v8 = v20;
        goto LABEL_24;
      }
    }
    else
    {
      v55 = 0;
    }
    uint64_t v12 = [v6 objectForKeyedSubscript:@"transportBundleId"];
    id v53 = v8;
    id v49 = v10;
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v52)
        {
          v17 = 0;
          id v50 = 0;
          goto LABEL_22;
        }
        id v37 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v38 = *MEMORY[0x1E4F502C8];
        uint64_t v62 = *MEMORY[0x1E4F28568];
        id v14 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"transportBundleId"];
        id v63 = v14;
        v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
        v39 = v37;
        id v8 = v53;
        id v40 = (id)[v39 initWithDomain:v38 code:2 userInfo:v13];
        v17 = 0;
        id v50 = 0;
        id *v52 = v40;
LABEL_21:

        id v10 = v49;
LABEL_22:

LABEL_23:
        id v18 = v11;
        self = v56;
LABEL_24:

        int v11 = v18;
LABEL_25:

        goto LABEL_26;
      }
      id v50 = v12;
    }
    else
    {
      id v50 = 0;
    }
    v13 = [v6 objectForKeyedSubscript:@"rank"];
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v52)
        {
          id v14 = 0;
          v17 = 0;
          goto LABEL_21;
        }
        id v41 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v42 = *MEMORY[0x1E4F502C8];
        uint64_t v60 = *MEMORY[0x1E4F28568];
        id v16 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"rank"];
        id v61 = v16;
        v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
        id v43 = (id)[v41 initWithDomain:v42 code:2 userInfo:v15];
        v17 = 0;
        id v14 = 0;
        id *v52 = v43;
        goto LABEL_20;
      }
      id v14 = v13;
    }
    else
    {
      id v14 = 0;
    }
    v15 = [v6 objectForKeyedSubscript:@"score"];
    if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v52)
        {
          id v48 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v47 = *MEMORY[0x1E4F502C8];
          uint64_t v58 = *MEMORY[0x1E4F28568];
          v44 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"score"];
          v59 = v44;
          v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
          id *v52 = (id)[v48 initWithDomain:v47 code:2 userInfo:v45];
        }
        id v16 = 0;
        v17 = 0;
        goto LABEL_20;
      }
      id v16 = v15;
    }
    else
    {
      id v16 = 0;
    }
    v17 = [(BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion *)v56 initWithIdentifier:v53 model:v49 modelIdentifier:v55 transportBundleId:v50 rank:v14 score:v16];
    v56 = v17;
LABEL_20:

    id v8 = v53;
    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    v17 = 0;
    id v8 = 0;
    goto LABEL_27;
  }
  id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v24 = *MEMORY[0x1E4F502C8];
  uint64_t v68 = *MEMORY[0x1E4F28568];
  id v10 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"identifier"];
  v69[0] = v10;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:&v68 count:1];
  id v25 = (id)[v23 initWithDomain:v24 code:2 userInfo:v9];
  v17 = 0;
  id v8 = 0;
  *a4 = v25;
LABEL_26:

LABEL_27:
  return v17;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_model) {
    PBDataWriterWriteStringField();
  }
  if (self->_modelIdentifier)
  {
    PBDataWriterPlaceMark();
    [(BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier *)self->_modelIdentifier writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_transportBundleId) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasRank) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasScore) {
    PBDataWriterWriteDoubleField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion;
  id v5 = [(BMEventBase *)&v37 init];
  if (!v5) {
    goto LABEL_48;
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
          goto LABEL_25;
        case 2u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 64;
          goto LABEL_25;
        case 3u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 48;
LABEL_25:
          v22 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        case 4u:
          char v23 = 0;
          unsigned int v24 = 0;
          uint64_t v25 = 0;
          v5->_hasRank = 1;
          break;
        case 5u:
          v5->_hasScore = 1;
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
          v5->_score = v32;
          continue;
        case 6u:
          uint64_t v38 = 0;
          uint64_t v39 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_47;
          }
          id v33 = [[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifier alloc] initByReadFrom:v4];
          if (!v33) {
            goto LABEL_47;
          }
          modelIdentifier = v5->_modelIdentifier;
          v5->_modelIdentifier = v33;

          PBReaderRecallMark();
          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_47;
          }
          continue;
      }
      while (1)
      {
        uint64_t v26 = *v6;
        uint64_t v27 = *(void *)&v4[v26];
        unint64_t v28 = v27 + 1;
        if (v27 == -1 || v28 > *(void *)&v4[*v7]) {
          break;
        }
        char v29 = *(unsigned char *)(*(void *)&v4[*v9] + v27);
        *(void *)&v4[v26] = v28;
        v25 |= (unint64_t)(v29 & 0x7F) << v23;
        if ((v29 & 0x80) == 0) {
          goto LABEL_40;
        }
        v23 += 7;
        BOOL v17 = v24++ >= 9;
        if (v17)
        {
          LODWORD(v25) = 0;
          goto LABEL_42;
        }
      }
      v4[*v8] = 1;
LABEL_40:
      if (v4[*v8]) {
        LODWORD(v25) = 0;
      }
LABEL_42:
      v5->_rank = v25;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_47:
  }
    v35 = 0;
  else {
LABEL_48:
  }
    v35 = v5;

  return v35;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion *)self identifier];
  id v5 = [(BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion *)self model];
  id v6 = [(BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion *)self modelIdentifier];
  uint64_t v7 = [(BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion *)self transportBundleId];
  id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion rank](self, "rank"));
  double v9 = NSNumber;
  [(BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion *)self score];
  char v10 = objc_msgSend(v9, "numberWithDouble:");
  unsigned int v11 = (void *)[v3 initWithFormat:@"BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion with identifier: %@, model: %@, modelIdentifier: %@, transportBundleId: %@, rank: %@, score: %@", v4, v5, v6, v7, v8, v10];

  return (NSString *)v11;
}

- (BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion)initWithIdentifier:(id)a3 model:(id)a4 modelIdentifier:(id)a5 transportBundleId:(id)a6 rank:(id)a7 score:(id)a8
{
  id v24 = a3;
  id v23 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion;
  v19 = [(BMEventBase *)&v25 init];
  if (v19)
  {
    v19->_dataVersion = objc_msgSend((id)objc_opt_class(), "latestDataVersion", v23, v24);
    objc_storeStrong((id *)&v19->_identifier, a3);
    objc_storeStrong((id *)&v19->_model, a4);
    objc_storeStrong((id *)&v19->_modelIdentifier, a5);
    objc_storeStrong((id *)&v19->_transportBundleId, a6);
    if (v17)
    {
      v19->_hasRank = 1;
      unsigned int v20 = [v17 unsignedIntValue];
    }
    else
    {
      unsigned int v20 = 0;
      v19->_hasRank = 0;
    }
    v19->_rank = v20;
    if (v18)
    {
      v19->_hasScore = 1;
      [v18 doubleValue];
    }
    else
    {
      v19->_hasScore = 0;
      double v21 = -1.0;
    }
    v19->_score = v21;
  }

  return v19;
}

+ (id)protoFields
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"identifier" number:1 type:13 subMessageClass:0];
  v10[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"model" number:2 type:13 subMessageClass:0];
  v10[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"modelIdentifier" number:6 type:14 subMessageClass:objc_opt_class()];
  v10[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"transportBundleId" number:3 type:13 subMessageClass:0];
  v10[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"rank" number:4 type:4 subMessageClass:0];
  v10[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"score" number:5 type:0 subMessageClass:0];
  v10[5] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF7398;
}

+ (id)columns
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"identifier" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"model" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"modelIdentifier_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_263_84275];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"transportBundleId" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"rank" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:4 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"score" dataType:1 requestOnly:0 fieldNumber:5 protoDataType:0 convertedType:0];
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v5;
  v10[3] = v6;
  v10[4] = v7;
  v10[5] = v4;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:6];

  return v8;
}

id __69__BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 modelIdentifier];
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

    id v8 = [[BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestion alloc] initByReadFrom:v7];
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