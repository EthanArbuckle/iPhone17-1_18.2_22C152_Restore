@interface BMMomentsEngagementBundleSummary
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMomentsEngagementBundleSummary)initWithIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 interfaceType:(int)a6 rankingScore:(id)a7 attachedPhotoAssets:(id)a8;
- (BMMomentsEngagementBundleSummary)initWithIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 interfaceType:(int)a6 rankingScore:(id)a7 attachedPhotoAssets:(id)a8 bundleInterfaceType:(id)a9 bundleEvergreenType:(id)a10;
- (BMMomentsEngagementBundleSummary)initWithIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 interfaceType:(int)a6 rankingScore:(id)a7 attachedPhotoAssets:(id)a8 bundleInterfaceType:(id)a9 bundleEvergreenType:(id)a10 bundleSubType:(int)a11 bundleSuperType:(int)a12 bundleGoodnessScore:(id)a13 ordinalRankInRecommendedTab:(id)a14 visibilityCategoryForUI:(int)a15 assets:(id)a16;
- (BMMomentsEngagementBundleSummary)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMMomentsEngagementSuggestionIdentifier)identifier;
- (BOOL)hasBundleGoodnessScore;
- (BOOL)hasOrdinalRankInRecommendedTab;
- (BOOL)hasRankingScore;
- (BOOL)isEqual:(id)a3;
- (NSArray)assets;
- (NSArray)attachedPhotoAssets;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)bundleEvergreenType;
- (NSString)bundleInterfaceType;
- (NSString)description;
- (double)bundleGoodnessScore;
- (double)rankingScore;
- (id)_assetsJSONArray;
- (id)_attachedPhotoAssetsJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)bundleSubType;
- (int)bundleSuperType;
- (int)interfaceType;
- (int)ordinalRankInRecommendedTab;
- (int)visibilityCategoryForUI;
- (unsigned)dataVersion;
- (void)setHasBundleGoodnessScore:(BOOL)a3;
- (void)setHasOrdinalRankInRecommendedTab:(BOOL)a3;
- (void)setHasRankingScore:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMMomentsEngagementBundleSummary

- (BMMomentsEngagementBundleSummary)initWithIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 interfaceType:(int)a6 rankingScore:(id)a7 attachedPhotoAssets:(id)a8 bundleInterfaceType:(id)a9 bundleEvergreenType:(id)a10
{
  LODWORD(v11) = 0;
  return -[BMMomentsEngagementBundleSummary initWithIdentifier:startDate:endDate:interfaceType:rankingScore:attachedPhotoAssets:bundleInterfaceType:bundleEvergreenType:bundleSubType:bundleSuperType:bundleGoodnessScore:ordinalRankInRecommendedTab:visibilityCategoryForUI:assets:](self, "initWithIdentifier:startDate:endDate:interfaceType:rankingScore:attachedPhotoAssets:bundleInterfaceType:bundleEvergreenType:bundleSubType:bundleSuperType:bundleGoodnessScore:ordinalRankInRecommendedTab:visibilityCategoryForUI:assets:", a3, a4, a5, *(void *)&a6, a7, a8, a9, a10, 0, 0, 0, v11, MEMORY[0x1E4F1CBF0]);
}

- (BMMomentsEngagementBundleSummary)initWithIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 interfaceType:(int)a6 rankingScore:(id)a7 attachedPhotoAssets:(id)a8
{
  return [(BMMomentsEngagementBundleSummary *)self initWithIdentifier:a3 startDate:a4 endDate:a5 interfaceType:*(void *)&a6 rankingScore:a7 attachedPhotoAssets:a8 bundleInterfaceType:0 bundleEvergreenType:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_bundleEvergreenType, 0);
  objc_storeStrong((id *)&self->_bundleInterfaceType, 0);
  objc_storeStrong((id *)&self->_attachedPhotoAssets, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSArray)assets
{
  return self->_assets;
}

- (int)visibilityCategoryForUI
{
  return self->_visibilityCategoryForUI;
}

- (void)setHasOrdinalRankInRecommendedTab:(BOOL)a3
{
  self->_hasOrdinalRankInRecommendedTab = a3;
}

- (BOOL)hasOrdinalRankInRecommendedTab
{
  return self->_hasOrdinalRankInRecommendedTab;
}

- (int)ordinalRankInRecommendedTab
{
  return self->_ordinalRankInRecommendedTab;
}

- (void)setHasBundleGoodnessScore:(BOOL)a3
{
  self->_hasBundleGoodnessScore = a3;
}

- (BOOL)hasBundleGoodnessScore
{
  return self->_hasBundleGoodnessScore;
}

- (double)bundleGoodnessScore
{
  return self->_bundleGoodnessScore;
}

- (int)bundleSuperType
{
  return self->_bundleSuperType;
}

- (int)bundleSubType
{
  return self->_bundleSubType;
}

- (NSString)bundleEvergreenType
{
  return self->_bundleEvergreenType;
}

- (NSString)bundleInterfaceType
{
  return self->_bundleInterfaceType;
}

- (NSArray)attachedPhotoAssets
{
  return self->_attachedPhotoAssets;
}

- (void)setHasRankingScore:(BOOL)a3
{
  self->_hasRankingScore = a3;
}

- (BOOL)hasRankingScore
{
  return self->_hasRankingScore;
}

- (double)rankingScore
{
  return self->_rankingScore;
}

- (int)interfaceType
{
  return self->_interfaceType;
}

- (BMMomentsEngagementSuggestionIdentifier)identifier
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
    v6 = [(BMMomentsEngagementBundleSummary *)self identifier];
    uint64_t v7 = [v5 identifier];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMMomentsEngagementBundleSummary *)self identifier];
      v10 = [v5 identifier];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_48;
      }
    }
    v13 = [(BMMomentsEngagementBundleSummary *)self startDate];
    uint64_t v14 = [v5 startDate];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMMomentsEngagementBundleSummary *)self startDate];
      v17 = [v5 startDate];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_48;
      }
    }
    v19 = [(BMMomentsEngagementBundleSummary *)self endDate];
    uint64_t v20 = [v5 endDate];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMMomentsEngagementBundleSummary *)self endDate];
      v23 = [v5 endDate];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_48;
      }
    }
    int v25 = [(BMMomentsEngagementBundleSummary *)self interfaceType];
    if (v25 != [v5 interfaceType]) {
      goto LABEL_48;
    }
    if ([(BMMomentsEngagementBundleSummary *)self hasRankingScore]
      || [v5 hasRankingScore])
    {
      if (![(BMMomentsEngagementBundleSummary *)self hasRankingScore]) {
        goto LABEL_48;
      }
      if (![v5 hasRankingScore]) {
        goto LABEL_48;
      }
      [(BMMomentsEngagementBundleSummary *)self rankingScore];
      double v27 = v26;
      [v5 rankingScore];
      if (v27 != v28) {
        goto LABEL_48;
      }
    }
    v29 = [(BMMomentsEngagementBundleSummary *)self attachedPhotoAssets];
    uint64_t v30 = [v5 attachedPhotoAssets];
    if (v29 == (void *)v30)
    {
    }
    else
    {
      v31 = (void *)v30;
      v32 = [(BMMomentsEngagementBundleSummary *)self attachedPhotoAssets];
      v33 = [v5 attachedPhotoAssets];
      int v34 = [v32 isEqual:v33];

      if (!v34) {
        goto LABEL_48;
      }
    }
    v35 = [(BMMomentsEngagementBundleSummary *)self bundleInterfaceType];
    uint64_t v36 = [v5 bundleInterfaceType];
    if (v35 == (void *)v36)
    {
    }
    else
    {
      v37 = (void *)v36;
      v38 = [(BMMomentsEngagementBundleSummary *)self bundleInterfaceType];
      v39 = [v5 bundleInterfaceType];
      int v40 = [v38 isEqual:v39];

      if (!v40) {
        goto LABEL_48;
      }
    }
    v41 = [(BMMomentsEngagementBundleSummary *)self bundleEvergreenType];
    uint64_t v42 = [v5 bundleEvergreenType];
    if (v41 == (void *)v42)
    {
    }
    else
    {
      v43 = (void *)v42;
      v44 = [(BMMomentsEngagementBundleSummary *)self bundleEvergreenType];
      v45 = [v5 bundleEvergreenType];
      int v46 = [v44 isEqual:v45];

      if (!v46) {
        goto LABEL_48;
      }
    }
    int v47 = [(BMMomentsEngagementBundleSummary *)self bundleSubType];
    if (v47 == [v5 bundleSubType])
    {
      int v48 = [(BMMomentsEngagementBundleSummary *)self bundleSuperType];
      if (v48 == [v5 bundleSuperType])
      {
        if (![(BMMomentsEngagementBundleSummary *)self hasBundleGoodnessScore]
          && ![v5 hasBundleGoodnessScore]
          || [(BMMomentsEngagementBundleSummary *)self hasBundleGoodnessScore]
          && [v5 hasBundleGoodnessScore]
          && ([(BMMomentsEngagementBundleSummary *)self bundleGoodnessScore],
              double v50 = v49,
              [v5 bundleGoodnessScore],
              v50 == v51))
        {
          if (!-[BMMomentsEngagementBundleSummary hasOrdinalRankInRecommendedTab](self, "hasOrdinalRankInRecommendedTab")&& ![v5 hasOrdinalRankInRecommendedTab]|| -[BMMomentsEngagementBundleSummary hasOrdinalRankInRecommendedTab](self, "hasOrdinalRankInRecommendedTab")&& objc_msgSend(v5, "hasOrdinalRankInRecommendedTab")&& (int v52 = -[BMMomentsEngagementBundleSummary ordinalRankInRecommendedTab](self, "ordinalRankInRecommendedTab"), v52 == objc_msgSend(v5, "ordinalRankInRecommendedTab")))
          {
            int v53 = [(BMMomentsEngagementBundleSummary *)self visibilityCategoryForUI];
            if (v53 == [v5 visibilityCategoryForUI])
            {
              v54 = [(BMMomentsEngagementBundleSummary *)self assets];
              v55 = [v5 assets];
              if (v54 == v55)
              {
                char v12 = 1;
              }
              else
              {
                v56 = [(BMMomentsEngagementBundleSummary *)self assets];
                v57 = [v5 assets];
                char v12 = [v56 isEqual:v57];
              }
              goto LABEL_49;
            }
          }
        }
      }
    }
