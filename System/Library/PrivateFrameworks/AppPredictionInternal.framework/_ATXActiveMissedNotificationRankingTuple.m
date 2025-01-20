@interface _ATXActiveMissedNotificationRankingTuple
+ (BOOL)supportsSecureCoding;
- (ATXMissedNotificationRanking)activeDeliveredRanking;
- (ATXMissedNotificationRanking)activeUpcomingRanking;
- (ATXMissedNotificationRanking)justCompletedRanking;
- (_ATXActiveMissedNotificationRankingTuple)initWithActiveUpcomingRanking:(id)a3 activeDeliveredRanking:(id)a4 justCompletedRanking:(id)a5;
- (_ATXActiveMissedNotificationRankingTuple)initWithCoder:(id)a3;
- (_ATXActiveMissedNotificationRankingTuple)initWithPreviousTuple:(id)a3 nextRankingEvent:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _ATXActiveMissedNotificationRankingTuple

- (_ATXActiveMissedNotificationRankingTuple)initWithActiveUpcomingRanking:(id)a3 activeDeliveredRanking:(id)a4 justCompletedRanking:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_ATXActiveMissedNotificationRankingTuple;
  v12 = [(_ATXActiveMissedNotificationRankingTuple *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_activeUpcomingRanking, a3);
    objc_storeStrong((id *)&v13->_activeDeliveredRanking, a4);
    objc_storeStrong((id *)&v13->_justCompletedRanking, a5);
  }

  return v13;
}

- (_ATXActiveMissedNotificationRankingTuple)initWithPreviousTuple:(id)a3 nextRankingEvent:(id)a4
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1E4F1C9C8];
  [v7 timestamp];
  id v9 = objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
  switch([v7 eventType])
  {
    case 0:
    case 1:
      id v10 = __atxlog_handle_metrics();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = (objc_class *)objc_opt_class();
        v12 = NSStringFromClass(v11);
        uint64_t v13 = [v7 eventType];
        v14 = [v7 missedNotificationRanking];
        objc_super v15 = [v14 uuid];
        v16 = [v15 UUIDString];
        int v73 = 138412802;
        v74 = v12;
        __int16 v75 = 2048;
        uint64_t v76 = v13;
        __int16 v77 = 2112;
        v78 = v16;
        _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_INFO, "%@ - Received unsupported deprecated event type %ld on ranking with UUID %@", (uint8_t *)&v73, 0x20u);
      }
      goto LABEL_17;
    case 2:
    case 4:
      v33 = [v6 activeUpcomingRanking];

      if (!v33)
      {
        v22 = [v7 missedNotificationRanking];
        v60 = objc_opt_new();
        [v22 setDigestTimeline:v60];

        v37 = [v22 digestTimeline];
        [v37 setFirstUpcomingViewTimestamp:v9];
        goto LABEL_24;
      }
      v34 = [v6 activeUpcomingRanking];
      v35 = [v7 missedNotificationRanking];
      int v36 = [v34 doesRankingShareContentWithOtherRanking:v35];

      v22 = [v7 missedNotificationRanking];
      if (v36)
      {
        v37 = [v6 activeUpcomingRanking];
        v38 = [v37 digestTimeline];
        [v22 setDigestTimeline:v38];

LABEL_24:
        goto LABEL_25;
      }
      v61 = objc_opt_new();
      [v22 setDigestTimeline:v61];

      v62 = [v22 digestTimeline];
      [v62 setFirstUpcomingViewTimestamp:v9];

      v27 = [v6 activeUpcomingRanking];
      v63 = [v27 digestTimeline];
      [v63 setFirstScheduledViewTimestamp:v9];

      v64 = [v6 activeDeliveredRanking];
      v55 = v64;
      if (v64)
      {
        v65 = [v64 digestTimeline];
        [v65 setDigestRemovedTimestamp:v9];
      }
      v56 = self;
      v57 = v22;
      v58 = v27;
      v59 = v55;
