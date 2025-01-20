@interface BMPortraitEntity
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMPortraitEntity)initWithCategory:(int)a3 algorithm:(int)a4 decayRate:(id)a5 score:(id)a6 osBuild:(id)a7 assetVersion:(id)a8 name:(id)a9 bestLanguage:(id)a10 sentimentScore:(id)a11;
- (BMPortraitEntity)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)hasAssetVersion;
- (BOOL)hasDecayRate;
- (BOOL)hasScore;
- (BOOL)hasSentimentScore;
- (BOOL)isEqual:(id)a3;
- (NSString)bestLanguage;
- (NSString)description;
- (NSString)name;
- (NSString)osBuild;
- (double)decayRate;
- (double)score;
- (double)sentimentScore;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)algorithm;
- (int)assetVersion;
- (int)category;
- (unsigned)dataVersion;
- (void)setHasAssetVersion:(BOOL)a3;
- (void)setHasDecayRate:(BOOL)a3;
- (void)setHasScore:(BOOL)a3;
- (void)setHasSentimentScore:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPortraitEntity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bestLanguage, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_osBuild, 0);
}

- (void)setHasSentimentScore:(BOOL)a3
{
  self->_hasSentimentScore = a3;
}

- (BOOL)hasSentimentScore
{
  return self->_hasSentimentScore;
}

- (double)sentimentScore
{
  return self->_sentimentScore;
}

- (NSString)bestLanguage
{
  return self->_bestLanguage;
}

- (NSString)name
{
  return self->_name;
}

- (void)setHasAssetVersion:(BOOL)a3
{
  self->_hasAssetVersion = a3;
}

- (BOOL)hasAssetVersion
{
  return self->_hasAssetVersion;
}

- (int)assetVersion
{
  return self->_assetVersion;
}

- (NSString)osBuild
{
  return self->_osBuild;
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

- (void)setHasDecayRate:(BOOL)a3
{
  self->_hasDecayRate = a3;
}

- (BOOL)hasDecayRate
{
  return self->_hasDecayRate;
}

- (double)decayRate
{
  return self->_decayRate;
}

- (int)algorithm
{
  return self->_algorithm;
}

- (int)category
{
  return self->_category;
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
    int v6 = [(BMPortraitEntity *)self category];
    if (v6 != [v5 category]) {
      goto LABEL_37;
    }
    int v7 = [(BMPortraitEntity *)self algorithm];
    if (v7 != [v5 algorithm]) {
      goto LABEL_37;
    }
    if (-[BMPortraitEntity hasDecayRate](self, "hasDecayRate") || [v5 hasDecayRate])
    {
      if (![(BMPortraitEntity *)self hasDecayRate]) {
        goto LABEL_37;
      }
      if (![v5 hasDecayRate]) {
        goto LABEL_37;
      }
      [(BMPortraitEntity *)self decayRate];
      double v9 = v8;
      [v5 decayRate];
      if (v9 != v10) {
        goto LABEL_37;
      }
    }
    if (-[BMPortraitEntity hasScore](self, "hasScore") || [v5 hasScore])
    {
      if (![(BMPortraitEntity *)self hasScore]) {
        goto LABEL_37;
      }
      if (![v5 hasScore]) {
        goto LABEL_37;
      }
      [(BMPortraitEntity *)self score];
      double v12 = v11;
      [v5 score];
      if (v12 != v13) {
        goto LABEL_37;
      }
    }
    v14 = [(BMPortraitEntity *)self osBuild];
    uint64_t v15 = [v5 osBuild];
    if (v14 == (void *)v15)
    {
    }
    else
    {
      v16 = (void *)v15;
      v17 = [(BMPortraitEntity *)self osBuild];
      v18 = [v5 osBuild];
      int v19 = [v17 isEqual:v18];

      if (!v19) {
        goto LABEL_37;
      }
    }
    if ([(BMPortraitEntity *)self hasAssetVersion]
      || [v5 hasAssetVersion])
    {
      if (![(BMPortraitEntity *)self hasAssetVersion]) {
        goto LABEL_37;
      }
      if (![v5 hasAssetVersion]) {
        goto LABEL_37;
      }
      int v21 = [(BMPortraitEntity *)self assetVersion];
      if (v21 != [v5 assetVersion]) {
        goto LABEL_37;
      }
    }
    v22 = [(BMPortraitEntity *)self name];
    uint64_t v23 = [v5 name];
    if (v22 == (void *)v23)
    {
    }
    else
    {
      v24 = (void *)v23;
      v25 = [(BMPortraitEntity *)self name];
      v26 = [v5 name];
      int v27 = [v25 isEqual:v26];

      if (!v27) {
        goto LABEL_37;
      }
    }
    v28 = [(BMPortraitEntity *)self bestLanguage];
    uint64_t v29 = [v5 bestLanguage];
    if (v28 == (void *)v29)
    {
    }
    else
    {
      v30 = (void *)v29;
      v31 = [(BMPortraitEntity *)self bestLanguage];
      v32 = [v5 bestLanguage];
      int v33 = [v31 isEqual:v32];

      if (!v33) {
        goto LABEL_37;
      }
    }
    if (![(BMPortraitEntity *)self hasSentimentScore]
      && ![v5 hasSentimentScore])
    {
      BOOL v20 = 1;
      goto LABEL_38;
    }
    if ([(BMPortraitEntity *)self hasSentimentScore]
      && [v5 hasSentimentScore])
    {
      [(BMPortraitEntity *)self sentimentScore];
      double v35 = v34;
      [v5 sentimentScore];
      BOOL v20 = v35 == v36;
LABEL_38:

      goto LABEL_39;
    }
LABEL_37:
    BOOL v20 = 0;
    goto LABEL_38;
  }
  BOOL v20 = 0;
LABEL_39:

  return v20;
}