LABEL_48:
    char v12 = 0;
LABEL_49:

    goto LABEL_50;
  }
  char v12 = 0;
LABEL_50:

  return v12;
}

- (NSDate)endDate
{
  if (self->_hasRaw_endDate)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_endDate];
    id v4 = [v2 convertValue:v3 toType:2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (NSDate)startDate
{
  if (self->_hasRaw_startDate)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_startDate];
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
  v57[14] = *MEMORY[0x1E4F143B8];
  v3 = [(BMMomentsEngagementBundleSummary *)self identifier];
  id v4 = [v3 jsonDictionary];

  id v5 = [(BMMomentsEngagementBundleSummary *)self startDate];
  if (v5)
  {
    v6 = NSNumber;
    uint64_t v7 = [(BMMomentsEngagementBundleSummary *)self startDate];
    [v7 timeIntervalSince1970];
    objc_msgSend(v6, "numberWithDouble:");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = 0;
  }

  v9 = [(BMMomentsEngagementBundleSummary *)self endDate];
  if (v9)
  {
    v10 = NSNumber;
    int v11 = [(BMMomentsEngagementBundleSummary *)self endDate];
    [v11 timeIntervalSince1970];
    objc_msgSend(v10, "numberWithDouble:");
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v12 = 0;
  }

  uint64_t v13 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEngagementBundleSummary interfaceType](self, "interfaceType"));
  if (![(BMMomentsEngagementBundleSummary *)self hasRankingScore]
    || ([(BMMomentsEngagementBundleSummary *)self rankingScore], fabs(v14) == INFINITY))
  {
    id v55 = 0;
  }
  else
  {
    [(BMMomentsEngagementBundleSummary *)self rankingScore];
    v15 = NSNumber;
    [(BMMomentsEngagementBundleSummary *)self rankingScore];
    objc_msgSend(v15, "numberWithDouble:");
    id v55 = (id)objc_claimAutoreleasedReturnValue();
  }
  v54 = [(BMMomentsEngagementBundleSummary *)self _attachedPhotoAssetsJSONArray];
  int v53 = [(BMMomentsEngagementBundleSummary *)self bundleInterfaceType];
  int v52 = [(BMMomentsEngagementBundleSummary *)self bundleEvergreenType];
  double v51 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEngagementBundleSummary bundleSubType](self, "bundleSubType"));
  double v50 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEngagementBundleSummary bundleSuperType](self, "bundleSuperType"));
  if (![(BMMomentsEngagementBundleSummary *)self hasBundleGoodnessScore]
    || ([(BMMomentsEngagementBundleSummary *)self bundleGoodnessScore], fabs(v16) == INFINITY))
  {
    id v49 = 0;
  }
  else
  {
    [(BMMomentsEngagementBundleSummary *)self bundleGoodnessScore];
    v17 = NSNumber;
    [(BMMomentsEngagementBundleSummary *)self bundleGoodnessScore];
    objc_msgSend(v17, "numberWithDouble:");
    id v49 = (id)objc_claimAutoreleasedReturnValue();
  }
  if ([(BMMomentsEngagementBundleSummary *)self hasOrdinalRankInRecommendedTab])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEngagementBundleSummary ordinalRankInRecommendedTab](self, "ordinalRankInRecommendedTab"));
    id v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v18 = 0;
  }
  int v48 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEngagementBundleSummary visibilityCategoryForUI](self, "visibilityCategoryForUI"));
  v19 = [(BMMomentsEngagementBundleSummary *)self _assetsJSONArray];
  v56[0] = @"identifier";
  uint64_t v20 = (uint64_t)v4;
  if (!v4)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v44 = (void *)v20;
  v57[0] = v20;
  v56[1] = @"startDate";
  uint64_t v21 = (uint64_t)v8;
  if (!v8)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v43 = (void *)v21;
  v57[1] = v21;
  v56[2] = @"endDate";
  uint64_t v22 = (uint64_t)v12;
  if (!v12)
  {
    uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v42 = (void *)v22;
  v57[2] = v22;
  v56[3] = @"interfaceType";
  uint64_t v23 = v13;
  if (!v13)
  {
    uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
  }
  v41 = (void *)v23;
  v57[3] = v23;
  v56[4] = @"rankingScore";
  uint64_t v24 = (uint64_t)v55;
  if (!v55)
  {
    uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
  }
  v57[4] = v24;
  v56[5] = @"attachedPhotoAssets";
  uint64_t v25 = (uint64_t)v54;
  if (!v54)
  {
    uint64_t v25 = [MEMORY[0x1E4F1CA98] null];
  }
  v57[5] = v25;
  v56[6] = @"bundleInterfaceType";
  uint64_t v26 = (uint64_t)v53;
  if (!v53)
  {
    uint64_t v26 = [MEMORY[0x1E4F1CA98] null];
  }
  int v47 = v8;
  v57[6] = v26;
  v56[7] = @"bundleEvergreenType";
  uint64_t v27 = (uint64_t)v52;
  if (!v52)
  {
    uint64_t v27 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v36 = v27;
  v57[7] = v27;
  v56[8] = @"bundleSubType";
  double v28 = v51;
  if (!v51)
  {
    double v28 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v27);
  }
  v38 = (void *)v26;
  int v40 = (void *)v24;
  v57[8] = v28;
  v56[9] = @"bundleSuperType";
  v29 = v50;
  if (!v50)
  {
    v29 = [MEMORY[0x1E4F1CA98] null];
  }
  int v46 = (void *)v13;
  v57[9] = v29;
  v56[10] = @"bundleGoodnessScore";
  uint64_t v30 = v49;
  if (!v49)
  {
    uint64_t v30 = [MEMORY[0x1E4F1CA98] null];
  }
  v39 = (void *)v25;
  v57[10] = v30;
  v56[11] = @"ordinalRankInRecommendedTab";
  v31 = v18;
  if (!v18)
  {
    v31 = [MEMORY[0x1E4F1CA98] null];
  }
  v32 = v18;
  v57[11] = v31;
  v56[12] = @"visibilityCategoryForUI";
  v33 = v48;
  if (!v48)
  {
    v33 = [MEMORY[0x1E4F1CA98] null];
  }
  v57[12] = v33;
  v56[13] = @"assets";
  int v34 = v19;
  if (!v19)
  {
    int v34 = [MEMORY[0x1E4F1CA98] null];
  }
  v57[13] = v34;
  objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v57, v56, 14, v36);
  id v45 = (id)objc_claimAutoreleasedReturnValue();
  if (!v19) {

  }
  if (!v48) {
  if (!v32)
  }

  if (!v49) {
  if (!v50)
  }

  if (!v51) {
  if (!v52)
  }

  if (!v53) {
  if (!v54)
  }

  if (v55)
  {
    if (v46) {
      goto LABEL_66;
    }
  }
  else
  {

    if (v46)
    {
LABEL_66:
      if (v12) {
        goto LABEL_67;
      }
      goto LABEL_74;
    }
  }

  if (v12)
  {
LABEL_67:
    if (v47) {
      goto LABEL_68;
    }
LABEL_75:

    if (v4) {
      goto LABEL_69;
    }
    goto LABEL_76;
  }
