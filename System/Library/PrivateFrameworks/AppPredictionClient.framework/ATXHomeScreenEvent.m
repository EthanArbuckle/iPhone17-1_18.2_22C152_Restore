@interface ATXHomeScreenEvent
+ (BOOL)supportsSecureCoding;
+ (id)eventForPageShownWithIndex:(unint64_t)a3 widgetsByStack:(id)a4 blendingCacheIdentifier:(id)a5;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (ATXHomeScreenEvent)initWithCoder:(id)a3;
- (ATXHomeScreenEvent)initWithProto:(id)a3;
- (ATXHomeScreenEvent)initWithProtoData:(id)a3;
- (ATXHomeScreenEventMetadata)metadata;
- (BOOL)checkAndReportDecodingFailureIfNeededFordouble:(double)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXHomeScreenEvent:(id)a3;
- (BOOL)isSuggestedWidget;
- (NSArray)suggestionIds;
- (NSDate)date;
- (NSString)appBundleId;
- (NSString)blendingCacheId;
- (NSString)eventTypeString;
- (NSString)intentDescription;
- (NSString)reason;
- (NSString)stackId;
- (NSString)widgetBundleId;
- (NSString)widgetKind;
- (NSString)widgetUniqueId;
- (id)_uuidArrayFromStringArray:(id)a3;
- (id)blendingUICacheUpdateUUIDForUICacheConsumerSubType:(unsigned __int8)a3;
- (id)encodeAsProto;
- (id)json;
- (id)jsonDict;
- (id)proto;
- (id)sessionIdentifierForSessionType:(int64_t)a3 uiCacheConsumerSubType:(unsigned __int8)a4;
- (id)sessionProcessingOptionsForSessionType:(int64_t)a3;
- (unint64_t)stackKind;
- (unint64_t)stackLocation;
- (unint64_t)widgetSize;
- (unsigned)consumerSubType;
- (unsigned)consumerSubTypeForUIStream;
- (unsigned)dataVersion;
- (unsigned)feedbackConsumerSubType;
- (void)encodeWithCoder:(id)a3;
- (void)feedbackConsumerSubType;
- (void)setAppBundleId:(id)a3;
- (void)setBlendingCacheId:(id)a3;
- (void)setDate:(id)a3;
- (void)setEventTypeString:(id)a3;
- (void)setIntentDescription:(id)a3;
- (void)setIsSuggestedWidget:(BOOL)a3;
- (void)setMetadata:(id)a3;
- (void)setReason:(id)a3;
- (void)setStackId:(id)a3;
- (void)setStackKind:(unint64_t)a3;
- (void)setStackLocation:(unint64_t)a3;
- (void)setSuggestionIds:(id)a3;
- (void)setWidgetBundleId:(id)a3;
- (void)setWidgetKind:(id)a3;
- (void)setWidgetSize:(unint64_t)a3;
- (void)setWidgetUniqueId:(id)a3;
- (void)updateUIFeedbackSession:(id)a3 uiCacheConsumerSubType:(unsigned __int8)a4;
@end

@implementation ATXHomeScreenEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_suggestionIds, 0);
  objc_storeStrong((id *)&self->_widgetUniqueId, 0);
  objc_storeStrong((id *)&self->_intentDescription, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
  objc_storeStrong((id *)&self->_widgetKind, 0);
  objc_storeStrong((id *)&self->_widgetBundleId, 0);
  objc_storeStrong((id *)&self->_stackId, 0);
  objc_storeStrong((id *)&self->_blendingCacheId, 0);
  objc_storeStrong((id *)&self->_reason, 0);

  objc_storeStrong((id *)&self->_eventTypeString, 0);
}

- (void)setStackLocation:(unint64_t)a3
{
  self->_stackLocation = a3;
}

- (void)setStackKind:(unint64_t)a3
{
  self->_stackKind = a3;
}

- (void)setStackId:(id)a3
{
}

- (void)setReason:(id)a3
{
}

- (void)setMetadata:(id)a3
{
}

- (void)setEventTypeString:(id)a3
{
}

- (void)setDate:(id)a3
{
  [a3 timeIntervalSince1970];
  self->_absoluteDate = v4;
}

