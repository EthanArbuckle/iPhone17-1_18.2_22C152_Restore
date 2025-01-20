@interface ATXMissedNotificationRanking
+ (BOOL)supportsSecureCoding;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (ATXDigestTimeline)digestTimeline;
- (ATXMissedNotificationRanking)initWithCoder:(id)a3;
- (ATXMissedNotificationRanking)initWithGroups:(id)a3 modeId:(id)a4 ranker:(id)a5;
- (ATXMissedNotificationRanking)initWithNotificationArrays:(id)a3 modeId:(id)a4 ranker:(id)a5;
- (ATXMissedNotificationRanking)initWithNotifications:(id)a3 modeId:(id)a4;
- (ATXMissedNotificationRanking)initWithNotifications:(id)a3 modeId:(id)a4 ranker:(id)a5;
- (ATXMissedNotificationRanking)initWithProto:(id)a3;
- (ATXMissedNotificationRanking)initWithProtoData:(id)a3;
- (ATXMissedNotificationRankingBiomeStream)loggingStream;
- (ATXSharedDigestEngagementTrackingMetrics)digestEngagementTrackingMetrics;
- (BOOL)doesRankingShareContentWithOtherRanking:(id)a3;
- (BOOL)hasLoggedCollapsed;
- (BOOL)hasLoggedDeliveredCollapsed;
- (BOOL)hasLoggedDeliveredExpanded;
- (BOOL)hasLoggedExpanded;
- (BOOL)hasLoggedRemoval;
- (BOOL)hasLoggedUpcomingCollapsed;
- (BOOL)hasLoggedUpcomingExpanded;
- (NSArray)rankedGroups;
- (NSString)modeIdString;
- (NSString)rankerId;
- (NSUUID)uuid;
- (double)creationTimestamp;
- (id)allNotificationIds;
- (id)encodeAsProto;
- (id)initFromJSON:(id)a3;
- (id)json;
- (id)jsonRepresentation;
- (id)proto;
- (unsigned)dataVersion;
- (void)encodeWithCoder:(id)a3;
- (void)logCollapsedPreview;
- (void)logCollapsedViewWithIsUpcoming:(BOOL)a3;
- (void)logExpandedViewWithIsUpcoming:(BOOL)a3;
- (void)logRemoval;
- (void)logView;
- (void)setDigestEngagementTrackingMetrics:(id)a3;
- (void)setDigestTimeline:(id)a3;
- (void)setHasLoggedCollapsed:(BOOL)a3;
- (void)setHasLoggedDeliveredCollapsed:(BOOL)a3;
- (void)setHasLoggedDeliveredExpanded:(BOOL)a3;
- (void)setHasLoggedExpanded:(BOOL)a3;
- (void)setHasLoggedRemoval:(BOOL)a3;
- (void)setHasLoggedUpcomingCollapsed:(BOOL)a3;
- (void)setHasLoggedUpcomingExpanded:(BOOL)a3;
- (void)setLoggingStream:(id)a3;
- (void)setModeIdString:(id)a3;
- (void)setRankerId:(id)a3;
@end

@implementation ATXMissedNotificationRanking

- (ATXMissedNotificationRanking)initWithNotifications:(id)a3 modeId:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_opt_new();
  v9 = [(ATXMissedNotificationRanking *)self initWithNotifications:v7 modeId:v6 ranker:v8];

  return v9;
}

- (ATXMissedNotificationRanking)initWithNotifications:(id)a3 modeId:(id)a4 ranker:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = +[ATXUserNotificationDigestNotificationGroup groupsFromNotifications:a3 modeId:v9];
  v11 = [(ATXMissedNotificationRanking *)self initWithGroups:v10 modeId:v9 ranker:v8];

  return v11;
}

- (ATXMissedNotificationRanking)initWithNotificationArrays:(id)a3 modeId:(id)a4 ranker:(id)a5
{
  id v8 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __73__ATXMissedNotificationRanking_initWithNotificationArrays_modeId_ranker___block_invoke;
  v14[3] = &unk_1E5D05E18;
  id v15 = v8;
  id v9 = v8;
  id v10 = a5;
  v11 = objc_msgSend(a3, "_pas_mappedArrayWithTransform:", v14);
  v12 = [(ATXMissedNotificationRanking *)self initWithGroups:v11 modeId:v9 ranker:v10];

  return v12;
}