LABEL_74:

  if (!v47) {
    goto LABEL_75;
  }
LABEL_68:
  if (v4) {
    goto LABEL_69;
  }
LABEL_76:

LABEL_69:

  return v45;
}

- (id)_assetsJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMMomentsEngagementBundleSummary *)self assets];
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

- (id)_attachedPhotoAssetsJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMMomentsEngagementBundleSummary *)self attachedPhotoAssets];
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

- (BMMomentsEngagementBundleSummary)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v239[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"identifier"];
  v188 = v6;
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v185 = 0;
    v186 = a4;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v7;
    id v201 = 0;
    v185 = [[BMMomentsEngagementSuggestionIdentifier alloc] initWithJSONDictionary:v10 error:&v201];
    id v11 = v201;
    if (v11)
    {
      long long v12 = v11;
      if (a4) {
        *a4 = v11;
      }

      a4 = 0;
      long long v13 = v185;
      goto LABEL_189;
    }
    v186 = a4;

LABEL_4:
    uint64_t v8 = [v6 objectForKeyedSubscript:@"startDate"];
    v182 = (void *)v8;
    if (!v8 || (v9 = (void *)v8, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v10 = 0;
      goto LABEL_19;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v14 = (objc_class *)MEMORY[0x1E4F1C9C8];
      id v15 = v9;
      id v16 = [v14 alloc];
      [v15 doubleValue];
      double v18 = v17;

      id v19 = (id)[v16 initWithTimeIntervalSince1970:v18];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v26 = objc_alloc_init(MEMORY[0x1E4F28D48]);
        id v10 = [v26 dateFromString:v9];

LABEL_19:
        uint64_t v27 = [v6 objectForKeyedSubscript:@"endDate"];
        id v183 = v10;
        if (!v27 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v180 = 0;
          goto LABEL_22;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v29 = (objc_class *)MEMORY[0x1E4F1C9C8];
          id v30 = v27;
          id v31 = [v29 alloc];
          [v30 doubleValue];
          double v33 = v32;

          id v180 = (id)[v31 initWithTimeIntervalSince1970:v33];
          goto LABEL_22;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v35 = objc_alloc_init(MEMORY[0x1E4F28D48]);
          id v180 = [v35 dateFromString:v27];

          goto LABEL_22;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v180 = v27;
LABEL_22:
          double v28 = [v6 objectForKeyedSubscript:@"interfaceType"];
          v177 = self;
          if (!v28 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            id v181 = 0;
            goto LABEL_33;
          }
          int v34 = v27;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v181 = v28;
            goto LABEL_33;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v181 = [NSNumber numberWithInt:BMMomentsEngagementBundleInterfaceTypeFromString(v28)];
LABEL_33:
            uint64_t v36 = [v6 objectForKeyedSubscript:@"rankingScore"];
            v175 = v28;
            v176 = (void *)v36;
            if (v36 && (v37 = (void *)v36, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (v186)
                {
                  double v50 = v28;
                  id v51 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v52 = *MEMORY[0x1E4F502C8];
                  uint64_t v230 = *MEMORY[0x1E4F28568];
                  id v53 = [NSString alloc];
                  uint64_t v154 = objc_opt_class();
                  v54 = v53;
                  id v10 = v183;
                  id v38 = (id)[v54 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v154, @"rankingScore"];
                  id v231 = v38;
                  uint64_t v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v231 forKeys:&v230 count:1];
                  v56 = v51;
                  double v28 = v50;
                  v190 = (void *)v55;
                  id v178 = 0;
                  a4 = 0;
                  id *v186 = (id)objc_msgSend(v56, "initWithDomain:code:userInfo:", v52, 2);
                  long long v13 = v185;

                  goto LABEL_182;
                }
                id v178 = 0;
                a4 = 0;
                long long v13 = v185;
                goto LABEL_183;
              }
              id v178 = v37;
            }
            else
            {
              id v178 = 0;
            }
            id v38 = [v6 objectForKeyedSubscript:@"attachedPhotoAssets"];
            v39 = [MEMORY[0x1E4F1CA98] null];
            int v40 = [v38 isEqual:v39];

            v179 = v7;
            if (v40)
            {

              id v38 = 0;
            }
            else if (v38)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (v186)
                {
                  id v65 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v66 = *MEMORY[0x1E4F502C8];
                  uint64_t v228 = *MEMORY[0x1E4F28568];
                  v189 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"attachedPhotoAssets"];
                  v229 = v189;
                  v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v229 forKeys:&v228 count:1];
                  a4 = 0;
                  id *v186 = (id)[v65 initWithDomain:v66 code:2 userInfo:v64];
                  id v10 = v183;
                  long long v13 = v185;
                  double v28 = v175;
                  goto LABEL_181;
                }
                a4 = 0;
                id v10 = v183;
                long long v13 = v185;
                double v28 = v175;
                goto LABEL_182;
              }
            }
            v189 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v38, "count"));
            long long v197 = 0u;
            long long v198 = 0u;
            long long v199 = 0u;
            long long v200 = 0u;
            id v38 = v38;
            uint64_t v41 = [v38 countByEnumeratingWithState:&v197 objects:v227 count:16];
            if (!v41) {
              goto LABEL_50;
            }
            uint64_t v42 = v41;
            uint64_t v43 = *(void *)v198;
            v173 = v27;
            while (1)
            {
              for (uint64_t i = 0; i != v42; ++i)
              {
                if (*(void *)v198 != v43) {
                  objc_enumerationMutation(v38);
                }
                id v45 = *(void **)(*((void *)&v197 + 1) + 8 * i);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v57 = v186;
                  if (v186)
                  {
                    id v58 = objc_alloc(MEMORY[0x1E4F28C58]);
                    uint64_t v59 = *MEMORY[0x1E4F502C8];
                    uint64_t v225 = *MEMORY[0x1E4F28568];
                    id v46 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"attachedPhotoAssets"];
                    id v226 = v46;
                    v60 = (void *)MEMORY[0x1E4F1C9E8];
                    v61 = &v226;
                    v62 = &v225;
                    goto LABEL_61;
                  }
LABEL_68:
                  a4 = 0;
                  v64 = v38;
                  id v10 = v183;
                  long long v13 = v185;
                  uint64_t v27 = v173;
                  double v28 = v175;
                  goto LABEL_181;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v57 = v186;
                  if (!v186) {
                    goto LABEL_68;
                  }
                  id v58 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v59 = *MEMORY[0x1E4F502C8];
                  uint64_t v223 = *MEMORY[0x1E4F28568];
                  id v46 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"attachedPhotoAssets"];
                  id v224 = v46;
                  v60 = (void *)MEMORY[0x1E4F1C9E8];
                  v61 = &v224;
                  v62 = &v223;
LABEL_61:
                  id v63 = [v60 dictionaryWithObjects:v61 forKeys:v62 count:1];
                  a4 = 0;
                  id *v57 = (id)[v58 initWithDomain:v59 code:2 userInfo:v63];
                  v64 = v38;
                  long long v13 = v185;
