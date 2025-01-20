@interface ATXSpotlightEvent
+ (BOOL)supportsSecureCoding;
+ (id)actionSuggestionContextMenuDismissOnceEventWithSuggestionId:(id)a3 actionBlendingCacheId:(id)a4 date:(id)a5;
+ (id)actionSuggestionDismissedEventWithSuggestionId:(id)a3 actionBlendingCacheId:(id)a4 date:(id)a5;
+ (id)actionSuggestionTappedEventWithSuggestion:(id)a3 actionBlendingCacheId:(id)a4 currentQuery:(id)a5 date:(id)a6;
+ (id)appSuggestionTappedEventWithSuggestion:(id)a3 appBlendingCacheId:(id)a4 currentQuery:(id)a5 date:(id)a6;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)searchResultTappedWithEngagedBundleId:(id)a3 searchedActionType:(unint64_t)a4 date:(id)a5;
+ (id)suggestionsAppearedEventWithAppSuggestionIds:(id)a3 actionSuggestionIds:(id)a4 appBlendingCacheId:(id)a5 actionBlendingCacheId:(id)a6 date:(id)a7;
+ (id)viewAppearedEventWithSFFeedback:(id)a3 date:(id)a4;
+ (id)viewDisappearedEventWithDidSearch:(BOOL)a3 date:(id)a4;
- (ATXSpotlightEvent)initWithAbsoluteDate:(double)a3 eventType:(int)a4 appConsumerSubType:(id)a5 actionConsumerSubType:(id)a6 appBlendingCacheId:(id)a7 actionBlendingCacheId:(id)a8 appSuggestionIds:(id)a9 actionSuggestionIds:(id)a10 metadata:(id)a11;
- (ATXSpotlightEvent)initWithCoder:(id)a3;
- (ATXSpotlightEvent)initWithDate:(id)a3 eventType:(int)a4 appConsumerSubType:(id)a5 actionConsumerSubType:(id)a6 appBlendingCacheId:(id)a7 actionBlendingCacheId:(id)a8 appSuggestionIds:(id)a9 actionSuggestionIds:(id)a10 metadata:(id)a11;
- (ATXSpotlightEvent)initWithProto:(id)a3;
- (ATXSpotlightEvent)initWithProtoData:(id)a3;
- (ATXSpotlightEventMetadata)metadata;
- (BOOL)checkAndReportDecodingFailureIfNeededFordouble:(double)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)checkAndReportDecodingFailureIfNeededForint32_t:(int)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXSpotlightEvent:(id)a3;
- (NSArray)actionSuggestionIds;
- (NSArray)appSuggestionIds;
- (NSDate)date;
- (NSString)actionBlendingCacheId;
- (NSString)actionConsumerSubType;
- (NSString)appBlendingCacheId;
- (NSString)appConsumerSubType;
- (id)_stringArrayToUUIDArray:(id)a3;
- (id)blendingUICacheUpdateUUIDForUICacheConsumerSubType:(unsigned __int8)a3;
- (id)encodeAsProto;
- (id)json;
- (id)jsonDict;
- (id)proto;
- (id)sessionIdentifierForSessionType:(int64_t)a3 uiCacheConsumerSubType:(unsigned __int8)a4;
- (id)sessionProcessingOptionsForSessionType:(int64_t)a3;
- (int)eventType;
- (unint64_t)hash;
- (unsigned)consumerSubTypeForUIStream;
- (unsigned)dataVersion;
- (void)_updateActionUIFeedbackSession:(id)a3;
- (void)_updateAppUIFeedbackSession:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setActionBlendingCacheId:(id)a3;
- (void)setActionConsumerSubType:(id)a3;
- (void)setActionSuggestionIds:(id)a3;
- (void)setAppBlendingCacheId:(id)a3;
- (void)setAppConsumerSubType:(id)a3;
- (void)setAppSuggestionIds:(id)a3;
- (void)setDate:(id)a3;
- (void)setEventType:(int)a3;
- (void)setMetadata:(id)a3;
- (void)updateUIFeedbackSession:(id)a3 uiCacheConsumerSubType:(unsigned __int8)a4;
@end

@implementation ATXSpotlightEvent

