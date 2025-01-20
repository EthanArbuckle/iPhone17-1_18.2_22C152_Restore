@interface ATXUserNotificationDigest
+ (BOOL)supportsSecureCoding;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)getFlattenedGroupsFromAppDigests:(id)a3;
- (ATXDigestTimeline)digestTimeline;
- (ATXSharedDigestEngagementTrackingMetrics)digestEngagementTrackingMetrics;
- (ATXUserNotificationDigest)initWithAppDigests:(id)a3 highlightedGroups:(id)a4 messageGroups:(id)a5 rankerId:(id)a6;
- (ATXUserNotificationDigest)initWithCoder:(id)a3;
- (ATXUserNotificationDigest)initWithGroups:(id)a3 modeId:(id)a4 ranker:(id)a5;
- (ATXUserNotificationDigest)initWithMessageGroups:(id)a3 highlightedGroups:(id)a4 otherGroups:(id)a5 rankerId:(id)a6;
- (ATXUserNotificationDigest)initWithNotificationArrays:(id)a3 modeId:(id)a4 ranker:(id)a5;
- (ATXUserNotificationDigest)initWithNotifications:(id)a3 modeId:(id)a4;
- (ATXUserNotificationDigest)initWithNotifications:(id)a3 modeId:(id)a4 ranker:(id)a5;
- (ATXUserNotificationDigest)initWithProto:(id)a3;
- (ATXUserNotificationDigest)initWithProtoData:(id)a3;
- (ATXUserNotificationDigestBiomeStream)loggingStream;
- (BOOL)doesDigestShareContentWithOtherDigest:(id)a3;
- (BOOL)hasLoggedCollapsed;
- (BOOL)hasLoggedScheduled;
- (BOOL)hasLoggedUpcoming;
- (NSArray)appDigests;
- (NSArray)globalMarqueeGroups;
- (NSArray)highlightedGroups;
- (NSArray)messageGroups;
- (NSArray)rankedGroups;
- (NSString)modeIdString;
- (NSString)rankerId;
- (NSUUID)uuid;
- (double)creationTimestamp;
- (id)allNotificationIds;
- (id)copyWithZone:(_NSZone *)a3;
- (id)encodeAsProto;
- (id)initFromJSON:(id)a3;
- (id)json;
- (id)jsonRepresentation;
- (id)proto;
- (id)viewFlattenedGroups;
- (unsigned)dataVersion;
- (void)allNotificationIds;
- (void)encodeWithCoder:(id)a3;
- (void)logCollapsedPreview;
- (void)logCollapsedPreviewWithTimestamp:(double)a3;
- (void)logScheduledView;
- (void)logScheduledViewWithTimestamp:(double)a3;
- (void)logUpcomingView;
- (void)logUpcomingViewWithTimestamp:(double)a3;
- (void)setDigestEngagementTrackingMetrics:(id)a3;
- (void)setDigestTimeline:(id)a3;
- (void)setLoggingStream:(id)a3;
- (void)setRankerId:(id)a3;
@end

@implementation ATXUserNotificationDigest

- (ATXUserNotificationDigest)initWithMessageGroups:(id)a3 highlightedGroups:(id)a4 otherGroups:(id)a5 rankerId:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v28.receiver = self;
  v28.super_class = (Class)ATXUserNotificationDigest;
  v14 = [(ATXUserNotificationDigest *)&v28 init];
  v15 = v14;
  if (v14)
  {
    appDigests = v14->_appDigests;
    v14->_appDigests = (NSArray *)MEMORY[0x1E4F1CBF0];

    uint64_t v17 = [v10 copy];
    messageGroups = v15->_messageGroups;
    v15->_messageGroups = (NSArray *)v17;

    uint64_t v19 = [v11 copy];
    highlightedGroups = v15->_highlightedGroups;
    v15->_highlightedGroups = (NSArray *)v19;

    uint64_t v21 = [v12 copy];
    rankedGroups = v15->_rankedGroups;
    v15->_rankedGroups = (NSArray *)v21;

    uint64_t v23 = [v13 copy];
    rankerId = v15->_rankerId;
    v15->_rankerId = (NSString *)v23;

    v15->_creationTimestamp = CFAbsoluteTimeGetCurrent();
    uint64_t v25 = [MEMORY[0x1E4F29128] UUID];
    uuid = v15->_uuid;
    v15->_uuid = (NSUUID *)v25;
  }
  return v15;
}

