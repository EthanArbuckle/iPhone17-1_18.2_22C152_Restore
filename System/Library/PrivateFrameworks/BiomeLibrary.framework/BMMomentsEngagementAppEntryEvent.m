@interface BMMomentsEngagementAppEntryEvent
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMomentsEngagementAppEntryEvent)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMMomentsEngagementAppEntryEvent)initWithType:(int)a3 clientIdentifier:(id)a4 timestamp:(id)a5 identifier:(id)a6 startTime:(id)a7 endTime:(id)a8 totalCharacters:(id)a9 addedCharacters:(id)a10 usedPhotoAssets:(id)a11;
- (BMMomentsEngagementAppEntryEvent)initWithType:(int)a3 clientIdentifier:(id)a4 timestamp:(id)a5 identifier:(id)a6 startTime:(id)a7 endTime:(id)a8 totalCharacters:(id)a9 addedCharacters:(id)a10 usedPhotoAssets:(id)a11 appEntryEventType:(id)a12 bundleInterfaceTypes:(id)a13 bundleEvergreenTypes:(id)a14;
- (BMMomentsEngagementAppEntryEvent)initWithType:(int)a3 clientIdentifier:(id)a4 timestamp:(id)a5 identifier:(id)a6 startTime:(id)a7 endTime:(id)a8 totalCharacters:(id)a9 addedCharacters:(id)a10 usedPhotoAssets:(id)a11 appEntryEventType:(id)a12 bundleInterfaceTypes:(id)a13 bundleEvergreenTypes:(id)a14 bundleSummary:(id)a15 assets:(id)a16;
- (BMMomentsEngagementBundleSummary)bundleSummary;
- (BOOL)hasAddedCharacters;
- (BOOL)hasTotalCharacters;
- (BOOL)isEqual:(id)a3;
- (NSArray)assets;
- (NSArray)bundleEvergreenTypes;
- (NSArray)bundleInterfaceTypes;
- (NSArray)identifier;
- (NSArray)usedPhotoAssets;
- (NSDate)endTime;
- (NSDate)startTime;
- (NSDate)timestamp;
- (NSString)appEntryEventType;
- (NSString)clientIdentifier;
- (NSString)description;
- (id)_assetsJSONArray;
- (id)_bundleEvergreenTypesJSONArray;
- (id)_bundleInterfaceTypesJSONArray;
- (id)_identifierJSONArray;
- (id)_usedPhotoAssetsJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)addedCharacters;
- (int)totalCharacters;
- (int)type;
- (unsigned)dataVersion;
- (void)setHasAddedCharacters:(BOOL)a3;
- (void)setHasTotalCharacters:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMMomentsEngagementAppEntryEvent

- (BMMomentsEngagementAppEntryEvent)initWithType:(int)a3 clientIdentifier:(id)a4 timestamp:(id)a5 identifier:(id)a6 startTime:(id)a7 endTime:(id)a8 totalCharacters:(id)a9 addedCharacters:(id)a10 usedPhotoAssets:(id)a11 appEntryEventType:(id)a12 bundleInterfaceTypes:(id)a13 bundleEvergreenTypes:(id)a14
{
  return [(BMMomentsEngagementAppEntryEvent *)self initWithType:*(void *)&a3 clientIdentifier:a4 timestamp:a5 identifier:a6 startTime:a7 endTime:a8 totalCharacters:a9 addedCharacters:a10 usedPhotoAssets:a11 appEntryEventType:a12 bundleInterfaceTypes:a13 bundleEvergreenTypes:a14 bundleSummary:0 assets:MEMORY[0x1E4F1CBF0]];
}

