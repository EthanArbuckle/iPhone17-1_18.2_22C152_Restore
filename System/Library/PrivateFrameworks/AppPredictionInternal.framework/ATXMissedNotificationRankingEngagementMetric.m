@interface ATXMissedNotificationRankingEngagementMetric
- (NSString)mnbUUID;
- (NSString)nextModeSemanticType;
- (NSString)previousModeSemanticType;
- (double)createdTimestamp;
- (double)expireTimestamp;
- (double)showTimestamp;
- (id)coreAnalyticsDictionary;
- (id)metricName;
- (unint64_t)numEngagementsAfterExpiration;
- (unint64_t)numEngagementsAfterShow;
- (unint64_t)numEngagementsInUpcoming;
- (unint64_t)numExpansions;
- (unint64_t)numMessageEngagements;
- (unint64_t)numMessageGroups;
- (unint64_t)numMessageNotifications;
- (unint64_t)numOtherEngagements;
- (unint64_t)numOtherGroups;
- (unint64_t)numOtherNotifications;
- (void)populateMetricsFromRanking:(id)a3;
- (void)setCreatedTimestamp:(double)a3;
- (void)setExpireTimestamp:(double)a3;
- (void)setMnbUUID:(id)a3;
- (void)setNextModeSemanticType:(id)a3;
- (void)setNumEngagementsAfterExpiration:(unint64_t)a3;
- (void)setNumEngagementsAfterShow:(unint64_t)a3;
- (void)setNumEngagementsInUpcoming:(unint64_t)a3;
- (void)setNumExpansions:(unint64_t)a3;
- (void)setNumMessageEngagements:(unint64_t)a3;
- (void)setNumMessageGroups:(unint64_t)a3;
- (void)setNumMessageNotifications:(unint64_t)a3;
- (void)setNumOtherEngagements:(unint64_t)a3;
- (void)setNumOtherGroups:(unint64_t)a3;
- (void)setNumOtherNotifications:(unint64_t)a3;
- (void)setPreviousModeSemanticType:(id)a3;
- (void)setShowTimestamp:(double)a3;
@end

@implementation ATXMissedNotificationRankingEngagementMetric

- (id)metricName
{
  return @"com.apple.MissedNotificationBundle.TopLevel.engagementSummary";
}