ATXUserNotificationDigestNotificationGroup *__73__ATXMissedNotificationRanking_initWithNotificationArrays_modeId_ranker___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [[ATXUserNotificationDigestNotificationGroup alloc] initWithNotifications:v3 modeId:*(void *)(a1 + 32)];

  return v4;
}

- (ATXMissedNotificationRanking)initWithGroups:(id)a3 modeId:(id)a4 ranker:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)ATXMissedNotificationRanking;
  v11 = [(ATXMissedNotificationRanking *)&v21 init];
  if (v11)
  {
    uint64_t v12 = [v10 rankNotificationGroups:v8 modeId:v9];
    rankedGroups = v11->_rankedGroups;
    v11->_rankedGroups = (NSArray *)v12;

    v11->_creationTimestamp = CFAbsoluteTimeGetCurrent();
    uint64_t v14 = [MEMORY[0x1E4F29128] UUID];
    uuid = v11->_uuid;
    v11->_uuid = (NSUUID *)v14;

    uint64_t v16 = [(id)objc_opt_class() rankerId];
    rankerId = v11->_rankerId;
    v11->_rankerId = (NSString *)v16;

    uint64_t v18 = [v9 copy];
    modeIdString = v11->_modeIdString;
    v11->_modeIdString = (NSString *)v18;
  }
  return v11;
}

- (BOOL)doesRankingShareContentWithOtherRanking:(id)a3
{
  id v4 = a3;
  v5 = [(ATXMissedNotificationRanking *)self allNotificationIds];
  id v6 = [v4 allNotificationIds];

  LOBYTE(v4) = [v5 intersectsSet:v6];
  return (char)v4;
}

- (id)allNotificationIds
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = [(ATXMissedNotificationRanking *)self rankedGroups];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v10 = objc_msgSend(v9, "rankedNotifications", 0);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v18;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v18 != v13) {
                objc_enumerationMutation(v10);
              }
              id v15 = [*(id *)(*((void *)&v17 + 1) + 8 * j) uuid];
              [v3 addObject:v15];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
          }
          while (v12);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)logCollapsedPreview
{
  if (!self->_hasLoggedCollapsed)
  {
    self->_hasLoggedCollapsed = 1;
    id v3 = [ATXMissedNotificationRankingLoggingEvent alloc];
    id v4 = [MEMORY[0x1E4F1C9C8] now];
    [v4 timeIntervalSinceReferenceDate];
    uint64_t v6 = -[ATXMissedNotificationRankingLoggingEvent initWithMissedNotificationRanking:eventType:timestamp:](v3, "initWithMissedNotificationRanking:eventType:timestamp:", self, 1);

    loggingStream = self->_loggingStream;
    if (loggingStream) {
      [(ATXMissedNotificationRankingBiomeStream *)loggingStream sendEvent:v6];
    }
  }
}

- (void)logView
{
  if (!self->_hasLoggedExpanded)
  {
    self->_hasLoggedExpanded = 1;
    id v3 = [ATXMissedNotificationRankingLoggingEvent alloc];
    id v4 = [MEMORY[0x1E4F1C9C8] now];
    [v4 timeIntervalSinceReferenceDate];
    uint64_t v6 = -[ATXMissedNotificationRankingLoggingEvent initWithMissedNotificationRanking:eventType:timestamp:](v3, "initWithMissedNotificationRanking:eventType:timestamp:", self, 0);

    loggingStream = self->_loggingStream;
    if (loggingStream) {
      [(ATXMissedNotificationRankingBiomeStream *)loggingStream sendEvent:v6];
    }
  }
}

