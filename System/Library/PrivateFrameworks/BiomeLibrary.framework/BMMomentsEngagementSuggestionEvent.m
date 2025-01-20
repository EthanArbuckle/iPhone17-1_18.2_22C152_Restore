@interface BMMomentsEngagementSuggestionEvent
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMomentsEngagementNotificationInfo)notificationInfo;
- (BMMomentsEngagementSuggestionEvent)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMMomentsEngagementSuggestionEvent)initWithType:(int)a3 timestamp:(id)a4 fullBundleOrderedSet:(id)a5 clientIdentifier:(id)a6 viewContainerName:(id)a7 viewVisibleTime:(id)a8;
- (BMMomentsEngagementSuggestionEvent)initWithType:(int)a3 timestamp:(id)a4 fullBundleOrderedSet:(id)a5 clientIdentifier:(id)a6 viewContainerName:(id)a7 viewVisibleTime:(id)a8 suggestionType:(id)a9 viewVisibleSuggestionsCount:(id)a10 viewTotalSuggestionsCount:(id)a11;
- (BMMomentsEngagementSuggestionEvent)initWithType:(int)a3 timestamp:(id)a4 fullBundleOrderedSet:(id)a5 clientIdentifier:(id)a6 viewContainerName:(id)a7 viewVisibleTime:(id)a8 suggestionType:(id)a9 viewVisibleSuggestionsCount:(id)a10 viewTotalSuggestionsCount:(id)a11 notificationInfo:(id)a12;
- (BOOL)hasViewTotalSuggestionsCount;
- (BOOL)hasViewVisibleSuggestionsCount;
- (BOOL)hasViewVisibleTime;
- (BOOL)isEqual:(id)a3;
- (NSArray)fullBundleOrderedSet;
- (NSDate)timestamp;
- (NSString)clientIdentifier;
- (NSString)description;
- (NSString)suggestionType;
- (NSString)viewContainerName;
- (double)viewVisibleTime;
- (id)_fullBundleOrderedSetJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)type;
- (int)viewTotalSuggestionsCount;
- (int)viewVisibleSuggestionsCount;
- (unsigned)dataVersion;
- (void)setHasViewTotalSuggestionsCount:(BOOL)a3;
- (void)setHasViewVisibleSuggestionsCount:(BOOL)a3;
- (void)setHasViewVisibleTime:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMMomentsEngagementSuggestionEvent

- (BMMomentsEngagementSuggestionEvent)initWithType:(int)a3 timestamp:(id)a4 fullBundleOrderedSet:(id)a5 clientIdentifier:(id)a6 viewContainerName:(id)a7 viewVisibleTime:(id)a8 suggestionType:(id)a9 viewVisibleSuggestionsCount:(id)a10 viewTotalSuggestionsCount:(id)a11
{
  return [(BMMomentsEngagementSuggestionEvent *)self initWithType:*(void *)&a3 timestamp:a4 fullBundleOrderedSet:a5 clientIdentifier:a6 viewContainerName:a7 viewVisibleTime:a8 suggestionType:a9 viewVisibleSuggestionsCount:a10 viewTotalSuggestionsCount:a11 notificationInfo:0];
}

- (BMMomentsEngagementSuggestionEvent)initWithType:(int)a3 timestamp:(id)a4 fullBundleOrderedSet:(id)a5 clientIdentifier:(id)a6 viewContainerName:(id)a7 viewVisibleTime:(id)a8
{
  return [(BMMomentsEngagementSuggestionEvent *)self initWithType:*(void *)&a3 timestamp:a4 fullBundleOrderedSet:a5 clientIdentifier:a6 viewContainerName:a7 viewVisibleTime:a8 suggestionType:0 viewVisibleSuggestionsCount:0 viewTotalSuggestionsCount:0 notificationInfo:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationInfo, 0);
  objc_storeStrong((id *)&self->_suggestionType, 0);
  objc_storeStrong((id *)&self->_viewContainerName, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);

  objc_storeStrong((id *)&self->_fullBundleOrderedSet, 0);
}

- (BMMomentsEngagementNotificationInfo)notificationInfo
{
  return self->_notificationInfo;
}

- (void)setHasViewTotalSuggestionsCount:(BOOL)a3
{
  self->_hasViewTotalSuggestionsCount = a3;
}

- (BOOL)hasViewTotalSuggestionsCount
{
  return self->_hasViewTotalSuggestionsCount;
}

- (int)viewTotalSuggestionsCount
{
  return self->_viewTotalSuggestionsCount;
}

- (void)setHasViewVisibleSuggestionsCount:(BOOL)a3
{
  self->_hasViewVisibleSuggestionsCount = a3;
}

- (BOOL)hasViewVisibleSuggestionsCount
{
  return self->_hasViewVisibleSuggestionsCount;
}

- (int)viewVisibleSuggestionsCount
{
  return self->_viewVisibleSuggestionsCount;
}

- (NSString)suggestionType
{
  return self->_suggestionType;
}

- (void)setHasViewVisibleTime:(BOOL)a3
{
  self->_hasViewVisibleTime = a3;
}

- (BOOL)hasViewVisibleTime
{
  return self->_hasViewVisibleTime;
}

- (double)viewVisibleTime
{
  return self->_viewVisibleTime;
}

