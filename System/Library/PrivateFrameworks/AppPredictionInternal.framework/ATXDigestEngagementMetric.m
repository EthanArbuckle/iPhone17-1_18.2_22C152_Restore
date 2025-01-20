@interface ATXDigestEngagementMetric
- (NSString)digestTimeCategory;
- (NSString)digestUUID;
- (double)digestExpirationTimestamp;
- (double)firstScheduledViewTimestamp;
- (double)firstUpcomingViewTimestamp;
- (id)coreAnalyticsDictionary;
- (id)metricName;
- (unint64_t)numDigestExpansions;
- (unint64_t)numEngagementsAfterExpiration;
- (unint64_t)numEngagementsInScheduled;
- (unint64_t)numEngagementsInUpcoming;
- (unint64_t)numHighlightedGroups;
- (unint64_t)numHighlightedNotifications;
- (unint64_t)numMessageGroups;
- (unint64_t)numMessageNotifications;
- (unint64_t)numNotificationGroupExpansions;
- (unint64_t)numOtherGroups;
- (unint64_t)numOtherNotifications;
- (void)populateMetricsFromDigest:(id)a3;
- (void)setDigestExpirationTimestamp:(double)a3;
- (void)setDigestTimeCategory:(id)a3;
- (void)setDigestUUID:(id)a3;
- (void)setFirstScheduledViewTimestamp:(double)a3;
- (void)setFirstUpcomingViewTimestamp:(double)a3;
- (void)setNumDigestExpansions:(unint64_t)a3;
- (void)setNumEngagementsAfterExpiration:(unint64_t)a3;
- (void)setNumEngagementsInScheduled:(unint64_t)a3;
- (void)setNumEngagementsInUpcoming:(unint64_t)a3;
- (void)setNumHighlightedGroups:(unint64_t)a3;
- (void)setNumHighlightedNotifications:(unint64_t)a3;
- (void)setNumMessageGroups:(unint64_t)a3;
- (void)setNumMessageNotifications:(unint64_t)a3;
- (void)setNumNotificationGroupExpansions:(unint64_t)a3;
- (void)setNumOtherGroups:(unint64_t)a3;
- (void)setNumOtherNotifications:(unint64_t)a3;
@end

@implementation ATXDigestEngagementMetric

- (id)metricName
{
  return @"com.apple.NotificationDigest.TopLevelDigest.engagementSummary";
}

- (void)populateMetricsFromDigest:(id)a3
{
  id v33 = a3;
  v4 = [v33 modeIdString];
  [(ATXDigestEngagementMetric *)self setDigestTimeCategory:v4];

  v5 = [v33 uuid];
  v6 = [v5 UUIDString];
  [(ATXDigestEngagementMetric *)self setDigestUUID:v6];

  v7 = [v33 digestEngagementTrackingMetrics];
  -[ATXDigestEngagementMetric setNumDigestExpansions:](self, "setNumDigestExpansions:", [v7 numDigestExpansions]);

  v8 = [v33 messageGroups];
  -[ATXDigestEngagementMetric setNumMessageGroups:](self, "setNumMessageGroups:", [v8 count]);

  v9 = [v33 highlightedGroups];
  -[ATXDigestEngagementMetric setNumHighlightedGroups:](self, "setNumHighlightedGroups:", [v9 count]);

  v10 = [v33 rankedGroups];
  -[ATXDigestEngagementMetric setNumOtherGroups:](self, "setNumOtherGroups:", [v10 count]);

  v11 = [v33 messageGroups];
  v12 = objc_msgSend(v11, "_pas_leftFoldWithInitialObject:accumulate:", &unk_1F27F20D0, &__block_literal_global_197);
  -[ATXDigestEngagementMetric setNumMessageNotifications:](self, "setNumMessageNotifications:", [v12 unsignedIntegerValue]);

  v13 = [v33 highlightedGroups];
  v14 = objc_msgSend(v13, "_pas_leftFoldWithInitialObject:accumulate:", &unk_1F27F20D0, &__block_literal_global_16);
  -[ATXDigestEngagementMetric setNumHighlightedNotifications:](self, "setNumHighlightedNotifications:", [v14 unsignedIntegerValue]);

  v15 = [v33 rankedGroups];
  v16 = objc_msgSend(v15, "_pas_leftFoldWithInitialObject:accumulate:", &unk_1F27F20D0, &__block_literal_global_18_3);
  -[ATXDigestEngagementMetric setNumOtherNotifications:](self, "setNumOtherNotifications:", [v16 unsignedIntegerValue]);

  v17 = [v33 digestEngagementTrackingMetrics];
  -[ATXDigestEngagementMetric setNumEngagementsInUpcoming:](self, "setNumEngagementsInUpcoming:", [v17 numEngagementsInUpcoming]);

  v18 = [v33 digestEngagementTrackingMetrics];
  -[ATXDigestEngagementMetric setNumEngagementsInScheduled:](self, "setNumEngagementsInScheduled:", [v18 numEngagementsInScheduled]);

  v19 = [v33 digestEngagementTrackingMetrics];
  -[ATXDigestEngagementMetric setNumEngagementsAfterExpiration:](self, "setNumEngagementsAfterExpiration:", [v19 numEngagementsAfterExpiration]);

  v20 = [v33 digestEngagementTrackingMetrics];
  -[ATXDigestEngagementMetric setNumNotificationGroupExpansions:](self, "setNumNotificationGroupExpansions:", [v20 numExpansions]);

  v21 = [v33 digestTimeline];
  v22 = [v21 firstUpcomingViewTimestamp];
  if (v22)
  {
    v23 = [v33 digestTimeline];
    v24 = [v23 firstUpcomingViewTimestamp];
    [v24 timeIntervalSinceReferenceDate];
    -[ATXDigestEngagementMetric setFirstUpcomingViewTimestamp:](self, "setFirstUpcomingViewTimestamp:");
  }
  else
  {
    [(ATXDigestEngagementMetric *)self setFirstUpcomingViewTimestamp:0.0];
  }

  v25 = [v33 digestTimeline];
  v26 = [v25 firstScheduledViewTimestamp];
  if (v26)
  {
    v27 = [v33 digestTimeline];
    v28 = [v27 firstScheduledViewTimestamp];
    [v28 timeIntervalSinceReferenceDate];
    -[ATXDigestEngagementMetric setFirstScheduledViewTimestamp:](self, "setFirstScheduledViewTimestamp:");
  }
  else
  {
    [(ATXDigestEngagementMetric *)self setFirstScheduledViewTimestamp:0.0];
  }

  v29 = [v33 digestTimeline];
  v30 = [v29 digestRemovedTimestamp];
  if (v30)
  {
    v31 = [v33 digestTimeline];
    v32 = [v31 digestRemovedTimestamp];
    [v32 timeIntervalSinceReferenceDate];
    -[ATXDigestEngagementMetric setDigestExpirationTimestamp:](self, "setDigestExpirationTimestamp:");
  }
  else
  {
    [(ATXDigestEngagementMetric *)self setDigestExpirationTimestamp:0.0];
  }
}