- (void)logExpandedViewWithIsUpcoming:(BOOL)a3
{
  if (a3)
  {
    if (self->_hasLoggedUpcomingExpanded) {
      return;
    }
    self->_hasLoggedUpcomingExpanded = 1;
    id v4 = [ATXMissedNotificationRankingLoggingEvent alloc];
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    uint64_t v5 = v4;
    uint64_t v6 = self;
    uint64_t v7 = 2;
  }
  else
  {
    if (self->_hasLoggedDeliveredExpanded) {
      return;
    }
    self->_hasLoggedDeliveredExpanded = 1;
    id v8 = [ATXMissedNotificationRankingLoggingEvent alloc];
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    uint64_t v5 = v8;
    uint64_t v6 = self;
    uint64_t v7 = 3;
  }
  uint64_t v9 = -[ATXMissedNotificationRankingLoggingEvent initWithMissedNotificationRanking:eventType:timestamp:](v5, "initWithMissedNotificationRanking:eventType:timestamp:", v6, v7);
  loggingStream = self->_loggingStream;
  if (loggingStream)
  {
    uint64_t v11 = v9;
    loggingStream = (ATXMissedNotificationRankingBiomeStream *)[(ATXMissedNotificationRankingBiomeStream *)loggingStream sendEvent:v9];
    uint64_t v9 = v11;
  }

  MEMORY[0x1F41817F8](loggingStream, v9);
}

- (void)logCollapsedViewWithIsUpcoming:(BOOL)a3
{
  if (a3)
  {
    if (self->_hasLoggedUpcomingCollapsed) {
      return;
    }
    self->_hasLoggedUpcomingCollapsed = 1;
    id v4 = [ATXMissedNotificationRankingLoggingEvent alloc];
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    uint64_t v5 = v4;
    uint64_t v6 = self;
    uint64_t v7 = 4;
  }
  else
  {
    if (self->_hasLoggedDeliveredCollapsed) {
      return;
    }
    self->_hasLoggedDeliveredCollapsed = 1;
    id v8 = [ATXMissedNotificationRankingLoggingEvent alloc];
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    uint64_t v5 = v8;
    uint64_t v6 = self;
    uint64_t v7 = 5;
  }
  uint64_t v9 = -[ATXMissedNotificationRankingLoggingEvent initWithMissedNotificationRanking:eventType:timestamp:](v5, "initWithMissedNotificationRanking:eventType:timestamp:", v6, v7);
  loggingStream = self->_loggingStream;
  if (loggingStream)
  {
    uint64_t v11 = v9;
    loggingStream = (ATXMissedNotificationRankingBiomeStream *)[(ATXMissedNotificationRankingBiomeStream *)loggingStream sendEvent:v9];
    uint64_t v9 = v11;
  }

  MEMORY[0x1F41817F8](loggingStream, v9);
}

- (void)logRemoval
{
  if (!self->_hasLoggedRemoval)
  {
    self->_hasLoggedRemoval = 1;
    id v3 = [ATXMissedNotificationRankingLoggingEvent alloc];
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    uint64_t v4 = -[ATXMissedNotificationRankingLoggingEvent initWithMissedNotificationRanking:eventType:timestamp:](v3, "initWithMissedNotificationRanking:eventType:timestamp:", self, 6);
    loggingStream = self->_loggingStream;
    if (loggingStream)
    {
      uint64_t v6 = v4;
      loggingStream = (ATXMissedNotificationRankingBiomeStream *)[(ATXMissedNotificationRankingBiomeStream *)loggingStream sendEvent:v4];
      uint64_t v4 = v6;
    }
    MEMORY[0x1F41817F8](loggingStream, v4);
  }
}

- (id)initFromJSON:(id)a3
{
  id v4 = a3;
  id v5 = [[ATXPBMissedNotificationRanking alloc] initFromJSON:v4];

  uint64_t v6 = [(ATXMissedNotificationRanking *)self initWithProto:v5];
  return v6;
}

- (id)jsonRepresentation
{
  v2 = [(ATXMissedNotificationRanking *)self proto];
  id v3 = [v2 jsonRepresentation];

  return v3;
}

- (ATXMissedNotificationRanking)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[ATXPBMissedNotificationRanking alloc] initWithData:v4];

    self = [(ATXMissedNotificationRanking *)self initWithProto:v5];
    uint64_t v6 = self;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)encodeAsProto
{
  v2 = [(ATXMissedNotificationRanking *)self proto];
  id v3 = [v2 data];

  return v3;
}