- (BMMomentsEngagementAppEntryEvent)initWithType:(int)a3 clientIdentifier:(id)a4 timestamp:(id)a5 identifier:(id)a6 startTime:(id)a7 endTime:(id)a8 totalCharacters:(id)a9 addedCharacters:(id)a10 usedPhotoAssets:(id)a11
{
  return [(BMMomentsEngagementAppEntryEvent *)self initWithType:*(void *)&a3 clientIdentifier:a4 timestamp:a5 identifier:a6 startTime:a7 endTime:a8 totalCharacters:a9 addedCharacters:a10 usedPhotoAssets:a11 appEntryEventType:0 bundleInterfaceTypes:MEMORY[0x1E4F1CBF0] bundleEvergreenTypes:MEMORY[0x1E4F1CBF0]];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_bundleSummary, 0);
  objc_storeStrong((id *)&self->_bundleEvergreenTypes, 0);
  objc_storeStrong((id *)&self->_bundleInterfaceTypes, 0);
  objc_storeStrong((id *)&self->_appEntryEventType, 0);
  objc_storeStrong((id *)&self->_usedPhotoAssets, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

- (NSArray)assets
{
  return self->_assets;
}

- (BMMomentsEngagementBundleSummary)bundleSummary
{
  return self->_bundleSummary;
}

- (NSArray)bundleEvergreenTypes
{
  return self->_bundleEvergreenTypes;
}

- (NSArray)bundleInterfaceTypes
{
  return self->_bundleInterfaceTypes;
}

- (NSString)appEntryEventType
{
  return self->_appEntryEventType;
}

- (NSArray)usedPhotoAssets
{
  return self->_usedPhotoAssets;
}

- (void)setHasAddedCharacters:(BOOL)a3
{
  self->_hasAddedCharacters = a3;
}

- (BOOL)hasAddedCharacters
{
  return self->_hasAddedCharacters;
}

- (int)addedCharacters
{
  return self->_addedCharacters;
}

- (void)setHasTotalCharacters:(BOOL)a3
{
  self->_hasTotalCharacters = a3;
}

- (BOOL)hasTotalCharacters
{
  return self->_hasTotalCharacters;
}

- (int)totalCharacters
{
  return self->_totalCharacters;
}

- (NSArray)identifier
{
  return self->_identifier;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (int)type
{
  return self->_type;
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
    int v6 = [(BMMomentsEngagementAppEntryEvent *)self type];
    if (v6 == [v5 type])
    {
      v7 = [(BMMomentsEngagementAppEntryEvent *)self clientIdentifier];
      uint64_t v8 = [v5 clientIdentifier];
      if (v7 == (void *)v8)
      {
      }
      else
      {
        v9 = (void *)v8;
        v10 = [(BMMomentsEngagementAppEntryEvent *)self clientIdentifier];
        v11 = [v5 clientIdentifier];
        int v12 = [v10 isEqual:v11];

        if (!v12) {
          goto LABEL_52;
        }
      }
      v14 = [(BMMomentsEngagementAppEntryEvent *)self timestamp];
      uint64_t v15 = [v5 timestamp];
      if (v14 == (void *)v15)
      {
      }
      else
      {
        v16 = (void *)v15;
        v17 = [(BMMomentsEngagementAppEntryEvent *)self timestamp];
        v18 = [v5 timestamp];
        int v19 = [v17 isEqual:v18];

        if (!v19) {
          goto LABEL_52;
        }
      }
      v20 = [(BMMomentsEngagementAppEntryEvent *)self identifier];
      uint64_t v21 = [v5 identifier];
      if (v20 == (void *)v21)
      {
      }
      else
      {
        v22 = (void *)v21;
        v23 = [(BMMomentsEngagementAppEntryEvent *)self identifier];
        v24 = [v5 identifier];
        int v25 = [v23 isEqual:v24];

        if (!v25) {
          goto LABEL_52;
        }
      }
      v26 = [(BMMomentsEngagementAppEntryEvent *)self startTime];
      uint64_t v27 = [v5 startTime];
      if (v26 == (void *)v27)
      {
      }
      else
      {
        v28 = (void *)v27;
        v29 = [(BMMomentsEngagementAppEntryEvent *)self startTime];
        v30 = [v5 startTime];
        int v31 = [v29 isEqual:v30];

        if (!v31) {
          goto LABEL_52;
        }
      }
      v32 = [(BMMomentsEngagementAppEntryEvent *)self endTime];
      uint64_t v33 = [v5 endTime];
      if (v32 == (void *)v33)
      {
      }
      else
      {
        v34 = (void *)v33;
        v35 = [(BMMomentsEngagementAppEntryEvent *)self endTime];
        v36 = [v5 endTime];
        int v37 = [v35 isEqual:v36];

        if (!v37) {
          goto LABEL_52;
        }
      }
      if ([(BMMomentsEngagementAppEntryEvent *)self hasTotalCharacters]
        || [v5 hasTotalCharacters])
      {
        if (![(BMMomentsEngagementAppEntryEvent *)self hasTotalCharacters]) {
          goto LABEL_52;
        }
        if (![v5 hasTotalCharacters]) {
          goto LABEL_52;
        }
        int v38 = [(BMMomentsEngagementAppEntryEvent *)self totalCharacters];
        if (v38 != [v5 totalCharacters]) {
          goto LABEL_52;
        }
      }
      if ([(BMMomentsEngagementAppEntryEvent *)self hasAddedCharacters]
        || [v5 hasAddedCharacters])
      {
        if (![(BMMomentsEngagementAppEntryEvent *)self hasAddedCharacters]) {
          goto LABEL_52;
        }
        if (![v5 hasAddedCharacters]) {
          goto LABEL_52;
        }
        int v39 = [(BMMomentsEngagementAppEntryEvent *)self addedCharacters];
        if (v39 != [v5 addedCharacters]) {
          goto LABEL_52;
        }
      }
      v40 = [(BMMomentsEngagementAppEntryEvent *)self usedPhotoAssets];
      uint64_t v41 = [v5 usedPhotoAssets];
      if (v40 == (void *)v41)
      {
      }
      else
      {
        v42 = (void *)v41;
        v43 = [(BMMomentsEngagementAppEntryEvent *)self usedPhotoAssets];
        v44 = [v5 usedPhotoAssets];
        int v45 = [v43 isEqual:v44];

        if (!v45) {
          goto LABEL_52;
        }
      }
      v46 = [(BMMomentsEngagementAppEntryEvent *)self appEntryEventType];
      uint64_t v47 = [v5 appEntryEventType];
      if (v46 == (void *)v47)
      {
      }
      else
      {
        v48 = (void *)v47;
        v49 = [(BMMomentsEngagementAppEntryEvent *)self appEntryEventType];
        v50 = [v5 appEntryEventType];
        int v51 = [v49 isEqual:v50];

        if (!v51) {
          goto LABEL_52;
        }
      }
      v52 = [(BMMomentsEngagementAppEntryEvent *)self bundleInterfaceTypes];
      uint64_t v53 = [v5 bundleInterfaceTypes];
      if (v52 == (void *)v53)
      {
      }
      else
      {
        v54 = (void *)v53;
        v55 = [(BMMomentsEngagementAppEntryEvent *)self bundleInterfaceTypes];
        v56 = [v5 bundleInterfaceTypes];
        int v57 = [v55 isEqual:v56];

        if (!v57) {
          goto LABEL_52;
        }
      }
      v58 = [(BMMomentsEngagementAppEntryEvent *)self bundleEvergreenTypes];
      uint64_t v59 = [v5 bundleEvergreenTypes];
      if (v58 == (void *)v59)
      {
      }
      else
      {
        v60 = (void *)v59;
        v61 = [(BMMomentsEngagementAppEntryEvent *)self bundleEvergreenTypes];
        v62 = [v5 bundleEvergreenTypes];
        int v63 = [v61 isEqual:v62];

        if (!v63) {
          goto LABEL_52;
        }
      }
      v64 = [(BMMomentsEngagementAppEntryEvent *)self bundleSummary];
      uint64_t v65 = [v5 bundleSummary];
      if (v64 == (void *)v65)
      {
      }
      else
      {
        v66 = (void *)v65;
        v67 = [(BMMomentsEngagementAppEntryEvent *)self bundleSummary];
        v68 = [v5 bundleSummary];
        int v69 = [v67 isEqual:v68];

        if (!v69) {
          goto LABEL_52;
        }
      }
      v71 = [(BMMomentsEngagementAppEntryEvent *)self assets];
      v72 = [v5 assets];
      if (v71 == v72)
      {
        char v13 = 1;
      }
      else
      {
        v73 = [(BMMomentsEngagementAppEntryEvent *)self assets];
        v74 = [v5 assets];
        char v13 = [v73 isEqual:v74];
      }
      goto LABEL_53;
    }
LABEL_52:
    char v13 = 0;
LABEL_53:

    goto LABEL_54;
  }
  char v13 = 0;
LABEL_54:

  return v13;
}

- (NSDate)endTime
{
  if (self->_hasRaw_endTime)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_endTime];
    id v4 = [v2 convertValue:v3 toType:2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (NSDate)startTime
{
  if (self->_hasRaw_startTime)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_startTime];
    id v4 = [v2 convertValue:v3 toType:2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (NSDate)timestamp
{
  if (self->_hasRaw_timestamp)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_timestamp];
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
  v54[14] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEngagementAppEntryEvent type](self, "type"));
  uint64_t v4 = [(BMMomentsEngagementAppEntryEvent *)self clientIdentifier];
  id v5 = [(BMMomentsEngagementAppEntryEvent *)self timestamp];
  if (v5)
  {
    int v6 = NSNumber;
    v7 = [(BMMomentsEngagementAppEntryEvent *)self timestamp];
    [v7 timeIntervalSince1970];
    objc_msgSend(v6, "numberWithDouble:");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = 0;
  }

  uint64_t v9 = [(BMMomentsEngagementAppEntryEvent *)self _identifierJSONArray];
  v10 = [(BMMomentsEngagementAppEntryEvent *)self startTime];
  if (v10)
  {
    v11 = NSNumber;
    int v12 = [(BMMomentsEngagementAppEntryEvent *)self startTime];
    [v12 timeIntervalSince1970];
    objc_msgSend(v11, "numberWithDouble:");
    id v52 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v52 = 0;
  }

  char v13 = [(BMMomentsEngagementAppEntryEvent *)self endTime];
  if (v13)
  {
    v14 = NSNumber;
    uint64_t v15 = [(BMMomentsEngagementAppEntryEvent *)self endTime];
    [v15 timeIntervalSince1970];
    objc_msgSend(v14, "numberWithDouble:");
    id v51 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v51 = 0;
  }

  if ([(BMMomentsEngagementAppEntryEvent *)self hasTotalCharacters])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEngagementAppEntryEvent totalCharacters](self, "totalCharacters"));
    id v50 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v50 = 0;
  }
  if ([(BMMomentsEngagementAppEntryEvent *)self hasAddedCharacters])
  {
    objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEngagementAppEntryEvent addedCharacters](self, "addedCharacters"));
    id v49 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v49 = 0;
  }
  v48 = [(BMMomentsEngagementAppEntryEvent *)self _usedPhotoAssetsJSONArray];
  uint64_t v47 = [(BMMomentsEngagementAppEntryEvent *)self appEntryEventType];
  v46 = [(BMMomentsEngagementAppEntryEvent *)self _bundleInterfaceTypesJSONArray];
  int v45 = [(BMMomentsEngagementAppEntryEvent *)self _bundleEvergreenTypesJSONArray];
  v16 = [(BMMomentsEngagementAppEntryEvent *)self bundleSummary];
  v17 = [v16 jsonDictionary];

  v18 = [(BMMomentsEngagementAppEntryEvent *)self _assetsJSONArray];
  v53[0] = @"type";
  uint64_t v19 = v3;
  if (!v3)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  int v39 = (void *)v19;
  v54[0] = v19;
  v53[1] = @"clientIdentifier";
  uint64_t v20 = v4;
  if (!v4)
  {
    uint64_t v20 = [MEMORY[0x1E4F1CA98] null];
  }
  int v38 = (void *)v20;
  v54[1] = v20;
  v53[2] = @"timestamp";
  uint64_t v21 = (uint64_t)v8;
  if (!v8)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
  }
  int v37 = (void *)v21;
  v54[2] = v21;
  v53[3] = @"identifier";
  uint64_t v22 = v9;
  if (!v9)
  {
    uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v36 = (void *)v22;
  v54[3] = v22;
  v53[4] = @"startTime";
  uint64_t v23 = (uint64_t)v52;
  if (!v52)
  {
    uint64_t v23 = [MEMORY[0x1E4F1CA98] null];
  }
  v44 = (void *)v3;
  v54[4] = v23;
  v53[5] = @"endTime";
  uint64_t v24 = (uint64_t)v51;
  if (!v51)
  {
    uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
  }
  v43 = (void *)v4;
  v54[5] = v24;
  v53[6] = @"totalCharacters";
  int v25 = v50;
  if (!v50)
  {
    int v25 = [MEMORY[0x1E4F1CA98] null];
  }
  v42 = v8;
  v54[6] = v25;
  v53[7] = @"addedCharacters";
  v26 = v49;
  if (!v49)
  {
    v26 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v41 = (void *)v9;
  v54[7] = v26;
  v53[8] = @"usedPhotoAssets";
  uint64_t v27 = v48;
  if (!v48)
  {
    uint64_t v27 = [MEMORY[0x1E4F1CA98] null];
  }
  v35 = (void *)v23;
  v54[8] = v27;
  v53[9] = @"appEntryEventType";
  v28 = v47;
  if (!v47)
  {
    v28 = [MEMORY[0x1E4F1CA98] null];
  }
  v34 = (void *)v24;
  v54[9] = v28;
  v53[10] = @"bundleInterfaceTypes";
  v29 = v46;
  if (!v46)
  {
    v29 = [MEMORY[0x1E4F1CA98] null];
  }
  v54[10] = v29;
  v53[11] = @"bundleEvergreenTypes";
  v30 = v45;
  if (!v45)
  {
    v30 = [MEMORY[0x1E4F1CA98] null];
  }
  v54[11] = v30;
  v53[12] = @"bundleSummary";
  int v31 = v17;
  if (!v17)
  {
    int v31 = [MEMORY[0x1E4F1CA98] null];
  }
  v54[12] = v31;
  v53[13] = @"assets";
  v32 = v18;
  if (!v18)
  {
    v32 = [MEMORY[0x1E4F1CA98] null];
  }
  v54[13] = v32;
  id v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:14];
  if (v18)
  {
    if (v17) {
      goto LABEL_46;
    }
  }
  else
  {

    if (v17) {
      goto LABEL_46;
    }
  }

LABEL_46:
  if (!v45) {

  }
  if (!v46) {
  if (!v47)
  }

  if (!v48) {
  if (!v49)
  }

  if (!v50) {
  if (!v51)
  }

  if (v52)
  {
    if (v41) {
      goto LABEL_62;
    }
  }
  else
  {

    if (v41)
    {
LABEL_62:
      if (v42) {
        goto LABEL_63;
      }
      goto LABEL_72;
    }
  }

  if (v42)
  {
LABEL_63:
    if (v43) {
      goto LABEL_64;
    }
LABEL_73:

    if (v44) {
      goto LABEL_65;
    }
    goto LABEL_74;
  }
LABEL_72:

  if (!v43) {
    goto LABEL_73;
  }
LABEL_64:
  if (v44) {
    goto LABEL_65;
  }
LABEL_74:

LABEL_65:

  return v40;
}