- (NSString)viewContainerName
{
  return self->_viewContainerName;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSArray)fullBundleOrderedSet
{
  return self->_fullBundleOrderedSet;
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
    int v6 = [(BMMomentsEngagementSuggestionEvent *)self type];
    if (v6 == [v5 type])
    {
      v7 = [(BMMomentsEngagementSuggestionEvent *)self timestamp];
      uint64_t v8 = [v5 timestamp];
      if (v7 == (void *)v8)
      {
      }
      else
      {
        v9 = (void *)v8;
        v10 = [(BMMomentsEngagementSuggestionEvent *)self timestamp];
        v11 = [v5 timestamp];
        int v12 = [v10 isEqual:v11];

        if (!v12) {
          goto LABEL_41;
        }
      }
      v14 = [(BMMomentsEngagementSuggestionEvent *)self fullBundleOrderedSet];
      uint64_t v15 = [v5 fullBundleOrderedSet];
      if (v14 == (void *)v15)
      {
      }
      else
      {
        v16 = (void *)v15;
        v17 = [(BMMomentsEngagementSuggestionEvent *)self fullBundleOrderedSet];
        v18 = [v5 fullBundleOrderedSet];
        int v19 = [v17 isEqual:v18];

        if (!v19) {
          goto LABEL_41;
        }
      }
      v20 = [(BMMomentsEngagementSuggestionEvent *)self clientIdentifier];
      uint64_t v21 = [v5 clientIdentifier];
      if (v20 == (void *)v21)
      {
      }
      else
      {
        v22 = (void *)v21;
        v23 = [(BMMomentsEngagementSuggestionEvent *)self clientIdentifier];
        v24 = [v5 clientIdentifier];
        int v25 = [v23 isEqual:v24];

        if (!v25) {
          goto LABEL_41;
        }
      }
      v26 = [(BMMomentsEngagementSuggestionEvent *)self viewContainerName];
      uint64_t v27 = [v5 viewContainerName];
      if (v26 == (void *)v27)
      {
      }
      else
      {
        v28 = (void *)v27;
        v29 = [(BMMomentsEngagementSuggestionEvent *)self viewContainerName];
        v30 = [v5 viewContainerName];
        int v31 = [v29 isEqual:v30];

        if (!v31) {
          goto LABEL_41;
        }
      }
      if ([(BMMomentsEngagementSuggestionEvent *)self hasViewVisibleTime]
        || [v5 hasViewVisibleTime])
      {
        if (![(BMMomentsEngagementSuggestionEvent *)self hasViewVisibleTime]) {
          goto LABEL_41;
        }
        if (![v5 hasViewVisibleTime]) {
          goto LABEL_41;
        }
        [(BMMomentsEngagementSuggestionEvent *)self viewVisibleTime];
        double v33 = v32;
        [v5 viewVisibleTime];
        if (v33 != v34) {
          goto LABEL_41;
        }
      }
      v35 = [(BMMomentsEngagementSuggestionEvent *)self suggestionType];
      uint64_t v36 = [v5 suggestionType];
      if (v35 == (void *)v36)
      {
      }
      else
      {
        v37 = (void *)v36;
        v38 = [(BMMomentsEngagementSuggestionEvent *)self suggestionType];
        v39 = [v5 suggestionType];
        int v40 = [v38 isEqual:v39];

        if (!v40) {
          goto LABEL_41;
        }
      }
      if (![(BMMomentsEngagementSuggestionEvent *)self hasViewVisibleSuggestionsCount]
        && ![v5 hasViewVisibleSuggestionsCount]
        || [(BMMomentsEngagementSuggestionEvent *)self hasViewVisibleSuggestionsCount]
        && [v5 hasViewVisibleSuggestionsCount]
        && (int v41 = [(BMMomentsEngagementSuggestionEvent *)self viewVisibleSuggestionsCount],
            v41 == [v5 viewVisibleSuggestionsCount]))
      {
        if (![(BMMomentsEngagementSuggestionEvent *)self hasViewTotalSuggestionsCount]
          && ![v5 hasViewTotalSuggestionsCount]
          || [(BMMomentsEngagementSuggestionEvent *)self hasViewTotalSuggestionsCount]
          && [v5 hasViewTotalSuggestionsCount]
          && (int v42 = [(BMMomentsEngagementSuggestionEvent *)self viewTotalSuggestionsCount],
              v42 == [v5 viewTotalSuggestionsCount]))
        {
          v43 = [(BMMomentsEngagementSuggestionEvent *)self notificationInfo];
          v44 = [v5 notificationInfo];
          if (v43 == v44)
          {
            char v13 = 1;
          }
          else
          {
            v45 = [(BMMomentsEngagementSuggestionEvent *)self notificationInfo];
            v46 = [v5 notificationInfo];
            char v13 = [v45 isEqual:v46];
          }
          goto LABEL_42;
        }
      }
    }
LABEL_41:
    char v13 = 0;
LABEL_42:

    goto LABEL_43;
  }
  char v13 = 0;