LABEL_65:
                  id v10 = v183;
                  uint64_t v27 = v173;
                  double v28 = v175;
                  goto LABEL_179;
                }
                id v46 = v45;
                int v47 = [BMMomentsEngagementPhotosAssets alloc];
                id v196 = 0;
                int v48 = [(BMMomentsEngagementPhotosAssets *)v47 initWithJSONDictionary:v46 error:&v196];
                id v49 = v196;
                if (v49)
                {
                  id v63 = v49;
                  long long v13 = v185;
                  if (v186) {
                    id *v186 = v49;
                  }

                  a4 = 0;
                  v64 = v38;
                  goto LABEL_65;
                }
                [v189 addObject:v48];
              }
              uint64_t v42 = [v38 countByEnumeratingWithState:&v197 objects:v227 count:16];
              uint64_t v27 = v173;
              if (!v42)
              {
LABEL_50:

                id v46 = [v188 objectForKeyedSubscript:@"bundleInterfaceType"];
                if (!v46)
                {
                  id v168 = 0;
                  a4 = v186;
                  goto LABEL_77;
                }
                objc_opt_class();
                a4 = v186;
                if (objc_opt_isKindOfClass())
                {
                  id v168 = 0;
                  goto LABEL_77;
                }
                objc_opt_class();
                id v10 = v183;
                if (objc_opt_isKindOfClass())
                {
                  id v168 = v46;
LABEL_77:
                  double v28 = v175;
                  uint64_t v67 = [v188 objectForKeyedSubscript:@"bundleEvergreenType"];
                  v169 = (void *)v67;
                  if (!v67)
                  {
                    v187 = a4;
                    id v63 = 0;
                    id v10 = v183;
                    goto LABEL_85;
                  }
                  v68 = (void *)v67;
                  objc_opt_class();
                  id v10 = v183;
                  if (objc_opt_isKindOfClass())
                  {
                    v187 = a4;
                    id v63 = 0;
LABEL_85:
                    uint64_t v74 = [v188 objectForKeyedSubscript:@"bundleSubType"];
                    v174 = v27;
                    v166 = (void *)v74;
                    if (!v74 || (v75 = (void *)v74, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                    {
                      id v167 = 0;
LABEL_103:
                      uint64_t v95 = [v188 objectForKeyedSubscript:@"bundleSuperType"];
                      v164 = (void *)v95;
                      if (!v95 || (v96 = (void *)v95, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                      {
                        id v165 = 0;
LABEL_110:
                        uint64_t v101 = [v188 objectForKeyedSubscript:@"bundleGoodnessScore"];
                        v162 = (void *)v101;
                        if (!v101 || (v102 = (void *)v101, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                        {
                          id v163 = 0;
LABEL_113:
                          uint64_t v103 = [v188 objectForKeyedSubscript:@"ordinalRankInRecommendedTab"];
                          v160 = (void *)v103;
                          if (!v103 || (v104 = (void *)v103, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                          {
                            id v161 = 0;
LABEL_116:
                            uint64_t v105 = [v188 objectForKeyedSubscript:@"visibilityCategoryForUI"];
                            v158 = (void *)v105;
                            if (!v105 || (v106 = (void *)v105, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                            {
                              id v159 = 0;
                              goto LABEL_131;
                            }
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              id v159 = v106;
                              goto LABEL_131;
                            }
                            objc_opt_class();
                            if (objc_opt_isKindOfClass())
                            {
                              id v159 = [NSNumber numberWithInt:BMMomentsEngagementBundleSummaryVisibilityCategoryForUIFromString(v106)];
                              id v10 = v183;
LABEL_131:
                              v115 = [v188 objectForKeyedSubscript:@"assets"];
                              v116 = [MEMORY[0x1E4F1CA98] null];
                              int v117 = [v115 isEqual:v116];

                              uint64_t v7 = v179;
                              if (v117)
                              {

                                v115 = 0;
LABEL_135:
                                uint64_t v118 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v115, "count"));
                                long long v192 = 0u;
                                long long v193 = 0u;
                                long long v194 = 0u;
                                long long v195 = 0u;
                                id obj = v115;
                                uint64_t v119 = [obj countByEnumeratingWithState:&v192 objects:v206 count:16];
                                if (!v119) {
                                  goto LABEL_145;
                                }
                                uint64_t v120 = v119;
                                uint64_t v121 = *(void *)v193;
                                v172 = (void *)v118;
LABEL_137:
                                uint64_t v122 = 0;
                                while (1)
                                {
                                  if (*(void *)v193 != v121) {
                                    objc_enumerationMutation(obj);
                                  }
                                  v123 = *(void **)(*((void *)&v192 + 1) + 8 * v122);
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass()) {
                                    break;
                                  }
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                  {
                                    id v10 = v183;
                                    long long v13 = v185;
                                    uint64_t v27 = v174;
                                    v132 = v187;
                                    v64 = v168;
                                    if (!v187) {
                                      goto LABEL_155;
                                    }
                                    id v157 = objc_alloc(MEMORY[0x1E4F28C58]);
                                    uint64_t v133 = *MEMORY[0x1E4F502C8];
                                    uint64_t v202 = *MEMORY[0x1E4F28568];
                                    id v124 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"assets"];
                                    id v203 = v124;
                                    v134 = (void *)MEMORY[0x1E4F1C9E8];
                                    v135 = &v203;
                                    v136 = &v202;
                                    goto LABEL_150;
                                  }
                                  id v124 = v123;
                                  v125 = [BMMomentsEngagementBundleSummarySuggestionAsset alloc];
                                  id v191 = 0;
                                  v126 = [(BMMomentsEngagementBundleSummarySuggestionAsset *)v125 initWithJSONDictionary:v124 error:&v191];
                                  id v127 = v191;
                                  if (v127)
                                  {
                                    v137 = v127;
                                    if (v187) {
                                      id *v187 = v127;
                                    }

                                    id v10 = v183;
                                    long long v13 = v185;
                                    uint64_t v27 = v174;
                                    v64 = v168;
LABEL_154:

                                    uint64_t v7 = v179;
LABEL_155:

                                    a4 = 0;
                                    v131 = v172;
                                    goto LABEL_171;
                                  }
                                  [v172 addObject:v126];

                                  ++v122;
                                  uint64_t v7 = v179;
                                  if (v120 == v122)
                                  {
                                    uint64_t v120 = [obj countByEnumeratingWithState:&v192 objects:v206 count:16];
                                    uint64_t v118 = (uint64_t)v172;
                                    if (v120) {
                                      goto LABEL_137;
                                    }
LABEL_145:

                                    uint64_t v128 = [v181 intValue];
                                    unsigned int v129 = [v167 intValue];
                                    unsigned int v130 = [v165 intValue];
                                    LODWORD(v156) = [v159 intValue];
                                    unint64_t v155 = __PAIR64__(v130, v129);
                                    v64 = v168;
                                    id v10 = v183;
                                    long long v13 = v185;
                                    a4 = -[BMMomentsEngagementBundleSummary initWithIdentifier:startDate:endDate:interfaceType:rankingScore:attachedPhotoAssets:bundleInterfaceType:bundleEvergreenType:bundleSubType:bundleSuperType:bundleGoodnessScore:ordinalRankInRecommendedTab:visibilityCategoryForUI:assets:](v177, "initWithIdentifier:startDate:endDate:interfaceType:rankingScore:attachedPhotoAssets:bundleInterfaceType:bundleEvergreenType:bundleSubType:bundleSuperType:bundleGoodnessScore:ordinalRankInRecommendedTab:visibilityCategoryForUI:assets:", v185, v183, v180, v128, v178, v189, v168, v63, v155, v163, v161, v156, v118);
                                    v177 = (BMMomentsEngagementBundleSummary *)a4;
                                    v131 = (void *)v118;
                                    uint64_t v27 = v174;
LABEL_171:

                                    double v28 = v175;
LABEL_172:

LABEL_173:
LABEL_174:

LABEL_175:
LABEL_176:

LABEL_177:
LABEL_178:

LABEL_179:
                                    goto LABEL_180;
                                  }
                                }
                                id v10 = v183;
                                long long v13 = v185;
                                uint64_t v27 = v174;
                                v132 = v187;
                                v64 = v168;
                                if (!v187) {
                                  goto LABEL_155;
                                }
                                id v157 = objc_alloc(MEMORY[0x1E4F28C58]);
                                uint64_t v133 = *MEMORY[0x1E4F502C8];
                                uint64_t v204 = *MEMORY[0x1E4F28568];
                                id v124 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"assets"];
                                id v205 = v124;
                                v134 = (void *)MEMORY[0x1E4F1C9E8];
                                v135 = &v205;
                                v136 = &v204;
LABEL_150:
                                v137 = [v134 dictionaryWithObjects:v135 forKeys:v136 count:1];
                                uint64_t v138 = v133;
                                v64 = v168;
                                id *v132 = (id)[v157 initWithDomain:v138 code:2 userInfo:v137];
                                goto LABEL_154;
                              }
                              if (!v115) {
                                goto LABEL_135;
                              }
                              objc_opt_class();
                              if (objc_opt_isKindOfClass()) {
                                goto LABEL_135;
                              }
                              id obj = v115;
                              if (!v187)
                              {
                                a4 = 0;
                                long long v13 = v185;
                                double v28 = v175;
                                v64 = v168;
                                goto LABEL_172;
                              }
                              id v184 = objc_alloc(MEMORY[0x1E4F28C58]);
                              uint64_t v139 = *MEMORY[0x1E4F502C8];
                              uint64_t v207 = *MEMORY[0x1E4F28568];
                              v131 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"assets"];
                              v208 = v131;
                              v140 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v208 forKeys:&v207 count:1];
                              id *v187 = (id)[v184 initWithDomain:v139 code:2 userInfo:v140];

                              a4 = 0;
                              long long v13 = v185;
LABEL_170:
                              v64 = v168;
                              goto LABEL_171;
                            }
                            if (v187)
                            {
                              id v151 = objc_alloc(MEMORY[0x1E4F28C58]);
                              uint64_t v152 = *MEMORY[0x1E4F502C8];
                              uint64_t v209 = *MEMORY[0x1E4F28568];
                              id obj = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"visibilityCategoryForUI"];
                              id v210 = obj;
                              v131 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v210 forKeys:&v209 count:1];
                              id v159 = 0;
                              a4 = 0;
                              id *v187 = (id)[v151 initWithDomain:v152 code:2 userInfo:v131];
                              uint64_t v7 = v179;
                              id v10 = v183;
                              long long v13 = v185;
                              goto LABEL_170;
                            }
                            id v159 = 0;
                            a4 = 0;
                            uint64_t v7 = v179;
                            id v10 = v183;
                            long long v13 = v185;
                            double v28 = v175;
LABEL_199:
                            v64 = v168;
                            goto LABEL_173;
                          }
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            id v161 = v104;
                            goto LABEL_116;
                          }
                          if (v187)
                          {
                            id v111 = objc_alloc(MEMORY[0x1E4F28C58]);
                            uint64_t v112 = *MEMORY[0x1E4F502C8];
                            uint64_t v211 = *MEMORY[0x1E4F28568];
                            id v159 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"ordinalRankInRecommendedTab"];
                            id v212 = v159;
                            uint64_t v113 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v212 forKeys:&v211 count:1];
                            v114 = v111;
                            double v28 = v175;
                            v158 = (void *)v113;
                            id v161 = 0;
                            a4 = 0;
                            id *v187 = (id)objc_msgSend(v114, "initWithDomain:code:userInfo:", v112, 2);
                            uint64_t v7 = v179;
                            long long v13 = v185;
                            goto LABEL_199;
                          }
                          id v161 = 0;
                          a4 = 0;
LABEL_192:
                          uint64_t v7 = v179;
                          long long v13 = v185;
                          v64 = v168;
                          goto LABEL_174;
                        }
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          id v163 = v102;
                          goto LABEL_113;
                        }
                        if (v187)
                        {
                          id v107 = objc_alloc(MEMORY[0x1E4F28C58]);
                          uint64_t v108 = *MEMORY[0x1E4F502C8];
                          uint64_t v213 = *MEMORY[0x1E4F28568];
                          id v161 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"bundleGoodnessScore"];
                          id v214 = v161;
                          uint64_t v109 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v214 forKeys:&v213 count:1];
                          v110 = v107;
                          double v28 = v175;
                          v160 = (void *)v109;
                          id v163 = 0;
                          a4 = 0;
                          id *v187 = (id)objc_msgSend(v110, "initWithDomain:code:userInfo:", v108, 2);
                          goto LABEL_192;
                        }
                        id v163 = 0;
                        a4 = 0;
                        uint64_t v7 = v179;
                        long long v13 = v185;