- (id)_assetsJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(BMMomentsEngagementAppEntryEvent *)self assets];
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
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) jsonDictionary];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_bundleEvergreenTypesJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [(BMMomentsEngagementAppEntryEvent *)self bundleEvergreenTypes];
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

- (id)_bundleInterfaceTypesJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [(BMMomentsEngagementAppEntryEvent *)self bundleInterfaceTypes];
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

- (id)_usedPhotoAssetsJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(BMMomentsEngagementAppEntryEvent *)self usedPhotoAssets];
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
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) jsonDictionary];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_identifierJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(BMMomentsEngagementAppEntryEvent *)self identifier];
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
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) jsonDictionary];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BMMomentsEngagementAppEntryEvent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v305[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"type"];
  unint64_t v8 = 0x1E4F1C000uLL;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v7;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v55 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v56 = *MEMORY[0x1E4F502C8];
          uint64_t v304 = *MEMORY[0x1E4F28568];
          int v45 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"type"];
          v305[0] = v45;
          v225 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v305 forKeys:&v304 count:1];
          id v9 = 0;
          uint64_t v23 = 0;
          *a4 = (id)objc_msgSend(v55, "initWithDomain:code:userInfo:", v56, 2);
          goto LABEL_245;
        }
        id v9 = 0;
        uint64_t v23 = 0;
        goto LABEL_246;
      }
      id v10 = v7;
      id v9 = [NSNumber numberWithInt:BMMomentsEngagementAppEntryEventTypeFromString(v10)];
    }
  }
  else
  {
    id v9 = 0;
  }
  uint64_t v11 = [v6 objectForKeyedSubscript:@"clientIdentifier"];
  v225 = (void *)v11;
  if (v11 && (long long v12 = (void *)v11, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v39 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v40 = *MEMORY[0x1E4F502C8];
        uint64_t v302 = *MEMORY[0x1E4F28568];
        id v41 = v9;
        id v42 = [NSString alloc];
        uint64_t v187 = objc_opt_class();
        v43 = v42;
        id v9 = v41;
        v44 = (void *)[v43 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v187, @"clientIdentifier"];
        v303 = v44;
        v224 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v303 forKeys:&v302 count:1];
        int v45 = 0;
        uint64_t v23 = 0;
        *a4 = (id)objc_msgSend(v39, "initWithDomain:code:userInfo:", v40, 2);
        goto LABEL_244;
      }
      int v45 = 0;
      uint64_t v23 = 0;
      goto LABEL_245;
    }
    id v222 = v12;
  }
  else
  {
    id v222 = 0;
  }
  v223 = a4;
  uint64_t v13 = [v6 objectForKeyedSubscript:@"timestamp"];
  v224 = (void *)v13;
  if (v13 && (long long v14 = (void *)v13, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v37 = v14;
      id v38 = objc_alloc(MEMORY[0x1E4F1C9C8]);
      [v37 doubleValue];
      id v220 = (id)objc_msgSend(v38, "initWithTimeIntervalSince1970:");
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v53 = objc_alloc_init(MEMORY[0x1E4F28D48]);
        id v54 = v14;
        id v220 = [v53 dateFromString:v54];
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v23 = (BMMomentsEngagementAppEntryEvent *)a4;
          if (a4)
          {
            id v88 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v89 = *MEMORY[0x1E4F502C8];
            uint64_t v300 = *MEMORY[0x1E4F28568];
            id v90 = v9;
            id v91 = [NSString alloc];
            uint64_t v188 = objc_opt_class();
            v92 = v91;
            id v9 = v90;
            id v15 = (id)[v92 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", v188, @"timestamp"];
            id v301 = v15;
            v228 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v301 forKeys:&v300 count:1];
            v44 = 0;
            uint64_t v23 = 0;
            id *v223 = (id)objc_msgSend(v88, "initWithDomain:code:userInfo:", v89, 2);
            int v45 = v222;

            goto LABEL_243;
          }
          v44 = 0;
          int v45 = v222;
          goto LABEL_244;
        }
        id v220 = v14;
      }
      unint64_t v8 = 0x1E4F1C000;
    }
  }
  else
  {
    id v220 = 0;
  }
  id v15 = [v6 objectForKeyedSubscript:@"identifier"];
  uint64_t v16 = [*(id *)(v8 + 2712) null];
  int v17 = [v15 isEqual:v16];

  v221 = v7;
  if (v17)
  {

    id v15 = 0;
  }
  else if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (v223)
      {
        id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v19 = *MEMORY[0x1E4F502C8];
        uint64_t v298 = *MEMORY[0x1E4F28568];
        v227 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"identifier"];
        v299 = v227;
        uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v299 forKeys:&v298 count:1];
        uint64_t v21 = v18;
        id v22 = (id)v20;
        uint64_t v23 = 0;
        id *v223 = (id)[v21 initWithDomain:v19 code:2 userInfo:v20];
        goto LABEL_55;
      }
      uint64_t v23 = 0;
      int v45 = v222;
      v44 = v220;
      goto LABEL_243;
    }
  }
  v227 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v15, "count"));
  long long v249 = 0u;
  long long v250 = 0u;
  long long v251 = 0u;
  long long v252 = 0u;
  id v15 = v15;
  uint64_t v24 = [v15 countByEnumeratingWithState:&v249 objects:v297 count:16];
  v218 = self;
  v219 = v9;
  v226 = v15;
  if (!v24)
  {
LABEL_31:

    id v30 = [v6 objectForKeyedSubscript:@"startTime"];
    if (v30 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v57 = v30;
        id v58 = objc_alloc(MEMORY[0x1E4F1C9C8]);
        [v57 doubleValue];
        id v22 = (id)objc_msgSend(v58, "initWithTimeIntervalSince1970:");
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v62 = objc_alloc_init(MEMORY[0x1E4F28D48]);
          id v63 = v30;
          uint64_t v64 = [v62 dateFromString:v63];

          id v22 = (id)v64;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            id v22 = v223;
            if (!v223)
            {
              uint64_t v23 = 0;
              int v45 = v222;
              v44 = v220;
LABEL_241:

              id v15 = v226;
              goto LABEL_242;
            }
            id v126 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v127 = *MEMORY[0x1E4F502C8];
            uint64_t v291 = *MEMORY[0x1E4F28568];
            id v36 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"startTime"];
            id v292 = v36;
            v212 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v292 forKeys:&v291 count:1];
            id v128 = (id)objc_msgSend(v126, "initWithDomain:code:userInfo:", v127, 2);
            uint64_t v23 = 0;
            id *v223 = v128;
            id v22 = 0;
            int v45 = v222;
            v44 = v220;

LABEL_240:
            id v9 = v219;
            goto LABEL_241;
          }
          id v22 = v30;
        }
      }
    }
    else
    {
      id v22 = 0;
    }
    uint64_t v34 = [v6 objectForKeyedSubscript:@"endTime"];
    v211 = (void *)v34;
    id v213 = v22;
    if (!v34 || (v35 = (void *)v34, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v36 = 0;
      goto LABEL_72;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v59 = v35;
      id v60 = objc_alloc(MEMORY[0x1E4F1C9C8]);
      [v59 doubleValue];
      v61 = v60;
      id v22 = v213;
      id v36 = (id)objc_msgSend(v61, "initWithTimeIntervalSince1970:");
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!v223)
          {
            id v36 = 0;
            uint64_t v23 = 0;
            int v45 = v222;
            v44 = v220;
LABEL_239:

            goto LABEL_240;
          }
          id v129 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v130 = *MEMORY[0x1E4F502C8];
          uint64_t v289 = *MEMORY[0x1E4F28568];
          id v209 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"endTime"];
          id v290 = v209;
          v210 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v290 forKeys:&v289 count:1];
          id v131 = (id)objc_msgSend(v129, "initWithDomain:code:userInfo:", v130, 2);
          id v36 = 0;
          uint64_t v23 = 0;
          id *v223 = v131;
          int v45 = v222;
          v44 = v220;
          goto LABEL_238;
        }
        id v36 = v35;