LABEL_30:
      v46 = [(_ATXActiveMissedNotificationRankingTuple *)v56 initWithActiveUpcomingRanking:v57 activeDeliveredRanking:v58 justCompletedRanking:v59];

      goto LABEL_36;
    case 3:
    case 5:
      uint64_t v17 = [v6 activeUpcomingRanking];
      if (v17)
      {
        v18 = (void *)v17;
        v19 = [v6 activeUpcomingRanking];
        v20 = [v7 missedNotificationRanking];
        int v21 = [v19 doesRankingShareContentWithOtherRanking:v20];

        if (v21)
        {
          v22 = [v7 missedNotificationRanking];
          v23 = [v6 activeUpcomingRanking];
          v24 = [v23 digestTimeline];
          [v22 setDigestTimeline:v24];

          v25 = [v22 digestTimeline];
          [v25 setFirstScheduledViewTimestamp:v9];

          v26 = [v6 activeDeliveredRanking];
          v27 = v26;
          if (v26)
          {
            v28 = [v26 digestTimeline];
            [v28 setDigestRemovedTimestamp:v9];
          }
          v29 = self;
          v30 = 0;
          v31 = v22;
          v32 = v27;
          goto LABEL_35;
        }
      }
      uint64_t v39 = [v6 activeDeliveredRanking];
      if (v39)
      {
        v40 = (void *)v39;
        v41 = [v6 activeDeliveredRanking];
        v42 = [v7 missedNotificationRanking];
        int v43 = [v41 doesRankingShareContentWithOtherRanking:v42];

        if (v43)
        {
          v22 = [v7 missedNotificationRanking];
          v44 = [v6 activeDeliveredRanking];
          v45 = [v44 digestTimeline];
          [v22 setDigestTimeline:v45];

          v27 = [v6 activeUpcomingRanking];
          v29 = self;
          v30 = v27;
          v31 = v22;
          goto LABEL_26;
        }
      }
      v22 = [v7 missedNotificationRanking];
      v51 = objc_opt_new();
      [v22 setDigestTimeline:v51];

      v52 = [v22 digestTimeline];
      [v52 setFirstScheduledViewTimestamp:v9];

      v53 = [v6 activeDeliveredRanking];
      v27 = v53;
      if (v53)
      {
        v54 = [v53 digestTimeline];
        [v54 setDigestRemovedTimestamp:v9];
      }
      v55 = [v6 activeUpcomingRanking];
      v56 = self;
      v57 = v55;
      v58 = v22;
      v59 = v27;
      goto LABEL_30;
    case 6:
      v47 = [v6 activeUpcomingRanking];
      v48 = [v7 missedNotificationRanking];
      int v49 = [v47 doesRankingShareContentWithOtherRanking:v48];

      if (v49)
      {
        v22 = [v6 activeUpcomingRanking];
        v50 = [v22 digestTimeline];
        [v50 setDigestRemovedTimestamp:v9];

        v27 = [v6 activeDeliveredRanking];
        v29 = self;
        v30 = 0;
        v31 = v27;
LABEL_34:
        v32 = v22;
        goto LABEL_35;
      }
      uint64_t v66 = [v6 activeDeliveredRanking];
      if (v66)
      {
        v67 = (void *)v66;
        v68 = [v6 activeDeliveredRanking];
        v69 = [v7 missedNotificationRanking];
        int v70 = [v68 doesRankingShareContentWithOtherRanking:v69];

        if (v70)
        {
          v22 = [v6 activeDeliveredRanking];
          v71 = [v22 digestTimeline];
          [v71 setDigestRemovedTimestamp:v9];

          v27 = [v6 activeUpcomingRanking];
          v29 = self;
          v30 = v27;
          v31 = 0;
          goto LABEL_34;
        }
      }
      v22 = [v6 activeUpcomingRanking];
LABEL_25:
      v27 = [v6 activeDeliveredRanking];
      v29 = self;
      v30 = v22;
      v31 = v27;
