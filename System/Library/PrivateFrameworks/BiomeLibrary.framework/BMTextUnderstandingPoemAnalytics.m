@interface BMTextUnderstandingPoemAnalytics
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMTextUnderstandingPoemAnalytics)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMTextUnderstandingPoemAnalytics)initWithVisualIdentifier:(id)a3 prediction:(id)a4 named:(id)a5 shadowMatch:(id)a6 threshold:(id)a7 predictionConfidence:(id)a8 onboarding:(id)a9 nameMegadomeIdentifier:(id)a10 nameSource:(int)a11 features:(id)a12 accepted:(id)a13 rejected:(id)a14;
- (BMTextUnderstandingPoemAnalyticsFeatures)features;
- (BOOL)accepted;
- (BOOL)hasAccepted;
- (BOOL)hasNamed;
- (BOOL)hasOnboarding;
- (BOOL)hasPrediction;
- (BOOL)hasPredictionConfidence;
- (BOOL)hasRejected;
- (BOOL)hasShadowMatch;
- (BOOL)hasThreshold;
- (BOOL)isEqual:(id)a3;
- (BOOL)named;
- (BOOL)onboarding;
- (BOOL)prediction;
- (BOOL)rejected;
- (BOOL)shadowMatch;
- (NSString)description;
- (NSString)nameMegadomeIdentifier;
- (NSString)visualIdentifier;
- (double)predictionConfidence;
- (double)threshold;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)nameSource;
- (unsigned)dataVersion;
- (void)setHasAccepted:(BOOL)a3;
- (void)setHasNamed:(BOOL)a3;
- (void)setHasOnboarding:(BOOL)a3;
- (void)setHasPrediction:(BOOL)a3;
- (void)setHasPredictionConfidence:(BOOL)a3;
- (void)setHasRejected:(BOOL)a3;
- (void)setHasShadowMatch:(BOOL)a3;
- (void)setHasThreshold:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMTextUnderstandingPoemAnalytics

+ (id)columns
{
  v16[12] = *MEMORY[0x1E4F143B8];
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"visualIdentifier" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"prediction" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:12 convertedType:0];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"named" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:12 convertedType:0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"shadowMatch" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:12 convertedType:0];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"threshold" dataType:1 requestOnly:0 fieldNumber:5 protoDataType:0 convertedType:0];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"predictionConfidence" dataType:1 requestOnly:0 fieldNumber:6 protoDataType:0 convertedType:0];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"onboarding" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:12 convertedType:0];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"nameMegadomeIdentifier" dataType:2 requestOnly:0 fieldNumber:8 protoDataType:13 convertedType:0];
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"nameSource" dataType:0 requestOnly:0 fieldNumber:9 protoDataType:4 convertedType:0];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"features_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_288_12962];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"accepted" dataType:0 requestOnly:0 fieldNumber:11 protoDataType:12 convertedType:0];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"rejected" dataType:0 requestOnly:0 fieldNumber:12 protoDataType:12 convertedType:0];
  v16[0] = v15;
  v16[1] = v14;
  v16[2] = v2;
  v16[3] = v3;
  v16[4] = v4;
  v16[5] = v5;
  v16[6] = v6;
  v16[7] = v7;
  v16[8] = v8;
  v16[9] = v13;
  v16[10] = v9;
  v16[11] = v10;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:12];

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_nameMegadomeIdentifier, 0);

  objc_storeStrong((id *)&self->_visualIdentifier, 0);
}

- (void)setHasRejected:(BOOL)a3
{
  self->_hasRejected = a3;
}

- (BOOL)hasRejected
{
  return self->_hasRejected;
}

- (BOOL)rejected
{
  return self->_rejected;
}

- (void)setHasAccepted:(BOOL)a3
{
  self->_hasAccepted = a3;
}

- (BOOL)hasAccepted
{
  return self->_hasAccepted;
}

- (BOOL)accepted
{
  return self->_accepted;
}

- (BMTextUnderstandingPoemAnalyticsFeatures)features
{
  return self->_features;
}

- (int)nameSource
{
  return self->_nameSource;
}

- (NSString)nameMegadomeIdentifier
{
  return self->_nameMegadomeIdentifier;
}

- (void)setHasOnboarding:(BOOL)a3
{
  self->_hasOnboarding = a3;
}

- (BOOL)hasOnboarding
{
  return self->_hasOnboarding;
}

- (BOOL)onboarding
{
  return self->_onboarding;
}

- (void)setHasPredictionConfidence:(BOOL)a3
{
  self->_hasPredictionConfidence = a3;
}

- (BOOL)hasPredictionConfidence
{
  return self->_hasPredictionConfidence;
}

- (double)predictionConfidence
{
  return self->_predictionConfidence;
}

- (void)setHasThreshold:(BOOL)a3
{
  self->_hasThreshold = a3;
}

- (BOOL)hasThreshold
{
  return self->_hasThreshold;
}

- (double)threshold
{
  return self->_threshold;
}

- (void)setHasShadowMatch:(BOOL)a3
{
  self->_hasShadowMatch = a3;
}

- (BOOL)hasShadowMatch
{
  return self->_hasShadowMatch;
}

- (BOOL)shadowMatch
{
  return self->_shadowMatch;
}

- (void)setHasNamed:(BOOL)a3
{
  self->_hasNamed = a3;
}

- (BOOL)hasNamed
{
  return self->_hasNamed;
}

- (BOOL)named
{
  return self->_named;
}

- (void)setHasPrediction:(BOOL)a3
{
  self->_hasPrediction = a3;
}

- (BOOL)hasPrediction
{
  return self->_hasPrediction;
}

- (BOOL)prediction
{
  return self->_prediction;
}

