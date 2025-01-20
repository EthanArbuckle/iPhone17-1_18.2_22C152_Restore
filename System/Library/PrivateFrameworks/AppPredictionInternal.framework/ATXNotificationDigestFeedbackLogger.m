@interface ATXNotificationDigestFeedbackLogger
- (ATXNotificationDigestFeedbackLogger)init;
- (ATXNotificationDigestFeedbackLogger)initWithDigestFeedback:(id)a3;
- (id)_getBundleIdAndEngagementsForDigestGroup:(id)a3 onDigest:(id)a4;
- (void)logFeedbackForAnnotatedDigest:(id)a3;
@end

@implementation ATXNotificationDigestFeedbackLogger

- (ATXNotificationDigestFeedbackLogger)init
{
  v3 = objc_opt_new();
  v4 = [(ATXNotificationDigestFeedbackLogger *)self initWithDigestFeedback:v3];

  return v4;
}

- (ATXNotificationDigestFeedbackLogger)initWithDigestFeedback:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXNotificationDigestFeedbackLogger;
  v6 = [(ATXNotificationDigestFeedbackLogger *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_digestFeedback, a3);
  }

  return v7;
}

- (void)logFeedbackForAnnotatedDigest:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  v6 = [v4 highlightedGroups];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v54 objects:v65 count:16];
  v47 = v5;
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v55;
    *(void *)&long long v8 = 138412802;
    long long v43 = v8;
    uint64_t v45 = *(void *)v55;
    do
    {
      uint64_t v11 = 0;
      uint64_t v48 = v9;
      do
      {
        if (*(void *)v55 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = -[ATXNotificationDigestFeedbackLogger _getBundleIdAndEngagementsForDigestGroup:onDigest:](self, "_getBundleIdAndEngagementsForDigestGroup:onDigest:", *(void *)(*((void *)&v54 + 1) + 8 * v11), v4, v43);
        v13 = v12;
        if (v12)
        {
          v14 = [v12 first];
          if ([v5 containsObject:v14])
          {
            v15 = __atxlog_handle_notification_management();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              v16 = (objc_class *)objc_opt_class();
              NSStringFromClass(v16);
              v18 = v17 = v6;
              v19 = [v4 uuid];
              v20 = [v19 UUIDString];
              *(_DWORD *)buf = v43;
              v60 = v18;
              __int16 v61 = 2112;
              v62 = v14;
              __int16 v63 = 2112;
              v64 = v20;
              _os_log_impl(&dword_1D0FA3000, v15, OS_LOG_TYPE_INFO, "[%@] Found unexpected duplicate bundle ID %@ in marquee spots for digest %@", buf, 0x20u);

              uint64_t v9 = v48;
              id v5 = v47;

              v6 = v17;
              uint64_t v10 = v45;
            }
          }
          else
          {
            v15 = [v13 second];
            [(ATXNotificationDigestFeedbackProtocol *)self->_digestFeedback logMarqueeAppearanceForBundleId:v14];
            uint64_t v21 = [v15 numEngagementsInUpcoming];
            uint64_t v22 = [v15 numEngagementsInScheduled] + v21;
            if (v22 + [v15 numEngagementsAfterExpiration]) {
              [(ATXNotificationDigestFeedbackProtocol *)self->_digestFeedback logMarqueeEngagementForBundleId:v14];
            }
            [v5 addObject:v14];
            uint64_t v9 = v48;
          }
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v54 objects:v65 count:16];
    }
    while (v9);
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v23 = [v4 messageGroups];
  v24 = [v4 rankedGroups];
  v25 = [v23 arrayByAddingObjectsFromArray:v24];

  v26 = v25;
  uint64_t v27 = [v25 countByEnumeratingWithState:&v50 objects:v58 count:16];
  if (v27)
  {
    uint64_t v29 = v27;
    uint64_t v30 = *(void *)v51;
    *(void *)&long long v28 = 138412802;
    long long v44 = v28;
    uint64_t v46 = *(void *)v51;
    do
    {
      uint64_t v31 = 0;
      uint64_t v49 = v29;
      do
      {
        if (*(void *)v51 != v30) {
          objc_enumerationMutation(v26);
        }
        v32 = -[ATXNotificationDigestFeedbackLogger _getBundleIdAndEngagementsForDigestGroup:onDigest:](self, "_getBundleIdAndEngagementsForDigestGroup:onDigest:", *(void *)(*((void *)&v50 + 1) + 8 * v31), v4, v44);
        v33 = v32;
        if (v32)
        {
          v34 = [v32 first];
          if ([v5 containsObject:v34])
          {
            v35 = __atxlog_handle_notification_management();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
            {
              v36 = (objc_class *)objc_opt_class();
              NSStringFromClass(v36);
              v38 = v37 = v26;
              v39 = [v4 uuid];
              v40 = [v39 UUIDString];
              *(_DWORD *)buf = v44;
              v60 = v38;
              __int16 v61 = 2112;
              v62 = v34;
              __int16 v63 = 2112;
              v64 = v40;
              _os_log_impl(&dword_1D0FA3000, v35, OS_LOG_TYPE_INFO, "[%@] Skipping duplicate bundle ID %@ in digest %@", buf, 0x20u);

              uint64_t v29 = v49;
              id v5 = v47;

              v26 = v37;
              uint64_t v30 = v46;
            }
          }
          else
          {
            v35 = [v33 second];
            [(ATXNotificationDigestFeedbackProtocol *)self->_digestFeedback logNonMarqueeAppearanceForBundleId:v34];
            uint64_t v41 = [v35 numEngagementsInUpcoming];
            uint64_t v42 = [v35 numEngagementsInScheduled] + v41;
            if (v42 + [v35 numEngagementsAfterExpiration]) {
              [(ATXNotificationDigestFeedbackProtocol *)self->_digestFeedback logNonMarqueeEngagementForBundleId:v34];
            }
            [v5 addObject:v34];
            uint64_t v29 = v49;
          }
        }
        ++v31;
      }
      while (v29 != v31);
      uint64_t v29 = [v26 countByEnumeratingWithState:&v50 objects:v58 count:16];
    }
    while (v29);
  }
}