- (id)jsonDictionary
{
  v37[9] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPortraitEntity category](self, "category"));
  uint64_t v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPortraitEntity algorithm](self, "algorithm"));
  if (![(BMPortraitEntity *)self hasDecayRate]
    || ([(BMPortraitEntity *)self decayRate], fabs(v5) == INFINITY))
  {
    uint64_t v7 = 0;
  }
  else
  {
    [(BMPortraitEntity *)self decayRate];
    int v6 = NSNumber;
    [(BMPortraitEntity *)self decayRate];
    uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
  }
  if (![(BMPortraitEntity *)self hasScore]
    || ([(BMPortraitEntity *)self score], fabs(v8) == INFINITY))
  {
    double v10 = 0;
  }
  else
  {
    [(BMPortraitEntity *)self score];
    double v9 = NSNumber;
    [(BMPortraitEntity *)self score];
    double v10 = objc_msgSend(v9, "numberWithDouble:");
  }
  uint64_t v11 = [(BMPortraitEntity *)self osBuild];
  if ([(BMPortraitEntity *)self hasAssetVersion])
  {
    double v35 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPortraitEntity assetVersion](self, "assetVersion"));
  }
  else
  {
    double v35 = 0;
  }
  double v34 = [(BMPortraitEntity *)self name];
  int v33 = [(BMPortraitEntity *)self bestLanguage];
  if (![(BMPortraitEntity *)self hasSentimentScore]
    || ([(BMPortraitEntity *)self sentimentScore], fabs(v12) == INFINITY))
  {
    v14 = 0;
  }
  else
  {
    [(BMPortraitEntity *)self sentimentScore];
    double v13 = NSNumber;
    [(BMPortraitEntity *)self sentimentScore];
    v14 = objc_msgSend(v13, "numberWithDouble:");
  }
  v36[0] = @"category";
  uint64_t v15 = v3;
  if (!v3)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v29 = (void *)v15;
  v37[0] = v15;
  v36[1] = @"algorithm";
  uint64_t v16 = v4;
  if (!v4)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v28 = (void *)v16;
  v37[1] = v16;
  v36[2] = @"decayRate";
  uint64_t v17 = v7;
  if (!v7)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v32 = (void *)v3;
  int v27 = (void *)v17;
  v37[2] = v17;
  v36[3] = @"score";
  v18 = v10;
  if (!v10)
  {
    v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v31 = (void *)v4;
  v37[3] = v18;
  v36[4] = @"osBuild";
  int v19 = (void *)v11;
  if (!v11)
  {
    int v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v30 = (void *)v7;
  v37[4] = v19;
  v36[5] = @"assetVersion";
  BOOL v20 = v35;
  if (!v35)
  {
    BOOL v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v37[5] = v20;
  v36[6] = @"name";
  int v21 = v34;
  if (!v34)
  {
    int v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v22 = (void *)v11;
  v37[6] = v21;
  v36[7] = @"bestLanguage";
  uint64_t v23 = v33;
  if (!v33)
  {
    uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
  }
  v37[7] = v23;
  v36[8] = @"sentimentScore";
  v24 = v14;
  if (!v14)
  {
    v24 = [MEMORY[0x1E4F1CA98] null];
  }
  v37[8] = v24;
  v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:9];
  if (!v14) {

  }
  if (!v33) {
  if (!v34)
  }

  if (!v35) {
  if (!v22)
  }

  if (!v10) {
  if (v30)
  }
  {
    if (v31) {
      goto LABEL_48;
    }
LABEL_53:

    if (v32) {
      goto LABEL_49;
    }
    goto LABEL_54;
  }

  if (!v31) {
    goto LABEL_53;
  }
LABEL_48:
  if (v32) {
    goto LABEL_49;
  }
LABEL_54:

LABEL_49:

  return v25;
}

- (BMPortraitEntity)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v96[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = [v5 objectForKeyedSubscript:@"category"];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v7 = 0;
LABEL_9:
    double v9 = [v5 objectForKeyedSubscript:@"algorithm"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = v9;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            double v10 = 0;
            int v21 = 0;
            goto LABEL_47;
          }
          id v51 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v52 = *MEMORY[0x1E4F502C8];
          uint64_t v93 = *MEMORY[0x1E4F28568];
          v22 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"algorithm"];
          v94 = v22;
          double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v94 forKeys:&v93 count:1];
          id v53 = (id)[v51 initWithDomain:v52 code:2 userInfo:v12];
          double v10 = 0;
          int v21 = 0;
          *a4 = v53;
          goto LABEL_46;
        }
        id v11 = [NSNumber numberWithInt:BMPortraitEntityAlgorithmFromString(v9)];
      }
      double v10 = v11;
    }
    else
    {
      double v10 = 0;
    }
    double v12 = [v5 objectForKeyedSubscript:@"decayRate"];
    v73 = v9;
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v24 = self;
        v25 = v12;
        if (!a4)
        {
          v22 = 0;
          int v21 = 0;
          self = v24;
          goto LABEL_46;
        }
        id v26 = objc_alloc(MEMORY[0x1E4F28C58]);
        v70 = v10;
        uint64_t v27 = *MEMORY[0x1E4F502C8];
        uint64_t v91 = *MEMORY[0x1E4F28568];
        id v28 = [NSString alloc];
        uint64_t v61 = objc_opt_class();
        uint64_t v29 = v28;
        double v12 = v25;
        id v77 = (id)[v29 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v61, @"decayRate"];
        id v92 = v77;
        double v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v92 forKeys:&v91 count:1];
        uint64_t v30 = v27;
        double v10 = v70;
        id v31 = (id)[v26 initWithDomain:v30 code:2 userInfo:v13];
        int v21 = 0;
        v22 = 0;
        *a4 = v31;
        goto LABEL_84;
      }
      id v75 = v12;
    }
    else
    {
      id v75 = 0;
    }
    double v13 = [v5 objectForKeyedSubscript:@"score"];
    v74 = v7;
    if (!v13 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v77 = 0;
LABEL_23:
      v14 = [v5 objectForKeyedSubscript:@"osBuild"];
      v76 = self;
      v66 = v6;
      if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            id v72 = 0;
            int v21 = 0;
            v22 = v75;
            goto LABEL_44;
          }
          id v36 = objc_alloc(MEMORY[0x1E4F28C58]);
          v37 = v10;
          uint64_t v38 = *MEMORY[0x1E4F502C8];
          uint64_t v87 = *MEMORY[0x1E4F28568];
          id v68 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"osBuild"];
          id v88 = v68;
          uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v88 forKeys:&v87 count:1];
          uint64_t v39 = v38;
          double v10 = v37;
          id v40 = (id)[v36 initWithDomain:v39 code:2 userInfo:v15];
          int v21 = 0;
          id v72 = 0;
          *a4 = v40;
          v22 = v75;
          goto LABEL_43;
        }
        id v72 = v14;
      }
      else
      {
        id v72 = 0;
      }
      uint64_t v15 = [v5 objectForKeyedSubscript:@"assetVersion"];
      v69 = v10;
      if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            id v68 = 0;
            int v21 = 0;
            goto LABEL_42;
          }
          id v41 = objc_alloc(MEMORY[0x1E4F28C58]);
          v42 = v12;
          uint64_t v43 = *MEMORY[0x1E4F502C8];
          uint64_t v85 = *MEMORY[0x1E4F28568];
          id v67 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"assetVersion"];
          id v86 = v67;
          uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v86 forKeys:&v85 count:1];
          uint64_t v44 = v43;
          double v12 = v42;
          self = v76;
          id v45 = (id)[v41 initWithDomain:v44 code:2 userInfo:v16];
          int v21 = 0;
          id v68 = 0;
          *a4 = v45;