- (NSString)visualIdentifier
{
  return self->_visualIdentifier;
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
    v6 = [(BMTextUnderstandingPoemAnalytics *)self visualIdentifier];
    uint64_t v7 = [v5 visualIdentifier];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMTextUnderstandingPoemAnalytics *)self visualIdentifier];
      v10 = [v5 visualIdentifier];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_56;
      }
    }
    if ([(BMTextUnderstandingPoemAnalytics *)self hasPrediction]
      || [v5 hasPrediction])
    {
      if (![(BMTextUnderstandingPoemAnalytics *)self hasPrediction]) {
        goto LABEL_56;
      }
      if (![v5 hasPrediction]) {
        goto LABEL_56;
      }
      int v13 = [(BMTextUnderstandingPoemAnalytics *)self prediction];
      if (v13 != [v5 prediction]) {
        goto LABEL_56;
      }
    }
    if (-[BMTextUnderstandingPoemAnalytics hasNamed](self, "hasNamed") || [v5 hasNamed])
    {
      if (![(BMTextUnderstandingPoemAnalytics *)self hasNamed]) {
        goto LABEL_56;
      }
      if (![v5 hasNamed]) {
        goto LABEL_56;
      }
      int v14 = [(BMTextUnderstandingPoemAnalytics *)self named];
      if (v14 != [v5 named]) {
        goto LABEL_56;
      }
    }
    if ([(BMTextUnderstandingPoemAnalytics *)self hasShadowMatch]
      || [v5 hasShadowMatch])
    {
      if (![(BMTextUnderstandingPoemAnalytics *)self hasShadowMatch]) {
        goto LABEL_56;
      }
      if (![v5 hasShadowMatch]) {
        goto LABEL_56;
      }
      int v15 = [(BMTextUnderstandingPoemAnalytics *)self shadowMatch];
      if (v15 != [v5 shadowMatch]) {
        goto LABEL_56;
      }
    }
    if ([(BMTextUnderstandingPoemAnalytics *)self hasThreshold]
      || [v5 hasThreshold])
    {
      if (![(BMTextUnderstandingPoemAnalytics *)self hasThreshold]) {
        goto LABEL_56;
      }
      if (![v5 hasThreshold]) {
        goto LABEL_56;
      }
      [(BMTextUnderstandingPoemAnalytics *)self threshold];
      double v17 = v16;
      [v5 threshold];
      if (v17 != v18) {
        goto LABEL_56;
      }
    }
    if ([(BMTextUnderstandingPoemAnalytics *)self hasPredictionConfidence]
      || [v5 hasPredictionConfidence])
    {
      if (![(BMTextUnderstandingPoemAnalytics *)self hasPredictionConfidence]) {
        goto LABEL_56;
      }
      if (![v5 hasPredictionConfidence]) {
        goto LABEL_56;
      }
      [(BMTextUnderstandingPoemAnalytics *)self predictionConfidence];
      double v20 = v19;
      [v5 predictionConfidence];
      if (v20 != v21) {
        goto LABEL_56;
      }
    }
    if ([(BMTextUnderstandingPoemAnalytics *)self hasOnboarding]
      || [v5 hasOnboarding])
    {
      if (![(BMTextUnderstandingPoemAnalytics *)self hasOnboarding]) {
        goto LABEL_56;
      }
      if (![v5 hasOnboarding]) {
        goto LABEL_56;
      }
      int v22 = [(BMTextUnderstandingPoemAnalytics *)self onboarding];
      if (v22 != [v5 onboarding]) {
        goto LABEL_56;
      }
    }
    v23 = [(BMTextUnderstandingPoemAnalytics *)self nameMegadomeIdentifier];
    uint64_t v24 = [v5 nameMegadomeIdentifier];
    if (v23 == (void *)v24)
    {
    }
    else
    {
      v25 = (void *)v24;
      v26 = [(BMTextUnderstandingPoemAnalytics *)self nameMegadomeIdentifier];
      v27 = [v5 nameMegadomeIdentifier];
      int v28 = [v26 isEqual:v27];

      if (!v28) {
        goto LABEL_56;
      }
    }
    int v29 = [(BMTextUnderstandingPoemAnalytics *)self nameSource];
    if (v29 == [v5 nameSource])
    {
      v30 = [(BMTextUnderstandingPoemAnalytics *)self features];
      uint64_t v31 = [v5 features];
      if (v30 == (void *)v31)
      {
      }
      else
      {
        v32 = (void *)v31;
        v33 = [(BMTextUnderstandingPoemAnalytics *)self features];
        v34 = [v5 features];
        int v35 = [v33 isEqual:v34];

        if (!v35) {
          goto LABEL_56;
        }
      }
      if (![(BMTextUnderstandingPoemAnalytics *)self hasAccepted]
        && ![v5 hasAccepted]
        || [(BMTextUnderstandingPoemAnalytics *)self hasAccepted]
        && [v5 hasAccepted]
        && (int v36 = [(BMTextUnderstandingPoemAnalytics *)self accepted],
            v36 == [v5 accepted]))
      {
        if (![(BMTextUnderstandingPoemAnalytics *)self hasRejected]
          && ![v5 hasRejected])
        {
          LOBYTE(v12) = 1;
          goto LABEL_57;
        }
        if ([(BMTextUnderstandingPoemAnalytics *)self hasRejected]
          && [v5 hasRejected])
        {
          BOOL v37 = [(BMTextUnderstandingPoemAnalytics *)self rejected];
          int v12 = v37 ^ [v5 rejected] ^ 1;
LABEL_57:

          goto LABEL_58;
        }
      }
    }
LABEL_56:
    LOBYTE(v12) = 0;
    goto LABEL_57;
  }
  LOBYTE(v12) = 0;
LABEL_58:

  return v12;
}