LABEL_72:
        uint64_t v66 = [v6 objectForKeyedSubscript:@"totalCharacters"];
        v210 = (void *)v66;
        if (!v66 || (v67 = (void *)v66, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v209 = 0;
          goto LABEL_75;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v209 = v67;
LABEL_75:
          uint64_t v68 = [v6 objectForKeyedSubscript:@"addedCharacters"];
          v208 = (void *)v68;
          if (!v68 || (int v69 = (void *)v68, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            id v204 = 0;
LABEL_78:
            v70 = [v6 objectForKeyedSubscript:@"usedPhotoAssets"];
            v71 = [MEMORY[0x1E4F1CA98] null];
            int v72 = [v70 isEqual:v71];

            if (v72)
            {

              v70 = 0;
              goto LABEL_82;
            }
            if (!v70 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
LABEL_82:
              v216 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v70, "count"));
              long long v244 = 0u;
              long long v245 = 0u;
              long long v246 = 0u;
              long long v247 = 0u;
              id obj = v70;
              uint64_t v73 = [obj countByEnumeratingWithState:&v244 objects:v282 count:16];
              if (!v73) {
                goto LABEL_92;
              }
              uint64_t v74 = v73;
              uint64_t v75 = *(void *)v245;
              id v201 = v6;
LABEL_84:
              uint64_t v76 = 0;
              while (1)
              {
                if (*(void *)v245 != v75) {
                  objc_enumerationMutation(obj);
                }
                v77 = *(void **)(*((void *)&v244 + 1) + 8 * v76);
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  break;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  if (v223)
                  {
                    id v101 = objc_alloc(MEMORY[0x1E4F28C58]);
                    uint64_t v102 = *MEMORY[0x1E4F502C8];
                    uint64_t v278 = *MEMORY[0x1E4F28568];
                    uint64_t v203 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"usedPhotoAssets"];
                    uint64_t v279 = v203;
                    id v99 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v279 forKeys:&v278 count:1];
                    id v103 = (id)[v101 initWithDomain:v102 code:2 userInfo:v99];
                    uint64_t v23 = 0;
                    id *v223 = v103;
                    goto LABEL_113;
                  }
                  goto LABEL_116;
                }
                id v78 = v77;
                v79 = [BMMomentsEngagementPhotosAssets alloc];
                id v243 = 0;
                v80 = [(BMMomentsEngagementPhotosAssets *)v79 initWithJSONDictionary:v78 error:&v243];
                id v81 = v243;
                if (v81)
                {
                  id v99 = v81;
                  uint64_t v203 = (uint64_t)v78;
                  if (v223) {
                    id *v223 = v81;
                  }

                  uint64_t v23 = 0;
                  goto LABEL_113;
                }
                [v216 addObject:v80];

                if (v74 == ++v76)
                {
                  uint64_t v74 = [obj countByEnumeratingWithState:&v244 objects:v282 count:16];
                  id v6 = v201;
                  if (!v74)
                  {
LABEL_92:

                    uint64_t v82 = [v6 objectForKeyedSubscript:@"appEntryEventType"];
                    uint64_t v203 = v82;
                    if (v82)
                    {
                      v83 = (void *)v82;
                      objc_opt_class();
                      self = v218;
                      if (objc_opt_isKindOfClass())
                      {
                        id v197 = 0;
                      }
                      else
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) == 0)
                        {
                          uint64_t v7 = v221;
                          if (v223)
                          {
                            id v206 = objc_alloc(MEMORY[0x1E4F28C58]);
                            uint64_t v132 = *MEMORY[0x1E4F502C8];
                            uint64_t v276 = *MEMORY[0x1E4F28568];
                            id v99 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"appEntryEventType"];
                            id v277 = v99;
                            uint64_t v133 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v277 forKeys:&v276 count:1];
                            v134 = v206;
                            v207 = (void *)v133;
                            id v135 = (id)objc_msgSend(v134, "initWithDomain:code:userInfo:", v132, 2);
                            v104 = 0;
                            uint64_t v23 = 0;
                            id *v223 = v135;
                            id v22 = v213;

                            goto LABEL_232;
                          }
                          v104 = 0;
                          uint64_t v23 = 0;
                          id v22 = v213;
                          goto LABEL_233;
                        }
                        id v197 = v83;
                      }
                    }
                    else
                    {
                      id v197 = 0;
                      self = v218;
                    }
                    id v99 = [v6 objectForKeyedSubscript:@"bundleInterfaceTypes"];
                    v107 = [MEMORY[0x1E4F1CA98] null];
                    int v108 = [v99 isEqual:v107];

                    id v22 = v213;
                    if (v108)
                    {

                      id v99 = 0;
                      uint64_t v7 = v221;
                    }
                    else
                    {
                      uint64_t v7 = v221;
                      if (v99)
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) == 0)
                        {
                          if (!v223)
                          {
                            uint64_t v23 = 0;
                            v104 = v197;
                            goto LABEL_232;
                          }
                          id v200 = objc_alloc(MEMORY[0x1E4F28C58]);
                          uint64_t v145 = *MEMORY[0x1E4F502C8];
                          uint64_t v274 = *MEMORY[0x1E4F28568];
                          v205 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"bundleInterfaceTypes"];
                          v275 = v205;
                          v116 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v275 forKeys:&v274 count:1];
                          id v146 = (id)[v200 initWithDomain:v145 code:2 userInfo:v116];
                          uint64_t v23 = 0;
                          id *v223 = v146;
                          goto LABEL_173;
                        }
                      }
                    }
                    v205 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v99, "count"));
                    long long v239 = 0u;
                    long long v240 = 0u;
                    long long v241 = 0u;
                    long long v242 = 0u;
                    id v99 = v99;
                    uint64_t v109 = [v99 countByEnumeratingWithState:&v239 objects:v273 count:16];
                    if (!v109) {
                      goto LABEL_137;
                    }
                    uint64_t v110 = v109;
                    uint64_t v111 = *(void *)v240;
                    while (1)
                    {
                      id v112 = v6;
                      for (uint64_t i = 0; i != v110; ++i)
                      {
                        if (*(void *)v240 != v111) {
                          objc_enumerationMutation(v99);
                        }
                        v114 = *(void **)(*((void *)&v239 + 1) + 8 * i);
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          if (v223)
                          {
                            id v119 = objc_alloc(MEMORY[0x1E4F28C58]);
                            uint64_t v120 = *MEMORY[0x1E4F502C8];
                            uint64_t v271 = *MEMORY[0x1E4F28568];
                            v199 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"bundleInterfaceTypes"];
                            v272 = v199;
                            uint64_t v121 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v272 forKeys:&v271 count:1];
                            v122 = v119;
                            uint64_t v123 = v120;
LABEL_147:
                            v196 = (void *)v121;
                            id v6 = v112;
                            id v22 = v213;
                            uint64_t v23 = 0;
                            id *v223 = (id)objc_msgSend(v122, "initWithDomain:code:userInfo:", v123, 2);
                            v116 = v99;
                            self = v218;
                            goto LABEL_148;
                          }
LABEL_154:
                          uint64_t v23 = 0;
                          v116 = v99;
                          id v6 = v112;
                          self = v218;
                          id v22 = v213;
LABEL_173:
                          v104 = v197;
                          goto LABEL_231;
                        }
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) == 0)
                        {
                          if (v223)
                          {
                            id v124 = objc_alloc(MEMORY[0x1E4F28C58]);
                            uint64_t v125 = *MEMORY[0x1E4F502C8];
                            uint64_t v269 = *MEMORY[0x1E4F28568];
                            v199 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"bundleInterfaceTypes"];
                            v270 = v199;
                            uint64_t v121 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v270 forKeys:&v269 count:1];
                            v122 = v124;
                            uint64_t v123 = v125;
                            goto LABEL_147;
                          }
                          goto LABEL_154;
                        }
                        id v115 = v114;
                        [v205 addObject:v115];
                      }
                      uint64_t v110 = [v99 countByEnumeratingWithState:&v239 objects:v273 count:16];
                      id v6 = v112;
                      self = v218;
                      if (!v110)
                      {
LABEL_137:

                        v116 = [v6 objectForKeyedSubscript:@"bundleEvergreenTypes"];
                        v117 = [MEMORY[0x1E4F1CA98] null];
                        int v118 = [v116 isEqual:v117];

                        if (v118)
                        {

                          v116 = 0;
                        }
                        else if (v116)
                        {
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                          {
                            id v198 = v116;
                            if (!v223)
                            {
                              uint64_t v23 = 0;
                              id v22 = v213;
                              v104 = v197;
                              goto LABEL_231;
                            }
                            id v154 = objc_alloc(MEMORY[0x1E4F28C58]);
                            uint64_t v155 = *MEMORY[0x1E4F502C8];
                            uint64_t v267 = *MEMORY[0x1E4F28568];
                            v199 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"bundleEvergreenTypes"];
                            v268 = v199;
                            v196 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v268 forKeys:&v267 count:1];
                            id v156 = (id)objc_msgSend(v154, "initWithDomain:code:userInfo:", v155, 2);
                            uint64_t v23 = 0;
                            id *v223 = v156;
                            goto LABEL_186;
                          }
                        }
                        v199 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v116, "count"));
                        long long v235 = 0u;
                        long long v236 = 0u;
                        long long v237 = 0u;
                        long long v238 = 0u;
                        id v198 = v116;
                        uint64_t v136 = [v198 countByEnumeratingWithState:&v235 objects:v266 count:16];
                        if (!v136) {
                          goto LABEL_168;
                        }
                        uint64_t v137 = v136;
                        uint64_t v138 = *(void *)v236;
