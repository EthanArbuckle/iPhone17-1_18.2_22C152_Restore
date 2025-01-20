@interface _ATXActiveDigestsTuple
+ (BOOL)supportsSecureCoding;
- (ATXUserNotificationDigest)activeScheduledDigest;
- (ATXUserNotificationDigest)activeUpcomingDigest;
- (ATXUserNotificationDigest)justCompletedDigest;
- (_ATXActiveDigestsTuple)init;
- (_ATXActiveDigestsTuple)initWithActiveUpcomingDigest:(id)a3 activeScheduledDigest:(id)a4 justCompletedDigest:(id)a5;
- (_ATXActiveDigestsTuple)initWithCoder:(id)a3;
- (_ATXActiveDigestsTuple)initWithPreviousTuple:(id)a3 nextDigestEvent:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _ATXActiveDigestsTuple

- (_ATXActiveDigestsTuple)init
{
  return [(_ATXActiveDigestsTuple *)self initWithActiveUpcomingDigest:0 activeScheduledDigest:0 justCompletedDigest:0];
}

- (_ATXActiveDigestsTuple)initWithActiveUpcomingDigest:(id)a3 activeScheduledDigest:(id)a4 justCompletedDigest:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_ATXActiveDigestsTuple;
  v12 = [(_ATXActiveDigestsTuple *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_activeUpcomingDigest, a3);
    objc_storeStrong((id *)&v13->_activeScheduledDigest, a4);
    objc_storeStrong((id *)&v13->_justCompletedDigest, a5);
  }

  return v13;
}

- (_ATXActiveDigestsTuple)initWithPreviousTuple:(id)a3 nextDigestEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1E4F1C9C8];
  [v7 timestamp];
  id v9 = objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
  switch([v7 eventType])
  {
    case 0:
      uint64_t v10 = [v6 activeUpcomingDigest];
      if (v10)
      {
        id v11 = (void *)v10;
        v12 = [v6 activeUpcomingDigest];
        v13 = [v7 notificationDigest];
        int v14 = [v12 doesDigestShareContentWithOtherDigest:v13];

        if (v14)
        {
          objc_super v15 = [v7 notificationDigest];
          v16 = [v6 activeUpcomingDigest];
          v17 = [v16 digestTimeline];
          [v15 setDigestTimeline:v17];

          v18 = [v15 digestTimeline];
          [v18 setFirstScheduledViewTimestamp:v9];

          v19 = [v6 activeScheduledDigest];
          v20 = [v19 digestTimeline];
          [v20 setDigestRemovedTimestamp:v9];

          v21 = self;
          v22 = 0;
          v23 = v15;
          v24 = v19;
          goto LABEL_20;
        }
      }
      uint64_t v47 = [v6 activeScheduledDigest];
      if (v47)
      {
        v48 = (void *)v47;
        v49 = [v6 activeScheduledDigest];
        v50 = [v7 notificationDigest];
        int v51 = [v49 doesDigestShareContentWithOtherDigest:v50];

        if (v51)
        {
          objc_super v15 = [v7 notificationDigest];
          v38 = [v6 activeScheduledDigest];
          v52 = [v38 digestTimeline];
          [v15 setDigestTimeline:v52];

          goto LABEL_24;
        }
      }
      objc_super v15 = [v7 notificationDigest];
      v61 = objc_opt_new();
      [v15 setDigestTimeline:v61];

      v62 = [v15 digestTimeline];
      [v62 setFirstScheduledViewTimestamp:v9];

      v63 = [v6 activeScheduledDigest];
      v19 = v63;
      if (v63)
      {
        v64 = [v63 digestTimeline];
        [v64 setDigestRemovedTimestamp:v9];
      }
      v57 = [v6 activeUpcomingDigest];
      v58 = self;
      v59 = v57;
      v60 = v15;
      goto LABEL_31;
    case 1:
      uint64_t v25 = [v6 activeUpcomingDigest];
      if (v25)
      {
        v26 = (void *)v25;
        v27 = [v6 activeUpcomingDigest];
        v28 = [v27 digestTimeline];
        v29 = [v28 firstCollapsedViewTimestamp];

        if (!v29)
        {
          v66 = [v6 activeUpcomingDigest];
          v67 = [v7 notificationDigest];
          int v68 = [v66 doesDigestShareContentWithOtherDigest:v67];

          if (v68)
          {
            objc_super v15 = [v7 notificationDigest];
            v44 = [v15 digestTimeline];
            [v44 setFirstCollapsedViewTimestamp:v9];
LABEL_36:

LABEL_18:
            v19 = [v6 activeScheduledDigest];
            v21 = self;
            v22 = v15;
            v23 = v19;
            goto LABEL_19;
          }
LABEL_17:
          objc_super v15 = [v6 activeUpcomingDigest];
          goto LABEL_18;
        }
      }
      uint64_t v30 = [v6 activeScheduledDigest];
      if (!v30) {
        goto LABEL_17;
      }
      v31 = (void *)v30;
      v32 = [v6 activeScheduledDigest];
      v33 = [v32 digestTimeline];
      v34 = [v33 firstCollapsedViewTimestamp];

      if (v34) {
        goto LABEL_17;
      }
      v35 = [v6 activeScheduledDigest];
      v36 = [v7 notificationDigest];
      int v37 = [v35 doesDigestShareContentWithOtherDigest:v36];

      if (!v37) {
        goto LABEL_17;
      }
      objc_super v15 = [v7 notificationDigest];
      v38 = [v15 digestTimeline];
      [v38 setFirstCollapsedViewTimestamp:v9];
LABEL_24:

      v19 = [v6 activeUpcomingDigest];
      v21 = self;
      v22 = v19;
      v23 = v15;
LABEL_19:
      v24 = 0;
LABEL_20:
      self = [(_ATXActiveDigestsTuple *)v21 initWithActiveUpcomingDigest:v22 activeScheduledDigest:v23 justCompletedDigest:v24];
LABEL_32:

LABEL_33:
      return self;
    case 2:
      uint64_t v39 = [v6 activeUpcomingDigest];
      if (v39)
      {
        v40 = (void *)v39;
        v41 = [v6 activeUpcomingDigest];
        v42 = [v7 notificationDigest];
        char v43 = [v41 doesDigestShareContentWithOtherDigest:v42];

        if (v43)
        {
          objc_super v15 = [v7 notificationDigest];
          v44 = [v6 activeUpcomingDigest];
          v45 = [v44 digestTimeline];
          [v15 setDigestTimeline:v45];

          goto LABEL_36;
        }
      }
      objc_super v15 = [v7 notificationDigest];
      v53 = objc_opt_new();
      [v15 setDigestTimeline:v53];

      v54 = [v15 digestTimeline];
      [v54 setFirstUpcomingViewTimestamp:v9];

      v55 = [v6 activeUpcomingDigest];
      v19 = v55;
      if (v55)
      {
        v56 = [v55 digestTimeline];
        [v56 setDigestRemovedTimestamp:v9];
      }
      v57 = [v6 activeScheduledDigest];
      v58 = self;
      v59 = v15;
      v60 = v57;
LABEL_31:
      self = [(_ATXActiveDigestsTuple *)v58 initWithActiveUpcomingDigest:v59 activeScheduledDigest:v60 justCompletedDigest:v19];

      goto LABEL_32;
    case 3:
      v46 = __atxlog_handle_notification_management();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
        -[_ATXActiveDigestsTuple initWithPreviousTuple:nextDigestEvent:](v46);
      }

      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Received ATXUserNotificationDigestEventTypeTotal in digest Biome stream."];
      goto LABEL_17;
    default:
      goto LABEL_33;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(_ATXActiveDigestsTuple *)self activeUpcomingDigest];
  [v4 encodeObject:v5 forKey:@"codingKeyForActiveUpcomingDigest"];

  id v6 = [(_ATXActiveDigestsTuple *)self activeScheduledDigest];
  [v4 encodeObject:v6 forKey:@"codingKeyForActiveScheduledDigest"];

  id v7 = [(_ATXActiveDigestsTuple *)self justCompletedDigest];
  [v4 encodeObject:v7 forKey:@"codingKeyForJustCompletedDigest"];
}