LABEL_41:

          double v10 = v69;
LABEL_42:
          v22 = v75;
LABEL_43:

          int v6 = v66;
LABEL_44:

          uint64_t v7 = v74;
LABEL_45:

          double v9 = v73;
LABEL_46:

          goto LABEL_47;
        }
        id v68 = v15;
      }
      else
      {
        id v68 = 0;
      }
      uint64_t v16 = [v5 objectForKeyedSubscript:@"name"];
      v65 = v12;
      if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            id v67 = 0;
            int v21 = 0;
            goto LABEL_41;
          }
          id v54 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v55 = *MEMORY[0x1E4F502C8];
          uint64_t v83 = *MEMORY[0x1E4F28568];
          id v18 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"name"];
          id v84 = v18;
          uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v84 forKeys:&v83 count:1];
          id v56 = (id)[v54 initWithDomain:v55 code:2 userInfo:v17];
          int v21 = 0;
          id v67 = 0;
          *a4 = v56;
          goto LABEL_40;
        }
        id v67 = v16;
      }
      else
      {
        id v67 = 0;
      }
      uint64_t v17 = [v5 objectForKeyedSubscript:@"bestLanguage"];
      if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            id v18 = 0;
            int v21 = 0;
            goto LABEL_40;
          }
          id v63 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v57 = *MEMORY[0x1E4F502C8];
          uint64_t v81 = *MEMORY[0x1E4F28568];
          BOOL v20 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"bestLanguage"];
          v82 = v20;
          int v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v82 forKeys:&v81 count:1];
          id v58 = (id)[v63 initWithDomain:v57 code:2 userInfo:v19];
          int v21 = 0;
          id v18 = 0;
          *a4 = v58;
          goto LABEL_39;
        }
        id v18 = v17;
      }
      else
      {
        id v18 = 0;
      }
      int v19 = [v5 objectForKeyedSubscript:@"sentimentScore"];
      if (v19 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          BOOL v20 = a4;
          if (a4)
          {
            id v64 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v62 = *MEMORY[0x1E4F502C8];
            uint64_t v79 = *MEMORY[0x1E4F28568];
            v59 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"sentimentScore"];
            v80 = v59;
            v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v80 forKeys:&v79 count:1];
            *a4 = (id)[v64 initWithDomain:v62 code:2 userInfo:v60];

            BOOL v20 = 0;
          }
          int v21 = 0;
          goto LABEL_39;
        }
        BOOL v20 = v19;
      }
      else
      {
        BOOL v20 = 0;
      }
      int v21 = -[BMPortraitEntity initWithCategory:algorithm:decayRate:score:osBuild:assetVersion:name:bestLanguage:sentimentScore:](v76, "initWithCategory:algorithm:decayRate:score:osBuild:assetVersion:name:bestLanguage:sentimentScore:", [v74 intValue], objc_msgSend(v69, "intValue"), v75, v77, v72, v68, v67, v18, v20);
      v76 = v21;