LABEL_43:

  return v13;
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
  v40[10] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEngagementSuggestionEvent type](self, "type"));
  id v4 = [(BMMomentsEngagementSuggestionEvent *)self timestamp];
  if (v4)
  {
    id v5 = NSNumber;
    int v6 = [(BMMomentsEngagementSuggestionEvent *)self timestamp];
    [v6 timeIntervalSince1970];
    uint64_t v7 = objc_msgSend(v5, "numberWithDouble:");
  }
  else
  {
    uint64_t v7 = 0;
  }

  uint64_t v8 = [(BMMomentsEngagementSuggestionEvent *)self _fullBundleOrderedSetJSONArray];
  v9 = [(BMMomentsEngagementSuggestionEvent *)self clientIdentifier];
  uint64_t v10 = [(BMMomentsEngagementSuggestionEvent *)self viewContainerName];
  if (![(BMMomentsEngagementSuggestionEvent *)self hasViewVisibleTime]
    || ([(BMMomentsEngagementSuggestionEvent *)self viewVisibleTime], fabs(v11) == INFINITY))
  {
    v38 = 0;
  }
  else
  {
    [(BMMomentsEngagementSuggestionEvent *)self viewVisibleTime];
    int v12 = NSNumber;
    [(BMMomentsEngagementSuggestionEvent *)self viewVisibleTime];
    v38 = objc_msgSend(v12, "numberWithDouble:");
  }
  uint64_t v36 = [(BMMomentsEngagementSuggestionEvent *)self suggestionType];
  if ([(BMMomentsEngagementSuggestionEvent *)self hasViewVisibleSuggestionsCount])
  {
    v37 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEngagementSuggestionEvent viewVisibleSuggestionsCount](self, "viewVisibleSuggestionsCount"));
  }
  else
  {
    v37 = 0;
  }
  if ([(BMMomentsEngagementSuggestionEvent *)self hasViewTotalSuggestionsCount])
  {
    char v13 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEngagementSuggestionEvent viewTotalSuggestionsCount](self, "viewTotalSuggestionsCount"));
  }
  else
  {
    char v13 = 0;
  }
  v14 = [(BMMomentsEngagementSuggestionEvent *)self notificationInfo];
  uint64_t v15 = [v14 jsonDictionary];

  v39[0] = @"type";
  uint64_t v16 = v3;
  if (!v3)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  int v31 = (void *)v16;
  v40[0] = v16;
  v39[1] = @"timestamp";
  uint64_t v17 = v7;
  if (!v7)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v30 = (void *)v17;
  v40[1] = v17;
  v39[2] = @"fullBundleOrderedSet";
  uint64_t v18 = v8;
  if (!v8)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v29 = (void *)v18;
  v40[2] = v18;
  v39[3] = @"clientIdentifier";
  uint64_t v19 = (uint64_t)v9;
  if (!v9)
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
  }
  v35 = (void *)v3;
  v28 = (void *)v19;
  v40[3] = v19;
  v39[4] = @"viewContainerName";
  v20 = (void *)v10;
  if (!v10)
  {
    v20 = [MEMORY[0x1E4F1CA98] null];
  }
  double v34 = (void *)v7;
  v40[4] = v20;
  v39[5] = @"viewVisibleTime";
  uint64_t v21 = v38;
  if (!v38)
  {
    uint64_t v21 = [MEMORY[0x1E4F1CA98] null];
  }
  double v33 = (void *)v8;
  v40[5] = v21;
  v39[6] = @"suggestionType";
  v22 = v36;
  if (!v36)
  {
    v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v40[6] = v22;
  v39[7] = @"viewVisibleSuggestionsCount";
  v23 = v37;
  if (!v37)
  {
    v23 = [MEMORY[0x1E4F1CA98] null];
  }
  v24 = (void *)v10;
  v40[7] = v23;
  v39[8] = @"viewTotalSuggestionsCount";
  int v25 = v13;
  if (!v13)
  {
    int v25 = [MEMORY[0x1E4F1CA98] null];
  }
  v40[8] = v25;
  v39[9] = @"notificationInfo";
  v26 = v15;
  if (!v15)
  {
    v26 = [MEMORY[0x1E4F1CA98] null];
  }
  v40[9] = v26;
  id v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:10];
  if (v15)
  {
    if (v13) {
      goto LABEL_36;
    }
  }
  else
  {

    if (v13) {
      goto LABEL_36;
    }
  }

LABEL_36:
  if (!v37) {

  }
  if (!v36) {
  if (!v38)
  }

  if (!v24) {
  if (v9)
  }
  {
    if (v33) {
      goto LABEL_46;
    }
  }
  else
  {

    if (v33)
    {
LABEL_46:
      if (v34) {
        goto LABEL_47;
      }
LABEL_55:

      if (v35) {
        goto LABEL_48;
      }
      goto LABEL_56;
    }
  }

  if (!v34) {
    goto LABEL_55;
  }
LABEL_47:
  if (v35) {
    goto LABEL_48;
  }
LABEL_56:

LABEL_48:

  return v32;
}

- (id)_fullBundleOrderedSetJSONArray
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BMMomentsEngagementSuggestionEvent *)self fullBundleOrderedSet];
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

- (BMMomentsEngagementSuggestionEvent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v151[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"type"];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v117 = v6;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        int v42 = a4;
        if (a4)
        {
          v46 = v6;
          id v47 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v48 = *MEMORY[0x1E4F502C8];
          uint64_t v150 = *MEMORY[0x1E4F28568];
          uint64_t v49 = [[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"type"];
          v151[0] = v49;
          uint64_t v50 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v151 forKeys:&v150 count:1];
          v51 = v47;
          uint64_t v6 = v46;
          v9 = (void *)v49;
          id v52 = (id)[v51 initWithDomain:v48 code:2 userInfo:v50];
          int v42 = 0;
          int v41 = 0;
          *a4 = v52;
          uint64_t v8 = (void *)v50;
          goto LABEL_85;
        }
        int v41 = 0;
        goto LABEL_86;
      }
      v117 = [NSNumber numberWithInt:BMMomentsEngagementSuggestionTypeFromString(v6)];
    }
  }
  else
  {
    v117 = 0;
  }
  uint64_t v7 = [v5 objectForKeyedSubscript:@"timestamp"];
  v116 = (void *)v7;
  if (!v7 || (uint64_t v8 = (void *)v7, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v9 = 0;
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = (objc_class *)MEMORY[0x1E4F1C9C8];
    long long v11 = v6;
    id v12 = v8;
    id v13 = [v10 alloc];
    [v12 doubleValue];
    double v15 = v14;

    uint64_t v6 = v11;
    id v16 = (id)[v13 initWithTimeIntervalSince1970:v15];
LABEL_11:
    v9 = v16;
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = objc_alloc_init(MEMORY[0x1E4F28D48]);
    v9 = [v17 dateFromString:v8];

LABEL_16:
    id v18 = [v5 objectForKeyedSubscript:@"fullBundleOrderedSet"];
    uint64_t v19 = [MEMORY[0x1E4F1CA98] null];
    int v20 = [v18 isEqual:v19];

    v115 = v9;
    if (v20)
    {
      v111 = v6;
      v112 = self;

      id v18 = 0;
    }
    else
    {
      if (v18)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            int v41 = 0;
            int v42 = v117;
            goto LABEL_84;
          }
          id v43 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v44 = *MEMORY[0x1E4F502C8];
          uint64_t v146 = *MEMORY[0x1E4F28568];
          v119 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"fullBundleOrderedSet"];
          v147 = v119;
          id v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v147 forKeys:&v146 count:1];
          id v45 = (id)[v43 initWithDomain:v44 code:2 userInfo:v30];
          int v41 = 0;
          *a4 = v45;
          goto LABEL_49;
        }
      }
      v111 = v6;
      v112 = self;
    }
    v119 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v18, "count"));
    long long v123 = 0u;
    long long v124 = 0u;
    long long v125 = 0u;
    long long v126 = 0u;
    id v18 = v18;
    uint64_t v21 = [v18 countByEnumeratingWithState:&v123 objects:v145 count:16];
    if (!v21) {
      goto LABEL_31;
    }
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v124;
    id v110 = v5;