- (_ATXActiveDigestsTuple)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F93B90];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id v7 = __atxlog_handle_notification_management();
  v8 = [v4 robustDecodeObjectOfClass:v6 forKey:@"codingKeyForActiveUpcomingDigest" withCoder:v5 expectNonNull:0 errorDomain:@"com.apple.ATXCompletedDigestBiomeStream" errorCode:-1 logHandle:v7];

  id v9 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v10 = objc_opt_class();
  id v11 = __atxlog_handle_notification_management();
  v12 = [v9 robustDecodeObjectOfClass:v10 forKey:@"codingKeyForActiveScheduledDigest" withCoder:v5 expectNonNull:0 errorDomain:@"com.apple.ATXCompletedDigestBiomeStream" errorCode:-1 logHandle:v11];

  v13 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v14 = objc_opt_class();
  objc_super v15 = __atxlog_handle_notification_management();
  v16 = [v13 robustDecodeObjectOfClass:v14 forKey:@"codingKeyForJustCompletedDigest" withCoder:v5 expectNonNull:0 errorDomain:@"com.apple.ATXCompletedDigestBiomeStream" errorCode:-1 logHandle:v15];

  v17 = [(_ATXActiveDigestsTuple *)self initWithActiveUpcomingDigest:v8 activeScheduledDigest:v12 justCompletedDigest:v16];
  return v17;
}

- (ATXUserNotificationDigest)activeUpcomingDigest
{
  return self->_activeUpcomingDigest;
}

- (ATXUserNotificationDigest)activeScheduledDigest
{
  return self->_activeScheduledDigest;
}

- (ATXUserNotificationDigest)justCompletedDigest
{
  return self->_justCompletedDigest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_justCompletedDigest, 0);
  objc_storeStrong((id *)&self->_activeScheduledDigest, 0);
  objc_storeStrong((id *)&self->_activeUpcomingDigest, 0);
}

- (void)initWithPreviousTuple:(os_log_t)log nextDigestEvent:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "Received ATXUserNotificationDigestEventTypeTotal in digest Biome stream.", v1, 2u);
}

@end