- (void)populateMetricsFromRanking:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 digestTimeline];
  v6 = [v5 firstUpcomingViewTimestamp];
  if (v6)
  {
    v7 = [v4 digestTimeline];
    v8 = [v7 firstUpcomingViewTimestamp];
    [v8 timeIntervalSinceReferenceDate];
    -[ATXMissedNotificationRankingEngagementMetric setCreatedTimestamp:](self, "setCreatedTimestamp:");
  }
  else
  {
    [(ATXMissedNotificationRankingEngagementMetric *)self setCreatedTimestamp:0.0];
  }

  v9 = [v4 digestTimeline];
  v10 = [v9 firstScheduledViewTimestamp];
  if (v10)
  {
    v11 = [v4 digestTimeline];
    v12 = [v11 firstScheduledViewTimestamp];
    [v12 timeIntervalSinceReferenceDate];
    -[ATXMissedNotificationRankingEngagementMetric setShowTimestamp:](self, "setShowTimestamp:");
  }
  else
  {
    [(ATXMissedNotificationRankingEngagementMetric *)self setShowTimestamp:0.0];
  }

  v13 = [v4 digestTimeline];
  v14 = [v13 digestRemovedTimestamp];
  if (v14)
  {
    v15 = [v4 digestTimeline];
    v16 = [v15 digestRemovedTimestamp];
    [v16 timeIntervalSinceReferenceDate];
    -[ATXMissedNotificationRankingEngagementMetric setExpireTimestamp:](self, "setExpireTimestamp:");
  }
  else
  {
    [(ATXMissedNotificationRankingEngagementMetric *)self setExpireTimestamp:0.0];
  }

  v17 = [v4 uuid];
  v18 = [v17 UUIDString];
  [(ATXMissedNotificationRankingEngagementMetric *)self setMnbUUID:v18];

  v19 = [v4 modeIdString];
  [(ATXMissedNotificationRankingEngagementMetric *)self setPreviousModeSemanticType:v19];

  [(ATXMissedNotificationRankingEngagementMetric *)self setNextModeSemanticType:0];
  [(ATXMissedNotificationRankingEngagementMetric *)self setNumMessageGroups:0];
  [(ATXMissedNotificationRankingEngagementMetric *)self setNumOtherGroups:0];
  [(ATXMissedNotificationRankingEngagementMetric *)self setNumMessageNotifications:0];
  [(ATXMissedNotificationRankingEngagementMetric *)self setNumOtherNotifications:0];
  [(ATXMissedNotificationRankingEngagementMetric *)self setNumMessageEngagements:0];
  [(ATXMissedNotificationRankingEngagementMetric *)self setNumOtherEngagements:0];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v20 = objc_msgSend(v4, "rankedGroups", 0);
  uint64_t v21 = [v20 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v37 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        v26 = [v25 digestEngagementTrackingMetrics];
        uint64_t v27 = [v26 numEngagementsAfterExpiration];
        uint64_t v28 = [v26 numEngagementsInScheduled] + v27;
        uint64_t v29 = v28 + [v26 numEngagementsInUpcoming];
        if ([v25 isCommunicationGroup])
        {
          [(ATXMissedNotificationRankingEngagementMetric *)self setNumMessageGroups:[(ATXMissedNotificationRankingEngagementMetric *)self numMessageGroups] + 1];
          v30 = [v25 rankedNotifications];
          -[ATXMissedNotificationRankingEngagementMetric setNumMessageNotifications:](self, "setNumMessageNotifications:", -[ATXMissedNotificationRankingEngagementMetric numMessageNotifications](self, "numMessageNotifications")+ [v30 count]);

          [(ATXMissedNotificationRankingEngagementMetric *)self setNumMessageEngagements:[(ATXMissedNotificationRankingEngagementMetric *)self numMessageEngagements] + v29];
        }
        else
        {
          [(ATXMissedNotificationRankingEngagementMetric *)self setNumOtherGroups:[(ATXMissedNotificationRankingEngagementMetric *)self numOtherGroups] + 1];
          v31 = [v25 rankedNotifications];
          -[ATXMissedNotificationRankingEngagementMetric setNumOtherNotifications:](self, "setNumOtherNotifications:", -[ATXMissedNotificationRankingEngagementMetric numOtherNotifications](self, "numOtherNotifications")+ [v31 count]);

          [(ATXMissedNotificationRankingEngagementMetric *)self setNumOtherEngagements:[(ATXMissedNotificationRankingEngagementMetric *)self numOtherEngagements] + v29];
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v22);
  }

  v32 = [v4 digestEngagementTrackingMetrics];
  -[ATXMissedNotificationRankingEngagementMetric setNumEngagementsInUpcoming:](self, "setNumEngagementsInUpcoming:", [v32 numEngagementsInUpcoming]);

  v33 = [v4 digestEngagementTrackingMetrics];
  -[ATXMissedNotificationRankingEngagementMetric setNumEngagementsAfterShow:](self, "setNumEngagementsAfterShow:", [v33 numEngagementsInScheduled]);

  v34 = [v4 digestEngagementTrackingMetrics];
  -[ATXMissedNotificationRankingEngagementMetric setNumEngagementsAfterExpiration:](self, "setNumEngagementsAfterExpiration:", [v34 numEngagementsAfterExpiration]);

  v35 = [v4 digestEngagementTrackingMetrics];
  -[ATXMissedNotificationRankingEngagementMetric setNumExpansions:](self, "setNumExpansions:", [v35 numExpansions]);
}