LABEL_39:

LABEL_40:
      self = v76;
      double v12 = v65;
      goto LABEL_41;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v77 = v13;
      goto LABEL_23;
    }
    v24 = self;
    if (a4)
    {
      id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
      v71 = v10;
      uint64_t v33 = *MEMORY[0x1E4F502C8];
      uint64_t v89 = *MEMORY[0x1E4F28568];
      id v72 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"score"];
      id v90 = v72;
      v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v90 forKeys:&v89 count:1];
      uint64_t v34 = v33;
      double v10 = v71;
      id v35 = (id)[v32 initWithDomain:v34 code:2 userInfo:v14];
      int v21 = 0;
      id v77 = 0;
      *a4 = v35;
      v22 = v75;
      goto LABEL_44;
    }
    id v77 = 0;
    int v21 = 0;
    v22 = v75;
LABEL_84:
    self = v24;
    goto LABEL_45;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v6;
LABEL_8:
    uint64_t v7 = v8;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [NSNumber numberWithInt:BMPortraitEntityCategoryFromString(v6)];
    goto LABEL_8;
  }
  if (!a4)
  {
    uint64_t v7 = 0;
    int v21 = 0;
    goto LABEL_48;
  }
  id v46 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v47 = *MEMORY[0x1E4F502C8];
  uint64_t v95 = *MEMORY[0x1E4F28568];
  uint64_t v48 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"category"];
  v96[0] = v48;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v96 forKeys:&v95 count:1];
  uint64_t v49 = v47;
  double v10 = (void *)v48;
  id v50 = (id)[v46 initWithDomain:v49 code:2 userInfo:v9];
  uint64_t v7 = 0;
  int v21 = 0;
  *a4 = v50;