- (ATXUserNotificationDigest)initWithNotifications:(id)a3 modeId:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_opt_new();
  v9 = [(ATXUserNotificationDigest *)self initWithNotifications:v7 modeId:v6 ranker:v8];

  return v9;
}

- (ATXUserNotificationDigest)initWithNotifications:(id)a3 modeId:(id)a4 ranker:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = +[ATXUserNotificationDigestNotificationGroup groupsFromNotifications:a3 modeId:v9];
  id v11 = [(ATXUserNotificationDigest *)self initWithGroups:v10 modeId:v9 ranker:v8];

  return v11;
}

- (ATXUserNotificationDigest)initWithNotificationArrays:(id)a3 modeId:(id)a4 ranker:(id)a5
{
  id v8 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __70__ATXUserNotificationDigest_initWithNotificationArrays_modeId_ranker___block_invoke;
  v14[3] = &unk_1E5D05E18;
  id v15 = v8;
  id v9 = v8;
  id v10 = a5;
  id v11 = objc_msgSend(a3, "_pas_mappedArrayWithTransform:", v14);
  id v12 = [(ATXUserNotificationDigest *)self initWithGroups:v11 modeId:v9 ranker:v10];

  return v12;
}

ATXUserNotificationDigestNotificationGroup *__70__ATXUserNotificationDigest_initWithNotificationArrays_modeId_ranker___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [[ATXUserNotificationDigestNotificationGroup alloc] initWithNotifications:v3 modeId:*(void *)(a1 + 32)];

  return v4;
}

- (ATXUserNotificationDigest)initWithGroups:(id)a3 modeId:(id)a4 ranker:(id)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v47.receiver = self;
  v47.super_class = (Class)ATXUserNotificationDigest;
  id v11 = [(ATXUserNotificationDigest *)&v47 init];
  if (v11)
  {
    id obj = a4;
    v39 = objc_msgSend(v8, "_pas_filteredArrayWithTest:", &__block_literal_global_27);
    uint64_t v12 = objc_msgSend(v10, "rankNotificationGroups:modeId:");
    messageGroups = v11->_messageGroups;
    v11->_messageGroups = (NSArray *)v12;

    id v42 = v8;
    v14 = objc_msgSend(v8, "_pas_filteredArrayWithTest:", &__block_literal_global_33);
    id v41 = v9;
    id v15 = [v10 rankNotificationGroups:v14 modeId:v9];

    v16 = objc_msgSend(v15, "_pas_filteredArrayWithTest:", &__block_literal_global_35_0);
    unint64_t v17 = [v16 count];
    if (v17 >= 2) {
      uint64_t v18 = 2;
    }
    else {
      uint64_t v18 = v17;
    }
    uint64_t v19 = objc_msgSend(v16, "subarrayWithRange:", 0, v18);
    v20 = (NSArray *)[v19 mutableCopy];

    uint64_t v21 = (NSArray *)objc_opt_new();
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v22 = v15;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v44 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = *(void *)(*((void *)&v43 + 1) + 8 * i);
          if (![(NSArray *)v20 containsObject:v27])
          {
            if ([(NSArray *)v20 count] >= 2) {
              objc_super v28 = v21;
            }
            else {
              objc_super v28 = v20;
            }
            [(NSArray *)v28 addObject:v27];
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v43 objects:v48 count:16];
      }
      while (v24);
    }

    highlightedGroups = v11->_highlightedGroups;
    v11->_highlightedGroups = v20;
    v30 = v20;

    rankedGroups = v11->_rankedGroups;
    v11->_rankedGroups = v21;
    v32 = v21;

    appDigests = v11->_appDigests;
    v11->_appDigests = (NSArray *)MEMORY[0x1E4F1CBF0];

    v11->_creationTimestamp = CFAbsoluteTimeGetCurrent();
    uint64_t v34 = [MEMORY[0x1E4F29128] UUID];
    uuid = v11->_uuid;
    v11->_uuid = (NSUUID *)v34;

    uint64_t v36 = [(id)objc_opt_class() rankerId];
    rankerId = v11->_rankerId;
    v11->_rankerId = (NSString *)v36;

    objc_storeStrong((id *)&v11->_modeIdString, obj);
    id v9 = v41;
    id v8 = v42;
  }

  return v11;
}