LABEL_167:
                        v64 = v168;
                        goto LABEL_175;
                      }
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        id v165 = v96;
                        goto LABEL_110;
                      }
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        v97 = v28;
                        v98 = NSNumber;
                        v99 = BMMomentsEventDataEventBundleBundleSuperTypeFromString(v96);
                        v100 = v98;
                        double v28 = v97;
                        id v165 = [v100 numberWithInt:v99];
                        id v10 = v183;
                        goto LABEL_110;
                      }
                      if (v187)
                      {
                        v146 = v28;
                        id v147 = objc_alloc(MEMORY[0x1E4F28C58]);
                        uint64_t v148 = *MEMORY[0x1E4F502C8];
                        uint64_t v215 = *MEMORY[0x1E4F28568];
                        id v163 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"bundleSuperType"];
                        id v216 = v163;
                        uint64_t v149 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v216 forKeys:&v215 count:1];
                        v150 = v147;
                        double v28 = v146;
                        v162 = (void *)v149;
                        id v165 = 0;
                        a4 = 0;
                        id *v187 = (id)objc_msgSend(v150, "initWithDomain:code:userInfo:", v148, 2);
                        uint64_t v7 = v179;
                        id v10 = v183;
                        long long v13 = v185;
                        goto LABEL_167;
                      }
                      id v165 = 0;
                      a4 = 0;
LABEL_197:
                      uint64_t v7 = v179;
                      id v10 = v183;
                      long long v13 = v185;
                      v64 = v168;
                      goto LABEL_176;
                    }
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v167 = v75;
                      goto LABEL_103;
                    }
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v91 = v28;
                      v92 = NSNumber;
                      v93 = BMMomentsEventDataEventBundleBundleSubTypeFromString(v75);
                      v94 = v92;
                      double v28 = v91;
                      id v167 = [v94 numberWithInt:v93];
                      id v10 = v183;
                      goto LABEL_103;
                    }
                    if (v187)
                    {
                      v141 = v28;
                      id v142 = objc_alloc(MEMORY[0x1E4F28C58]);
                      uint64_t v143 = *MEMORY[0x1E4F502C8];
                      uint64_t v217 = *MEMORY[0x1E4F28568];
                      id v165 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"bundleSubType"];
                      id v218 = v165;
                      uint64_t v144 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v218 forKeys:&v217 count:1];
                      v145 = v142;
                      double v28 = v141;
                      v164 = (void *)v144;
                      id v167 = 0;
                      a4 = 0;
                      id *v187 = (id)objc_msgSend(v145, "initWithDomain:code:userInfo:", v143, 2);
                      goto LABEL_197;
                    }
                    id v167 = 0;
                    a4 = 0;
                    uint64_t v7 = v179;
                    id v10 = v183;
                    long long v13 = v185;
                  }
                  else
                  {
                    v73 = v27;
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v187 = a4;
                      id v63 = v68;
                      double v28 = v175;
                      goto LABEL_85;
                    }
                    if (!a4)
                    {
                      id v63 = 0;
                      uint64_t v7 = v179;
                      long long v13 = v185;
                      double v28 = v175;
                      v64 = v168;
                      goto LABEL_178;
                    }
                    id v88 = objc_alloc(MEMORY[0x1E4F28C58]);
                    uint64_t v89 = *MEMORY[0x1E4F502C8];
                    uint64_t v219 = *MEMORY[0x1E4F28568];
                    v90 = a4;
                    id v167 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"bundleEvergreenType"];
                    id v220 = v167;
                    v166 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v220 forKeys:&v219 count:1];
                    id v63 = 0;
                    a4 = 0;
                    id *v90 = (id)objc_msgSend(v88, "initWithDomain:code:userInfo:", v89, 2);
                    uint64_t v7 = v179;
                    long long v13 = v185;
                    uint64_t v27 = v73;
                    double v28 = v175;
                  }
                  v64 = v168;
                  goto LABEL_177;
                }
                if (v186)
                {
                  id v85 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v86 = *MEMORY[0x1E4F502C8];
                  uint64_t v221 = *MEMORY[0x1E4F28568];
                  id v63 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"bundleInterfaceType"];
                  id v222 = v63;
                  v170 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v222 forKeys:&v221 count:1];
                  id v87 = (id)objc_msgSend(v85, "initWithDomain:code:userInfo:", v86, 2);
                  v64 = 0;
                  a4 = 0;
                  id *v186 = v87;
                  long long v13 = v185;
                  double v28 = v175;

                  goto LABEL_179;
                }
                v64 = 0;
                long long v13 = v185;
                double v28 = v175;
