@interface ATXAppDirectoryEvent
+ (BOOL)supportsSecureCoding;
+ (id)_objectForKey:(id)a3 classType:(Class)a4 fromMetadata:(id)a5;
+ (id)appDirectoryEventWithEventType:(unint64_t)a3 metadata:(id)a4;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (ATXAppDirectoryEvent)initWithAbsoluteDate:(double)a3 eventType:(unint64_t)a4 categoryID:(id)a5 categoryIndex:(id)a6 bundleId:(id)a7 bundleIndex:(id)a8 searchQueryLength:(id)a9 searchTab:(id)a10 blendingCacheUUID:(id)a11 shownSuggestionIds:(id)a12 engagedSuggestionIds:(id)a13 metadata:(id)a14;
- (ATXAppDirectoryEvent)initWithCoder:(id)a3;
- (ATXAppDirectoryEvent)initWithDate:(id)a3 eventType:(unint64_t)a4 categoryID:(id)a5 categoryIndex:(id)a6 bundleId:(id)a7 bundleIndex:(id)a8 searchQueryLength:(id)a9 searchTab:(id)a10 blendingCacheUUID:(id)a11 shownSuggestionIds:(id)a12 engagedSuggestionIds:(id)a13 metadata:(id)a14;
- (ATXAppDirectoryEvent)initWithProto:(id)a3;
- (ATXAppDirectoryEvent)initWithProtoData:(id)a3;
- (ATXAppDirectoryEventMetadata)metadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXAppDirectoryEvent:(id)a3;
- (NSArray)engagedSuggestionIds;
- (NSArray)shownSuggestionIds;
- (NSDate)date;
- (NSNumber)bundleIndex;
- (NSNumber)categoryID;
- (NSNumber)categoryIndex;
- (NSNumber)searchQueryLength;
- (NSNumber)searchTab;
- (NSString)bundleId;
- (NSUUID)blendingCacheUUID;
- (id)blendingUICacheUpdateUUIDForUICacheConsumerSubType:(unsigned __int8)a3;
- (id)encodeAsProto;
- (id)json;
- (id)jsonDict;
- (id)proto;
- (id)sessionIdentifierForSessionType:(int64_t)a3 uiCacheConsumerSubType:(unsigned __int8)a4;
- (id)sessionProcessingOptionsForSessionType:(int64_t)a3;
- (unint64_t)eventType;
- (unint64_t)hash;
- (unsigned)consumerSubTypeForUIStream;
- (unsigned)dataVersion;
- (void)encodeWithCoder:(id)a3;
- (void)setBlendingCacheUUID:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setBundleIndex:(id)a3;
- (void)setCategoryID:(id)a3;
- (void)setCategoryIndex:(id)a3;
- (void)setDate:(id)a3;
- (void)setEngagedSuggestionIds:(id)a3;
- (void)setEventType:(unint64_t)a3;
- (void)setMetadata:(id)a3;
- (void)setSearchQueryLength:(id)a3;
- (void)setSearchTab:(id)a3;
- (void)setShownSuggestionIds:(id)a3;
- (void)updateUIFeedbackSession:(id)a3 uiCacheConsumerSubType:(unsigned __int8)a4;
@end

@implementation ATXAppDirectoryEvent

