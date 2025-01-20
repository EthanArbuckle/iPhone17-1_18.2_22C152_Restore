@interface BMProactiveHarvestingParsecSearchEntity
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMProactiveHarvestingParsecSearchEntity)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMProactiveHarvestingParsecSearchEntity)initWithName:(id)a3 category:(id)a4 probabilityScore:(id)a5 topics:(id)a6;
- (BOOL)hasCategory;
- (BOOL)hasProbabilityScore;
- (BOOL)isEqual:(id)a3;
- (NSArray)topics;
- (NSString)description;
- (NSString)name;
- (double)probabilityScore;
- (id)_topicsJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)category;
- (unsigned)dataVersion;
- (void)setHasCategory:(BOOL)a3;
- (void)setHasProbabilityScore:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMProactiveHarvestingParsecSearchEntity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topics, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (NSArray)topics
{
  return self->_topics;
}

- (void)setHasProbabilityScore:(BOOL)a3
{
  self->_hasProbabilityScore = a3;
}

- (BOOL)hasProbabilityScore
{
  return self->_hasProbabilityScore;
}

- (double)probabilityScore
{
  return self->_probabilityScore;
}

- (void)setHasCategory:(BOOL)a3
{
  self->_hasCategory = a3;
}

- (BOOL)hasCategory
{
  return self->_hasCategory;
}

- (unsigned)category
{
  return self->_category;
}

- (NSString)name
{
  return self->_name;
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
    v6 = [(BMProactiveHarvestingParsecSearchEntity *)self name];
    uint64_t v7 = [v5 name];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMProactiveHarvestingParsecSearchEntity *)self name];
      v10 = [v5 name];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_19;
      }
    }
    if (![(BMProactiveHarvestingParsecSearchEntity *)self hasCategory]
      && ![v5 hasCategory]
      || [(BMProactiveHarvestingParsecSearchEntity *)self hasCategory]
      && [v5 hasCategory]
      && (unsigned int v13 = [(BMProactiveHarvestingParsecSearchEntity *)self category],
          v13 == [v5 category]))
    {
      if (![(BMProactiveHarvestingParsecSearchEntity *)self hasProbabilityScore]
        && ![v5 hasProbabilityScore]
        || [(BMProactiveHarvestingParsecSearchEntity *)self hasProbabilityScore]
        && [v5 hasProbabilityScore]
        && ([(BMProactiveHarvestingParsecSearchEntity *)self probabilityScore],
            double v15 = v14,
            [v5 probabilityScore],
            v15 == v16))
      {
        v17 = [(BMProactiveHarvestingParsecSearchEntity *)self topics];
        v18 = [v5 topics];
        if (v17 == v18)
        {
          char v12 = 1;
        }
        else
        {
          v19 = [(BMProactiveHarvestingParsecSearchEntity *)self topics];
          v20 = [v5 topics];
          char v12 = [v19 isEqual:v20];
        }
        goto LABEL_20;
      }
    }
LABEL_19:
    char v12 = 0;
LABEL_20:

    goto LABEL_21;
  }
  char v12 = 0;
LABEL_21:

  return v12;
}

- (id)jsonDictionary
{
  v16[4] = *MEMORY[0x1E4F143B8];
  v3 = [(BMProactiveHarvestingParsecSearchEntity *)self name];
  if ([(BMProactiveHarvestingParsecSearchEntity *)self hasCategory])
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMProactiveHarvestingParsecSearchEntity category](self, "category"));
  }
  else
  {
    id v4 = 0;
  }
  if (![(BMProactiveHarvestingParsecSearchEntity *)self hasProbabilityScore]
    || ([(BMProactiveHarvestingParsecSearchEntity *)self probabilityScore], fabs(v5) == INFINITY))
  {
    uint64_t v7 = 0;
  }
  else
  {
    [(BMProactiveHarvestingParsecSearchEntity *)self probabilityScore];
    v6 = NSNumber;
    [(BMProactiveHarvestingParsecSearchEntity *)self probabilityScore];
    uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
  }
  v8 = [(BMProactiveHarvestingParsecSearchEntity *)self _topicsJSONArray];
  v15[0] = @"name";
  v9 = v3;
  if (!v3)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v16[0] = v9;
  v15[1] = @"category";
  v10 = v4;
  if (!v4)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v16[1] = v10;
  v15[2] = @"probabilityScore";
  int v11 = v7;
  if (!v7)
  {
    int v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v16[2] = v11;
  v15[3] = @"topics";
  char v12 = v8;
  if (!v8)
  {
    char v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v16[3] = v12;
  unsigned int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];
  if (v8)
  {
    if (v7) {
      goto LABEL_18;
    }
  }
  else
  {

    if (v7)
    {
LABEL_18:
      if (v4) {
        goto LABEL_19;
      }
LABEL_25:

      if (v3) {
        goto LABEL_20;
      }
      goto LABEL_26;
    }
  }

  if (!v4) {
    goto LABEL_25;
  }
LABEL_19:
  if (v3) {
    goto LABEL_20;
  }
LABEL_26:

LABEL_20:

  return v13;
}