LABEL_161:
                        id v139 = v6;
                        uint64_t v140 = 0;
                        while (1)
                        {
                          if (*(void *)v236 != v138) {
                            objc_enumerationMutation(v198);
                          }
                          v141 = *(void **)(*((void *)&v235 + 1) + 8 * v140);
                          objc_opt_class();
                          if (objc_opt_isKindOfClass()) {
                            break;
                          }
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                          {
                            if (v223)
                            {
                              id v152 = objc_alloc(MEMORY[0x1E4F28C58]);
                              uint64_t v153 = *MEMORY[0x1E4F502C8];
                              uint64_t v262 = *MEMORY[0x1E4F28568];
                              v190 = (BMMomentsEngagementBundleSummary *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"bundleEvergreenTypes"];
                              v263 = v190;
                              uint64_t v149 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v263 forKeys:&v262 count:1];
                              v150 = v152;
                              uint64_t v151 = v153;
                              goto LABEL_178;
                            }
                            goto LABEL_182;
                          }
                          id v142 = v141;
                          [v199 addObject:v142];

                          if (v137 == ++v140)
                          {
                            uint64_t v137 = [v198 countByEnumeratingWithState:&v235 objects:v266 count:16];
                            id v6 = v139;
                            self = v218;
                            if (!v137)
                            {
LABEL_168:

                              uint64_t v143 = [v6 objectForKeyedSubscript:@"bundleSummary"];
                              v196 = (void *)v143;
                              if (!v143)
                              {
                                v190 = 0;
                                id v22 = v213;
                                goto LABEL_188;
                              }
                              v144 = (void *)v143;
                              objc_opt_class();
                              id v22 = v213;
                              if (objc_opt_isKindOfClass())
                              {
                                v190 = 0;
                                goto LABEL_188;
                              }
                              objc_opt_class();
                              if (objc_opt_isKindOfClass())
                              {
                                id v170 = v144;
                                v171 = [BMMomentsEngagementBundleSummary alloc];
                                id v234 = 0;
                                v190 = [(BMMomentsEngagementBundleSummary *)v171 initWithJSONDictionary:v170 error:&v234];
                                id v172 = v234;
                                if (v172)
                                {
                                  v173 = v172;
                                  id v194 = v170;
                                  if (v223) {
                                    id *v223 = v172;
                                  }

                                  uint64_t v23 = 0;
                                  v196 = v170;
                                  goto LABEL_227;
                                }

LABEL_188:
                                v157 = [v6 objectForKeyedSubscript:@"assets"];
                                v158 = [MEMORY[0x1E4F1CA98] null];
                                int v159 = [v157 isEqual:v158];

                                if (v159)
                                {

                                  v157 = 0;
                                }
                                else if (v157)
                                {
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                  {
                                    id v194 = v157;
                                    if (v223)
                                    {
                                      id v214 = objc_alloc(MEMORY[0x1E4F28C58]);
                                      uint64_t v193 = *MEMORY[0x1E4F502C8];
                                      uint64_t v258 = *MEMORY[0x1E4F28568];
                                      uint64_t v184 = [[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"assets"];
                                      uint64_t v259 = v184;
                                      v185 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v259 forKeys:&v258 count:1];
                                      id *v223 = (id)[v214 initWithDomain:v193 code:2 userInfo:v185];
                                      v169 = (void *)v184;

                                      uint64_t v23 = 0;
                                      v104 = v197;
                                      goto LABEL_221;
                                    }
                                    uint64_t v23 = 0;
                                    goto LABEL_227;
                                  }
                                }
                                v191 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v157, "count"));
                                long long v230 = 0u;
                                long long v231 = 0u;
                                long long v232 = 0u;
                                long long v233 = 0u;
                                id v194 = v157;
                                uint64_t v160 = [v194 countByEnumeratingWithState:&v230 objects:v257 count:16];
                                if (!v160) {
                                  goto LABEL_202;
                                }
                                uint64_t v161 = v160;
                                uint64_t v162 = *(void *)v231;
                                id v202 = v6;
LABEL_194:
                                uint64_t v163 = 0;
                                while (1)
                                {
                                  if (*(void *)v231 != v162) {
                                    objc_enumerationMutation(v194);
                                  }
                                  v164 = *(void **)(*((void *)&v230 + 1) + 8 * v163);
                                  objc_opt_class();
                                  if (objc_opt_isKindOfClass()) {
                                    break;
                                  }
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                  {
                                    id v6 = v202;
                                    self = v218;
                                    v176 = v223;
                                    id v22 = v213;
                                    if (!v223) {
                                      goto LABEL_220;
                                    }
                                    id v177 = objc_alloc(MEMORY[0x1E4F28C58]);
                                    uint64_t v189 = *MEMORY[0x1E4F502C8];
                                    uint64_t v253 = *MEMORY[0x1E4F28568];
                                    v178 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"assets"];
                                    v254 = v178;
                                    v179 = (void *)MEMORY[0x1E4F1C9E8];
                                    v180 = &v254;
                                    v181 = &v253;
                                    goto LABEL_215;
                                  }
                                  id v165 = v164;
                                  v166 = [BMMomentsEngagementAppEntryEventComposerAsset alloc];
                                  id v229 = 0;
                                  v167 = [(BMMomentsEngagementAppEntryEventComposerAsset *)v166 initWithJSONDictionary:v165 error:&v229];
                                  id v168 = v229;
                                  if (v168)
                                  {
                                    v182 = v168;
                                    id v183 = v165;
                                    if (v223) {
                                      id *v223 = v168;
                                    }

                                    id v6 = v202;
                                    self = v218;
                                    id v22 = v213;
                                    v178 = v183;
LABEL_219:

LABEL_220:
                                    uint64_t v23 = 0;
                                    uint64_t v7 = v221;
                                    v104 = v197;
                                    v169 = v191;
                                    goto LABEL_221;
                                  }
                                  [v191 addObject:v167];

                                  if (v161 == ++v163)
                                  {
                                    id v6 = v202;
                                    self = v218;
                                    uint64_t v161 = [v194 countByEnumeratingWithState:&v230 objects:v257 count:16];
                                    if (v161) {
                                      goto LABEL_194;
                                    }
LABEL_202:

                                    v169 = v191;
                                    v104 = v197;
                                    id v22 = v213;
                                    self = -[BMMomentsEngagementAppEntryEvent initWithType:clientIdentifier:timestamp:identifier:startTime:endTime:totalCharacters:addedCharacters:usedPhotoAssets:appEntryEventType:bundleInterfaceTypes:bundleEvergreenTypes:bundleSummary:assets:](self, "initWithType:clientIdentifier:timestamp:identifier:startTime:endTime:totalCharacters:addedCharacters:usedPhotoAssets:appEntryEventType:bundleInterfaceTypes:bundleEvergreenTypes:bundleSummary:assets:", [v219 intValue], v222, v220, v227, v213, v36, v209, v204, v216, v197, v205, v199, v190, v191);
                                    uint64_t v23 = self;
                                    uint64_t v7 = v221;
LABEL_221:

LABEL_228:
                                    v116 = v198;
LABEL_229:

LABEL_230:
LABEL_231:

LABEL_232:
                                    v83 = (void *)v203;
LABEL_233:

                                    int v45 = v222;
LABEL_234:
                                    v44 = v220;
LABEL_235:

                                    goto LABEL_236;
                                  }
                                }
                                id v6 = v202;
                                self = v218;
                                v176 = v223;
                                id v22 = v213;
                                if (!v223) {
                                  goto LABEL_220;
                                }
                                id v177 = objc_alloc(MEMORY[0x1E4F28C58]);
                                uint64_t v189 = *MEMORY[0x1E4F502C8];
                                uint64_t v255 = *MEMORY[0x1E4F28568];
                                v178 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"assets"];
                                v256 = v178;
                                v179 = (void *)MEMORY[0x1E4F1C9E8];
                                v180 = &v256;
                                v181 = &v255;
LABEL_215:
                                v182 = [v179 dictionaryWithObjects:v180 forKeys:v181 count:1];
                                id *v176 = (id)[v177 initWithDomain:v189 code:2 userInfo:v182];
                                goto LABEL_219;
                              }
                              if (v223)
                              {
                                id v195 = objc_alloc(MEMORY[0x1E4F28C58]);
                                uint64_t v192 = *MEMORY[0x1E4F502C8];
                                uint64_t v260 = *MEMORY[0x1E4F28568];
                                v190 = (BMMomentsEngagementBundleSummary *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"bundleSummary"];
                                v261 = v190;
                                uint64_t v174 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v261 forKeys:&v260 count:1];
                                v175 = v195;
                                id v194 = (id)v174;
                                uint64_t v23 = 0;
                                id *v223 = (id)objc_msgSend(v175, "initWithDomain:code:userInfo:", v192, 2);
                                id v22 = v213;
LABEL_227:
                                v104 = v197;
                                goto LABEL_228;
                              }
                              uint64_t v23 = 0;
LABEL_186:
                              id v22 = v213;
                              v104 = v197;
                              v116 = v198;
                              goto LABEL_230;
                            }
                            goto LABEL_161;
                          }
                        }
                        if (v223)
                        {
                          id v147 = objc_alloc(MEMORY[0x1E4F28C58]);
                          uint64_t v148 = *MEMORY[0x1E4F502C8];
                          uint64_t v264 = *MEMORY[0x1E4F28568];
                          v190 = (BMMomentsEngagementBundleSummary *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"bundleEvergreenTypes"];
                          v265 = v190;
                          uint64_t v149 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v265 forKeys:&v264 count:1];
                          v150 = v147;
                          uint64_t v151 = v148;
LABEL_178:
                          id v194 = (id)v149;
                          id v6 = v139;
                          id v22 = v213;
                          uint64_t v23 = 0;
                          id *v223 = (id)objc_msgSend(v150, "initWithDomain:code:userInfo:", v151, 2);
                          v104 = v197;
                          v116 = v198;
                          v196 = v198;
                          self = v218;
                          goto LABEL_229;
                        }
LABEL_182:
                        uint64_t v23 = 0;
                        v116 = v198;
                        v196 = v198;
                        id v6 = v139;
                        self = v218;
                        id v22 = v213;