id __55__ATXDigestEngagementMetric_populateMetricsFromDigest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = NSNumber;
  id v5 = a3;
  uint64_t v6 = [a2 unsignedIntegerValue];
  v7 = [v5 rankedNotifications];

  v8 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v7, "count") + v6);

  return v8;
}

id __55__ATXDigestEngagementMetric_populateMetricsFromDigest___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v4 = NSNumber;
  id v5 = a3;
  uint64_t v6 = [a2 unsignedIntegerValue];
  v7 = [v5 rankedNotifications];

  v8 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v7, "count") + v6);

  return v8;
}

id __55__ATXDigestEngagementMetric_populateMetricsFromDigest___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  v4 = NSNumber;
  id v5 = a3;
  uint64_t v6 = [a2 unsignedIntegerValue];
  v7 = [v5 rankedNotifications];

  v8 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v7, "count") + v6);

  return v8;
}

- (id)coreAnalyticsDictionary
{
  v30[16] = *MEMORY[0x1E4F143B8];
  v29[0] = @"digestTimeCategory";
  uint64_t v3 = [(ATXDigestEngagementMetric *)self digestTimeCategory];
  v4 = (void *)v3;
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v28 = v4;
  v21 = (void *)v3;
  v30[0] = v3;
  v29[1] = @"digestUUID";
  uint64_t v5 = [(ATXDigestEngagementMetric *)self digestUUID];
  v27 = (void *)v5;
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v20 = (void *)v5;
  v30[1] = v5;
  v29[2] = @"numDigestExpansions";
  v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXDigestEngagementMetric numDigestExpansions](self, "numDigestExpansions"));
  v30[2] = v26;
  v29[3] = @"numMessageGroups";
  v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXDigestEngagementMetric numMessageGroups](self, "numMessageGroups"));
  v30[3] = v25;
  v29[4] = @"numHighlightedGroups";
  v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXDigestEngagementMetric numHighlightedGroups](self, "numHighlightedGroups"));
  v30[4] = v24;
  v29[5] = @"numOtherGroups";
  v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXDigestEngagementMetric numOtherGroups](self, "numOtherGroups"));
  v30[5] = v23;
  v29[6] = @"numMessageNotifications";
  v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXDigestEngagementMetric numMessageNotifications](self, "numMessageNotifications"));
  v30[6] = v22;
  v29[7] = @"numHighlightedNotifications";
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXDigestEngagementMetric numHighlightedNotifications](self, "numHighlightedNotifications"));
  v30[7] = v6;
  v29[8] = @"numOtherNotifications";
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXDigestEngagementMetric numOtherNotifications](self, "numOtherNotifications"));
  v30[8] = v7;
  v29[9] = @"numEngagementsInUpcoming";
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXDigestEngagementMetric numEngagementsInUpcoming](self, "numEngagementsInUpcoming"));
  v30[9] = v8;
  v29[10] = @"numEngagementsInScheduled";
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXDigestEngagementMetric numEngagementsInScheduled](self, "numEngagementsInScheduled"));
  v30[10] = v9;
  v29[11] = @"numEngagementsAfterExpiration";
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXDigestEngagementMetric numEngagementsAfterExpiration](self, "numEngagementsAfterExpiration"));
  v30[11] = v10;
  v29[12] = @"numNotificationGroupExpansions";
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXDigestEngagementMetric numNotificationGroupExpansions](self, "numNotificationGroupExpansions"));
  v30[12] = v11;
  v29[13] = @"firstUpcomingViewTimestamp";
  v12 = NSNumber;
  [(ATXDigestEngagementMetric *)self firstUpcomingViewTimestamp];
  v13 = objc_msgSend(v12, "numberWithDouble:");
  v30[13] = v13;
  v29[14] = @"firstScheduledViewTimestamp";
  v14 = NSNumber;
  [(ATXDigestEngagementMetric *)self firstScheduledViewTimestamp];
  v15 = objc_msgSend(v14, "numberWithDouble:");
  v30[14] = v15;
  v29[15] = @"digestExpirationTimestamp";
  v16 = NSNumber;
  [(ATXDigestEngagementMetric *)self digestExpirationTimestamp];
  v17 = objc_msgSend(v16, "numberWithDouble:");
  v30[15] = v17;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:16];

  if (!v27) {
  if (!v28)
  }

  return v18;
}