LABEL_26:
      v32 = 0;
LABEL_35:
      v46 = [(_ATXActiveMissedNotificationRankingTuple *)v29 initWithActiveUpcomingRanking:v30 activeDeliveredRanking:v31 justCompletedRanking:v32];
LABEL_36:

LABEL_37:
      return v46;
    default:
      id v10 = __atxlog_handle_metrics();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[_ATXActiveMissedNotificationRankingTuple initWithPreviousTuple:nextRankingEvent:]((uint64_t)self, v7, v10);
      }
LABEL_17:

      v46 = [(_ATXActiveMissedNotificationRankingTuple *)self initWithActiveUpcomingRanking:0 activeDeliveredRanking:0 justCompletedRanking:0];
      goto LABEL_37;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(_ATXActiveMissedNotificationRankingTuple *)self activeUpcomingRanking];
  [v4 encodeObject:v5 forKey:@"codingKeyForActiveUpcomingMNR"];

  id v6 = [(_ATXActiveMissedNotificationRankingTuple *)self activeDeliveredRanking];
  [v4 encodeObject:v6 forKey:@"codingKeyForActiveDeliveredMNR"];

  id v7 = [(_ATXActiveMissedNotificationRankingTuple *)self justCompletedRanking];
  [v4 encodeObject:v7 forKey:@"codingKeyForJustCompletedMNR"];
}

- (_ATXActiveMissedNotificationRankingTuple)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F93B90];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id v7 = __atxlog_handle_notification_management();
  v8 = [v4 robustDecodeObjectOfClass:v6 forKey:@"codingKeyForActiveUpcomingMNR" withCoder:v5 expectNonNull:0 errorDomain:@"com.apple.ATXCompletedMNRBiomeStream" errorCode:-1 logHandle:v7];

  id v9 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v10 = objc_opt_class();
  id v11 = __atxlog_handle_notification_management();
  v12 = [v9 robustDecodeObjectOfClass:v10 forKey:@"codingKeyForActiveDeliveredMNR" withCoder:v5 expectNonNull:0 errorDomain:@"com.apple.ATXCompletedMNRBiomeStream" errorCode:-1 logHandle:v11];

  uint64_t v13 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v14 = objc_opt_class();
  objc_super v15 = __atxlog_handle_notification_management();
  v16 = [v13 robustDecodeObjectOfClass:v14 forKey:@"codingKeyForJustCompletedMNR" withCoder:v5 expectNonNull:0 errorDomain:@"com.apple.ATXCompletedMNRBiomeStream" errorCode:-1 logHandle:v15];

  uint64_t v17 = [(_ATXActiveMissedNotificationRankingTuple *)self initWithActiveUpcomingRanking:v8 activeDeliveredRanking:v12 justCompletedRanking:v16];
  return v17;
}

- (ATXMissedNotificationRanking)activeUpcomingRanking
{
  return self->_activeUpcomingRanking;
}

- (ATXMissedNotificationRanking)activeDeliveredRanking
{
  return self->_activeDeliveredRanking;
}

- (ATXMissedNotificationRanking)justCompletedRanking
{
  return self->_justCompletedRanking;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_justCompletedRanking, 0);
  objc_storeStrong((id *)&self->_activeDeliveredRanking, 0);
  objc_storeStrong((id *)&self->_activeUpcomingRanking, 0);
}

- (void)initWithPreviousTuple:(NSObject *)a3 nextRankingEvent:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  uint64_t v7 = [a2 eventType];
  v8 = [a2 missedNotificationRanking];
  id v9 = [v8 uuid];
  uint64_t v10 = [v9 UUIDString];
  int v11 = 138412802;
  v12 = v6;
  __int16 v13 = 2048;
  uint64_t v14 = v7;
  __int16 v15 = 2112;
  v16 = v10;
  _os_log_error_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_ERROR, "%@ - Received unknown event type %ld on ranking with UUID %@", (uint8_t *)&v11, 0x20u);
}

@end