LABEL_47:

LABEL_48:
  return v21;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMPortraitEntity *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasDecayRate) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasScore) {
    PBDataWriterWriteDoubleField();
  }
  uint64_t v4 = v5;
  if (self->_osBuild)
  {
    PBDataWriterWriteStringField();
    uint64_t v4 = v5;
  }
  if (self->_hasAssetVersion)
  {
    PBDataWriterWriteInt32Field();
    uint64_t v4 = v5;
  }
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    uint64_t v4 = v5;
  }
  if (self->_bestLanguage)
  {
    PBDataWriterWriteStringField();
    uint64_t v4 = v5;
  }
  if (self->_hasSentimentScore)
  {
    PBDataWriterWriteDoubleField();
    uint64_t v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  uint64_t v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)BMPortraitEntity;
  id v5 = [(BMEventBase *)&v54 init];
  if (!v5) {
    goto LABEL_83;
  }
  int v6 = (int *)MEMORY[0x1E4F940E8];
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
          char v20 = 0;
          unsigned int v21 = 0;
          uint64_t v22 = 0;
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
              goto LABEL_57;
            }
            v20 += 7;
            BOOL v17 = v21++ >= 9;
            if (v17)
            {
              LODWORD(v22) = 0;
              goto LABEL_59;
            }
          }
          v4[*v8] = 1;
LABEL_57:
          if (v4[*v8]) {
            LODWORD(v22) = 0;
          }