LABEL_148:
                        v104 = v197;
                        goto LABEL_230;
                      }
                    }
                  }
                  goto LABEL_84;
                }
              }
              if (v223)
              {
                id v97 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v98 = *MEMORY[0x1E4F502C8];
                uint64_t v280 = *MEMORY[0x1E4F28568];
                uint64_t v203 = [[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"usedPhotoAssets"];
                uint64_t v281 = v203;
                id v99 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v281 forKeys:&v280 count:1];
                id v100 = (id)[v97 initWithDomain:v98 code:2 userInfo:v99];
                uint64_t v23 = 0;
                id *v223 = v100;
LABEL_113:
                id v22 = v213;
                v104 = obj;
                id v6 = v201;
                self = v218;
                uint64_t v7 = v221;
                goto LABEL_232;
              }
LABEL_116:
              uint64_t v23 = 0;
              id v22 = v213;
              v104 = obj;
              id v6 = v201;
              self = v218;
              uint64_t v7 = v221;
              int v45 = v222;
              goto LABEL_234;
            }
            id obj = v70;
            if (v223)
            {
              id v105 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v106 = *MEMORY[0x1E4F502C8];
              uint64_t v283 = *MEMORY[0x1E4F28568];
              v216 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"usedPhotoAssets"];
              v284 = v216;
              v104 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v284 forKeys:&v283 count:1];
              uint64_t v23 = 0;
              id *v223 = (id)[v105 initWithDomain:v106 code:2 userInfo:v104];
              int v45 = v222;
              v44 = v220;
              id v22 = v213;
              self = v218;
              goto LABEL_235;
            }
            uint64_t v23 = 0;
            int v45 = v222;
            v44 = v220;
            id v22 = v213;
            self = v218;
LABEL_236:

            goto LABEL_237;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v204 = v69;
            goto LABEL_78;
          }
          if (v223)
          {
            id v93 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v94 = *MEMORY[0x1E4F502C8];
            uint64_t v285 = *MEMORY[0x1E4F28568];
            id obj = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"addedCharacters"];
            id v286 = obj;
            uint64_t v95 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v286 forKeys:&v285 count:1];
            v96 = v93;
            id v22 = v213;
            v217 = (void *)v95;
            id v204 = 0;
            uint64_t v23 = 0;
            id *v223 = (id)objc_msgSend(v96, "initWithDomain:code:userInfo:", v94, 2);
            int v45 = v222;
            v44 = v220;

            goto LABEL_236;
          }
          id v204 = 0;
          uint64_t v23 = 0;
LABEL_144:
          int v45 = v222;
          v44 = v220;
LABEL_237:

          goto LABEL_238;
        }
        if (v223)
        {
          id v84 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v85 = *MEMORY[0x1E4F502C8];
          uint64_t v287 = *MEMORY[0x1E4F28568];
          id v204 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"totalCharacters"];
          id v288 = v204;
          uint64_t v86 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v288 forKeys:&v287 count:1];
          v87 = v84;
          id v22 = v213;
          v208 = (void *)v86;
          id v209 = 0;
          uint64_t v23 = 0;
          id *v223 = (id)objc_msgSend(v87, "initWithDomain:code:userInfo:", v85, 2);
          goto LABEL_144;
        }
        id v209 = 0;
        uint64_t v23 = 0;
        int v45 = v222;
        v44 = v220;
LABEL_238:

        goto LABEL_239;
      }
      id v59 = objc_alloc_init(MEMORY[0x1E4F28D48]);
      id v65 = v35;
      id v36 = [v59 dateFromString:v65];

      id v22 = v213;
    }

    goto LABEL_72;
  }
  uint64_t v25 = v24;
  uint64_t v26 = *(void *)v250;
LABEL_23:
  id v27 = v6;
  uint64_t v28 = 0;
  while (1)
  {
    if (*(void *)v250 != v26) {
      objc_enumerationMutation(v15);
    }
    v29 = *(void **)(*((void *)&v249 + 1) + 8 * v28);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      break;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v46 = v223;
      if (!v223) {
        goto LABEL_54;
      }
      id v47 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v48 = *MEMORY[0x1E4F502C8];
      uint64_t v293 = *MEMORY[0x1E4F28568];
      id v49 = v15;
      id v30 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"identifier"];
      id v294 = v30;
      id v50 = (void *)MEMORY[0x1E4F1C9E8];
      id v51 = &v294;
      id v52 = &v293;
LABEL_47:
      id v36 = [v50 dictionaryWithObjects:v51 forKeys:v52 count:1];
      uint64_t v23 = 0;
      id *v46 = (id)[v47 initWithDomain:v48 code:2 userInfo:v36];
      id v22 = v49;
LABEL_51:
      id v6 = v27;
      self = v218;
      int v45 = v222;
      v44 = v220;
      goto LABEL_240;
    }
    id v30 = v29;
    int v31 = [BMMomentsEngagementSuggestionIdentifier alloc];
    id v248 = 0;
    v32 = [(BMMomentsEngagementSuggestionIdentifier *)v31 initWithJSONDictionary:v30 error:&v248];
    id v33 = v248;
    if (v33)
    {
      id v36 = v33;
      if (v223) {
        id *v223 = v33;
      }

      uint64_t v23 = 0;
      id v22 = v226;
      goto LABEL_51;
    }
    [v227 addObject:v32];

    ++v28;
    id v15 = v226;
    if (v25 == v28)
    {
      uint64_t v25 = [v226 countByEnumeratingWithState:&v249 objects:v297 count:16];
      id v6 = v27;
      self = v218;
      id v9 = v219;
      if (!v25) {
        goto LABEL_31;
      }
      goto LABEL_23;
    }
  }
  v46 = v223;
  if (v223)
  {
    id v47 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v48 = *MEMORY[0x1E4F502C8];
    uint64_t v295 = *MEMORY[0x1E4F28568];
    id v49 = v15;
    id v30 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"identifier"];
    id v296 = v30;
    id v50 = (void *)MEMORY[0x1E4F1C9E8];
    id v51 = &v296;
    id v52 = &v295;
    goto LABEL_47;
  }
LABEL_54:
  uint64_t v23 = 0;
  id v22 = v15;
  id v6 = v27;
  self = v218;
  id v9 = v219;
LABEL_55:
  int v45 = v222;
  v44 = v220;
LABEL_242:

LABEL_243:
LABEL_244:

