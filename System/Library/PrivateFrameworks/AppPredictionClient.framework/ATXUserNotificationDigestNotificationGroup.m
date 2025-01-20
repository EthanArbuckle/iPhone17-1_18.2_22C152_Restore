@interface ATXUserNotificationDigestNotificationGroup
+ (BOOL)supportsSecureCoding;
+ (id)groupsFromNotifications:(id)a3 modeId:(id)a4;
+ (id)groupsFromProtos:(id)a3;
+ (id)protosFromGroups:(id)a3;
- (ATXSharedDigestEngagementTrackingMetrics)digestEngagementTrackingMetrics;
- (ATXUserNotificationDigestNotificationGroup)initWithCoder:(id)a3;
- (ATXUserNotificationDigestNotificationGroup)initWithNotifications:(id)a3;
- (ATXUserNotificationDigestNotificationGroup)initWithNotifications:(id)a3 modeId:(id)a4;
- (ATXUserNotificationDigestNotificationGroup)initWithNotifications:(id)a3 useDigestOrder:(BOOL)a4;
- (ATXUserNotificationDigestNotificationGroup)initWithProto:(id)a3;
- (ATXUserNotificationDigestNotificationGroup)initWithProtoData:(id)a3;
- (BOOL)hasPreviewableAttachment;
- (BOOL)isCommunicationGroup;
- (NSArray)rankedNotifications;
- (NSString)bundleId;
- (NSString)groupDescription;
- (NSString)groupId;
- (NSString)title;
- (NSUUID)representativeNotificationUUID;
- (double)appSpecifiedScore;
- (double)priority;
- (id)encodeAsProto;
- (id)initFromJSON:(id)a3;
- (id)jsonRepresentation;
- (id)proto;
- (void)encodeWithCoder:(id)a3;
- (void)setDigestEngagementTrackingMetrics:(id)a3;
- (void)setGroupDescription:(id)a3;
- (void)setPriority:(double)a3;
- (void)setRepresentativeNotificationUUID:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation ATXUserNotificationDigestNotificationGroup

+ (id)groupsFromNotifications:(id)a3 modeId:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v14 = [v13 groupId];
        v15 = [v7 objectForKeyedSubscript:v14];

        if (!v15)
        {
          v16 = objc_opt_new();
          [v7 setObject:v16 forKeyedSubscript:v14];
        }
        v17 = [v7 objectForKeyedSubscript:v14];
        [v17 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v10);
  }

  v18 = [v7 allValues];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __77__ATXUserNotificationDigestNotificationGroup_groupsFromNotifications_modeId___block_invoke;
  v22[3] = &unk_1E5D05E18;
  id v23 = v6;
  id v19 = v6;
  v20 = objc_msgSend(v18, "_pas_mappedArrayWithTransform:", v22);

  return v20;
}

ATXUserNotificationDigestNotificationGroup *__77__ATXUserNotificationDigestNotificationGroup_groupsFromNotifications_modeId___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [[ATXUserNotificationDigestNotificationGroup alloc] initWithNotifications:v3 modeId:*(void *)(a1 + 32)];

  return v4;
}

- (ATXUserNotificationDigestNotificationGroup)initWithNotifications:(id)a3
{
  return [(ATXUserNotificationDigestNotificationGroup *)self initWithNotifications:a3 useDigestOrder:0];
}