- (void)setBlendingCacheId:(id)a3
{
}

- (id)encodeAsProto
{
  v2 = [(ATXHomeScreenEvent *)self proto];
  v3 = [v2 data];

  return v3;
}

- (id)proto
{
  v3 = objc_opt_new();
  -[ATXPBHomeScreenEvent setDate:]((uint64_t)v3, self->_absoluteDate);
  -[ATXPBHomeScreenEvent setEventTypeString:]((uint64_t)v3, self->_eventTypeString);
  -[ATXPBHomeScreenEvent setReason:]((uint64_t)v3, self->_reason);
  -[ATXPBHomeScreenEvent setBlendingCacheId:]((uint64_t)v3, self->_blendingCacheId);
  -[ATXPBHomeScreenEvent setStackId:]((uint64_t)v3, self->_stackId);
  int v4 = ATXPBStackKindForKind(self->_stackKind);
  -[ATXPBHomeScreenEvent setStackKind:]((uint64_t)v3, v4);
  int v5 = ATXPBStackLocationForLocation(self->_stackLocation);
  -[ATXPBHomeScreenEvent setStackLocation:]((uint64_t)v3, v5);
  -[ATXPBHomeScreenEvent setWidgetBundleId:]((uint64_t)v3, self->_widgetBundleId);
  -[ATXPBHomeScreenEvent setWidgetKind:]((uint64_t)v3, self->_widgetKind);
  int v6 = ATXPBStackLayoutSizeForLayoutSize(self->_widgetSize);
  -[ATXPBHomeScreenEvent setWidgetSize:]((uint64_t)v3, v6);
  -[ATXPBHomeScreenEvent setIntentDescription:]((uint64_t)v3, self->_intentDescription);
  -[ATXPBHomeScreenEvent setWidgetUniqueId:]((uint64_t)v3, self->_widgetUniqueId);
  -[ATXPBHomeScreenEvent setAppBundleId:]((uint64_t)v3, self->_appBundleId);
  v7 = (void *)[(NSArray *)self->_suggestionIds copy];
  -[ATXPBHomeScreenEvent setSuggestionIds:]((uint64_t)v3, v7);

  v8 = [(ATXHomeScreenEventMetadata *)self->_metadata proto];
  -[ATXPBHomeScreenEvent setMetadata:]((uint64_t)v3, v8);

  return v3;
}

+ (id)eventForPageShownWithIndex:(unint64_t)a3 widgetsByStack:(id)a4 blendingCacheIdentifier:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = objc_opt_new();
  v10 = [MEMORY[0x1E4F1C9C8] now];
  [v9 setDate:v10];

  [v9 setEventTypeString:@"HomeScreenPageShown"];
  [v9 setBlendingCacheId:v7];

  v11 = objc_opt_new();
  v12 = [NSNumber numberWithUnsignedInteger:a3];
  [v11 setPageIndex:v12];

  [v11 setStacks:v8];
  [v9 setMetadata:v11];

  return v9;
}

- (NSDate)date
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSince1970:self->_absoluteDate];

  return (NSDate *)v2;
}

- (unsigned)consumerSubTypeForUIStream
{
  return 34;
}

- (id)sessionProcessingOptionsForSessionType:(int64_t)a3
{
  v3 = self->_eventTypeString;
  if (![(NSString *)v3 isEqualToString:@"Unknown"])
  {
    if ([(NSString *)v3 isEqualToString:@"Tapped"]
      || [(NSString *)v3 isEqualToString:@"ContextMenuDismissOnce"]
      || [(NSString *)v3 isEqualToString:@"ContextMenuNeverShowAgain"])
    {
      goto LABEL_6;
    }
    if ([(NSString *)v3 isEqualToString:@"WidgetAppeared"])
    {
      int v4 = &unk_1EFDF4AE8;
      goto LABEL_7;
    }
    if ([(NSString *)v3 isEqualToString:@"WidgetDisappeared"])
    {
      int v4 = &unk_1EFDF4B00;
      goto LABEL_7;
    }
    if ([(NSString *)v3 isEqualToString:@"SuggestionsAppeared"]
      || [(NSString *)v3 isEqualToString:@"SuggestionsDisappeared"])
    {
LABEL_6:
      int v4 = &unk_1EFDF4B18;
      goto LABEL_7;
    }
    if (![(NSString *)v3 isEqualToString:@"WidgetOccluded"]) {
      [(NSString *)v3 isEqualToString:@"WidgetUnoccluded"];
    }
  }
  int v4 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_7:

  return v4;
}