LABEL_245:
LABEL_246:

  return v23;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMMomentsEngagementAppEntryEvent *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_clientIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasRaw_timestamp) {
    PBDataWriterWriteDoubleField();
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v5 = self->_identifier;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v50 objects:v58 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v51;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v51 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v50 + 1) + 8 * v9);
        uint64_t v49 = 0;
        PBDataWriterPlaceMark();
        [v10 writeTo:v4];
        PBDataWriterRecallMark();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v50 objects:v58 count:16];
    }
    while (v7);
  }

  if (self->_hasRaw_startTime) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasRaw_endTime) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_hasTotalCharacters) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasAddedCharacters) {
    PBDataWriterWriteInt32Field();
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v11 = self->_usedPhotoAssets;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v45 objects:v57 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v46;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v46 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v45 + 1) + 8 * v15);
        uint64_t v49 = 0;
        PBDataWriterPlaceMark();
        [v16 writeTo:v4];
        PBDataWriterRecallMark();
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v45 objects:v57 count:16];
    }
    while (v13);
  }

  if (self->_appEntryEventType) {
    PBDataWriterWriteStringField();
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  int v17 = self->_bundleInterfaceTypes;
  uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v41 objects:v56 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v42;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v42 != v20) {
          objc_enumerationMutation(v17);
        }
        PBDataWriterWriteStringField();
        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [(NSArray *)v17 countByEnumeratingWithState:&v41 objects:v56 count:16];
    }
    while (v19);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v22 = self->_bundleEvergreenTypes;
  uint64_t v23 = [(NSArray *)v22 countByEnumeratingWithState:&v37 objects:v55 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v38;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v38 != v25) {
          objc_enumerationMutation(v22);
        }
        PBDataWriterWriteStringField();
        ++v26;
      }
      while (v24 != v26);
      uint64_t v24 = [(NSArray *)v22 countByEnumeratingWithState:&v37 objects:v55 count:16];
    }
    while (v24);
  }

  if (self->_bundleSummary)
  {
    uint64_t v49 = 0;
    PBDataWriterPlaceMark();
    [(BMMomentsEngagementBundleSummary *)self->_bundleSummary writeTo:v4];
    PBDataWriterRecallMark();
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v27 = self->_assets;
  uint64_t v28 = [(NSArray *)v27 countByEnumeratingWithState:&v33 objects:v54 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v34;
    do
    {
      uint64_t v31 = 0;
      do
      {
        if (*(void *)v34 != v30) {
          objc_enumerationMutation(v27);
        }
        v32 = *(void **)(*((void *)&v33 + 1) + 8 * v31);
        uint64_t v49 = 0;
        PBDataWriterPlaceMark();
        objc_msgSend(v32, "writeTo:", v4, (void)v33);
        PBDataWriterRecallMark();
        ++v31;
      }
      while (v29 != v31);
      uint64_t v29 = [(NSArray *)v27 countByEnumeratingWithState:&v33 objects:v54 count:16];
    }
    while (v29);
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v81.receiver = self;
  v81.super_class = (Class)BMMomentsEngagementAppEntryEvent;
  uint64_t v5 = [(BMEventBase *)&v81 init];
  if (!v5) {
    goto LABEL_99;
  }
  v80 = objc_opt_new();
  id v78 = objc_opt_new();
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = objc_opt_new();
  uint64_t v9 = (int *)MEMORY[0x1E4F940E8];
  id v10 = (int *)MEMORY[0x1E4F940E0];
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
        uint64_t v17 = *(void *)&v4[v16];
        unint64_t v18 = v17 + 1;
        if (v17 == -1 || v18 > *(void *)&v4[*v10]) {
          break;
        }
        char v19 = *(unsigned char *)(*(void *)&v4[*v12] + v17);
        *(void *)&v4[v16] = v18;
        v15 |= (unint64_t)(v19 & 0x7F) << v13;
        if ((v19 & 0x80) == 0) {
          goto LABEL_13;
        }
        v13 += 7;
        BOOL v20 = v14++ >= 9;
        if (v20)
        {
          unint64_t v15 = 0;
          int v21 = v4[*v11];
          goto LABEL_15;
        }
      }
      v4[*v11] = 1;
LABEL_13:
      int v21 = v4[*v11];
      if (v4[*v11]) {
        unint64_t v15 = 0;
      }
LABEL_15:
      if (v21 || (v15 & 7) == 4) {
        break;
      }
      switch((v15 >> 3))
      {
        case 1u:
          char v23 = 0;
          unsigned int v24 = 0;
          uint64_t v25 = 0;
          while (1)
          {
            uint64_t v26 = *v9;
            uint64_t v27 = *(void *)&v4[v26];
            unint64_t v28 = v27 + 1;
            if (v27 == -1 || v28 > *(void *)&v4[*v10]) {
              break;
            }
            char v29 = *(unsigned char *)(*(void *)&v4[*v12] + v27);
            *(void *)&v4[v26] = v28;
            v25 |= (unint64_t)(v29 & 0x7F) << v23;
            if ((v29 & 0x80) == 0) {
              goto LABEL_75;
            }
            v23 += 7;
            BOOL v20 = v24++ >= 9;
            if (v20)
            {
              LODWORD(v25) = 0;
              goto LABEL_77;
            }
          }
          v4[*v11] = 1;
LABEL_75:
          if (v4[*v11]) {
            LODWORD(v25) = 0;
          }
LABEL_77:
          if (v25 >= 5) {
            LODWORD(v25) = 0;
          }
          v5->_type = v25;
          continue;
        case 2u:
          uint64_t v30 = PBReaderReadString();
          uint64_t v31 = 88;
          goto LABEL_60;
        case 3u:
          v5->_hasRaw_timestamp = 1;
          uint64_t v32 = *v9;
          unint64_t v33 = *(void *)&v4[v32];
          if (v33 <= 0xFFFFFFFFFFFFFFF7 && v33 + 8 <= *(void *)&v4[*v10])
          {
            long long v34 = *(objc_class **)(*(void *)&v4[*v12] + v33);
            *(void *)&v4[v32] = v33 + 8;
          }
          else
          {
            v4[*v11] = 1;
            long long v34 = 0;
          }
          uint64_t v64 = 24;
          goto LABEL_95;
        case 4u:
          uint64_t v82 = 0;
          uint64_t v83 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_101;
          }
          id v35 = [[BMMomentsEngagementSuggestionIdentifier alloc] initByReadFrom:v4];
          if (!v35) {
            goto LABEL_101;
          }
          long long v36 = v35;
          long long v37 = v80;
          goto LABEL_72;
        case 5u:
          v5->_hasRaw_startTime = 1;
          uint64_t v38 = *v9;
          unint64_t v39 = *(void *)&v4[v38];
          if (v39 <= 0xFFFFFFFFFFFFFFF7 && v39 + 8 <= *(void *)&v4[*v10])
          {
            long long v34 = *(objc_class **)(*(void *)&v4[*v12] + v39);
            *(void *)&v4[v38] = v39 + 8;
          }
          else
          {
            v4[*v11] = 1;
            long long v34 = 0;
          }
          uint64_t v64 = 40;
          goto LABEL_95;
        case 6u:
          v5->_hasRaw_endTime = 1;
          uint64_t v40 = *v9;
          unint64_t v41 = *(void *)&v4[v40];
          if (v41 <= 0xFFFFFFFFFFFFFFF7 && v41 + 8 <= *(void *)&v4[*v10])
          {
            long long v34 = *(objc_class **)(*(void *)&v4[*v12] + v41);
            *(void *)&v4[v40] = v41 + 8;
          }
          else
          {
            v4[*v11] = 1;
            long long v34 = 0;
          }
          uint64_t v64 = 56;
LABEL_95:
          *(Class *)((char *)&v5->super.super.isa + v64) = v34;
          continue;
        case 7u:
          char v42 = 0;
          unsigned int v43 = 0;
          uint64_t v44 = 0;
          v5->_hasTotalCharacters = 1;
          while (2)
          {
            uint64_t v45 = *v9;
            uint64_t v46 = *(void *)&v4[v45];
            unint64_t v47 = v46 + 1;
            if (v46 == -1 || v47 > *(void *)&v4[*v10])
            {
              v4[*v11] = 1;
            }
            else
            {
              char v48 = *(unsigned char *)(*(void *)&v4[*v12] + v46);
              *(void *)&v4[v45] = v47;
              v44 |= (unint64_t)(v48 & 0x7F) << v42;
              if (v48 < 0)
              {
                v42 += 7;
                BOOL v20 = v43++ >= 9;
                if (v20)
                {
                  LODWORD(v44) = 0;
                  goto LABEL_83;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v11]) {
            LODWORD(v44) = 0;
          }
LABEL_83:
          uint64_t v63 = 76;
          goto LABEL_88;
        case 8u:
          char v49 = 0;
          unsigned int v50 = 0;
          uint64_t v44 = 0;
          v5->_hasAddedCharacters = 1;
          break;
        case 9u:
          uint64_t v82 = 0;
          uint64_t v83 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_101;
          }
          id v55 = [[BMMomentsEngagementPhotosAssets alloc] initByReadFrom:v4];
          if (!v55) {
            goto LABEL_101;
          }
          long long v36 = v55;
          long long v37 = v78;
          goto LABEL_72;
        case 0xAu:
          uint64_t v30 = PBReaderReadString();
          uint64_t v31 = 112;
LABEL_60:
          uint64_t v56 = *(Class *)((char *)&v5->super.super.isa + v31);
          *(Class *)((char *)&v5->super.super.isa + v31) = (Class)v30;

          continue;
        case 0xBu:
          uint64_t v57 = PBReaderReadString();
          if (!v57) {
            goto LABEL_101;
          }
          long long v36 = (void *)v57;
          id v58 = v6;
          goto LABEL_65;
        case 0xCu:
          uint64_t v59 = PBReaderReadString();
          if (!v59) {
            goto LABEL_101;
          }
          long long v36 = (void *)v59;
          id v58 = v7;
LABEL_65:
          objc_msgSend(v58, "addObject:", v36, v78);
          goto LABEL_73;
        case 0xDu:
          uint64_t v82 = 0;
          uint64_t v83 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_101;
          }
          id v60 = [[BMMomentsEngagementBundleSummary alloc] initByReadFrom:v4];
          if (!v60) {
            goto LABEL_101;
          }
          bundleSummary = v5->_bundleSummary;
          v5->_bundleSummary = v60;

          PBReaderRecallMark();
          continue;
        case 0xEu:
          uint64_t v82 = 0;
          uint64_t v83 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_101;
          }
          id v62 = [[BMMomentsEngagementAppEntryEventComposerAsset alloc] initByReadFrom:v4];
          if (!v62) {
            goto LABEL_101;
          }
          long long v36 = v62;
          long long v37 = v8;
LABEL_72:
          objc_msgSend(v37, "addObject:", v36, v78);
          PBReaderRecallMark();
LABEL_73:

          continue;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
LABEL_101:

          goto LABEL_98;
      }
      while (1)
      {
        uint64_t v51 = *v9;
        uint64_t v52 = *(void *)&v4[v51];
        unint64_t v53 = v52 + 1;
        if (v52 == -1 || v53 > *(void *)&v4[*v10]) {
          break;
        }
        char v54 = *(unsigned char *)(*(void *)&v4[*v12] + v52);
        *(void *)&v4[v51] = v53;
        v44 |= (unint64_t)(v54 & 0x7F) << v49;
        if ((v54 & 0x80) == 0) {
          goto LABEL_85;
        }
        v49 += 7;
        BOOL v20 = v50++ >= 9;
        if (v20)
        {
          LODWORD(v44) = 0;
          goto LABEL_87;
        }
      }
      v4[*v11] = 1;
LABEL_85:
      if (v4[*v11]) {
        LODWORD(v44) = 0;
      }
LABEL_87:
      uint64_t v63 = 80;