- (ATXSpotlightEvent)initWithDate:(id)a3 eventType:(int)a4 appConsumerSubType:(id)a5 actionConsumerSubType:(id)a6 appBlendingCacheId:(id)a7 actionBlendingCacheId:(id)a8 appSuggestionIds:(id)a9 actionSuggestionIds:(id)a10 metadata:(id)a11
{
  uint64_t v15 = *(void *)&a4;
  id v18 = a11;
  id v19 = a10;
  id v20 = a9;
  id v21 = a8;
  id v22 = a7;
  id v23 = a6;
  id v24 = a5;
  [a3 timeIntervalSince1970];
  v25 = -[ATXSpotlightEvent initWithAbsoluteDate:eventType:appConsumerSubType:actionConsumerSubType:appBlendingCacheId:actionBlendingCacheId:appSuggestionIds:actionSuggestionIds:metadata:](self, "initWithAbsoluteDate:eventType:appConsumerSubType:actionConsumerSubType:appBlendingCacheId:actionBlendingCacheId:appSuggestionIds:actionSuggestionIds:metadata:", v15, v24, v23, v22, v21, v20, v19, v18);

  return v25;
}

- (ATXSpotlightEvent)initWithAbsoluteDate:(double)a3 eventType:(int)a4 appConsumerSubType:(id)a5 actionConsumerSubType:(id)a6 appBlendingCacheId:(id)a7 actionBlendingCacheId:(id)a8 appSuggestionIds:(id)a9 actionSuggestionIds:(id)a10 metadata:(id)a11
{
  id v28 = a5;
  id v27 = a6;
  id v26 = a7;
  id v25 = a8;
  id v24 = a9;
  id v18 = a10;
  id v19 = a11;
  v29.receiver = self;
  v29.super_class = (Class)ATXSpotlightEvent;
  id v20 = [(ATXSpotlightEvent *)&v29 init];
  id v21 = v20;
  if (v20)
  {
    v20->_absoluteDate = a3;
    v20->_eventType = a4;
    objc_storeStrong((id *)&v20->_appConsumerSubType, a5);
    objc_storeStrong((id *)&v21->_actionConsumerSubType, a6);
    objc_storeStrong((id *)&v21->_appBlendingCacheId, a7);
    objc_storeStrong((id *)&v21->_actionBlendingCacheId, a8);
    objc_storeStrong((id *)&v21->_appSuggestionIds, a9);
    objc_storeStrong((id *)&v21->_actionSuggestionIds, a10);
    objc_storeStrong((id *)&v21->_metadata, a11);
  }

  return v21;
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

- (unsigned)consumerSubTypeForUIStream
{
  return 9;
}

- (id)sessionProcessingOptionsForSessionType:(int64_t)a3
{
  if (a3) {
    return (id)MEMORY[0x1E4F1CBF0];
  }
  int v3 = self->_eventType - 1;
  if (v3 > 7) {
    return (id)MEMORY[0x1E4F1CBF0];
  }
  else {
    return (id)qword_1E5D0AA58[v3];
  }
}

- (id)sessionIdentifierForSessionType:(int64_t)a3 uiCacheConsumerSubType:(unsigned __int8)a4
{
  double v4 = @"spotlight-action";
  if (a4 != 21) {
    double v4 = 0;
  }
  if (a4 == 9) {
    return @"spotlight-app";
  }
  else {
    return v4;
  }
}

- (id)blendingUICacheUpdateUUIDForUICacheConsumerSubType:(unsigned __int8)a3
{
  if (a3 == 21)
  {
    p_actionBlendingCacheId = &self->_actionBlendingCacheId;
    if (!self->_actionBlendingCacheId)
    {
LABEL_4:
      double v4 = 0;
      goto LABEL_7;
    }
  }
  else
  {
    if (a3 != 9) {
      goto LABEL_4;
    }
    p_actionBlendingCacheId = &self->_appBlendingCacheId;
    if (!self->_appBlendingCacheId) {
      goto LABEL_4;
    }
  }
  double v4 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:*p_actionBlendingCacheId];
LABEL_7:

  return v4;
}

- (void)updateUIFeedbackSession:(id)a3 uiCacheConsumerSubType:(unsigned __int8)a4
{
  int v4 = a4;
  id v6 = a3;
  id v7 = v6;
  if (v4 == 21)
  {
    id v8 = v6;
    id v6 = (id)[(ATXSpotlightEvent *)self _updateActionUIFeedbackSession:v6];
  }
  else
  {
    if (v4 != 9) {
      goto LABEL_6;
    }
    id v8 = v6;
    id v6 = (id)[(ATXSpotlightEvent *)self _updateAppUIFeedbackSession:v6];
  }
  id v7 = v8;
LABEL_6:

  MEMORY[0x1F41817F8](v6, v7);
}