- (id)sessionIdentifierForSessionType:(int64_t)a3 uiCacheConsumerSubType:(unsigned __int8)a4
{
  return self->_widgetUniqueId;
}

- (id)blendingUICacheUpdateUUIDForUICacheConsumerSubType:(unsigned __int8)a3
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:self->_blendingCacheId];

  return v3;
}

- (unsigned)feedbackConsumerSubType
{
  p_widgetBundleId = &self->_widgetBundleId;
  if ([(NSString *)self->_widgetBundleId isEqualToString:@"com.apple.proactive.appprediction.panel"])
  {
    BOOL v4 = !ATXStackLocationIsTodayPage(self->_stackLocation);
    unsigned __int8 v5 = 37;
    unsigned __int8 v6 = 40;
    goto LABEL_5;
  }
  if ([(NSString *)*p_widgetBundleId isEqualToString:*MEMORY[0x1E4F4B5F8]])
  {
    BOOL v4 = !ATXStackLocationIsTodayPage(self->_stackLocation);
    unsigned __int8 v5 = 36;
    unsigned __int8 v6 = 39;
LABEL_5:
    if (v4) {
      return v5;
    }
    else {
      return v6;
    }
  }
  id v8 = __atxlog_handle_feedback();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    [(ATXHomeScreenEvent *)(uint64_t *)p_widgetBundleId feedbackConsumerSubType];
  }

  return 36;
}