+ (id)appDirectoryEventWithEventType:(unint64_t)a3 metadata:(id)a4
{
  id v6 = a4;
  v7 = [a1 _objectForKey:@"kATXAppDirectoryLoggingDate" classType:objc_opt_class() fromMetadata:v6];
  if (v7)
  {
    v8 = [a1 _objectForKey:@"kATXAppDirectoryLoggingCategoryID" classType:objc_opt_class() fromMetadata:v6];
    v9 = [a1 _objectForKey:@"kATXAppDirectoryLoggingCategoryIndex" classType:objc_opt_class() fromMetadata:v6];
    v10 = [a1 _objectForKey:@"kATXAppDirectoryLoggingBundleID" classType:objc_opt_class() fromMetadata:v6];
    v11 = [a1 _objectForKey:@"kATXAppDirectoryLoggingBundleIndex" classType:objc_opt_class() fromMetadata:v6];
    v12 = [a1 _objectForKey:@"kATXAppDirectoryLoggingSearchQueryLength" classType:objc_opt_class() fromMetadata:v6];
    v13 = [a1 _objectForKey:@"kATXAppDirectoryLoggingSearchTab" classType:objc_opt_class() fromMetadata:v6];
    v14 = [[ATXAppDirectoryEvent alloc] initWithDate:v7 eventType:a3 categoryID:v8 categoryIndex:v9 bundleId:v10 bundleIndex:v11 searchQueryLength:v12 searchTab:v13 blendingCacheUUID:0 shownSuggestionIds:0 engagedSuggestionIds:0 metadata:0];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (ATXAppDirectoryEvent)initWithDate:(id)a3 eventType:(unint64_t)a4 categoryID:(id)a5 categoryIndex:(id)a6 bundleId:(id)a7 bundleIndex:(id)a8 searchQueryLength:(id)a9 searchTab:(id)a10 blendingCacheUUID:(id)a11 shownSuggestionIds:(id)a12 engagedSuggestionIds:(id)a13 metadata:(id)a14
{
  id v18 = a14;
  id v19 = a13;
  id v20 = a12;
  id v21 = a11;
  id v22 = a10;
  id v23 = a9;
  id v24 = a8;
  id v25 = a7;
  id v26 = a6;
  id v27 = a5;
  [a3 timeIntervalSince1970];
  v32 = -[ATXAppDirectoryEvent initWithAbsoluteDate:eventType:categoryID:categoryIndex:bundleId:bundleIndex:searchQueryLength:searchTab:blendingCacheUUID:shownSuggestionIds:engagedSuggestionIds:metadata:](self, "initWithAbsoluteDate:eventType:categoryID:categoryIndex:bundleId:bundleIndex:searchQueryLength:searchTab:blendingCacheUUID:shownSuggestionIds:engagedSuggestionIds:metadata:", a4, v27, v26, v25, v24, v23, v22, v21, v20, v19, v18);

  return v32;
}

- (ATXAppDirectoryEvent)initWithAbsoluteDate:(double)a3 eventType:(unint64_t)a4 categoryID:(id)a5 categoryIndex:(id)a6 bundleId:(id)a7 bundleIndex:(id)a8 searchQueryLength:(id)a9 searchTab:(id)a10 blendingCacheUUID:(id)a11 shownSuggestionIds:(id)a12 engagedSuggestionIds:(id)a13 metadata:(id)a14
{
  id v36 = a5;
  id obj = a6;
  id v35 = a6;
  id v29 = a7;
  id v34 = a7;
  id v33 = a8;
  id v32 = a9;
  id v31 = a10;
  id v20 = a11;
  id v21 = a12;
  id v22 = a13;
  id v23 = a14;
  v37.receiver = self;
  v37.super_class = (Class)ATXAppDirectoryEvent;
  id v24 = [(ATXAppDirectoryEvent *)&v37 init];
  id v25 = v24;
  if (v24)
  {
    v24->_absoluteDate = a3;
    v24->_eventType = a4;
    objc_storeStrong((id *)&v24->_categoryID, a5);
    objc_storeStrong((id *)&v25->_categoryIndex, obj);
    objc_storeStrong((id *)&v25->_bundleId, v29);
    objc_storeStrong((id *)&v25->_bundleIndex, a8);
    objc_storeStrong((id *)&v25->_searchQueryLength, a9);
    objc_storeStrong((id *)&v25->_searchTab, a10);
    objc_storeStrong((id *)&v25->_blendingCacheUUID, a11);
    objc_storeStrong((id *)&v25->_shownSuggestionIds, a12);
    objc_storeStrong((id *)&v25->_engagedSuggestionIds, a13);
    objc_storeStrong((id *)&v25->_metadata, a14);
  }

  return v25;
}

- (NSDate)date
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSince1970:self->_absoluteDate];

  return (NSDate *)v2;
}

- (void)setDate:(id)a3
{
  [a3 timeIntervalSince1970];
  self->_absoluteDate = v4;
}