LABEL_23:
    uint64_t v24 = 0;
    while (1)
    {
      if (*(void *)v124 != v23) {
        objc_enumerationMutation(v18);
      }
      int v25 = *(void **)(*((void *)&v123 + 1) + 8 * v24);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        double v34 = a4;
        if (a4)
        {
          id v35 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v36 = *MEMORY[0x1E4F502C8];
          uint64_t v141 = *MEMORY[0x1E4F28568];
          id v26 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"fullBundleOrderedSet"];
          id v142 = v26;
          v37 = (void *)MEMORY[0x1E4F1C9E8];
          v38 = &v142;
          v39 = &v141;
          goto LABEL_41;
        }
        goto LABEL_48;
      }
      id v26 = v25;
      uint64_t v27 = [BMMomentsEngagementBundleSummary alloc];
      id v122 = 0;
      v28 = [(BMMomentsEngagementBundleSummary *)v27 initWithJSONDictionary:v26 error:&v122];
      id v29 = v122;
      if (v29)
      {
        id v33 = v29;
        if (a4) {
          *a4 = v29;
        }

        int v41 = 0;
        goto LABEL_45;
      }
      [v119 addObject:v28];

      if (v22 == ++v24)
      {
        uint64_t v22 = [v18 countByEnumeratingWithState:&v123 objects:v145 count:16];
        id v5 = v110;
        if (v22) {
          goto LABEL_23;
        }
LABEL_31:

        id v26 = [v5 objectForKeyedSubscript:@"clientIdentifier"];
        if (!v26 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v30 = 0;
          goto LABEL_34;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v30 = v26;
LABEL_34:
          uint64_t v31 = [v5 objectForKeyedSubscript:@"viewContainerName"];
          v9 = v115;
          v109 = (void *)v31;
          if (!v31)
          {
            id v33 = 0;
            self = v112;
            goto LABEL_57;
          }
          id v32 = (void *)v31;
          objc_opt_class();
          self = v112;
          if (objc_opt_isKindOfClass())
          {
            id v33 = 0;
LABEL_57:
            uint64_t v53 = [v5 objectForKeyedSubscript:@"viewVisibleTime"];
            v106 = (void *)v53;
            id v107 = v30;
            if (v53)
            {
              v54 = (void *)v53;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v108 = v54;
                  goto LABEL_60;
                }
                if (a4)
                {
                  id v83 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v84 = *MEMORY[0x1E4F502C8];
                  uint64_t v135 = *MEMORY[0x1E4F28568];
                  id v113 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"viewVisibleTime"];
                  id v136 = v113;
                  uint64_t v85 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v136 forKeys:&v135 count:1];
                  uint64_t v86 = v84;
                  id v30 = v107;
                  v104 = (void *)v85;
                  int v41 = 0;
                  id v108 = 0;
                  *a4 = (id)objc_msgSend(v83, "initWithDomain:code:userInfo:", v86, 2);
                  uint64_t v6 = v111;
                  int v42 = v117;
                  goto LABEL_77;
                }
                id v108 = 0;
                int v41 = 0;
                uint64_t v6 = v111;
                int v42 = v117;
                goto LABEL_78;
              }
            }
            id v108 = 0;
LABEL_60:
            uint64_t v55 = [v5 objectForKeyedSubscript:@"suggestionType"];
            v104 = (void *)v55;
            if (v55)
            {
              v56 = (void *)v55;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v113 = v56;
                  goto LABEL_63;
                }
                if (a4)
                {
                  id v114 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v87 = *MEMORY[0x1E4F502C8];
                  uint64_t v133 = *MEMORY[0x1E4F28568];
                  id v105 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"suggestionType"];
                  id v134 = v105;
                  v101 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v134 forKeys:&v133 count:1];
                  id v88 = (id)objc_msgSend(v114, "initWithDomain:code:userInfo:", v87, 2);
                  int v41 = 0;
                  id v113 = 0;
                  *a4 = v88;
                  uint64_t v6 = v111;
                  int v42 = v117;
                  goto LABEL_76;
                }
                id v113 = 0;
                int v41 = 0;
                uint64_t v6 = v111;
                int v42 = v117;
                goto LABEL_77;
              }
            }
            id v113 = 0;