- (void)_updateAppUIFeedbackSession:(id)a3
{
  id v11 = a3;
  switch(self->_eventType)
  {
    case 1:
      uint64_t v5 = [MEMORY[0x1E4F4B680] consumerSubtypeForString:self->_appConsumerSubType found:0];
      int v4 = [[ATXSpotlightSessionMetadata alloc] initWithAppConsumerSubType:v5 actionConsumerSubType:21];
      [v11 updateConsumerSubTypeIfUnset:v5];
      [v11 updateSessionMetadataIfUnset:v4];
      goto LABEL_11;
    case 2:
      int v4 = [v11 sessionMetadata];
      id v6 = [(ATXSpotlightEventMetadata *)self->_metadata didSearchDuringSession];
      -[ATXSpotlightSessionMetadata setDidSearchDuringSession:](v4, "setDidSearchDuringSession:", [v6 BOOLValue]);
      goto LABEL_10;
    case 3:
      id v7 = [(ATXSpotlightEvent *)self _stringArrayToUUIDArray:self->_appSuggestionIds];
      [v11 updateEngagedUUIDs:0 rejectedUUIDs:0 shownUUIDs:v7];

      int v4 = (ATXSpotlightSessionMetadata *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:self->_appBlendingCacheId];
      [v11 updateBlendingUICacheUpdateUUIDIfUnset:v4];
      goto LABEL_11;
    case 4:
      id v8 = [(ATXSpotlightEvent *)self _stringArrayToUUIDArray:self->_appSuggestionIds];
      [v11 updateEngagedUUIDs:v8 rejectedUUIDs:0 shownUUIDs:0];

      int v4 = [v11 sessionMetadata];
      uint64_t v9 = [(ATXSpotlightEventMetadata *)self->_metadata engagedAppString];
      goto LABEL_9;
    case 5:
    case 6:
    case 7:
      int v4 = [(ATXSpotlightEvent *)self _stringArrayToUUIDArray:self->_appSuggestionIds];
      [v11 updateEngagedUUIDs:0 rejectedUUIDs:v4 shownUUIDs:0];
      goto LABEL_11;
    case 8:
      int v4 = [v11 sessionMetadata];
      v10 = [(ATXSpotlightEventMetadata *)self->_metadata searchEngagedBundleId];

      if (!v10) {
        goto LABEL_11;
      }
      uint64_t v9 = [(ATXSpotlightEventMetadata *)self->_metadata searchEngagedBundleId];
LABEL_9:
      id v6 = (void *)v9;
      [(ATXSpotlightSessionMetadata *)v4 setEngagedAppString:v9];
LABEL_10:

LABEL_11:
LABEL_12:

      return;
    default:
      goto LABEL_12;
  }
}