+ (id)_objectForKey:(id)a3 classType:(Class)a4 fromMetadata:(id)a5
{
  v5 = [a5 objectForKey:a3];
  if (v5 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (unsigned)consumerSubTypeForUIStream
{
  return 35;
}

- (id)sessionProcessingOptionsForSessionType:(int64_t)a3
{
  unint64_t v3 = self->_eventType - 1;
  if (v3 > 8) {
    return &unk_1EFDF4B78;
  }
  else {
    return (id)qword_1E5D080F0[v3];
  }
}

- (id)sessionIdentifierForSessionType:(int64_t)a3 uiCacheConsumerSubType:(unsigned __int8)a4
{
  return @"app-directory";
}

- (id)blendingUICacheUpdateUUIDForUICacheConsumerSubType:(unsigned __int8)a3
{
  return self->_blendingCacheUUID;
}

- (void)updateUIFeedbackSession:(id)a3 uiCacheConsumerSubType:(unsigned __int8)a4
{
  id v11 = a3;
  v5 = [v11 sessionMetadata];

  if (v5)
  {
    id v6 = [v11 sessionMetadata];
  }
  else
  {
    id v6 = objc_opt_new();
    [v11 updateSessionMetadataIfUnset:v6];
  }
  switch(self->_eventType)
  {
    case 3uLL:
    case 4uLL:
    case 6uLL:
      [v11 updateEngagedUUIDs:self->_engagedSuggestionIds rejectedUUIDs:0 shownUUIDs:self->_shownSuggestionIds];
      [v6 setEngagedBundleId:self->_bundleId];
      v7 = [(ATXAppDirectoryEventMetadata *)self->_metadata bundleIdInTopAppsVisible];
      [v6 setEngagedBundleIdInTopAppsVisible:v7];

      goto LABEL_6;
    case 7uLL:
      [v6 setDidSearchDuringSession:1];
      break;
    case 8uLL:
      metadata = self->_metadata;
      if (metadata)
      {
        v9 = [(ATXAppDirectoryEventMetadata *)metadata userLaunchedAppBeforeLeaving];
        char v10 = [v9 BOOLValue];

        if ((v10 & 1) == 0)
        {
          [v11 updateEngagedUUIDs:0 rejectedUUIDs:0 shownUUIDs:self->_shownSuggestionIds];
LABEL_6:
          [v11 updateConsumerSubTypeIfUnset:35];
          [v11 updateBlendingUICacheUpdateUUIDIfUnset:self->_blendingCacheUUID];
        }
      }
      break;
    default:
      break;
  }
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 1)
  {
    id v5 = a3;
    id v6 = (void *)[objc_alloc((Class)a1) initWithProtoData:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)jsonDict
{
  v30[12] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(NSArray *)self->_shownSuggestionIds _pas_mappedArrayWithTransform:&__block_literal_global_53];
  double v4 = [(NSArray *)self->_engagedSuggestionIds _pas_mappedArrayWithTransform:&__block_literal_global_27_0];
  v29[0] = @"date";
  id v5 = NSNumber;
  id v6 = [(ATXAppDirectoryEvent *)self date];
  [v6 timeIntervalSinceReferenceDate];
  v7 = objc_msgSend(v5, "numberWithDouble:");
  v30[0] = v7;
  v29[1] = @"eventType";
  uint64_t v8 = NSStringForATXAppDirectoryInteractionEvent(self->_eventType);
  v9 = (void *)v8;
  categoryID = self->_categoryID;
  categoryIndex = self->_categoryIndex;
  if (!categoryID) {
    categoryID = (NSNumber *)@"nil";
  }
  v30[1] = v8;
  v30[2] = categoryID;
  v29[2] = @"categoryID";
  v29[3] = @"categoryIndex";
  if (categoryIndex) {
    v12 = (__CFString *)categoryIndex;
  }
  else {
    v12 = @"nil";
  }
  bundleId = (__CFString *)self->_bundleId;
  bundleIndex = self->_bundleIndex;
  if (!bundleId) {
    bundleId = @"nil";
  }
  v30[3] = v12;
  v30[4] = bundleId;
  v29[4] = @"bundleId";
  v29[5] = @"bundleIndex";
  if (bundleIndex) {
    v15 = (__CFString *)bundleIndex;
  }
  else {
    v15 = @"nil";
  }
  searchQueryLength = self->_searchQueryLength;
  searchTab = self->_searchTab;
  if (!searchQueryLength) {
    searchQueryLength = (NSNumber *)@"nil";
  }
  v30[5] = v15;
  v30[6] = searchQueryLength;
  v29[6] = @"searchQueryLength";
  v29[7] = @"searchTab";
  if (searchTab) {
    id v18 = (__CFString *)searchTab;
  }
  else {
    id v18 = @"nil";
  }
  v30[7] = v18;
  v29[8] = @"blendingCacheUUID";
  uint64_t v19 = [(NSUUID *)self->_blendingCacheUUID UUIDString];
  id v20 = (void *)v19;
  if (v19) {
    id v21 = (__CFString *)v19;
  }
  else {
    id v21 = @"nil";
  }
  if (v3) {
    id v22 = v3;
  }
  else {
    id v22 = @"nil";
  }
  v30[8] = v21;
  v30[9] = v22;
  v29[9] = @"shownSuggestionIds";
  v29[10] = @"engagedSuggestionIds";
  if (v4) {
    id v23 = v4;
  }
  else {
    id v23 = @"nil";
  }
  v30[10] = v23;
  v29[11] = @"metadata";
  uint64_t v24 = [(ATXAppDirectoryEventMetadata *)self->_metadata jsonDict];
  id v25 = (void *)v24;
  if (v24) {
    id v26 = (__CFString *)v24;
  }
  else {
    id v26 = @"nil";
  }
  v30[11] = v26;
  id v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:12];

  return v27;
}

uint64_t __32__ATXAppDirectoryEvent_jsonDict__block_invoke(uint64_t a1, void *a2)
{
  return [a2 UUIDString];
}

uint64_t __32__ATXAppDirectoryEvent_jsonDict__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 UUIDString];
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  unint64_t v3 = [(ATXAppDirectoryEvent *)self jsonDict];
  double v4 = [v2 dataWithJSONObject:v3 options:1 error:0];

  return v4;
}