- (ATXUserNotificationDigestNotificationGroup)initWithNotifications:(id)a3 useDigestOrder:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v58.receiver = self;
  v58.super_class = (Class)ATXUserNotificationDigestNotificationGroup;
  v7 = [(ATXUserNotificationDigestNotificationGroup *)&v58 init];
  if (v7) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8 && [v6 count])
  {
    if (v4
      && ([v6 firstObject],
          uint64_t v9 = objc_claimAutoreleasedReturnValue(),
          char v10 = [v9 isMessage],
          v9,
          (v10 & 1) == 0))
    {
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v13 = v6;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v54 objects:v64 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        v16 = 0;
        uint64_t v17 = *(void *)v55;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v55 != v17) {
              objc_enumerationMutation(v13);
            }
            id v19 = *(void **)(*((void *)&v54 + 1) + 8 * i);
            if ([v19 hasPreviewableAttachment])
            {
              if (!v16
                || ([v16 appSpecifiedScore], double v21 = v20, objc_msgSend(v19, "appSpecifiedScore"), v21 < v22))
              {
                id v23 = v19;

                v16 = v23;
              }
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v54 objects:v64 count:16];
        }
        while (v15);
      }
      else
      {
        v16 = 0;
      }

      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __83__ATXUserNotificationDigestNotificationGroup_initWithNotifications_useDigestOrder___block_invoke;
      v52[3] = &unk_1E5D0A718;
      v12 = v16;
      v53 = v12;
      long long v24 = objc_msgSend(v13, "_pas_filteredArrayWithTest:", v52);
      long long v25 = [v24 sortedArrayUsingComparator:&__block_literal_global_94];
      if (v12)
      {
        v63 = v12;
        long long v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v63 count:1];
      }
      else
      {
        long long v26 = (void *)MEMORY[0x1E4F1CBF0];
      }
      uint64_t v27 = [v26 arrayByAddingObjectsFromArray:v25];
      rankedNotifications = v7->_rankedNotifications;
      v7->_rankedNotifications = (NSArray *)v27;
    }
    else
    {
      uint64_t v11 = [v6 sortedArrayUsingComparator:&__block_literal_global_14_0];
      v12 = v7->_rankedNotifications;
      v7->_rankedNotifications = (NSArray *)v11;
    }

    uint64_t v29 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v47 = MEMORY[0x1E4F143A8];
    uint64_t v48 = 3221225472;
    v49 = __83__ATXUserNotificationDigestNotificationGroup_initWithNotifications_useDigestOrder___block_invoke_4;
    v50 = &unk_1E5D0A760;
    v30 = v7;
    v51 = v30;
    v31 = objc_msgSend(v6, "_pas_mappedArrayWithTransform:", &v47);
    v32 = objc_msgSend(v29, "setWithArray:", v31, v47, v48, v49, v50);

    if ([v32 count] != 1)
    {
      v33 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        v34 = (objc_class *)objc_opt_class();
        v35 = NSStringFromClass(v34);
        uint64_t v36 = [v32 count];
        *(_DWORD *)buf = 138412546;
        v60 = v35;
        __int16 v61 = 2048;
        uint64_t v62 = v36;
        _os_log_impl(&dword_1A790D000, v33, OS_LOG_TYPE_INFO, "[%@] Expected 1 bundleId in notification stack, but found %lu. Proceeding with first bundleId.", buf, 0x16u);
      }
    }
    v37 = [(NSArray *)v30->_rankedNotifications objectAtIndexedSubscript:0];
    uint64_t v38 = [v37 groupId];
    groupId = v30->_groupId;
    v30->_groupId = (NSString *)v38;

    uint64_t v40 = [v37 title];
    title = v30->_title;
    v30->_title = (NSString *)v40;

    uint64_t v42 = [v37 subtitle];
    groupDescription = v30->_groupDescription;
    v30->_groupDescription = (NSString *)v42;

    uint64_t v44 = [v37 uuid];
    representativeNotificationUUID = v30->_representativeNotificationUUID;
    v30->_representativeNotificationUUID = (NSUUID *)v44;
  }
  return v7;
}

BOOL __83__ATXUserNotificationDigestNotificationGroup_initWithNotifications_useDigestOrder___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) != a2;
}

uint64_t __83__ATXUserNotificationDigestNotificationGroup_initWithNotifications_useDigestOrder___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compareForDigestRanking:a2];
}

uint64_t __83__ATXUserNotificationDigestNotificationGroup_initWithNotifications_useDigestOrder___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  BOOL v4 = NSNumber;
  id v5 = a2;
  [a3 timestamp];
  id v6 = objc_msgSend(v4, "numberWithDouble:");
  v7 = NSNumber;
  [v5 timestamp];
  double v9 = v8;

  char v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

id __83__ATXUserNotificationDigestNotificationGroup_initWithNotifications_useDigestOrder___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = [v2 bundleID];

  if (!v3)
  {
    BOOL v4 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = (objc_class *)objc_opt_class();
      id v6 = NSStringFromClass(v5);
      int v9 = 138412290;
      char v10 = v6;
      _os_log_impl(&dword_1A790D000, v4, OS_LOG_TYPE_INFO, "[%@] Found nil bundleId in notification stack", (uint8_t *)&v9, 0xCu);
    }
  }
  v7 = [v2 bundleID];

  return v7;
}