- (void)updateUIFeedbackSession:(id)a3 uiCacheConsumerSubType:(unsigned __int8)a4
{
  id v13 = a3;
  unsigned __int8 v5 = self->_eventTypeString;
  if (![(NSString *)v5 isEqualToString:@"Unknown"])
  {
    if ([(NSString *)v5 isEqualToString:@"Tapped"])
    {

      unsigned __int8 v5 = [(ATXHomeScreenEvent *)self _uuidArrayFromStringArray:self->_suggestionIds];
      unsigned __int8 v6 = v13;
      id v7 = v5;
      id v8 = 0;
LABEL_7:
      v9 = 0;
LABEL_8:
      [v6 updateEngagedUUIDs:v7 rejectedUUIDs:v8 shownUUIDs:v9];
      goto LABEL_9;
    }
    if ([(NSString *)v5 isEqualToString:@"ContextMenuDismissOnce"]
      || [(NSString *)v5 isEqualToString:@"ContextMenuNeverShowAgain"])
    {

      unsigned __int8 v5 = [(ATXHomeScreenEvent *)self _uuidArrayFromStringArray:self->_suggestionIds];
      unsigned __int8 v6 = v13;
      id v7 = 0;
      id v8 = v5;
      goto LABEL_7;
    }
    if (![(NSString *)v5 isEqualToString:@"WidgetAppeared"]
      && ![(NSString *)v5 isEqualToString:@"WidgetDisappeared"])
    {
      if ([(NSString *)v5 isEqualToString:@"SuggestionsAppeared"])
      {

        unsigned __int8 v5 = [(ATXHomeScreenEvent *)self _uuidArrayFromStringArray:self->_suggestionIds];
        unsigned __int8 v6 = v13;
        id v7 = 0;
        id v8 = 0;
        v9 = v5;
        goto LABEL_8;
      }
      if (![(NSString *)v5 isEqualToString:@"SuggestionsDisappeared"]
        && ![(NSString *)v5 isEqualToString:@"WidgetOccluded"])
      {
        [(NSString *)v5 isEqualToString:@"WidgetUnoccluded"];
      }
    }
  }
LABEL_9:

  objc_msgSend(v13, "updateConsumerSubTypeIfUnset:", -[ATXHomeScreenEvent feedbackConsumerSubType](self, "feedbackConsumerSubType"));
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:self->_blendingCacheId];
  [v13 updateBlendingUICacheUpdateUUIDIfUnset:v10];

  v11 = [v13 sessionMetadata];

  if (!v11)
  {
    v12 = [[ATXHomeScreenSessionMetadata alloc] initWithWidgetUniqueId:self->_widgetUniqueId widgetBundleId:self->_widgetBundleId isWidgetInTodayView:ATXStackLocationIsTodayPage(self->_stackLocation)];
    [v13 updateSessionMetadataIfUnset:v12];
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
    unsigned __int8 v6 = (void *)[objc_alloc((Class)a1) initWithProtoData:v5];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (id)jsonDict
{
  v33[15] = *MEMORY[0x1E4F143B8];
  blendingCacheId = (__CFString *)self->_blendingCacheId;
  if (!blendingCacheId) {
    blendingCacheId = @"nil";
  }
  v33[0] = blendingCacheId;
  v32[0] = @"blendingCacheId";
  v32[1] = @"date";
  BOOL v4 = NSNumber;
  id v5 = [(ATXHomeScreenEvent *)self date];
  [v5 timeIntervalSinceReferenceDate];
  uint64_t v6 = objc_msgSend(v4, "numberWithDouble:");
  id v7 = (void *)v6;
  stackId = (__CFString *)self->_stackId;
  if (!stackId) {
    stackId = @"nil";
  }
  v33[1] = v6;
  v33[2] = stackId;
  v32[2] = @"stackId";
  v32[3] = @"stackKind";
  uint64_t v9 = ATXStringForStackKind(self->_stackKind);
  v10 = (void *)v9;
  if (v9) {
    v11 = (__CFString *)v9;
  }
  else {
    v11 = @"nil";
  }
  v33[3] = v11;
  v32[4] = @"stackLocation";
  uint64_t v12 = ATXStringForStackLocation(self->_stackLocation);
  id v13 = (void *)v12;
  if (v12) {
    v14 = (__CFString *)v12;
  }
  else {
    v14 = @"nil";
  }
  widgetUniqueId = (__CFString *)self->_widgetUniqueId;
  if (!widgetUniqueId) {
    widgetUniqueId = @"nil";
  }
  v33[4] = v14;
  v33[5] = widgetUniqueId;
  v32[5] = @"widgetUniqueId";
  v32[6] = @"widgetBundleId";
  widgetBundleId = (__CFString *)self->_widgetBundleId;
  widgetKind = (__CFString *)self->_widgetKind;
  if (!widgetBundleId) {
    widgetBundleId = @"nil";
  }
  if (!widgetKind) {
    widgetKind = @"nil";
  }
  v33[6] = widgetBundleId;
  v33[7] = widgetKind;
  v32[7] = @"widgetKind";
  v32[8] = @"isSuggestedWidget";
  uint64_t v18 = [NSNumber numberWithBool:self->_isSuggestedWidget];
  v19 = (void *)v18;
  appBundleId = (__CFString *)self->_appBundleId;
  if (!appBundleId) {
    appBundleId = @"nil";
  }
  v33[8] = v18;
  v33[9] = appBundleId;
  v32[9] = @"appBundleId";
  v32[10] = @"intentDescription";
  intentDescription = (__CFString *)self->_intentDescription;
  if (!intentDescription) {
    intentDescription = @"nil";
  }
  eventTypeString = self->_eventTypeString;
  reason = (__CFString *)self->_reason;
  if (!reason) {
    reason = @"nil";
  }
  v33[10] = intentDescription;
  v33[11] = reason;
  v32[11] = @"reason";
  v32[12] = @"suggestionIds";
  suggestionIds = self->_suggestionIds;
  metadata = self->_metadata;
  if (!suggestionIds) {
    suggestionIds = (NSArray *)@"nil";
  }
  if (eventTypeString) {
    v26 = (__CFString *)eventTypeString;
  }
  else {
    v26 = @"nil";
  }
  v33[12] = suggestionIds;
  v33[13] = v26;
  v32[13] = @"eventType";
  v32[14] = @"metadata";
  uint64_t v27 = [(ATXHomeScreenEventMetadata *)metadata dictionaryRepresentation];
  v28 = (void *)v27;
  if (v27) {
    v29 = (__CFString *)v27;
  }
  else {
    v29 = @"nil";
  }
  v33[14] = v29;
  v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:15];

  return v30;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  v3 = [(ATXHomeScreenEvent *)self jsonDict];
  BOOL v4 = [v2 dataWithJSONObject:v3 options:1 error:0];

  return v4;
}