- (ATXMissedNotificationRanking)initWithProto:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)ATXMissedNotificationRanking;
  id v5 = [(ATXMissedNotificationRanking *)&v35 init];
  if (!v5)
  {
LABEL_24:
    uint64_t v12 = v5;
    goto LABEL_25;
  }
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v4;
      uint64_t v7 = [v6 rankedGroups];
      if (v7)
      {
        id v8 = [v6 rankedGroups];
        uint64_t v9 = objc_msgSend(v8, "_pas_mappedArrayWithTransform:", &__block_literal_global_13);
        rankedGroups = v5->_rankedGroups;
        v5->_rankedGroups = (NSArray *)v9;
      }
      else
      {
        id v8 = v5->_rankedGroups;
        v5->_rankedGroups = (NSArray *)MEMORY[0x1E4F1CBF0];
      }

      [v6 timestamp];
      v5->_creationTimestamp = v13;
      id v14 = objc_alloc(MEMORY[0x1E4F29128]);
      id v15 = [v6 uuid];
      uint64_t v16 = [v14 initWithUUIDString:v15];
      uuid = v5->_uuid;
      v5->_uuid = (NSUUID *)v16;

      uint64_t v18 = [v6 rankerId];
      rankerId = v5->_rankerId;
      v5->_rankerId = (NSString *)v18;

      uint64_t v20 = [v6 modeId];
      modeIdString = v5->_modeIdString;
      v5->_modeIdString = (NSString *)v20;

      long long v22 = [v6 sharedEngagementTracker];

      if (v22)
      {
        long long v23 = [v6 sharedEngagementTracker];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          v25 = [ATXSharedDigestEngagementTrackingMetrics alloc];
          v26 = [v6 sharedEngagementTracker];
          uint64_t v27 = [(ATXSharedDigestEngagementTrackingMetrics *)v25 initWithProto:v26];
          [(ATXMissedNotificationRanking *)v5 setDigestEngagementTrackingMetrics:v27];
        }
        else
        {
          v26 = __atxlog_handle_notification_management();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
            -[ATXMissedNotificationRanking initWithProto:]();
          }
        }
      }
      v28 = [v6 digestTimeline];

      if (v28)
      {
        v29 = [v6 digestTimeline];
        objc_opt_class();
        char v30 = objc_opt_isKindOfClass();

        if (v30)
        {
          v31 = [ATXDigestTimeline alloc];
          v32 = [v6 digestTimeline];
          v33 = [(ATXDigestTimeline *)v31 initWithProto:v32];
          [(ATXMissedNotificationRanking *)v5 setDigestTimeline:v33];
        }
        else
        {
          v32 = __atxlog_handle_notification_management();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
            -[ATXMissedNotificationRanking initWithProto:]();
          }
        }
      }
      goto LABEL_24;
    }
    uint64_t v11 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[ATXMissedNotificationRanking initWithProto:]();
    }
  }
  uint64_t v12 = 0;
LABEL_25:

  return v12;
}

ATXUserNotificationDigestNotificationGroup *__46__ATXMissedNotificationRanking_initWithProto___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[ATXUserNotificationDigestNotificationGroup alloc] initWithProto:v2];

  return v3;
}

- (id)proto
{
  id v3 = objc_opt_new();
  [v3 setTimestamp:self->_creationTimestamp];
  id v4 = [(NSUUID *)self->_uuid UUIDString];
  [v3 setUuid:v4];

  [v3 setRankerId:self->_rankerId];
  [v3 setModeId:self->_modeIdString];
  id v5 = [(ATXMissedNotificationRanking *)self digestEngagementTrackingMetrics];
  id v6 = [v5 proto];
  [v3 setSharedEngagementTracker:v6];

  uint64_t v7 = [(ATXMissedNotificationRanking *)self digestTimeline];
  id v8 = [v7 proto];
  [v3 setDigestTimeline:v8];

  uint64_t v9 = [(NSArray *)self->_rankedGroups _pas_mappedArrayWithTransform:&__block_literal_global_27];
  id v10 = objc_opt_new();
  [v3 setRankedGroups:v10];

  if (v9 && [v9 count])
  {
    uint64_t v11 = [v3 rankedGroups];
    [v11 addObjectsFromArray:v9];
  }

  return v3;
}