LABEL_59:
          if (v22 >= 0x16) {
            LODWORD(v22) = 0;
          }
          uint64_t v50 = 24;
          goto LABEL_68;
        case 2u:
          char v27 = 0;
          unsigned int v28 = 0;
          uint64_t v22 = 0;
          while (2)
          {
            uint64_t v29 = *v6;
            uint64_t v30 = *(void *)&v4[v29];
            unint64_t v31 = v30 + 1;
            if (v30 == -1 || v31 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v32 = *(unsigned char *)(*(void *)&v4[*v9] + v30);
              *(void *)&v4[v29] = v31;
              v22 |= (unint64_t)(v32 & 0x7F) << v27;
              if (v32 < 0)
              {
                v27 += 7;
                BOOL v17 = v28++ >= 9;
                if (v17)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_65;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v22) = 0;
          }
LABEL_65:
          if (v22 >= 0x12) {
            LODWORD(v22) = 0;
          }
          uint64_t v50 = 28;
LABEL_68:
          *(_DWORD *)((char *)&v5->super.super.isa + v50) = v22;
          continue;
        case 3u:
          v5->_hasDecayRate = 1;
          uint64_t v33 = *v6;
          unint64_t v34 = *(void *)&v4[v33];
          if (v34 <= 0xFFFFFFFFFFFFFFF7 && v34 + 8 <= *(void *)&v4[*v7])
          {
            id v35 = *(objc_class **)(*(void *)&v4[*v9] + v34);
            *(void *)&v4[v33] = v34 + 8;
          }
          else
          {
            v4[*v8] = 1;
            id v35 = 0;
          }
          uint64_t v51 = 40;
          goto LABEL_79;
        case 4u:
          v5->_hasScore = 1;
          uint64_t v36 = *v6;
          unint64_t v37 = *(void *)&v4[v36];
          if (v37 <= 0xFFFFFFFFFFFFFFF7 && v37 + 8 <= *(void *)&v4[*v7])
          {
            id v35 = *(objc_class **)(*(void *)&v4[*v9] + v37);
            *(void *)&v4[v36] = v37 + 8;
          }
          else
          {
            v4[*v8] = 1;
            id v35 = 0;
          }
          uint64_t v51 = 48;
          goto LABEL_79;
        case 5u:
          uint64_t v38 = PBReaderReadString();
          uint64_t v39 = 56;
          goto LABEL_52;
        case 6u:
          char v40 = 0;
          unsigned int v41 = 0;
          uint64_t v42 = 0;
          v5->_hasAssetVersion = 1;
          break;
        case 7u:
          uint64_t v38 = PBReaderReadString();
          uint64_t v39 = 64;
          goto LABEL_52;
        case 8u:
          uint64_t v38 = PBReaderReadString();
          uint64_t v39 = 72;
LABEL_52:
          uint64_t v47 = *(Class *)((char *)&v5->super.super.isa + v39);
          *(Class *)((char *)&v5->super.super.isa + v39) = (Class)v38;

          continue;
        case 9u:
          v5->_hasSentimentScore = 1;
          uint64_t v48 = *v6;
          unint64_t v49 = *(void *)&v4[v48];
          if (v49 <= 0xFFFFFFFFFFFFFFF7 && v49 + 8 <= *(void *)&v4[*v7])
          {
            id v35 = *(objc_class **)(*(void *)&v4[*v9] + v49);
            *(void *)&v4[v48] = v49 + 8;
          }
          else
          {
            v4[*v8] = 1;
            id v35 = 0;
          }
          uint64_t v51 = 80;
LABEL_79:
          *(Class *)((char *)&v5->super.super.isa + v51) = v35;
          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_82;
          }
          continue;
      }
      while (1)
      {
        uint64_t v43 = *v6;
        uint64_t v44 = *(void *)&v4[v43];
        unint64_t v45 = v44 + 1;
        if (v44 == -1 || v45 > *(void *)&v4[*v7]) {
          break;
        }
        char v46 = *(unsigned char *)(*(void *)&v4[*v9] + v44);
        *(void *)&v4[v43] = v45;
        v42 |= (unint64_t)(v46 & 0x7F) << v40;
        if ((v46 & 0x80) == 0) {
          goto LABEL_70;
        }
        v40 += 7;
        BOOL v17 = v41++ >= 9;
        if (v17)
        {
          LODWORD(v42) = 0;
          goto LABEL_72;
        }
      }
      v4[*v8] = 1;
LABEL_70:
      if (v4[*v8]) {
        LODWORD(v42) = 0;
      }
LABEL_72:
      v5->_assetVersion = v42;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_82:
  }
    uint64_t v52 = 0;
  else {
LABEL_83:
  }
    uint64_t v52 = v5;

  return v52;
}

- (NSString)description
{
  id v17 = [NSString alloc];
  uint64_t v3 = BMPortraitEntityCategoryAsString([(BMPortraitEntity *)self category]);
  uint64_t v4 = BMPortraitEntityAlgorithmAsString([(BMPortraitEntity *)self algorithm]);
  id v5 = NSNumber;
  [(BMPortraitEntity *)self decayRate];
  int v6 = objc_msgSend(v5, "numberWithDouble:");
  uint64_t v7 = NSNumber;
  [(BMPortraitEntity *)self score];
  id v8 = objc_msgSend(v7, "numberWithDouble:");
  double v9 = [(BMPortraitEntity *)self osBuild];
  char v10 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPortraitEntity assetVersion](self, "assetVersion"));
  unsigned int v11 = [(BMPortraitEntity *)self name];
  unint64_t v12 = [(BMPortraitEntity *)self bestLanguage];
  uint64_t v13 = NSNumber;
  [(BMPortraitEntity *)self sentimentScore];
  uint64_t v14 = objc_msgSend(v13, "numberWithDouble:");
  unint64_t v15 = (void *)[v17 initWithFormat:@"BMPortraitEntity with category: %@, algorithm: %@, decayRate: %@, score: %@, osBuild: %@, assetVersion: %@, name: %@, bestLanguage: %@, sentimentScore: %@", v3, v4, v6, v8, v9, v10, v11, v12, v14];

  return (NSString *)v15;
}