LABEL_180:

LABEL_181:
                self = v177;

LABEL_182:
LABEL_183:
                v71 = v176;
LABEL_184:

                goto LABEL_185;
              }
            }
          }
          if (v186)
          {
            id v69 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v70 = *MEMORY[0x1E4F502C8];
            uint64_t v232 = *MEMORY[0x1E4F28568];
            id v178 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"interfaceType"];
            id v233 = v178;
            v71 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v233 forKeys:&v232 count:1];
            uint64_t v72 = v70;
            id v10 = v183;
            id v181 = 0;
            a4 = 0;
            id *v186 = (id)[v69 initWithDomain:v72 code:2 userInfo:v71];
            long long v13 = v185;
            uint64_t v27 = v34;
            goto LABEL_184;
          }
          id v181 = 0;
          a4 = 0;
          long long v13 = v185;
LABEL_185:
          v78 = v180;
          goto LABEL_186;
        }
        if (v186)
        {
          id v80 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v81 = *MEMORY[0x1E4F502C8];
          uint64_t v234 = *MEMORY[0x1E4F28568];
          id v181 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"endDate"];
          id v235 = v181;
          uint64_t v82 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v235 forKeys:&v234 count:1];
          v83 = v80;
          double v28 = (void *)v82;
          uint64_t v84 = v81;
          id v10 = v183;
          v78 = 0;
          a4 = 0;
          id *v186 = (id)[v83 initWithDomain:v84 code:2 userInfo:v82];
          long long v13 = v185;
LABEL_186:

          goto LABEL_187;
        }
        v78 = 0;
        a4 = 0;
        long long v13 = v185;
LABEL_187:

        goto LABEL_188;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!v186)
        {
          id v10 = 0;
          a4 = 0;
          long long v13 = v185;
LABEL_188:

          goto LABEL_189;
        }
        id v76 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v77 = *MEMORY[0x1E4F502C8];
        uint64_t v236 = *MEMORY[0x1E4F28568];
        v78 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"startDate"];
        v237 = v78;
        uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v237 forKeys:&v236 count:1];
        id v79 = (id)[v76 initWithDomain:v77 code:2 userInfo:v27];
        id v10 = 0;
        a4 = 0;
        id *v186 = v79;
        long long v13 = v185;
        goto LABEL_187;
      }
      id v19 = v9;
    }
    id v10 = v19;
    goto LABEL_19;
  }
  if (a4)
  {
    id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v21 = *MEMORY[0x1E4F502C8];
    uint64_t v238 = *MEMORY[0x1E4F28568];
    long long v13 = (BMMomentsEngagementSuggestionIdentifier *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"identifier"];
    v239[0] = v13;
    uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v239 forKeys:&v238 count:1];
    uint64_t v23 = v21;
    id v10 = (id)v22;
    id v24 = (id)[v20 initWithDomain:v23 code:2 userInfo:v22];
    uint64_t v25 = a4;
    a4 = 0;
    *uint64_t v25 = v24;
LABEL_189:
  }
  return (BMMomentsEngagementBundleSummary *)a4;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMMomentsEngagementBundleSummary *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_identifier)
  {
    uint64_t v25 = 0;
    PBDataWriterPlaceMark();
    [(BMMomentsEngagementSuggestionIdentifier *)self->_identifier writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_hasRaw_startDate) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasRaw_endDate) {
    PBDataWriterWriteDoubleField();
  }
  PBDataWriterWriteUint32Field();
  if (self->_hasRankingScore) {
    PBDataWriterWriteFloatField();
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v5 = self->_attachedPhotoAssets;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v27 count:16];
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
        uint64_t v25 = 0;
        PBDataWriterPlaceMark();
        [v10 writeTo:v4];
        PBDataWriterRecallMark();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v7);
  }

  if (self->_bundleInterfaceType) {
    PBDataWriterWriteStringField();
  }
  if (self->_bundleEvergreenType) {
    PBDataWriterWriteStringField();
  }
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasBundleGoodnessScore) {
    PBDataWriterWriteFloatField();
  }
  if (self->_hasOrdinalRankInRecommendedTab) {
    PBDataWriterWriteInt32Field();
  }
  PBDataWriterWriteUint32Field();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = self->_assets;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v17 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v17 + 1) + 8 * v15);
        uint64_t v25 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v16, "writeTo:", v4, (void)v17);
        PBDataWriterRecallMark();
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v17 objects:v26 count:16];
    }
    while (v13);
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v85.receiver = self;
  v85.super_class = (Class)BMMomentsEngagementBundleSummary;
  uint64_t v5 = [(BMEventBase *)&v85 init];
  if (!v5) {
    goto LABEL_122;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v9 = (int *)MEMORY[0x1E4F940E0];
  id v10 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    id v11 = (int *)MEMORY[0x1E4F940B8];
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
          int v20 = v4[*v10];
          goto LABEL_15;
        }
      }
      v4[*v10] = 1;
LABEL_13:
      int v20 = v4[*v10];
      if (v4[*v10]) {
        unint64_t v14 = 0;
      }