- (id)_topicsJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMProactiveHarvestingParsecSearchEntity *)self topics];
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

- (BMProactiveHarvestingParsecSearchEntity)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v75[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"name"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v26 = *MEMORY[0x1E4F502C8];
        uint64_t v74 = *MEMORY[0x1E4F28568];
        v27 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"name"];
        v75[0] = v27;
        v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v75 forKeys:&v74 count:1];
        v24 = 0;
        id v8 = 0;
        *a4 = (id)[v25 initWithDomain:v26 code:2 userInfo:v9];
        a4 = v27;
        goto LABEL_54;
      }
      v24 = 0;
      id v8 = 0;
      goto LABEL_55;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }
  v9 = [v6 objectForKeyedSubscript:@"category"];
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v28 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v29 = *MEMORY[0x1E4F502C8];
        uint64_t v72 = *MEMORY[0x1E4F28568];
        v30 = a4;
        id v57 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"category"];
        id v73 = v57;
        uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v73 forKeys:&v72 count:1];
        uint64_t v32 = v29;
        v10 = (void *)v31;
        v24 = 0;
        a4 = 0;
        id *v30 = (id)[v28 initWithDomain:v32 code:2 userInfo:v31];
        goto LABEL_53;
      }
      v24 = 0;
      goto LABEL_54;
    }
    v56 = v9;
  }
  else
  {
    v56 = 0;
  }
  v10 = [v6 objectForKeyedSubscript:@"probabilityScore"];
  v54 = a4;
  v55 = v7;
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        id v57 = 0;
        v24 = 0;
        a4 = v56;
        goto LABEL_53;
      }
      id v33 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v34 = *MEMORY[0x1E4F502C8];
      uint64_t v70 = *MEMORY[0x1E4F28568];
      id v11 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"probabilityScore"];
      id v71 = v11;
      long long v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v71 forKeys:&v70 count:1];
      v24 = 0;
      id v57 = 0;
      id *v54 = (id)[v33 initWithDomain:v34 code:2 userInfo:v14];
      goto LABEL_50;
    }
    id v57 = v10;
  }
  else
  {
    id v57 = 0;
  }
  id v11 = [v6 objectForKeyedSubscript:@"topics"];
  long long v12 = [MEMORY[0x1E4F1CA98] null];
  int v13 = [v11 isEqual:v12];

  if (!v13)
  {
    if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v51 = v9;
      id v52 = v8;
      v53 = self;
      goto LABEL_17;
    }
    if (!a4)
    {
      v24 = 0;
      a4 = v56;
      goto LABEL_52;
    }
    id v42 = objc_alloc(MEMORY[0x1E4F28C58]);
    v50 = v10;
    uint64_t v43 = *MEMORY[0x1E4F502C8];
    uint64_t v68 = *MEMORY[0x1E4F28568];
    long long v14 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"topics"];
    v69 = v14;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v69 forKeys:&v68 count:1];
    v45 = v44 = a4;
    uint64_t v46 = v43;
    v10 = v50;
    id *v44 = (id)[v42 initWithDomain:v46 code:2 userInfo:v45];

    v24 = 0;
LABEL_50:
    a4 = v56;
    goto LABEL_51;
  }
  v51 = v9;
  id v52 = v8;
  v53 = self;

  id v11 = 0;