- (void)_updateActionUIFeedbackSession:(id)a3
{
  id v10 = a3;
  switch(self->_eventType)
  {
    case 1:
      uint64_t v5 = [MEMORY[0x1E4F4B680] consumerSubtypeForString:self->_actionConsumerSubType found:0];
      int v4 = [[ATXSpotlightSessionMetadata alloc] initWithAppConsumerSubType:9 actionConsumerSubType:v5];
      [v10 updateConsumerSubTypeIfUnset:v5];
      [v10 updateSessionMetadataIfUnset:v4];
      goto LABEL_10;
    case 2:
      int v4 = [v10 sessionMetadata];
      id v6 = [(ATXSpotlightEventMetadata *)self->_metadata didSearchDuringSession];
      -[ATXSpotlightSessionMetadata setDidSearchDuringSession:](v4, "setDidSearchDuringSession:", [v6 BOOLValue]);
      goto LABEL_9;
    case 3:
      id v7 = [(ATXSpotlightEvent *)self _stringArrayToUUIDArray:self->_actionSuggestionIds];
      [v10 updateEngagedUUIDs:0 rejectedUUIDs:0 shownUUIDs:v7];

      int v4 = (ATXSpotlightSessionMetadata *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:self->_actionBlendingCacheId];
      [v10 updateBlendingUICacheUpdateUUIDIfUnset:v4];
      goto LABEL_10;
    case 4:
      int v4 = [v10 sessionMetadata];
      id v8 = [(ATXSpotlightEventMetadata *)self->_metadata engagedAppString];
      [(ATXSpotlightSessionMetadata *)v4 setEngagedAppString:v8];

      id v6 = [(ATXSpotlightEvent *)self _stringArrayToUUIDArray:self->_actionSuggestionIds];
      [v10 updateEngagedUUIDs:v6 rejectedUUIDs:0 shownUUIDs:0];
      goto LABEL_9;
    case 5:
    case 6:
    case 7:
      int v4 = [(ATXSpotlightEvent *)self _stringArrayToUUIDArray:self->_actionSuggestionIds];
      [v10 updateEngagedUUIDs:0 rejectedUUIDs:v4 shownUUIDs:0];
      goto LABEL_10;
    case 8:
      int v4 = [v10 sessionMetadata];
      uint64_t v9 = [(ATXSpotlightEventMetadata *)self->_metadata searchEngagedBundleId];

      if (!v9) {
        goto LABEL_10;
      }
      id v6 = [(ATXSpotlightEventMetadata *)self->_metadata searchEngagedBundleId];
      [(ATXSpotlightSessionMetadata *)v4 setEngagedAppString:v6];
LABEL_9:

LABEL_10:
LABEL_11:

      return;
    default:
      goto LABEL_11;
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
  v17[6] = *MEMORY[0x1E4F143B8];
  v16[0] = @"date";
  int v3 = NSNumber;
  int v4 = [(ATXSpotlightEvent *)self date];
  [v4 timeIntervalSinceReferenceDate];
  id v5 = objc_msgSend(v3, "numberWithDouble:");
  v17[0] = v5;
  v16[1] = @"eventType";
  unsigned int v6 = self->_eventType - 1;
  if (v6 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_eventType);
    id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = off_1E5D0AA98[v6];
  }
  appBlendingCacheId = (__CFString *)self->_appBlendingCacheId;
  actionBlendingCacheId = self->_actionBlendingCacheId;
  if (!appBlendingCacheId) {
    appBlendingCacheId = @"nil";
  }
  v17[1] = v7;
  v17[2] = appBlendingCacheId;
  v16[2] = @"appBlendingCacheId";
  v16[3] = @"actionBlendingCacheId";
  if (actionBlendingCacheId) {
    id v10 = (__CFString *)actionBlendingCacheId;
  }
  else {
    id v10 = @"nil";
  }
  appSuggestionIds = self->_appSuggestionIds;
  actionSuggestionIds = self->_actionSuggestionIds;
  if (!appSuggestionIds) {
    appSuggestionIds = (NSArray *)@"nil";
  }
  v17[3] = v10;
  v17[4] = appSuggestionIds;
  v16[4] = @"appSuggestionIds";
  v16[5] = @"actionSuggestionIds";
  if (actionSuggestionIds) {
    v13 = (__CFString *)actionSuggestionIds;
  }
  else {
    v13 = @"nil";
  }
  v17[5] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:6];

  return v14;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  int v3 = [(ATXSpotlightEvent *)self jsonDict];
  int v4 = [v2 dataWithJSONObject:v3 options:1 error:0];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!a3)
  {
    uint64_t v15 = [v12 error];

    if (v15)
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    if (([v12 containsValueForKey:v11] & 1) == 0)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v21 = *MEMORY[0x1E4F28568];
      v17 = (void *)[[NSString alloc] initWithFormat:@"Failed to decode key %@", v11, v21];
      v22[0] = v17;
      BOOL v14 = 1;
      id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      id v19 = (void *)[v16 initWithDomain:v13 code:a7 userInfo:v18];

      [v12 failWithError:v19];
      goto LABEL_7;
    }
  }
  BOOL v14 = 0;
LABEL_7:

  return v14;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForint32_t:(int)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!a3)
  {
    uint64_t v15 = [v12 error];

    if (v15)
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    if (([v12 containsValueForKey:v11] & 1) == 0)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v21 = *MEMORY[0x1E4F28568];
      v17 = (void *)[[NSString alloc] initWithFormat:@"Failed to decode key %@", v11, v21];
      v22[0] = v17;
      BOOL v14 = 1;
      id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      id v19 = (void *)[v16 initWithDomain:v13 code:a7 userInfo:v18];

      [v12 failWithError:v19];
      goto LABEL_7;
    }
  }
  BOOL v14 = 0;
