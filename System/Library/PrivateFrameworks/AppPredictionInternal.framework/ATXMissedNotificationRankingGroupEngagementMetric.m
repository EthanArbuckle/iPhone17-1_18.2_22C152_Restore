@interface ATXMissedNotificationRankingGroupEngagementMetric
- (NSString)bundleId;
- (NSString)mnbUUID;
- (NSString)section;
- (double)groupScore;
- (id)coreAnalyticsDictionary;
- (id)metricName;
- (unint64_t)numEngagementsAfterExpiration;
- (unint64_t)numEngagementsAfterShow;
- (unint64_t)numEngagementsInUpcoming;
- (unint64_t)numExpansions;
- (unint64_t)numNotifications;
- (unint64_t)sectionPosition;
- (unint64_t)sectionSize;
- (void)populateMetricsFromDigestGroup:(id)a3 mnbUUID:(id)a4;
- (void)setBundleId:(id)a3;
- (void)setGroupScore:(double)a3;
- (void)setMnbUUID:(id)a3;
- (void)setNumEngagementsAfterExpiration:(unint64_t)a3;
- (void)setNumEngagementsAfterShow:(unint64_t)a3;
- (void)setNumEngagementsInUpcoming:(unint64_t)a3;
- (void)setNumExpansions:(unint64_t)a3;
- (void)setNumNotifications:(unint64_t)a3;
- (void)setSection:(id)a3;
- (void)setSectionPosition:(unint64_t)a3;
- (void)setSectionSize:(unint64_t)a3;
@end

@implementation ATXMissedNotificationRankingGroupEngagementMetric

- (id)metricName
{
  return @"com.apple.MissedNotificationBundle.Group.engagementSummary";
}

- (void)populateMetricsFromDigestGroup:(id)a3 mnbUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 bundleId];
  [(ATXMissedNotificationRankingGroupEngagementMetric *)self setBundleId:v8];

  [v7 priority];
  -[ATXMissedNotificationRankingGroupEngagementMetric setGroupScore:](self, "setGroupScore:");
  v9 = [v6 UUIDString];

  [(ATXMissedNotificationRankingGroupEngagementMetric *)self setMnbUUID:v9];
  v10 = [v7 digestEngagementTrackingMetrics];
  -[ATXMissedNotificationRankingGroupEngagementMetric setNumEngagementsInUpcoming:](self, "setNumEngagementsInUpcoming:", [v10 numEngagementsInUpcoming]);

  v11 = [v7 digestEngagementTrackingMetrics];
  -[ATXMissedNotificationRankingGroupEngagementMetric setNumEngagementsAfterShow:](self, "setNumEngagementsAfterShow:", [v11 numEngagementsInScheduled]);

  v12 = [v7 digestEngagementTrackingMetrics];
  -[ATXMissedNotificationRankingGroupEngagementMetric setNumEngagementsAfterExpiration:](self, "setNumEngagementsAfterExpiration:", [v12 numEngagementsAfterExpiration]);

  v13 = [v7 digestEngagementTrackingMetrics];
  -[ATXMissedNotificationRankingGroupEngagementMetric setNumExpansions:](self, "setNumExpansions:", [v13 numExpansions]);

  v14 = [v7 digestEngagementTrackingMetrics];
  v15 = [v14 sectionIdentifier];
  [(ATXMissedNotificationRankingGroupEngagementMetric *)self setSection:v15];

  v16 = [v7 digestEngagementTrackingMetrics];
  -[ATXMissedNotificationRankingGroupEngagementMetric setSectionPosition:](self, "setSectionPosition:", [v16 sectionPosition]);

  v17 = [v7 digestEngagementTrackingMetrics];
  -[ATXMissedNotificationRankingGroupEngagementMetric setSectionSize:](self, "setSectionSize:", [v17 sectionSize]);

  id v18 = [v7 rankedNotifications];

  -[ATXMissedNotificationRankingGroupEngagementMetric setNumNotifications:](self, "setNumNotifications:", [v18 count]);
}