- (id)jsonDictionary
{
  v45[12] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMTextUnderstandingPoemAnalytics *)self visualIdentifier];
  if ([(BMTextUnderstandingPoemAnalytics *)self hasPrediction])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMTextUnderstandingPoemAnalytics prediction](self, "prediction"));
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = 0;
  }
  if ([(BMTextUnderstandingPoemAnalytics *)self hasNamed])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMTextUnderstandingPoemAnalytics named](self, "named"));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = 0;
  }
  if ([(BMTextUnderstandingPoemAnalytics *)self hasShadowMatch])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMTextUnderstandingPoemAnalytics shadowMatch](self, "shadowMatch"));
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = 0;
  }
  if (![(BMTextUnderstandingPoemAnalytics *)self hasThreshold]
    || ([(BMTextUnderstandingPoemAnalytics *)self threshold], fabs(v7) == INFINITY))
  {
    id v9 = 0;
  }
  else
  {
    [(BMTextUnderstandingPoemAnalytics *)self threshold];
    v8 = NSNumber;
    [(BMTextUnderstandingPoemAnalytics *)self threshold];
    objc_msgSend(v8, "numberWithDouble:");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (![(BMTextUnderstandingPoemAnalytics *)self hasPredictionConfidence]
    || ([(BMTextUnderstandingPoemAnalytics *)self predictionConfidence], fabs(v10) == INFINITY))
  {
    id v43 = 0;
  }
  else
  {
    [(BMTextUnderstandingPoemAnalytics *)self predictionConfidence];
    int v11 = NSNumber;
    [(BMTextUnderstandingPoemAnalytics *)self predictionConfidence];
    objc_msgSend(v11, "numberWithDouble:");
    id v43 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ([(BMTextUnderstandingPoemAnalytics *)self hasOnboarding])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMTextUnderstandingPoemAnalytics onboarding](self, "onboarding"));
    id v42 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v42 = 0;
  }
  v41 = [(BMTextUnderstandingPoemAnalytics *)self nameMegadomeIdentifier];
  v40 = objc_msgSend(NSNumber, "numberWithInt:", -[BMTextUnderstandingPoemAnalytics nameSource](self, "nameSource"));
  int v12 = [(BMTextUnderstandingPoemAnalytics *)self features];
  v39 = [v12 jsonDictionary];

  if ([(BMTextUnderstandingPoemAnalytics *)self hasAccepted])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMTextUnderstandingPoemAnalytics accepted](self, "accepted"));
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v13 = 0;
  }
  if ([(BMTextUnderstandingPoemAnalytics *)self hasRejected])
  {
    objc_msgSend(NSNumber, "numberWithBool:", -[BMTextUnderstandingPoemAnalytics rejected](self, "rejected"));
    id v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v14 = 0;
  }
  v44[0] = @"visualIdentifier";
  uint64_t v15 = v3;
  if (!v3)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v33 = (void *)v15;
  v45[0] = v15;
  v44[1] = @"prediction";
  uint64_t v16 = (uint64_t)v4;
  if (!v4)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v32 = (void *)v16;
  v45[1] = v16;
  v44[2] = @"named";
  uint64_t v17 = (uint64_t)v5;
  if (!v5)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v31 = (void *)v17;
  v45[2] = v17;
  v44[3] = @"shadowMatch";
  uint64_t v18 = (uint64_t)v6;
  if (!v6)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v38 = (void *)v3;
  v30 = (void *)v18;
  v45[3] = v18;
  v44[4] = @"threshold";
  uint64_t v19 = (uint64_t)v9;
  if (!v9)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  BOOL v37 = v4;
  int v29 = (void *)v19;
  v45[4] = v19;
  v44[5] = @"predictionConfidence";
  double v20 = v43;
  if (!v43)
  {
    double v20 = [MEMORY[0x1E4F1CA98] null];
  }
  int v36 = v5;
  v45[5] = v20;
  v44[6] = @"onboarding";
  double v21 = v42;
  if (!v42)
  {
    double v21 = [MEMORY[0x1E4F1CA98] null];
  }
  int v35 = v6;
  v45[6] = v21;
  v44[7] = @"nameMegadomeIdentifier";
  int v22 = v41;
  if (!v41)
  {
    int v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v23 = v9;
  v45[7] = v22;
  v44[8] = @"nameSource";
  uint64_t v24 = v40;
  if (!v40)
  {
    uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
  }
  v45[8] = v24;
  v44[9] = @"features";
  v25 = v39;
  if (!v39)
  {
    v25 = [MEMORY[0x1E4F1CA98] null];
  }
  v45[9] = v25;
  v44[10] = @"accepted";
  v26 = v13;
  if (!v13)
  {
    v26 = [MEMORY[0x1E4F1CA98] null];
  }
  v45[10] = v26;
  v44[11] = @"rejected";
  v27 = v14;
  if (!v14)
  {
    v27 = [MEMORY[0x1E4F1CA98] null];
  }
  v45[11] = v27;
  id v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:12];
  if (v14)
  {
    if (v13) {
      goto LABEL_53;
    }
  }
  else
  {

    if (v13) {
      goto LABEL_53;
    }
  }

LABEL_53:
  if (!v39) {

  }
  if (!v40) {
  if (!v41)
  }

  if (!v42) {
  if (!v43)
  }

  if (!v23) {
  if (v35)
  }
  {
    if (v36) {
      goto LABEL_67;
    }
  }
  else
  {

    if (v36)
    {
LABEL_67:
      if (v37) {
        goto LABEL_68;
      }
LABEL_76:

      if (v38) {
        goto LABEL_69;
      }
      goto LABEL_77;
    }
  }

  if (!v37) {
    goto LABEL_76;
  }
LABEL_68:
  if (v38) {
    goto LABEL_69;
  }
LABEL_77:

LABEL_69:

  return v34;
}

- (BMTextUnderstandingPoemAnalytics)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v158[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:@"visualIdentifier"];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v7 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
LABEL_4:
    v8 = [v5 objectForKeyedSubscript:@"prediction"];
    if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v9 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v8;
