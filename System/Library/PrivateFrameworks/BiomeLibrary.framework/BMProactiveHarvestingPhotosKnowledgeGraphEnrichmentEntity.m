@interface BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity)initWithName:(id)a3 score:(id)a4 language:(id)a5 category:(id)a6;
- (BOOL)hasCategory;
- (BOOL)hasScore;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)language;
- (NSString)name;
- (double)score;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)category;
- (unsigned)dataVersion;
- (void)setHasCategory:(BOOL)a3;
- (void)setHasScore:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_language, 0);

  objc_storeStrong((id *)&self->_name, 0);
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

- (NSString)language
{
  return self->_language;
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
    v6 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity *)self name];
    uint64_t v7 = [v5 name];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity *)self name];
      v10 = [v5 name];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_21;
      }
    }
    if ([(BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity *)self hasScore]
      || [v5 hasScore])
    {
      if (![(BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity *)self hasScore]) {
        goto LABEL_21;
      }
      if (![v5 hasScore]) {
        goto LABEL_21;
      }
      [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity *)self score];
      double v14 = v13;
      [v5 score];
      if (v14 != v15) {
        goto LABEL_21;
      }
    }
    v16 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity *)self language];
    uint64_t v17 = [v5 language];
    if (v16 == (void *)v17)
    {
    }
    else
    {
      v18 = (void *)v17;
      v19 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity *)self language];
      v20 = [v5 language];
      int v21 = [v19 isEqual:v20];

      if (!v21) {
        goto LABEL_21;
      }
    }
    if (![(BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity *)self hasCategory]
      && ![v5 hasCategory])
    {
      BOOL v12 = 1;
      goto LABEL_22;
    }
    if ([(BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity *)self hasCategory]
      && [v5 hasCategory])
    {
      unsigned int v22 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity *)self category];
      BOOL v12 = v22 == [v5 category];
LABEL_22:

      goto LABEL_23;
    }
LABEL_21:
    BOOL v12 = 0;
    goto LABEL_22;
  }
  BOOL v12 = 0;
LABEL_23:

  return v12;
}

- (id)jsonDictionary
{
  v16[4] = *MEMORY[0x1E4F143B8];
  v3 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity *)self name];
  if (![(BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity *)self hasScore]
    || ([(BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity *)self score], fabs(v4) == INFINITY))
  {
    v6 = 0;
  }
  else
  {
    [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity *)self score];
    id v5 = NSNumber;
    [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity *)self score];
    v6 = objc_msgSend(v5, "numberWithDouble:");
  }
  uint64_t v7 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity *)self language];
  if ([(BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity *)self hasCategory])
  {
    v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity category](self, "category"));
  }
  else
  {
    v8 = 0;
  }
  v15[0] = @"name";
  v9 = v3;
  if (!v3)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v16[0] = v9;
  v15[1] = @"score";
  v10 = v6;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v16[1] = v10;
  v15[2] = @"language";
  int v11 = v7;
  if (!v7)
  {
    int v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v16[2] = v11;
  v15[3] = @"category";
  BOOL v12 = v8;
  if (!v8)
  {
    BOOL v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v16[3] = v12;
  double v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];
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
      if (v6) {
        goto LABEL_19;
      }
LABEL_25:

      if (v3) {
        goto LABEL_20;
      }
      goto LABEL_26;
    }
  }

  if (!v6) {
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

- (BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"name"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"score"];
    v31 = v7;
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          double v15 = 0;
          goto LABEL_16;
        }
        id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v21 = *MEMORY[0x1E4F502C8];
        uint64_t v36 = *MEMORY[0x1E4F28568];
        id v12 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"score"];
        id v37 = v12;
        v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
        double v15 = 0;
        *a4 = (id)[v20 initWithDomain:v21 code:2 userInfo:v10];
        a4 = 0;
        goto LABEL_15;
      }
      v30 = v9;
    }
    else
    {
      v30 = 0;
    }
    v10 = [v6 objectForKeyedSubscript:@"language"];
    int v11 = self;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v12 = 0;
          double v15 = 0;
          a4 = v30;
          goto LABEL_15;
        }
        id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
        v28 = a4;
        uint64_t v23 = *MEMORY[0x1E4F502C8];
        uint64_t v34 = *MEMORY[0x1E4F28568];
        id v14 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"language"];
        id v35 = v14;
        double v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
        id v24 = (id)[v22 initWithDomain:v23 code:2 userInfo:v13];
        double v15 = 0;
        id v12 = 0;
        a4 = v30;
        id *v28 = v24;
        goto LABEL_14;
      }
      id v12 = v10;
    }
    else
    {
      id v12 = 0;
    }
    double v13 = [v6 objectForKeyedSubscript:@"category"];
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v27 = *MEMORY[0x1E4F502C8];
          uint64_t v32 = *MEMORY[0x1E4F28568];
          v25 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"category"];
          v33 = v25;
          v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
          *a4 = (id)[v29 initWithDomain:v27 code:2 userInfo:v26];
        }
        id v14 = 0;
        double v15 = 0;
        a4 = v30;
        goto LABEL_14;
      }
      id v14 = v13;
    }
    else
    {
      id v14 = 0;
    }
    a4 = v30;
    double v15 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity *)v11 initWithName:v8 score:v30 language:v12 category:v14];
    int v11 = v15;