uint64_t __37__ATXMissedNotificationRanking_proto__block_invoke(uint64_t a1, void *a2)
{
  return [a2 proto];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXMissedNotificationRanking *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (ATXMissedNotificationRanking)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufData"];

  if (v5)
  {
    self = [(ATXMissedNotificationRanking *)self initWithProtoData:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (unsigned)dataVersion
{
  return 2;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    uint64_t v7 = (void *)[objc_alloc((Class)a1) initWithProtoData:v6];
    id v8 = +[_ATXNotificationGroupBaseRanker rankerId];
    [v7 setRankerId:v8];
  }
  else if (a4 == 2)
  {
    uint64_t v7 = (void *)[objc_alloc((Class)a1) initWithProtoData:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)json
{
  id v2 = (void *)MEMORY[0x1E4F28D90];
  id v3 = [(ATXMissedNotificationRanking *)self jsonDict];
  id v4 = [v2 dataWithJSONObject:v3 options:1 error:0];

  return v4;
}

- (double)creationTimestamp
{
  return self->_creationTimestamp;
}

- (NSArray)rankedGroups
{
  return self->_rankedGroups;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSString)rankerId
{
  return self->_rankerId;
}

- (void)setRankerId:(id)a3
{
}

- (NSString)modeIdString
{
  return self->_modeIdString;
}

- (void)setModeIdString:(id)a3
{
}

- (ATXSharedDigestEngagementTrackingMetrics)digestEngagementTrackingMetrics
{
  return self->_digestEngagementTrackingMetrics;
}

- (void)setDigestEngagementTrackingMetrics:(id)a3
{
}

- (ATXDigestTimeline)digestTimeline
{
  return self->_digestTimeline;
}

- (void)setDigestTimeline:(id)a3
{
}

- (ATXMissedNotificationRankingBiomeStream)loggingStream
{
  return self->_loggingStream;
}

- (void)setLoggingStream:(id)a3
{
}

- (BOOL)hasLoggedCollapsed
{
  return self->_hasLoggedCollapsed;
}

- (void)setHasLoggedCollapsed:(BOOL)a3
{
  self->_hasLoggedCollapsed = a3;
}

- (BOOL)hasLoggedExpanded
{
  return self->_hasLoggedExpanded;
}

- (void)setHasLoggedExpanded:(BOOL)a3
{
  self->_hasLoggedExpanded = a3;
}

- (BOOL)hasLoggedUpcomingExpanded
{
  return self->_hasLoggedUpcomingExpanded;
}

- (void)setHasLoggedUpcomingExpanded:(BOOL)a3
{
  self->_hasLoggedUpcomingExpanded = a3;
}

- (BOOL)hasLoggedDeliveredExpanded
{
  return self->_hasLoggedDeliveredExpanded;
}

- (void)setHasLoggedDeliveredExpanded:(BOOL)a3
{
  self->_hasLoggedDeliveredExpanded = a3;
}

- (BOOL)hasLoggedUpcomingCollapsed
{
  return self->_hasLoggedUpcomingCollapsed;
}

- (void)setHasLoggedUpcomingCollapsed:(BOOL)a3
{
  self->_hasLoggedUpcomingCollapsed = a3;
}

- (BOOL)hasLoggedDeliveredCollapsed
{
  return self->_hasLoggedDeliveredCollapsed;
}

- (void)setHasLoggedDeliveredCollapsed:(BOOL)a3
{
  self->_hasLoggedDeliveredCollapsed = a3;
}

- (BOOL)hasLoggedRemoval
{
  return self->_hasLoggedRemoval;
}

- (void)setHasLoggedRemoval:(BOOL)a3
{
  self->_hasLoggedRemoval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingStream, 0);
  objc_storeStrong((id *)&self->_digestTimeline, 0);
  objc_storeStrong((id *)&self->_digestEngagementTrackingMetrics, 0);
  objc_storeStrong((id *)&self->_modeIdString, 0);
  objc_storeStrong((id *)&self->_rankerId, 0);
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_storeStrong((id *)&self->_rankedGroups, 0);
}

- (void)initWithProto:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_1(&dword_1A790D000, v2, v3, "Unable to construct class %@ from ProtoBuf object", v4, v5, v6, v7, 2u);
}

@end