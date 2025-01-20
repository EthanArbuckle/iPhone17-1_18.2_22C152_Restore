@interface SGEventMetadata
+ (id)describeType:(unsigned __int8)a3;
+ (id)eventMetadataFromEKEvent:(id)a3;
+ (unsigned)eventTypeFromString:(id)a3;
- (NSArray)eventActivities;
- (NSArray)participants;
- (NSArray)schemaOrg;
- (NSString)categoryDescription;
- (NSString)originBundleId;
- (SGEventMetadata)initWithType:(unsigned __int8)a3 categoryDescription:(id)a4 originBundleId:(id)a5 confidence:(double)a6 schemaOrg:(id)a7 participants:(id)a8;
- (SGEventMetadata)initWithType:(unsigned __int8)a3 categoryDescription:(id)a4 originBundleId:(id)a5 confidence:(double)a6 schemaOrg:(id)a7 participants:(id)a8 eventActivities:(id)a9;
- (double)confidence;
- (id)jsonObject;
- (id)toJsonString;
- (unsigned)type;
@end

@implementation SGEventMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventActivities, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_schemaOrg, 0);
  objc_storeStrong((id *)&self->_originBundleId, 0);

  objc_storeStrong((id *)&self->_categoryDescription, 0);
}

- (NSArray)eventActivities
{
  return self->_eventActivities;
}

- (NSArray)participants
{
  return self->_participants;
}

- (NSArray)schemaOrg
{
  return self->_schemaOrg;
}

- (double)confidence
{
  return self->_confidence;
}

- (NSString)originBundleId
{
  return self->_originBundleId;
}

- (NSString)categoryDescription
{
  return self->_categoryDescription;
}

- (unsigned)type
{
  return self->_type;
}

- (id)jsonObject
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v4 = self->_eventActivities;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "jsonObject", (void)v19);
        if (v9) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v6);
  }

  v23[0] = @"SGEventMetadataTypeKey";
  v10 = [(id)objc_opt_class() describeType:self->_type];
  categoryDescription = self->_categoryDescription;
  originBundleId = self->_originBundleId;
  v24[0] = v10;
  v24[1] = categoryDescription;
  v23[1] = @"SGEventMetadataCategoryDescriptionKey";
  v23[2] = @"SGEventMetadataBundleIdKey";
  v24[2] = originBundleId;
  v23[3] = @"SGEventMetadataConfidenceKey";
  v13 = [NSNumber numberWithDouble:self->_confidence];
  schemaOrg = self->_schemaOrg;
  participants = self->_participants;
  v24[3] = v13;
  v24[4] = schemaOrg;
  v23[4] = @"SGEventMetadataSchemaOrgKey";
  v23[5] = @"SGEventMetadataParticipantsKey";
  v23[6] = @"SGEventMetadataEventActivitiesKey";
  v24[5] = participants;
  v24[6] = v3;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:7];
  DeepCopy = (void *)CFPropertyListCreateDeepCopy(0, v16, 0);

  return DeepCopy;
}

- (id)toJsonString
{
  v3 = (void *)MEMORY[0x1A6265250](self, a2);
  v4 = (void *)MEMORY[0x1E4F28D90];
  uint64_t v5 = [(SGEventMetadata *)self jsonObject];
  id v10 = 0;
  uint64_t v6 = [v4 dataWithJSONObject:v5 options:0 error:&v10];
  id v7 = v10;

  if (v6) {
    v8 = (void *)[[NSString alloc] initWithData:v6 encoding:4];
  }
  else {
    v8 = 0;
  }

  return v8;
}

- (SGEventMetadata)initWithType:(unsigned __int8)a3 categoryDescription:(id)a4 originBundleId:(id)a5 confidence:(double)a6 schemaOrg:(id)a7 participants:(id)a8 eventActivities:(id)a9
{
  v16 = (__CFString *)a4;
  v17 = (__CFString *)a5;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v30.receiver = self;
  v30.super_class = (Class)SGEventMetadata;
  long long v21 = [(SGEventMetadata *)&v30 init];
  long long v22 = v21;
  if (v21)
  {
    v21->_type = a3;
    if (v16) {
      v23 = v16;
    }
    else {
      v23 = @"Unknown";
    }
    objc_storeStrong((id *)&v21->_categoryDescription, v23);
    if (v17) {
      v24 = v17;
    }
    else {
      v24 = @"Unknown";
    }
    objc_storeStrong((id *)&v22->_originBundleId, v24);
    v22->_confidence = a6;
    v25 = (void *)MEMORY[0x1E4F1CBF0];
    if (v18) {
      uint64_t v26 = v18;
    }
    else {
      uint64_t v26 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v22->_schemaOrg, v26);
    if (v19) {
      v27 = v19;
    }
    else {
      v27 = v25;
    }
    objc_storeStrong((id *)&v22->_participants, v27);
    if (v20) {
      v28 = v20;
    }
    else {
      v28 = v25;
    }
    objc_storeStrong((id *)&v22->_eventActivities, v28);
  }

  return v22;
}