LABEL_7:

  return v14;
}

- (BOOL)checkAndReportDecodingFailureIfNeededFordouble:(double)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (a3 == 0.0)
  {
    uint64_t v15 = [v12 error];

    if (v15)
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    if (([v12 containsValueForKey:v11] & 1) == 0)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v21 = *MEMORY[0x1E4F28568];
      v17 = (void *)[[NSString alloc] initWithFormat:@"Failed to decode key %@", v11, v21];
      v22[0] = v17;
      BOOL v14 = 1;
      id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      id v19 = (void *)[v16 initWithDomain:v13 code:a7 userInfo:v18];

      [v12 failWithError:v19];
      goto LABEL_7;
    }
  }
  BOOL v14 = 0;
LABEL_7:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXSpotlightEvent *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (ATXSpotlightEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufData"];

  unsigned int v6 = [(ATXSpotlightEvent *)self initWithProtoData:v5];
  return v6;
}

- (ATXSpotlightEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[ATXPBSpotlightEvent alloc] initWithData:v4];

    self = [(ATXSpotlightEvent *)self initWithProto:v5];
    unsigned int v6 = self;
  }
  else
  {
    unsigned int v6 = 0;
  }

  return v6;
}

- (ATXSpotlightEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_7:
    uint64_t v15 = 0;
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v16 = __atxlog_handle_default();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[ATXSpotlightEvent initWithProto:]();
    }

    goto LABEL_7;
  }
  id v5 = v4;
  double v6 = -[ATXPBSpotlightEvent date]((uint64_t)v5);
  unsigned int v19 = -[ATXPBSpotlightEvent eventType]((uint64_t)v5);
  id v18 = -[ATXPBSpotlightEvent appConsumerSubType]((uint64_t)v5);
  id v7 = -[ATXPBSpotlightEvent actionConsumerSubType]((uint64_t)v5);
  id v8 = -[ATXPBSpotlightEvent appBlendingCacheId]((uint64_t)v5);
  uint64_t v9 = -[ATXPBSpotlightEvent actionBlendingCacheId]((uint64_t)v5);
  id v10 = -[ATXPBSpotlightEvent appSuggestionIds]((uint64_t)v5);
  id v11 = -[ATXPBSpotlightEvent actionSuggestionIds]((uint64_t)v5);
  id v12 = [ATXSpotlightEventMetadata alloc];
  id v13 = -[ATXPBSpotlightEvent metadata]((uint64_t)v5);

  BOOL v14 = [(ATXSpotlightEventMetadata *)v12 initWithProto:v13];
  self = [(ATXSpotlightEvent *)self initWithAbsoluteDate:v19 eventType:v18 appConsumerSubType:v7 actionConsumerSubType:v8 appBlendingCacheId:v9 actionBlendingCacheId:v10 appSuggestionIds:v6 actionSuggestionIds:v11 metadata:v14];

  uint64_t v15 = self;
LABEL_8:

  return v15;
}

- (id)proto
{
  int v3 = objc_opt_new();
  -[ATXPBSpotlightEvent setDate:]((uint64_t)v3, self->_absoluteDate);
  -[ATXPBSpotlightEvent setAppConsumerSubType:]((uint64_t)v3, self->_appConsumerSubType);
  -[ATXPBSpotlightEvent setActionConsumerSubType:]((uint64_t)v3, self->_actionConsumerSubType);
  -[ATXPBSpotlightEvent setEventType:]((uint64_t)v3, self->_eventType);
  -[ATXPBSpotlightEvent setAppBlendingCacheId:]((uint64_t)v3, self->_appBlendingCacheId);
  -[ATXPBSpotlightEvent setActionBlendingCacheId:]((uint64_t)v3, self->_actionBlendingCacheId);
  id v4 = (void *)[(NSArray *)self->_appSuggestionIds copy];
  -[ATXPBSpotlightEvent setAppSuggestionIds:]((uint64_t)v3, v4);

  id v5 = (void *)[(NSArray *)self->_actionSuggestionIds copy];
  -[ATXPBSpotlightEvent setActionSuggestionIds:]((uint64_t)v3, v5);

  double v6 = [(ATXSpotlightEventMetadata *)self->_metadata proto];
  -[ATXPBSpotlightEvent setMetadata:]((uint64_t)v3, v6);

  return v3;
}