uint64_t __58__ATXUserNotificationDigest_initWithGroups_modeId_ranker___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isCommunicationGroup];
}

uint64_t __58__ATXUserNotificationDigest_initWithGroups_modeId_ranker___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isCommunicationGroup] ^ 1;
}

uint64_t __58__ATXUserNotificationDigest_initWithGroups_modeId_ranker___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 hasPreviewableAttachment];
}

- (ATXUserNotificationDigest)initWithAppDigests:(id)a3 highlightedGroups:(id)a4 messageGroups:(id)a5 rankerId:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(id)objc_opt_class() getFlattenedGroupsFromAppDigests:v10];
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  uint64_t v24 = __89__ATXUserNotificationDigest_initWithAppDigests_highlightedGroups_messageGroups_rankerId___block_invoke;
  uint64_t v25 = &unk_1E5D06D60;
  id v15 = v11;
  id v26 = v15;
  id v16 = v12;
  id v27 = v16;
  unint64_t v17 = objc_msgSend(v14, "_pas_filteredArrayWithTest:", &v22);
  uint64_t v18 = -[ATXUserNotificationDigest initWithMessageGroups:highlightedGroups:otherGroups:rankerId:](self, "initWithMessageGroups:highlightedGroups:otherGroups:rankerId:", v16, v15, v17, v13, v22, v23, v24, v25);

  if (v18)
  {
    uint64_t v19 = [v10 copy];
    appDigests = v18->_appDigests;
    v18->_appDigests = (NSArray *)v19;
  }
  return v18;
}

uint64_t __89__ATXUserNotificationDigest_initWithAppDigests_highlightedGroups_messageGroups_rankerId___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) containsObject:v3]) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = [*(id *)(a1 + 40) containsObject:v3] ^ 1;
  }

  return v4;
}

- (NSArray)globalMarqueeGroups
{
  return self->_highlightedGroups;
}

- (BOOL)doesDigestShareContentWithOtherDigest:(id)a3
{
  id v4 = a3;
  v5 = [(ATXUserNotificationDigest *)self allNotificationIds];
  id v6 = [v4 allNotificationIds];

  LOBYTE(v4) = [v5 intersectsSet:v6];
  return (char)v4;
}