- (ATXAppDirectoryEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[ATXPBAppDirectoryEvent alloc] initWithData:v4];

    self = [(ATXAppDirectoryEvent *)self initWithProto:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (ATXAppDirectoryEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_10:
    uint64_t v8 = 0;
    goto LABEL_33;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = __atxlog_handle_default();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[ATXAppDirectoryEvent initWithProto:]((uint64_t)self, v7);
    }

    goto LABEL_10;
  }
  id v5 = v4;
  if (-[ATXPBAppDirectoryEvent hasDate]((uint64_t)v5)
    && (double v6 = -[ATXPBAppDirectoryEvent date]((uint64_t)v5),
        -[ATXPBAppDirectoryEvent hasEventType]((uint64_t)v5)))
  {
    uint64_t v25 = -[ATXPBAppDirectoryEvent eventType]((uint64_t)v5);
    if (-[ATXPBAppDirectoryEvent hasCategoryID]((uint64_t)v5)) {
      id v26 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:-[ATXPBAppDirectoryEvent categoryID]((uint64_t)v5)];
    }
    else {
      id v26 = 0;
    }
    if (-[ATXPBAppDirectoryEvent hasCategoryIndex]((uint64_t)v5)) {
      uint64_t v24 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:-[ATXPBAppDirectoryEvent categoryIndex]((uint64_t)v5)];
    }
    else {
      uint64_t v24 = 0;
    }
    if (-[ATXPBAppDirectoryEvent hasBundleId]((BOOL)v5))
    {
      id v23 = -[ATXPBAppDirectoryEvent bundleId]((uint64_t)v5);
    }
    else
    {
      id v23 = 0;
    }
    if (-[ATXPBAppDirectoryEvent hasBundleIndex]((uint64_t)v5)) {
      id v22 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:-[ATXPBAppDirectoryEvent bundleIndex]((uint64_t)v5)];
    }
    else {
      id v22 = 0;
    }
    if (-[ATXPBAppDirectoryEvent hasSearchQueryLength]((uint64_t)v5)) {
      id v21 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:-[ATXPBAppDirectoryEvent searchQueryLength]((uint64_t)v5)];
    }
    else {
      id v21 = 0;
    }
    if (-[ATXPBAppDirectoryEvent hasSearchTab]((uint64_t)v5)) {
      v9 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:-[ATXPBAppDirectoryEvent searchTab]((uint64_t)v5)];
    }
    else {
      v9 = 0;
    }
    if (-[ATXPBAppDirectoryEvent hasBlendingCacheId]((BOOL)v5))
    {
      id v10 = objc_alloc(MEMORY[0x1E4F29128]);
      id v11 = -[ATXPBAppDirectoryEvent blendingCacheId]((uint64_t)v5);
      v12 = (void *)[v10 initWithUUIDString:v11];
    }
    else
    {
      v12 = 0;
    }
    v13 = -[ATXPBAppDirectoryEvent shownSuggestionIds]((uint64_t)v5);
    id v20 = objc_msgSend(v13, "_pas_mappedArrayWithTransform:", &__block_literal_global_73);

    v14 = -[ATXPBAppDirectoryEvent engagedSuggestionIds]((uint64_t)v5);
    v15 = objc_msgSend(v14, "_pas_mappedArrayWithTransform:", &__block_literal_global_75);

    v16 = [ATXAppDirectoryEventMetadata alloc];
    v17 = -[ATXPBAppDirectoryEvent metadata]((uint64_t)v5);
    id v18 = [(ATXAppDirectoryEventMetadata *)v16 initWithProto:v17];

    self = [(ATXAppDirectoryEvent *)self initWithAbsoluteDate:v25 eventType:v26 categoryID:v24 categoryIndex:v23 bundleId:v22 bundleIndex:v21 searchQueryLength:v6 searchTab:v9 blendingCacheUUID:v12 shownSuggestionIds:v20 engagedSuggestionIds:v15 metadata:v18];
    uint64_t v8 = self;
  }
  else
  {
    uint64_t v8 = 0;
  }