- (id)coreAnalyticsDictionary
{
  v33[16] = *MEMORY[0x1E4F143B8];
  v32[0] = @"createdTimestamp";
  v3 = NSNumber;
  [(ATXMissedNotificationRankingEngagementMetric *)self createdTimestamp];
  v31 = objc_msgSend(v3, "numberWithDouble:");
  v33[0] = v31;
  v32[1] = @"showTimestamp";
  id v4 = NSNumber;
  [(ATXMissedNotificationRankingEngagementMetric *)self expireTimestamp];
  v30 = objc_msgSend(v4, "numberWithDouble:");
  v33[1] = v30;
  v32[2] = @"expireTimestamp";
  v5 = NSNumber;
  [(ATXMissedNotificationRankingEngagementMetric *)self expireTimestamp];
  uint64_t v29 = objc_msgSend(v5, "numberWithDouble:");
  v33[2] = v29;
  v32[3] = @"mnbUUID";
  uint64_t v6 = [(ATXMissedNotificationRankingEngagementMetric *)self mnbUUID];
  v7 = (void *)v6;
  if (!v6)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v24 = (void *)v6;
  v33[3] = v6;
  v32[4] = @"previousModeSemanticType";
  uint64_t v8 = [(ATXMissedNotificationRankingEngagementMetric *)self previousModeSemanticType];
  v9 = (void *)v8;
  if (!v8)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v27 = v9;
  uint64_t v28 = v7;
  uint64_t v23 = (void *)v8;
  v33[4] = v8;
  v32[5] = @"nextModeSemanticType";
  uint64_t v10 = [(ATXMissedNotificationRankingEngagementMetric *)self nextModeSemanticType];
  v11 = (void *)v10;
  if (!v10)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v33[5] = v10;
  v32[6] = @"numMessageGroups";
  v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXMissedNotificationRankingEngagementMetric numMessageGroups](self, "numMessageGroups", v10));
  v33[6] = v26;
  v32[7] = @"numOtherGroups";
  v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXMissedNotificationRankingEngagementMetric numOtherGroups](self, "numOtherGroups"));
  v33[7] = v25;
  v32[8] = @"numMessageNotifications";
  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXMissedNotificationRankingEngagementMetric numMessageNotifications](self, "numMessageNotifications"));
  v33[8] = v12;
  v32[9] = @"numOtherNotifications";
  v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXMissedNotificationRankingEngagementMetric numOtherNotifications](self, "numOtherNotifications"));
  v33[9] = v13;
  v32[10] = @"numMessageEngagements";
  v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXMissedNotificationRankingEngagementMetric numMessageEngagements](self, "numMessageEngagements"));
  v33[10] = v14;
  v32[11] = @"numOtherEngagements";
  v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXMissedNotificationRankingEngagementMetric numOtherEngagements](self, "numOtherEngagements"));
  v33[11] = v15;
  v32[12] = @"numEngagementsInUpcoming";
  v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXMissedNotificationRankingEngagementMetric numEngagementsInUpcoming](self, "numEngagementsInUpcoming"));
  v33[12] = v16;
  v32[13] = @"numEngagementsAfterShow";
  v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXMissedNotificationRankingEngagementMetric numEngagementsAfterShow](self, "numEngagementsAfterShow"));
  v33[13] = v17;
  v32[14] = @"numEngagementsAfterExpiration";
  v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXMissedNotificationRankingEngagementMetric numEngagementsAfterExpiration](self, "numEngagementsAfterExpiration"));
  v33[14] = v18;
  v32[15] = @"numExpansions";
  v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXMissedNotificationRankingEngagementMetric numExpansions](self, "numExpansions"));
  v33[15] = v19;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:16];

  if (!v11) {
  if (!v27)
  }

  if (!v28) {
  return v20;
  }
}

- (double)createdTimestamp
{
  return self->_createdTimestamp;
}

- (void)setCreatedTimestamp:(double)a3
{
  self->_createdTimestamp = a3;
}

- (double)showTimestamp
{
  return self->_showTimestamp;
}

- (void)setShowTimestamp:(double)a3
{
  self->_showTimestamp = a3;
}

- (double)expireTimestamp
{
  return self->_expireTimestamp;
}

- (void)setExpireTimestamp:(double)a3
{
  self->_expireTimestamp = a3;
}

- (NSString)mnbUUID
{
  return self->_mnbUUID;
}

- (void)setMnbUUID:(id)a3
{
}

- (NSString)previousModeSemanticType
{
  return self->_previousModeSemanticType;
}

- (void)setPreviousModeSemanticType:(id)a3
{
}

- (NSString)nextModeSemanticType
{
  return self->_nextModeSemanticType;
}

- (void)setNextModeSemanticType:(id)a3
{
}

- (unint64_t)numMessageGroups
{
  return self->_numMessageGroups;
}

- (void)setNumMessageGroups:(unint64_t)a3
{
  self->_numMessageGroups = a3;
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

- (unint64_t)numOtherNotifications
{
  return self->_numOtherNotifications;
}

- (void)setNumOtherNotifications:(unint64_t)a3
{
  self->_numOtherNotifications = a3;
}

- (unint64_t)numMessageEngagements
{
  return self->_numMessageEngagements;
}

- (void)setNumMessageEngagements:(unint64_t)a3
{
  self->_numMessageEngagements = a3;
}

- (unint64_t)numOtherEngagements
{
  return self->_numOtherEngagements;
}

- (void)setNumOtherEngagements:(unint64_t)a3
{
  self->_numOtherEngagements = a3;
}

- (unint64_t)numEngagementsInUpcoming
{
  return self->_numEngagementsInUpcoming;
}

- (void)setNumEngagementsInUpcoming:(unint64_t)a3
{
  self->_numEngagementsInUpcoming = a3;
}

- (unint64_t)numEngagementsAfterShow
{
  return self->_numEngagementsAfterShow;
}

- (void)setNumEngagementsAfterShow:(unint64_t)a3
{
  self->_numEngagementsAfterShow = a3;
}

- (unint64_t)numEngagementsAfterExpiration
{
  return self->_numEngagementsAfterExpiration;
}

- (void)setNumEngagementsAfterExpiration:(unint64_t)a3
{
  self->_numEngagementsAfterExpiration = a3;
}

- (unint64_t)numExpansions
{
  return self->_numExpansions;
}

- (void)setNumExpansions:(unint64_t)a3
{
  self->_numExpansions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextModeSemanticType, 0);
  objc_storeStrong((id *)&self->_previousModeSemanticType, 0);
  objc_storeStrong((id *)&self->_mnbUUID, 0);
}

@end