- (ATXHomeScreenEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[ATXPBHomeScreenEvent alloc] initWithData:v4];

    self = [(ATXHomeScreenEvent *)self initWithProto:v5];
    uint64_t v6 = self;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (ATXHomeScreenEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_9:
    v34 = 0;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v35 = __atxlog_handle_default();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT)) {
      -[ATXHomeScreenEvent initWithProto:]((uint64_t)self, v35);
    }

    goto LABEL_9;
  }
  v37.receiver = self;
  v37.super_class = (Class)ATXHomeScreenEvent;
  id v5 = [(ATXHomeScreenEvent *)&v37 init];
  if (v5)
  {
    id v6 = v4;
    v5->_absoluteDate = -[ATXPBHomeScreenEvent date]((uint64_t)v6);
    uint64_t v7 = -[ATXPBHomeScreenEvent eventTypeString]((uint64_t)v6);
    eventTypeString = v5->_eventTypeString;
    v5->_eventTypeString = (NSString *)v7;

    uint64_t v9 = -[ATXPBHomeScreenEvent reason]((uint64_t)v6);
    reason = v5->_reason;
    v5->_reason = (NSString *)v9;

    uint64_t v11 = -[ATXPBHomeScreenEvent blendingCacheId]((uint64_t)v6);
    blendingCacheId = v5->_blendingCacheId;
    v5->_blendingCacheId = (NSString *)v11;

    uint64_t v13 = -[ATXPBHomeScreenEvent stackId]((uint64_t)v6);
    stackId = v5->_stackId;
    v5->_stackId = (NSString *)v13;

    int v15 = -[ATXPBHomeScreenEvent stackKind]((uint64_t)v6);
    v5->_stackKind = ATXStackKindForPBKind(v15);
    int v16 = -[ATXPBHomeScreenEvent stackLocation]((uint64_t)v6);
    v5->_stackLocation = ATXStackLocationForPBLocation(v16);
    uint64_t v17 = -[ATXPBHomeScreenEvent widgetBundleId]((uint64_t)v6);
    widgetBundleId = v5->_widgetBundleId;
    v5->_widgetBundleId = (NSString *)v17;

    uint64_t v19 = -[ATXPBHomeScreenEvent widgetKind]((uint64_t)v6);
    widgetKind = v5->_widgetKind;
    v5->_widgetKind = (NSString *)v19;

    int v21 = -[ATXPBHomeScreenEvent widgetSize]((uint64_t)v6);
    v5->_widgetSize = ATXStackLayoutSizeForPBLayoutSize(v21);
    uint64_t v22 = -[ATXPBHomeScreenEvent intentDescription]((uint64_t)v6);
    intentDescription = v5->_intentDescription;
    v5->_intentDescription = (NSString *)v22;

    uint64_t v24 = -[ATXPBHomeScreenEvent widgetUniqueId]((uint64_t)v6);
    widgetUniqueId = v5->_widgetUniqueId;
    v5->_widgetUniqueId = (NSString *)v24;

    uint64_t v26 = -[ATXPBHomeScreenEvent appBundleId]((uint64_t)v6);
    appBundleId = v5->_appBundleId;
    v5->_appBundleId = (NSString *)v26;

    uint64_t v28 = -[ATXPBHomeScreenEvent suggestionIds]((uint64_t)v6);
    suggestionIds = v5->_suggestionIds;
    v5->_suggestionIds = (NSArray *)v28;

    v30 = [ATXHomeScreenEventMetadata alloc];
    v31 = -[ATXPBHomeScreenEvent metadata]((uint64_t)v6);

    uint64_t v32 = [(ATXHomeScreenEventMetadata *)v30 initWithProto:v31];
    metadata = v5->_metadata;
    v5->_metadata = (ATXHomeScreenEventMetadata *)v32;
  }
  self = v5;
  v34 = self;