LABEL_7:
      double v10 = [v5 objectForKeyedSubscript:@"named"];
      if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v124 = a4;
        a4 = 0;
        goto LABEL_10;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v124 = a4;
        a4 = v10;
LABEL_10:
        uint64_t v11 = [v5 objectForKeyedSubscript:@"shadowMatch"];
        v128 = a4;
        id v129 = v9;
        v131 = (void *)v11;
        if (!v11 || (int v12 = (void *)v11, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v13 = v6;
          id v126 = 0;
LABEL_13:
          uint64_t v14 = [v5 objectForKeyedSubscript:@"threshold"];
          v127 = (void *)v14;
          if (v14 && (uint64_t v15 = (void *)v14, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v120 = v8;
              if (!v124)
              {
                id v130 = 0;
                v27 = 0;
                v53 = self;
                v41 = v126;
                id v6 = v13;
LABEL_112:
                id v9 = v129;
                goto LABEL_113;
              }
              v55 = v10;
              id v56 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v57 = *MEMORY[0x1E4F502C8];
              uint64_t v149 = *MEMORY[0x1E4F28568];
              id v125 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"threshold"];
              id v150 = v125;
              uint64_t v58 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v150 forKeys:&v149 count:1];
              v59 = v56;
              double v10 = v55;
              a4 = v128;
              v123 = (void *)v58;
              id v60 = (id)objc_msgSend(v59, "initWithDomain:code:userInfo:", v57, 2);
              id v130 = 0;
              v27 = 0;
              id *v124 = v60;
              goto LABEL_97;
            }
            id v130 = v15;
          }
          else
          {
            id v130 = 0;
          }
          uint64_t v16 = [v5 objectForKeyedSubscript:@"predictionConfidence"];
          v123 = (void *)v16;
          if (!v16 || (uint64_t v17 = (void *)v16, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            id v125 = 0;
LABEL_19:
            uint64_t v18 = [v5 objectForKeyedSubscript:@"onboarding"];
            id v6 = v13;
            v117 = (void *)v18;
            if (v18 && (uint64_t v19 = (void *)v18, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!v124)
                {
                  id v122 = 0;
                  v27 = 0;
                  v53 = self;
                  v41 = v126;
                  goto LABEL_110;
                }
                v69 = v10;
                id v70 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v71 = *MEMORY[0x1E4F502C8];
                uint64_t v145 = *MEMORY[0x1E4F28568];
                id v72 = v7;
                id v73 = [NSString alloc];
                uint64_t v104 = objc_opt_class();
                v74 = v73;
                id v7 = v72;
                uint64_t v19 = v117;
                id v116 = (id)[v74 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v104, @"onboarding"];
                id v146 = v116;
                uint64_t v75 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v146 forKeys:&v145 count:1];
                v76 = v70;
                double v10 = v69;
                a4 = v128;
                v115 = (void *)v75;
                id v77 = (id)objc_msgSend(v76, "initWithDomain:code:userInfo:", v71, 2);
                id v122 = 0;
                v27 = 0;
                id *v124 = v77;
                v53 = self;
                goto LABEL_108;
              }
              v113 = v6;
              id v122 = v19;
            }
            else
            {
              v113 = v6;
              id v122 = 0;
            }
            uint64_t v20 = [v5 objectForKeyedSubscript:@"nameMegadomeIdentifier"];
            v115 = (void *)v20;
            if (v20 && (double v21 = (void *)v20, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!v124)
                {
                  id v116 = 0;
                  v27 = 0;
                  v53 = self;
                  v41 = v126;
                  uint64_t v19 = v117;
                  id v6 = v113;
                  goto LABEL_109;
                }
                id v78 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v79 = *MEMORY[0x1E4F502C8];
                uint64_t v143 = *MEMORY[0x1E4F28568];
                v114 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"nameMegadomeIdentifier"];
                v144 = v114;
                v80 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v144 forKeys:&v143 count:1];
                id v81 = (id)[v78 initWithDomain:v79 code:2 userInfo:v80];
                id v116 = 0;
                v27 = 0;
                id *v124 = v81;
                v53 = self;
                uint64_t v19 = v117;
                id v6 = v113;
                goto LABEL_107;
              }
              id v116 = v21;
            }
            else
            {
              id v116 = 0;
            }
            uint64_t v22 = [v5 objectForKeyedSubscript:@"nameSource"];
            id v6 = v113;
            v110 = v10;
            v111 = (void *)v22;
            if (v22 && (v23 = (void *)v22, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v54 = v23;
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  if (!v124)
                  {
                    v114 = 0;
                    v27 = 0;
                    v53 = self;
                    uint64_t v19 = v117;
                    goto LABEL_106;
                  }
                  id v98 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v99 = *MEMORY[0x1E4F502C8];
                  uint64_t v141 = *MEMORY[0x1E4F28568];
                  id v88 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"nameSource"];
                  id v142 = v88;
                  v112 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v142 forKeys:&v141 count:1];
                  id v100 = (id)objc_msgSend(v98, "initWithDomain:code:userInfo:", v99, 2);
                  v114 = 0;
                  v27 = 0;
                  id *v124 = v100;
                  v53 = self;
                  goto LABEL_104;
                }
                id v54 = [NSNumber numberWithInt:BMTextUnderstandingPoemAnalyticsSourcesFromString(v23)];
              }
              v114 = v54;
            }
            else
            {
              v114 = 0;
            }
            v82 = [v5 objectForKeyedSubscript:@"features"];
            if (v82 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!v124)
                {
                  v27 = 0;
                  v53 = self;
                  uint64_t v19 = v117;
                  goto LABEL_105;
                }
                id v106 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v91 = *MEMORY[0x1E4F502C8];
                uint64_t v139 = *MEMORY[0x1E4F28568];
                v112 = (BMTextUnderstandingPoemAnalyticsFeatures *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"features"];
                v140 = v112;
                v92 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v140 forKeys:&v139 count:1];
                id *v124 = (id)[v106 initWithDomain:v91 code:2 userInfo:v92];

                v27 = 0;
                id v88 = v82;
                v53 = self;