LABEL_14:

    self = v11;
LABEL_15:

    uint64_t v7 = v31;
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    double v15 = 0;
    id v8 = 0;
    goto LABEL_17;
  }
  id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v18 = *MEMORY[0x1E4F502C8];
  uint64_t v38 = *MEMORY[0x1E4F28568];
  v19 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"name"];
  v39[0] = v19;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
  double v15 = 0;
  id v8 = 0;
  *a4 = (id)[v17 initWithDomain:v18 code:2 userInfo:v9];
  a4 = v19;
LABEL_16:

LABEL_17:
  return v15;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity *)self writeTo:v3];
  double v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasScore)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_language)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasCategory)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity;
  id v5 = [(BMEventBase *)&v35 init];
  if (!v5) {
    goto LABEL_44;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
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
          goto LABEL_27;
        case 2u:
          v5->_hasScore = 1;
          uint64_t v22 = *v6;
          unint64_t v23 = *(void *)&v4[v22];
          if (v23 <= 0xFFFFFFFFFFFFFFF7 && v23 + 8 <= *(void *)&v4[*v7])
          {
            double v24 = *(double *)(*(void *)&v4[*v9] + v23);
            *(void *)&v4[v22] = v23 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v24 = 0.0;
          }
          v5->_score = v24;
          continue;
        case 3u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 48;
LABEL_27:
          v25 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        case 4u:
          char v26 = 0;
          unsigned int v27 = 0;
          uint64_t v28 = 0;
          v5->_hasCategory = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_43;
          }
          continue;
      }
      while (1)
      {
        uint64_t v29 = *v6;
        uint64_t v30 = *(void *)&v4[v29];
        unint64_t v31 = v30 + 1;
        if (v30 == -1 || v31 > *(void *)&v4[*v7]) {
          break;
        }
        char v32 = *(unsigned char *)(*(void *)&v4[*v9] + v30);
        *(void *)&v4[v29] = v31;
        v28 |= (unint64_t)(v32 & 0x7F) << v26;
        if ((v32 & 0x80) == 0) {
          goto LABEL_36;
        }
        v26 += 7;
        BOOL v17 = v27++ >= 9;
        if (v17)
        {
          LODWORD(v28) = 0;
          goto LABEL_38;
        }
      }
      v4[*v8] = 1;
LABEL_36:
      if (v4[*v8]) {
        LODWORD(v28) = 0;
      }
LABEL_38:
      v5->_category = v28;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_43:
  }
    v33 = 0;
  else {
LABEL_44:
  }
    v33 = v5;

  return v33;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity *)self name];
  id v5 = NSNumber;
  [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity *)self score];
  id v6 = objc_msgSend(v5, "numberWithDouble:");
  uint64_t v7 = [(BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity *)self language];
  id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity category](self, "category"));
  v9 = (void *)[v3 initWithFormat:@"BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity with name: %@, score: %@, language: %@, category: %@", v4, v6, v7, v8];

  return (NSString *)v9;
}

- (BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity)initWithName:(id)a3 score:(id)a4 language:(id)a5 category:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity;
  unint64_t v15 = [(BMEventBase *)&v19 init];
  if (v15)
  {
    v15->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v15->_name, a3);
    if (v12)
    {
      v15->_hasScore = 1;
      [v12 doubleValue];
    }
    else
    {
      v15->_hasScore = 0;
      double v16 = -1.0;
    }
    v15->_score = v16;
    objc_storeStrong((id *)&v15->_language, a5);
    if (v14)
    {
      v15->_hasCategory = 1;
      unsigned int v17 = [v14 unsignedIntValue];
    }
    else
    {
      unsigned int v17 = 0;
      v15->_hasCategory = 0;
    }
    v15->_category = v17;
  }

  return v15;
}

+ (id)protoFields
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"name" number:1 type:13 subMessageClass:0];
  v8[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"score" number:2 type:0 subMessageClass:0];
  v8[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"language" number:3 type:13 subMessageClass:0];
  v8[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"category" number:4 type:4 subMessageClass:0];
  v8[3] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF6330;
}

+ (id)columns
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"name" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"score" dataType:1 requestOnly:0 fieldNumber:2 protoDataType:0 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"language" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"category" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:4 convertedType:0];
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  v8[3] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 2)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F94090];
    id v5 = a3;
    id v6 = (void *)[[v4 alloc] initWithData:v5];

    uint64_t v7 = [[BMProactiveHarvestingPhotosKnowledgeGraphEnrichmentEntity alloc] initByReadFrom:v6];
    id v8 = v7;
    if (v7) {
      v7[5] = 2;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (unsigned)latestDataVersion
{
  return 2;
}

@end