LABEL_33:
  return v8;
}

id __38__ATXAppDirectoryEvent_initWithProto___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F29128];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithUUIDString:v3];

  return v4;
}

id __38__ATXAppDirectoryEvent_initWithProto___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F29128];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithUUIDString:v3];

  return v4;
}

- (id)proto
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  -[ATXPBAppDirectoryEvent setDate:]((uint64_t)v3, self->_absoluteDate);
  -[ATXPBAppDirectoryEvent setEventType:]((uint64_t)v3, self->_eventType);
  categoryID = self->_categoryID;
  if (categoryID) {
    -[ATXPBAppDirectoryEvent setCategoryID:]((uint64_t)v3, [(NSNumber *)categoryID unsignedIntegerValue]);
  }
  categoryIndex = self->_categoryIndex;
  if (categoryIndex) {
    -[ATXPBAppDirectoryEvent setCategoryIndex:]((uint64_t)v3, [(NSNumber *)categoryIndex unsignedIntegerValue]);
  }
  bundleId = self->_bundleId;
  if (bundleId) {
    -[ATXPBAppDirectoryEvent setBundleId:]((uint64_t)v3, bundleId);
  }
  bundleIndex = self->_bundleIndex;
  if (bundleIndex) {
    -[ATXPBAppDirectoryEvent setBundleIndex:]((uint64_t)v3, [(NSNumber *)bundleIndex unsignedIntegerValue]);
  }
  searchQueryLength = self->_searchQueryLength;
  if (searchQueryLength) {
    -[ATXPBAppDirectoryEvent setSearchQueryLength:]((uint64_t)v3, [(NSNumber *)searchQueryLength unsignedIntegerValue]);
  }
  searchTab = self->_searchTab;
  if (searchTab) {
    -[ATXPBAppDirectoryEvent setSearchTab:]((uint64_t)v3, [(NSNumber *)searchTab unsignedIntegerValue]);
  }
  blendingCacheUUID = self->_blendingCacheUUID;
  if (blendingCacheUUID)
  {
    id v11 = [(NSUUID *)blendingCacheUUID UUIDString];
    -[ATXPBAppDirectoryEvent setBlendingCacheId:]((uint64_t)v3, v11);
  }
  if (self->_shownSuggestionIds)
  {
    v12 = objc_opt_new();
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v13 = self->_shownSuggestionIds;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v33 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = [*(id *)(*((void *)&v32 + 1) + 8 * i) UUIDString];
          [v12 addObject:v18];
        }
        uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v15);
    }

    -[ATXPBAppDirectoryEvent setShownSuggestionIds:]((uint64_t)v3, v12);
  }
  if (self->_engagedSuggestionIds)
  {
    uint64_t v19 = objc_opt_new();
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v20 = self->_engagedSuggestionIds;
    uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v29;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v29 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * j), "UUIDString", (void)v28);
          [v19 addObject:v25];
        }
        uint64_t v22 = [(NSArray *)v20 countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v22);
    }

    -[ATXPBAppDirectoryEvent setEngagedSuggestionIds:]((uint64_t)v3, v19);
  }
  id v26 = [(ATXAppDirectoryEventMetadata *)self->_metadata proto];
  -[ATXPBAppDirectoryEvent setMetadata:]((uint64_t)v3, v26);

  return v3;
}