- (id)coreAnalyticsDictionary
{
  v27[11] = *MEMORY[0x1E4F143B8];
  v26[0] = @"bundleId";
  uint64_t v3 = [(ATXMissedNotificationRankingGroupEngagementMetric *)self bundleId];
  v4 = (void *)v3;
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v20 = (void *)v3;
  v27[0] = v3;
  v26[1] = @"secureBundleId";
  v24 = [(ATXMissedNotificationRankingGroupEngagementMetric *)self bundleId];
  v25 = v4;
  if (v24)
  {
    v23 = [(ATXMissedNotificationRankingGroupEngagementMetric *)self bundleId];
    uint64_t v5 = +[ATXCoreAnalyticsFieldUtilities hashBoundString:](ATXCoreAnalyticsFieldUtilities, "hashBoundString:");
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
    v23 = (void *)v5;
  }
  v21 = (void *)v5;
  v27[1] = v5;
  v26[2] = @"groupScore";
  id v6 = NSNumber;
  [(ATXMissedNotificationRankingGroupEngagementMetric *)self groupScore];
  v22 = objc_msgSend(v6, "numberWithDouble:");
  v27[2] = v22;
  v26[3] = @"mnbUUID";
  uint64_t v7 = [(ATXMissedNotificationRankingGroupEngagementMetric *)self mnbUUID];
  v8 = (void *)v7;
  if (!v7)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v19 = (void *)v7;
  v27[3] = v7;
  v26[4] = @"numEngagementsAfterExpiration";
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXMissedNotificationRankingGroupEngagementMetric numEngagementsAfterExpiration](self, "numEngagementsAfterExpiration"));
  v27[4] = v9;
  v26[5] = @"numEngagementsAfterShow";
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXMissedNotificationRankingGroupEngagementMetric numEngagementsAfterShow](self, "numEngagementsAfterShow"));
  v27[5] = v10;
  v26[6] = @"numEngagementsInUpcoming";
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXMissedNotificationRankingGroupEngagementMetric numEngagementsInUpcoming](self, "numEngagementsInUpcoming"));
  v27[6] = v11;
  v26[7] = @"numExpansions";
  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXMissedNotificationRankingGroupEngagementMetric numExpansions](self, "numExpansions"));
  v27[7] = v12;
  v26[8] = @"section";
  v13 = [(ATXMissedNotificationRankingGroupEngagementMetric *)self section];
  v14 = v13;
  if (!v13)
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v27[8] = v14;
  v26[9] = @"sectionPosition";
  v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXMissedNotificationRankingGroupEngagementMetric sectionPosition](self, "sectionPosition"));
  v27[9] = v15;
  v26[10] = @"sectionSize";
  v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXMissedNotificationRankingGroupEngagementMetric sectionSize](self, "sectionSize"));
  v27[10] = v16;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:11];

  if (!v13) {
  if (!v8)
  }

  if (v24) {
  if (!v25)
  }

  return v17;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (double)groupScore
{
  return self->_groupScore;
}

- (void)setGroupScore:(double)a3
{
  self->_groupScore = a3;
}

- (NSString)mnbUUID
{
  return self->_mnbUUID;
}

- (void)setMnbUUID:(id)a3
{
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

- (NSString)section
{
  return self->_section;
}

- (void)setSection:(id)a3
{
}

- (unint64_t)sectionPosition
{
  return self->_sectionPosition;
}

- (void)setSectionPosition:(unint64_t)a3
{
  self->_sectionPosition = a3;
}

- (unint64_t)sectionSize
{
  return self->_sectionSize;
}

- (void)setSectionSize:(unint64_t)a3
{
  self->_sectionSize = a3;
}

- (unint64_t)numNotifications
{
  return self->_numNotifications;
}

- (void)setNumNotifications:(unint64_t)a3
{
  self->_numNotifications = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_section, 0);
  objc_storeStrong((id *)&self->_mnbUUID, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end