LABEL_88:
      *(_DWORD *)((char *)&v5->super.super.isa + v63) = v44;
    }
    while (*(void *)&v4[*v9] < *(void *)&v4[*v10]);
  }
  uint64_t v65 = objc_msgSend(v80, "copy", v78);
  identifier = v5->_identifier;
  v5->_identifier = (NSArray *)v65;

  uint64_t v67 = [v79 copy];
  usedPhotoAssets = v5->_usedPhotoAssets;
  v5->_usedPhotoAssets = (NSArray *)v67;

  uint64_t v69 = [v6 copy];
  bundleInterfaceTypes = v5->_bundleInterfaceTypes;
  v5->_bundleInterfaceTypes = (NSArray *)v69;

  uint64_t v71 = [v7 copy];
  bundleEvergreenTypes = v5->_bundleEvergreenTypes;
  v5->_bundleEvergreenTypes = (NSArray *)v71;

  uint64_t v73 = [v8 copy];
  assets = v5->_assets;
  v5->_assets = (NSArray *)v73;

  int v75 = v4[*v11];
  if (v75) {
LABEL_98:
  }
    uint64_t v76 = 0;
  else {
LABEL_99:
  }
    uint64_t v76 = v5;

  return v76;
}

- (NSString)description
{
  id v14 = [NSString alloc];
  char v19 = BMMomentsEngagementAppEntryEventTypeAsString([(BMMomentsEngagementAppEntryEvent *)self type]);
  unint64_t v18 = [(BMMomentsEngagementAppEntryEvent *)self clientIdentifier];
  char v13 = [(BMMomentsEngagementAppEntryEvent *)self timestamp];
  uint64_t v17 = [(BMMomentsEngagementAppEntryEvent *)self identifier];
  uint64_t v16 = [(BMMomentsEngagementAppEntryEvent *)self startTime];
  uint64_t v3 = [(BMMomentsEngagementAppEntryEvent *)self endTime];
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEngagementAppEntryEvent totalCharacters](self, "totalCharacters"));
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEngagementAppEntryEvent addedCharacters](self, "addedCharacters"));
  uint64_t v6 = [(BMMomentsEngagementAppEntryEvent *)self usedPhotoAssets];
  uint64_t v7 = [(BMMomentsEngagementAppEntryEvent *)self appEntryEventType];
  uint64_t v8 = [(BMMomentsEngagementAppEntryEvent *)self bundleInterfaceTypes];
  uint64_t v9 = [(BMMomentsEngagementAppEntryEvent *)self bundleEvergreenTypes];
  id v10 = [(BMMomentsEngagementAppEntryEvent *)self bundleSummary];
  uint64_t v11 = [(BMMomentsEngagementAppEntryEvent *)self assets];
  id v15 = (id)[v14 initWithFormat:@"BMMomentsEngagementAppEntryEvent with type: %@, clientIdentifier: %@, timestamp: %@, identifier: %@, startTime: %@, endTime: %@, totalCharacters: %@, addedCharacters: %@, usedPhotoAssets: %@, appEntryEventType: %@, bundleInterfaceTypes: %@, bundleEvergreenTypes: %@, bundleSummary: %@, assets: %@", v19, v18, v13, v17, v16, v3, v4, v5, v6, v7, v8, v9, v10, v11];

  return (NSString *)v15;
}

- (BMMomentsEngagementAppEntryEvent)initWithType:(int)a3 clientIdentifier:(id)a4 timestamp:(id)a5 identifier:(id)a6 startTime:(id)a7 endTime:(id)a8 totalCharacters:(id)a9 addedCharacters:(id)a10 usedPhotoAssets:(id)a11 appEntryEventType:(id)a12 bundleInterfaceTypes:(id)a13 bundleEvergreenTypes:(id)a14 bundleSummary:(id)a15 assets:(id)a16
{
  id v44 = a4;
  id v20 = a5;
  id v39 = a6;
  id v43 = a6;
  id v21 = a7;
  id v22 = a8;
  char v23 = v20;
  id v24 = a9;
  id v25 = a10;
  id v42 = a11;
  id v41 = a12;
  id v26 = a13;
  id v27 = a14;
  id v28 = a15;
  id v29 = a16;
  v45.receiver = self;
  v45.super_class = (Class)BMMomentsEngagementAppEntryEvent;
  uint64_t v30 = [(BMEventBase *)&v45 init];
  if (v30)
  {
    v30->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    v30->_type = a3;
    objc_storeStrong((id *)&v30->_clientIdentifier, a4);
    if (v23)
    {
      v30->_hasRaw_timestamp = 1;
      [v23 timeIntervalSince1970];
    }
    else
    {
      v30->_hasRaw_timestamp = 0;
      double v31 = -1.0;
    }
    v30->_raw_timestamp = v31;
    objc_storeStrong((id *)&v30->_identifier, v39);
    if (v21)
    {
      v30->_hasRaw_startTime = 1;
      [v21 timeIntervalSince1970];
    }
    else
    {
      v30->_hasRaw_startTime = 0;
      double v32 = -1.0;
    }
    v30->_raw_startTime = v32;
    if (v22)
    {
      v30->_hasRaw_endTime = 1;
      [v22 timeIntervalSince1970];
    }
    else
    {
      v30->_hasRaw_endTime = 0;
      double v33 = -1.0;
    }
    v30->_raw_endTime = v33;
    if (v24)
    {
      v30->_hasTotalCharacters = 1;
      int v34 = [v24 intValue];
    }
    else
    {
      v30->_hasTotalCharacters = 0;
      int v34 = -1;
    }
    v30->_totalCharacters = v34;
    if (v25)
    {
      v30->_hasAddedCharacters = 1;
      int v35 = [v25 intValue];
    }
    else
    {
      v30->_hasAddedCharacters = 0;
      int v35 = -1;
    }
    v30->_addedCharacters = v35;
    objc_storeStrong((id *)&v30->_usedPhotoAssets, a11);
    objc_storeStrong((id *)&v30->_appEntryEventType, a12);
    objc_storeStrong((id *)&v30->_bundleInterfaceTypes, a13);
    objc_storeStrong((id *)&v30->_bundleEvergreenTypes, a14);
    objc_storeStrong((id *)&v30->_bundleSummary, a15);
    objc_storeStrong((id *)&v30->_assets, a16);
  }

  return v30;
}

+ (id)protoFields
{
  v18[14] = *MEMORY[0x1E4F143B8];
  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"type" number:1 type:4 subMessageClass:0];
  v18[0] = v17;
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clientIdentifier" number:2 type:13 subMessageClass:0];
  v18[1] = v16;
  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"timestamp" number:3 type:0 subMessageClass:0];
  v18[2] = v15;
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"identifier" number:4 type:14 subMessageClass:objc_opt_class()];
  v18[3] = v14;
  char v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"startTime" number:5 type:0 subMessageClass:0];
  v18[4] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"endTime" number:6 type:0 subMessageClass:0];
  v18[5] = v2;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"totalCharacters" number:7 type:2 subMessageClass:0];
  v18[6] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"addedCharacters" number:8 type:2 subMessageClass:0];
  v18[7] = v4;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"usedPhotoAssets" number:9 type:14 subMessageClass:objc_opt_class()];
  v18[8] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"appEntryEventType" number:10 type:13 subMessageClass:0];
  v18[9] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleInterfaceTypes" number:11 type:13 subMessageClass:0];
  v18[10] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleEvergreenTypes" number:12 type:13 subMessageClass:0];
  v18[11] = v8;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bundleSummary" number:13 type:14 subMessageClass:objc_opt_class()];
  v18[12] = v9;
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"assets" number:14 type:14 subMessageClass:objc_opt_class()];
  v18[13] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:14];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5928;
}

+ (id)columns
{
  v18[14] = *MEMORY[0x1E4F143B8];
  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"type" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:4 convertedType:0];
  uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clientIdentifier" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"timestamp" dataType:3 requestOnly:0 fieldNumber:3 protoDataType:0 convertedType:2];
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"identifier_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_760_50153];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"startTime" dataType:3 requestOnly:0 fieldNumber:5 protoDataType:0 convertedType:2];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"endTime" dataType:3 requestOnly:0 fieldNumber:6 protoDataType:0 convertedType:2];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"totalCharacters" dataType:0 requestOnly:0 fieldNumber:7 protoDataType:2 convertedType:0];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"addedCharacters" dataType:0 requestOnly:0 fieldNumber:8 protoDataType:2 convertedType:0];
  char v13 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"usedPhotoAssets_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_762];
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"appEntryEventType" dataType:2 requestOnly:0 fieldNumber:10 protoDataType:13 convertedType:0];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"bundleInterfaceTypes_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_764];
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"bundleEvergreenTypes_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_766];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"bundleSummary_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_768];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"assets_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_770];
  v18[0] = v17;
  v18[1] = v16;
  v18[2] = v15;
  v18[3] = v14;
  v18[4] = v2;
  v18[5] = v3;
  v18[6] = v4;
  v18[7] = v5;
  v18[8] = v13;
  v18[9] = v12;
  v18[10] = v6;
  v18[11] = v11;
  v18[12] = v7;
  v18[13] = v8;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:14];

  return v10;
}

id __43__BMMomentsEngagementAppEntryEvent_columns__block_invoke_6(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 _assetsJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __43__BMMomentsEngagementAppEntryEvent_columns__block_invoke_5(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 bundleSummary];
  id v4 = [v3 jsonDictionary];
  uint64_t v5 = BMConvertObjectToJSONString();

  return v5;
}

id __43__BMMomentsEngagementAppEntryEvent_columns__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 _bundleEvergreenTypesJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __43__BMMomentsEngagementAppEntryEvent_columns__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 _bundleInterfaceTypesJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __43__BMMomentsEngagementAppEntryEvent_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 _usedPhotoAssetsJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

id __43__BMMomentsEngagementAppEntryEvent_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 _identifierJSONArray];
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
    uint64_t v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    uint64_t v8 = [[BMMomentsEngagementAppEntryEvent alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[17] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end