LABEL_104:
                uint64_t v19 = v117;

                v82 = v88;
LABEL_105:

                double v10 = v110;
LABEL_106:
                v80 = v111;
LABEL_107:

LABEL_108:
                v41 = v126;
LABEL_109:

                goto LABEL_110;
              }
              id v88 = v82;
              id v134 = 0;
              v112 = [[BMTextUnderstandingPoemAnalyticsFeatures alloc] initWithJSONDictionary:v88 error:&v134];
              id v89 = v134;
              if (v89)
              {
                v90 = v89;
                v53 = self;
                if (v124) {
                  id *v124 = v89;
                }

                v27 = 0;
                goto LABEL_104;
              }
            }
            else
            {
              v112 = 0;
            }
            v83 = [v5 objectForKeyedSubscript:@"accepted"];
            id v109 = v7;
            if (v83 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v121 = v8;
                v84 = self;
                if (!v124)
                {
                  v27 = 0;
                  id v85 = 0;
                  goto LABEL_103;
                }
                id v107 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v93 = *MEMORY[0x1E4F502C8];
                uint64_t v137 = *MEMORY[0x1E4F28568];
                id v87 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"accepted"];
                id v138 = v87;
                v86 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v138 forKeys:&v137 count:1];
                id v94 = (id)[v107 initWithDomain:v93 code:2 userInfo:v86];
                v27 = 0;
                id v85 = 0;
                id *v124 = v94;
                goto LABEL_101;
              }
              v84 = self;
              id v85 = v83;
            }
            else
            {
              v84 = self;
              id v85 = 0;
            }
            v86 = [v5 objectForKeyedSubscript:@"rejected"];
            if (!v86 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              id v87 = 0;
LABEL_79:
              LODWORD(v105) = [v114 intValue];
              v27 = [(BMTextUnderstandingPoemAnalytics *)v84 initWithVisualIdentifier:v109 prediction:v129 named:v128 shadowMatch:v126 threshold:v130 predictionConfidence:v125 onboarding:v122 nameMegadomeIdentifier:v116 nameSource:v105 features:v112 accepted:v85 rejected:v87];
              v84 = v27;
LABEL_102:

LABEL_103:
              id v88 = v82;
              v53 = v84;
              id v7 = v109;
              a4 = v128;
              goto LABEL_104;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v87 = v86;
              goto LABEL_79;
            }
            v121 = v8;
            if (v124)
            {
              id v133 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v108 = *MEMORY[0x1E4F502C8];
              uint64_t v135 = *MEMORY[0x1E4F28568];
              v95 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"rejected"];
              v136 = v95;
              v96 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v136 forKeys:&v135 count:1];
              id *v124 = (id)[v133 initWithDomain:v108 code:2 userInfo:v96];
            }
            id v87 = 0;
            v27 = 0;
LABEL_101:
            v8 = v121;
            goto LABEL_102;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v125 = v17;
            goto LABEL_19;
          }
          v120 = v8;
          if (v124)
          {
            v61 = v10;
            id v62 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v63 = *MEMORY[0x1E4F502C8];
            uint64_t v147 = *MEMORY[0x1E4F28568];
            id v64 = v7;
            id v65 = [NSString alloc];
            uint64_t v103 = objc_opt_class();
            v66 = v65;
            id v7 = v64;
            id v122 = (id)[v66 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v103, @"predictionConfidence"];
            id v148 = v122;
            uint64_t v118 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v148 forKeys:&v147 count:1];
            v67 = v62;
            double v10 = v61;
            a4 = v128;
            id v68 = (id)[v67 initWithDomain:v63 code:2 userInfo:v118];
            id v125 = 0;
            v27 = 0;
            id *v124 = v68;
            v53 = self;
            v41 = v126;
            id v6 = v13;
            uint64_t v19 = (void *)v118;
LABEL_110:

            goto LABEL_111;
          }
          id v125 = 0;
          v27 = 0;
LABEL_97:
          v8 = v120;
          v53 = self;
          v41 = v126;
          id v6 = v13;
LABEL_111:

          goto LABEL_112;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v13 = v6;
          id v126 = v12;
          goto LABEL_13;
        }
        v119 = v8;
        if (v124)
        {
          id v43 = v10;
          id v44 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v45 = *MEMORY[0x1E4F502C8];
          uint64_t v151 = *MEMORY[0x1E4F28568];
          id v46 = v9;
          id v47 = v7;
          id v48 = [NSString alloc];
          uint64_t v102 = objc_opt_class();
          v49 = v48;
          id v7 = v47;
          id v9 = v46;
          id v130 = (id)[v49 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v102, @"shadowMatch"];
          id v152 = v130;
          uint64_t v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v152 forKeys:&v151 count:1];
          v51 = v44;
          double v10 = v43;
          a4 = v128;
          v127 = (void *)v50;
          id v52 = (id)objc_msgSend(v51, "initWithDomain:code:userInfo:", v45, 2);
          v41 = 0;
          v27 = 0;
          id *v124 = v52;
          v53 = self;
LABEL_113:

          goto LABEL_114;
        }
        v41 = 0;
        v27 = 0;
LABEL_92:
        v8 = v119;
        v53 = self;
LABEL_114:

        goto LABEL_115;
      }
      if (a4)
      {
        v119 = v8;
        id v34 = a4;
        id v35 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v36 = *MEMORY[0x1E4F502C8];
        uint64_t v153 = *MEMORY[0x1E4F28568];
        id v37 = v9;
        id v38 = v7;
        id v39 = [NSString alloc];
        uint64_t v101 = objc_opt_class();
        v40 = v39;
        id v7 = v38;
        id v9 = v37;
        v41 = (void *)[v40 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v101, @"named"];
        v154 = v41;
        v131 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v154 forKeys:&v153 count:1];
        id v42 = (id)objc_msgSend(v35, "initWithDomain:code:userInfo:", v36, 2);
        a4 = 0;
        v27 = 0;
        id *v34 = v42;
        goto LABEL_92;
      }
      v27 = 0;