LABEL_63:
            uint64_t v57 = [v5 objectForKeyedSubscript:@"viewVisibleSuggestionsCount"];
            v101 = (void *)v57;
            if (v57 && (v58 = (void *)v57, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v105 = v58;
                goto LABEL_66;
              }
              if (!a4)
              {
                id v105 = 0;
                int v41 = 0;
                uint64_t v6 = v111;
                int v42 = v117;
                goto LABEL_76;
              }
              id v89 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v90 = *MEMORY[0x1E4F502C8];
              uint64_t v131 = *MEMORY[0x1E4F28568];
              id v102 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"viewVisibleSuggestionsCount"];
              id v132 = v102;
              uint64_t v91 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v132 forKeys:&v131 count:1];
              uint64_t v92 = v90;
              id v30 = v107;
              v100 = (void *)v91;
              int v41 = 0;
              id v105 = 0;
              *a4 = (id)objc_msgSend(v89, "initWithDomain:code:userInfo:", v92, 2);
            }
            else
            {
              id v105 = 0;
LABEL_66:
              uint64_t v59 = [v5 objectForKeyedSubscript:@"viewTotalSuggestionsCount"];
              v100 = (void *)v59;
              if (!v59 || (v60 = (void *)v59, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                id v102 = 0;
LABEL_69:
                v61 = [v5 objectForKeyedSubscript:@"notificationInfo"];
                if (!v61 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  v62 = 0;
                  int v42 = v117;
                  goto LABEL_72;
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v79 = v61;
                  v80 = [BMMomentsEngagementNotificationInfo alloc];
                  id v121 = 0;
                  v98 = v79;
                  v62 = [(BMMomentsEngagementNotificationInfo *)v80 initWithJSONDictionary:v79 error:&v121];
                  id v81 = v121;
                  int v42 = v117;
                  v9 = v115;
                  if (v81)
                  {
                    v82 = v81;
                    if (a4) {
                      *a4 = v81;
                    }

                    v61 = v98;
                    int v41 = 0;
                  }
                  else
                  {

LABEL_72:
                    self = -[BMMomentsEngagementSuggestionEvent initWithType:timestamp:fullBundleOrderedSet:clientIdentifier:viewContainerName:viewVisibleTime:suggestionType:viewVisibleSuggestionsCount:viewTotalSuggestionsCount:notificationInfo:](self, "initWithType:timestamp:fullBundleOrderedSet:clientIdentifier:viewContainerName:viewVisibleTime:suggestionType:viewVisibleSuggestionsCount:viewTotalSuggestionsCount:notificationInfo:", [v42 intValue], v9, v119, v107, v33, v108, v113, v105, v102, v62);
                    int v41 = self;
                  }
LABEL_73:
                }
                else
                {
                  int v42 = v117;
                  if (a4)
                  {
                    id v99 = objc_alloc(MEMORY[0x1E4F28C58]);
                    uint64_t v97 = *MEMORY[0x1E4F502C8];
                    uint64_t v127 = *MEMORY[0x1E4F28568];
                    v62 = (BMMomentsEngagementNotificationInfo *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"notificationInfo"];
                    v128 = v62;
                    v95 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v128 forKeys:&v127 count:1];
                    *a4 = (id)[v99 initWithDomain:v97 code:2 userInfo:v95];

                    int v41 = 0;
                    v9 = v115;
                    goto LABEL_73;
                  }
                  int v41 = 0;
                  v9 = v115;
                }

                uint64_t v6 = v111;
                id v30 = v107;
LABEL_75:

LABEL_76:
LABEL_77:

LABEL_78:
LABEL_79:

LABEL_80:
LABEL_81:

LABEL_82:
LABEL_84:

                uint64_t v8 = v116;
                goto LABEL_85;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v102 = v60;
                goto LABEL_69;
              }
              if (a4)
              {
                id v103 = objc_alloc(MEMORY[0x1E4F28C58]);
                uint64_t v93 = *MEMORY[0x1E4F502C8];
                uint64_t v129 = *MEMORY[0x1E4F28568];
                v61 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"viewTotalSuggestionsCount"];
                v130 = v61;
                v62 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v130 forKeys:&v129 count:1];
                id v94 = (id)[v103 initWithDomain:v93 code:2 userInfo:v62];
                int v41 = 0;
                id v102 = 0;
                *a4 = v94;
                int v42 = v117;
                goto LABEL_73;
              }
              id v102 = 0;
              int v41 = 0;
            }
            uint64_t v6 = v111;
            int v42 = v117;
            goto LABEL_75;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v33 = v32;
            v9 = v115;
            goto LABEL_57;
          }
          if (a4)
          {
            id v67 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v68 = *MEMORY[0x1E4F502C8];
            uint64_t v137 = *MEMORY[0x1E4F28568];
            id v69 = v30;
            id v70 = [NSString alloc];
            uint64_t v96 = objc_opt_class();
            v71 = v70;
            id v30 = v69;
            id v108 = (id)[v71 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", v96, @"viewContainerName"];
            id v138 = v108;
            v106 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v138 forKeys:&v137 count:1];
            id v72 = (id)objc_msgSend(v67, "initWithDomain:code:userInfo:", v68, 2);
            int v41 = 0;
            id v33 = 0;
            *a4 = v72;
            uint64_t v6 = v111;
            int v42 = v117;
            v9 = v115;
            goto LABEL_78;
          }
          id v33 = 0;
          int v41 = 0;
        }
        else
        {
          self = v112;
          if (!a4)
          {
            id v30 = 0;
            int v41 = 0;
            uint64_t v6 = v111;
            int v42 = v117;
            v9 = v115;
            goto LABEL_81;
          }
          id v64 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v65 = *MEMORY[0x1E4F502C8];
          uint64_t v139 = *MEMORY[0x1E4F28568];
          id v33 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"clientIdentifier"];
          id v140 = v33;
          v109 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v140 forKeys:&v139 count:1];
          id v66 = (id)objc_msgSend(v64, "initWithDomain:code:userInfo:", v65, 2);
          int v41 = 0;
          id v30 = 0;
          *a4 = v66;
        }
        uint64_t v6 = v111;
        int v42 = v117;
        v9 = v115;
        goto LABEL_79;
      }
    }
    double v34 = a4;
    if (a4)
    {
      id v35 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v36 = *MEMORY[0x1E4F502C8];
      uint64_t v143 = *MEMORY[0x1E4F28568];
      id v26 = (id)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"fullBundleOrderedSet"];
      id v144 = v26;
      v37 = (void *)MEMORY[0x1E4F1C9E8];
      v38 = &v144;
      v39 = &v143;