- (id)_getBundleIdAndEngagementsForDigestGroup:(id)a3 onDigest:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 bundleId];
  if (v7)
  {
    long long v8 = [v5 digestEngagementTrackingMetrics];
    if (v8)
    {
      uint64_t v9 = [MEMORY[0x1E4F93BB8] tupleWithFirst:v7 second:v8];
      goto LABEL_9;
    }
    uint64_t v11 = __atxlog_handle_notification_management();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    v16 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v16);
    v13 = [v5 groupId];
    v14 = [v6 uuid];
    v17 = [v14 UUIDString];
    int v18 = 138412802;
    v19 = v12;
    __int16 v20 = 2112;
    uint64_t v21 = v13;
    __int16 v22 = 2112;
    v23 = v17;
    _os_log_error_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_ERROR, "[%@] Could not get engagement metrics for digest group with group ID %@ on digest %@", (uint8_t *)&v18, 0x20u);

LABEL_13:
LABEL_7:

    goto LABEL_8;
  }
  long long v8 = __atxlog_handle_notification_management();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = (objc_class *)objc_opt_class();
    uint64_t v11 = NSStringFromClass(v10);
    v12 = [v5 groupId];
    v13 = [v6 uuid];
    v14 = [v13 UUIDString];
    int v18 = 138412802;
    v19 = v11;
    __int16 v20 = 2112;
    uint64_t v21 = v12;
    __int16 v22 = 2112;
    v23 = v14;
    _os_log_error_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_ERROR, "[%@] Could not get bundle ID for digest group with group ID %@ on digest %@", (uint8_t *)&v18, 0x20u);
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v9 = 0;
LABEL_9:

  return v9;
}

- (void).cxx_destruct
{
}

@end