LABEL_10:

  return v34;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXHomeScreenEvent *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXHomeScreenEvent *)self isEqualToATXHomeScreenEvent:v5];

  return v6;
}

- (BOOL)isEqualToATXHomeScreenEvent:(id)a3
{
  id v4 = (id *)a3;
  id v5 = v4;
  double v6 = self->_absoluteDate - *((double *)v4 + 1);
  if (v6 < 0.0) {
    double v6 = -v6;
  }
  if (v6 > 2.22044605e-16) {
    goto LABEL_51;
  }
  eventTypeString = self->_eventTypeString;
  id v8 = (NSString *)v4[3];
  if (eventTypeString == v8)
  {
  }
  else
  {
    uint64_t v9 = v8;
    v10 = eventTypeString;
    char v11 = [(NSString *)v10 isEqual:v9];

    if ((v11 & 1) == 0)
    {
LABEL_51:
      BOOL v62 = 0;
      goto LABEL_52;
    }
  }
  reason = self->_reason;
  uint64_t v13 = (NSString *)v5[4];
  if (reason == v13)
  {
  }
  else
  {
    v14 = v13;
    int v15 = reason;
    char v16 = [(NSString *)v15 isEqual:v14];

    if ((v16 & 1) == 0) {
      goto LABEL_51;
    }
  }
  blendingCacheId = self->_blendingCacheId;
  uint64_t v18 = (NSString *)v5[5];
  if (blendingCacheId == v18)
  {
  }
  else
  {
    uint64_t v19 = v18;
    v20 = blendingCacheId;
    char v21 = [(NSString *)v20 isEqual:v19];

    if ((v21 & 1) == 0) {
      goto LABEL_51;
    }
  }
  stackId = self->_stackId;
  v23 = (NSString *)v5[6];
  if (stackId == v23)
  {
  }
  else
  {
    uint64_t v24 = v23;
    v25 = stackId;
    char v26 = [(NSString *)v25 isEqual:v24];

    if ((v26 & 1) == 0) {
      goto LABEL_51;
    }
  }
  widgetBundleId = self->_widgetBundleId;
  uint64_t v28 = (NSString *)v5[7];
  if (widgetBundleId == v28)
  {
  }
  else
  {
    v29 = v28;
    v30 = widgetBundleId;
    char v31 = [(NSString *)v30 isEqual:v29];

    if ((v31 & 1) == 0) {
      goto LABEL_51;
    }
  }
  widgetUniqueId = self->_widgetUniqueId;
  v33 = (NSString *)v5[14];
  if (widgetUniqueId == v33)
  {
  }
  else
  {
    v34 = v33;
    v35 = widgetUniqueId;
    char v36 = [(NSString *)v35 isEqual:v34];

    if ((v36 & 1) == 0) {
      goto LABEL_51;
    }
  }
  intentDescription = self->_intentDescription;
  v38 = (NSString *)v5[13];
  if (intentDescription == v38)
  {
  }
  else
  {
    v39 = v38;
    v40 = intentDescription;
    char v41 = [(NSString *)v40 isEqual:v39];

    if ((v41 & 1) == 0) {
      goto LABEL_51;
    }
  }
  suggestionIds = self->_suggestionIds;
  v43 = (NSArray *)v5[15];
  if (suggestionIds == v43)
  {
  }
  else
  {
    v44 = v43;
    v45 = suggestionIds;
    char v46 = [(NSArray *)v45 isEqual:v44];

    if ((v46 & 1) == 0) {
      goto LABEL_51;
    }
  }
  metadata = self->_metadata;
  v48 = (ATXHomeScreenEventMetadata *)v5[16];
  if (metadata == v48)
  {
  }
  else
  {
    v49 = v48;
    v50 = metadata;
    BOOL v51 = [(ATXHomeScreenEventMetadata *)v50 isEqual:v49];

    if (!v51) {
      goto LABEL_51;
    }
  }
  widgetKind = self->_widgetKind;
  v53 = (NSString *)v5[8];
  if (widgetKind == v53)
  {
  }
  else
  {
    v54 = v53;
    v55 = widgetKind;
    char v56 = [(NSString *)v55 isEqual:v54];

    if ((v56 & 1) == 0) {
      goto LABEL_51;
    }
  }
  appBundleId = self->_appBundleId;
  v58 = (NSString *)v5[9];
  if (appBundleId == v58)
  {
  }
  else
  {
    v59 = v58;
    v60 = appBundleId;
    char v61 = [(NSString *)v60 isEqual:v59];

    if ((v61 & 1) == 0) {
      goto LABEL_51;
    }
  }
  if (self->_widgetSize != v5[10] || self->_stackKind != v5[11]) {
    goto LABEL_51;
  }
  BOOL v62 = self->_stackLocation == (void)v5[12];
LABEL_52:

  return v62;
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
    int v15 = [v12 error];

    if (v15)
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    if (([v12 containsValueForKey:v11] & 1) == 0)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v21 = *MEMORY[0x1E4F28568];
      uint64_t v17 = (void *)[[NSString alloc] initWithFormat:@"Failed to decode key %@", v11, v21];
      v22[0] = v17;
      BOOL v14 = 1;
      uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      uint64_t v19 = (void *)[v16 initWithDomain:v13 code:a7 userInfo:v18];

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
    int v15 = [v12 error];

    if (v15)
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    if (([v12 containsValueForKey:v11] & 1) == 0)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v21 = *MEMORY[0x1E4F28568];
      uint64_t v17 = (void *)[[NSString alloc] initWithFormat:@"Failed to decode key %@", v11, v21];
      v22[0] = v17;
      BOOL v14 = 1;
      uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      uint64_t v19 = (void *)[v16 initWithDomain:v13 code:a7 userInfo:v18];

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
  id v5 = [(ATXHomeScreenEvent *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (ATXHomeScreenEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufData"];

  double v6 = [(ATXHomeScreenEvent *)self initWithProtoData:v5];
  return v6;
}

- (id)_uuidArrayFromStringArray:(id)a3
{
  return (id)objc_msgSend(a3, "_pas_mappedArrayWithTransform:", &__block_literal_global_51);
}

id __48__ATXHomeScreenEvent__uuidArrayFromStringArray___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F29128];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithUUIDString:v3];

  return v4;
}