LABEL_41:
      id v33 = [v37 dictionaryWithObjects:v38 forKeys:v39 count:1];
      id v40 = (id)[v35 initWithDomain:v36 code:2 userInfo:v33];
      int v41 = 0;
      *double v34 = v40;
LABEL_45:
      id v30 = v18;
      id v5 = v110;
      uint64_t v6 = v111;
      self = v112;
      v9 = v115;
      int v42 = v117;
      goto LABEL_80;
    }
LABEL_48:
    int v41 = 0;
    id v30 = v18;
    id v5 = v110;
    uint64_t v6 = v111;
    self = v112;
    v9 = v115;
LABEL_49:
    int v42 = v117;
    goto LABEL_82;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = v8;
    goto LABEL_11;
  }
  if (a4)
  {
    v73 = v6;
    id v74 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v75 = *MEMORY[0x1E4F502C8];
    uint64_t v148 = *MEMORY[0x1E4F28568];
    id v18 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"timestamp"];
    id v149 = v18;
    uint64_t v76 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v149 forKeys:&v148 count:1];
    v77 = v74;
    uint64_t v6 = v73;
    v120 = (void *)v76;
    id v78 = (id)objc_msgSend(v77, "initWithDomain:code:userInfo:", v75, 2);
    v9 = 0;
    int v41 = 0;
    *a4 = v78;
    int v42 = v117;

    goto LABEL_84;
  }
  v9 = 0;
  int v41 = 0;
  int v42 = v117;
LABEL_85:

LABEL_86:
  return v41;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMMomentsEngagementSuggestionEvent *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_hasRaw_timestamp) {
    PBDataWriterWriteDoubleField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_fullBundleOrderedSet;
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
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        PBDataWriterPlaceMark();
        [v10 writeTo:v4];
        PBDataWriterRecallMark();
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  if (self->_clientIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_viewContainerName) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasViewVisibleTime) {
    PBDataWriterWriteFloatField();
  }
  if (self->_suggestionType) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasViewVisibleSuggestionsCount) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasViewTotalSuggestionsCount) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_notificationInfo)
  {
    PBDataWriterPlaceMark();
    [(BMMomentsEngagementNotificationInfo *)self->_notificationInfo writeTo:v4];
    PBDataWriterRecallMark();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v65.receiver = self;
  v65.super_class = (Class)BMMomentsEngagementSuggestionEvent;
  id v5 = [(BMEventBase *)&v65 init];
  if (!v5) {
    goto LABEL_82;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  v9 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    uint64_t v10 = &OBJC_IVAR___BMAppInFocus__hasDuration;
    long long v11 = (int *)MEMORY[0x1E4F940B8];
    long long v12 = &OBJC_IVAR___BMAppInFocus__hasDuration;
    do
    {
      if (v4[*v9]) {
        break;
      }
      char v13 = 0;
      unsigned int v14 = 0;
      unint64_t v15 = 0;
      while (1)
      {
        uint64_t v16 = *v7;
        uint64_t v17 = *(void *)&v4[v16];
        unint64_t v18 = v17 + 1;
        if (v17 == -1 || v18 > *(void *)&v4[*v8]) {
          break;
        }
        char v19 = *(unsigned char *)(*(void *)&v4[*v11] + v17);
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
          int v21 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      int v21 = v4[*v9];
      if (v4[*v9]) {
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
            uint64_t v26 = *v7;
            uint64_t v27 = *(void *)&v4[v26];
            unint64_t v28 = v27 + 1;
            if (v27 == -1 || v28 > *(void *)&v4[*v8]) {
              break;
            }
            char v29 = *(unsigned char *)(*(void *)&v4[*v11] + v27);
            *(void *)&v4[v26] = v28;
            v25 |= (unint64_t)(v29 & 0x7F) << v23;
            if ((v29 & 0x80) == 0) {
              goto LABEL_60;
            }
            v23 += 7;
            BOOL v20 = v24++ >= 9;
            if (v20)
            {
              LODWORD(v25) = 0;
              goto LABEL_62;
            }
          }
          v4[*v9] = 1;
LABEL_60:
          if (v4[*v9]) {
            LODWORD(v25) = 0;
          }
LABEL_62:
          if (v25 >= 0x20) {
            LODWORD(v25) = 0;
          }
          *(_DWORD *)((char *)&v5->super.super.isa + v10[706]) = v25;
          continue;
        case 2u:
          *((unsigned char *)&v5->super.super.isa + v12[707]) = 1;
          uint64_t v30 = *v7;
          unint64_t v31 = *(void *)&v4[v30];
          if (v31 <= 0xFFFFFFFFFFFFFFF7 && v31 + 8 <= *(void *)&v4[*v8])
          {
            double v32 = *(double *)(*(void *)&v4[*v11] + v31);
            *(void *)&v4[v30] = v31 + 8;
          }
          else
          {
            v4[*v9] = 1;
            double v32 = 0.0;
          }
          uint64_t v59 = 24;
          goto LABEL_78;
        case 3u:
          uint64_t v66 = 0;
          uint64_t v67 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_84;
          }
          id v33 = v12;
          double v34 = v10;
          id v35 = [[BMMomentsEngagementBundleSummary alloc] initByReadFrom:v4];
          if (!v35) {
            goto LABEL_84;
          }
          uint64_t v36 = v35;
          [v6 addObject:v35];
          PBReaderRecallMark();

          uint64_t v10 = v34;
          long long v12 = v33;
          continue;
        case 4u:
          uint64_t v37 = PBReaderReadString();
          uint64_t v38 = 64;
          goto LABEL_41;
        case 5u:
          uint64_t v37 = PBReaderReadString();
          uint64_t v38 = 72;
          goto LABEL_41;
        case 6u:
          v5->_hasViewVisibleTime = 1;
          uint64_t v39 = *v7;
          unint64_t v40 = *(void *)&v4[v39];
          if (v40 <= 0xFFFFFFFFFFFFFFFBLL && v40 + 4 <= *(void *)&v4[*v8])
          {
            float v41 = *(float *)(*(void *)&v4[*v11] + v40);
            *(void *)&v4[v39] = v40 + 4;
          }
          else
          {
            v4[*v9] = 1;
            float v41 = 0.0;
          }
          double v32 = v41;
          uint64_t v59 = 80;
LABEL_78:
          *(double *)((char *)&v5->super.super.isa + v59) = v32;
          continue;
        case 7u:
          uint64_t v37 = PBReaderReadString();
          uint64_t v38 = 88;
LABEL_41:
          int v42 = *(Class *)((char *)&v5->super.super.isa + v38);
          *(Class *)((char *)&v5->super.super.isa + v38) = (Class)v37;

          continue;
        case 8u:
          char v43 = 0;
          unsigned int v44 = 0;
          uint64_t v45 = 0;
          v5->_hasViewVisibleSuggestionsCount = 1;
          while (2)
          {
            uint64_t v46 = *v7;
            uint64_t v47 = *(void *)&v4[v46];
            unint64_t v48 = v47 + 1;
            if (v47 == -1 || v48 > *(void *)&v4[*v8])
            {
              v4[*v9] = 1;
            }
            else
            {
              char v49 = *(unsigned char *)(*(void *)&v4[*v11] + v47);
              *(void *)&v4[v46] = v48;
              v45 |= (unint64_t)(v49 & 0x7F) << v43;
              if (v49 < 0)
              {
                v43 += 7;
                BOOL v20 = v44++ >= 9;
                if (v20)
                {
                  LODWORD(v45) = 0;
                  goto LABEL_68;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v9]) {
            LODWORD(v45) = 0;
          }
LABEL_68:
          uint64_t v58 = 44;
          goto LABEL_73;
        case 9u:
          char v50 = 0;
          unsigned int v51 = 0;
          uint64_t v45 = 0;
          v5->_hasViewTotalSuggestionsCount = 1;
          break;
        case 0xAu:
          uint64_t v66 = 0;
          uint64_t v67 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_84;
          }
          v56 = [[BMMomentsEngagementNotificationInfo alloc] initByReadFrom:v4];
          if (!v56) {
            goto LABEL_84;
          }
          notificationInfo = v5->_notificationInfo;
          v5->_notificationInfo = v56;

          PBReaderRecallMark();
          continue;
        default:
          if (PBReaderSkipValueWithTag()) {
            continue;
          }
LABEL_84:

          goto LABEL_81;
      }
      while (1)
      {
        uint64_t v52 = *v7;
        uint64_t v53 = *(void *)&v4[v52];
        unint64_t v54 = v53 + 1;
        if (v53 == -1 || v54 > *(void *)&v4[*v8]) {
          break;
        }
        char v55 = *(unsigned char *)(*(void *)&v4[*v11] + v53);
        *(void *)&v4[v52] = v54;
        v45 |= (unint64_t)(v55 & 0x7F) << v50;
        if ((v55 & 0x80) == 0) {
          goto LABEL_70;
        }
        v50 += 7;
        BOOL v20 = v51++ >= 9;
        if (v20)
        {
          LODWORD(v45) = 0;
          goto LABEL_72;
        }
      }
      v4[*v9] = 1;
LABEL_70:
      if (v4[*v9]) {
        LODWORD(v45) = 0;
      }
LABEL_72:
      uint64_t v58 = 48;
LABEL_73:
      *(_DWORD *)((char *)&v5->super.super.isa + v58) = v45;
    }
    while (*(void *)&v4[*v7] < *(void *)&v4[*v8]);
  }
  uint64_t v60 = [v6 copy];
  fullBundleOrderedSet = v5->_fullBundleOrderedSet;
  v5->_fullBundleOrderedSet = (NSArray *)v60;

  int v62 = v4[*v9];
  if (v62) {
LABEL_81:
  }
    v63 = 0;
  else {
LABEL_82:
  }
    v63 = v5;

  return v63;
}

- (NSString)description
{
  id v15 = [NSString alloc];
  unsigned int v14 = BMMomentsEngagementSuggestionTypeAsString([(BMMomentsEngagementSuggestionEvent *)self type]);
  uint64_t v3 = [(BMMomentsEngagementSuggestionEvent *)self timestamp];
  id v4 = [(BMMomentsEngagementSuggestionEvent *)self fullBundleOrderedSet];
  id v5 = [(BMMomentsEngagementSuggestionEvent *)self clientIdentifier];
  uint64_t v6 = [(BMMomentsEngagementSuggestionEvent *)self viewContainerName];
  uint64_t v7 = NSNumber;
  [(BMMomentsEngagementSuggestionEvent *)self viewVisibleTime];
  uint64_t v8 = objc_msgSend(v7, "numberWithDouble:");
  v9 = [(BMMomentsEngagementSuggestionEvent *)self suggestionType];
  uint64_t v10 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEngagementSuggestionEvent viewVisibleSuggestionsCount](self, "viewVisibleSuggestionsCount"));
  long long v11 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEngagementSuggestionEvent viewTotalSuggestionsCount](self, "viewTotalSuggestionsCount"));
  long long v12 = [(BMMomentsEngagementSuggestionEvent *)self notificationInfo];
  id v16 = (id)[v15 initWithFormat:@"BMMomentsEngagementSuggestionEvent with type: %@, timestamp: %@, fullBundleOrderedSet: %@, clientIdentifier: %@, viewContainerName: %@, viewVisibleTime: %@, suggestionType: %@, viewVisibleSuggestionsCount: %@, viewTotalSuggestionsCount: %@, notificationInfo: %@", v14, v3, v4, v5, v6, v8, v9, v10, v11, v12];

  return (NSString *)v16;
}