- (id)allNotificationIds
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v4 = [(ATXUserNotificationDigest *)self messageGroups];
  v49[0] = v4;
  v5 = [(ATXUserNotificationDigest *)self highlightedGroups];
  v49[1] = v5;
  id v6 = [(ATXUserNotificationDigest *)self rankedGroups];
  v49[2] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:3];

  id obj = v7;
  uint64_t v25 = [v7 countByEnumeratingWithState:&v43 objects:v50 count:16];
  if (v25)
  {
    uint64_t v24 = *(void *)v44;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v44 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = v8;
        id v9 = *(void **)(*((void *)&v43 + 1) + 8 * v8);
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v27 = v9;
        uint64_t v29 = [v27 countByEnumeratingWithState:&v39 objects:v48 count:16];
        if (v29)
        {
          uint64_t v28 = *(void *)v40;
          do
          {
            uint64_t v10 = 0;
            do
            {
              if (*(void *)v40 != v28) {
                objc_enumerationMutation(v27);
              }
              uint64_t v30 = v10;
              id v11 = *(void **)(*((void *)&v39 + 1) + 8 * v10);
              long long v35 = 0u;
              long long v36 = 0u;
              long long v37 = 0u;
              long long v38 = 0u;
              id v12 = [v11 rankedNotifications];
              uint64_t v13 = [v12 countByEnumeratingWithState:&v35 objects:v47 count:16];
              if (v13)
              {
                uint64_t v14 = v13;
                uint64_t v15 = *(void *)v36;
                do
                {
                  for (uint64_t i = 0; i != v14; ++i)
                  {
                    if (*(void *)v36 != v15) {
                      objc_enumerationMutation(v12);
                    }
                    unint64_t v17 = *(void **)(*((void *)&v35 + 1) + 8 * i);
                    uint64_t v18 = [v17 uuid];

                    if (v18)
                    {
                      uint64_t v19 = [v17 uuid];
                      objc_opt_class();
                      char isKindOfClass = objc_opt_isKindOfClass();

                      if (isKindOfClass)
                      {
                        uint64_t v21 = [v17 uuid];
                        [v3 addObject:v21];
                      }
                      else
                      {
                        uint64_t v21 = __atxlog_handle_modes();
                        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
                          [(ATXUserNotificationDigest *)&v31 allNotificationIds];
                        }
                      }
                    }
                    else
                    {
                      uint64_t v21 = __atxlog_handle_modes();
                      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
                        [(ATXUserNotificationDigest *)&buf allNotificationIds];
                      }
                    }
                  }
                  uint64_t v14 = [v12 countByEnumeratingWithState:&v35 objects:v47 count:16];
                }
                while (v14);
              }

              uint64_t v10 = v30 + 1;
            }
            while (v30 + 1 != v29);
            uint64_t v29 = [v27 countByEnumeratingWithState:&v39 objects:v48 count:16];
          }
          while (v29);
        }

        uint64_t v8 = v26 + 1;
      }
      while (v26 + 1 != v25);
      uint64_t v25 = [obj countByEnumeratingWithState:&v43 objects:v50 count:16];
    }
    while (v25);
  }

  return v3;
}

+ (id)getFlattenedGroupsFromAppDigests:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "groups", (void)v12);
        [v4 addObjectsFromArray:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)viewFlattenedGroups
{
  if ([(NSArray *)self->_appDigests count])
  {
    id v3 = [(id)objc_opt_class() getFlattenedGroupsFromAppDigests:self->_appDigests];
  }
  else
  {
    id v4 = [(NSArray *)self->_messageGroups arrayByAddingObjectsFromArray:self->_highlightedGroups];
    id v3 = [v4 arrayByAddingObjectsFromArray:self->_rankedGroups];
  }

  return v3;
}

- (void)logScheduledView
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];

  -[ATXUserNotificationDigest logScheduledViewWithTimestamp:](self, "logScheduledViewWithTimestamp:");
}

- (void)logCollapsedPreview
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];

  -[ATXUserNotificationDigest logCollapsedPreviewWithTimestamp:](self, "logCollapsedPreviewWithTimestamp:");
}

- (void)logUpcomingView
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];

  -[ATXUserNotificationDigest logScheduledViewWithTimestamp:](self, "logScheduledViewWithTimestamp:");
}

- (void)logScheduledViewWithTimestamp:(double)a3
{
  if (!self->_hasLoggedScheduled)
  {
    self->_hasLoggedScheduled = 1;
    id v4 = [[ATXUserNotificationDigestLoggingEvent alloc] initWithNotificationDigest:self eventType:0 timestamp:a3];
    loggingStream = self->_loggingStream;
    if (loggingStream)
    {
      uint64_t v6 = v4;
      loggingStream = (ATXUserNotificationDigestBiomeStream *)[(ATXUserNotificationDigestBiomeStream *)loggingStream sendEvent:v4];
      id v4 = v6;
    }
    MEMORY[0x1F41817F8](loggingStream, v4);
  }
}