LABEL_17:
  long long v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v11, "count"));
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v11 = v11;
  uint64_t v15 = [v11 countByEnumeratingWithState:&v59 objects:v67 count:16];
  if (!v15) {
    goto LABEL_27;
  }
  uint64_t v16 = v15;
  uint64_t v17 = *(void *)v60;
  id v48 = v6;
  v49 = v10;
  while (2)
  {
    for (uint64_t i = 0; i != v16; ++i)
    {
      if (*(void *)v60 != v17) {
        objc_enumerationMutation(v11);
      }
      v19 = *(void **)(*((void *)&v59 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = v48;
        id v8 = v52;
        self = v53;
        a4 = v56;
        if (v54)
        {
          id v35 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v36 = *MEMORY[0x1E4F502C8];
          uint64_t v65 = *MEMORY[0x1E4F28568];
          id v20 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"topics"];
          id v66 = v20;
          v37 = (void *)MEMORY[0x1E4F1C9E8];
          v38 = &v66;
          v39 = &v65;
LABEL_42:
          v40 = [v37 dictionaryWithObjects:v38 forKeys:v39 count:1];
          v41 = v35;
          a4 = v56;
          id *v54 = (id)[v41 initWithDomain:v36 code:2 userInfo:v40];
LABEL_46:
        }
LABEL_47:

        v24 = 0;
        v10 = v49;
        v9 = v51;
        goto LABEL_51;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v6 = v48;
        id v8 = v52;
        self = v53;
        a4 = v56;
        if (v54)
        {
          id v35 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v36 = *MEMORY[0x1E4F502C8];
          uint64_t v63 = *MEMORY[0x1E4F28568];
          id v20 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"topics"];
          id v64 = v20;
          v37 = (void *)MEMORY[0x1E4F1C9E8];
          v38 = &v64;
          v39 = &v63;
          goto LABEL_42;
        }
        goto LABEL_47;
      }
      id v20 = v19;
      v21 = [BMProactiveHarvestingParsecSearchEntityTopic alloc];
      id v58 = 0;
      v22 = [(BMProactiveHarvestingParsecSearchEntityTopic *)v21 initWithJSONDictionary:v20 error:&v58];
      id v23 = v58;
      if (v23)
      {
        v40 = v23;
        if (v54) {
          id *v54 = v23;
        }

        id v6 = v48;
        id v8 = v52;
        self = v53;
        a4 = v56;
        goto LABEL_46;
      }
      [v14 addObject:v22];
    }
    uint64_t v16 = [v11 countByEnumeratingWithState:&v59 objects:v67 count:16];
    id v6 = v48;
    v10 = v49;
    if (v16) {
      continue;
    }
    break;
  }
LABEL_27:

  id v8 = v52;
  a4 = v56;
  self = [(BMProactiveHarvestingParsecSearchEntity *)v53 initWithName:v52 category:v56 probabilityScore:v57 topics:v14];
  v24 = self;
  v9 = v51;
LABEL_51:

LABEL_52:
  uint64_t v7 = v55;
LABEL_53:

LABEL_54:
LABEL_55:

  return v24;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMProactiveHarvestingParsecSearchEntity *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_name) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasCategory) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_hasProbabilityScore) {
    PBDataWriterWriteFloatField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = self->_topics;
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
        v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        PBDataWriterPlaceMark();
        [v10 writeTo:v4];
        PBDataWriterRecallMark();
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)BMProactiveHarvestingParsecSearchEntity;
  uint64_t v5 = [(BMEventBase *)&v40 init];
  if (!v5) {
    goto LABEL_45;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  v9 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    v10 = (int *)MEMORY[0x1E4F940B8];
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
        uint64_t v15 = *(void *)&v4[v14];
        unint64_t v16 = v15 + 1;
        if (v15 == -1 || v16 > *(void *)&v4[*v8]) {
          break;
        }
        char v17 = *(unsigned char *)(*(void *)&v4[*v10] + v15);
        *(void *)&v4[v14] = v16;
        v13 |= (unint64_t)(v17 & 0x7F) << v11;
        if ((v17 & 0x80) == 0) {
          goto LABEL_13;
        }
        v11 += 7;
        BOOL v18 = v12++ >= 9;
        if (v18)
        {
          unint64_t v13 = 0;
          int v19 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      int v19 = v4[*v9];
      if (v4[*v9]) {
        unint64_t v13 = 0;
      }
LABEL_15:
      if (v19 || (v13 & 7) == 4) {
        break;
      }
      switch((v13 >> 3))
      {
        case 1u:
          uint64_t v21 = PBReaderReadString();
          name = v5->_name;
          v5->_name = (NSString *)v21;

          continue;
        case 2u:
          char v23 = 0;
          unsigned int v24 = 0;
          uint64_t v25 = 0;
          v5->_hasCategory = 1;
          break;
        case 3u:
          v5->_hasProbabilityScore = 1;
          uint64_t v30 = *v7;
          unint64_t v31 = *(void *)&v4[v30];
          if (v31 <= 0xFFFFFFFFFFFFFFFBLL && v31 + 4 <= *(void *)&v4[*v8])
          {
            float v32 = *(float *)(*(void *)&v4[*v10] + v31);
            *(void *)&v4[v30] = v31 + 4;
          }
          else
          {
            v4[*v9] = 1;
            float v32 = 0.0;
          }
          v5->_probabilityScore = v32;
          continue;
        case 4u:
          uint64_t v41 = 0;
          uint64_t v42 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_47;
          }
          id v33 = [[BMProactiveHarvestingParsecSearchEntityTopic alloc] initByReadFrom:v4];
          if (!v33) {
            goto LABEL_47;
          }
          uint64_t v34 = v33;
          [v6 addObject:v33];
          PBReaderRecallMark();

          continue;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
LABEL_47:

          goto LABEL_44;
      }
      while (1)
      {
        uint64_t v26 = *v7;
        uint64_t v27 = *(void *)&v4[v26];
        unint64_t v28 = v27 + 1;
        if (v27 == -1 || v28 > *(void *)&v4[*v8]) {
          break;
        }
        char v29 = *(unsigned char *)(*(void *)&v4[*v10] + v27);
        *(void *)&v4[v26] = v28;
        v25 |= (unint64_t)(v29 & 0x7F) << v23;
        if ((v29 & 0x80) == 0) {
          goto LABEL_37;
        }
        v23 += 7;
        BOOL v18 = v24++ >= 9;
        if (v18)
        {
          LODWORD(v25) = 0;
          goto LABEL_39;
        }
      }
      v4[*v9] = 1;
LABEL_37:
      if (v4[*v9]) {
        LODWORD(v25) = 0;
      }
LABEL_39:
      v5->_category = v25;
    }
    while (*(void *)&v4[*v7] < *(void *)&v4[*v8]);
  }
  uint64_t v35 = [v6 copy];
  topics = v5->_topics;
  v5->_topics = (NSArray *)v35;

  int v37 = v4[*v9];
  if (v37) {
LABEL_44:
  }
    v38 = 0;
  else {
LABEL_45:
  }
    v38 = v5;

  return v38;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMProactiveHarvestingParsecSearchEntity *)self name];
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMProactiveHarvestingParsecSearchEntity category](self, "category"));
  uint64_t v6 = NSNumber;
  [(BMProactiveHarvestingParsecSearchEntity *)self probabilityScore];
  uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
  uint64_t v8 = [(BMProactiveHarvestingParsecSearchEntity *)self topics];
  v9 = (void *)[v3 initWithFormat:@"BMProactiveHarvestingParsecSearchEntity with name: %@, category: %@, probabilityScore: %@, topics: %@", v4, v5, v7, v8];

  return (NSString *)v9;
}

- (BMProactiveHarvestingParsecSearchEntity)initWithName:(id)a3 category:(id)a4 probabilityScore:(id)a5 topics:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)BMProactiveHarvestingParsecSearchEntity;
  uint64_t v15 = [(BMEventBase *)&v20 init];
  if (v15)
  {
    v15->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v15->_name, a3);
    if (v12)
    {
      v15->_hasCategory = 1;
      unsigned int v16 = [v12 unsignedIntValue];
    }
    else
    {
      unsigned int v16 = 0;
      v15->_hasCategory = 0;
    }
    v15->_category = v16;
    if (v13)
    {
      v15->_hasProbabilityScore = 1;
      [v13 floatValue];
      double v18 = v17;
    }
    else
    {
      v15->_hasProbabilityScore = 0;
      double v18 = -1.0;
    }
    v15->_probabilityScore = v18;
    objc_storeStrong((id *)&v15->_topics, a6);
  }

  return v15;
}

+ (id)protoFields
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"name" number:1 type:13 subMessageClass:0];
  v8[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"category" number:2 type:4 subMessageClass:0];
  v8[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"probabilityScore" number:3 type:1 subMessageClass:0];
  v8[2] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"topics" number:4 type:14 subMessageClass:objc_opt_class()];
  v8[3] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF41E8;
}

+ (id)columns
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"name" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"category" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"probabilityScore" dataType:1 requestOnly:0 fieldNumber:3 protoDataType:1 convertedType:0];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"topics_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_21566];
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  v8[3] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

id __50__BMProactiveHarvestingParsecSearchEntity_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _topicsJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 2)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F94090];
    id v5 = a3;
    uint64_t v6 = (void *)[[v4 alloc] initWithData:v5];

    uint64_t v7 = [[BMProactiveHarvestingParsecSearchEntity alloc] initByReadFrom:v6];
    uint64_t v8 = v7;
    if (v7) {
      v7[5] = 2;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (unsigned)latestDataVersion
{
  return 2;
}

@end