LABEL_66:
      v53 = self;
LABEL_115:

      goto LABEL_116;
    }
    if (a4)
    {
      id v28 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v29 = *MEMORY[0x1E4F502C8];
      uint64_t v155 = *MEMORY[0x1E4F28568];
      v30 = a4;
      a4 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"prediction"];
      v156 = a4;
      uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v156 forKeys:&v155 count:1];
      v32 = v28;
      double v10 = (void *)v31;
      id v33 = (id)[v32 initWithDomain:v29 code:2 userInfo:v31];
      id v9 = 0;
      v27 = 0;
      id *v30 = v33;
      goto LABEL_66;
    }
    id v9 = 0;
    v27 = 0;
LABEL_62:
    v53 = self;
LABEL_116:

    goto LABEL_117;
  }
  if (a4)
  {
    id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v25 = *MEMORY[0x1E4F502C8];
    uint64_t v157 = *MEMORY[0x1E4F28568];
    id v9 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"visualIdentifier"];
    v158[0] = v9;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v158 forKeys:&v157 count:1];
    id v26 = (id)[v24 initWithDomain:v25 code:2 userInfo:v8];
    id v7 = 0;
    v27 = 0;
    *a4 = v26;
    goto LABEL_62;
  }
  id v7 = 0;
  v27 = 0;
  v53 = self;