- (id)encodeAsProto
{
  v2 = [(ATXSpotlightEvent *)self proto];
  int v3 = [v2 data];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXSpotlightEvent *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXSpotlightEvent *)self isEqualToATXSpotlightEvent:v5];

  return v6;
}

- (BOOL)isEqualToATXSpotlightEvent:(id)a3
{
  id v4 = (double *)a3;
  id v5 = v4;
  double v6 = self->_absoluteDate - v4[1];
  if (v6 < 0.0) {
    double v6 = -v6;
  }
  if (v6 > 2.22044605e-16) {
    goto LABEL_19;
  }
  int eventType = self->_eventType;
  if (eventType != [v4 eventType]) {
    goto LABEL_19;
  }
  appBlendingCacheId = self->_appBlendingCacheId;
  uint64_t v9 = (NSString *)*((id *)v5 + 5);
  if (appBlendingCacheId == v9)
  {
  }
  else
  {
    id v10 = v9;
    id v11 = appBlendingCacheId;
    char v12 = [(NSString *)v11 isEqual:v10];

    if ((v12 & 1) == 0) {
      goto LABEL_19;
    }
  }
  actionBlendingCacheId = self->_actionBlendingCacheId;
  BOOL v14 = (NSString *)*((id *)v5 + 6);
  if (actionBlendingCacheId == v14)
  {
  }
  else
  {
    uint64_t v15 = v14;
    id v16 = actionBlendingCacheId;
    char v17 = [(NSString *)v16 isEqual:v15];

    if ((v17 & 1) == 0) {
      goto LABEL_19;
    }
  }
  appSuggestionIds = self->_appSuggestionIds;
  unsigned int v19 = (NSArray *)*((id *)v5 + 7);
  if (appSuggestionIds == v19)
  {
  }
  else
  {
    id v20 = v19;
    uint64_t v21 = appSuggestionIds;
    char v22 = [(NSArray *)v21 isEqual:v20];

    if ((v22 & 1) == 0) {
      goto LABEL_19;
    }
  }
  actionSuggestionIds = self->_actionSuggestionIds;
  id v24 = (NSArray *)*((id *)v5 + 8);
  if (actionSuggestionIds == v24)
  {
  }
  else
  {
    id v25 = v24;
    id v26 = actionSuggestionIds;
    char v27 = [(NSArray *)v26 isEqual:v25];

    if ((v27 & 1) == 0)
    {
LABEL_19:
      char v28 = 0;
      goto LABEL_20;
    }
  }
  v30 = self->_metadata;
  v31 = v30;
  if (v30 == *((ATXSpotlightEventMetadata **)v5 + 9)) {
    char v28 = 1;
  }
  else {
    char v28 = -[ATXSpotlightEventMetadata isEqual:](v30, "isEqual:");
  }

LABEL_20:
  return v28;
}

- (unint64_t)hash
{
  unint64_t v3 = self->_eventType - (unint64_t)self->_absoluteDate + 32 * (unint64_t)self->_absoluteDate;
  NSUInteger v4 = [(NSString *)self->_appBlendingCacheId hash] - v3 + 32 * v3;
  NSUInteger v5 = [(NSString *)self->_actionBlendingCacheId hash] - v4 + 32 * v4;
  uint64_t v6 = [(NSArray *)self->_appSuggestionIds hash] - v5 + 32 * v5;
  uint64_t v7 = [(NSArray *)self->_actionSuggestionIds hash] - v6 + 32 * v6;
  return [(ATXSpotlightEventMetadata *)self->_metadata hash] - v7 + 32 * v7;
}

- (id)_stringArrayToUUIDArray:(id)a3
{
  return (id)objc_msgSend(a3, "_pas_mappedArrayWithTransform:", &__block_literal_global_96);
}

id __45__ATXSpotlightEvent__stringArrayToUUIDArray___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F29128];
  id v3 = a2;
  NSUInteger v4 = (void *)[[v2 alloc] initWithUUIDString:v3];

  return v4;
}

- (int)eventType
{
  return self->_eventType;
}