- (NSString)eventTypeString
{
  return self->_eventTypeString;
}

- (NSString)reason
{
  return self->_reason;
}

- (NSString)blendingCacheId
{
  return self->_blendingCacheId;
}

- (NSString)stackId
{
  return self->_stackId;
}

- (NSString)widgetBundleId
{
  return self->_widgetBundleId;
}

- (void)setWidgetBundleId:(id)a3
{
}

- (NSString)widgetKind
{
  return self->_widgetKind;
}

- (void)setWidgetKind:(id)a3
{
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (void)setAppBundleId:(id)a3
{
}

- (BOOL)isSuggestedWidget
{
  return self->_isSuggestedWidget;
}

- (void)setIsSuggestedWidget:(BOOL)a3
{
  self->_isSuggestedWidget = a3;
}

- (unsigned)consumerSubType
{
  return self->_consumerSubType;
}

- (unint64_t)widgetSize
{
  return self->_widgetSize;
}

- (void)setWidgetSize:(unint64_t)a3
{
  self->_widgetSize = a3;
}

- (unint64_t)stackKind
{
  return self->_stackKind;
}

- (unint64_t)stackLocation
{
  return self->_stackLocation;
}

- (NSString)intentDescription
{
  return self->_intentDescription;
}

- (void)setIntentDescription:(id)a3
{
}

- (NSString)widgetUniqueId
{
  return self->_widgetUniqueId;
}

- (void)setWidgetUniqueId:(id)a3
{
}

- (NSArray)suggestionIds
{
  return self->_suggestionIds;
}

- (void)setSuggestionIds:(id)a3
{
}

- (ATXHomeScreenEventMetadata)metadata
{
  return self->_metadata;
}

- (void)feedbackConsumerSubType
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1A790D000, a2, OS_LOG_TYPE_ERROR, "Could not find consumerSubType for non-proactive widget bundle id: %@", (uint8_t *)&v3, 0xCu);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  double v6 = v4;
  _os_log_fault_impl(&dword_1A790D000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-ATXPBHomeScreenEvent proto", (uint8_t *)&v5, 0xCu);
}

@end