- (void)logCollapsedPreviewWithTimestamp:(double)a3
{
  if (!self->_hasLoggedCollapsed)
  {
    self->_hasLoggedCollapsed = 1;
    id v4 = [[ATXUserNotificationDigestLoggingEvent alloc] initWithNotificationDigest:self eventType:1 timestamp:a3];
    loggingStream = self->_loggingStream;
    if (loggingStream)
    {
      uint64_t v6 = v4;
      loggingStream = (ATXUserNotificationDigestBiomeStream *)[(ATXUserNotificationDigestBiomeStream *)loggingStream sendEvent:v4];
      id v4 = v6;
    }
    MEMORY[0x1F41817F8](loggingStream, v4);
  }
}

- (void)logUpcomingViewWithTimestamp:(double)a3
{
  if (!self->_hasLoggedUpcoming)
  {
    self->_hasLoggedUpcoming = 1;
    id v4 = [[ATXUserNotificationDigestLoggingEvent alloc] initWithNotificationDigest:self eventType:2 timestamp:a3];
    loggingStream = self->_loggingStream;
    if (loggingStream)
    {
      uint64_t v6 = v4;
      loggingStream = (ATXUserNotificationDigestBiomeStream *)[(ATXUserNotificationDigestBiomeStream *)loggingStream sendEvent:v4];
      id v4 = v6;
    }
    MEMORY[0x1F41817F8](loggingStream, v4);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[ATXUserNotificationDigest allocWithZone:a3];
  id v5 = [(ATXUserNotificationDigest *)self proto];
  uint64_t v6 = [(ATXUserNotificationDigest *)v4 initWithProto:v5];

  return v6;
}

- (id)initFromJSON:(id)a3
{
  id v4 = a3;
  id v5 = [[ATXPBUserNotificationDigest alloc] initFromJSON:v4];

  uint64_t v6 = [(ATXUserNotificationDigest *)self initWithProto:v5];
  return v6;
}

- (id)jsonRepresentation
{
  v2 = [(ATXUserNotificationDigest *)self proto];
  id v3 = [v2 jsonRepresentation];

  return v3;
}

- (ATXUserNotificationDigest)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[ATXPBUserNotificationDigest alloc] initWithData:v4];

    self = [(ATXUserNotificationDigest *)self initWithProto:v5];
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
  v2 = [(ATXUserNotificationDigest *)self proto];
  id v3 = [v2 data];

  return v3;
}