- (ATXUserNotificationDigestNotificationGroup)initWithNotifications:(id)a3 modeId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)ATXUserNotificationDigestNotificationGroup;
  double v8 = [(ATXUserNotificationDigestNotificationGroup *)&v23 init];
  if (v8) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9 && [v6 count])
  {
    uint64_t v10 = [v6 sortedArrayUsingComparator:&__block_literal_global_19_1];
    rankedNotifications = v8->_rankedNotifications;
    v8->_rankedNotifications = (NSArray *)v10;

    v12 = [(NSArray *)v8->_rankedNotifications objectAtIndexedSubscript:0];
    uint64_t v13 = [v12 groupId];
    groupId = v8->_groupId;
    v8->_groupId = (NSString *)v13;

    uint64_t v15 = [v12 title];
    title = v8->_title;
    v8->_title = (NSString *)v15;

    uint64_t v17 = [v12 subtitle];
    groupDescription = v8->_groupDescription;
    v8->_groupDescription = (NSString *)v17;

    [v12 finalDigestScoreForMode:v7];
    v8->_priority = v19;
    uint64_t v20 = [v12 uuid];
    representativeNotificationUUID = v8->_representativeNotificationUUID;
    v8->_representativeNotificationUUID = (NSUUID *)v20;
  }
  return v8;
}

uint64_t __75__ATXUserNotificationDigestNotificationGroup_initWithNotifications_modeId___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compareForDigestRanking:a2];
}

- (NSString)bundleId
{
  id v2 = [(NSArray *)self->_rankedNotifications firstObject];
  id v3 = [v2 bundleID];

  return (NSString *)v3;
}

- (double)appSpecifiedScore
{
  id v3 = [(ATXUserNotificationDigestNotificationGroup *)self rankedNotifications];
  BOOL v4 = [v3 firstObject];
  if (v4)
  {
    id v5 = [(ATXUserNotificationDigestNotificationGroup *)self rankedNotifications];
    id v6 = [v5 firstObject];
    [v6 appSpecifiedScore];
    double v8 = v7;
  }
  else
  {
    double v8 = 0.0;
  }

  return v8;
}

- (BOOL)isCommunicationGroup
{
  id v3 = [(ATXUserNotificationDigestNotificationGroup *)self rankedNotifications];
  uint64_t v4 = [v3 count];

  if (!v4) {
    return 0;
  }
  id v5 = [(ATXUserNotificationDigestNotificationGroup *)self rankedNotifications];
  id v6 = [v5 objectAtIndexedSubscript:0];
  char v7 = [v6 isMessage];

  return v7;
}

- (BOOL)hasPreviewableAttachment
{
  id v2 = [(ATXUserNotificationDigestNotificationGroup *)self rankedNotifications];
  id v3 = [v2 firstObject];
  char v4 = [v3 hasPreviewableAttachment];

  return v4;
}

- (id)initFromJSON:(id)a3
{
  id v4 = a3;
  id v5 = [[ATXPBUserNotificationDigestNotificationGroup alloc] initFromJSON:v4];

  id v6 = [(ATXUserNotificationDigestNotificationGroup *)self initWithProto:v5];
  return v6;
}

- (id)jsonRepresentation
{
  id v2 = [(ATXUserNotificationDigestNotificationGroup *)self proto];
  id v3 = [v2 jsonRepresentation];

  return v3;
}

- (ATXUserNotificationDigestNotificationGroup)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[ATXPBUserNotificationDigestNotificationGroup alloc] initWithData:v4];

    self = [(ATXUserNotificationDigestNotificationGroup *)self initWithProto:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)encodeAsProto
{
  id v2 = [(ATXUserNotificationDigestNotificationGroup *)self proto];
  id v3 = [v2 data];

  return v3;
}

+ (id)groupsFromProtos:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__ATXUserNotificationDigestNotificationGroup_groupsFromProtos___block_invoke;
  v5[3] = &__block_descriptor_40_e63___ATXUserNotificationDigestNotificationGroup_16__0__PBCodable_8l;
  v5[4] = a1;
  id v3 = objc_msgSend(a3, "_pas_mappedArrayWithTransform:", v5);

  return v3;
}

id __63__ATXUserNotificationDigestNotificationGroup_groupsFromProtos___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(objc_class **)(a1 + 32);
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithProto:v3];

  return v4;
}

+ (id)protosFromGroups:(id)a3
{
  id v3 = objc_msgSend(a3, "_pas_mappedArrayWithTransform:", &__block_literal_global_24);
  id v4 = (void *)[v3 mutableCopy];

  return v4;
}

uint64_t __63__ATXUserNotificationDigestNotificationGroup_protosFromGroups___block_invoke(uint64_t a1, void *a2)
{
  return [a2 proto];
}