LABEL_117:

  return v27;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMTextUnderstandingPoemAnalytics *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_visualIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasPrediction) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasNamed) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasShadowMatch) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasThreshold) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasPredictionConfidence) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasOnboarding) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_nameMegadomeIdentifier) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_features)
  {
    PBDataWriterPlaceMark();
    [(BMTextUnderstandingPoemAnalyticsFeatures *)self->_features writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_hasAccepted) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_hasRejected) {
    PBDataWriterWriteBOOLField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v84.receiver = self;
  v84.super_class = (Class)BMTextUnderstandingPoemAnalytics;
  id v5 = [(BMEventBase *)&v84 init];
  if (!v5) {
    goto LABEL_122;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  id v7 = (int *)MEMORY[0x1E4F940E0];
  v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    id v9 = (int *)MEMORY[0x1E4F940B8];
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
          uint64_t v21 = 40;
          goto LABEL_58;
        case 2u:
          char v22 = 0;
          unsigned int v23 = 0;
          uint64_t v24 = 0;
          v5->_hasPrediction = 1;
          while (2)
          {
            uint64_t v25 = *v6;
            uint64_t v26 = *(void *)&v4[v25];
            unint64_t v27 = v26 + 1;
            if (v26 == -1 || v27 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v28 = *(unsigned char *)(*(void *)&v4[*v9] + v26);
              *(void *)&v4[v25] = v27;
              v24 |= (unint64_t)(v28 & 0x7F) << v22;
              if (v28 < 0)
              {
                v22 += 7;
                BOOL v17 = v23++ >= 9;
                if (v17)
                {
                  uint64_t v24 = 0;
                  goto LABEL_86;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v24 = 0;
          }
LABEL_86:
          BOOL v79 = v24 != 0;
          uint64_t v80 = 16;
          goto LABEL_113;
        case 3u:
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v31 = 0;
          v5->_hasNamed = 1;
          while (2)
          {
            uint64_t v32 = *v6;
            uint64_t v33 = *(void *)&v4[v32];
            unint64_t v34 = v33 + 1;
            if (v33 == -1 || v34 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v35 = *(unsigned char *)(*(void *)&v4[*v9] + v33);
              *(void *)&v4[v32] = v34;
              v31 |= (unint64_t)(v35 & 0x7F) << v29;
              if (v35 < 0)
              {
                v29 += 7;
                BOOL v17 = v30++ >= 9;
                if (v17)
                {
                  uint64_t v31 = 0;
                  goto LABEL_90;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v31 = 0;
          }
LABEL_90:
          BOOL v79 = v31 != 0;
          uint64_t v80 = 18;
          goto LABEL_113;
        case 4u:
          char v36 = 0;
          unsigned int v37 = 0;
          uint64_t v38 = 0;
          v5->_hasShadowMatch = 1;
          while (2)
          {
            uint64_t v39 = *v6;
            uint64_t v40 = *(void *)&v4[v39];
            unint64_t v41 = v40 + 1;
            if (v40 == -1 || v41 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v42 = *(unsigned char *)(*(void *)&v4[*v9] + v40);
              *(void *)&v4[v39] = v41;
              v38 |= (unint64_t)(v42 & 0x7F) << v36;
              if (v42 < 0)
              {
                v36 += 7;
                BOOL v17 = v37++ >= 9;
                if (v17)
                {
                  uint64_t v38 = 0;
                  goto LABEL_94;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v38 = 0;
          }
LABEL_94:
          BOOL v79 = v38 != 0;
          uint64_t v80 = 20;
          goto LABEL_113;
        case 5u:
          v5->_hasThreshold = 1;
          uint64_t v43 = *v6;
          unint64_t v44 = *(void *)&v4[v43];
          if (v44 <= 0xFFFFFFFFFFFFFFF7 && v44 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v45 = *(objc_class **)(*(void *)&v4[*v9] + v44);
            *(void *)&v4[v43] = v44 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v45 = 0;
          }
          uint64_t v81 = 48;
          goto LABEL_118;
        case 6u:
          v5->_hasPredictionConfidence = 1;
          uint64_t v46 = *v6;
          unint64_t v47 = *(void *)&v4[v46];
          if (v47 <= 0xFFFFFFFFFFFFFFF7 && v47 + 8 <= *(void *)&v4[*v7])
          {
            uint64_t v45 = *(objc_class **)(*(void *)&v4[*v9] + v47);
            *(void *)&v4[v46] = v47 + 8;
          }
          else
          {
            v4[*v8] = 1;
            uint64_t v45 = 0;
          }
          uint64_t v81 = 56;
LABEL_118:
          *(Class *)((char *)&v5->super.super.isa + v81) = v45;
          continue;
        case 7u:
          char v48 = 0;
          unsigned int v49 = 0;
          uint64_t v50 = 0;
          v5->_hasOnboarding = 1;
          while (2)
          {
            uint64_t v51 = *v6;
            uint64_t v52 = *(void *)&v4[v51];
            unint64_t v53 = v52 + 1;
            if (v52 == -1 || v53 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v54 = *(unsigned char *)(*(void *)&v4[*v9] + v52);
              *(void *)&v4[v51] = v53;
              v50 |= (unint64_t)(v54 & 0x7F) << v48;
              if (v54 < 0)
              {
                v48 += 7;
                BOOL v17 = v49++ >= 9;
                if (v17)
                {
                  uint64_t v50 = 0;
                  goto LABEL_98;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v50 = 0;
          }
LABEL_98:
          BOOL v79 = v50 != 0;
          uint64_t v80 = 24;
          goto LABEL_113;
        case 8u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 64;
LABEL_58:
          v55 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          continue;
        case 9u:
          char v56 = 0;
          unsigned int v57 = 0;
          uint64_t v58 = 0;
          while (2)
          {
            uint64_t v59 = *v6;
            uint64_t v60 = *(void *)&v4[v59];
            unint64_t v61 = v60 + 1;
            if (v60 == -1 || v61 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v62 = *(unsigned char *)(*(void *)&v4[*v9] + v60);
              *(void *)&v4[v59] = v61;
              v58 |= (unint64_t)(v62 & 0x7F) << v56;
              if (v62 < 0)
              {
                v56 += 7;
                BOOL v17 = v57++ >= 9;
                if (v17)
                {
                  LODWORD(v58) = 0;
                  goto LABEL_102;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v58) = 0;
          }
LABEL_102:
          if (v58 >= 6) {
            LODWORD(v58) = 0;
          }
          v5->_nameSource = v58;
          continue;
        case 0xAu:
          uint64_t v85 = 0;
          uint64_t v86 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_121;
          }
          uint64_t v63 = [[BMTextUnderstandingPoemAnalyticsFeatures alloc] initByReadFrom:v4];
          if (!v63) {
            goto LABEL_121;
          }
          features = v5->_features;
          v5->_features = v63;

          PBReaderRecallMark();
          continue;
        case 0xBu:
          char v65 = 0;
          unsigned int v66 = 0;
          uint64_t v67 = 0;
          v5->_hasAccepted = 1;
          while (2)
          {
            uint64_t v68 = *v6;
            uint64_t v69 = *(void *)&v4[v68];
            unint64_t v70 = v69 + 1;
            if (v69 == -1 || v70 > *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v71 = *(unsigned char *)(*(void *)&v4[*v9] + v69);
              *(void *)&v4[v68] = v70;
              v67 |= (unint64_t)(v71 & 0x7F) << v65;
              if (v71 < 0)
              {
                v65 += 7;
                BOOL v17 = v66++ >= 9;
                if (v17)
                {
                  uint64_t v67 = 0;
                  goto LABEL_108;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            uint64_t v67 = 0;
          }
LABEL_108:
          BOOL v79 = v67 != 0;
          uint64_t v80 = 26;
          goto LABEL_113;
        case 0xCu:
          char v72 = 0;
          unsigned int v73 = 0;
          uint64_t v74 = 0;
          v5->_hasRejected = 1;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_121;
          }
          continue;
      }
      while (1)
      {
        uint64_t v75 = *v6;
        uint64_t v76 = *(void *)&v4[v75];
        unint64_t v77 = v76 + 1;
        if (v76 == -1 || v77 > *(void *)&v4[*v7]) {
          break;
        }
        char v78 = *(unsigned char *)(*(void *)&v4[*v9] + v76);
        *(void *)&v4[v75] = v77;
        v74 |= (unint64_t)(v78 & 0x7F) << v72;
        if ((v78 & 0x80) == 0) {
          goto LABEL_110;
        }
        v72 += 7;
        BOOL v17 = v73++ >= 9;
        if (v17)
        {
          uint64_t v74 = 0;
          goto LABEL_112;
        }
      }
      v4[*v8] = 1;
LABEL_110:
      if (v4[*v8]) {
        uint64_t v74 = 0;
      }
LABEL_112:
      BOOL v79 = v74 != 0;
      uint64_t v80 = 28;
LABEL_113:
      *((unsigned char *)&v5->super.super.isa + v80) = v79;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_121:
  }
    v82 = 0;
  else {
LABEL_122:
  }
    v82 = v5;

  return v82;
}

- (NSString)description
{
  id v16 = [NSString alloc];
  unint64_t v15 = [(BMTextUnderstandingPoemAnalytics *)self visualIdentifier];
  uint64_t v19 = objc_msgSend(NSNumber, "numberWithBool:", -[BMTextUnderstandingPoemAnalytics prediction](self, "prediction"));
  int v18 = objc_msgSend(NSNumber, "numberWithBool:", -[BMTextUnderstandingPoemAnalytics named](self, "named"));
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithBool:", -[BMTextUnderstandingPoemAnalytics shadowMatch](self, "shadowMatch"));
  id v4 = NSNumber;
  [(BMTextUnderstandingPoemAnalytics *)self threshold];
  id v5 = objc_msgSend(v4, "numberWithDouble:");
  id v6 = NSNumber;
  [(BMTextUnderstandingPoemAnalytics *)self predictionConfidence];
  uint64_t v14 = objc_msgSend(v6, "numberWithDouble:");
  id v7 = objc_msgSend(NSNumber, "numberWithBool:", -[BMTextUnderstandingPoemAnalytics onboarding](self, "onboarding"));
  v8 = [(BMTextUnderstandingPoemAnalytics *)self nameMegadomeIdentifier];
  id v9 = BMTextUnderstandingPoemAnalyticsSourcesAsString([(BMTextUnderstandingPoemAnalytics *)self nameSource]);
  char v10 = [(BMTextUnderstandingPoemAnalytics *)self features];
  unsigned int v11 = objc_msgSend(NSNumber, "numberWithBool:", -[BMTextUnderstandingPoemAnalytics accepted](self, "accepted"));
  unint64_t v12 = objc_msgSend(NSNumber, "numberWithBool:", -[BMTextUnderstandingPoemAnalytics rejected](self, "rejected"));
  BOOL v17 = (void *)[v16 initWithFormat:@"BMTextUnderstandingPoemAnalytics with visualIdentifier: %@, prediction: %@, named: %@, shadowMatch: %@, threshold: %@, predictionConfidence: %@, onboarding: %@, nameMegadomeIdentifier: %@, nameSource: %@, features: %@, accepted: %@, rejected: %@", v15, v19, v18, v3, v5, v14, v7, v8, v9, v10, v11, v12];

  return (NSString *)v17;
}

- (BMTextUnderstandingPoemAnalytics)initWithVisualIdentifier:(id)a3 prediction:(id)a4 named:(id)a5 shadowMatch:(id)a6 threshold:(id)a7 predictionConfidence:(id)a8 onboarding:(id)a9 nameMegadomeIdentifier:(id)a10 nameSource:(int)a11 features:(id)a12 accepted:(id)a13 rejected:(id)a14
{
  id v35 = a3;
  id v19 = a4;
  id v36 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  unsigned int v23 = v19;
  id v24 = a9;
  id v34 = a10;
  id v33 = a12;
  id v25 = a13;
  id v26 = a14;
  v37.receiver = self;
  v37.super_class = (Class)BMTextUnderstandingPoemAnalytics;
  unint64_t v27 = [(BMEventBase *)&v37 init];
  if (v27)
  {
    v27->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v27->_visualIdentifier, a3);
    if (v23)
    {
      v27->_hasPrediction = 1;
      v27->_prediction = [v23 BOOLValue];
    }
    else
    {
      v27->_hasPrediction = 0;
      v27->_prediction = 0;
    }
    if (v36)
    {
      v27->_hasNamed = 1;
      v27->_named = [v36 BOOLValue];
    }
    else
    {
      v27->_hasNamed = 0;
      v27->_named = 0;
    }
    if (v20)
    {
      v27->_hasShadowMatch = 1;
      v27->_shadowMatch = [v20 BOOLValue];
    }
    else
    {
      v27->_hasShadowMatch = 0;
      v27->_shadowMatch = 0;
    }
    if (v21)
    {
      v27->_hasThreshold = 1;
      [v21 doubleValue];
    }
    else
    {
      v27->_hasThreshold = 0;
      double v28 = -1.0;
    }
    v27->_threshold = v28;
    if (v22)
    {
      v27->_hasPredictionConfidence = 1;
      [v22 doubleValue];
    }
    else
    {
      v27->_hasPredictionConfidence = 0;
      double v29 = -1.0;
    }
    v27->_predictionConfidence = v29;
    if (v24)
    {
      v27->_hasOnboarding = 1;
      v27->_onboarding = [v24 BOOLValue];
    }
    else
    {
      v27->_hasOnboarding = 0;
      v27->_onboarding = 0;
    }
    objc_storeStrong((id *)&v27->_nameMegadomeIdentifier, a10);
    v27->_nameSource = a11;
    objc_storeStrong((id *)&v27->_features, a12);
    if (v25)
    {
      v27->_hasAccepted = 1;
      v27->_accepted = [v25 BOOLValue];
    }
    else
    {
      v27->_hasAccepted = 0;
      v27->_accepted = 0;
    }
    if (v26)
    {
      v27->_hasRejected = 1;
      v27->_rejected = [v26 BOOLValue];
    }
    else
    {
      v27->_hasRejected = 0;
      v27->_rejected = 0;
    }
  }

  return v27;
}

+ (id)protoFields
{
  v16[12] = *MEMORY[0x1E4F143B8];
  unint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"visualIdentifier" number:1 type:13 subMessageClass:0];
  v16[0] = v15;
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"prediction" number:2 type:12 subMessageClass:0];
  v16[1] = v14;
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"named" number:3 type:12 subMessageClass:0];
  v16[2] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"shadowMatch" number:4 type:12 subMessageClass:0];
  v16[3] = v2;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"threshold" number:5 type:0 subMessageClass:0];
  v16[4] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"predictionConfidence" number:6 type:0 subMessageClass:0];
  v16[5] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"onboarding" number:7 type:12 subMessageClass:0];
  v16[6] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"nameMegadomeIdentifier" number:8 type:13 subMessageClass:0];
  v16[7] = v6;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"nameSource" number:9 type:4 subMessageClass:0];
  v16[8] = v7;
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"features" number:10 type:14 subMessageClass:objc_opt_class()];
  v16[9] = v8;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"accepted" number:11 type:12 subMessageClass:0];
  v16[10] = v9;
  char v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"rejected" number:12 type:12 subMessageClass:0];
  v16[11] = v10;
  unsigned int v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:12];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3D38;
}

id __43__BMTextUnderstandingPoemAnalytics_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 features];
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
    id v7 = (void *)[[v5 alloc] initWithData:v6];

    v8 = [[BMTextUnderstandingPoemAnalytics alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[8] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end