- (SGEventMetadata)initWithType:(unsigned __int8)a3 categoryDescription:(id)a4 originBundleId:(id)a5 confidence:(double)a6 schemaOrg:(id)a7 participants:(id)a8
{
  return [(SGEventMetadata *)self initWithType:a3 categoryDescription:a4 originBundleId:a5 confidence:a7 schemaOrg:a8 participants:0 eventActivities:a6];
}

+ (unsigned)eventTypeFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"StructuredEvent"])
  {
    unsigned __int8 v4 = 1;
  }
  else if ([v3 isEqualToString:@"NLEvent"])
  {
    unsigned __int8 v4 = 2;
  }
  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

+ (id)describeType:(unsigned __int8)a3
{
  if (a3 > 2u) {
    return @"Unknown";
  }
  else {
    return off_1E5B8FA78[a3];
  }
}

+ (id)eventMetadataFromEKEvent:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1A6265250]();
  uint64_t v6 = [v4 customObjectForKey:@"SGEventMetadataKey"];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v27 = (void *)MEMORY[0x1A6265250]();
    id v7 = [v4 customObjectForKey:@"SuggestionsSchemaOrg"];

    v28 = [v4 customObjectForKey:@"SuggestionsNLEventDictionaryKey"];
    v29 = [v4 customObjectForKey:@"SuggestionsOriginBundleId"];
    if (v29 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v30 = v29;
      if (!v7) {
        goto LABEL_20;
      }
    }
    else
    {
      id v30 = 0;
      if (!v7) {
        goto LABEL_20;
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v31 = v7;
      uint64_t v26 = [[SGEventMetadata alloc] initWithType:1 categoryDescription:0 originBundleId:v30 confidence:v31 schemaOrg:0 participants:1.0];
      goto LABEL_28;
    }
LABEL_20:
    if (!v28 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      uint64_t v26 = 0;
LABEL_29:

      goto LABEL_30;
    }
    id v41 = v4;
    id v31 = v28;
    v32 = [v31 objectForKeyedSubscript:@"SuggestionsNLEventDictionaryEventTypeKey"];
    if (v32 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      id v33 = v32;
    }
    else {
      id v33 = 0;
    }
    v34 = [v31 objectForKeyedSubscript:@"SuggestionsNLEventDictionaryEventConfidenceScoreKey"];
    [v34 doubleValue];
    double v36 = v35;

    uint64_t v26 = [[SGEventMetadata alloc] initWithType:2 categoryDescription:v33 originBundleId:v30 confidence:0 schemaOrg:0 participants:v36];
    id v4 = v41;
LABEL_28:

    goto LABEL_29;
  }
  id v40 = v4;
  context = (void *)MEMORY[0x1A6265250]();
  id v7 = v6;
  v38 = [v7 objectForKeyedSubscript:@"SGEventMetadataConfidenceKey"];
  [v38 doubleValue];
  double v9 = v8;
  id v10 = objc_opt_new();
  [v7 objectForKeyedSubscript:@"SGEventMetadataEventActivitiesKey"];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [v11 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v43 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v42 + 1) + 8 * i);
        v17 = (void *)MEMORY[0x1A6265250]();
        id v18 = [[SGEventActivity alloc] initWithDictionary:v16];
        if (v18) {
          [v10 addObject:v18];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v13);
  }

  id v19 = [SGEventMetadata alloc];
  id v20 = [v7 objectForKeyedSubscript:@"SGEventMetadataTypeKey"];
  uint64_t v21 = [a1 eventTypeFromString:v20];
  long long v22 = [v7 objectForKeyedSubscript:@"SGEventMetadataCategoryDescriptionKey"];
  v23 = [v7 objectForKeyedSubscript:@"SGEventMetadataBundleIdKey"];
  v24 = [v7 objectForKeyedSubscript:@"SGEventMetadataSchemaOrgKey"];
  v25 = [v7 objectForKeyedSubscript:@"SGEventMetadataParticipantsKey"];
  uint64_t v26 = [(SGEventMetadata *)v19 initWithType:v21 categoryDescription:v22 originBundleId:v23 confidence:v24 schemaOrg:v25 participants:v10 eventActivities:v9];

  id v4 = v40;
LABEL_30:

  return v26;
}

@end