- (NSString)digestTimeCategory
{
  return self->_digestTimeCategory;
}

- (void)setDigestTimeCategory:(id)a3
{
}

- (NSString)digestUUID
{
  return self->_digestUUID;
}

- (void)setDigestUUID:(id)a3
{
}

- (unint64_t)numDigestExpansions
{
  return self->_numDigestExpansions;
}

- (void)setNumDigestExpansions:(unint64_t)a3
{
  self->_numDigestExpansions = a3;
}

- (unint64_t)numMessageGroups
{
  return self->_numMessageGroups;
}

- (void)setNumMessageGroups:(unint64_t)a3
{
  self->_numMessageGroups = a3;
}

- (unint64_t)numHighlightedGroups
{
  return self->_numHighlightedGroups;
}

- (void)setNumHighlightedGroups:(unint64_t)a3
{
  self->_numHighlightedGroups = a3;
}

- (unint64_t)numOtherGroups
{
  return self->_numOtherGroups;
}

- (void)setNumOtherGroups:(unint64_t)a3
{
  self->_numOtherGroups = a3;
}

- (unint64_t)numMessageNotifications
{
  return self->_numMessageNotifications;
}

- (void)setNumMessageNotifications:(unint64_t)a3
{
  self->_numMessageNotifications = a3;
}

- (unint64_t)numHighlightedNotifications
{
  return self->_numHighlightedNotifications;
}

- (void)setNumHighlightedNotifications:(unint64_t)a3
{
  self->_numHighlightedNotifications = a3;
}

- (unint64_t)numOtherNotifications
{
  return self->_numOtherNotifications;
}

- (void)setNumOtherNotifications:(unint64_t)a3
{
  self->_numOtherNotifications = a3;
}

- (unint64_t)numEngagementsInUpcoming
{
  return self->_numEngagementsInUpcoming;
}

- (void)setNumEngagementsInUpcoming:(unint64_t)a3
{
  self->_numEngagementsInUpcoming = a3;
}

- (unint64_t)numEngagementsInScheduled
{
  return self->_numEngagementsInScheduled;
}

- (void)setNumEngagementsInScheduled:(unint64_t)a3
{
  self->_numEngagementsInScheduled = a3;
}

- (unint64_t)numEngagementsAfterExpiration
{
  return self->_numEngagementsAfterExpiration;
}

- (void)setNumEngagementsAfterExpiration:(unint64_t)a3
{
  self->_numEngagementsAfterExpiration = a3;
}

- (unint64_t)numNotificationGroupExpansions
{
  return self->_numNotificationGroupExpansions;
}

- (void)setNumNotificationGroupExpansions:(unint64_t)a3
{
  self->_numNotificationGroupExpansions = a3;
}

- (double)firstUpcomingViewTimestamp
{
  return self->_firstUpcomingViewTimestamp;
}

- (void)setFirstUpcomingViewTimestamp:(double)a3
{
  self->_firstUpcomingViewTimestamp = a3;
}

- (double)firstScheduledViewTimestamp
{
  return self->_firstScheduledViewTimestamp;
}

- (void)setFirstScheduledViewTimestamp:(double)a3
{
  self->_firstScheduledViewTimestamp = a3;
}

- (double)digestExpirationTimestamp
{
  return self->_digestExpirationTimestamp;
}

- (void)setDigestExpirationTimestamp:(double)a3
{
  self->_digestExpirationTimestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digestUUID, 0);
  objc_storeStrong((id *)&self->_digestTimeCategory, 0);
}

@end