- (ATXUserNotificationDigest)initWithProto:(id)a3
{
  id v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)ATXUserNotificationDigest;
  id v5 = [(ATXUserNotificationDigest *)&v47 init];
  if (!v5)
  {
LABEL_33:
    long long v12 = v5;
    goto LABEL_34;
  }
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v4;
      uint64_t v7 = [v6 messageGroups];
      if (v7)
      {
        uint64_t v8 = [v6 messageGroups];
        uint64_t v9 = objc_msgSend(v8, "_pas_mappedArrayWithTransform:", &__block_literal_global_45);
        messageGroups = v5->_messageGroups;
        v5->_messageGroups = (NSArray *)v9;
      }
      else
      {
        uint64_t v8 = v5->_messageGroups;
        v5->_messageGroups = (NSArray *)MEMORY[0x1E4F1CBF0];
      }

      long long v13 = [v6 highlightedGroups];
      if (v13)
      {
        long long v14 = [v6 highlightedGroups];
        uint64_t v15 = objc_msgSend(v14, "_pas_mappedArrayWithTransform:", &__block_literal_global_47);
        highlightedGroups = v5->_highlightedGroups;
        v5->_highlightedGroups = (NSArray *)v15;
      }
      else
      {
        long long v14 = v5->_highlightedGroups;
        v5->_highlightedGroups = (NSArray *)MEMORY[0x1E4F1CBF0];
      }

      uint64_t v17 = [v6 rankedGroups];
      if (v17)
      {
        uint64_t v18 = [v6 rankedGroups];
        uint64_t v19 = objc_msgSend(v18, "_pas_mappedArrayWithTransform:", &__block_literal_global_49);
        rankedGroups = v5->_rankedGroups;
        v5->_rankedGroups = (NSArray *)v19;
      }
      else
      {
        uint64_t v18 = v5->_rankedGroups;
        v5->_rankedGroups = (NSArray *)MEMORY[0x1E4F1CBF0];
      }

      uint64_t v21 = [v6 appDigests];
      if (v21)
      {
        uint64_t v22 = [v6 appDigests];
        uint64_t v23 = objc_msgSend(v22, "_pas_mappedArrayWithTransform:", &__block_literal_global_52);
        appDigests = v5->_appDigests;
        v5->_appDigests = (NSArray *)v23;
      }
      else
      {
        uint64_t v22 = v5->_appDigests;
        v5->_appDigests = (NSArray *)MEMORY[0x1E4F1CBF0];
      }

      [v6 timestamp];
      v5->_creationTimestamp = v25;
      id v26 = objc_alloc(MEMORY[0x1E4F29128]);
      id v27 = [v6 uuid];
      uint64_t v28 = [v26 initWithUUIDString:v27];
      uuid = v5->_uuid;
      v5->_uuid = (NSUUID *)v28;

      uint64_t v30 = [v6 rankerId];
      rankerId = v5->_rankerId;
      v5->_rankerId = (NSString *)v30;

      uint64_t v32 = [v6 modeId];
      modeIdString = v5->_modeIdString;
      v5->_modeIdString = (NSString *)v32;

      uint64_t v34 = [v6 sharedEngagementTracker];

      if (v34)
      {
        long long v35 = [v6 sharedEngagementTracker];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          long long v37 = [ATXSharedDigestEngagementTrackingMetrics alloc];
          long long v38 = [v6 sharedEngagementTracker];
          long long v39 = [(ATXSharedDigestEngagementTrackingMetrics *)v37 initWithProto:v38];
          [(ATXUserNotificationDigest *)v5 setDigestEngagementTrackingMetrics:v39];
        }
        else
        {
          long long v38 = __atxlog_handle_notification_management();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT)) {
            -[ATXMissedNotificationRanking initWithProto:]();
          }
        }
      }
      long long v40 = [v6 digestTimeline];

      if (v40)
      {
        long long v41 = [v6 digestTimeline];
        objc_opt_class();
        char v42 = objc_opt_isKindOfClass();

        if (v42)
        {
          long long v43 = [ATXDigestTimeline alloc];
          long long v44 = [v6 digestTimeline];
          long long v45 = [(ATXDigestTimeline *)v43 initWithProto:v44];
          [(ATXUserNotificationDigest *)v5 setDigestTimeline:v45];
        }
        else
        {
          long long v44 = __atxlog_handle_notification_management();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT)) {
            -[ATXMissedNotificationRanking initWithProto:]();
          }
        }
      }
      goto LABEL_33;
    }
    id v11 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[ATXMissedNotificationRanking initWithProto:]();
    }
  }
  long long v12 = 0;
LABEL_34:

  return v12;
}

ATXUserNotificationDigestNotificationGroup *__43__ATXUserNotificationDigest_initWithProto___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[ATXUserNotificationDigestNotificationGroup alloc] initWithProto:v2];

  return v3;
}

ATXUserNotificationDigestNotificationGroup *__43__ATXUserNotificationDigest_initWithProto___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[ATXUserNotificationDigestNotificationGroup alloc] initWithProto:v2];

  return v3;
}

ATXUserNotificationDigestNotificationGroup *__43__ATXUserNotificationDigest_initWithProto___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[ATXUserNotificationDigestNotificationGroup alloc] initWithProto:v2];

  return v3;
}