- (void)setEventType:(int)a3
{
  self->_int eventType = a3;
}

- (NSString)appConsumerSubType
{
  return self->_appConsumerSubType;
}

- (void)setAppConsumerSubType:(id)a3
{
}

- (NSString)actionConsumerSubType
{
  return self->_actionConsumerSubType;
}

- (void)setActionConsumerSubType:(id)a3
{
}

- (NSString)appBlendingCacheId
{
  return self->_appBlendingCacheId;
}

- (void)setAppBlendingCacheId:(id)a3
{
}

- (NSString)actionBlendingCacheId
{
  return self->_actionBlendingCacheId;
}

- (void)setActionBlendingCacheId:(id)a3
{
}

- (NSArray)appSuggestionIds
{
  return self->_appSuggestionIds;
}

- (void)setAppSuggestionIds:(id)a3
{
}

- (NSArray)actionSuggestionIds
{
  return self->_actionSuggestionIds;
}

- (void)setActionSuggestionIds:(id)a3
{
}

- (ATXSpotlightEventMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_actionSuggestionIds, 0);
  objc_storeStrong((id *)&self->_appSuggestionIds, 0);
  objc_storeStrong((id *)&self->_actionBlendingCacheId, 0);
  objc_storeStrong((id *)&self->_appBlendingCacheId, 0);
  objc_storeStrong((id *)&self->_actionConsumerSubType, 0);

  objc_storeStrong((id *)&self->_appConsumerSubType, 0);
}

+ (id)viewAppearedEventWithSFFeedback:(id)a3 date:(id)a4
{
  id v5 = a3;
  uint64_t v6 = (void *)MEMORY[0x1E4F4B680];
  id v7 = v5;
  id v8 = a4;
  uint64_t v9 = [v7 viewAppearEvent];
  uint64_t v10 = 4;
  if (v9 > 21)
  {
    if (v9 == 22) {
      goto LABEL_15;
    }
    if (v9 == 23 || v9 == 29)
    {
      uint64_t v10 = 7;
      goto LABEL_15;
    }
  }
  else
  {
    if ((unint64_t)(v9 - 4) < 2 || v9 == 0) {
      goto LABEL_15;
    }
    if (v9 == 2)
    {
      uint64_t v10 = 8;
      goto LABEL_15;
    }
  }
  char v12 = __atxlog_handle_feedback();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
    +[ATXSpotlightEvent(Initializers) viewAppearedEventWithSFFeedback:date:](v7);
  }

  uint64_t v10 = 4;
LABEL_15:

  id v13 = [v6 stringForConsumerSubtype:v10];
  BOOL v14 = (void *)MEMORY[0x1E4F4B680];
  id v15 = v7;
  unint64_t v16 = [v15 viewAppearEvent];
  if (v16 > 0x1E) {
    goto LABEL_25;
  }
  if (((1 << v16) & 0x40400031) != 0)
  {
LABEL_17:
    uint64_t v17 = 18;
    goto LABEL_18;
  }
  if (v16 != 2)
  {
    if (v16 == 23)
    {
      uint64_t v17 = 19;
      goto LABEL_18;
    }
LABEL_25:
    uint64_t v21 = __atxlog_handle_feedback();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      +[ATXSpotlightEvent(Initializers) viewAppearedEventWithSFFeedback:date:](v15);
    }

    goto LABEL_17;
  }
  uint64_t v17 = 20;
LABEL_18:

  id v18 = [v14 stringForConsumerSubtype:v17];
  unsigned int v19 = [[ATXSpotlightEvent alloc] initWithDate:v8 eventType:1 appConsumerSubType:v13 actionConsumerSubType:v18 appBlendingCacheId:0 actionBlendingCacheId:0 appSuggestionIds:0 actionSuggestionIds:0 metadata:0];

  return v19;
}

+ (id)viewDisappearedEventWithDidSearch:(BOOL)a3 date:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  uint64_t v6 = objc_opt_new();
  id v7 = [NSNumber numberWithBool:v4];
  [v6 setDidSearchDuringSession:v7];

  id v8 = [[ATXSpotlightEvent alloc] initWithDate:v5 eventType:2 appConsumerSubType:0 actionConsumerSubType:0 appBlendingCacheId:0 actionBlendingCacheId:0 appSuggestionIds:0 actionSuggestionIds:0 metadata:v6];

  return v8;
}