LABEL_15:
      if (v20 || (v14 & 7) == 4) {
        break;
      }
      switch((v14 >> 3))
      {
        case 1u:
          uint64_t v86 = 0;
          uint64_t v87 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_124;
          }
          long long v22 = [[BMMomentsEngagementSuggestionIdentifier alloc] initByReadFrom:v4];
          if (!v22) {
            goto LABEL_124;
          }
          identifier = v5->_identifier;
          v5->_identifier = v22;

          PBReaderRecallMark();
          continue;
        case 2u:
          v5->_hasRaw_startDate = 1;
          uint64_t v24 = *v8;
          unint64_t v25 = *(void *)&v4[v24];
          if (v25 <= 0xFFFFFFFFFFFFFFF7 && v25 + 8 <= *(void *)&v4[*v9])
          {
            double v26 = *(double *)(*(void *)&v4[*v11] + v25);
            *(void *)&v4[v24] = v25 + 8;
          }
          else
          {
            v4[*v10] = 1;
            double v26 = 0.0;
          }
          uint64_t v77 = 24;
          goto LABEL_118;
        case 3u:
          v5->_hasRaw_endDate = 1;
          uint64_t v27 = *v8;
          unint64_t v28 = *(void *)&v4[v27];
          if (v28 <= 0xFFFFFFFFFFFFFFF7 && v28 + 8 <= *(void *)&v4[*v9])
          {
            double v26 = *(double *)(*(void *)&v4[*v11] + v28);
            *(void *)&v4[v27] = v28 + 8;
          }
          else
          {
            v4[*v10] = 1;
            double v26 = 0.0;
          }
          uint64_t v77 = 40;
          goto LABEL_118;
        case 4u:
          char v29 = 0;
          unsigned int v30 = 0;
          uint64_t v31 = 0;
          while (2)
          {
            uint64_t v32 = *v8;
            uint64_t v33 = *(void *)&v4[v32];
            unint64_t v34 = v33 + 1;
            if (v33 == -1 || v34 > *(void *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              char v35 = *(unsigned char *)(*(void *)&v4[*v11] + v33);
              *(void *)&v4[v32] = v34;
              v31 |= (unint64_t)(v35 & 0x7F) << v29;
              if (v35 < 0)
              {
                v29 += 7;
                BOOL v19 = v30++ >= 9;
                if (v19)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_85;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10]) {
            LODWORD(v31) = 0;
          }
LABEL_85:
          if (v31 >= 0x10) {
            LODWORD(v31) = 0;
          }
          uint64_t v76 = 56;
          goto LABEL_109;
        case 5u:
          v5->_hasRankingScore = 1;
          uint64_t v36 = *v8;
          unint64_t v37 = *(void *)&v4[v36];
          if (v37 <= 0xFFFFFFFFFFFFFFFBLL && v37 + 4 <= *(void *)&v4[*v9])
          {
            float v38 = *(float *)(*(void *)&v4[*v11] + v37);
            *(void *)&v4[v36] = v37 + 4;
          }
          else
          {
            v4[*v10] = 1;
            float v38 = 0.0;
          }
          double v26 = v38;
          uint64_t v77 = 88;
          goto LABEL_118;
        case 6u:
          uint64_t v86 = 0;
          uint64_t v87 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_124;
          }
          id v39 = [[BMMomentsEngagementPhotosAssets alloc] initByReadFrom:v4];
          if (!v39) {
            goto LABEL_124;
          }
          int v40 = v39;
          uint64_t v41 = v6;
          goto LABEL_81;
        case 7u:
          uint64_t v42 = PBReaderReadString();
          uint64_t v43 = 104;
          goto LABEL_46;
        case 8u:
          uint64_t v42 = PBReaderReadString();
          uint64_t v43 = 112;
LABEL_46:
          v44 = *(Class *)((char *)&v5->super.super.isa + v43);
          *(Class *)((char *)&v5->super.super.isa + v43) = (Class)v42;

          continue;
        case 9u:
          char v45 = 0;
          unsigned int v46 = 0;
          uint64_t v47 = 0;
          while (2)
          {
            uint64_t v48 = *v8;
            uint64_t v49 = *(void *)&v4[v48];
            unint64_t v50 = v49 + 1;
            if (v49 == -1 || v50 > *(void *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              char v51 = *(unsigned char *)(*(void *)&v4[*v11] + v49);
              *(void *)&v4[v48] = v50;
              v47 |= (unint64_t)(v51 & 0x7F) << v45;
              if (v51 < 0)
              {
                v45 += 7;
                BOOL v19 = v46++ >= 9;
                if (v19)
                {
                  uint64_t v52 = 0;
                  goto LABEL_92;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10]) {
            uint64_t v52 = 0;
          }
          else {
            uint64_t v52 = v47;
          }
LABEL_92:
          v5->_bundleSubType = BMMomentsEventDataEventBundleBundleSubTypeDecode(v52);
          continue;
        case 0xAu:
          char v53 = 0;
          unsigned int v54 = 0;
          uint64_t v31 = 0;
          while (2)
          {
            uint64_t v55 = *v8;
            uint64_t v56 = *(void *)&v4[v55];
            unint64_t v57 = v56 + 1;
            if (v56 == -1 || v57 > *(void *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              char v58 = *(unsigned char *)(*(void *)&v4[*v11] + v56);
              *(void *)&v4[v55] = v57;
              v31 |= (unint64_t)(v58 & 0x7F) << v53;
              if (v58 < 0)
              {
                v53 += 7;
                BOOL v19 = v54++ >= 9;
                if (v19)
                {
                  LODWORD(v31) = 0;
                  goto LABEL_96;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10]) {
            LODWORD(v31) = 0;
          }
LABEL_96:
          if (v31 >= 0xA) {
            LODWORD(v31) = 0;
          }
          uint64_t v76 = 64;
          goto LABEL_109;
        case 0xBu:
          v5->_hasBundleGoodnessScore = 1;
          uint64_t v59 = *v8;
          unint64_t v60 = *(void *)&v4[v59];
          if (v60 <= 0xFFFFFFFFFFFFFFFBLL && v60 + 4 <= *(void *)&v4[*v9])
          {
            float v61 = *(float *)(*(void *)&v4[*v11] + v60);
            *(void *)&v4[v59] = v60 + 4;
          }
          else
          {
            v4[*v10] = 1;
            float v61 = 0.0;
          }
          double v26 = v61;
          uint64_t v77 = 120;
LABEL_118:
          *(double *)((char *)&v5->super.super.isa + v77) = v26;
          continue;
        case 0xCu:
          char v62 = 0;
          unsigned int v63 = 0;
          uint64_t v64 = 0;
          v5->_hasOrdinalRankInRecommendedTab = 1;
          while (2)
          {
            uint64_t v65 = *v8;
            uint64_t v66 = *(void *)&v4[v65];
            unint64_t v67 = v66 + 1;
            if (v66 == -1 || v67 > *(void *)&v4[*v9])
            {
              v4[*v10] = 1;
            }
            else
            {
              char v68 = *(unsigned char *)(*(void *)&v4[*v11] + v66);
              *(void *)&v4[v65] = v67;
              v64 |= (unint64_t)(v68 & 0x7F) << v62;
              if (v68 < 0)
              {
                v62 += 7;
                BOOL v19 = v63++ >= 9;
                if (v19)
                {
                  LODWORD(v64) = 0;
                  goto LABEL_102;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v10]) {
            LODWORD(v64) = 0;
          }
LABEL_102:
          v5->_ordinalRankInRecommendedTab = v64;
          continue;
        case 0xDu:
          char v69 = 0;
          unsigned int v70 = 0;
          uint64_t v31 = 0;
          break;
        case 0xEu:
          uint64_t v86 = 0;
          uint64_t v87 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_124;
          }
          id v75 = [[BMMomentsEngagementBundleSummarySuggestionAsset alloc] initByReadFrom:v4];
          if (!v75) {
            goto LABEL_124;
          }
          int v40 = v75;
          uint64_t v41 = v7;
LABEL_81:
          [v41 addObject:v40];
          PBReaderRecallMark();

          continue;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
LABEL_124:

          goto LABEL_121;
      }
      while (1)
      {
        uint64_t v71 = *v8;
        uint64_t v72 = *(void *)&v4[v71];
        unint64_t v73 = v72 + 1;
        if (v72 == -1 || v73 > *(void *)&v4[*v9]) {
          break;
        }
        char v74 = *(unsigned char *)(*(void *)&v4[*v11] + v72);
        *(void *)&v4[v71] = v73;
        v31 |= (unint64_t)(v74 & 0x7F) << v69;
        if ((v74 & 0x80) == 0) {
          goto LABEL_104;
        }
        v69 += 7;
        BOOL v19 = v70++ >= 9;
        if (v19)
        {
          LODWORD(v31) = 0;
          goto LABEL_106;
        }
      }
      v4[*v10] = 1;
LABEL_104:
      if (v4[*v10]) {
        LODWORD(v31) = 0;
      }
LABEL_106:
      if (v31 >= 5) {
        LODWORD(v31) = 0;
      }
      uint64_t v76 = 72;
LABEL_109:
      *(_DWORD *)((char *)&v5->super.super.isa + v76) = v31;
    }
    while (*(void *)&v4[*v8] < *(void *)&v4[*v9]);
  }
  uint64_t v78 = [v6 copy];
  attachedPhotoAssets = v5->_attachedPhotoAssets;
  v5->_attachedPhotoAssets = (NSArray *)v78;

  uint64_t v80 = [v7 copy];
  assets = v5->_assets;
  v5->_assets = (NSArray *)v80;

  int v82 = v4[*v10];
  if (v82) {
LABEL_121:
  }
    v83 = 0;
  else {
LABEL_122:
  }
    v83 = v5;

  return v83;
}

- (NSString)description
{
  id v16 = [NSString alloc];
  long long v21 = [(BMMomentsEngagementBundleSummary *)self identifier];
  int v20 = [(BMMomentsEngagementBundleSummary *)self startDate];
  BOOL v19 = [(BMMomentsEngagementBundleSummary *)self endDate];
  char v18 = BMMomentsEngagementBundleInterfaceTypeAsString([(BMMomentsEngagementBundleSummary *)self interfaceType]);
  v3 = NSNumber;
  [(BMMomentsEngagementBundleSummary *)self rankingScore];
  uint64_t v15 = objc_msgSend(v3, "numberWithDouble:");
  id v4 = [(BMMomentsEngagementBundleSummary *)self attachedPhotoAssets];
  uint64_t v5 = [(BMMomentsEngagementBundleSummary *)self bundleInterfaceType];
  uint64_t v6 = [(BMMomentsEngagementBundleSummary *)self bundleEvergreenType];
  uint64_t v7 = BMMomentsEventDataEventBundleBundleSubTypeAsString([(BMMomentsEngagementBundleSummary *)self bundleSubType]);
  uint64_t v8 = BMMomentsEventDataEventBundleBundleSuperTypeAsString([(BMMomentsEngagementBundleSummary *)self bundleSuperType]);
  uint64_t v9 = NSNumber;
  [(BMMomentsEngagementBundleSummary *)self bundleGoodnessScore];
  id v10 = objc_msgSend(v9, "numberWithDouble:");
  id v11 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEngagementBundleSummary ordinalRankInRecommendedTab](self, "ordinalRankInRecommendedTab"));
  char v12 = BMMomentsEngagementBundleSummaryVisibilityCategoryForUIAsString([(BMMomentsEngagementBundleSummary *)self visibilityCategoryForUI]);
  unsigned int v13 = [(BMMomentsEngagementBundleSummary *)self assets];
  id v17 = (id)[v16 initWithFormat:@"BMMomentsEngagementBundleSummary with identifier: %@, startDate: %@, endDate: %@, interfaceType: %@, rankingScore: %@, attachedPhotoAssets: %@, bundleInterfaceType: %@, bundleEvergreenType: %@, bundleSubType: %@, bundleSuperType: %@, bundleGoodnessScore: %@, ordinalRankInRecommendedTab: %@, visibilityCategoryForUI: %@, assets: %@", v21, v20, v19, v18, v15, v4, v5, v6, v7, v8, v10, v11, v12, v13];

  return (NSString *)v17;
}

- (BMMomentsEngagementBundleSummary)initWithIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 interfaceType:(int)a6 rankingScore:(id)a7 attachedPhotoAssets:(id)a8 bundleInterfaceType:(id)a9 bundleEvergreenType:(id)a10 bundleSubType:(int)a11 bundleSuperType:(int)a12 bundleGoodnessScore:(id)a13 ordinalRankInRecommendedTab:(id)a14 visibilityCategoryForUI:(int)a15 assets:(id)a16
{
  id v40 = a3;
  id v21 = a4;
  id v41 = a5;
  id v22 = a7;
  id v39 = a8;
  id v38 = a9;
  id v37 = a10;
  id v23 = a13;
  id v24 = a14;
  id v25 = a16;
  v42.receiver = self;
  v42.super_class = (Class)BMMomentsEngagementBundleSummary;
  double v26 = [(BMEventBase *)&v42 init];
  if (v26)
  {
    v26->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v26->_identifier, a3);
    if (v21)
    {
      v26->_hasRaw_startDate = 1;
      [v21 timeIntervalSince1970];
    }
    else
    {
      v26->_hasRaw_startDate = 0;
      double v27 = -1.0;
    }
    v26->_raw_startDate = v27;
    if (v41)
    {
      v26->_hasRaw_endDate = 1;
      [v41 timeIntervalSince1970];
    }
    else
    {
      v26->_hasRaw_endDate = 0;
      double v28 = -1.0;
    }
    v26->_raw_endDate = v28;
    v26->_interfaceType = a6;
    if (v22)
    {
      v26->_hasRankingScore = 1;
      [v22 floatValue];
      double v30 = v29;
    }
    else
    {
      v26->_hasRankingScore = 0;
      double v30 = -1.0;
    }
    v26->_rankingScore = v30;
    objc_storeStrong((id *)&v26->_attachedPhotoAssets, a8);
    objc_storeStrong((id *)&v26->_bundleInterfaceType, a9);
    objc_storeStrong((id *)&v26->_bundleEvergreenType, a10);
    v26->_bundleSubType = a11;
    v26->_bundleSuperType = a12;
    if (v23)
    {
      v26->_hasBundleGoodnessScore = 1;
      [v23 floatValue];
      double v32 = v31;
    }
    else
    {
      v26->_hasBundleGoodnessScore = 0;
      double v32 = -1.0;
    }
    v26->_bundleGoodnessScore = v32;
    if (v24)
    {
      v26->_hasOrdinalRankInRecommendedTab = 1;
      int v33 = [v24 intValue];
    }
    else
    {
      v26->_hasOrdinalRankInRecommendedTab = 0;
      int v33 = -1;
    }
    v26->_ordinalRankInRecommendedTab = v33;
    v26->_visibilityCategoryForUI = a15;
    objc_storeStrong((id *)&v26->_assets, a16);
  }

  return v26;
}

+ (id)protoFields
{
  v18[14] = *MEMORY[0x1E4F143B8];
  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"identifier" number:1 type:14 subMessageClass:objc_opt_class()];
  v18[0] = v17;
  id v16 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"startDate" number:2 type:0 subMessageClass:0];
  v18[1] = v16;
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"endDate" number:3 type:0 subMessageClass:0];
  v18[2] = v15;
  unint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"interfaceType" number:4 type:4 subMessageClass:0];
  v18[3] = v14;
  unsigned int v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"rankingScore" number:5 type:1 subMessageClass:0];
  v18[4] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"attachedPhotoAssets" number:6 type:14 subMessageClass:objc_opt_class()];
  v18[5] = v2;
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleInterfaceType" number:7 type:13 subMessageClass:0];
  v18[6] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleEvergreenType" number:8 type:13 subMessageClass:0];
  v18[7] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleSubType" number:9 type:4 subMessageClass:0];
  v18[8] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleSuperType" number:10 type:4 subMessageClass:0];
  v18[9] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleGoodnessScore" number:11 type:1 subMessageClass:0];
  v18[10] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"ordinalRankInRecommendedTab" number:12 type:2 subMessageClass:0];
  v18[11] = v8;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"visibilityCategoryForUI" number:13 type:4 subMessageClass:0];
  v18[12] = v9;
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"assets" number:14 type:14 subMessageClass:objc_opt_class()];
  v18[13] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:14];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF58C8;
}