- (BMPortraitEntity)initWithCategory:(int)a3 algorithm:(int)a4 decayRate:(id)a5 score:(id)a6 osBuild:(id)a7 assetVersion:(id)a8 name:(id)a9 bestLanguage:(id)a10 sentimentScore:(id)a11
{
  id v17 = a5;
  id v18 = a6;
  id v29 = a7;
  id v19 = a8;
  id v28 = a9;
  id v27 = a10;
  id v20 = a11;
  v30.receiver = self;
  v30.super_class = (Class)BMPortraitEntity;
  unsigned int v21 = [(BMEventBase *)&v30 init];
  if (v21)
  {
    v21->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    v21->_category = a3;
    v21->_algorithm = a4;
    if (v17)
    {
      v21->_hasDecayRate = 1;
      [v17 doubleValue];
    }
    else
    {
      v21->_hasDecayRate = 0;
      double v22 = -1.0;
    }
    v21->_decayRate = v22;
    if (v18)
    {
      v21->_hasScore = 1;
      [v18 doubleValue];
    }
    else
    {
      v21->_hasScore = 0;
      double v23 = -1.0;
    }
    v21->_score = v23;
    objc_storeStrong((id *)&v21->_osBuild, a7);
    if (v19)
    {
      v21->_hasAssetVersion = 1;
      int v24 = [v19 intValue];
    }
    else
    {
      v21->_hasAssetVersion = 0;
      int v24 = -1;
    }
    v21->_assetVersion = v24;
    objc_storeStrong((id *)&v21->_name, a9);
    objc_storeStrong((id *)&v21->_bestLanguage, a10);
    if (v20)
    {
      v21->_hasSentimentScore = 1;
      [v20 doubleValue];
    }
    else
    {
      v21->_hasSentimentScore = 0;
      double v25 = -1.0;
    }
    v21->_sentimentScore = v25;
  }

  return v21;
}

+ (id)protoFields
{
  v13[9] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"category" number:1 type:4 subMessageClass:0];
  uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"algorithm", 2, 4, 0, v2);
  v13[1] = v3;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"decayRate" number:3 type:0 subMessageClass:0];
  v13[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"score" number:4 type:0 subMessageClass:0];
  v13[3] = v5;
  int v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"osBuild" number:5 type:13 subMessageClass:0];
  v13[4] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"assetVersion" number:6 type:2 subMessageClass:0];
  v13[5] = v7;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"name" number:7 type:13 subMessageClass:0];
  v13[6] = v8;
  double v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bestLanguage" number:8 type:13 subMessageClass:0];
  v13[7] = v9;
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"sentimentScore" number:9 type:0 subMessageClass:0];
  v13[8] = v10;
  unsigned int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:9];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF49F8;
}

+ (id)columns
{
  v13[9] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"category" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:4 convertedType:0];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"algorithm" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"decayRate" dataType:1 requestOnly:0 fieldNumber:3 protoDataType:0 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"score" dataType:1 requestOnly:0 fieldNumber:4 protoDataType:0 convertedType:0];
  int v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"osBuild" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"assetVersion" dataType:0 requestOnly:0 fieldNumber:6 protoDataType:2 convertedType:0];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"name" dataType:2 requestOnly:0 fieldNumber:7 protoDataType:13 convertedType:0];
  double v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bestLanguage" dataType:2 requestOnly:0 fieldNumber:8 protoDataType:13 convertedType:0];
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"sentimentScore" dataType:1 requestOnly:0 fieldNumber:9 protoDataType:0 convertedType:0];
  v13[0] = v2;
  v13[1] = v3;
  v13[2] = v4;
  v13[3] = v5;
  v13[4] = v6;
  v13[5] = v7;
  v13[6] = v8;
  v13[7] = v9;
  v13[8] = v10;
  unsigned int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:9];

  return v11;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    uint64_t v4 = 0;
  }
  else
  {
    id v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMPortraitEntity alloc] initByReadFrom:v7];
    uint64_t v4 = v8;
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