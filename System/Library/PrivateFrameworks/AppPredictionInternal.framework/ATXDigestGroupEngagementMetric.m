@interface ATXDigestGroupEngagementMetric
- (BOOL)hasImage;
- (NSString)bundleId;
- (NSString)digestUUID;
- (NSString)section;
- (double)groupScore;
- (id)coreAnalyticsDictionary;
- (id)metricName;
- (unint64_t)numEngagementsAfterExpiration;
- (unint64_t)numEngagementsInScheduled;
- (unint64_t)numEngagementsInUpcoming;
- (unint64_t)numExpansions;
- (unint64_t)numNotifications;
- (unint64_t)sectionPosition;
- (unint64_t)sectionSize;
- (void)populateMetricsFromDigestGroup:(id)a3 digestUUID:(id)a4;
- (void)setBundleId:(id)a3;
- (void)setDigestUUID:(id)a3;
- (void)setGroupScore:(double)a3;
- (void)setHasImage:(BOOL)a3;
- (void)setNumEngagementsAfterExpiration:(unint64_t)a3;
- (void)setNumEngagementsInScheduled:(unint64_t)a3;
- (void)setNumEngagementsInUpcoming:(unint64_t)a3;
- (void)setNumExpansions:(unint64_t)a3;
- (void)setNumNotifications:(unint64_t)a3;
- (void)setSection:(id)a3;
- (void)setSectionPosition:(unint64_t)a3;
- (void)setSectionSize:(unint64_t)a3;
@end

@implementation ATXDigestGroupEngagementMetric

- (id)metricName
{
  return @"com.apple.NotificationDigest.DigestGroup.engagementSummary";
}

- (void)populateMetricsFromDigestGroup:(id)a3 digestUUID:(id)a4
{
  id v6 = a3;
  v7 = [a4 UUIDString];
  [(ATXDigestGroupEngagementMetric *)self setDigestUUID:v7];

  v8 = [v6 bundleId];
  [(ATXDigestGroupEngagementMetric *)self setBundleId:v8];

  v9 = [v6 digestEngagementTrackingMetrics];
  v10 = [v9 sectionIdentifier];
  [(ATXDigestGroupEngagementMetric *)self setSection:v10];

  v11 = [v6 digestEngagementTrackingMetrics];
  -[ATXDigestGroupEngagementMetric setSectionPosition:](self, "setSectionPosition:", [v11 sectionPosition]);

  v12 = [v6 digestEngagementTrackingMetrics];
  -[ATXDigestGroupEngagementMetric setSectionSize:](self, "setSectionSize:", [v12 sectionSize]);

  v13 = [v6 rankedNotifications];
  -[ATXDigestGroupEngagementMetric setNumNotifications:](self, "setNumNotifications:", [v13 count]);

  -[ATXDigestGroupEngagementMetric setHasImage:](self, "setHasImage:", [v6 hasPreviewableAttachment]);
  [v6 priority];
  -[ATXDigestGroupEngagementMetric setGroupScore:](self, "setGroupScore:");
  v14 = [v6 digestEngagementTrackingMetrics];
  -[ATXDigestGroupEngagementMetric setNumEngagementsInUpcoming:](self, "setNumEngagementsInUpcoming:", [v14 numEngagementsInUpcoming]);

  v15 = [v6 digestEngagementTrackingMetrics];
  -[ATXDigestGroupEngagementMetric setNumEngagementsInScheduled:](self, "setNumEngagementsInScheduled:", [v15 numEngagementsInScheduled]);

  v16 = [v6 digestEngagementTrackingMetrics];
  -[ATXDigestGroupEngagementMetric setNumEngagementsAfterExpiration:](self, "setNumEngagementsAfterExpiration:", [v16 numEngagementsAfterExpiration]);

  id v17 = [v6 digestEngagementTrackingMetrics];

  -[ATXDigestGroupEngagementMetric setNumExpansions:](self, "setNumExpansions:", [v17 numExpansions]);
}

- (id)coreAnalyticsDictionary
{
  v32[13] = *MEMORY[0x1E4F143B8];
  v31[0] = @"digestUUID";
  uint64_t v3 = [(ATXDigestGroupEngagementMetric *)self digestUUID];
  v4 = (void *)v3;
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v24 = (void *)v3;
  v32[0] = v3;
  v31[1] = @"bundleId";
  uint64_t v5 = [(ATXDigestGroupEngagementMetric *)self bundleId];
  id v6 = (void *)v5;
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v30 = v4;
  v23 = (void *)v5;
  v32[1] = v5;
  v31[2] = @"secureBundleId";
  uint64_t v7 = [(ATXDigestGroupEngagementMetric *)self bundleId];
  if (v7)
  {
    v27 = [(ATXDigestGroupEngagementMetric *)self bundleId];
    uint64_t v8 = +[ATXCoreAnalyticsFieldUtilities hashBoundString:](ATXCoreAnalyticsFieldUtilities, "hashBoundString:");
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
    v27 = (void *)v8;
  }
  v28 = (void *)v7;
  v29 = v6;
  v25 = (void *)v8;
  v32[2] = v8;
  v31[3] = @"section";
  uint64_t v9 = [(ATXDigestGroupEngagementMetric *)self section];
  v10 = (void *)v9;
  if (!v9)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v22 = (void *)v9;
  v32[3] = v9;
  v31[4] = @"sectionPosition";
  v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXDigestGroupEngagementMetric sectionPosition](self, "sectionPosition"));
  v32[4] = v26;
  v31[5] = @"sectionSize";
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXDigestGroupEngagementMetric sectionSize](self, "sectionSize"));
  v32[5] = v11;
  v31[6] = @"numNotifications";
  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXDigestGroupEngagementMetric numNotifications](self, "numNotifications"));
  v32[6] = v12;
  v31[7] = @"hasImage";
  v13 = objc_msgSend(NSNumber, "numberWithBool:", -[ATXDigestGroupEngagementMetric hasImage](self, "hasImage"));
  v32[7] = v13;
  v31[8] = @"groupScore";
  v14 = NSNumber;
  [(ATXDigestGroupEngagementMetric *)self groupScore];
  v15 = objc_msgSend(v14, "numberWithDouble:");
  v32[8] = v15;
  v31[9] = @"numEngagementsInUpcoming";
  v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXDigestGroupEngagementMetric numEngagementsInUpcoming](self, "numEngagementsInUpcoming"));
  v32[9] = v16;
  v31[10] = @"numEngagementsInScheduled";
  id v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXDigestGroupEngagementMetric numEngagementsInScheduled](self, "numEngagementsInScheduled"));
  v32[10] = v17;
  v31[11] = @"numEngagementsAfterExpiration";
  v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXDigestGroupEngagementMetric numEngagementsAfterExpiration](self, "numEngagementsAfterExpiration"));
  v32[11] = v18;
  v31[12] = @"numExpansions";
  v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXDigestGroupEngagementMetric numExpansions](self, "numExpansions"));
  v32[12] = v19;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:13];

  if (!v10) {
  if (v28)
  }

  if (!v29) {
  if (!v30)
  }

  return v20;
}

- (NSString)digestUUID
{
  return self->_digestUUID;
}

- (void)setDigestUUID:(id)a3
{
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
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

- (BOOL)hasImage
{
  return self->_hasImage;
}

- (void)setHasImage:(BOOL)a3
{
  self->_hasImage = a3;
}

- (double)groupScore
{
  return self->_groupScore;
}

- (void)setGroupScore:(double)a3
{
  self->_groupScore = a3;
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
  objc_storeStrong((id *)&self->_section, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_digestUUID, 0);
}

@end