ATXUserNotificationAppDigest *__43__ATXUserNotificationDigest_initWithProto___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[ATXUserNotificationAppDigest alloc] initWithProto:v2];

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
  id v5 = [(ATXUserNotificationDigest *)self digestEngagementTrackingMetrics];
  id v6 = [v5 proto];
  [v3 setSharedEngagementTracker:v6];

  uint64_t v7 = [(ATXUserNotificationDigest *)self digestTimeline];
  uint64_t v8 = [v7 proto];
  [v3 setDigestTimeline:v8];

  uint64_t v9 = [(NSArray *)self->_messageGroups _pas_mappedArrayWithTransform:&__block_literal_global_60];
  uint64_t v10 = objc_opt_new();
  [v3 setMessageGroups:v10];

  if (v9 && [v9 count])
  {
    id v11 = [v3 messageGroups];
    [v11 addObjectsFromArray:v9];
  }
  long long v12 = [(NSArray *)self->_highlightedGroups _pas_mappedArrayWithTransform:&__block_literal_global_62];
  long long v13 = objc_opt_new();
  [v3 setHighlightedGroups:v13];

  if (v12 && [v12 count])
  {
    long long v14 = [v3 highlightedGroups];
    [v14 addObjectsFromArray:v12];
  }
  uint64_t v15 = [(NSArray *)self->_rankedGroups _pas_mappedArrayWithTransform:&__block_literal_global_64];
  id v16 = objc_opt_new();
  [v3 setRankedGroups:v16];

  if (v15 && [v15 count])
  {
    uint64_t v17 = [v3 rankedGroups];
    [v17 addObjectsFromArray:v15];
  }
  uint64_t v18 = [(NSArray *)self->_appDigests _pas_mappedArrayWithTransform:&__block_literal_global_67];
  uint64_t v19 = (void *)[v18 mutableCopy];
  [v3 setAppDigests:v19];

  return v3;
}

uint64_t __34__ATXUserNotificationDigest_proto__block_invoke(uint64_t a1, void *a2)
{
  return [a2 proto];
}

uint64_t __34__ATXUserNotificationDigest_proto__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 proto];
}

uint64_t __34__ATXUserNotificationDigest_proto__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 proto];
}

uint64_t __34__ATXUserNotificationDigest_proto__block_invoke_4(uint64_t a1, void *a2)
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
  id v5 = [(ATXUserNotificationDigest *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (ATXUserNotificationDigest)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufData"];

  if (v5)
  {
    self = [(ATXUserNotificationDigest *)self initWithProtoData:v5];
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
    uint64_t v8 = +[_ATXNotificationGroupBaseRanker rankerId];
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
  id v3 = [(ATXUserNotificationDigest *)self jsonDict];
  id v4 = [v2 dataWithJSONObject:v3 options:1 error:0];

  return v4;
}

- (double)creationTimestamp
{
  return self->_creationTimestamp;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSArray)messageGroups
{
  return self->_messageGroups;
}

- (NSArray)highlightedGroups
{
  return self->_highlightedGroups;
}

- (NSArray)rankedGroups
{
  return self->_rankedGroups;
}

- (NSArray)appDigests
{
  return self->_appDigests;
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

- (ATXUserNotificationDigestBiomeStream)loggingStream
{
  return self->_loggingStream;
}

- (void)setLoggingStream:(id)a3
{
}

- (BOOL)hasLoggedUpcoming
{
  return self->_hasLoggedUpcoming;
}

- (BOOL)hasLoggedCollapsed
{
  return self->_hasLoggedCollapsed;
}

- (BOOL)hasLoggedScheduled
{
  return self->_hasLoggedScheduled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingStream, 0);
  objc_storeStrong((id *)&self->_modeIdString, 0);
  objc_storeStrong((id *)&self->_rankerId, 0);
  objc_storeStrong((id *)&self->_digestTimeline, 0);
  objc_storeStrong((id *)&self->_digestEngagementTrackingMetrics, 0);
  objc_storeStrong((id *)&self->_appDigests, 0);
  objc_storeStrong((id *)&self->_rankedGroups, 0);
  objc_storeStrong((id *)&self->_highlightedGroups, 0);
  objc_storeStrong((id *)&self->_messageGroups, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)allNotificationIds
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_fault_impl(&dword_1A790D000, log, OS_LOG_TYPE_FAULT, "User notification does not have a UUID of correct type", buf, 2u);
}

@end