+ (id)suggestionsAppearedEventWithAppSuggestionIds:(id)a3 actionSuggestionIds:(id)a4 appBlendingCacheId:(id)a5 actionBlendingCacheId:(id)a6 date:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  unint64_t v16 = [[ATXSpotlightEvent alloc] initWithDate:v11 eventType:3 appConsumerSubType:0 actionConsumerSubType:0 appBlendingCacheId:v13 actionBlendingCacheId:v12 appSuggestionIds:v15 actionSuggestionIds:v14 metadata:0];

  return v16;
}

+ (id)appSuggestionTappedEventWithSuggestion:(id)a3 appBlendingCacheId:(id)a4 currentQuery:(id)a5 date:(id)a6
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_opt_new();
  [v13 setQueryAtEngagement:v10];

  id v14 = [v12 bundleIdExecutableObject];
  [v13 setEngagedAppString:v14];
  id v15 = [ATXSpotlightEvent alloc];
  unint64_t v16 = [v12 uuid];

  uint64_t v17 = [v16 UUIDString];
  v21[0] = v17;
  id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  unsigned int v19 = [(ATXSpotlightEvent *)v15 initWithDate:v9 eventType:4 appConsumerSubType:0 actionConsumerSubType:0 appBlendingCacheId:v11 actionBlendingCacheId:0 appSuggestionIds:v18 actionSuggestionIds:0 metadata:v13];

  return v19;
}

+ (id)actionSuggestionTappedEventWithSuggestion:(id)a3 actionBlendingCacheId:(id)a4 currentQuery:(id)a5 date:(id)a6
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_opt_new();
  [v13 setQueryAtEngagement:v10];

  id v14 = [v12 atxActionExecutableObject];
  id v15 = [v14 bundleId];
  [v13 setEngagedAppString:v15];

  unint64_t v16 = [ATXSpotlightEvent alloc];
  uint64_t v17 = [v12 uuid];

  id v18 = [v17 UUIDString];
  v22[0] = v18;
  unsigned int v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  id v20 = [(ATXSpotlightEvent *)v16 initWithDate:v9 eventType:4 appConsumerSubType:0 actionConsumerSubType:0 appBlendingCacheId:0 actionBlendingCacheId:v11 appSuggestionIds:0 actionSuggestionIds:v19 metadata:v13];

  return v20;
}

+ (id)actionSuggestionContextMenuDismissOnceEventWithSuggestionId:(id)a3 actionBlendingCacheId:(id)a4 date:(id)a5
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [ATXSpotlightEvent alloc];
  v14[0] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];

  id v12 = [(ATXSpotlightEvent *)v10 initWithDate:v7 eventType:6 appConsumerSubType:0 actionConsumerSubType:0 appBlendingCacheId:0 actionBlendingCacheId:v8 appSuggestionIds:0 actionSuggestionIds:v11 metadata:0];

  return v12;
}

+ (id)actionSuggestionDismissedEventWithSuggestionId:(id)a3 actionBlendingCacheId:(id)a4 date:(id)a5
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [ATXSpotlightEvent alloc];
  v14[0] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];

  id v12 = [(ATXSpotlightEvent *)v10 initWithDate:v7 eventType:5 appConsumerSubType:0 actionConsumerSubType:0 appBlendingCacheId:0 actionBlendingCacheId:v8 appSuggestionIds:0 actionSuggestionIds:v11 metadata:0];

  return v12;
}

+ (id)searchResultTappedWithEngagedBundleId:(id)a3 searchedActionType:(unint64_t)a4 date:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = objc_opt_new();
  [v9 setSearchEngagedBundleId:v8];

  id v10 = [NSNumber numberWithUnsignedInteger:a4];
  [v9 setSearchEngagedActionType:v10];

  id v11 = [[ATXSpotlightEvent alloc] initWithDate:v7 eventType:8 appConsumerSubType:0 actionConsumerSubType:0 appBlendingCacheId:0 actionBlendingCacheId:0 appSuggestionIds:0 actionSuggestionIds:0 metadata:v9];

  return v11;
}

- (void)initWithProto:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_1(&dword_1A790D000, v2, v3, "%@: tried to initialize with a non-ATXPBSpotlightEvent proto", v4, v5, v6, v7, 2u);
}

@end