- (BMMomentsEngagementSuggestionEvent)initWithType:(int)a3 timestamp:(id)a4 fullBundleOrderedSet:(id)a5 clientIdentifier:(id)a6 viewContainerName:(id)a7 viewVisibleTime:(id)a8 suggestionType:(id)a9 viewVisibleSuggestionsCount:(id)a10 viewTotalSuggestionsCount:(id)a11 notificationInfo:(id)a12
{
  id v17 = a4;
  id v34 = a5;
  id v33 = a6;
  id v32 = a7;
  id v18 = a8;
  id v31 = a9;
  id v19 = a10;
  id v20 = a11;
  int v21 = v17;
  id v22 = a12;
  v35.receiver = self;
  v35.super_class = (Class)BMMomentsEngagementSuggestionEvent;
  char v23 = [(BMEventBase *)&v35 init];
  if (v23)
  {
    v23->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    v23->_type = a3;
    if (v21)
    {
      v23->_hasRaw_timestamp = 1;
      [v21 timeIntervalSince1970];
    }
    else
    {
      v23->_hasRaw_timestamp = 0;
      double v24 = -1.0;
    }
    v23->_raw_timestamp = v24;
    objc_storeStrong((id *)&v23->_fullBundleOrderedSet, a5);
    objc_storeStrong((id *)&v23->_clientIdentifier, a6);
    objc_storeStrong((id *)&v23->_viewContainerName, a7);
    if (v18)
    {
      v23->_hasViewVisibleTime = 1;
      [v18 floatValue];
      double v26 = v25;
    }
    else
    {
      v23->_hasViewVisibleTime = 0;
      double v26 = -1.0;
    }
    v23->_viewVisibleTime = v26;
    objc_storeStrong((id *)&v23->_suggestionType, a9);
    if (v19)
    {
      v23->_hasViewVisibleSuggestionsCount = 1;
      int v27 = [v19 intValue];
    }
    else
    {
      v23->_hasViewVisibleSuggestionsCount = 0;
      int v27 = -1;
    }
    v23->_viewVisibleSuggestionsCount = v27;
    if (v20)
    {
      v23->_hasViewTotalSuggestionsCount = 1;
      int v28 = [v20 intValue];
    }
    else
    {
      v23->_hasViewTotalSuggestionsCount = 0;
      int v28 = -1;
    }
    v23->_viewTotalSuggestionsCount = v28;
    objc_storeStrong((id *)&v23->_notificationInfo, a12);
  }

  return v23;
}

+ (id)protoFields
{
  v14[10] = *MEMORY[0x1E4F143B8];
  char v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"type" number:1 type:4 subMessageClass:0];
  v14[0] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"timestamp" number:2 type:0 subMessageClass:0];
  v14[1] = v2;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"fullBundleOrderedSet" number:3 type:14 subMessageClass:objc_opt_class()];
  v14[2] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clientIdentifier" number:4 type:13 subMessageClass:0];
  v14[3] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"viewContainerName" number:5 type:13 subMessageClass:0];
  v14[4] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"viewVisibleTime" number:6 type:1 subMessageClass:0];
  v14[5] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"suggestionType" number:7 type:13 subMessageClass:0];
  v14[6] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"viewVisibleSuggestionsCount" number:8 type:2 subMessageClass:0];
  v14[7] = v8;
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"viewTotalSuggestionsCount" number:9 type:2 subMessageClass:0];
  v14[8] = v9;
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"notificationInfo" number:10 type:14 subMessageClass:objc_opt_class()];
  v14[9] = v10;
  long long v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:10];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF58F8;
}

+ (id)columns
{
  v14[10] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"type" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:4 convertedType:0];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"timestamp" dataType:3 requestOnly:0 fieldNumber:2 protoDataType:0 convertedType:2];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"fullBundleOrderedSet_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_624];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clientIdentifier" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"viewContainerName" dataType:2 requestOnly:0 fieldNumber:5 protoDataType:13 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"viewVisibleTime" dataType:1 requestOnly:0 fieldNumber:6 protoDataType:1 convertedType:0];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"suggestionType" dataType:2 requestOnly:0 fieldNumber:7 protoDataType:13 convertedType:0];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"viewVisibleSuggestionsCount" dataType:0 requestOnly:0 fieldNumber:8 protoDataType:2 convertedType:0];
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"viewTotalSuggestionsCount" dataType:0 requestOnly:0 fieldNumber:9 protoDataType:2 convertedType:0];
  long long v11 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"notificationInfo_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_626];
  v14[0] = v2;
  v14[1] = v3;
  v14[2] = v4;
  v14[3] = v5;
  v14[4] = v6;
  v14[5] = v7;
  v14[6] = v8;
  v14[7] = v9;
  v14[8] = v10;
  v14[9] = v11;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:10];

  return v13;
}

id __45__BMMomentsEngagementSuggestionEvent_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 notificationInfo];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __45__BMMomentsEngagementSuggestionEvent_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  uint64_t v3 = [v2 _fullBundleOrderedSetJSONArray];
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

    uint64_t v8 = [[BMMomentsEngagementSuggestionEvent alloc] initByReadFrom:v7];
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