- (id)encodeAsProto
{
  v2 = [(ATXAppDirectoryEvent *)self proto];
  id v3 = [v2 data];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXAppDirectoryEvent *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (ATXAppDirectoryEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufData"];

  double v6 = [(ATXAppDirectoryEvent *)self initWithProtoData:v5];
  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = self->_eventType - (unint64_t)self->_absoluteDate + 32 * (unint64_t)self->_absoluteDate;
  uint64_t v4 = [(NSNumber *)self->_categoryID hash] - v3 + 32 * v3;
  uint64_t v5 = [(NSNumber *)self->_categoryIndex hash] - v4 + 32 * v4;
  NSUInteger v6 = [(NSString *)self->_bundleId hash] - v5 + 32 * v5;
  uint64_t v7 = [(NSNumber *)self->_bundleIndex hash] - v6 + 32 * v6;
  uint64_t v8 = [(NSNumber *)self->_searchQueryLength hash] - v7 + 32 * v7;
  uint64_t v9 = [(NSNumber *)self->_searchTab hash] - v8 + 32 * v8;
  uint64_t v10 = [(NSUUID *)self->_blendingCacheUUID hash] - v9 + 32 * v9;
  uint64_t v11 = [(NSArray *)self->_shownSuggestionIds hash] - v10 + 32 * v10;
  uint64_t v12 = [(NSArray *)self->_engagedSuggestionIds hash] - v11 + 32 * v11;
  return [(ATXAppDirectoryEventMetadata *)self->_metadata hash] - v12 + 32 * v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (ATXAppDirectoryEvent *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXAppDirectoryEvent *)self isEqualToATXAppDirectoryEvent:v5];

  return v6;
}