+ (id)columns
{
  v18[14] = *MEMORY[0x1E4F143B8];
  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"identifier_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_451_49820];
  id v16 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"startDate" dataType:3 requestOnly:0 fieldNumber:2 protoDataType:0 convertedType:2];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"endDate" dataType:3 requestOnly:0 fieldNumber:3 protoDataType:0 convertedType:2];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"interfaceType" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:4 convertedType:0];
  unsigned int v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"rankingScore" dataType:1 requestOnly:0 fieldNumber:5 protoDataType:1 convertedType:0];
  char v12 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"attachedPhotoAssets_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_453_49821];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleInterfaceType" dataType:2 requestOnly:0 fieldNumber:7 protoDataType:13 convertedType:0];
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleEvergreenType" dataType:2 requestOnly:0 fieldNumber:8 protoDataType:13 convertedType:0];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleSubType" dataType:0 requestOnly:0 fieldNumber:9 protoDataType:4 convertedType:0];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleSuperType" dataType:0 requestOnly:0 fieldNumber:10 protoDataType:4 convertedType:0];
  unint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bundleGoodnessScore" dataType:1 requestOnly:0 fieldNumber:11 protoDataType:1 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"ordinalRankInRecommendedTab" dataType:0 requestOnly:0 fieldNumber:12 protoDataType:2 convertedType:0];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"visibilityCategoryForUI" dataType:0 requestOnly:0 fieldNumber:13 protoDataType:4 convertedType:0];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"assets_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_455_49822];
  v18[0] = v17;
  v18[1] = v16;
  v18[2] = v2;
  v18[3] = v3;
  v18[4] = v13;
  v18[5] = v12;
  v18[6] = v4;
  v18[7] = v15;
  v18[8] = v5;
  v18[9] = v6;
  v18[10] = v14;
  v18[11] = v7;
  v18[12] = v8;
  v18[13] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:14];

  return v11;
}

id __43__BMMomentsEngagementBundleSummary_columns__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  v3 = [v2 _assetsJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __43__BMMomentsEngagementBundleSummary_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  v3 = [v2 _attachedPhotoAssetsJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __43__BMMomentsEngagementBundleSummary_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  v3 = [v2 identifier];
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

    uint64_t v8 = [[BMMomentsEngagementBundleSummary alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[13] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end