- (ATXUserNotificationDigestNotificationGroup)initWithProto:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)ATXUserNotificationDigestNotificationGroup;
  id v5 = [(ATXUserNotificationDigestNotificationGroup *)&v30 init];
  if (!v5)
  {
LABEL_15:
    v28 = v5;
    goto LABEL_16;
  }
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v4;
      char v7 = [v6 rankedNotifications];
      uint64_t v8 = objc_msgSend(v7, "_pas_mappedArrayWithTransform:", &__block_literal_global_27_1);
      rankedNotifications = v5->_rankedNotifications;
      v5->_rankedNotifications = (NSArray *)v8;

      uint64_t v10 = [v6 groupId];
      groupId = v5->_groupId;
      v5->_groupId = (NSString *)v10;

      uint64_t v12 = [v6 title];
      title = v5->_title;
      v5->_title = (NSString *)v12;

      uint64_t v14 = [v6 groupDescription];
      groupDescription = v5->_groupDescription;
      v5->_groupDescription = (NSString *)v14;

      [v6 priority];
      v5->_priority = v16;
      id v17 = objc_alloc(MEMORY[0x1E4F29128]);
      v18 = [v6 representativeNotificationUUID];
      uint64_t v19 = [v17 initWithUUIDString:v18];
      representativeNotificationUUID = v5->_representativeNotificationUUID;
      v5->_representativeNotificationUUID = (NSUUID *)v19;

      double v21 = [v6 sharedEngagementTracker];

      if (v21)
      {
        double v22 = [v6 sharedEngagementTracker];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          long long v24 = [ATXSharedDigestEngagementTrackingMetrics alloc];
          long long v25 = [v6 sharedEngagementTracker];
          long long v26 = [(ATXSharedDigestEngagementTrackingMetrics *)v24 initWithProto:v25];
          [(ATXUserNotificationDigestNotificationGroup *)v5 setDigestEngagementTrackingMetrics:v26];
        }
        else
        {
          long long v25 = __atxlog_handle_notification_management();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
            -[ATXMissedNotificationRanking initWithProto:]();
          }
        }
      }
      goto LABEL_15;
    }
    uint64_t v27 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
      -[ATXMissedNotificationRanking initWithProto:]();
    }
  }
  v28 = 0;
LABEL_16:

  return v28;
}

ATXUserNotification *__60__ATXUserNotificationDigestNotificationGroup_initWithProto___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[ATXUserNotification alloc] initWithProto:v2];

  return v3;
}

- (id)proto
{
  id v3 = objc_opt_new();
  [v3 setGroupId:self->_groupId];
  [v3 setTitle:self->_title];
  [v3 setGroupDescription:self->_groupDescription];
  [v3 setPriority:self->_priority];
  id v4 = [(NSUUID *)self->_representativeNotificationUUID UUIDString];
  [v3 setRepresentativeNotificationUUID:v4];

  id v5 = [(ATXUserNotificationDigestNotificationGroup *)self digestEngagementTrackingMetrics];
  id v6 = [v5 proto];
  [v3 setSharedEngagementTracker:v6];

  char v7 = [(NSArray *)self->_rankedNotifications _pas_mappedArrayWithTransform:&__block_literal_global_34_1];
  uint64_t v8 = objc_opt_new();
  [v3 setRankedNotifications:v8];

  if (v7 && [v7 count])
  {
    BOOL v9 = [v3 rankedNotifications];
    [v9 addObjectsFromArray:v7];
  }

  return v3;
}

uint64_t __51__ATXUserNotificationDigestNotificationGroup_proto__block_invoke(uint64_t a1, void *a2)
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
  id v5 = [(ATXUserNotificationDigestNotificationGroup *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (ATXUserNotificationDigestNotificationGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufData"];

  if (v5)
  {
    self = [(ATXUserNotificationDigestNotificationGroup *)self initWithProtoData:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (NSString)groupId
{
  return self->_groupId;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)groupDescription
{
  return self->_groupDescription;
}

- (void)setGroupDescription:(id)a3
{
}

- (double)priority
{
  return self->_priority;
}

- (void)setPriority:(double)a3
{
  self->_priority = a3;
}

- (NSUUID)representativeNotificationUUID
{
  return self->_representativeNotificationUUID;
}

- (void)setRepresentativeNotificationUUID:(id)a3
{
}

- (ATXSharedDigestEngagementTrackingMetrics)digestEngagementTrackingMetrics
{
  return self->_digestEngagementTrackingMetrics;
}

- (void)setDigestEngagementTrackingMetrics:(id)a3
{
}

- (NSArray)rankedNotifications
{
  return self->_rankedNotifications;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rankedNotifications, 0);
  objc_storeStrong((id *)&self->_digestEngagementTrackingMetrics, 0);
  objc_storeStrong((id *)&self->_representativeNotificationUUID, 0);
  objc_storeStrong((id *)&self->_groupDescription, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_groupId, 0);
}

@end