- (BOOL)isEqualToATXAppDirectoryEvent:(id)a3
{
  uint64_t v4 = (id *)a3;
  uint64_t v5 = v4;
  double v6 = self->_absoluteDate - *((double *)v4 + 1);
  if (v6 < 0.0) {
    double v6 = -v6;
  }
  if (v6 > 2.22044605e-16 || self->_eventType != v4[2]) {
    goto LABEL_39;
  }
  categoryID = self->_categoryID;
  uint64_t v8 = (NSNumber *)v4[3];
  if (categoryID == v8)
  {
  }
  else
  {
    uint64_t v9 = v8;
    uint64_t v10 = categoryID;
    char v11 = [(NSNumber *)v10 isEqual:v9];

    if ((v11 & 1) == 0) {
      goto LABEL_39;
    }
  }
  categoryIndex = self->_categoryIndex;
  v13 = (NSNumber *)v5[4];
  if (categoryIndex == v13)
  {
  }
  else
  {
    uint64_t v14 = v13;
    uint64_t v15 = categoryIndex;
    char v16 = [(NSNumber *)v15 isEqual:v14];

    if ((v16 & 1) == 0) {
      goto LABEL_39;
    }
  }
  bundleId = self->_bundleId;
  id v18 = (NSString *)v5[5];
  if (bundleId == v18)
  {
  }
  else
  {
    uint64_t v19 = v18;
    id v20 = bundleId;
    char v21 = [(NSString *)v20 isEqual:v19];

    if ((v21 & 1) == 0) {
      goto LABEL_39;
    }
  }
  bundleIndex = self->_bundleIndex;
  uint64_t v23 = (NSNumber *)v5[6];
  if (bundleIndex == v23)
  {
  }
  else
  {
    uint64_t v24 = v23;
    uint64_t v25 = bundleIndex;
    char v26 = [(NSNumber *)v25 isEqual:v24];

    if ((v26 & 1) == 0) {
      goto LABEL_39;
    }
  }
  searchQueryLength = self->_searchQueryLength;
  long long v28 = (NSNumber *)v5[7];
  if (searchQueryLength == v28)
  {
  }
  else
  {
    long long v29 = v28;
    long long v30 = searchQueryLength;
    char v31 = [(NSNumber *)v30 isEqual:v29];

    if ((v31 & 1) == 0) {
      goto LABEL_39;
    }
  }
  searchTab = self->_searchTab;
  long long v33 = (NSNumber *)v5[8];
  if (searchTab == v33)
  {
  }
  else
  {
    long long v34 = v33;
    long long v35 = searchTab;
    char v36 = [(NSNumber *)v35 isEqual:v34];

    if ((v36 & 1) == 0) {
      goto LABEL_39;
    }
  }
  blendingCacheUUID = self->_blendingCacheUUID;
  uint64_t v38 = (NSUUID *)v5[9];
  if (blendingCacheUUID == v38)
  {
  }
  else
  {
    v39 = v38;
    v40 = blendingCacheUUID;
    char v41 = [(NSUUID *)v40 isEqual:v39];

    if ((v41 & 1) == 0) {
      goto LABEL_39;
    }
  }
  shownSuggestionIds = self->_shownSuggestionIds;
  v43 = (NSArray *)v5[10];
  if (shownSuggestionIds == v43)
  {
  }
  else
  {
    v44 = v43;
    v45 = shownSuggestionIds;
    char v46 = [(NSArray *)v45 isEqual:v44];

    if ((v46 & 1) == 0) {
      goto LABEL_39;
    }
  }
  engagedSuggestionIds = self->_engagedSuggestionIds;
  v48 = (NSArray *)v5[11];
  if (engagedSuggestionIds == v48)
  {
  }
  else
  {
    v49 = v48;
    v50 = engagedSuggestionIds;
    char v51 = [(NSArray *)v50 isEqual:v49];

    if ((v51 & 1) == 0)
    {
LABEL_39:
      char v52 = 0;
      goto LABEL_40;
    }
  }
  v54 = self->_metadata;
  v55 = v54;
  if (v54 == v5[12]) {
    char v52 = 1;
  }
  else {
    char v52 = -[ATXAppDirectoryEventMetadata isEqual:](v54, "isEqual:");
  }

LABEL_40:
  return v52;
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(unint64_t)a3
{
  self->_eventType = a3;
}

- (NSNumber)categoryID
{
  return self->_categoryID;
}

- (void)setCategoryID:(id)a3
{
}

- (NSNumber)categoryIndex
{
  return self->_categoryIndex;
}

- (void)setCategoryIndex:(id)a3
{
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (NSNumber)bundleIndex
{
  return self->_bundleIndex;
}

- (void)setBundleIndex:(id)a3
{
}

- (NSNumber)searchQueryLength
{
  return self->_searchQueryLength;
}

- (void)setSearchQueryLength:(id)a3
{
}

- (NSNumber)searchTab
{
  return self->_searchTab;
}

- (void)setSearchTab:(id)a3
{
}

- (NSUUID)blendingCacheUUID
{
  return self->_blendingCacheUUID;
}

- (void)setBlendingCacheUUID:(id)a3
{
}

- (NSArray)shownSuggestionIds
{
  return self->_shownSuggestionIds;
}

- (void)setShownSuggestionIds:(id)a3
{
}

- (NSArray)engagedSuggestionIds
{
  return self->_engagedSuggestionIds;
}

- (void)setEngagedSuggestionIds:(id)a3
{
}

- (ATXAppDirectoryEventMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_engagedSuggestionIds, 0);
  objc_storeStrong((id *)&self->_shownSuggestionIds, 0);
  objc_storeStrong((id *)&self->_blendingCacheUUID, 0);
  objc_storeStrong((id *)&self->_searchTab, 0);
  objc_storeStrong((id *)&self->_searchQueryLength, 0);
  objc_storeStrong((id *)&self->_bundleIndex, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_categoryIndex, 0);

  objc_storeStrong((id *)&self->_categoryID, 0);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  double v6 = v4;
  _os_log_fault_impl(&dword_1A790D000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-ATXPBAppDirectoryEvent proto", (uint8_t *)&v5, 0xCu);
}

@end